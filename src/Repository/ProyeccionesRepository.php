<?php

namespace Pidia\Apps\Demo\Repository;

use Doctrine\ORM\QueryBuilder;
use Pidia\Apps\Demo\Entity\Proyecciones;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Pidia\Apps\Demo\Util\Paginator;

/**
 * @method Proyecciones|null find($id, $lockMode = null, $lockVersion = null)
 * @method Proyecciones|null findOneBy(array $criteria, array $orderBy = null)
 * @method Proyecciones[]    findAll()
 * @method Proyecciones[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProyeccionesRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Proyecciones::class);
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
        $queryBuilder = $this->createQueryBuilder('proyecciones')
            ->select('proyecciones')
            ->orderBy('proyecciones.id', 'ASC')
        ;

        Paginator::queryTexts($queryBuilder, $params, ['proyecciones.id']);

        return $queryBuilder;
    }
}
