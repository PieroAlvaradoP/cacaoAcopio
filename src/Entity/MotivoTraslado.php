<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\MotivoTrasladoRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: MotivoTrasladoRepository::class)]
#[HasLifecycleCallbacks]
class MotivoTraslado
{
    use EntityTrait;
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 50)]
    private $nombreMotivo;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombreMotivo(): ?string
    {
        return $this->nombreMotivo;
    }

    public function setNombreMotivo(string $nombreMotivo): self
    {
        $this->nombreMotivo = $nombreMotivo;

        return $this;
    }

    public function __toString(): string
    {
        return $this->getNombreMotivo();
    }
}
