<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220221061225 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE proyecciones (id INT AUTO_INCREMENT NOT NULL, socio_id INT NOT NULL, periodo VARCHAR(50) NOT NULL, empresa VARCHAR(50) NOT NULL, tipo_cacao VARCHAR(20) NOT NULL, quintales_proyectados NUMERIC(5, 2) NOT NULL, INDEX IDX_4DA0A8AEDA04E6A9 (socio_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE socio (id INT AUTO_INCREMENT NOT NULL, nombre VARCHAR(50) NOT NULL, dni_ruc VARCHAR(11) NOT NULL, lugar VARCHAR(30) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE proyecciones ADD CONSTRAINT FK_4DA0A8AEDA04E6A9 FOREIGN KEY (socio_id) REFERENCES socio (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE proyecciones DROP FOREIGN KEY FK_4DA0A8AEDA04E6A9');
        $this->addSql('DROP TABLE proyecciones');
        $this->addSql('DROP TABLE socio');
    }
}
