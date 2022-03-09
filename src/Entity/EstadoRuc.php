<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping as ORM;
use Pidia\Apps\Demo\Repository\EstadoRucRepository;

#[ORM\Entity(repositoryClass: EstadoRucRepository::class)]
class EstadoRuc
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 15)]
    private $estadoRuc;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEstadoRuc(): ?string
    {
        return $this->estadoRuc;
    }

    public function setEstadoRuc(string $estadoRuc): self
    {
        $this->estadoRuc = $estadoRuc;

        return $this;
    }

    public function __toString(): string
    {
        // TODO: Implement __toString() method.
        return $this->getEstadoRuc();
    }
}
