<?php

namespace Pidia\Apps\Demo\Repository;

use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\QueryBuilder;
use Doctrine\Persistence\ManagerRegistry;
use Pidia\Apps\Demo\Entity\BaseSocial;
use Pidia\Apps\Demo\Entity\Localidad;
use Pidia\Apps\Demo\Util\Paginator;

/**
 * @method BaseSocial|null find($id, $lockMode = null, $lockVersion = null)
 * @method BaseSocial|null findOneBy(array $criteria, array $orderBy = null)
 * @method BaseSocial[]    findAll()
 * @method BaseSocial[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class BaseSocialRepository extends ServiceEntityRepository implements BaseRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, BaseSocial::class);
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
        $queryBuilder = $this->createQueryBuilder('baseSocial')
            ->select(['baseSocial'])
            ->orderBy('baseSocial.nombre', 'ASC');
        Paginator::queryTexts($queryBuilder, $params, ['baseSocial.nombre']);

        return $queryBuilder;
    }


}
