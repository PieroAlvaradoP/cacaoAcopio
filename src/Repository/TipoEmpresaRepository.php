<?php

namespace Pidia\Apps\Demo\Repository;

use Doctrine\ORM\QueryBuilder;
use Pidia\Apps\Demo\Entity\TipoEmpresa;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Pidia\Apps\Demo\Util\Paginator;

/**
 * @method TipoEmpresa|null find($id, $lockMode = null, $lockVersion = null)
 * @method TipoEmpresa|null findOneBy(array $criteria, array $orderBy = null)
 * @method TipoEmpresa[]    findAll()
 * @method TipoEmpresa[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TipoEmpresaRepository extends ServiceEntityRepository implements BaseRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, TipoEmpresa::class);
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
        $queryBuilder = $this->createQueryBuilder('tipo_empresa')
            ->select(['tipo_empresa'])
            ->orderBy('tipo_empresa.tipoEmpresa', 'ASC');

        Paginator::queryTexts($queryBuilder, $params, ['tipo_empresa.tipoEmpresa']);

        return $queryBuilder;
    }
}
