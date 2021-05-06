-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 06 mai 2021 à 20:17
-- Version du serveur :  8.0.23-0ubuntu0.20.04.1
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bibliotheque_db`
--
CREATE DATABASE IF NOT EXISTS `bibliotheque_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bibliotheque_db`;

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `id` smallint NOT NULL,
  `auteur` varchar(50) DEFAULT NULL,
  `titre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`id`, `auteur`, `titre`) VALUES
(1, 'Daniel Pennac', 'Au bonheur des ogres'),
(2, 'Daniel Pennac', 'La Fée Carabine'),
(3, 'Daniel Pennac', 'Comme un roman'),
(4, 'Daniel Pennac', 'La Petite marchande de prose'),
(5, 'Jacqueline Harpman', 'Le Bonheur est dans le crime'),
(6, 'Jacqueline Harpman', 'La Dormition des amants'),
(7, 'Jacqueline Harpman', 'La Plage d\'Ostende'),
(8, 'Jacqueline Harpman', 'Histoire de Jenny'),
(9, 'Terry Pratchett', 'Les Petits Dieux'),
(10, 'Terry Pratchett', 'Le Cinquième éléphant'),
(11, 'Terry Pratchett', 'La Vérité'),
(12, 'Terry Pratchett', 'Le Dernier héros'),
(13, 'Terry Goodkind', 'Le Temple des vents'),
(14, 'Jules Verne', 'De la Terre à la Lune'),
(15, 'Jules Verne', 'Voyage au centre de la Terre'),
(16, 'Henri-Pierre Roché', 'Jules et Jim');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `livre` ADD FULLTEXT KEY `ind_full_titre` (`titre`);
ALTER TABLE `livre` ADD FULLTEXT KEY `ind_full_au` (`auteur`);
ALTER TABLE `livre` ADD FULLTEXT KEY `ind_full_titre_au` (`titre`,`auteur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `livre`
--
ALTER TABLE `livre`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Base de données : `elevage`
--
CREATE DATABASE IF NOT EXISTS `elevage` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `elevage`;

-- --------------------------------------------------------

--
-- Structure de la table `Animal`
--

CREATE TABLE `Animal` (
  `id` smallint UNSIGNED NOT NULL,
  `sexe` char(1) DEFAULT NULL,
  `date_naissance` datetime NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `commentaires` text,
  `espece_id` smallint UNSIGNED NOT NULL,
  `race_id` smallint UNSIGNED DEFAULT NULL,
  `mere_id` smallint UNSIGNED DEFAULT NULL,
  `pere_id` smallint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Animal`
--

INSERT INTO `Animal` (`id`, `sexe`, `date_naissance`, `nom`, `commentaires`, `espece_id`, `race_id`, `mere_id`, `pere_id`) VALUES
(1, 'M', '2010-04-05 13:43:00', 'Rox', 'Mordille beaucoup', 1, 1, 18, 22),
(2, NULL, '2010-03-24 02:23:00', 'Roucky', NULL, 2, NULL, 40, 30),
(3, 'F', '2010-09-13 15:02:00', 'Schtroumpfette', NULL, 2, 4, 41, 31),
(4, 'F', '2009-08-03 05:12:00', NULL, 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(5, NULL, '2010-10-03 16:44:00', 'Choupi', 'Né sans oreille gauche', 2, NULL, NULL, NULL),
(6, 'F', '2009-06-13 08:17:00', 'Bobosse', 'Carapace bizarre', 3, NULL, NULL, NULL),
(7, 'F', '2008-12-06 05:18:00', 'Caroline', NULL, 1, 2, NULL, NULL),
(8, 'M', '2008-09-11 15:38:00', 'Bagherra', NULL, 2, 5, NULL, NULL),
(9, NULL, '2010-08-23 05:18:00', NULL, 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(10, 'M', '2010-07-21 15:41:00', 'Bobo', NULL, 1, NULL, 7, 21),
(11, 'F', '2008-02-20 15:45:00', 'Canaille', NULL, 1, NULL, NULL, NULL),
(12, 'F', '2009-05-26 08:54:00', 'Cali', NULL, 1, 2, NULL, NULL),
(13, 'F', '2007-04-24 12:54:00', 'Rouquine', NULL, 1, 1, NULL, NULL),
(14, 'F', '2009-05-26 08:56:00', 'Fila', NULL, 1, 2, NULL, NULL),
(15, 'F', '2008-02-20 15:47:00', 'Anya', NULL, 1, NULL, NULL, NULL),
(16, 'F', '2009-05-26 08:50:00', 'Louya', NULL, 1, NULL, NULL, NULL),
(17, 'F', '2008-03-10 13:45:00', 'Welva', NULL, 1, NULL, NULL, NULL),
(18, 'F', '2007-04-24 12:59:00', 'Zira', NULL, 1, 1, NULL, NULL),
(19, 'F', '2009-05-26 09:02:00', 'Java', NULL, 1, 2, NULL, NULL),
(20, 'M', '2007-04-24 12:45:00', 'Balou', NULL, 1, 1, NULL, NULL),
(21, 'F', '2008-03-10 13:43:00', 'Pataude', NULL, 1, NULL, NULL, NULL),
(22, 'M', '2007-04-24 12:42:00', 'Bouli', NULL, 1, 1, NULL, NULL),
(24, 'M', '2007-04-12 05:23:00', 'Cartouche', NULL, 1, NULL, NULL, NULL),
(25, 'M', '2006-05-14 15:50:00', 'Zambo', NULL, 1, 1, NULL, NULL),
(26, 'M', '2006-05-14 15:48:00', 'Samba', NULL, 1, 1, NULL, NULL),
(27, 'M', '2008-03-10 13:40:00', 'Moka', NULL, 1, NULL, NULL, NULL),
(28, 'M', '2006-05-14 15:40:00', 'Pilou', NULL, 1, 1, NULL, NULL),
(29, 'M', '2009-05-14 06:30:00', 'Fiero', NULL, 2, 3, NULL, NULL),
(30, 'M', '2007-03-12 12:05:00', 'Zonko', NULL, 2, 5, NULL, NULL),
(31, 'M', '2008-02-20 15:45:00', 'Filou', NULL, 2, 4, NULL, NULL),
(32, 'M', '2009-07-26 11:52:00', 'Spoutnik', NULL, 3, NULL, 52, NULL),
(33, 'M', '2006-05-19 16:17:00', 'Caribou', NULL, 2, 4, NULL, NULL),
(34, 'M', '2008-04-20 03:22:00', 'Capou', NULL, 2, 5, NULL, NULL),
(35, 'M', '2006-05-19 16:56:00', 'Raccou', 'Pas de queue depuis la naissance', 2, 4, NULL, NULL),
(36, 'M', '2009-05-14 06:42:00', 'Boucan', NULL, 2, 3, NULL, NULL),
(37, 'F', '2006-05-19 16:06:00', 'Callune', NULL, 2, 8, NULL, NULL),
(38, 'F', '2009-05-14 06:45:00', 'Boule', NULL, 2, 3, NULL, NULL),
(39, 'F', '2008-04-20 03:26:00', 'Zara', NULL, 2, 5, NULL, NULL),
(40, 'F', '2007-03-12 12:00:00', 'Milla', NULL, 2, 5, NULL, NULL),
(41, 'F', '2006-05-19 15:59:00', 'Feta', NULL, 2, 4, NULL, NULL),
(42, 'F', '2008-04-20 03:20:00', 'Bilba', 'Sourde de l\'oreille droite à 80%', 2, 5, NULL, NULL),
(43, 'F', '2007-03-12 11:54:00', 'Cracotte', NULL, 2, 5, NULL, NULL),
(44, 'F', '2006-05-19 16:16:00', 'Cawette', NULL, 2, 8, NULL, NULL),
(45, 'F', '2007-04-01 18:17:00', 'Nikki', 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(46, 'F', '2009-03-24 08:23:00', 'Tortilla', 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(47, 'F', '2009-03-26 01:24:00', 'Scroupy', 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(48, 'F', '2006-03-15 14:56:00', 'Lulla', 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(49, 'F', '2008-03-15 12:02:00', 'Dana', 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(50, 'F', '2009-05-25 19:57:00', 'Cheli', 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(51, 'F', '2007-04-01 03:54:00', 'Chicaca', 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(52, 'F', '2006-03-15 14:26:00', 'Redbul', 'Insomniaque', 3, NULL, NULL, NULL),
(54, 'M', '2008-03-16 08:20:00', 'Bubulle', 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(55, 'M', '2008-03-15 18:45:00', 'Relou', 'Surpoids', 3, NULL, NULL, NULL),
(56, 'M', '2009-05-25 18:54:00', 'Bulbizard', 'Bestiole avec une carapace très dure', 3, NULL, NULL, NULL),
(57, 'M', '2007-03-04 19:36:00', 'Safran', 'Coco veut un gâteau !', 4, NULL, NULL, NULL),
(58, 'M', '2008-02-20 02:50:00', 'Gingko', 'Coco veut un gâteau !', 4, NULL, NULL, NULL),
(59, 'M', '2009-03-26 08:28:00', 'Bavard', 'Coco veut un gâteau !', 4, NULL, NULL, NULL),
(60, 'F', '2009-03-26 07:55:00', 'Parlotte', 'Coco veut un gâteau !', 4, NULL, NULL, NULL),
(61, 'M', '2010-11-09 00:00:00', 'Yoda', NULL, 2, 5, NULL, NULL),
(62, 'M', '2010-11-05 00:00:00', 'Pipo', NULL, 1, 9, NULL, NULL),
(66, 'F', '2008-02-01 02:25:00', 'Momy', NULL, 5, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `animal_domestique`
--

CREATE TABLE `animal_domestique` (
  `id` smallint UNSIGNED NOT NULL,
  `espece` varchar(40) NOT NULL,
  `sexe` char(1) DEFAULT NULL,
  `date_naissance` datetime NOT NULL,
  `nom` varchar(30) DEFAULT NULL,
  `commentaires` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Espece`
--

CREATE TABLE `Espece` (
  `id` smallint UNSIGNED NOT NULL,
  `nom_courant` varchar(40) NOT NULL,
  `nom_latin` varchar(40) NOT NULL,
  `description` text,
  `prix` decimal(7,2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `Espece`
--

INSERT INTO `Espece` (`id`, `nom_courant`, `nom_latin`, `description`, `prix`) VALUES
(1, 'Chien', 'Canis canis', 'Bestiole à quatre pattes qui aime les caresses et tire souvent la langue', '200.00'),
(2, 'Chat', 'Felis silvestris', 'Bestiole à quatre pattes qui saute très haut et grimpe aux arbres', '150.00'),
(3, 'Tortue d\'Hermann', 'Testudo hermanni', 'Bestiole avec une carapace très dure', '140.00'),
(4, 'Perroquet amazone', 'Alipiopsitta xanthops', 'Joli oiseau parleur vert et jaune', '700.00'),
(5, 'Rat brun', 'Rattus norvegicus', 'Petite bestiole avec de longues moustaches et une longue queue sans poils', '10.00');

-- --------------------------------------------------------

--
-- Structure de la table `Race`
--

CREATE TABLE `Race` (
  `id` smallint UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL,
  `espece_id` smallint UNSIGNED NOT NULL,
  `description` text,
  `prix` decimal(7,2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `Race`
--

INSERT INTO `Race` (`id`, `nom`, `espece_id`, `description`, `prix`) VALUES
(1, 'Berger allemand', 1, 'Chien sportif et élégant au pelage dense, noir-marron-fauve, noir ou gris.', '485.00'),
(2, 'Berger blanc suisse', 1, 'Petit chien au corps compact, avec des pattes courtes mais bien proportionnées et au pelage tricolore ou bicolore.', '935.00'),
(3, 'Singapura', 2, 'Chat de petite taille aux grands yeux en amandes.', '985.00'),
(4, 'Bleu russe', 2, 'Chat aux yeux verts et à la robe épaisse et argentée.', '835.00'),
(5, 'Maine coon', 2, 'Chat de grande taille, à poils mi-longs.', '735.00'),
(7, 'Sphynx', 2, 'Chat sans poils.', '1235.00'),
(8, 'Nebelung', 2, 'Chat bleu russe, mais avec des poils longs...', '985.00'),
(9, 'Rottweiller', 1, 'Chien d\'apparence solide, bien musclé, à la robe noire avec des taches feu bien délimitées.', '600.00');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Animal`
--
ALTER TABLE `Animal`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ind_uni_nom_espece_id` (`nom`,`espece_id`),
  ADD KEY `fk_race_id` (`race_id`),
  ADD KEY `fk_espece_id` (`espece_id`),
  ADD KEY `fk_mere_id` (`mere_id`),
  ADD KEY `fk_pere_id` (`pere_id`);

--
-- Index pour la table `animal_domestique`
--
ALTER TABLE `animal_domestique`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ind_uni_nom_espece` (`nom`,`espece`),
  ADD KEY `ind_date_naissance` (`date_naissance`),
  ADD KEY `ind_nom` (`nom`(10));

--
-- Index pour la table `Espece`
--
ALTER TABLE `Espece`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom_latin` (`nom_latin`);

--
-- Index pour la table `Race`
--
ALTER TABLE `Race`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_race_espece_id` (`espece_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Animal`
--
ALTER TABLE `Animal`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT pour la table `animal_domestique`
--
ALTER TABLE `animal_domestique`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Espece`
--
ALTER TABLE `Espece`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `Race`
--
ALTER TABLE `Race`
  MODIFY `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Animal`
--
ALTER TABLE `Animal`
  ADD CONSTRAINT `fk_espece_id` FOREIGN KEY (`espece_id`) REFERENCES `Espece` (`id`),
  ADD CONSTRAINT `fk_mere_id` FOREIGN KEY (`mere_id`) REFERENCES `Animal` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_pere_id` FOREIGN KEY (`pere_id`) REFERENCES `Animal` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_race_id` FOREIGN KEY (`race_id`) REFERENCES `Race` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `Race`
--
ALTER TABLE `Race`
  ADD CONSTRAINT `fk_race_espece_id` FOREIGN KEY (`espece_id`) REFERENCES `Espece` (`id`) ON DELETE CASCADE;
--
-- Base de données : `erda_siteweb`
--
CREATE DATABASE IF NOT EXISTS `erda_siteweb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `erda_siteweb`;

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` int NOT NULL,
  `pseudo` varchar(55) NOT NULL,
  `prenom` varchar(55) NOT NULL,
  `mail` varchar(55) NOT NULL,
  `password` varchar(55) NOT NULL,
  `sex` varchar(55) NOT NULL,
  `date_connect` datetime NOT NULL,
  `avatar` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `pseudo`, `prenom`, `mail`, `password`, `sex`, `date_connect`, `avatar`) VALUES
(3, 'mouda ', 'mouda erda', 'mouda@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'homme', '2021-04-15 23:36:39', NULL),
(4, 'toto', 'toto tota', 'toto@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'femme', '2021-04-15 23:58:51', NULL),
(5, 'maha ', 'maha Z', 'maha@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'femme', '2021-04-17 11:31:03', NULL),
(6, 'mht', 'abatcha', 'mht@gmail.com', '11934d224d605bdbea519d5dec2d065ce803d5f9', 'homme', '2021-04-17 12:13:39', NULL);

--
-- Déclencheurs `contact`
--
DELIMITER $$
CREATE TRIGGER `anuule_compteur_tr` AFTER DELETE ON `contact` FOR EACH ROW update visiteur
set compteur=compteur-1
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `compteur_tr` BEFORE INSERT ON `contact` FOR EACH ROW update visiteur set compteur=compteur+ 1
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `forum`
--

CREATE TABLE `forum` (
  `id_m` int NOT NULL,
  `id_contact` int NOT NULL,
  `titre` varchar(55) NOT NULL,
  `contenu` text NOT NULL,
  `date_m` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `forum`
--

INSERT INTO `forum` (`id_m`, `id_contact`, `titre`, `contenu`, `date_m`) VALUES
(1, 3, 'Mon langage c\'est php', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ', '2021-04-16 14:57:11'),
(2, 3, 'hello', 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', '2021-04-16 17:53:20'),
(3, 3, 'hello', 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', '2021-04-16 17:54:50'),
(4, 3, 'hello', 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', '2021-04-16 17:56:22'),
(5, 3, 'hello', 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', '2021-04-16 18:02:14'),
(6, 6, 'developpement web', 'je suis tres ravi de travail avecc vous', '2021-04-17 12:18:27');

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE `visiteur` (
  `compteur` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `visiteur`
--

INSERT INTO `visiteur` (`compteur`) VALUES
(2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`id_m`),
  ADD KEY `fk_id_contact` (`id_contact`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `forum`
--
ALTER TABLE `forum`
  MODIFY `id_m` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `forum`
--
ALTER TABLE `forum`
  ADD CONSTRAINT `fk_id_contact` FOREIGN KEY (`id_contact`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de données : `exemple_db`
--
CREATE DATABASE IF NOT EXISTS `exemple_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `exemple_db`;

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `matricule` varchar(55) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `date_naiss` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`matricule`);
--
-- Base de données : `exercices_db`
--
CREATE DATABASE IF NOT EXISTS `exercices_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `exercices_db`;

-- --------------------------------------------------------

--
-- Structure de la table `salles`
--

CREATE TABLE `salles` (
  `num` int NOT NULL,
  `capa` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `salles`
--

INSERT INTO `salles` (`num`, `capa`) VALUES
(317, 50),
(318, 60),
(319, 45),
(320, 20);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `salles`
--
ALTER TABLE `salles`
  ADD PRIMARY KEY (`num`);
--
-- Base de données : `E_commerce`
--
CREATE DATABASE IF NOT EXISTS `E_commerce` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `E_commerce`;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` smallint NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(55) DEFAULT NULL,
  `date_nassance` datetime NOT NULL,
  `ville` varchar(55) DEFAULT NULL,
  `point` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom`, `prenom`, `date_nassance`, `ville`, `point`) VALUES
(1, 'ali', 'baba', '2010-04-05 13:43:00', 'VILLE', 2),
(2, 'moda', 'erda', '1996-04-05 13:43:00', 'TINE', 0);

--
-- Déclencheurs `client`
--
DELIMITER $$
CREATE TRIGGER `ajout_client` BEFORE INSERT ON `client` FOR EACH ROW set new.ville=upper(new.ville)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_com` smallint NOT NULL,
  `id_client` smallint NOT NULL,
  `nom_comm` varchar(55) NOT NULL,
  `prix_comm` double NOT NULL,
  `date_comm` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déclencheurs `commande`
--
DELIMITER $$
CREATE TRIGGER `point_fidelite` AFTER INSERT ON `commande` FOR EACH ROW update client
set point=point+1
where client.id=new.id_client
$$
DELIMITER ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_com`),
  ADD KEY `fk_id_client` (`id_client`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_com` smallint NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_id_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON DELETE CASCADE;
--
-- Base de données : `legume_db`
--
CREATE DATABASE IF NOT EXISTS `legume_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `legume_db`;

-- --------------------------------------------------------

--
-- Structure de la table `assocRegLeg`
--

CREATE TABLE `assocRegLeg` (
  `numReg` int NOT NULL,
  `numLeg` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Legume`
--

CREATE TABLE `Legume` (
  `numLeg` int NOT NULL,
  `nom` varchar(55) NOT NULL,
  `couleur` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Region`
--

CREATE TABLE `Region` (
  `numReg` int NOT NULL,
  `nom` varchar(55) NOT NULL,
  `nbrPop` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Region`
--

INSERT INTO `Region` (`numReg`, `nom`, `nbrPop`) VALUES
(1, 'ADAMOUA', 1000000);

--
-- Déclencheurs `Region`
--
DELIMITER $$
CREATE TRIGGER `nom_maj` BEFORE INSERT ON `Region` FOR EACH ROW SET NEW.nom=UPPER(NEW.nom)
$$
DELIMITER ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `assocRegLeg`
--
ALTER TABLE `assocRegLeg`
  ADD PRIMARY KEY (`numReg`,`numLeg`),
  ADD KEY `fk_numLeg` (`numLeg`),
  ADD KEY `assoc_index` (`numReg`,`numLeg`);

--
-- Index pour la table `Legume`
--
ALTER TABLE `Legume`
  ADD PRIMARY KEY (`numLeg`);

--
-- Index pour la table `Region`
--
ALTER TABLE `Region`
  ADD PRIMARY KEY (`numReg`),
  ADD KEY `num_index` (`numReg`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Legume`
--
ALTER TABLE `Legume`
  MODIFY `numLeg` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Region`
--
ALTER TABLE `Region`
  MODIFY `numReg` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `assocRegLeg`
--
ALTER TABLE `assocRegLeg`
  ADD CONSTRAINT `fk_numLeg` FOREIGN KEY (`numLeg`) REFERENCES `Legume` (`numLeg`),
  ADD CONSTRAINT `fk_numReg` FOREIGN KEY (`numReg`) REFERENCES `Region` (`numReg`);
--
-- Base de données : `profil_tp`
--
CREATE DATABASE IF NOT EXISTS `profil_tp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `profil_tp`;

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE `contact` (
  `id` smallint NOT NULL,
  `pseudo` varchar(55) NOT NULL,
  `matricule` varchar(55) NOT NULL,
  `parcours` varchar(55) NOT NULL,
  `mail` varchar(55) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sex` varchar(55) NOT NULL,
  `date_ins` datetime NOT NULL,
  `avatar` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `pseudo`, `matricule`, `parcours`, `mail`, `password`, `sex`, `date_ins`, `avatar`) VALUES
(1, 'mouda', '18233FS', 'L3IN', 'mouda@gmail.com', '7b52009b64fd0a2a49e6d8a939753077792b0554', 'M', '2021-05-06 07:14:54', NULL),
(2, 'Mouda', '18A881FS', 'L3IN', 'mht@gmail.com', '7b52009b64fd0a2a49e6d8a939753077792b0554', 'M', '2021-05-06 15:24:02', NULL),
(3, 'Atim', '18B33FS', 'L3BIO', 'atim@gmail.com', '7b52009b64fd0a2a49e6d8a939753077792b0554', 'M', '2021-05-06 18:04:15', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
