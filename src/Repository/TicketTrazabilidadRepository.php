<?php

namespace Pidia\Apps\Demo\Repository;

use Pidia\Apps\Demo\Entity\TicketTrazabilidad;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method TicketTrazabilidad|null find($id, $lockMode = null, $lockVersion = null)
 * @method TicketTrazabilidad|null findOneBy(array $criteria, array $orderBy = null)
 * @method TicketTrazabilidad[]    findAll()
 * @method TicketTrazabilidad[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TicketTrazabilidadRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TicketTrazabilidad::class);
    }

    // /**
    //  * @return TicketTrazabilidad[] Returns an array of TicketTrazabilidad objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('t.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?TicketTrazabilidad
    {
        return $this->createQueryBuilder('t')
            ->andWhere('t.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
