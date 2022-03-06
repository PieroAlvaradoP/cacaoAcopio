<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220225083224 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE area_parcela (id INT AUTO_INCREMENT NOT NULL, total NUMERIC(5, 2) NOT NULL, produccion NUMERIC(5, 2) DEFAULT NULL, crecimiento NUMERIC(5, 2) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE certificacion (id INT AUTO_INCREMENT NOT NULL, padre_id INT DEFAULT NULL, propietario_id INT DEFAULT NULL, config_id INT DEFAULT NULL, nombre VARCHAR(50) NOT NULL, alias VARCHAR(50) NOT NULL, descripcion LONGTEXT DEFAULT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, activo TINYINT(1) NOT NULL, uuid BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', UNIQUE INDEX UNIQ_A1F20253D17F50A6 (uuid), INDEX IDX_A1F20253613CEC58 (padre_id), INDEX IDX_A1F2025353C8D32C (propietario_id), INDEX IDX_A1F2025324DB0683 (config_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE coordenadas (id INT AUTO_INCREMENT NOT NULL, latitud VARCHAR(30) DEFAULT NULL, longitud VARCHAR(30) DEFAULT NULL, altitud VARCHAR(30) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE estado_periodo (id INT AUTO_INCREMENT NOT NULL, estado VARCHAR(20) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE estado_ruc (id INT AUTO_INCREMENT NOT NULL, estado_ruc VARCHAR(15) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE estado_socio (id INT AUTO_INCREMENT NOT NULL, estado_socio VARCHAR(20) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE estimacion (id INT AUTO_INCREMENT NOT NULL, certificacion_id INT NOT NULL, socio_id INT NOT NULL, socio_periodos_id INT NOT NULL, cantidad NUMERIC(5, 2) NOT NULL, INDEX IDX_1D9C1F02693EA4CA (certificacion_id), INDEX IDX_1D9C1F02DA04E6A9 (socio_id), INDEX IDX_1D9C1F0292A0549A (socio_periodos_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE persona (id INT AUTO_INCREMENT NOT NULL, sexo_id INT DEFAULT NULL, tipo_documento_id INT DEFAULT NULL, tipo_empresa_id INT DEFAULT NULL, estado_ruc_id INT DEFAULT NULL, nombres VARCHAR(50) DEFAULT NULL, apellido_paterno VARCHAR(25) DEFAULT NULL, apellido_materno VARCHAR(25) DEFAULT NULL, num_documento VARCHAR(15) DEFAULT NULL, telefono VARCHAR(12) DEFAULT NULL, fecha_nacimiento DATE DEFAULT NULL, razon_social VARCHAR(50) DEFAULT NULL, direccion VARCHAR(100) DEFAULT NULL, representante_legal VARCHAR(100) DEFAULT NULL, dni_representante VARCHAR(15) DEFAULT NULL, ruc VARCHAR(11) DEFAULT NULL, INDEX IDX_51E5B69B2B32DB58 (sexo_id), INDEX IDX_51E5B69BF6939175 (tipo_documento_id), INDEX IDX_51E5B69BC3981BB9 (tipo_empresa_id), INDEX IDX_51E5B69B25304EAF (estado_ruc_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE proyecciones (id INT AUTO_INCREMENT NOT NULL, socio_id INT NOT NULL, periodo VARCHAR(50) NOT NULL, empresa VARCHAR(50) NOT NULL, tipo_cacao VARCHAR(20) NOT NULL, quintales_proyectados NUMERIC(5, 2) NOT NULL, INDEX IDX_4DA0A8AEDA04E6A9 (socio_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE saldo (id INT AUTO_INCREMENT NOT NULL, periodo_id INT NOT NULL, producto_id INT NOT NULL, unidad_id INT NOT NULL, almacen_id INT NOT NULL, saldo NUMERIC(6, 2) NOT NULL, INDEX IDX_669B1D4A9C3921AB (periodo_id), INDEX IDX_669B1D4A7645698E (producto_id), INDEX IDX_669B1D4A9D01464C (unidad_id), INDEX IDX_669B1D4A9C9C9E68 (almacen_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE sexo (id INT AUTO_INCREMENT NOT NULL, sexo VARCHAR(10) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE socio (id INT AUTO_INCREMENT NOT NULL, tipo_persona_id INT NOT NULL, persona_id INT DEFAULT NULL, estado_socio_id INT NOT NULL, propietario_id INT DEFAULT NULL, config_id INT DEFAULT NULL, codigo_socio VARCHAR(10) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, activo TINYINT(1) NOT NULL, uuid BINARY(16) NOT NULL COMMENT \'(DC2Type:uuid)\', UNIQUE INDEX UNIQ_38B65309D17F50A6 (uuid), INDEX IDX_38B65309647E8F91 (tipo_persona_id), UNIQUE INDEX UNIQ_38B65309F5F88DB9 (persona_id), INDEX IDX_38B653092BF25544 (estado_socio_id), INDEX IDX_38B6530953C8D32C (propietario_id), INDEX IDX_38B6530924DB0683 (config_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE socio_periodo (id INT AUTO_INCREMENT NOT NULL, periodo_id INT NOT NULL, socio_id INT NOT NULL, INDEX IDX_57EECEBE9C3921AB (periodo_id), INDEX IDX_57EECEBEDA04E6A9 (socio_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tipo_almacen (id INT AUTO_INCREMENT NOT NULL, tipo_almacen VARCHAR(30) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tipo_documento (id INT AUTO_INCREMENT NOT NULL, tipo_documento VARCHAR(25) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tipo_empresa (id INT AUTO_INCREMENT NOT NULL, tipo_empresa VARCHAR(20) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tipo_persona (id INT AUTO_INCREMENT NOT NULL, tipo_persona VARCHAR(9) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE unidad (id INT AUTO_INCREMENT NOT NULL, unidad VARCHAR(20) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE certificacion ADD CONSTRAINT FK_A1F20253613CEC58 FOREIGN KEY (padre_id) REFERENCES certificacion (id)');
        $this->addSql('ALTER TABLE certificacion ADD CONSTRAINT FK_A1F2025353C8D32C FOREIGN KEY (propietario_id) REFERENCES usuario (id)');
        $this->addSql('ALTER TABLE certificacion ADD CONSTRAINT FK_A1F2025324DB0683 FOREIGN KEY (config_id) REFERENCES config (id)');
        $this->addSql('ALTER TABLE estimacion ADD CONSTRAINT FK_1D9C1F02693EA4CA FOREIGN KEY (certificacion_id) REFERENCES certificacion (id)');
        $this->addSql('ALTER TABLE estimacion ADD CONSTRAINT FK_1D9C1F02DA04E6A9 FOREIGN KEY (socio_id) REFERENCES socio (id)');
        $this->addSql('ALTER TABLE estimacion ADD CONSTRAINT FK_1D9C1F0292A0549A FOREIGN KEY (socio_periodos_id) REFERENCES socio_periodo (id)');
        $this->addSql('ALTER TABLE persona ADD CONSTRAINT FK_51E5B69B2B32DB58 FOREIGN KEY (sexo_id) REFERENCES sexo (id)');
        $this->addSql('ALTER TABLE persona ADD CONSTRAINT FK_51E5B69BF6939175 FOREIGN KEY (tipo_documento_id) REFERENCES tipo_documento (id)');
        $this->addSql('ALTER TABLE persona ADD CONSTRAINT FK_51E5B69BC3981BB9 FOREIGN KEY (tipo_empresa_id) REFERENCES tipo_empresa (id)');
        $this->addSql('ALTER TABLE persona ADD CONSTRAINT FK_51E5B69B25304EAF FOREIGN KEY (estado_ruc_id) REFERENCES estado_ruc (id)');
        $this->addSql('ALTER TABLE proyecciones ADD CONSTRAINT FK_4DA0A8AEDA04E6A9 FOREIGN KEY (socio_id) REFERENCES socio (id)');
        $this->addSql('ALTER TABLE saldo ADD CONSTRAINT FK_669B1D4A9C3921AB FOREIGN KEY (periodo_id) REFERENCES periodo (id)');
        $this->addSql('ALTER TABLE saldo ADD CONSTRAINT FK_669B1D4A7645698E FOREIGN KEY (producto_id) REFERENCES producto (id)');
        $this->addSql('ALTER TABLE saldo ADD CONSTRAINT FK_669B1D4A9D01464C FOREIGN KEY (unidad_id) REFERENCES unidad (id)');
        $this->addSql('ALTER TABLE saldo ADD CONSTRAINT FK_669B1D4A9C9C9E68 FOREIGN KEY (almacen_id) REFERENCES almacen (id)');
        $this->addSql('ALTER TABLE socio ADD CONSTRAINT FK_38B65309647E8F91 FOREIGN KEY (tipo_persona_id) REFERENCES tipo_persona (id)');
        $this->addSql('ALTER TABLE socio ADD CONSTRAINT FK_38B65309F5F88DB9 FOREIGN KEY (persona_id) REFERENCES persona (id)');
        $this->addSql('ALTER TABLE socio ADD CONSTRAINT FK_38B653092BF25544 FOREIGN KEY (estado_socio_id) REFERENCES estado_socio (id)');
        $this->addSql('ALTER TABLE socio ADD CONSTRAINT FK_38B6530953C8D32C FOREIGN KEY (propietario_id) REFERENCES usuario (id)');
        $this->addSql('ALTER TABLE socio ADD CONSTRAINT FK_38B6530924DB0683 FOREIGN KEY (config_id) REFERENCES config (id)');
        $this->addSql('ALTER TABLE socio_periodo ADD CONSTRAINT FK_57EECEBE9C3921AB FOREIGN KEY (periodo_id) REFERENCES periodo (id)');
        $this->addSql('ALTER TABLE socio_periodo ADD CONSTRAINT FK_57EECEBEDA04E6A9 FOREIGN KEY (socio_id) REFERENCES socio (id)');
        $this->addSql('DROP TABLE ticket_trazabilidad');
        $this->addSql('ALTER TABLE almacen ADD tipo_almacen_id INT NOT NULL, ADD ubicacion_id INT NOT NULL, DROP tipo_almacen');
        $this->addSql('ALTER TABLE almacen ADD CONSTRAINT FK_D5B2D250D1A9C40 FOREIGN KEY (tipo_almacen_id) REFERENCES tipo_almacen (id)');
        $this->addSql('ALTER TABLE almacen ADD CONSTRAINT FK_D5B2D25057E759E8 FOREIGN KEY (ubicacion_id) REFERENCES localidad (id)');
        $this->addSql('CREATE INDEX IDX_D5B2D250D1A9C40 ON almacen (tipo_almacen_id)');
        $this->addSql('CREATE INDEX IDX_D5B2D25057E759E8 ON almacen (ubicacion_id)');
        $this->addSql('ALTER TABLE periodo ADD estado_id INT NOT NULL, DROP estado, CHANGE descripcion descripcion LONGTEXT DEFAULT NULL');
        $this->addSql('ALTER TABLE periodo ADD CONSTRAINT FK_7316C4ED9F5A440B FOREIGN KEY (estado_id) REFERENCES estado_periodo (id)');
        $this->addSql('CREATE INDEX IDX_7316C4ED9F5A440B ON periodo (estado_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE certificacion DROP FOREIGN KEY FK_A1F20253613CEC58');
        $this->addSql('ALTER TABLE estimacion DROP FOREIGN KEY FK_1D9C1F02693EA4CA');
        $this->addSql('ALTER TABLE periodo DROP FOREIGN KEY FK_7316C4ED9F5A440B');
        $this->addSql('ALTER TABLE persona DROP FOREIGN KEY FK_51E5B69B25304EAF');
        $this->addSql('ALTER TABLE socio DROP FOREIGN KEY FK_38B653092BF25544');
        $this->addSql('ALTER TABLE socio DROP FOREIGN KEY FK_38B65309F5F88DB9');
        $this->addSql('ALTER TABLE persona DROP FOREIGN KEY FK_51E5B69B2B32DB58');
        $this->addSql('ALTER TABLE estimacion DROP FOREIGN KEY FK_1D9C1F02DA04E6A9');
        $this->addSql('ALTER TABLE proyecciones DROP FOREIGN KEY FK_4DA0A8AEDA04E6A9');
        $this->addSql('ALTER TABLE socio_periodo DROP FOREIGN KEY FK_57EECEBEDA04E6A9');
        $this->addSql('ALTER TABLE estimacion DROP FOREIGN KEY FK_1D9C1F0292A0549A');
        $this->addSql('ALTER TABLE almacen DROP FOREIGN KEY FK_D5B2D250D1A9C40');
        $this->addSql('ALTER TABLE persona DROP FOREIGN KEY FK_51E5B69BF6939175');
        $this->addSql('ALTER TABLE persona DROP FOREIGN KEY FK_51E5B69BC3981BB9');
        $this->addSql('ALTER TABLE socio DROP FOREIGN KEY FK_38B65309647E8F91');
        $this->addSql('ALTER TABLE saldo DROP FOREIGN KEY FK_669B1D4A9D01464C');
        $this->addSql('CREATE TABLE ticket_trazabilidad (id INT AUTO_INCREMENT NOT NULL, nro_control VARCHAR(20) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, peso_neto NUMERIC(10, 2) NOT NULL, cant_sacos VARCHAR(3) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('DROP TABLE area_parcela');
        $this->addSql('DROP TABLE certificacion');
        $this->addSql('DROP TABLE coordenadas');
        $this->addSql('DROP TABLE estado_periodo');
        $this->addSql('DROP TABLE estado_ruc');
        $this->addSql('DROP TABLE estado_socio');
        $this->addSql('DROP TABLE estimacion');
        $this->addSql('DROP TABLE persona');
        $this->addSql('DROP TABLE proyecciones');
        $this->addSql('DROP TABLE saldo');
        $this->addSql('DROP TABLE sexo');
        $this->addSql('DROP TABLE socio');
        $this->addSql('DROP TABLE socio_periodo');
        $this->addSql('DROP TABLE tipo_almacen');
        $this->addSql('DROP TABLE tipo_documento');
        $this->addSql('DROP TABLE tipo_empresa');
        $this->addSql('DROP TABLE tipo_persona');
        $this->addSql('DROP TABLE unidad');
        $this->addSql('ALTER TABLE almacen DROP FOREIGN KEY FK_D5B2D25057E759E8');
        $this->addSql('DROP INDEX IDX_D5B2D250D1A9C40 ON almacen');
        $this->addSql('DROP INDEX IDX_D5B2D25057E759E8 ON almacen');
        $this->addSql('ALTER TABLE almacen ADD tipo_almacen VARCHAR(50) NOT NULL, DROP tipo_almacen_id, DROP ubicacion_id');
        $this->addSql('DROP INDEX IDX_7316C4ED9F5A440B ON periodo');
        $this->addSql('ALTER TABLE periodo ADD estado VARCHAR(20) NOT NULL, DROP estado_id, CHANGE descripcion descripcion VARCHAR(50) DEFAULT NULL');
    }
}
