<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220225082021 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE base_social ADD propietario_id INT DEFAULT NULL, ADD config_id INT DEFAULT NULL, ADD created_at DATETIME NOT NULL, ADD updated_at DATETIME NOT NULL, ADD activo TINYINT(1) NOT NULL, ADD uuid BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\'');
        $this->addSql('ALTER TABLE base_social ADD CONSTRAINT FK_190179EE53C8D32C FOREIGN KEY (propietario_id) REFERENCES usuario (id)');
        $this->addSql('ALTER TABLE base_social ADD CONSTRAINT FK_190179EE24DB0683 FOREIGN KEY (config_id) REFERENCES config (id)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_190179EED17F50A6 ON base_social (uuid)');
        $this->addSql('CREATE INDEX IDX_190179EE53C8D32C ON base_social (propietario_id)');
        $this->addSql('CREATE INDEX IDX_190179EE24DB0683 ON base_social (config_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE base_social DROP FOREIGN KEY FK_190179EE53C8D32C');
        $this->addSql('ALTER TABLE base_social DROP FOREIGN KEY FK_190179EE24DB0683');
        $this->addSql('DROP INDEX UNIQ_190179EED17F50A6 ON base_social');
        $this->addSql('DROP INDEX IDX_190179EE53C8D32C ON base_social');
        $this->addSql('DROP INDEX IDX_190179EE24DB0683 ON base_social');
        $this->addSql('ALTER TABLE base_social DROP propietario_id, DROP config_id, DROP created_at, DROP updated_at, DROP activo, DROP uuid');
    }
}
