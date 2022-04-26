<?php

namespace Pidia\Apps\Demo\Repository;

use Doctrine\ORM\QueryBuilder;
use Pidia\Apps\Demo\Entity\MotivoTraslado;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Pidia\Apps\Demo\Util\Paginator;

/**
 * @method MotivoTraslado|null find($id, $lockMode = null, $lockVersion = null)
 * @method MotivoTraslado|null findOneBy(array $criteria, array $orderBy = null)
 * @method MotivoTraslado[]    findAll()
 * @method MotivoTraslado[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class MotivoTrasladoRepository extends ServiceEntityRepository implements BaseRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, MotivoTraslado::class);
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
        $queryBuilder = $this->createQueryBuilder('motivo_traslado')
            ->orderBy('motivo_traslado.id', 'ASC')
        ;

        Paginator::queryTexts($queryBuilder, $params, ['motivo_traslado.id']);

        return $queryBuilder;
    }
}
