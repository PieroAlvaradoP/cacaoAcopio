<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\UnidadRepository;

#[ORM\Entity(repositoryClass: UnidadRepository::class)]
#[HasLifecycleCallbacks]
class Unidad
{
    use EntityTrait;

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 20)]
    private $unidad;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUnidad(): ?string
    {
        return $this->unidad;
    }

    public function setUnidad(string $unidad): self
    {
        $this->unidad = $unidad;

        return $this;
    }

    public function __toString(): string
    {
        // TODO: Implement __toString() method.
        return $this->getUnidad();
    }
}
