-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 04 juin 2020 à 11:00
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `codesk_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `account_parameters`
--

DROP TABLE IF EXISTS `account_parameters`;
CREATE TABLE IF NOT EXISTS `account_parameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'NULL',
  `datebirth` date NOT NULL,
  `telephone` int(11) DEFAULT NULL,
  `ville` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codepostal` int(11) DEFAULT NULL,
  `genre` enum('homme','femme') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `account_parameters`
--

INSERT INTO `account_parameters` (`id`, `first_name`, `last_name`, `avatar_file_name`, `datebirth`, `telephone`, `ville`, `adresse`, `codepostal`, `genre`) VALUES
(3, 'Hugo', 'Larue', 'hugo.png', '2005-10-25', 626544889, 'Guotin-la-porte', '5 avenue foire', 52221, 'homme'),
(4, 'Tulipe', 'Peo', 'tulipe.png', '2006-02-07', 754885233, 'Lilas fourt', '41 rue des oliviers', 45885, 'femme'),
(9, 'Francois', 'Xavier', 'etudiants-5ed6730d16738.jpeg', '1985-02-23', 758241556, 'Paris', '5 allée des marins', 77420, 'homme'),
(10, 'Gabriel', 'Oum', 'profhomme.png', '1978-05-10', 658885448, 'Noiseil', '55 rue des lolilas', 85222, 'homme'),
(11, 'Kelly', 'Oum', 'best-window-displays-brooks-brothers-2014-RIBA-Regent-street-Squire-and-Partners-17-960x462-5ed7f7c14d631.jpeg', '1982-04-20', 625552115, 'Nois', '55 rue des lolilas', 85245, 'femme'),
(12, 'Luidgi', 'Clairboy', 'NULL', '2020-05-12', NULL, NULL, NULL, NULL, 'homme'),
(14, 'Donald', 'Trump', 'Creation-compte-intro-5ed8c62a796e0.png', '1946-06-14', 784717194, 'PARIS', '1 TER olivier beauregard', 91380, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `title`, `created`, `modified`) VALUES
(1, 'Cours', '2020-05-24 00:00:00', '2020-05-24 00:00:00'),
(2, 'Fiches synthèses', '2020-05-24 00:00:00', '2020-05-20 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_ECA105F7A76ED395` (`user_id`),
  KEY `user_key` (`user_id`),
  KEY `session_key` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`id`, `user_id`, `session_id`) VALUES
(1, 3, 1),
(2, 4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

DROP TABLE IF EXISTS `formation`;
CREATE TABLE IF NOT EXISTS `formation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_404021BF613FECDF` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`id`, `session_id`, `title`, `created`, `modified`) VALUES
(3, 3, 'Philosophie', '2020-05-23 12:35:00', NULL),
(4, 3, 'Francais', '2020-05-15 00:00:00', NULL),
(5, 1, 'Mathématiques', '2020-05-07 00:00:00', NULL),
(6, 1, 'Biologie', '2020-05-12 00:00:00', NULL),
(7, 2, 'Mathématiques', '2020-05-13 00:00:00', NULL),
(8, 2, 'Histoire Géo', '2020-05-18 00:00:00', NULL),
(9, 2, 'Francais', '2020-05-13 00:00:00', NULL),
(10, 1, 'Francais', '2020-05-05 09:20:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `formation_professeur`
--

DROP TABLE IF EXISTS `formation_professeur`;
CREATE TABLE IF NOT EXISTS `formation_professeur` (
  `formation_id` int(11) NOT NULL,
  `professeur_id` int(11) NOT NULL,
  PRIMARY KEY (`formation_id`,`professeur_id`),
  KEY `IDX_EF0D81A05200282E` (`formation_id`),
  KEY `IDX_EF0D81A0BAB22EE9` (`professeur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `formation_professeur`
--

INSERT INTO `formation_professeur` (`formation_id`, `professeur_id`) VALUES
(4, 8),
(5, 7),
(6, 9),
(6, 12),
(7, 7),
(9, 8),
(10, 10);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_mail_received_id` int(11) NOT NULL,
  `user_mail_sent_id` int(11) NOT NULL,
  `object` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `viewed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B6BD307F71EBDAF5` (`user_mail_received_id`),
  KEY `IDX_B6BD307F19FB9489` (`user_mail_sent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200520165136', '2020-05-20 18:56:09'),
('20200523193828', '2020-05-23 19:38:45'),
('20200524161105', '2020-05-24 16:11:17'),
('20200526133311', '2020-05-26 13:33:33'),
('20200526164257', '2020-05-26 16:43:04'),
('20200527104712', '2020-05-27 10:47:23'),
('20200527105424', '2020-05-27 10:54:29'),
('20200527125552', '2020-05-31 16:44:53'),
('20200528211635', '2020-05-31 16:44:53'),
('20200528212424', '2020-05-31 16:44:55'),
('20200528212437', '2020-05-31 16:44:55'),
('20200531164420', '2020-05-31 16:44:55'),
('20200531164646', '2020-05-31 16:47:03');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formation_id` int(11) NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C2426285200282E` (`formation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id`, `formation_id`, `title`, `created`, `modified`) VALUES
(1, 5, 'Programme 2019 de Mathématiques', '2020-05-24 00:00:00', NULL),
(2, 7, 'Nombres et Calculs', '2020-05-24 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
CREATE TABLE IF NOT EXISTS `professeur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `matter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_17A55299A76ED395` (`user_id`),
  KEY `user_key` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`id`, `user_id`, `matter`) VALUES
(7, 9, 'Mathématiques (Seconde ES), Mathématiques (Terminale S)'),
(8, 10, 'Francais (Seconde ES), Francais (Première L)'),
(9, 11, 'Biologie (Terminale S)'),
(10, 12, 'Francais (Terminale S)'),
(12, 14, 'Biologie (Terminale S)');

-- --------------------------------------------------------

--
-- Structure de la table `professeur_formation`
--

DROP TABLE IF EXISTS `professeur_formation`;
CREATE TABLE IF NOT EXISTS `professeur_formation` (
  `professeur_id` int(11) NOT NULL,
  `formation_id` int(11) NOT NULL,
  PRIMARY KEY (`professeur_id`,`formation_id`),
  KEY `IDX_2C1201D9BAB22EE9` (`professeur_id`),
  KEY `IDX_2C1201D95200282E` (`formation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `professeur_formation`
--

INSERT INTO `professeur_formation` (`professeur_id`, `formation_id`) VALUES
(7, 5),
(7, 7),
(8, 4),
(8, 9),
(9, 6),
(10, 10),
(12, 6);

-- --------------------------------------------------------

--
-- Structure de la table `professeur_session`
--

DROP TABLE IF EXISTS `professeur_session`;
CREATE TABLE IF NOT EXISTS `professeur_session` (
  `professeur_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  PRIMARY KEY (`professeur_id`,`session_id`),
  KEY `IDX_BB98A822BAB22EE9` (`professeur_id`),
  KEY `IDX_BB98A822613FECDF` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `professeur_session`
--

INSERT INTO `professeur_session` (`professeur_id`, `session_id`) VALUES
(7, 1),
(7, 2),
(8, 2),
(8, 3),
(9, 1),
(10, 1),
(10, 2),
(12, 1);

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

DROP TABLE IF EXISTS `seance`;
CREATE TABLE IF NOT EXISTS `seance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `support_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DF7DFD0EAFC2B591` (`module_id`),
  KEY `IDX_DF7DFD0EBCF5E72D` (`categorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`id`, `module_id`, `categorie_id`, `title`, `number`, `body`, `published`, `created`, `modified`, `support_link`) VALUES
(1, 1, 2, 'Révisions du BAC - Fiches mémoires', NULL, '', '2020-05-24 00:00:00', '2020-05-24 00:00:00', NULL, 'supports_cours\\recap_maths_terminale.pdf'),
(2, 2, 1, 'Le Calcul Algébrique', NULL, '', '2020-05-24 00:00:00', '2020-05-24 00:00:00', NULL, 'supports_cours\\calcul_algebrique_seconde.pdf');

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entitled` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `entitled`, `start`, `end`, `created`, `modified`) VALUES
(1, 'Terminale S', '2020-06-02 00:00:00', '2021-06-02 00:00:00', '2020-05-20 00:00:00', '2020-05-20 00:00:00'),
(2, 'Seconde ES', '2020-06-02 00:00:00', '2021-06-02 00:00:00', '2020-05-20 00:00:00', '2020-05-20 00:00:00'),
(3, 'Première L', '2020-09-09 00:00:00', '2021-11-25 00:00:00', '2020-05-23 00:00:00', '2021-11-25 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `session_professeur`
--

DROP TABLE IF EXISTS `session_professeur`;
CREATE TABLE IF NOT EXISTS `session_professeur` (
  `session_id` int(11) NOT NULL,
  `professeur_id` int(11) NOT NULL,
  PRIMARY KEY (`session_id`,`professeur_id`),
  KEY `IDX_F73359C2613FECDF` (`session_id`),
  KEY `IDX_F73359C2BAB22EE9` (`professeur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session_professeur`
--

INSERT INTO `session_professeur` (`session_id`, `professeur_id`) VALUES
(1, 7),
(1, 9),
(1, 10),
(1, 12),
(2, 7),
(2, 8),
(2, 10),
(3, 8);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `professeur_id` int(11) DEFAULT NULL,
  `parameter_id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D6497C56DBD6` (`parameter_id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  UNIQUE KEY `UNIQ_8D93D649BAB22EE9` (`professeur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `professeur_id`, `parameter_id`, `email`, `username`, `roles`, `password`, `note`, `created_at`, `updated_at`) VALUES
(3, NULL, 3, 'hugo.lycee@codesk.com', 'hugo7', 'a:1:{i:0;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$NVljdmNmRW5UbDZ1Ny5VRA$IgtuH5j+1Ar3OoxbKKECuc5HTSuKGtUUwTlYhdOYJp0', NULL, NULL, NULL),
(4, NULL, 4, 'tulipe.peo@codesk.com', 'tulipe8', 'a:1:{i:0;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$NVljdmNmRW5UbDZ1Ny5VRA$IgtuH5j+1Ar3OoxbKKECuc5HTSuKGtUUwTlYhdOYJp0', NULL, NULL, NULL),
(9, 7, 9, 'fafa456@gmail.com', 'neunou489', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', NULL, '2020-05-24 17:43:02', '2020-06-02 18:35:15'),
(10, 8, 10, 'gabioum@codesk.com', 'gabi15', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$a3p1S0xvNUlrblVNVDRHdQ$eBP83EXD1OyYIEhTP8KXkm+fDz1KOef5R0SkvjGV0YE', 'uihilugliy', '2020-05-26 15:08:59', NULL),
(11, 9, 11, 'kellyoum@codesk.com', 'kelly78', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$Z3dVRnpySTh5VzlzaGc0Wg$0rGH3ey+ILeuUiD2tA1WTPS2H3gX58RTmKZWGkA7BRU', NULL, '2020-05-26 15:25:07', '2020-06-03 21:19:30'),
(12, 10, 12, 'luid@live.fr', '19064190', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$RXBFMWUwSktQTWZWMkR6Tw$SnU8UMthTn06LVTBJCDZm1tPHNXtC/Yngc/7ULMYflI', NULL, '2020-05-28 19:44:53', NULL),
(14, 12, 14, 'Trump@live.fr', 'DonaldLulu', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$RXZRemlUYXA3L2x1eWhnSw$OUcYsEVCMbpFrRqbohW406yFlfQdEsvInaQTaoOVS/8', NULL, '2020-05-31 22:12:32', '2020-06-04 12:00:11');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD CONSTRAINT `FK_ECA105F7613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  ADD CONSTRAINT `FK_ECA105F7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `formation`
--
ALTER TABLE `formation`
  ADD CONSTRAINT `FK_404021BF613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`);

--
-- Contraintes pour la table `formation_professeur`
--
ALTER TABLE `formation_professeur`
  ADD CONSTRAINT `FK_EF0D81A05200282E` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_EF0D81A0BAB22EE9` FOREIGN KEY (`professeur_id`) REFERENCES `professeur` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK_B6BD307F19FB9489` FOREIGN KEY (`user_mail_sent_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_B6BD307F71EBDAF5` FOREIGN KEY (`user_mail_received_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `FK_C2426285200282E` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`);

--
-- Contraintes pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD CONSTRAINT `FK_17A55299A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `professeur_formation`
--
ALTER TABLE `professeur_formation`
  ADD CONSTRAINT `FK_2C1201D95200282E` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`),
  ADD CONSTRAINT `FK_2C1201D9BAB22EE9` FOREIGN KEY (`professeur_id`) REFERENCES `professeur` (`id`);

--
-- Contraintes pour la table `professeur_session`
--
ALTER TABLE `professeur_session`
  ADD CONSTRAINT `FK_BB98A822613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`),
  ADD CONSTRAINT `FK_BB98A822BAB22EE9` FOREIGN KEY (`professeur_id`) REFERENCES `professeur` (`id`);

--
-- Contraintes pour la table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `FK_DF7DFD0EAFC2B591` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`),
  ADD CONSTRAINT `FK_DF7DFD0EBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `session_professeur`
--
ALTER TABLE `session_professeur`
  ADD CONSTRAINT `FK_F73359C2613FECDF` FOREIGN KEY (`session_id`) REFERENCES `session` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_F73359C2BAB22EE9` FOREIGN KEY (`professeur_id`) REFERENCES `professeur` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D6497C56DBD6` FOREIGN KEY (`parameter_id`) REFERENCES `account_parameters` (`id`),
  ADD CONSTRAINT `FK_8D93D649BAB22EE9` FOREIGN KEY (`professeur_id`) REFERENCES `professeur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
