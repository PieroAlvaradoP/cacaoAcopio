<?php

declare(strict_types=1);

/*
 * This file is part of the PIDIA.
 * (c) Carlos Chininin <cio@pidia.pe>
 */

namespace Pidia\Apps\Demo\Manager;

use Pidia\Apps\Demo\Entity\Socio;
use Pidia\Apps\Demo\Entity\TipoVehiculo;
use Pidia\Apps\Demo\Entity\UnidadTransporte;
use Pidia\Apps\Demo\Repository\BaseRepository;

final class UnidadTransporteManager extends BaseManager
{
    public function repositorio(): BaseRepository
    {
        return $this->manager()->getRepository(UnidadTransporte::class);
    }
}