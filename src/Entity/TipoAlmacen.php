<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\TipoAlmacenRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TipoAlmacenRepository::class)]
#[HasLifecycleCallbacks]
class TipoAlmacen
{
    use EntityTrait;

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 30)]
    private $tipoAlmacen;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTipoAlmacen(): ?string
    {
        return $this->tipoAlmacen;
    }

    public function setTipoAlmacen(string $tipoAlmacen): self
    {
        $this->tipoAlmacen = $tipoAlmacen;

        return $this;
    }

    public function __toString(): string
    {
        // TODO: Implement __toString() method.
        return $this->getTipoAlmacen();
    }
}
