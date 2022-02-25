<?php

namespace Pidia\Apps\Demo\Repository;

use Pidia\Apps\Demo\Entity\EstadoRuc;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method EstadoRuc|null find($id, $lockMode = null, $lockVersion = null)
 * @method EstadoRuc|null findOneBy(array $criteria, array $orderBy = null)
 * @method EstadoRuc[]    findAll()
 * @method EstadoRuc[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class EstadoRucRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, EstadoRuc::class);
    }

    // /**
    //  * @return EstadoRuc[] Returns an array of EstadoRuc objects
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
    public function findOneBySomeField($value): ?EstadoRuc
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
