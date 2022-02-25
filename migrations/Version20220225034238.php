<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220225034238 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE localidad DROP FOREIGN KEY FK_4F68E010D94A7A3E');
        $this->addSql('DROP INDEX IDX_4F68E010D94A7A3E ON localidad');
        $this->addSql('ALTER TABLE localidad CHANGE padre_id_id padre_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE localidad ADD CONSTRAINT FK_4F68E010613CEC58 FOREIGN KEY (padre_id) REFERENCES localidad (id)');
        $this->addSql('CREATE INDEX IDX_4F68E010613CEC58 ON localidad (padre_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE localidad DROP FOREIGN KEY FK_4F68E010613CEC58');
        $this->addSql('DROP INDEX IDX_4F68E010613CEC58 ON localidad');
        $this->addSql('ALTER TABLE localidad CHANGE padre_id padre_id_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE localidad ADD CONSTRAINT FK_4F68E010D94A7A3E FOREIGN KEY (padre_id_id) REFERENCES localidad (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('CREATE INDEX IDX_4F68E010D94A7A3E ON localidad (padre_id_id)');
    }
}
