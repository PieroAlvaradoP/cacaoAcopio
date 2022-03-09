<?php

namespace Pidia\Apps\Demo\Repository;

use Doctrine\ORM\QueryBuilder;
use Pidia\Apps\Demo\Entity\Certificacion;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Pidia\Apps\Demo\Util\Paginator;

/**
 * @method Certificacion|null find($id, $lockMode = null, $lockVersion = null)
 * @method Certificacion|null findOneBy(array $criteria, array $orderBy = null)
 * @method Certificacion[]    findAll()
 * @method Certificacion[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CertificacionRepository extends ServiceEntityRepository implements BaseRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Certificacion::class);
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
        $queryBuilder = $this->createQueryBuilder('certificacion')
            ->select(['certificacion'])
            ->orderBy('certificacion.nombre', 'ASC')
        ;

        Paginator::queryTexts($queryBuilder, $params, ['certificacion.nombre']);

        return $queryBuilder;
    }
}
