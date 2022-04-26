<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220425210302 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE guia_remision ADD motivo_traslado_id INT NOT NULL');
        $this->addSql('ALTER TABLE guia_remision ADD CONSTRAINT FK_191A1DC9400F940E FOREIGN KEY (motivo_traslado_id) REFERENCES motivo_traslado (id)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_191A1DC9400F940E ON guia_remision (motivo_traslado_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE guia_remision DROP FOREIGN KEY FK_191A1DC9400F940E');
        $this->addSql('DROP INDEX UNIQ_191A1DC9400F940E ON guia_remision');
        $this->addSql('ALTER TABLE guia_remision DROP motivo_traslado_id');
    }
}
