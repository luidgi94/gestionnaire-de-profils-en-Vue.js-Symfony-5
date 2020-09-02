-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 13 juil. 2020 à 14:49
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `account_parameters`
--

INSERT INTO `account_parameters` (`id`, `first_name`, `last_name`, `avatar_file_name`, `datebirth`, `telephone`, `ville`, `adresse`, `codepostal`, `genre`) VALUES
(3, 'Hugo', 'Lefevre', 'hugo.png', '2004-10-25', 626544889, 'Guotin-la-porte', '5 avenue foire', 52221, 'homme'),
(4, 'Tulipe', 'Peo', 'tulipe.png', '2003-02-07', 754885233, 'Lilas fourt', '41 rue des oliviers', 45885, 'femme'),
(9, 'François', 'Xavier', 'prof-8-5ef44a76e57bb.jpeg', '1985-02-23', 625488412, 'As doree', '5 rue des loutres', 85200, 'homme'),
(10, 'Jean-Marc', 'Lafeuille', 'jeanmarc.png', '1978-05-10', 658885448, 'Noiseil', '55 rue des lolilas', 85222, 'homme'),
(11, 'Kelly', 'Smith', 'kelly.png', '1982-04-20', 625552115, 'Noix-les-zettes', '55 rue des lolilas', 85245, 'femme'),
(14, 'George', 'Louvain', 'george.png', '1976-06-14', 784717194, 'Paris', '1 TER olivier beauregard', 91380, 'homme'),
(15, 'Julie', 'Seuillet', 'juliette.png\r\n', '2003-09-17', 725588897, 'Tilleul-Sur-Heine', '30 avenue des peupliers', 78520, 'femme'),
(16, 'Pierre', 'Couroi', 'pierre.png', '2003-02-27', 759996632, 'Jouilloy-Reine', '126 rue des jonquilles', 98520, 'homme'),
(17, 'Pholien', 'Dens', 'pholien.png', '2003-07-10', 721155448, 'George-Les-Droits', '84 rue Jean Serein', 74201, 'homme'),
(18, 'Dean', 'Loup', 'dean.png', '2002-06-13', 745889963, 'Guy-Hoquet-Dock', '12 allée des précipices', 96253, 'homme'),
(19, 'Sophie', 'LeMoine', 'sophie.png', '2004-05-24', 789523212, 'Dome-St-Jean', '6 rue des anges', 72200, 'femme'),
(20, 'Becky', 'Maillet', 'becky.png', '2003-01-24', 748232255, 'Poulet-en-Ferme', '87 fleurs des champs', 95200, 'femme'),
(21, 'Phill', 'Moss', 'phill.png', '1971-05-23', 745522112, 'Ouille-St-Berth', '8 avenue des gorges', 75200, 'homme'),
(22, 'Berth', 'Pierre', 'berth.png', '1987-03-12', 789963552, 'Joules-les-eclairs', '9 avenue des cerises', 78520, 'femme'),
(23, 'Maryline', 'Cruz', 'maryline.png', '1988-04-20', 652226554, 'Hugette-Ste-Marie', '85 puys des lilas', 92200, 'femme'),
(24, 'Laure', 'Lafont', 'laure.png', '1984-03-26', 658889956, 'Neuve-du-roi', '62 avenue des fermes', 77510, 'femme'),
(25, 'Marie-Jeanne', 'Duprès', 'mariejeanne.png', '1987-06-03', 654889955, 'Champs-sur-laine', '6 allée des temples', 89526, 'femme'),
(26, 'Olive', 'Henry', 'olive.png', '2003-08-05', 721532114, 'Moulin-St-Louis', '65 avenue des gruges', 95630, 'femme'),
(27, 'Géraldine', 'Keeves', 'geraldine.png', '1970-08-28', 625558891, 'Herbes-en-Provence', '98 rue des groseilles', 85260, 'femme'),
(28, 'Henry', 'Joubile', 'henry.png', '1984-10-02', 758996552, 'Grange-le-foin', '26 rue des champs', 95260, 'homme'),
(29, 'Raphaël', 'Mazarin', 'raphael.png', '2005-04-15', 721152362, 'Claude-Maurin', '15 avenue de l\'église', 94200, 'homme'),
(30, 'Laurence', 'Ternan', 'laurence.png', '1982-05-23', 765599884, 'Marais-les-chevreuses', '45 rue des manifs', 76520, 'femme'),
(32, 'René', 'Descartes', 'rene.png', '1975-01-30', 684536974, 'Granites-les-roches', '87 avenue plaisir', 96250, 'homme'),
(33, 'Yves', 'Jauget', 'yves.png', '1985-11-25', 689423565, 'Urgence-les-maux', '74 rue hospitalier', 92015, 'homme'),
(34, 'Morgane', 'Flavel', 'morgane.png', '2003-12-02', 758895547, 'Bains-les-mouettes', '66 rue des coquilles', 93520, 'femme'),
(35, 'Samuel', 'Flavel', 'sam.png', '2002-08-28', 789512365, 'Bains-les-mouettes', '66 rue des coquilles', 93520, 'homme'),
(36, 'Magalie', 'Duteil', 'magalie.png', '2004-06-18', 754855214, 'Huet-les-ponts', '58 rue des glaciers', 77562, 'femme'),
(37, 'Florence', 'Peo', 'florence.png', '2004-09-29', 723625242, 'Cerises-la-coque', '62 avenue des fleurettes', 98520, 'femme'),
(38, 'Vincent', 'Luz', 'vincent.png', '2003-08-21', 721489325, 'Fleurs-Mazert', '30 avenue Lucie Centre', 95231, 'homme'),
(39, 'Kevin', 'Tran', 'kevin.png', '2003-07-14', 752142365, 'Yvelin-Choisy', '12 allée des conifères', 85260, 'homme'),
(40, 'Paul', 'Keys', 'paul.png', '1978-05-10', 758241556, 'Oeil-sur-onde', '2 boulevard des puits', 85222, 'homme'),
(41, 'Baptiste', 'Cantali', 'baptiste.png', '1978-05-10', 758241556, 'Cherbourg-Sous-Orgne', '52 rue du muguet', 85222, 'homme');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `title`, `created`, `modified`) VALUES
(1, 'Cours', '2020-05-24 00:00:00', '2020-05-24 00:00:00'),
(3, 'Exercice oral', '2020-05-24 00:00:00', '2020-05-24 00:00:00'),
(4, 'Exercice écrit', '2020-05-24 00:00:00', '2020-05-24 00:00:00'),
(5, 'Révisions', '2020-05-24 00:00:00', '2020-05-24 00:00:00'),
(6, 'Travaux Pratiques (TP)', '2020-05-24 00:00:00', '2020-05-24 00:00:00'),
(7, 'Test de connaissances', '2020-05-24 00:00:00', '2020-05-24 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
CREATE TABLE IF NOT EXISTS `eleve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_ECA105F7A76ED395` (`user_id`),
  KEY `user_key` (`user_id`),
  KEY `session_key` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `eleve`
--

INSERT INTO `eleve` (`id`, `user_id`, `session_id`) VALUES
(1, 3, 1),
(2, 4, 2),
(3, 15, 2),
(4, 16, 1),
(5, 17, 2),
(6, 18, 1),
(7, 19, 2),
(8, 20, 1),
(9, 21, 2),
(10, 22, 1),
(11, 23, 2),
(12, 24, 1),
(13, 25, 2),
(14, 26, 1),
(15, 27, 2),
(16, 28, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`id`, `session_id`, `title`, `created`, `modified`) VALUES
(5, 1, 'Mathématiques', '2020-05-07 00:00:00', NULL),
(6, 1, 'Physique-Chimie', '2020-05-12 00:00:00', NULL),
(7, 2, 'Mathématiques', '2020-05-13 00:00:00', NULL),
(8, 2, 'Histoire/Géographie', '2020-05-18 00:00:00', NULL),
(9, 2, 'Francais', '2020-05-13 00:00:00', NULL),
(11, 1, 'Anglais', '2020-06-13 00:00:00', NULL),
(12, 1, 'Allemand', '2020-06-13 00:00:00', NULL),
(13, 2, 'Anglais', '2020-05-24 00:00:00', NULL),
(14, 2, 'Allemand', '2020-05-24 00:00:00', NULL),
(15, 1, 'Espagnol', '2020-05-24 00:00:00', NULL),
(16, 2, 'Espagnol', '2020-05-24 00:00:00', NULL),
(19, 2, 'SES', '2020-05-24 00:00:00', NULL),
(20, 1, 'Éducation Sportive', '2020-05-24 00:00:00', NULL),
(21, 2, 'Éducation Sportive', '2020-05-24 00:00:00', NULL),
(22, 1, 'Histoire/Géographie', '2020-05-24 00:00:00', NULL),
(23, 2, 'Sciences', '2020-05-24 00:00:00', NULL),
(24, 1, 'Philosophie', '2020-05-24 00:00:00', NULL);

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
(5, 7),
(6, 9),
(7, 7),
(8, 25),
(9, 8),
(11, 32),
(12, 26),
(13, 28),
(14, 31),
(15, 29),
(16, 33),
(19, 12),
(20, 27),
(21, 30),
(22, 24),
(23, 9),
(24, 35);

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
  KEY `IDX_B6BD307F19FB9489` (`user_mail_sent_id`),
  KEY `IDX_B6BD307F71EBDAF5` (`user_mail_received_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`id`, `user_mail_received_id`, `user_mail_sent_id`, `object`, `body`, `created`, `modified`, `viewed`) VALUES
(21, 9, 11, 'Réunion Parents/Professeurs', 'Bonjour FX,\r\n\r\nJe m\'adresse à vous car l\'on m\'a fait parvenir les dates de visites des parents pour les réunions de la semaine prochaines...\r\n\r\nPouvez-vous me dire quels sont vos jours de disponibilités ?\r\n\r\nCordialement,\r\nKelly.', '2020-06-25 09:00:00', NULL, 1),
(22, 11, 9, 'RE: Réunions Parents/Professeurs', 'Bonjour Kelly,\r\n\r\nJ\'ai prévenu il y a deux semaines à l\'assistante de direction que je ne peux pas participer à cette semaine de rencontre avec les parents.\r\n\r\nJe suis en formation cette semaine là.\r\n\r\nCordialement,\r\nFX.', '2020-06-25 11:00:00', NULL, 1),
(25, 9, 28, 'Cours sur les fonctions', 'Bonjour,\r\n\r\nJ\'ai oublié de noter les exercices à faire pour lundi..\r\n\r\nPouvez-vous me les écrire s\'il vous plait?\r\n\r\nMerci.\r\n', '2020-06-26 16:00:00', NULL, 1),
(26, 28, 9, 'Re: Cours sur les fonctions', 'Bonjour Florence,\r\n\r\nSi vous avez regardé le PDF \"études de fonctions\", les exercices à faire sont écrits à la fin de ce PDF..\r\n\r\nNe vous précipitez pas trop vite.\r\nTout est à votre disposition sur la plateforme...\r\n\r\nCordialement.', '2020-06-26 16:32:00', NULL, 0),
(27, 9, 14, 'Entrevue avec les collègues', 'Bonjour FX,\r\n\r\nSuite à l\'incident en classe de l\'autre fois, \r\nune entrevue s\'est organisé entre tous les professeurs de Première ES, le directeur et l’assistante de direction..\r\n\r\nJe pense que tu sera en formation, du coup, tu pourrais faire un compte-rendu sur word sur ton point de vue et je transmettrai.\r\n\r\nCordialement,\r\nGeorge.', '2020-06-25 07:00:00', NULL, 1),
(28, 14, 9, 'RE: Entrevue avec les collègues', 'D\'accord, je te passerai tous ça pour Lundi. Bonne journée !', '2020-06-26 06:44:00', NULL, 0);

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
('20200604153752', '2020-06-04 15:38:02'),
('20200604154037', '2020-06-04 15:40:45'),
('20200606220503', '2020-06-06 22:05:16'),
('20200607221037', '2020-06-07 22:11:01'),
('20200607222013', '2020-06-07 22:20:23');

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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id`, `formation_id`, `title`, `created`, `modified`) VALUES
(7, 5, 'Analyse', '2020-05-24 00:00:00', NULL),
(8, 5, 'Algèbre et géométrie', '2020-05-24 00:00:00', NULL),
(9, 5, 'Probabilité', '2020-05-24 00:00:00', NULL),
(10, 12, 'La phrase', '2020-05-24 00:00:00', NULL),
(11, 12, 'Le groupe nominal', '2020-05-24 00:00:00', NULL),
(12, 12, 'Le groupe verbal', '2020-05-24 00:00:00', NULL),
(13, 12, 'Les groupes prépositionnels', '2020-05-24 00:00:00', NULL),
(14, 12, 'Les temps', '2020-05-24 00:00:00', NULL),
(15, 11, 'La phrase', '2020-05-24 00:00:00', NULL),
(16, 11, 'Le groupe nominal', '2020-05-24 00:00:00', NULL),
(17, 11, 'Le groupe verbal', '2020-05-24 00:00:00', NULL),
(18, 11, 'Les temps', '2020-05-24 00:00:00', NULL),
(19, 15, 'La phrase', '2020-05-24 00:00:00', NULL),
(20, 15, 'Le groupe nominal', '2020-05-24 00:00:00', NULL),
(21, 15, 'Le groupe verbal', '2020-05-24 00:00:00', NULL),
(22, 15, 'Les temps', '2020-05-24 00:00:00', NULL),
(23, 20, 'Préparation au BAC', '2020-05-24 00:00:00', NULL),
(24, 8, 'Histoire', '2020-05-24 00:00:00', NULL),
(25, 8, 'Géographie', '2020-05-24 00:00:00', NULL),
(26, 6, 'Ondes et matière', '2020-06-08 00:00:00', NULL),
(27, 6, 'Temps, mouvement, évolution', '2020-06-08 00:00:00', NULL),
(28, 6, 'Structure et transformation de la matière', '2020-06-08 00:00:00', NULL),
(29, 6, 'Énergie, matière, rayonnement', '2020-06-08 00:00:00', NULL),
(30, 6, 'Les défis du XXIe siècle', '2020-06-08 00:00:00', NULL),
(31, 24, 'Le sujet', '2020-05-24 00:00:00', NULL),
(32, 24, 'La culture', '2020-05-24 00:00:00', NULL),
(33, 24, 'La raison et le réel', '2020-05-24 00:00:00', NULL),
(34, 24, 'La politique', '2020-05-24 00:00:00', NULL),
(35, 24, 'La morale', '2020-05-24 00:00:00', NULL),
(36, 24, 'Méthodologie de la Philosophie', '2020-05-24 00:00:00', NULL),
(37, 9, 'La question du Corpus', '2020-05-24 00:00:00', NULL),
(38, 19, 'Les grandes questions des économistes', '2020-05-24 00:00:00', NULL),
(39, 14, 'La phrase', '2020-05-24 00:00:00', NULL),
(40, 16, 'La phrase', '2020-05-24 00:00:00', NULL),
(41, 22, 'Histoire', '2020-05-24 00:00:00', NULL),
(42, 7, 'Étude des fonctions', '2020-05-24 00:00:00', NULL),
(43, 21, 'Préparation post BAC', '2020-05-24 00:00:00', NULL),
(44, 13, 'La phrase', '2020-05-24 00:00:00', NULL),
(45, 23, 'Représentation visuelle', '2020-05-24 00:00:00', NULL),
(46, 22, 'Géographie', '2020-05-24 00:00:00', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `professeur`
--

INSERT INTO `professeur` (`id`, `user_id`, `matter`) VALUES
(7, 9, 'Mathématiques (Première ES), Mathématiques (Terminale S)'),
(8, 10, 'Français (Première ES)'),
(9, 11, 'Physique-Chimie (Terminale S), Sciences (Première ES)'),
(12, 14, 'SES (Première ES)'),
(24, 29, 'Histoire/Géographie (Terminale S)'),
(25, 30, 'Histoire/Géographie (Première ES)'),
(26, 31, 'Allemand (Terminale S)'),
(27, 32, 'Éducation Sportive (Terminale S)'),
(28, 33, 'Anglais (Première ES)'),
(29, 34, 'Espagnol (Terminale S)'),
(30, 35, 'Éducation Sportive (Première ES)'),
(31, 36, 'Allemand (Première ES)'),
(32, 37, 'Anglais (Terminale S)'),
(33, 38, 'Espagnol (Première ES)'),
(35, 61, 'Philosophie (Terminale S)');

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
(8, 9),
(9, 6),
(9, 23),
(12, 19),
(24, 22),
(25, 8),
(26, 12),
(27, 20),
(28, 13),
(29, 15),
(30, 21),
(31, 14),
(32, 11),
(33, 16),
(35, 24);

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
(9, 1),
(9, 2),
(12, 1),
(24, 1),
(25, 2),
(26, 1),
(27, 1),
(28, 2),
(29, 1),
(30, 2),
(31, 2),
(32, 1),
(33, 2),
(35, 1);

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

DROP TABLE IF EXISTS `seance`;
CREATE TABLE IF NOT EXISTS `seance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) DEFAULT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  `title` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `support_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `professeur_id` int(11) NOT NULL,
  `finished` datetime NOT NULL,
  `formation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DF7DFD0EAFC2B591` (`module_id`),
  KEY `IDX_DF7DFD0EBCF5E72D` (`categorie_id`),
  KEY `IDX_DF7DFD0EBAB22EE9` (`professeur_id`),
  KEY `IDX_DF7DFD0E5200282E` (`formation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`id`, `module_id`, `categorie_id`, `title`, `number`, `body`, `published`, `created`, `modified`, `support_link`, `professeur_id`, `finished`, `formation_id`) VALUES
(4, 7, 1, 'Pourcentages', NULL, NULL, '2020-09-07 07:00:00', '2020-06-09 05:00:00', '2020-06-25 08:51:33', 'Pourcentage1ESL-5ef4497329bde.pdf', 7, '2020-07-02 00:00:00', 5),
(5, 8, 1, 'Chapitre 12 : Les nombres complexes', NULL, NULL, '2020-09-08 07:00:00', '2020-06-11 00:00:00', NULL, '12-complexes.pdf', 7, '2020-07-23 00:00:00', 5),
(6, 9, 1, 'Chapitre 15: Probabilités conditionnelles', NULL, NULL, '2020-09-09 07:00:00', '2020-06-12 00:00:00', NULL, '15-probabilites-conditionnelles.pdf', 7, '2020-08-19 00:00:00', 5),
(7, 10, 1, 'Construction d\'une phrase', NULL, NULL, '2020-09-07 07:00:00', '2020-06-13 00:00:00', NULL, '01-allemand-la phrase.pdf', 26, '2020-07-23 00:00:00', 12),
(8, 15, 1, 'Les constructions causatives', NULL, NULL, '2020-09-07 07:00:00', '2020-05-24 00:00:00', NULL, '02-les-constructions-causatives.pdf', 32, '2020-07-17 00:00:00', 11),
(9, 23, 1, 'Épreuves sport BAC', NULL, NULL, '2020-09-07 07:00:00', '2020-05-24 00:00:00', NULL, 'epreuves_bac_sport.pdf', 27, '2021-02-25 00:00:00', 20),
(10, 24, 1, 'L\'historien et les mémoires de la Seconde Guerre mondiale en France', NULL, NULL, '2020-09-07 07:00:00', '2020-05-24 00:00:00', NULL, 'Lhistorien-et-les-mémoires-de-la-Seconde-Guerre-mondiale-en-France.pdf', 24, '2020-08-19 00:00:00', 8),
(11, 25, 1, 'Chapitre 1 : des cartes pour comprendre le monde', NULL, NULL, '2020-09-07 07:00:00', '2020-06-09 00:00:00', NULL, 'Chapitre_1_des_cartes_pour_comprendre_le_monde.pdf', 24, '2020-07-17 00:00:00', 8),
(12, 26, 1, 'Différentes ondes et matière', NULL, NULL, '2020-09-07 07:00:00', '2020-06-08 00:00:00', NULL, 'chapitre1_ondes_et_matieres.pdf', 9, '2020-07-16 00:00:00', 6),
(13, 19, 1, 'les bases en Espagnol', NULL, NULL, '2020-09-07 07:00:00', '2020-06-09 00:00:00', NULL, 'bases_espagnol.pdf', 29, '2020-07-23 00:00:00', 15),
(14, 31, 6, 'Mise en pratique', NULL, NULL, '2020-09-07 07:00:00', '2020-06-10 00:00:00', NULL, 'philo_test.pdf', 35, '2020-07-23 00:00:00', 24),
(15, 37, 1, 'La question du corpus', NULL, NULL, '2020-09-07 07:00:00', '2020-06-12 00:00:00', NULL, 'La_question_de_corpus_cours_et_exemple.pdf', 8, '2020-07-15 00:00:00', 9),
(16, 38, 4, 'Les grandes questions que se posent les économistes', NULL, NULL, '2020-09-07 07:00:00', '2020-06-18 00:00:00', NULL, 'Les-grandes-questions.pdf', 12, '2020-07-29 00:00:00', 19),
(17, 41, 1, 'Croissance et mondialisation depuis le milieu du XIXe siecle', NULL, NULL, '2020-09-07 07:00:00', '2020-06-10 00:00:00', NULL, 'croissance_mondialisation.pdf', 25, '2020-07-22 00:00:00', 22),
(18, 46, 1, 'Approche des territoires du quotidien', NULL, NULL, '2020-09-07 07:00:00', '2020-06-10 00:00:00', NULL, 'Geo_ApprochesTerritoiresQuotidien.pdf', 25, '2020-07-22 00:00:00', 22),
(19, 42, 1, 'Étude de fonctions', NULL, NULL, '2020-09-07 08:00:00', '2020-06-10 00:00:00', '2020-06-18 22:49:09', 'ANALY5-5eebd344a2111.pdf', 7, '2020-07-23 00:00:00', 7),
(20, 45, 1, 'La représentation visuelle', NULL, NULL, '2020-09-07 08:00:00', '2020-06-10 00:00:00', NULL, '1lrepres_visuelle.pdf', 9, '2020-07-22 00:00:00', 23),
(21, 39, 1, 'Construction d\'une phrase', NULL, NULL, '2020-09-07 07:00:00', '2020-06-10 00:00:00', NULL, '01-allemand-la phrase.pdf', 31, '2020-07-23 00:00:00', 14),
(22, 40, 1, 'Bases en espagnol', NULL, NULL, '2020-09-07 07:00:00', '2020-06-10 00:00:00', NULL, 'bases_espagnol.pdf', 33, '2020-07-15 00:00:00', 16),
(23, 44, 1, 'Les constructions causatives', NULL, NULL, '2020-09-07 07:00:00', '2020-06-10 00:00:00', NULL, '02-les-constructions-causatives.pdf', 28, '2020-07-23 00:00:00', 13),
(24, 43, 1, 'Épreuves sport BAC', NULL, NULL, '2020-09-07 07:00:00', '2020-06-09 00:00:00', NULL, 'epreuves_bac_sport.pdf', 30, '2021-07-22 00:00:00', 21);

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
(1, 'Terminale S', '2020-09-07 00:00:00', '2021-07-02 00:00:00', '2020-05-20 00:00:00', '2020-05-20 00:00:00'),
(2, 'Première ES', '2020-09-07 00:00:00', '2021-07-02 00:00:00', '2020-05-20 00:00:00', '2020-05-20 00:00:00');

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
(1, 12),
(1, 24),
(1, 26),
(1, 27),
(1, 29),
(1, 32),
(1, 35),
(2, 7),
(2, 8),
(2, 9),
(2, 25),
(2, 28),
(2, 30),
(2, 31),
(2, 33);

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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `professeur_id`, `parameter_id`, `email`, `username`, `roles`, `password`, `note`, `created_at`, `updated_at`) VALUES
(1, NULL, 41, 'cantali.lycee@codesk.com', 'cantali78', 'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}', '$argon2id$v=19$m=65536,t=4,p=1$NVljdmNmRW5UbDZ1Ny5VRA$IgtuH5j+1Ar3OoxbKKECuc5HTSuKGtUUwTlYhdOYJp0', NULL, '2020-05-20 19:22:26', NULL),
(3, NULL, 3, 'hugo.lycee@codesk.com', 'hugo7', 'a:1:{i:0;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$NVljdmNmRW5UbDZ1Ny5VRA$IgtuH5j+1Ar3OoxbKKECuc5HTSuKGtUUwTlYhdOYJp0', 'eleve', '2020-05-31 22:12:32', NULL),
(4, NULL, 4, 'tulipe.peo@codesk.com', 'tulipe8', 'a:1:{i:0;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$NVljdmNmRW5UbDZ1Ny5VRA$IgtuH5j+1Ar3OoxbKKECuc5HTSuKGtUUwTlYhdOYJp0', 'eleve', '2020-05-31 22:12:32', NULL),
(9, 7, 9, 'xavier.lycee@codesk.com', 'francois489', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$NVA4UFM4Wm10bncwWkpNbw$p2gmx43846XTn4UX9/iHtzEG/TpEH3oa/HjIwjl3xo4', NULL, '2020-05-24 17:43:02', '2020-06-25 08:57:57'),
(10, 8, 10, 'lafeuille.lycee@codesk.com', 'jeanmi74', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$a3p1S0xvNUlrblVNVDRHdQ$eBP83EXD1OyYIEhTP8KXkm+fDz1KOef5R0SkvjGV0YE', 'professeur', '2020-05-26 15:08:59', NULL),
(11, 9, 11, 'smith.lycee@codesk.com', 'smithkelly7', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$Z3dVRnpySTh5VzlzaGc0Wg$0rGH3ey+ILeuUiD2tA1WTPS2H3gX58RTmKZWGkA7BRU', 'professeur', '2020-05-26 15:25:07', '2020-06-03 21:19:30'),
(14, 12, 14, 'louvain.lycee@codesk.com', 'louvainG', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$RXZRemlUYXA3L2x1eWhnSw$OUcYsEVCMbpFrRqbohW406yFlfQdEsvInaQTaoOVS/8', 'professeur', '2020-05-31 22:12:32', '2020-06-04 12:00:11'),
(15, NULL, 16, 'pierre.lycee@codesk.com', 'pierre89', 'a:1:{i:0;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'eleve', '2020-05-31 22:12:32', NULL),
(16, NULL, 17, 'pholien.lycee@codesk.com', 'pholienL8', 'a:1:{i:0;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'eleve', '2020-05-31 22:12:32', NULL),
(17, NULL, 18, 'dean.lycee@codesk.com', 'deanP7', 'a:1:{i:0;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'eleve', '2020-05-31 22:12:32', NULL),
(18, NULL, 29, 'raph.lycee@codesk.com', 'raph', 'a:1:{i:0;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'eleve', '2020-05-31 22:12:32', NULL),
(19, NULL, 35, 'sam.lycee@codesk.com', 'sami4', 'a:1:{i:0;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'eleve', '2020-05-31 22:12:32', NULL),
(20, NULL, 38, 'vincent.lycee@codesk.com', 'vince', 'a:1:{i:0;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'eleve', '2020-05-31 22:12:32', NULL),
(21, NULL, 39, 'kevin.lycee@codesk.com', 'kev8', 'a:1:{i:0;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'eleve', '2020-05-31 22:12:32', NULL),
(22, NULL, 15, 'juliette.lycee@codesk.com', 'juliette5', 'a:1:{i:0;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'eleve', '2020-05-31 22:12:32', NULL),
(23, NULL, 19, 'sophie.lycee@codesk.com', 'sophie8', 'a:1:{i:0;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'eleve', '2020-05-31 22:12:32', NULL),
(24, NULL, 20, 'becky.lycee@codesk.com', 'becky7', 'a:1:{i:0;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'eleve', '2020-05-31 22:12:32', NULL),
(25, NULL, 26, 'olive.lycee@codesk.com', 'olive56', 'a:1:{i:0;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'eleve', '2020-05-31 22:12:32', NULL),
(26, NULL, 34, 'morgane.lycee@codesk.com', 'morganeM7', 'a:1:{i:0;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'eleve', '2020-05-31 22:12:32', NULL),
(27, NULL, 36, 'magalie.lycee@codesk.com', 'magalie89', 'a:1:{i:0;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'eleve', '2020-05-31 22:12:32', NULL),
(28, NULL, 37, 'florence.lycee@codesk.com', 'flo74', 'a:1:{i:0;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'eleve', '2020-05-31 22:12:32', NULL),
(29, 24, 21, 'moss.lycee@codesk.com', 'phillmoss8', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'professeur', '2020-05-31 22:12:32', NULL),
(30, 25, 28, 'joubile.lycee@codesk.com', 'mhenry56', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'professeur', '2020-05-24 17:43:02', NULL),
(31, 26, 32, 'descartes.lycee@codesk.com', 'reneP5', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'professeur', '2020-05-24 17:43:02', NULL),
(32, 27, 33, 'jauget.lycee@codesk.com', 'yves52', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'professeur', '2020-05-24 17:43:02', NULL),
(33, 28, 22, 'pierreb.lycee@codesk.com', 'berth52', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'professeur', '2020-05-24 17:43:02', NULL),
(34, 29, 23, 'cruzm.lycee@codesk.com', 'maryline2', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'professeur', '2020-05-19 22:12:32', NULL),
(35, 30, 24, 'lafontl.lycee@codesk.com', 'laure21', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'professeur', '2020-05-31 22:12:32', NULL),
(36, 31, 25, 'dupresmj.lycee@codesk.com', 'mariejeanne01', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'professeur', '2020-05-31 22:12:32', NULL),
(37, 32, 27, 'keevesg.lycee@codesk.com', 'geraldine06', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'professeur', '2020-05-31 22:12:32', NULL),
(38, 33, 30, 'laurenceternan.lycee@codesk.com', 'laurence07', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'professeur', '2020-05-31 22:12:32', NULL),
(61, 35, 40, 'keys.lycee@codesk.com', 'paulkeys7', 'a:2:{i:0;s:10:\"ROLE_ADMIN\";i:1;s:9:\"ROLE_USER\";}', '$argon2id$v=19$m=65536,t=4,p=1$U2JnazZBUThlOUliSWFrdg$FV8eugUecQW8tsNHkbl4ZaOzVpPbead/BfPNFGr8jP0', 'professeur', '2020-05-20 19:22:26', NULL);

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
  ADD CONSTRAINT `FK_DF7DFD0E5200282E` FOREIGN KEY (`formation_id`) REFERENCES `formation` (`id`),
  ADD CONSTRAINT `FK_DF7DFD0EAFC2B591` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`),
  ADD CONSTRAINT `FK_DF7DFD0EBAB22EE9` FOREIGN KEY (`professeur_id`) REFERENCES `professeur` (`id`),
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
