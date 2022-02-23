<?php

namespace Pidia\Apps\Demo\Repository;

use Pidia\Apps\Demo\Entity\Estimacion;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Estimacion|null find($id, $lockMode = null, $lockVersion = null)
 * @method Estimacion|null findOneBy(array $criteria, array $orderBy = null)
 * @method Estimacion[]    findAll()
 * @method Estimacion[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class EstimacionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Estimacion::class);
    }

    // /**
    //  * @return Estimacion[] Returns an array of Estimacion objects
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
    public function findOneBySomeField($value): ?Estimacion
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
