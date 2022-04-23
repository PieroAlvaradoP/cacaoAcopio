<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\UnidadTransporteRepository;

#[ORM\Entity(repositoryClass: UnidadTransporteRepository::class)]
#[HasLifecycleCallbacks]
class UnidadTransporte
{
    use EntityTrait;

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\ManyToOne(targetEntity: EmpresaTransporte::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $empresaTransporte;

    #[ORM\ManyToOne(targetEntity: TipoVehiculo::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $tipoVehiculo;

    #[ORM\Column(type: 'integer')]
    private $numEjes;

    #[ORM\OneToMany(mappedBy: 'unidadTransporte', targetEntity: Placa::class, cascade: ['persist', 'remove'], orphanRemoval: true)]
    private $placas;


    public function __construct()
    {
        $this->placas = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmpresaTransporte(): ?EmpresaTransporte
    {
        return $this->empresaTransporte;
    }

    public function setEmpresaTransporte(?EmpresaTransporte $empresaTransporte): self
    {
        $this->empresaTransporte = $empresaTransporte;

        return $this;
    }

    public function getTipoVehiculo(): ?TipoVehiculo
    {
        return $this->tipoVehiculo;
    }

    public function setTipoVehiculo(?TipoVehiculo $tipoVehiculo): self
    {
        $this->tipoVehiculo = $tipoVehiculo;

        return $this;
    }

    public function getNumEjes(): ?int
    {
        return $this->numEjes;
    }

    public function setNumEjes(int $numEjes): self
    {
        $this->numEjes = $numEjes;

        return $this;
    }

    public function __toString(): string
    {
        // TODO: Implement __toString() method.
        return $this->getTipoVehiculo();
    }

    /**
     * @return Collection<int, Placa>
     */
    public function getPlacas(): Collection
    {
        return $this->placas;
    }

    public function addPlaca(Placa $placa): self
    {
        if (!$this->placas->contains($placa)) {
            $this->placas[] = $placa;
            $placa->setUnidadTransporte($this);
        }

        return $this;
    }

    public function removePlaca(Placa $placa): self
    {
        if ($this->placas->removeElement($placa)) {
            // set the owning side to null (unless already changed)
            if ($placa->getUnidadTransporte() === $this) {
                $placa->setUnidadTransporte(null);
            }
        }

        return $this;
    }
}
