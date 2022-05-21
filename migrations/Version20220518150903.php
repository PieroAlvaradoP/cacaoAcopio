<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220518150903 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE guia_remision ADD doc_tramite_serie_id INT NOT NULL, ADD numero_guia VARCHAR(6) NOT NULL');
        $this->addSql('ALTER TABLE guia_remision ADD CONSTRAINT FK_191A1DC9E7337726 FOREIGN KEY (doc_tramite_serie_id) REFERENCES documento_tramite (id)');
        $this->addSql('CREATE INDEX IDX_191A1DC9E7337726 ON guia_remision (doc_tramite_serie_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE guia_remision DROP FOREIGN KEY FK_191A1DC9E7337726');
        $this->addSql('DROP INDEX IDX_191A1DC9E7337726 ON guia_remision');
        $this->addSql('ALTER TABLE guia_remision DROP doc_tramite_serie_id, DROP numero_guia');
    }
}
