<?php

namespace Pidia\Apps\Demo\Entity;

use Pidia\Apps\Demo\Repository\ProyeccionesRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ProyeccionesRepository::class)]
class Proyecciones
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 50)]
    private $periodo;

    #[ORM\Column(type: 'string', length: 50)]
    private $empresa;

    #[ORM\Column(type: 'string', length: 20)]
    private $tipo_cacao;

    #[ORM\Column(type: 'decimal', precision: 5, scale: 2)]
    private $quintales_proyectados;

    #[ORM\ManyToOne(targetEntity: Socio::class, inversedBy: 'proyecciones')]
    #[ORM\JoinColumn(nullable: false)]
    private $socio;

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

    public function getEmpresa(): ?string
    {
        return $this->empresa;
    }

    public function setEmpresa(string $empresa): self
    {
        $this->empresa = $empresa;

        return $this;
    }

    public function getTipoCacao(): ?string
    {
        return $this->tipo_cacao;
    }

    public function setTipoCacao(string $tipo_cacao): self
    {
        $this->tipo_cacao = $tipo_cacao;

        return $this;
    }

    public function getQuintalesProyectados(): ?string
    {
        return $this->quintales_proyectados;
    }

    public function setQuintalesProyectados(string $quintales_proyectados): self
    {
        $this->quintales_proyectados = $quintales_proyectados;

        return $this;
    }

    public function getSocio(): ?Socio
    {
        return $this->socio;
    }

    public function setSocio(?Socio $socio): self
    {
        $this->socio = $socio;

        return $this;
    }
}
