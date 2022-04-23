<?php

declare(strict_types=1);

/*
 * This file is part of the PIDIA.
 * (c) Carlos Chininin <cio@pidia.pe>
 */

namespace Pidia\Apps\Demo\Manager;

use Pidia\Apps\Demo\Entity\Socio;
use Pidia\Apps\Demo\Entity\TipoAlmacen;
use Pidia\Apps\Demo\Entity\TipoDocumento;
use Pidia\Apps\Demo\Entity\TipoEmpresa;
use Pidia\Apps\Demo\Repository\BaseRepository;

final class TipoDocumentoManager extends BaseManager
{
    public function repositorio(): BaseRepository
    {
        return $this->manager()->getRepository(TipoDocumento::class);
    }
}