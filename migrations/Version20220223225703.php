<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220223225703 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE estado_periodo (id INT AUTO_INCREMENT NOT NULL, estado VARCHAR(20) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE periodo ADD estado_id INT NOT NULL, DROP estado');
        $this->addSql('ALTER TABLE periodo ADD CONSTRAINT FK_7316C4ED9F5A440B FOREIGN KEY (estado_id) REFERENCES estado_periodo (id)');
        $this->addSql('CREATE INDEX IDX_7316C4ED9F5A440B ON periodo (estado_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE periodo DROP FOREIGN KEY FK_7316C4ED9F5A440B');
        $this->addSql('DROP TABLE estado_periodo');
        $this->addSql('DROP INDEX IDX_7316C4ED9F5A440B ON periodo');
        $this->addSql('ALTER TABLE periodo ADD estado VARCHAR(20) NOT NULL, DROP estado_id');
    }
}
