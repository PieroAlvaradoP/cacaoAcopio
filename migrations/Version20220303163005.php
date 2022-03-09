<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220303163005 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE estimacion DROP FOREIGN KEY FK_1D9C1F02DA04E6A9');
        $this->addSql('DROP INDEX IDX_1D9C1F02DA04E6A9 ON estimacion');
        $this->addSql('ALTER TABLE estimacion DROP socio_id');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE estimacion ADD socio_id INT NOT NULL');
        $this->addSql('ALTER TABLE estimacion ADD CONSTRAINT FK_1D9C1F02DA04E6A9 FOREIGN KEY (socio_id) REFERENCES socio (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE INDEX IDX_1D9C1F02DA04E6A9 ON estimacion (socio_id)');
    }
}
