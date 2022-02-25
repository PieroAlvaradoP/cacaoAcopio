<?php

namespace Pidia\Apps\Demo\Entity;

use Doctrine\ORM\Mapping as ORM;
use Pidia\Apps\Demo\Repository\TipoEmpresaRepository;

#[ORM\Entity(repositoryClass: TipoEmpresaRepository::class)]
class TipoEmpresa
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 20)]
    private $tipoEmpresa;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTipoEmpresa(): ?string
    {
        return $this->tipoEmpresa;
    }

    public function setTipoEmpresa(string $tipoEmpresa): self
    {
        $this->tipoEmpresa = $tipoEmpresa;

        return $this;
    }

    public function __toString(): string
    {
        // TODO: Implement __toString() method.
        return $this->getTipoEmpresa();
    }
}
