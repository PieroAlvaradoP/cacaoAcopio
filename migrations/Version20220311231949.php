<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220311231949 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE acopio (id INT AUTO_INCREMENT NOT NULL, periodo_id INT NOT NULL, socio_id INT NOT NULL, certificacion_id INT NOT NULL, almacen_id INT NOT NULL, unidad_peso_bruto_id INT NOT NULL, cantidad_unidad_id INT NOT NULL, tara_total_unidad_id INT NOT NULL, peso_neto_unidad_id INT NOT NULL, propietario_id INT DEFAULT NULL, config_id INT DEFAULT NULL, fecha DATE NOT NULL, ticket VARCHAR(6) NOT NULL, peso_bruto NUMERIC(10, 2) NOT NULL, cantidad VARCHAR(6) NOT NULL, tara VARCHAR(10) NOT NULL, tara_total VARCHAR(10) NOT NULL, peso_neto VARCHAR(10) NOT NULL, observaciones VARCHAR(50) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, activo TINYINT(1) NOT NULL, uuid BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', UNIQUE INDEX UNIQ_F27E53E3D17F50A6 (uuid), INDEX IDX_F27E53E39C3921AB (periodo_id), INDEX IDX_F27E53E3DA04E6A9 (socio_id), INDEX IDX_F27E53E3693EA4CA (certificacion_id), INDEX IDX_F27E53E39C9C9E68 (almacen_id), INDEX IDX_F27E53E381BEBA7B (unidad_peso_bruto_id), INDEX IDX_F27E53E387DA088A (cantidad_unidad_id), INDEX IDX_F27E53E3BAD2C4ED (tara_total_unidad_id), INDEX IDX_F27E53E3788E7DBD (peso_neto_unidad_id), INDEX IDX_F27E53E353C8D32C (propietario_id), INDEX IDX_F27E53E324DB0683 (config_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE acopio ADD CONSTRAINT FK_F27E53E39C3921AB FOREIGN KEY (periodo_id) REFERENCES periodo (id)');
        $this->addSql('ALTER TABLE acopio ADD CONSTRAINT FK_F27E53E3DA04E6A9 FOREIGN KEY (socio_id) REFERENCES socio (id)');
        $this->addSql('ALTER TABLE acopio ADD CONSTRAINT FK_F27E53E3693EA4CA FOREIGN KEY (certificacion_id) REFERENCES certificacion (id)');
        $this->addSql('ALTER TABLE acopio ADD CONSTRAINT FK_F27E53E39C9C9E68 FOREIGN KEY (almacen_id) REFERENCES almacen (id)');
        $this->addSql('ALTER TABLE acopio ADD CONSTRAINT FK_F27E53E381BEBA7B FOREIGN KEY (unidad_peso_bruto_id) REFERENCES unidad (id)');
        $this->addSql('ALTER TABLE acopio ADD CONSTRAINT FK_F27E53E387DA088A FOREIGN KEY (cantidad_unidad_id) REFERENCES unidad (id)');
        $this->addSql('ALTER TABLE acopio ADD CONSTRAINT FK_F27E53E3BAD2C4ED FOREIGN KEY (tara_total_unidad_id) REFERENCES unidad (id)');
        $this->addSql('ALTER TABLE acopio ADD CONSTRAINT FK_F27E53E3788E7DBD FOREIGN KEY (peso_neto_unidad_id) REFERENCES unidad (id)');
        $this->addSql('ALTER TABLE acopio ADD CONSTRAINT FK_F27E53E353C8D32C FOREIGN KEY (propietario_id) REFERENCES usuario (id)');
        $this->addSql('ALTER TABLE acopio ADD CONSTRAINT FK_F27E53E324DB0683 FOREIGN KEY (config_id) REFERENCES config (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE acopio');
    }
}
