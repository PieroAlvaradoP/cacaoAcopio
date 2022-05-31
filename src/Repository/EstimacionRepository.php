<?php

namespace Pidia\Apps\Demo\Repository;

use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\NonUniqueResultException;
use Doctrine\Persistence\ManagerRegistry;
use Pidia\Apps\Demo\Entity\Estimacion;

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

    public function findEstimaciones(int $idSocio): ?array
    {
        try {
            return $this->createQueryBuilder('estimacion')
                ->select(['certificacion.nombre', 'estimacion.cantidad'])
                ->join('estimacion.certificacion', 'certificacion')
                ->join('estimacion.socioPeriodos', 'periodo')
                ->andWhere('periodo.socio=:idSocio')
                ->setParameter('idSocio', $idSocio)
                ->getQuery()
                ->getArrayResult();
        } catch (NonUniqueResultException) {
        }

        return null;
    }

    public function estimacionesByCertificacion(): ?array
    {
        try {
            return $this->createQueryBuilder('estimacion')
                ->select(['certificacion.nombre', 'estimacion.cantidad'])
                ->join('estimacion.certificacion', 'certificacion')
                ->groupBy('certificacion.id')
                ->getQuery()
                ->getArrayResult();
        } catch (NonUniqueResultException) {

        }

        return null;
    }
}
