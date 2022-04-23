<?php

namespace Pidia\Apps\Demo\Repository;

use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Doctrine\ORM\QueryBuilder;
use Doctrine\Persistence\ManagerRegistry;
use Pidia\Apps\Demo\Entity\EmpresaTransporte;
use Pidia\Apps\Demo\Util\Paginator;

/**
 * @method EmpresaTransporte|null find($id, $lockMode = null, $lockVersion = null)
 * @method EmpresaTransporte|null findOneBy(array $criteria, array $orderBy = null)
 * @method EmpresaTransporte[]    findAll()
 * @method EmpresaTransporte[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class EmpresaTransporteRepository extends ServiceEntityRepository implements BaseRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, EmpresaTransporte::class);
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
        $queryBuilder = $this->createQueryBuilder('empresaTransporte')
            ->select(['empresaTransporte'])
            ->join('empresaTransporte.config', 'config')
            ->orderBy('empresaTransporte.nombre', 'ASC')
        ;

        Paginator::queryTexts($queryBuilder, $params, ['empresaTransporte.nombre']);

        return $queryBuilder;
    }

}
