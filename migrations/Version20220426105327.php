<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220426105327 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE guia_remision_producto_traslado (guia_remision_id INT NOT NULL, producto_traslado_id INT NOT NULL, INDEX IDX_82D483E3FA31FD80 (guia_remision_id), INDEX IDX_82D483E3732E6B82 (producto_traslado_id), PRIMARY KEY(guia_remision_id, producto_traslado_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE guia_remision_producto_traslado ADD CONSTRAINT FK_82D483E3FA31FD80 FOREIGN KEY (guia_remision_id) REFERENCES guia_remision (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE guia_remision_producto_traslado ADD CONSTRAINT FK_82D483E3732E6B82 FOREIGN KEY (producto_traslado_id) REFERENCES producto_traslado (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE guia_remision_producto_traslado');
    }
}
