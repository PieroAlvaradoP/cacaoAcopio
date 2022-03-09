<?php

namespace Pidia\Apps\Demo\Repository;

use Pidia\Apps\Demo\Entity\TipoAlmacen;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method TipoAlmacen|null find($id, $lockMode = null, $lockVersion = null)
 * @method TipoAlmacen|null findOneBy(array $criteria, array $orderBy = null)
 * @method TipoAlmacen[]    findAll()
 * @method TipoAlmacen[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TipoAlmacenRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TipoAlmacen::class);
    }

    // /**
    //  * @return TipoAlmacen[] Returns an array of TipoAlmacen objects
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
    public function findOneBySomeField($value): ?TipoAlmacen
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
