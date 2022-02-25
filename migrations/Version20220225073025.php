<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220225073025 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE area_parcela (id INT AUTO_INCREMENT NOT NULL, total NUMERIC(5, 2) NOT NULL, produccion NUMERIC(5, 2) DEFAULT NULL, crecimiento NUMERIC(5, 2) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE base_social (id INT AUTO_INCREMENT NOT NULL, localidad_id INT NOT NULL, almacen_acopio_id INT NOT NULL, nombre VARCHAR(50) NOT NULL, descripcion LONGTEXT DEFAULT NULL, INDEX IDX_190179EE67707C89 (localidad_id), INDEX IDX_190179EE489F4A45 (almacen_acopio_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE coordenadas (id INT AUTO_INCREMENT NOT NULL, latitud VARCHAR(30) DEFAULT NULL, longitud VARCHAR(30) DEFAULT NULL, altitud VARCHAR(30) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE base_social ADD CONSTRAINT FK_190179EE67707C89 FOREIGN KEY (localidad_id) REFERENCES localidad (id)');
        $this->addSql('ALTER TABLE base_social ADD CONSTRAINT FK_190179EE489F4A45 FOREIGN KEY (almacen_acopio_id) REFERENCES almacen (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE area_parcela');
        $this->addSql('DROP TABLE base_social');
        $this->addSql('DROP TABLE coordenadas');
    }
}
