-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 06 mai 2022 à 13:30
-- Version du serveur : 10.4.20-MariaDB
-- Version de PHP : 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `poe_ang_v1`
--
CREATE DATABASE IF NOT EXISTS `poe_ang_v1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `poe_ang_v1`;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `companyName` varchar(100) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `zipCode` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `country` varchar(15) NOT NULL,
  `state` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `companyName`, `firstName`, `lastName`, `email`, `phone`, `address`, `zipCode`, `city`, `country`, `state`) VALUES
(1, 'Capgemini', 'Fabrice', 'Martin', 'martin@mail.com\r\n', '0656858433', 'Head Office - Capgemini Service - Place de Étoile - 11 rue de Tilsitt - 75017 Paris', '75017', 'Paris', 'France', 1),
(2, 'M2I Formation', 'Julien', 'Lamard\r\n', 'lamard@mail.com', '0611223344', '17 r Chaillot, 75116 Paris\r\n', '75116', 'Paris', 'France', 0),
(3, 'Atos', 'Jean-Paul', 'Pomodoro', 'jean.paul@mail.com\r\n', '0656853233', 'Laboratoire digital.security 50 avenue Daumesnil Immeuble B 75012 Paris', '76017', 'Paris', 'France', 1),
(4, 'Sopra Steria', 'Alain', 'Lampard', 'alain@sopra.com', '0611298344', 'Paris Presbourg - Kléber. 6 avenue Kleber, 79016, Paris', '79016', 'Paris', 'France', 0);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `typePresta` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `nbDays` int(11) NOT NULL,
  `unitPrice` float NOT NULL,
  `state` tinyint(1) NOT NULL,
  `totalExcludeTaxe` float GENERATED ALWAYS AS (`nbDays` * `unitPrice`) STORED,
  `totalWithTaxe` float GENERATED ALWAYS AS (`nbDays` * `unitPrice` * 1.2) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `clientId`, `typePresta`, `designation`, `nbDays`, `unitPrice`, `state`) VALUES
(1, 2, 'Formation', 'Angular Initiation', 3, 1200, 0),
(2, 2, 'Formation', 'React.js avancé', 3, 1000, 2),
(3, 1, 'Coaching', 'React Techlead', 20, 900, 2),
(4, 1, 'Coaching', 'Nest.js Techlead', 50, 800, 1),
(5, 3, 'Coaching', 'React Techlead', 30, 1100, 2),
(6, 3, 'Coaching', 'Jakarta EE', 57, 1200, 2),
(7, 4, 'Coaching', 'Angular Techlead', 25, 1000, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientId` (`clientId`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
