<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220427005845 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE guia_remision_motivo_traslado (guia_remision_id INT NOT NULL, motivo_traslado_id INT NOT NULL, INDEX IDX_C09A7042FA31FD80 (guia_remision_id), INDEX IDX_C09A7042400F940E (motivo_traslado_id), PRIMARY KEY(guia_remision_id, motivo_traslado_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE guia_remision_motivo_traslado ADD CONSTRAINT FK_C09A7042FA31FD80 FOREIGN KEY (guia_remision_id) REFERENCES guia_remision (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE guia_remision_motivo_traslado ADD CONSTRAINT FK_C09A7042400F940E FOREIGN KEY (motivo_traslado_id) REFERENCES motivo_traslado (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE guia_remision DROP FOREIGN KEY FK_191A1DC9400F940E');
        $this->addSql('DROP INDEX UNIQ_191A1DC9400F940E ON guia_remision');
        $this->addSql('ALTER TABLE guia_remision DROP motivo_traslado_id');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE guia_remision_motivo_traslado');
        $this->addSql('ALTER TABLE guia_remision ADD motivo_traslado_id INT NOT NULL');
        $this->addSql('ALTER TABLE guia_remision ADD CONSTRAINT FK_191A1DC9400F940E FOREIGN KEY (motivo_traslado_id) REFERENCES motivo_traslado (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_191A1DC9400F940E ON guia_remision (motivo_traslado_id)');
    }
}
