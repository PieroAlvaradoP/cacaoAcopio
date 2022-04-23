<?php

namespace Pidia\Apps\Demo\Repository;

use Doctrine\ORM\Query\Expr\Base;
use Doctrine\ORM\QueryBuilder;
use Pidia\Apps\Demo\Entity\TipoAlmacen;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Pidia\Apps\Demo\Util\Paginator;

/**
 * @method TipoAlmacen|null find($id, $lockMode = null, $lockVersion = null)
 * @method TipoAlmacen|null findOneBy(array $criteria, array $orderBy = null)
 * @method TipoAlmacen[]    findAll()
 * @method TipoAlmacen[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TipoAlmacenRepository extends ServiceEntityRepository implements BaseRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TipoAlmacen::class);
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
        $queryBuilder = $this->createQueryBuilder('tipo_almacen')
            ->select(['tipo_almacen'])
            ->orderBy('tipo_almacen.tipoAlmacen', 'ASC');

        Paginator::queryTexts($queryBuilder, $params, ['tipo_almacen.tipoAlmacen']);

        return $queryBuilder;
    }
}
