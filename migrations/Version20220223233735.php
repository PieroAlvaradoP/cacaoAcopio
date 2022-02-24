<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220223233735 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE socio_periodo (id INT AUTO_INCREMENT NOT NULL, periodo_id INT NOT NULL, socio_id INT NOT NULL, INDEX IDX_57EECEBE9C3921AB (periodo_id), INDEX IDX_57EECEBEDA04E6A9 (socio_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE socio_periodo ADD CONSTRAINT FK_57EECEBE9C3921AB FOREIGN KEY (periodo_id) REFERENCES periodo (id)');
        $this->addSql('ALTER TABLE socio_periodo ADD CONSTRAINT FK_57EECEBEDA04E6A9 FOREIGN KEY (socio_id) REFERENCES socio (id)');
        $this->addSql('ALTER TABLE estimacion ADD socio_periodos_id INT NOT NULL');
        $this->addSql('ALTER TABLE estimacion ADD CONSTRAINT FK_1D9C1F0292A0549A FOREIGN KEY (socio_periodos_id) REFERENCES socio_periodo (id)');
        $this->addSql('CREATE INDEX IDX_1D9C1F0292A0549A ON estimacion (socio_periodos_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE estimacion DROP FOREIGN KEY FK_1D9C1F0292A0549A');
        $this->addSql('DROP TABLE socio_periodo');
        $this->addSql('DROP INDEX IDX_1D9C1F0292A0549A ON estimacion');
        $this->addSql('ALTER TABLE estimacion DROP socio_periodos_id');
    }
}
