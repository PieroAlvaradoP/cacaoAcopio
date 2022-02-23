<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220223165740 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE certificacion (id INT AUTO_INCREMENT NOT NULL, padre_id INT DEFAULT NULL, propietario_id INT DEFAULT NULL, config_id INT DEFAULT NULL, nombre VARCHAR(50) NOT NULL, alias VARCHAR(50) NOT NULL, descripcion LONGTEXT DEFAULT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, activo TINYINT(1) NOT NULL, uuid BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', UNIQUE INDEX UNIQ_A1F20253D17F50A6 (uuid), INDEX IDX_A1F20253613CEC58 (padre_id), INDEX IDX_A1F2025353C8D32C (propietario_id), INDEX IDX_A1F2025324DB0683 (config_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE certificacion ADD CONSTRAINT FK_A1F20253613CEC58 FOREIGN KEY (padre_id) REFERENCES certificacion (id)');
        $this->addSql('ALTER TABLE certificacion ADD CONSTRAINT FK_A1F2025353C8D32C FOREIGN KEY (propietario_id) REFERENCES usuario (id)');
        $this->addSql('ALTER TABLE certificacion ADD CONSTRAINT FK_A1F2025324DB0683 FOREIGN KEY (config_id) REFERENCES config (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE certificacion DROP FOREIGN KEY FK_A1F20253613CEC58');
        $this->addSql('DROP TABLE certificacion');
    }
}
