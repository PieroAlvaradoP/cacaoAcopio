<?php

namespace Pidia\Apps\Demo\Repository;

use Doctrine\ORM\QueryBuilder;
use Pidia\Apps\Demo\Entity\TipoVehiculo;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Doctrine\Persistence\ManagerRegistry;
use Pidia\Apps\Demo\Util\Paginator;

/**
 * @method TipoVehiculo|null find($id, $lockMode = null, $lockVersion = null)
 * @method TipoVehiculo|null findOneBy(array $criteria, array $orderBy = null)
 * @method TipoVehiculo[]    findAll()
 * @method TipoVehiculo[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TipoVehiculoRepository extends ServiceEntityRepository implements BaseRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TipoVehiculo::class);
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
        $queryBuilder = $this->createQueryBuilder('tipo_vehiculo')
            ->select('tipo_vehiculo')
            ->orderBy('tipo_vehiculo.tipoVehiculo');

        Paginator::queryTexts($queryBuilder, $params, ['tipo_vehiculo.tipoVehiculo']);

        return $queryBuilder;
    }

}
