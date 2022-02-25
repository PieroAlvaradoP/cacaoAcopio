<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220223065227 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE periodo_producto DROP FOREIGN KEY FK_3556BA9F7645698E');
        $this->addSql('DROP TABLE periodo_producto');
        $this->addSql('DROP TABLE producto');
        $this->addSql('ALTER TABLE periodo ADD productos VARCHAR(50) DEFAULT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE periodo_producto (periodo_id INT NOT NULL, producto_id INT NOT NULL, INDEX IDX_3556BA9F7645698E (producto_id), INDEX IDX_3556BA9F9C3921AB (periodo_id), PRIMARY KEY(periodo_id, producto_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('CREATE TABLE producto (id INT AUTO_INCREMENT NOT NULL, propietario_id INT DEFAULT NULL, config_id INT DEFAULT NULL, nombre VARCHAR(20) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, alias VARCHAR(15) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, activo TINYINT(1) NOT NULL, uuid BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', INDEX IDX_A7BB061524DB0683 (config_id), INDEX IDX_A7BB061553C8D32C (propietario_id), UNIQUE INDEX UNIQ_A7BB0615D17F50A6 (uuid), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE periodo_producto ADD CONSTRAINT FK_3556BA9F7645698E FOREIGN KEY (producto_id) REFERENCES producto (id) ON UPDATE NO ACTION ON DELETE CASCADE');
        $this->addSql('ALTER TABLE periodo_producto ADD CONSTRAINT FK_3556BA9F9C3921AB FOREIGN KEY (periodo_id) REFERENCES periodo (id) ON UPDATE NO ACTION ON DELETE CASCADE');
        $this->addSql('ALTER TABLE producto ADD CONSTRAINT FK_A7BB061524DB0683 FOREIGN KEY (config_id) REFERENCES config (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE producto ADD CONSTRAINT FK_A7BB061553C8D32C FOREIGN KEY (propietario_id) REFERENCES usuario (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
        $this->addSql('ALTER TABLE periodo DROP productos');
    }
}