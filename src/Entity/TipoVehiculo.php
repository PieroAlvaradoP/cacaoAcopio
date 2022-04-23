<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use JetBrains\PhpStorm\Pure;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\TipoVehiculoRepository;

#[ORM\Entity(repositoryClass: TipoVehiculoRepository::class)]
#[HasLifecycleCallbacks]
class TipoVehiculo
{
    use EntityTrait;
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 100)]
    private $tipoVehiculo;

    #[ORM\Column(type: 'string', length: 7)]
    private $siglas;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTipoVehiculo(): ?string
    {
        return $this->tipoVehiculo;
    }

    public function setTipoVehiculo(string $tipoVehiculo): self
    {
        $this->tipoVehiculo = $tipoVehiculo;

        return $this;
    }

    public function getSiglas(): ?string
    {
        return $this->siglas;
    }

    public function setSiglas(string $siglas): self
    {
        $this->siglas = $siglas;

        return $this;
    }

    public function __toString(): string
    {
        // TODO: Implement __toString() method.
        return $this->getSiglas();
    }
}
