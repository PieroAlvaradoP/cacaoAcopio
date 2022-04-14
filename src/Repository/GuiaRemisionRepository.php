<?php

namespace Pidia\Apps\Demo\Repository;

use Doctrine\ORM\QueryBuilder;
use Pidia\Apps\Demo\Controller\BaseController;
use Pidia\Apps\Demo\Entity\GuiaRemision;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Doctrine\Persistence\ManagerRegistry;
use Pidia\Apps\Demo\Util\Paginator;

/**
 * @method GuiaRemision|null find($id, $lockMode = null, $lockVersion = null)
 * @method GuiaRemision|null findOneBy(array $criteria, array $orderBy = null)
 * @method GuiaRemision[]    findAll()
 * @method GuiaRemision[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class GuiaRemisionRepository extends ServiceEntityRepository implements BaseRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, GuiaRemision::class);
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
        $queryBuilder = $this->createQueryBuilder('guia_remision')
            ->orderBy('guia_remision.id', 'ASC')
        ;

        Paginator::queryTexts($queryBuilder, $params, ['guia_remision.id']);

        return $queryBuilder;
    }
}
