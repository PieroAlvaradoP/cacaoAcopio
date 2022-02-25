<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220225032535 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE localidad (id INT AUTO_INCREMENT NOT NULL, propietario_id INT DEFAULT NULL, padre_id_id INT DEFAULT NULL, config_id INT DEFAULT NULL, nombre VARCHAR(100) NOT NULL, codigo VARCHAR(6) DEFAULT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, activo TINYINT(1) NOT NULL, uuid BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', UNIQUE INDEX UNIQ_4F68E010D17F50A6 (uuid), INDEX IDX_4F68E010D94A7A3E (padre_id_id), INDEX IDX_4F68E01053C8D32C (propietario_id), INDEX IDX_4F68E01024DB0683 (config_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE localidad ADD CONSTRAINT FK_4F68E010D94A7A3E FOREIGN KEY (padre_id_id) REFERENCES localidad (id)');
        $this->addSql('ALTER TABLE localidad ADD CONSTRAINT FK_4F68E01053C8D32C FOREIGN KEY (propietario_id) REFERENCES usuario (id)');
        $this->addSql('ALTER TABLE localidad ADD CONSTRAINT FK_4F68E01024DB0683 FOREIGN KEY (config_id) REFERENCES config (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE localidad DROP FOREIGN KEY FK_4F68E010D94A7A3E');
        $this->addSql('DROP TABLE localidad');
    }
}
