<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\LoteRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: LoteRepository::class)]
#[HasLifecycleCallbacks]
class Lote
{
    use EntityTrait;
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 20)]
    private $periodo;

    #[ORM\Column(type: 'string', length: 20)]
    private $nroLote;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2)]
    private $pesoNeto;

    #[ORM\Column(type: 'string', length: 20)]
    private $acopios;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPeriodo(): ?string
    {
        return $this->periodo;
    }

    public function setPeriodo(string $periodo): self
    {
        $this->periodo = $periodo;

        return $this;
    }

    public function getNroLote(): ?string
    {
        return $this->nroLote;
    }

    public function setNroLote(string $nroLote): self
    {
        $this->nroLote = $nroLote;

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

    public function getAcopios(): ?string
    {
        return $this->acopios;
    }

    public function setAcopios(string $acopios): self
    {
        $this->acopios = $acopios;

        return $this;
    }
}
