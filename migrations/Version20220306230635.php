<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220306230635 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE acopio CHANGE tara tara VARCHAR(10) NOT NULL, CHANGE tara_total tara_total VARCHAR(10) NOT NULL, CHANGE peso_neto peso_neto VARCHAR(10) NOT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE acopio CHANGE tara tara NUMERIC(10, 2) NOT NULL, CHANGE tara_total tara_total NUMERIC(10, 2) NOT NULL, CHANGE peso_neto peso_neto NUMERIC(10, 2) NOT NULL');
    }
}
