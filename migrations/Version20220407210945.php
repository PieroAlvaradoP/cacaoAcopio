<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220407210945 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE documento_tramite (id INT AUTO_INCREMENT NOT NULL, tipo_documento_tramite_id INT NOT NULL, propietario_id INT DEFAULT NULL, config_id INT DEFAULT NULL, serie VARCHAR(4) NOT NULL, numero INT NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, activo TINYINT(1) NOT NULL, uuid BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', UNIQUE INDEX UNIQ_4A8AFFD3D17F50A6 (uuid), INDEX IDX_4A8AFFD3D9504328 (tipo_documento_tramite_id), INDEX IDX_4A8AFFD353C8D32C (propietario_id), INDEX IDX_4A8AFFD324DB0683 (config_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tipo_documento_tramite (id INT AUTO_INCREMENT NOT NULL, propietario_id INT DEFAULT NULL, config_id INT DEFAULT NULL, tipo_documento_tramite VARCHAR(100) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, activo TINYINT(1) NOT NULL, uuid BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', UNIQUE INDEX UNIQ_C04AEAD0D17F50A6 (uuid), INDEX IDX_C04AEAD053C8D32C (propietario_id), INDEX IDX_C04AEAD024DB0683 (config_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE documento_tramite ADD CONSTRAINT FK_4A8AFFD3D9504328 FOREIGN KEY (tipo_documento_tramite_id) REFERENCES tipo_documento_tramite (id)');
        $this->addSql('ALTER TABLE documento_tramite ADD CONSTRAINT FK_4A8AFFD353C8D32C FOREIGN KEY (propietario_id) REFERENCES usuario (id)');
        $this->addSql('ALTER TABLE documento_tramite ADD CONSTRAINT FK_4A8AFFD324DB0683 FOREIGN KEY (config_id) REFERENCES config (id)');
        $this->addSql('ALTER TABLE tipo_documento_tramite ADD CONSTRAINT FK_C04AEAD053C8D32C FOREIGN KEY (propietario_id) REFERENCES usuario (id)');
        $this->addSql('ALTER TABLE tipo_documento_tramite ADD CONSTRAINT FK_C04AEAD024DB0683 FOREIGN KEY (config_id) REFERENCES config (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE documento_tramite DROP FOREIGN KEY FK_4A8AFFD3D9504328');
        $this->addSql('DROP TABLE documento_tramite');
        $this->addSql('DROP TABLE tipo_documento_tramite');
    }
}
