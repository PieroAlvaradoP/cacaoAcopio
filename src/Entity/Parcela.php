<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\ParcelaRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ParcelaRepository::class)]
#[HasLifecycleCallbacks]
class Parcela
{
    use EntityTrait;

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 50, nullable: true)]
    private $nombre;

    #[ORM\ManyToOne(targetEntity: BaseSocial::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $base;

    #[ORM\Column(type: 'string', length: 50, nullable: true)]
    private $sector;

    #[ORM\OneToOne(targetEntity: AreaParcela::class, cascade: ['persist', 'remove'])]
    private $areaParcela;

    #[ORM\OneToMany(mappedBy: 'parcela', targetEntity: Coordenadas::class, cascade: ['persist', 'remove'], orphanRemoval: true)]
    private $coordenadas;

    #[ORM\ManyToOne(targetEntity: SocioPeriodo::class, inversedBy: 'parcela')]
    #[ORM\JoinColumn(nullable: false)]
    private $socioPeriodo;

    public function __construct()
    {
        $this->coordenadas = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombre(): ?string
    {
        return $this->nombre;
    }

    public function setNombre(?string $nombre): self
    {
        $this->nombre = $nombre;

        return $this;
    }

    public function getBase(): ?BaseSocial
    {
        return $this->base;
    }

    public function setBase(?BaseSocial $base): self
    {
        $this->base = $base;

        return $this;
    }

    public function getSector(): ?string
    {
        return $this->sector;
    }

    public function setSector(?string $sector): self
    {
        $this->sector = $sector;

        return $this;
    }

    public function getAreaParcela(): ?AreaParcela
    {
        return $this->areaParcela;
    }

    public function setAreaParcela(?AreaParcela $areaParcela): self
    {
        $this->areaParcela = $areaParcela;

        return $this;
    }

    /**
     * @return Collection<int, Coordenadas>
     */
    public function getCoordenadas(): Collection
    {
        return $this->coordenadas;
    }

    public function addCoordenada(Coordenadas $coordenada): self
    {
        if (!$this->coordenadas->contains($coordenada)) {
            $this->coordenadas[] = $coordenada;
            $coordenada->setParcela($this);
        }

        return $this;
    }

    public function removeCoordenada(Coordenadas $coordenada): self
    {
        if ($this->coordenadas->removeElement($coordenada)) {
            // set the owning side to null (unless already changed)
            if ($coordenada->getParcela() === $this) {
                $coordenada->setParcela(null);
            }
        }

        return $this;
    }

    public function __toString(): string
    {
        // TODO: Implement __toString() method.
        return $this->getNombre();
    }

    public function getSocioPeriodo(): ?SocioPeriodo
    {
        return $this->socioPeriodo;
    }

    public function setSocioPeriodo(?SocioPeriodo $socioPeriodo): self
    {
        $this->socioPeriodo = $socioPeriodo;

        return $this;
    }
}
