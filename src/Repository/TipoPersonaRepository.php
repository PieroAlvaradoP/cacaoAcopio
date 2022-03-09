<?php

namespace Pidia\Apps\Demo\Repository;

use Pidia\Apps\Demo\Entity\TipoPersona;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method TipoPersona|null find($id, $lockMode = null, $lockVersion = null)
 * @method TipoPersona|null findOneBy(array $criteria, array $orderBy = null)
 * @method TipoPersona[]    findAll()
 * @method TipoPersona[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TipoPersonaRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TipoPersona::class);
    }

    // /**
    //  * @return TipoPersona[] Returns an array of TipoPersona objects
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
    public function findOneBySomeField($value): ?TipoPersona
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
