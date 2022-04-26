<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220426102420 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE producto_traslado (id INT AUTO_INCREMENT NOT NULL, producto_id INT NOT NULL, certificacion_id INT NOT NULL, propietario_id INT DEFAULT NULL, config_id INT DEFAULT NULL, cant_sacos VARCHAR(10) NOT NULL, peso_bruto VARCHAR(10) NOT NULL, tara VARCHAR(5) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, activo TINYINT(1) NOT NULL, uuid BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', UNIQUE INDEX UNIQ_87FF8DF2D17F50A6 (uuid), UNIQUE INDEX UNIQ_87FF8DF27645698E (producto_id), UNIQUE INDEX UNIQ_87FF8DF2693EA4CA (certificacion_id), INDEX IDX_87FF8DF253C8D32C (propietario_id), INDEX IDX_87FF8DF224DB0683 (config_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE producto_traslado ADD CONSTRAINT FK_87FF8DF27645698E FOREIGN KEY (producto_id) REFERENCES producto (id)');
        $this->addSql('ALTER TABLE producto_traslado ADD CONSTRAINT FK_87FF8DF2693EA4CA FOREIGN KEY (certificacion_id) REFERENCES certificacion (id)');
        $this->addSql('ALTER TABLE producto_traslado ADD CONSTRAINT FK_87FF8DF253C8D32C FOREIGN KEY (propietario_id) REFERENCES usuario (id)');
        $this->addSql('ALTER TABLE producto_traslado ADD CONSTRAINT FK_87FF8DF224DB0683 FOREIGN KEY (config_id) REFERENCES config (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE producto_traslado');
    }
}
