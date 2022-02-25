<?php

namespace Pidia\Apps\Demo\Entity;

use Pidia\Apps\Demo\Repository\CoordenadasRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CoordenadasRepository::class)]
class Coordenadas
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 30, nullable: true)]
    private $latitud;

    #[ORM\Column(type: 'string', length: 30, nullable: true)]
    private $longitud;

    #[ORM\Column(type: 'string', length: 30, nullable: true)]
    private $altitud;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLatitud(): ?string
    {
        return $this->latitud;
    }

    public function setLatitud(?string $latitud): self
    {
        $this->latitud = $latitud;

        return $this;
    }

    public function getLongitud(): ?string
    {
        return $this->longitud;
    }

    public function setLongitud(?string $longitud): self
    {
        $this->longitud = $longitud;

        return $this;
    }

    public function getAltitud(): ?string
    {
        return $this->altitud;
    }

    public function setAltitud(?string $altitud): self
    {
        $this->altitud = $altitud;

        return $this;
    }
}
