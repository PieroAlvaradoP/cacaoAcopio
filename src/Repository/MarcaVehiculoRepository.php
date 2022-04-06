<?php

namespace Pidia\Apps\Demo\Repository;

use Doctrine\ORM\QueryBuilder;
use Pidia\Apps\Demo\Entity\MarcaVehiculo;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Doctrine\Persistence\ManagerRegistry;
use Pidia\Apps\Demo\Util\Paginator;

/**
 * @method MarcaVehiculo|null find($id, $lockMode = null, $lockVersion = null)
 * @method MarcaVehiculo|null findOneBy(array $criteria, array $orderBy = null)
 * @method MarcaVehiculo[]    findAll()
 * @method MarcaVehiculo[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MarcaVehiculoRepository extends ServiceEntityRepository implements BaseRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, MarcaVehiculo::class);
    }

    public function findLatest(array $params): Paginator
    {
        $queryBuilder = $this->filterQuery($params);

        return Paginator::create($queryBuilder, $params);
    }

    public function filter(array $params, bool $inArray = true): array
    {
        $queryBuilder = $this->filterQuery($params);

        if (true === $inArray) {
            return $queryBuilder->getQuery()->getArrayResult();
        }

        return $queryBuilder->getQuery()->getResult();
    }

    private function filterQuery(array $params): QueryBuilder
    {
        $queryBuilder = $this->createQueryBuilder('marcaVehiculo')
            ->select('marcaVehiculo')
            ->orderBy('marcaVehiculo.nombre');

        Paginator::queryTexts($queryBuilder, $params, ['marcaVehiculo.nombre']);

        return $queryBuilder;
    }
}
