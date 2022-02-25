<?php

namespace Pidia\Apps\Demo\Repository;

use Pidia\Apps\Demo\Entity\AreaParcela;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method AreaParcela|null find($id, $lockMode = null, $lockVersion = null)
 * @method AreaParcela|null findOneBy(array $criteria, array $orderBy = null)
 * @method AreaParcela[]    findAll()
 * @method AreaParcela[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AreaParcelaRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, AreaParcela::class);
    }

    // /**
    //  * @return AreaParcela[] Returns an array of AreaParcela objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('a.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?AreaParcela
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
