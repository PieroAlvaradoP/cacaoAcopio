<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220407165219 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE conductor (id INT AUTO_INCREMENT NOT NULL, tipo_documento_id INT NOT NULL, localidad_id INT NOT NULL, propietario_id INT DEFAULT NULL, config_id INT DEFAULT NULL, licencia VARCHAR(10) NOT NULL, nombres VARCHAR(100) NOT NULL, apellido_paterno VARCHAR(100) NOT NULL, apellido_materno VARCHAR(100) DEFAULT NULL, num_documento VARCHAR(13) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, activo TINYINT(1) NOT NULL, uuid BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', UNIQUE INDEX UNIQ_D5F7F18AD17F50A6 (uuid), INDEX IDX_D5F7F18AF6939175 (tipo_documento_id), INDEX IDX_D5F7F18A67707C89 (localidad_id), INDEX IDX_D5F7F18A53C8D32C (propietario_id), INDEX IDX_D5F7F18A24DB0683 (config_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE conductor ADD CONSTRAINT FK_D5F7F18AF6939175 FOREIGN KEY (tipo_documento_id) REFERENCES tipo_documento (id)');
        $this->addSql('ALTER TABLE conductor ADD CONSTRAINT FK_D5F7F18A67707C89 FOREIGN KEY (localidad_id) REFERENCES localidad (id)');
        $this->addSql('ALTER TABLE conductor ADD CONSTRAINT FK_D5F7F18A53C8D32C FOREIGN KEY (propietario_id) REFERENCES usuario (id)');
        $this->addSql('ALTER TABLE conductor ADD CONSTRAINT FK_D5F7F18A24DB0683 FOREIGN KEY (config_id) REFERENCES config (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE conductor');
    }
}
