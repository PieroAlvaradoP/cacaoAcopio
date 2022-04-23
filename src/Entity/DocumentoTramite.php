<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping\HasLifecycleCallbacks;
use Pidia\Apps\Demo\Entity\Traits\EntityTrait;
use Pidia\Apps\Demo\Repository\DocumentoTramiteRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: DocumentoTramiteRepository::class)]
#[HasLifecycleCallbacks]
class DocumentoTramite
{
    use EntityTrait;
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\ManyToOne(targetEntity: TipoDocumentoTramite::class)]
    #[ORM\JoinColumn(nullable: false)]
    private $tipoDocumentoTramite;

    #[ORM\Column(type: 'string', length: 4)]
    private $serie;

    #[ORM\Column(type: 'integer')]
    private $numero;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTipoDocumentoTramite(): ?TipoDocumentoTramite
    {
        return $this->tipoDocumentoTramite;
    }

    public function setTipoDocumentoTramite(?TipoDocumentoTramite $tipoDocumentoTramite): self
    {
        $this->tipoDocumentoTramite = $tipoDocumentoTramite;

        return $this;
    }

    public function getSerie(): ?string
    {
        return $this->serie;
    }

    public function setSerie(string $serie): self
    {
        $this->serie = $serie;

        return $this;
    }

    public function getNumero(): ?int
    {
        return $this->numero;
    }

    public function setNumero(int $numero): self
    {
        $this->numero = $numero;

        return $this;
    }
    
}
