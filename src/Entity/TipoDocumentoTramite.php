<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\TipoDocumentoTramiteRepository;

#[ORM\Entity(repositoryClass: TipoDocumentoTramiteRepository::class)]
#[HasLifecycleCallbacks]
class TipoDocumentoTramite
{
    use EntityTrait;
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 100)]
    private $tipoDocumentoTramite;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTipoDocumentoTramite(): ?string
    {
        return $this->tipoDocumentoTramite;
    }

    public function setTipoDocumentoTramite(string $tipoDocumentoTramite): self
    {
        $this->tipoDocumentoTramite = $tipoDocumentoTramite;

        return $this;
    }

    public function __toString(): string
    {
        // TODO: Implement __toString() method.
        return $this->getTipoDocumentoTramite();
    }
}
