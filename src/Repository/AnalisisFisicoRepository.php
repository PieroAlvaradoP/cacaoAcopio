<?php

namespace Pidia\Apps\Demo\Repository;

use Doctrine\ORM\QueryBuilder;
use Pidia\Apps\Demo\Entity\AnalisisFisico;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Pidia\Apps\Demo\Util\Paginator;

/**
 * @method AnalisisFisico|null find($id, $lockMode = null, $lockVersion = null)
 * @method AnalisisFisico|null findOneBy(array $criteria, array $orderBy = null)
 * @method AnalisisFisico[]    findAll()
 * @method AnalisisFisico[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AnalisisFisicoRepository extends ServiceEntityRepository implements BaseRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AnalisisFisico::class);
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
        $queryBuilder = $this->createQueryBuilder('analisisFisico')
            ->select(['analisisFisico'])
            ->join('analisisFisico.config', 'config')
            ->orderBy('analisisFisico.ticket', 'ASC')
        ;

        Paginator::queryTexts($queryBuilder, $params, ['analisisFisico.ticket']);

        return $queryBuilder;
    }
}
