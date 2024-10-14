-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 14 oct. 2024 à 21:28
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `test_synexta`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `cp` varchar(10) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `portable` varchar(20) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `raison_sociale` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id_client`, `adresse`, `cp`, `ville`, `telephone`, `portable`, `email`, `raison_sociale`) VALUES
(10000001, '5 RUE DES LILAS', '75001', 'PARIS', NULL, '0612345678', 'pierre.dupont@example.com', 'DUPONT ET CIE'),
(10000002, '10 AVENUE DES CHAMPS', '75008', 'PARIS', '0145678901', NULL, 'marie.durand@example.com,contact@example.com, mira@ann.com', 'DURAND SARL'),
(10000003, '20 RUE DE LA PAIX', '69001', 'LYON', '0478901234', NULL, 'pierre.dupont@example.com', 'PAIX LYON'),
(10000004, '15 BOULEVARD DE LA LIBERTÉ', '33000', 'BORDEAUX', NULL, '0623456789', 'pierre.dupont@example.com,info@liberte.fr,EMAIL5@example.com', 'LIBERTÉ BORDEAUX'),
(10000005, '8 PLACE DE LA BOURSE', '34000', 'MONTPELLIER', '0467890123', NULL, 'alexxx@gmail.com', 'BOURSE MONTPELLIER'),
(10000006, '12 RUE DU SOLEIL', '67000', 'STRASBOURG', NULL, '0634567890', 'soleil@strasbourg.fr', 'SOLEIL STRASBOURG'),
(10000007, '3 RUE DES VIGNES', '44000', 'NANTES', '0256789012', NULL, 'contact@vignes-nantes.fr', 'VIGNES NANTES'),
(10000008, '9 RUE DE LA MER', '13000', 'MARSEILLE', NULL, '0645678901', 'mer@marseille.fr,contact@mer-marseille.fr', 'MER MARSEILLE'),
(10000009, '7 AVENUE DES FLEURS', '67000', 'STRASBOURG', '0389012345', NULL, 'fleurs@strasbourg.fr', 'FLEURS STRASBOURG'),
(10000010, '11 BOULEVARD DES ARTS', '31000', 'TOULOUSE', NULL, '0656789012', 'email5@example.com', 'ARTS TOULOUSE'),
(10000011, '6 RUE DE LA SCIENCE', '14000', 'CAEN', '0234567890', NULL, 'science@caen.fr', 'SCIENCE CAEN'),
(10000012, '13 RUE DE L\'HORIZON', '37000', 'TOURS', NULL, '0667890123', 'horizon@tours.fr,horizon2@tours.fr', 'HORIZON TOURS'),
(10000013, '4 PLACE DE L\'ÉGLISE', '67000', 'STRASBOURG', '0367890123', NULL, 'eglise@strasbourg.fr', 'ÉGLISE STRASBOURG'),
(10000014, '17 RUE DE LA GARE', '59000', 'LILLE', NULL, '0678901234', 'gare@lille.fr', 'GARE LILLE'),
(10000015, '18 RUE DES ÉCOLES', '35000', 'RENNES', '0298901234', NULL, 'ecoles@rennes.fr', 'ÉCOLES RENNES'),
(10000016, '22 RUE DU CHEMIN DE FER', '37000', 'TOURS', NULL, '0689012345', 'chemin@tours.fr', 'CHEMIN TOURS'),
(10000017, '24 RUE DES OLIVIERS', '84000', 'AVIGNON', '0490123456', NULL, '', 'OLIVIERS AVIGNON'),
(10000018, '27 RUE DES ORCHIDÉES', '69001', 'LYON', NULL, '0690123456', 'orchidees@lyon.fr', 'ORCHIDÉES LYON'),
(10000019, '30 AVENUE DE LA RÉPUBLIQUE', '75011', 'PARIS', '0190123456', NULL, 'republique@paris.fr,contact@paris.fr', 'RÉPUBLIQUE PARIS'),
(10000020, '33 BOULEVARD DES ACACIAS', '21000', 'DIJON', NULL, '0612345678', 'oumaima5.loussaif97@gmail.com', 'ACACIAS DIJON'),
(10000021, '36 RUE DES CÈDRES', '34000', 'MONTPELLIER', '0445678901', NULL, 'cedres@montpellier.fr, jone.sina888@gmail.com', 'CÈDRES MONTPELLIER'),
(10000022, '39 RUE DES CHÊNES', '44000', 'NANTES', NULL, '0623456789', 'chenes@nantes.fr', 'CHÊNES NANTES'),
(10000023, '42 RUE DES PINS', '69001', 'LYON', '0478901234', NULL, 'pins@lyon.fr', 'PINS LYON'),
(10000024, '45 RUE DES LAVANDES', '13000', 'MARSEILLE', NULL, '0645678901', 'lavandes@marseille.fr', 'LAVANDES MARSEILLE'),
(10000025, '48 RUE DES COQUELICOTS', '75001', 'PARIS', '0145678901', NULL, 'coquelicots@paris.fr', 'COQUELICOTS PARIS'),
(10000026, '51 RUE DES ROSES', '44000', 'NANTES', NULL, '0634567890', 'roses@nantes.fr', 'ROSES NANTES'),
(10000027, '54 RUE DES TULIPES', '34000', 'MONTPELLIER', '0467890123', NULL, 'tulipes@montpellier.fr', 'TULIPES MONTPELLIER'),
(10000028, '57 RUE DES JONQUILLES', '69001', 'LYON', NULL, '0612345678', 'jonquilles@lyon.fr', 'JONQUILLES LYON'),
(10000029, '60 RUE DES PAVOTS', '75008', 'PARIS', '0145678901', NULL, 'pavots@paris.fr', 'PAVOTS PARIS'),
(10000030, '63 AVENUE DES LYS', '13000', 'MARSEILLE', NULL, '0623456789', 'lys@marseille.fr', 'LYS MARSEILLE'),
(10000031, '66 RUE DES MIMOSAS', '67000', 'STRASBOURG', '0389012345', NULL, 'mimosas@strasbourg.fr', 'MIMOSAS STRASBOURG'),
(10000032, '69 RUE DES VIOLETTES', '75001', 'PARIS', NULL, '0623456789', 'violettes@paris.fr', 'VIOLETTES PARIS'),
(10000033, '72 RUE DES MAGNOLIAS', '69001', 'LYON', '0478901234', NULL, 'magnolias@lyon.fr', 'MAGNOLIAS LYON'),
(10000034, '75 RUE DES LAVANDES', '33000', 'BORDEAUX', NULL, '0645678901', 'lavandes@bordeaux.fr', 'LAVANDES BORDEAUX'),
(10000035, '78 RUE DES COQUELICOTS', '75001', 'PARIS', '0145678901', NULL, 'coquelicots@paris.fr', 'COQUELICOTS PARIS'),
(10000036, '81 RUE DES ROSES', '44000', 'NANTES', NULL, '0634567890', 'roses@nantes.fr', 'ROSES NANTES'),
(10000037, '84 RUE DES TULIPES', '34000', 'MONTPELLIER', '0467890123', NULL, 'tulipes@montpellier.fr', 'TULIPES MONTPELLIER'),
(10000038, '87 RUE DES JONQUILLES', '69001', 'LYON', NULL, '0612345678', 'jonquilles@lyon.fr', 'JONQUILLES LYON'),
(10000039, '90 RUE DES PAVOTS', '75008', 'PARIS', '0145678901', NULL, 'pavots@paris.fr', 'PAVOTS PARIS'),
(10000040, '93 AVENUE DES LYS', '13000', 'MARSEILLE', NULL, '0623456789', 'lys@marseille.fr', 'LYS MARSEILLE'),
(10000041, '96 RUE DES MIMOSAS', '67000', 'STRASBOURG', '0389012345', NULL, 'mimosas@strasbourg.fr', 'MIMOSAS STRASBOURG'),
(10000042, '99 RUE DES VIOLETTES', '75001', 'PARIS', NULL, '0623456789', 'violettes@paris.fr', 'VIOLETTES PARIS'),
(10000043, '102 RUE DES MAGNOLIAS', '69001', 'LYON', '0478901234', NULL, 'magnolias@lyon.fr', 'MAGNOLIAS LYON'),
(10000044, '105 RUE DES LAVANDES', '33000', 'BORDEAUX', NULL, '0645678901', 'lavandes@bordeaux.fr', 'LAVANDES BORDEAUX'),
(10000045, '108 RUE DES COQUELICOTS', '75001', 'PARIS', '0145678901', NULL, 'coquelicots@paris.fr', 'COQUELICOTS PARIS'),
(10000046, '111 RUE DES ROSES', '44000', 'NANTES', NULL, '0634567890', 'roses@nantes.fr', 'ROSES NANTES'),
(10000047, '114 RUE DES TULIPES', '34000', 'MONTPELLIER', '0467890123', NULL, 'tulipes@montpellier.fr', 'TULIPES MONTPELLIER'),
(10000048, '117 RUE DES JONQUILLES', '69001', 'LYON', NULL, '0612345678', 'jonquilles@lyon.fr', 'JONQUILLES LYON'),
(10000049, '120 RUE DES PAVOTS', '75008', 'PARIS', '0145678901', NULL, 'pavots@paris.fr', 'PAVOTS PARIS'),
(10000050, '123 AVENUE DES LYS', '13000', 'MARSEILLE', NULL, '0623456789', 'lys@marseille.fr', 'LYS MARSEILLE');

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `civilite` varchar(10) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contacts`
--

INSERT INTO `contacts` (`id`, `civilite`, `nom`, `prenom`, `telephone`, `email`, `description`) VALUES
(18, 'Madame', 'loussaif', 'oumaima', '20293803', 'oumaima5.loussaif97@gmail.com', 'test'),
(20, 'Monsieur', 'JON', 'Sinna', '27299950', 'jone.sina888@gmail.com', 'test for test');

-- --------------------------------------------------------

--
-- Structure de la table `contact_client`
--

CREATE TABLE `contact_client` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `contact_client`
--

INSERT INTO `contact_client` (`id`, `contact_id`, `client_id`) VALUES
(1, 18, 10000020),
(3, 20, 10000021);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_33401573E7927C74` (`email`);

--
-- Index pour la table `contact_client`
--
ALTER TABLE `contact_client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000051;

--
-- AUTO_INCREMENT pour la table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `contact_client`
--
ALTER TABLE `contact_client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `contact_client`
--
ALTER TABLE `contact_client`
  ADD CONSTRAINT `contact_client_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`),
  ADD CONSTRAINT `contact_client_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id_client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
