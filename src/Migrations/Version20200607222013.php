<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20200607222013 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE account_parameters CHANGE avatar_file_name avatar_file_name VARCHAR(255) DEFAULT \'NULL\', CHANGE telephone telephone INT DEFAULT NULL, CHANGE ville ville VARCHAR(70) DEFAULT NULL, CHANGE adresse adresse VARCHAR(180) DEFAULT NULL, CHANGE codepostal codepostal INT DEFAULT NULL, CHANGE genre genre enum(\'homme\', \'femme\')');
        $this->addSql('ALTER TABLE eleve CHANGE user_id user_id INT DEFAULT NULL, CHANGE session_id session_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE formation CHANGE modified modified DATETIME DEFAULT NULL');
        $this->addSql('ALTER TABLE message DROP FOREIGN KEY FK_B6BD307FB8557DA7');
        $this->addSql('DROP INDEX IDX_B6BD307FB8557DA7 ON message');
        $this->addSql('ALTER TABLE message CHANGE object object VARCHAR(180) DEFAULT NULL, CHANGE modified modified DATETIME DEFAULT NULL, CHANGE usermailreceived_id user_mail_received_id INT NOT NULL');
        $this->addSql('ALTER TABLE message ADD CONSTRAINT FK_B6BD307F71EBDAF5 FOREIGN KEY (user_mail_received_id) REFERENCES user (id)');
        $this->addSql('CREATE INDEX IDX_B6BD307F71EBDAF5 ON message (user_mail_received_id)');
        $this->addSql('ALTER TABLE module CHANGE modified modified DATETIME DEFAULT NULL');
        $this->addSql('ALTER TABLE professeur CHANGE user_id user_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE seance CHANGE module_id module_id INT DEFAULT NULL, CHANGE categorie_id categorie_id INT DEFAULT NULL, CHANGE title title VARCHAR(190) DEFAULT NULL, CHANGE number number VARCHAR(10) DEFAULT NULL, CHANGE modified modified DATETIME DEFAULT NULL, CHANGE support_link support_link VARCHAR(255) DEFAULT NULL');
        $this->addSql('ALTER TABLE user CHANGE professeur_id professeur_id INT DEFAULT NULL, CHANGE created_at created_at DATETIME DEFAULT NULL, CHANGE updated_at updated_at DATETIME DEFAULT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE account_parameters CHANGE avatar_file_name avatar_file_name VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'\'\'NULL\'\'\' COLLATE `utf8mb4_unicode_ci`, CHANGE telephone telephone INT DEFAULT NULL, CHANGE ville ville VARCHAR(70) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE adresse adresse VARCHAR(180) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE codepostal codepostal INT DEFAULT NULL, CHANGE genre genre VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE eleve CHANGE user_id user_id INT DEFAULT NULL, CHANGE session_id session_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE formation CHANGE modified modified DATETIME DEFAULT \'NULL\'');
        $this->addSql('ALTER TABLE message DROP FOREIGN KEY FK_B6BD307F71EBDAF5');
        $this->addSql('DROP INDEX IDX_B6BD307F71EBDAF5 ON message');
        $this->addSql('ALTER TABLE message CHANGE object object VARCHAR(180) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE modified modified DATETIME DEFAULT \'NULL\', CHANGE user_mail_received_id usermailreceived_id INT NOT NULL');
        $this->addSql('ALTER TABLE message ADD CONSTRAINT FK_B6BD307FB8557DA7 FOREIGN KEY (usermailreceived_id) REFERENCES user (id)');
        $this->addSql('CREATE INDEX IDX_B6BD307FB8557DA7 ON message (usermailreceived_id)');
        $this->addSql('ALTER TABLE module CHANGE modified modified DATETIME DEFAULT \'NULL\'');
        $this->addSql('ALTER TABLE professeur CHANGE user_id user_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE seance CHANGE module_id module_id INT DEFAULT NULL, CHANGE categorie_id categorie_id INT DEFAULT NULL, CHANGE title title VARCHAR(190) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE number number VARCHAR(10) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`, CHANGE modified modified DATETIME DEFAULT \'NULL\', CHANGE support_link support_link VARCHAR(255) CHARACTER SET utf8mb4 DEFAULT \'NULL\' COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE user CHANGE professeur_id professeur_id INT DEFAULT NULL, CHANGE created_at created_at DATETIME DEFAULT \'NULL\', CHANGE updated_at updated_at DATETIME DEFAULT \'NULL\'');
    }
}
