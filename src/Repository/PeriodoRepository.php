<?php

namespace Pidia\Apps\Demo\Repository;

use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\QueryBuilder;
use Doctrine\Persistence\ManagerRegistry;
use Pidia\Apps\Demo\Entity\Periodo;
use Pidia\Apps\Demo\Util\Paginator;

/**
 * @method Periodo|null find($id, $lockMode = null, $lockVersion = null)
 * @method Periodo|null findOneBy(array $criteria, array $orderBy = null)
 * @method Periodo[]    findAll()
 * @method Periodo[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PeriodoRepository extends ServiceEntityRepository implements BaseRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Periodo::class);
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
        $queryBuilder = $this->createQueryBuilder('periodo')
            ->select(['periodo'])
            ->join('periodo.config', 'config')
            ->orderBy('periodo.nombre', 'ASC')
        ;

        Paginator::queryTexts($queryBuilder, $params, ['periodo.nombre']);

        return $queryBuilder;
    }
}
