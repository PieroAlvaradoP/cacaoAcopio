<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping as ORM;
use Pidia\Apps\Demo\Repository\PlacaRepository;

#[ORM\Entity(repositoryClass: PlacaRepository::class)]
class Placa
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 6)]
    private $numPlaca;

    #[ORM\ManyToOne(targetEntity: MarcaVehiculo::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $marca;

    #[ORM\Column(type: 'string', length: 9)]
    private $constanciaInscripcion;

    #[ORM\Column(type: 'string', length: 4)]
    private $yearFabricacion;

    #[ORM\ManyToOne(targetEntity: UnidadTransporte::class, inversedBy: 'placas')]
    #[ORM\JoinColumn(nullable: false)]
    private $unidadTransporte;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNumPlaca(): ?string
    {
        return $this->numPlaca;
    }

    public function setNumPlaca(string $numPlaca): self
    {
        $this->numPlaca = $numPlaca;

        return $this;
    }

    public function getMarca(): ?MarcaVehiculo
    {
        return $this->marca;
    }

    public function setMarca(?MarcaVehiculo $marca): self
    {
        $this->marca = $marca;

        return $this;
    }

    public function getConstanciaInscripcion(): ?string
    {
        return $this->constanciaInscripcion;
    }

    public function setConstanciaInscripcion(string $constanciaInscripcion): self
    {
        $this->constanciaInscripcion = $constanciaInscripcion;

        return $this;
    }

    public function getyearFabricacion(): ?string
    {
        return $this->yearFabricacion;
    }

    public function setyearFabricacion(string $yearFabricacion): self
    {
        $this->yearFabricacion = $yearFabricacion;

        return $this;
    }

    public function getUnidadTransporte(): ?UnidadTransporte
    {
        return $this->unidadTransporte;
    }

    public function setUnidadTransporte(?UnidadTransporte $unidadTransporte): self
    {
        $this->unidadTransporte = $unidadTransporte;

        return $this;
    }
}
