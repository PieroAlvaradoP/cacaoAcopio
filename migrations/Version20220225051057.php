<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220225051057 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE saldo (id INT AUTO_INCREMENT NOT NULL, periodo_id INT NOT NULL, producto_id INT NOT NULL, unidad_id INT NOT NULL, almacen_id INT NOT NULL, saldo NUMERIC(6, 2) NOT NULL, INDEX IDX_669B1D4A9C3921AB (periodo_id), INDEX IDX_669B1D4A7645698E (producto_id), INDEX IDX_669B1D4A9D01464C (unidad_id), INDEX IDX_669B1D4A9C9C9E68 (almacen_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE saldo ADD CONSTRAINT FK_669B1D4A9C3921AB FOREIGN KEY (periodo_id) REFERENCES periodo (id)');
        $this->addSql('ALTER TABLE saldo ADD CONSTRAINT FK_669B1D4A7645698E FOREIGN KEY (producto_id) REFERENCES producto (id)');
        $this->addSql('ALTER TABLE saldo ADD CONSTRAINT FK_669B1D4A9D01464C FOREIGN KEY (unidad_id) REFERENCES unidad (id)');
        $this->addSql('ALTER TABLE saldo ADD CONSTRAINT FK_669B1D4A9C9C9E68 FOREIGN KEY (almacen_id) REFERENCES almacen (id)');
        $this->addSql('ALTER TABLE almacen ADD ubicacion_id INT NOT NULL');
        $this->addSql('ALTER TABLE almacen ADD CONSTRAINT FK_D5B2D25057E759E8 FOREIGN KEY (ubicacion_id) REFERENCES localidad (id)');
        $this->addSql('CREATE INDEX IDX_D5B2D25057E759E8 ON almacen (ubicacion_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE saldo');
        $this->addSql('ALTER TABLE almacen DROP FOREIGN KEY FK_D5B2D25057E759E8');
        $this->addSql('DROP INDEX IDX_D5B2D25057E759E8 ON almacen');
        $this->addSql('ALTER TABLE almacen DROP ubicacion_id');
    }
}
