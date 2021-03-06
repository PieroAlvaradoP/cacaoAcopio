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

    /**
     * @throws \Doctrine\ORM\NonUniqueResultException
     * @throws \Doctrine\ORM\NoResultException
     */
    public function getNombrePadre(int $id): Localidad
    {
        $queryBuilder = $this->createQueryBuilder('baseSocial')
            ->select('padreLocalidad.nombre as nombre')
            ->join('baseSocial.localidad', 'localidad')
            ->join('localidad.padre', 'padreLocalidad')
            ->where('padreLocalidad.id=:id')
            ->setParameter('id', $id);

        return $queryBuilder->getQuery()->getOneOrNullResult();

    }


    // /**
    //  * @return BaseSocial[] Returns an array of BaseSocial objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('b')
            ->andWhere('b.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('b.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?BaseSocial
    {
        return $this->createQueryBuilder('b')
            ->andWhere('b.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
