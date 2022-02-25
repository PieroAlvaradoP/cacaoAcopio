<?php

namespace Pidia\Apps\Demo\Repository;

use Pidia\Apps\Demo\Entity\SocioPeriodo;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method SocioPeriodo|null find($id, $lockMode = null, $lockVersion = null)
 * @method SocioPeriodo|null findOneBy(array $criteria, array $orderBy = null)
 * @method SocioPeriodo[]    findAll()
 * @method SocioPeriodo[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SocioPeriodosRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, SocioPeriodo::class);
    }

    // /**
    //  * @return SocioPeriodo[] Returns an array of SocioPeriodo objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('s.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?SocioPeriodo
    {
        return $this->createQueryBuilder('s')
            ->andWhere('s.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
