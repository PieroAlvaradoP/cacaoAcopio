<?php

namespace Pidia\Apps\Demo\Repository;

use Doctrine\ORM\QueryBuilder;
use Pidia\Apps\Demo\Entity\Conductor;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Doctrine\Persistence\ManagerRegistry;
use Pidia\Apps\Demo\Util\Paginator;

/**
 * @method Conductor|null find($id, $lockMode = null, $lockVersion = null)
 * @method Conductor|null findOneBy(array $criteria, array $orderBy = null)
 * @method Conductor[]    findAll()
 * @method Conductor[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ConductorRepository extends ServiceEntityRepository implements BaseRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Conductor::class);
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
        $queryBuilder = $this->createQueryBuilder('conductor')
            ->select(['conductor'])
            ->orderBy('conductor.apellidoPaterno', 'ASC')
        ;

        Paginator::queryTexts($queryBuilder, $params, ['certificacion.nombre']);

        return $queryBuilder;
    }
}
