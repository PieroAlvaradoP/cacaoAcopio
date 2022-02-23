<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220221205828 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE empresa (id INT AUTO_INCREMENT NOT NULL, propietario_id INT DEFAULT NULL, config_id INT DEFAULT NULL, nombre VARCHAR(50) NOT NULL, ruc VARCHAR(11) DEFAULT NULL, direccion VARCHAR(50) DEFAULT NULL, email VARCHAR(50) DEFAULT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, activo TINYINT(1) NOT NULL, uuid BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', UNIQUE INDEX UNIQ_B8D75A50D17F50A6 (uuid), INDEX IDX_B8D75A5053C8D32C (propietario_id), INDEX IDX_B8D75A5024DB0683 (config_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE lote (id INT AUTO_INCREMENT NOT NULL, propietario_id INT DEFAULT NULL, config_id INT DEFAULT NULL, periodo VARCHAR(20) NOT NULL, nro_lote VARCHAR(20) NOT NULL, peso_neto NUMERIC(10, 2) NOT NULL, acopios VARCHAR(20) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, activo TINYINT(1) NOT NULL, uuid BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', UNIQUE INDEX UNIQ_65B4329FD17F50A6 (uuid), INDEX IDX_65B4329F53C8D32C (propietario_id), INDEX IDX_65B4329F24DB0683 (config_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE ticket_trazabilidad (id INT AUTO_INCREMENT NOT NULL, nro_control VARCHAR(20) NOT NULL, peso_neto NUMERIC(10, 2) NOT NULL, cant_sacos VARCHAR(3) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE empresa ADD CONSTRAINT FK_B8D75A5053C8D32C FOREIGN KEY (propietario_id) REFERENCES usuario (id)');
        $this->addSql('ALTER TABLE empresa ADD CONSTRAINT FK_B8D75A5024DB0683 FOREIGN KEY (config_id) REFERENCES config (id)');
        $this->addSql('ALTER TABLE lote ADD CONSTRAINT FK_65B4329F53C8D32C FOREIGN KEY (propietario_id) REFERENCES usuario (id)');
        $this->addSql('ALTER TABLE lote ADD CONSTRAINT FK_65B4329F24DB0683 FOREIGN KEY (config_id) REFERENCES config (id)');
        $this->addSql('ALTER TABLE almacen ADD CONSTRAINT FK_D5B2D250521E1991 FOREIGN KEY (empresa_id) REFERENCES empresa (id)');
        $this->addSql('ALTER TABLE almacen ADD CONSTRAINT FK_D5B2D25053C8D32C FOREIGN KEY (propietario_id) REFERENCES usuario (id)');
        $this->addSql('ALTER TABLE almacen ADD CONSTRAINT FK_D5B2D25024DB0683 FOREIGN KEY (config_id) REFERENCES config (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE almacen DROP FOREIGN KEY FK_D5B2D250521E1991');
        $this->addSql('DROP TABLE empresa');
        $this->addSql('DROP TABLE lote');
        $this->addSql('DROP TABLE ticket_trazabilidad');
        $this->addSql('ALTER TABLE almacen DROP FOREIGN KEY FK_D5B2D25053C8D32C');
        $this->addSql('ALTER TABLE almacen DROP FOREIGN KEY FK_D5B2D25024DB0683');
    }
}
