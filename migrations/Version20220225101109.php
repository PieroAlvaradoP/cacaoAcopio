<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220225101109 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE parcela (id INT AUTO_INCREMENT NOT NULL, base_id INT NOT NULL, area_parcela_id INT DEFAULT NULL, socio_periodo_id INT NOT NULL, propietario_id INT DEFAULT NULL, config_id INT DEFAULT NULL, nombre VARCHAR(50) DEFAULT NULL, sector VARCHAR(50) DEFAULT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, activo TINYINT(1) NOT NULL, uuid BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', UNIQUE INDEX UNIQ_A5CC4446D17F50A6 (uuid), INDEX IDX_A5CC44466967DF41 (base_id), UNIQUE INDEX UNIQ_A5CC44469B61D2C7 (area_parcela_id), INDEX IDX_A5CC4446BB4A23C2 (socio_periodo_id), INDEX IDX_A5CC444653C8D32C (propietario_id), INDEX IDX_A5CC444624DB0683 (config_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE parcela ADD CONSTRAINT FK_A5CC44466967DF41 FOREIGN KEY (base_id) REFERENCES base_social (id)');
        $this->addSql('ALTER TABLE parcela ADD CONSTRAINT FK_A5CC44469B61D2C7 FOREIGN KEY (area_parcela_id) REFERENCES area_parcela (id)');
        $this->addSql('ALTER TABLE parcela ADD CONSTRAINT FK_A5CC4446BB4A23C2 FOREIGN KEY (socio_periodo_id) REFERENCES socio_periodo (id)');
        $this->addSql('ALTER TABLE parcela ADD CONSTRAINT FK_A5CC444653C8D32C FOREIGN KEY (propietario_id) REFERENCES usuario (id)');
        $this->addSql('ALTER TABLE parcela ADD CONSTRAINT FK_A5CC444624DB0683 FOREIGN KEY (config_id) REFERENCES config (id)');
        $this->addSql('ALTER TABLE coordenadas ADD parcela_id INT NOT NULL');
        $this->addSql('ALTER TABLE coordenadas ADD CONSTRAINT FK_979E70791491307D FOREIGN KEY (parcela_id) REFERENCES parcela (id)');
        $this->addSql('CREATE INDEX IDX_979E70791491307D ON coordenadas (parcela_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE coordenadas DROP FOREIGN KEY FK_979E70791491307D');
        $this->addSql('DROP TABLE parcela');
        $this->addSql('DROP INDEX IDX_979E70791491307D ON coordenadas');
        $this->addSql('ALTER TABLE coordenadas DROP parcela_id');
    }
}
