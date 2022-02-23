<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220223010532 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE estado_ruc (id INT AUTO_INCREMENT NOT NULL, estado_ruc VARCHAR(15) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE estado_socio (id INT AUTO_INCREMENT NOT NULL, estado_socio VARCHAR(20) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE persona (id INT AUTO_INCREMENT NOT NULL, sexo_id INT DEFAULT NULL, tipo_documento_id INT DEFAULT NULL, tipo_empresa_id INT DEFAULT NULL, estado_ruc_id INT DEFAULT NULL, estado_socio_id INT DEFAULT NULL, nombres VARCHAR(50) DEFAULT NULL, apellido_paterno VARCHAR(25) DEFAULT NULL, apellido_materno VARCHAR(25) DEFAULT NULL, num_documento VARCHAR(15) DEFAULT NULL, telefono VARCHAR(12) DEFAULT NULL, fecha_nacimiento DATE DEFAULT NULL, razon_social VARCHAR(50) DEFAULT NULL, direccion VARCHAR(100) DEFAULT NULL, representante_legal VARCHAR(100) DEFAULT NULL, dni_representante VARCHAR(15) DEFAULT NULL, ruc VARCHAR(11) DEFAULT NULL, INDEX IDX_51E5B69B2B32DB58 (sexo_id), INDEX IDX_51E5B69BF6939175 (tipo_documento_id), INDEX IDX_51E5B69BC3981BB9 (tipo_empresa_id), INDEX IDX_51E5B69B25304EAF (estado_ruc_id), INDEX IDX_51E5B69B2BF25544 (estado_socio_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE sexo (id INT AUTO_INCREMENT NOT NULL, sexo VARCHAR(10) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tipo_documento (id INT AUTO_INCREMENT NOT NULL, tipo_documento VARCHAR(25) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tipo_empresa (id INT AUTO_INCREMENT NOT NULL, tipo_empresa VARCHAR(20) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tipo_persona (id INT AUTO_INCREMENT NOT NULL, tipo_persona VARCHAR(9) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE persona ADD CONSTRAINT FK_51E5B69B2B32DB58 FOREIGN KEY (sexo_id) REFERENCES sexo (id)');
        $this->addSql('ALTER TABLE persona ADD CONSTRAINT FK_51E5B69BF6939175 FOREIGN KEY (tipo_documento_id) REFERENCES tipo_documento (id)');
        $this->addSql('ALTER TABLE persona ADD CONSTRAINT FK_51E5B69BC3981BB9 FOREIGN KEY (tipo_empresa_id) REFERENCES tipo_empresa (id)');
        $this->addSql('ALTER TABLE persona ADD CONSTRAINT FK_51E5B69B25304EAF FOREIGN KEY (estado_ruc_id) REFERENCES estado_ruc (id)');
        $this->addSql('ALTER TABLE persona ADD CONSTRAINT FK_51E5B69B2BF25544 FOREIGN KEY (estado_socio_id) REFERENCES estado_socio (id)');
        $this->addSql('ALTER TABLE socio ADD tipo_persona_id INT NOT NULL, ADD persona_id INT DEFAULT NULL, ADD codigo_socio VARCHAR(10) NOT NULL, DROP nombre, DROP dni_ruc, DROP lugar');
        $this->addSql('ALTER TABLE socio ADD CONSTRAINT FK_38B65309647E8F91 FOREIGN KEY (tipo_persona_id) REFERENCES tipo_persona (id)');
        $this->addSql('ALTER TABLE socio ADD CONSTRAINT FK_38B65309F5F88DB9 FOREIGN KEY (persona_id) REFERENCES persona (id)');
        $this->addSql('CREATE INDEX IDX_38B65309647E8F91 ON socio (tipo_persona_id)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_38B65309F5F88DB9 ON socio (persona_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE persona DROP FOREIGN KEY FK_51E5B69B25304EAF');
        $this->addSql('ALTER TABLE persona DROP FOREIGN KEY FK_51E5B69B2BF25544');
        $this->addSql('ALTER TABLE socio DROP FOREIGN KEY FK_38B65309F5F88DB9');
        $this->addSql('ALTER TABLE persona DROP FOREIGN KEY FK_51E5B69B2B32DB58');
        $this->addSql('ALTER TABLE persona DROP FOREIGN KEY FK_51E5B69BF6939175');
        $this->addSql('ALTER TABLE persona DROP FOREIGN KEY FK_51E5B69BC3981BB9');
        $this->addSql('ALTER TABLE socio DROP FOREIGN KEY FK_38B65309647E8F91');
        $this->addSql('DROP TABLE estado_ruc');
        $this->addSql('DROP TABLE estado_socio');
        $this->addSql('DROP TABLE persona');
        $this->addSql('DROP TABLE sexo');
        $this->addSql('DROP TABLE tipo_documento');
        $this->addSql('DROP TABLE tipo_empresa');
        $this->addSql('DROP TABLE tipo_persona');
        $this->addSql('DROP INDEX IDX_38B65309647E8F91 ON socio');
        $this->addSql('DROP INDEX UNIQ_38B65309F5F88DB9 ON socio');
        $this->addSql('ALTER TABLE socio ADD nombre VARCHAR(50) NOT NULL, ADD dni_ruc VARCHAR(11) NOT NULL, ADD lugar VARCHAR(30) NOT NULL, DROP tipo_persona_id, DROP persona_id, DROP codigo_socio');
    }
}
