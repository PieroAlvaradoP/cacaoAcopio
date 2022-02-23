<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220223084452 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE socio ADD CONSTRAINT FK_38B653092BF25544 FOREIGN KEY (estado_socio_id) REFERENCES estado_socio (id)');
        $this->addSql('CREATE INDEX IDX_38B653092BF25544 ON socio (estado_socio_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE socio DROP FOREIGN KEY FK_38B653092BF25544');
        $this->addSql('DROP INDEX IDX_38B653092BF25544 ON socio');
    }
}
