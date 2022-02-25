<?php

namespace Pidia\Apps\Demo\Entity;

use Pidia\Apps\Demo\Repository\EstadoSocioRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: EstadoSocioRepository::class)]
class EstadoSocio
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 20)]
    private $estadoSocio;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEstadoSocio(): ?string
    {
        return $this->estadoSocio;
    }

    public function setEstadoSocio(string $estadoSocio): self
    {
        $this->estadoSocio = $estadoSocio;

        return $this;
    }

    public function __toString(): string
    {
        // TODO: Implement __toString() method.
        return $this->getEstadoSocio();
    }

}
