<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220426113213 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE producto_traslado DROP FOREIGN KEY FK_87FF8DF27645698E');
        $this->addSql('DROP INDEX UNIQ_87FF8DF27645698E ON producto_traslado');
        $this->addSql('ALTER TABLE producto_traslado CHANGE producto_id producto_t_id INT NOT NULL');
        $this->addSql('ALTER TABLE producto_traslado ADD CONSTRAINT FK_87FF8DF2A41AF81F FOREIGN KEY (producto_t_id) REFERENCES producto (id)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_87FF8DF2A41AF81F ON producto_traslado (producto_t_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE producto_traslado DROP FOREIGN KEY FK_87FF8DF2A41AF81F');
        $this->addSql('DROP INDEX UNIQ_87FF8DF2A41AF81F ON producto_traslado');
        $this->addSql('ALTER TABLE producto_traslado CHANGE producto_t_id producto_id INT NOT NULL');
        $this->addSql('ALTER TABLE producto_traslado ADD CONSTRAINT FK_87FF8DF27645698E FOREIGN KEY (producto_id) REFERENCES producto (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_87FF8DF27645698E ON producto_traslado (producto_id)');
    }
}
