<?php

namespace Pidia\Apps\Demo\Repository;

use Doctrine\ORM\QueryBuilder;
use Pidia\Apps\Demo\Entity\TipoDocumentoTramite;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Doctrine\Persistence\ManagerRegistry;
use Pidia\Apps\Demo\Util\Paginator;

/**
 * @method TipoDocumentoTramite|null find($id, $lockMode = null, $lockVersion = null)
 * @method TipoDocumentoTramite|null findOneBy(array $criteria, array $orderBy = null)
 * @method TipoDocumentoTramite[]    findAll()
 * @method TipoDocumentoTramite[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TipoDocumentoTramiteRepository extends ServiceEntityRepository implements BaseRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TipoDocumentoTramite::class);
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
        $queryBuilder = $this->createQueryBuilder('tipo_documento_tramite')
            ->select(['tipo_documento_tramite'])
            ->orderBy('tipo_documento_tramite.tipoDocumentoTramite', 'ASC');

        Paginator::queryTexts($queryBuilder, $params, ['tipo_documento_tramite.tipoDocumentoTramite']);

        return $queryBuilder;
    }
}
