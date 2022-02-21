<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220221064857 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE socio ADD propietario_id INT DEFAULT NULL, ADD config_id INT DEFAULT NULL, ADD created_at DATETIME NOT NULL, ADD updated_at DATETIME NOT NULL, ADD activo TINYINT(1) NOT NULL, ADD uuid BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\'');
        $this->addSql('ALTER TABLE socio ADD CONSTRAINT FK_38B6530953C8D32C FOREIGN KEY (propietario_id) REFERENCES usuario (id)');
        $this->addSql('ALTER TABLE socio ADD CONSTRAINT FK_38B6530924DB0683 FOREIGN KEY (config_id) REFERENCES config (id)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_38B65309D17F50A6 ON socio (uuid)');
        $this->addSql('CREATE INDEX IDX_38B6530953C8D32C ON socio (propietario_id)');
        $this->addSql('CREATE INDEX IDX_38B6530924DB0683 ON socio (config_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE socio DROP FOREIGN KEY FK_38B6530953C8D32C');
        $this->addSql('ALTER TABLE socio DROP FOREIGN KEY FK_38B6530924DB0683');
        $this->addSql('DROP INDEX UNIQ_38B65309D17F50A6 ON socio');
        $this->addSql('DROP INDEX IDX_38B6530953C8D32C ON socio');
        $this->addSql('DROP INDEX IDX_38B6530924DB0683 ON socio');
        $this->addSql('ALTER TABLE socio DROP propietario_id, DROP config_id, DROP created_at, DROP updated_at, DROP activo, DROP uuid');
    }
}
