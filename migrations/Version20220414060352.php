<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220414060352 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE guia_remision (id INT AUTO_INCREMENT NOT NULL, periodo_id INT NOT NULL, almacen_origen_id INT NOT NULL, almacen_destino_id INT NOT NULL, unidad_transporte_id INT NOT NULL, conductor_id INT NOT NULL, fecha_traslado DATE NOT NULL, INDEX IDX_191A1DC99C3921AB (periodo_id), INDEX IDX_191A1DC930032D1F (almacen_origen_id), INDEX IDX_191A1DC98C48E45E (almacen_destino_id), INDEX IDX_191A1DC9E35A899 (unidad_transporte_id), INDEX IDX_191A1DC9A49DECF0 (conductor_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE guia_remision ADD CONSTRAINT FK_191A1DC99C3921AB FOREIGN KEY (periodo_id) REFERENCES periodo (id)');
        $this->addSql('ALTER TABLE guia_remision ADD CONSTRAINT FK_191A1DC930032D1F FOREIGN KEY (almacen_origen_id) REFERENCES almacen (id)');
        $this->addSql('ALTER TABLE guia_remision ADD CONSTRAINT FK_191A1DC98C48E45E FOREIGN KEY (almacen_destino_id) REFERENCES almacen (id)');
        $this->addSql('ALTER TABLE guia_remision ADD CONSTRAINT FK_191A1DC9E35A899 FOREIGN KEY (unidad_transporte_id) REFERENCES unidad_transporte (id)');
        $this->addSql('ALTER TABLE guia_remision ADD CONSTRAINT FK_191A1DC9A49DECF0 FOREIGN KEY (conductor_id) REFERENCES conductor (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE guia_remision');
    }
}
