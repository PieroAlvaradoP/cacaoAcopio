<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220406213413 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE UNIQUE INDEX UNIQ_AB2E7BF0D17F50A6 ON tipo_empresa (uuid)');
        $this->addSql('ALTER TABLE tipo_empresa RENAME INDEX fk_ab2e7bf053c8d32c TO IDX_AB2E7BF053C8D32C');
        $this->addSql('ALTER TABLE tipo_empresa RENAME INDEX fk_ab2e7bf024db0683 TO IDX_AB2E7BF024DB0683');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP INDEX UNIQ_AB2E7BF0D17F50A6 ON tipo_empresa');
        $this->addSql('ALTER TABLE tipo_empresa RENAME INDEX idx_ab2e7bf024db0683 TO FK_AB2E7BF024DB0683');
        $this->addSql('ALTER TABLE tipo_empresa RENAME INDEX idx_ab2e7bf053c8d32c TO FK_AB2E7BF053C8D32C');
    }
}
