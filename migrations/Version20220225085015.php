<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220225085015 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE analisis_fisico ADD certificacion_id INT NOT NULL');
        $this->addSql('ALTER TABLE analisis_fisico ADD CONSTRAINT FK_43D689E8693EA4CA FOREIGN KEY (certificacion_id) REFERENCES certificacion (id)');
        $this->addSql('CREATE INDEX IDX_43D689E8693EA4CA ON analisis_fisico (certificacion_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE analisis_fisico DROP FOREIGN KEY FK_43D689E8693EA4CA');
        $this->addSql('DROP INDEX IDX_43D689E8693EA4CA ON analisis_fisico');
        $this->addSql('ALTER TABLE analisis_fisico DROP certificacion_id');
    }
}
