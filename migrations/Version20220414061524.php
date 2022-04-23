<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220414061524 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE guia_remision ADD propietario_id INT DEFAULT NULL, ADD config_id INT DEFAULT NULL, ADD created_at DATETIME NOT NULL, ADD updated_at DATETIME NOT NULL, ADD activo TINYINT(1) NOT NULL, ADD uuid BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\'');
        $this->addSql('ALTER TABLE guia_remision ADD CONSTRAINT FK_191A1DC953C8D32C FOREIGN KEY (propietario_id) REFERENCES usuario (id)');
        $this->addSql('ALTER TABLE guia_remision ADD CONSTRAINT FK_191A1DC924DB0683 FOREIGN KEY (config_id) REFERENCES config (id)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_191A1DC9D17F50A6 ON guia_remision (uuid)');
        $this->addSql('CREATE INDEX IDX_191A1DC953C8D32C ON guia_remision (propietario_id)');
        $this->addSql('CREATE INDEX IDX_191A1DC924DB0683 ON guia_remision (config_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE guia_remision DROP FOREIGN KEY FK_191A1DC953C8D32C');
        $this->addSql('ALTER TABLE guia_remision DROP FOREIGN KEY FK_191A1DC924DB0683');
        $this->addSql('DROP INDEX UNIQ_191A1DC9D17F50A6 ON guia_remision');
        $this->addSql('DROP INDEX IDX_191A1DC953C8D32C ON guia_remision');
        $this->addSql('DROP INDEX IDX_191A1DC924DB0683 ON guia_remision');
        $this->addSql('ALTER TABLE guia_remision DROP propietario_id, DROP config_id, DROP created_at, DROP updated_at, DROP activo, DROP uuid');
    }
}
