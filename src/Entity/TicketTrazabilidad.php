<?php

namespace Pidia\Apps\Demo\Entity;

use Pidia\Apps\Demo\Repository\TicketTrazabilidadRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TicketTrazabilidadRepository::class)]
class TicketTrazabilidad
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 20)]
    private $nroControl;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2)]
    private $pesoNeto;

    #[ORM\Column(type: 'string', length: 3)]
    private $cantSacos;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNroControl(): ?string
    {
        return $this->nroControl;
    }

    public function setNroControl(string $nroControl): self
    {
        $this->nroControl = $nroControl;

        return $this;
    }

    public function getPesoNeto(): ?string
    {
        return $this->pesoNeto;
    }

    public function setPesoNeto(string $pesoNeto): self
    {
        $this->pesoNeto = $pesoNeto;

        return $this;
    }

    public function getCantSacos(): ?string
    {
        return $this->cantSacos;
    }

    public function setCantSacos(string $cantSacos): self
    {
        $this->cantSacos = $cantSacos;

        return $this;
    }
}
