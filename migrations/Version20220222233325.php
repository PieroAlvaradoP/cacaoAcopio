<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220222233325 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE periodo ADD propietario_id INT DEFAULT NULL, ADD config_id INT DEFAULT NULL, ADD created_at DATETIME NOT NULL, ADD updated_at DATETIME NOT NULL, ADD activo TINYINT(1) NOT NULL, ADD uuid BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\'');
        $this->addSql('ALTER TABLE periodo ADD CONSTRAINT FK_7316C4ED53C8D32C FOREIGN KEY (propietario_id) REFERENCES usuario (id)');
        $this->addSql('ALTER TABLE periodo ADD CONSTRAINT FK_7316C4ED24DB0683 FOREIGN KEY (config_id) REFERENCES config (id)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_7316C4EDD17F50A6 ON periodo (uuid)');
        $this->addSql('CREATE INDEX IDX_7316C4ED53C8D32C ON periodo (propietario_id)');
        $this->addSql('CREATE INDEX IDX_7316C4ED24DB0683 ON periodo (config_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE periodo DROP FOREIGN KEY FK_7316C4ED53C8D32C');
        $this->addSql('ALTER TABLE periodo DROP FOREIGN KEY FK_7316C4ED24DB0683');
        $this->addSql('DROP INDEX UNIQ_7316C4EDD17F50A6 ON periodo');
        $this->addSql('DROP INDEX IDX_7316C4ED53C8D32C ON periodo');
        $this->addSql('DROP INDEX IDX_7316C4ED24DB0683 ON periodo');
        $this->addSql('ALTER TABLE periodo DROP propietario_id, DROP config_id, DROP created_at, DROP updated_at, DROP activo, DROP uuid');
    }
}
