<?php

namespace Pidia\Apps\Demo\Repository;

use Pidia\Apps\Demo\Entity\EstadoPeriodo;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method EstadoPeriodo|null find($id, $lockMode = null, $lockVersion = null)
 * @method EstadoPeriodo|null findOneBy(array $criteria, array $orderBy = null)
 * @method EstadoPeriodo[]    findAll()
 * @method EstadoPeriodo[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class EstadoPeriodoRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, EstadoPeriodo::class);
    }

    // /**
    //  * @return EstadoPeriodo[] Returns an array of EstadoPeriodo objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('e')
            ->andWhere('e.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('e.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?EstadoPeriodo
    {
        return $this->createQueryBuilder('e')
            ->andWhere('e.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
