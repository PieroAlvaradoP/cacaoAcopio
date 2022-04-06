<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220406053415 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE placa (id INT AUTO_INCREMENT NOT NULL, marca_id INT NOT NULL, unidad_transporte_id INT NOT NULL, num_placa VARCHAR(6) NOT NULL, constancia_inscripcion VARCHAR(9) NOT NULL, year_fabricacion VARCHAR(4) NOT NULL, INDEX IDX_737097D481EF0041 (marca_id), INDEX IDX_737097D4E35A899 (unidad_transporte_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE placa ADD CONSTRAINT FK_737097D481EF0041 FOREIGN KEY (marca_id) REFERENCES marca_vehiculo (id)');
        $this->addSql('ALTER TABLE placa ADD CONSTRAINT FK_737097D4E35A899 FOREIGN KEY (unidad_transporte_id) REFERENCES unidad_transporte (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE placa');
    }
}
