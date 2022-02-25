<?php

namespace Pidia\Apps\Demo\Entity;

use Pidia\Apps\Demo\Repository\TipoAlmacenRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TipoAlmacenRepository::class)]
class TipoAlmacen
{
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
