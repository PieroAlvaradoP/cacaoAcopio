<?php

namespace Pidia\Apps\Demo\Repository;

use Doctrine\ORM\NonUniqueResultException;
use Doctrine\ORM\QueryBuilder;
use Pidia\Apps\Demo\Entity\DocumentoTramite;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Doctrine\Persistence\ManagerRegistry;
use Pidia\Apps\Demo\Util\Paginator;

/**
 * @method DocumentoTramite|null find($id, $lockMode = null, $lockVersion = null)
 * @method DocumentoTramite|null findOneBy(array $criteria, array $orderBy = null)
 * @method DocumentoTramite[]    findAll()
 * @method DocumentoTramite[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class DocumentoTramiteRepository extends ServiceEntityRepository implements BaseRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, DocumentoTramite::class);
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
        $queryBuilder = $this->createQueryBuilder('documento_tramite')
            ->orderBy('documento_tramite.serie', 'ASC')
        ;

        Paginator::queryTexts($queryBuilder, $params, ['documento_tramite.serie']);

        return $queryBuilder;
    }

    public function findNumero(string $serie): ?array
    {
        try {
            return $this->createQueryBuilder('documento_tramite')
                ->select('documento_tramite.numero')
                ->andWhere('documento_tramite.serie=:serie')
                ->setParameter('serie', $serie)
                ->getQuery()
                ->getArrayResult();

        } catch (NonUniqueResultException) {
        }

        return null;
    }

}
