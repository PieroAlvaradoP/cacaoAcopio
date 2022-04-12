<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220407204002 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE conductor ADD CONSTRAINT FK_D5F7F18AF6939175 FOREIGN KEY (tipo_documento_id) REFERENCES tipo_documento (id)');
        $this->addSql('ALTER TABLE persona ADD CONSTRAINT FK_51E5B69BF6939175 FOREIGN KEY (tipo_documento_id) REFERENCES tipo_documento (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE conductor DROP FOREIGN KEY FK_D5F7F18AF6939175');
        $this->addSql('ALTER TABLE persona DROP FOREIGN KEY FK_51E5B69BF6939175');
    }
}
