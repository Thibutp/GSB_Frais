-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 08 avr. 2025 à 12:26
-- Version du serveur : 8.0.30
-- Version de PHP : 8.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gsb_frais`
--

-- --------------------------------------------------------

--
-- Structure de la table `comptable`
--

CREATE TABLE `comptable` (
  `id` char(4) NOT NULL,
  `nom` char(30) NOT NULL,
  `prenom` char(30) NOT NULL,
  `login` char(20) NOT NULL,
  `mdp` char(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `comptable`
--

INSERT INTO `comptable` (`id`, `nom`, `prenom`, `login`, `mdp`) VALUES
('', 'Moi', 'moi', 'mmoi', 'lecomptable');

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE `etat` (
  `id` char(2) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
('CL', 'Saisie clôturée'),
('CR', 'Fiche créée, saisie en cours'),
('PM', 'Mise en paiement'),
('RB', 'Remboursée'),
('VA', 'Validée');

-- --------------------------------------------------------

--
-- Structure de la table `fichefrais`
--

CREATE TABLE `fichefrais` (
  `idvisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `nbjustificatifs` int DEFAULT NULL,
  `montantvalide` decimal(10,2) DEFAULT NULL,
  `datemodif` date DEFAULT NULL,
  `idetat` char(2) DEFAULT 'CR'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fichefrais`
--

INSERT INTO `fichefrais` (`idvisiteur`, `mois`, `nbjustificatifs`, `montantvalide`, `datemodif`, `idetat`) VALUES
('a131', '202501', 5, 2933.72, '2025-03-03', 'RB'),
('a131', '202502', 1, 1861.26, '2025-03-04', 'VA'),
('a131', '202503', 4, 0.00, '2025-03-07', 'CR'),
('a17', '202501', 7, 2543.95, '2025-03-07', 'RB'),
('a17', '202502', 7, 3072.84, '2025-03-06', 'VA'),
('a17', '202503', 10, 1555.00, '2025-04-08', 'VA'),
('a17', '202504', 0, 222.00, '2025-04-08', 'CR'),
('a55', '202501', 2, 5416.58, '2025-03-04', 'RB'),
('a55', '202502', 12, 3709.09, '2025-04-08', 'RB'),
('a55', '202503', 1, 0.00, '2025-03-07', 'CR'),
('a93', '202501', 0, 4130.52, '2025-03-05', 'RB'),
('a93', '202502', 11, 3424.10, '2025-03-08', 'VA'),
('a93', '202503', 5, 0.00, '2025-03-02', 'CR'),
('b13', '202501', 1, 4037.54, '2025-03-07', 'RB'),
('b13', '202502', 8, 3714.05, '2025-03-01', 'VA'),
('b13', '202503', 6, 0.00, '2025-03-08', 'CR'),
('b16', '202501', 10, 2732.49, '2025-03-01', 'RB'),
('b16', '202502', 4, 2937.37, '2025-04-08', 'RB'),
('b16', '202503', 4, 0.00, '2025-03-03', 'CR'),
('b19', '202501', 1, 4601.78, '2025-03-08', 'RB'),
('b19', '202502', 5, 3443.15, '2025-03-02', 'VA'),
('b19', '202503', 10, 0.00, '2025-03-07', 'CR'),
('b25', '202501', 7, 3521.52, '2025-03-03', 'RB'),
('b25', '202502', 7, 2228.03, '2025-04-08', 'PM'),
('b25', '202503', 10, 0.00, '2025-03-05', 'CR'),
('b28', '202501', 10, 3746.49, '2025-03-02', 'RB'),
('b28', '202502', 12, 2325.95, '2025-04-08', 'RB'),
('b28', '202503', 4, 0.00, '2025-03-04', 'CR'),
('b34', '202501', 5, 3168.19, '2025-03-03', 'RB'),
('b34', '202502', 4, 2741.13, '2025-03-01', 'VA'),
('b34', '202503', 4, 0.00, '2025-03-07', 'CR'),
('b4', '202501', 9, 3556.32, '2025-03-08', 'RB'),
('b4', '202502', 3, 3162.43, '2025-04-08', 'RB'),
('b4', '202503', 2, 0.00, '2025-03-06', 'CR'),
('b50', '202501', 0, 3312.16, '2025-03-08', 'RB'),
('b50', '202502', 6, 3486.45, '2025-03-06', 'VA'),
('b50', '202503', 11, 0.00, '2025-03-05', 'CR'),
('b59', '202501', 5, 2215.81, '2025-03-06', 'RB'),
('b59', '202502', 1, 2263.43, '2025-03-07', 'VA'),
('b59', '202503', 11, 0.00, '2025-03-02', 'CR'),
('c14', '202501', 7, 2407.82, '2025-03-06', 'RB'),
('c14', '202502', 8, 3124.77, '2025-03-03', 'VA'),
('c14', '202503', 10, 0.00, '2025-03-05', 'CR'),
('c3', '202501', 1, 2991.95, '2025-03-03', 'RB'),
('c3', '202502', 5, 3761.64, '2025-03-07', 'VA'),
('c3', '202503', 7, 0.00, '2025-03-07', 'CR'),
('c54', '202501', 2, 3537.43, '2025-03-07', 'RB'),
('c54', '202502', 10, 3641.28, '2025-03-01', 'VA'),
('c54', '202503', 5, 0.00, '2025-03-07', 'CR'),
('d13', '202501', 0, 3995.84, '2025-03-07', 'RB'),
('d13', '202502', 6, 4950.96, '2025-03-02', 'VA'),
('d13', '202503', 8, 0.00, '2025-03-06', 'CR'),
('d51', '202501', 12, 3044.34, '2025-03-04', 'RB'),
('d51', '202502', 8, 3428.51, '2025-03-03', 'VA'),
('d51', '202503', 4, 0.00, '2025-03-07', 'CR'),
('e22', '202501', 0, 1892.88, '2025-03-05', 'RB'),
('e22', '202502', 3, 4044.49, '2025-03-05', 'VA'),
('e22', '202503', 10, 0.00, '2025-03-03', 'CR'),
('e24', '202501', 2, 2524.83, '2025-03-07', 'RB'),
('e24', '202502', 0, 4225.27, '2025-03-08', 'VA'),
('e24', '202503', 4, 0.00, '2025-03-06', 'CR'),
('e39', '202501', 12, 3098.66, '2025-03-06', 'RB'),
('e39', '202502', 7, 3717.92, '2025-03-08', 'VA'),
('e39', '202503', 11, 0.00, '2025-03-08', 'CR'),
('e49', '202501', 5, 2693.33, '2025-03-06', 'RB'),
('e49', '202502', 8, 2404.97, '2025-03-03', 'VA'),
('e49', '202503', 3, 0.00, '2025-03-05', 'CR'),
('e5', '202501', 1, 3539.67, '2025-03-06', 'RB'),
('e5', '202502', 5, 4515.82, '2025-03-04', 'VA'),
('e5', '202503', 4, 0.00, '2025-03-06', 'CR'),
('e52', '202501', 7, 3020.59, '2025-03-07', 'RB'),
('e52', '202502', 3, 3903.70, '2025-03-03', 'VA'),
('e52', '202503', 0, 0.00, '2025-03-03', 'CR'),
('f21', '202501', 7, 2726.07, '2025-03-07', 'RB'),
('f21', '202502', 7, 2073.96, '2025-03-03', 'VA'),
('f21', '202503', 7, 0.00, '2025-03-07', 'CR'),
('f39', '202501', 5, 4374.94, '2025-03-05', 'RB'),
('f39', '202502', 6, 4009.02, '2025-03-04', 'VA'),
('f39', '202503', 11, 0.00, '2025-03-04', 'CR'),
('f4', '202501', 4, 2374.29, '2025-03-02', 'RB'),
('f4', '202502', 5, 2912.40, '2025-03-05', 'VA'),
('f4', '202503', 0, 0.00, '2025-03-02', 'CR');

-- --------------------------------------------------------

--
-- Structure de la table `fraisforfait`
--

CREATE TABLE `fraisforfait` (
  `id` char(3) NOT NULL,
  `libelle` char(20) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `fraisforfait`
--

INSERT INTO `fraisforfait` (`id`, `libelle`, `montant`) VALUES
('ETP', 'Forfait Etape', 110.00),
('KM', 'Frais Kilométrique', 0.62),
('NUI', 'Nuitée Hôtel', 80.00),
('REP', 'Repas Restaurant', 25.00);

-- --------------------------------------------------------

--
-- Structure de la table `lignefraisforfait`
--

CREATE TABLE `lignefraisforfait` (
  `idvisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `idfraisforfait` char(3) NOT NULL,
  `quantite` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lignefraisforfait`
--

INSERT INTO `lignefraisforfait` (`idvisiteur`, `mois`, `idfraisforfait`, `quantite`) VALUES
('a131', '202501', 'ETP', 8),
('a131', '202501', 'KM', 756),
('a131', '202501', 'NUI', 8),
('a131', '202501', 'REP', 10),
('a131', '202502', 'ETP', 2),
('a131', '202502', 'KM', 652),
('a131', '202502', 'NUI', 9),
('a131', '202502', 'REP', 5),
('a131', '202503', 'ETP', 18),
('a131', '202503', 'KM', 803),
('a131', '202503', 'NUI', 5),
('a131', '202503', 'REP', 6),
('a17', '202501', 'ETP', 10),
('a17', '202501', 'KM', 414),
('a17', '202501', 'NUI', 7),
('a17', '202501', 'REP', 11),
('a17', '202502', 'ETP', 19),
('a17', '202502', 'KM', 682),
('a17', '202502', 'NUI', 5),
('a17', '202502', 'REP', 2),
('a17', '202503', 'ETP', 4),
('a17', '202503', 'KM', 600),
('a17', '202503', 'NUI', 3),
('a17', '202503', 'REP', 9),
('a17', '202504', 'ETP', 1),
('a17', '202504', 'KM', 100),
('a17', '202504', 'NUI', 0),
('a17', '202504', 'REP', 2),
('a55', '202501', 'ETP', 19),
('a55', '202501', 'KM', 605),
('a55', '202501', 'NUI', 19),
('a55', '202501', 'REP', 5),
('a55', '202502', 'ETP', 13),
('a55', '202502', 'KM', 796),
('a55', '202502', 'NUI', 6),
('a55', '202502', 'REP', 15),
('a55', '202503', 'ETP', 19),
('a55', '202503', 'KM', 988),
('a55', '202503', 'NUI', 12),
('a55', '202503', 'REP', 8),
('a93', '202501', 'ETP', 14),
('a93', '202501', 'KM', 391),
('a93', '202501', 'NUI', 7),
('a93', '202501', 'REP', 15),
('a93', '202502', 'ETP', 5),
('a93', '202502', 'KM', 586),
('a93', '202502', 'NUI', 18),
('a93', '202502', 'REP', 9),
('a93', '202503', 'ETP', 8),
('a93', '202503', 'KM', 357),
('a93', '202503', 'NUI', 10),
('a93', '202503', 'REP', 16),
('b13', '202501', 'ETP', 18),
('b13', '202501', 'KM', 925),
('b13', '202501', 'NUI', 17),
('b13', '202501', 'REP', 5),
('b13', '202502', 'ETP', 18),
('b13', '202502', 'KM', 443),
('b13', '202502', 'NUI', 13),
('b13', '202502', 'REP', 16),
('b13', '202503', 'ETP', 16),
('b13', '202503', 'KM', 607),
('b13', '202503', 'NUI', 9),
('b13', '202503', 'REP', 18),
('b16', '202501', 'ETP', 7),
('b16', '202501', 'KM', 945),
('b16', '202501', 'NUI', 16),
('b16', '202501', 'REP', 5),
('b16', '202502', 'ETP', 13),
('b16', '202502', 'KM', 691),
('b16', '202502', 'NUI', 4),
('b16', '202502', 'REP', 5),
('b16', '202503', 'ETP', 10),
('b16', '202503', 'KM', 870),
('b16', '202503', 'NUI', 18),
('b16', '202503', 'REP', 15),
('b19', '202501', 'ETP', 20),
('b19', '202501', 'KM', 746),
('b19', '202501', 'NUI', 19),
('b19', '202501', 'REP', 13),
('b19', '202502', 'ETP', 7),
('b19', '202502', 'KM', 572),
('b19', '202502', 'NUI', 20),
('b19', '202502', 'REP', 16),
('b19', '202503', 'ETP', 10),
('b19', '202503', 'KM', 400),
('b19', '202503', 'NUI', 17),
('b19', '202503', 'REP', 10),
('b25', '202501', 'ETP', 15),
('b25', '202501', 'KM', 609),
('b25', '202501', 'NUI', 6),
('b25', '202501', 'REP', 20),
('b25', '202502', 'ETP', 9),
('b25', '202502', 'KM', 491),
('b25', '202502', 'NUI', 11),
('b25', '202502', 'REP', 9),
('b25', '202503', 'ETP', 11),
('b25', '202503', 'KM', 913),
('b25', '202503', 'NUI', 16),
('b25', '202503', 'REP', 9),
('b28', '202501', 'ETP', 16),
('b28', '202501', 'KM', 849),
('b28', '202501', 'NUI', 9),
('b28', '202501', 'REP', 12),
('b28', '202502', 'ETP', 14),
('b28', '202502', 'KM', 962),
('b28', '202502', 'NUI', 5),
('b28', '202502', 'REP', 14),
('b28', '202503', 'ETP', 11),
('b28', '202503', 'KM', 340),
('b28', '202503', 'NUI', 14),
('b28', '202503', 'REP', 12),
('b34', '202501', 'ETP', 15),
('b34', '202501', 'KM', 689),
('b34', '202501', 'NUI', 3),
('b34', '202501', 'REP', 13),
('b34', '202502', 'ETP', 14),
('b34', '202502', 'KM', 978),
('b34', '202502', 'NUI', 8),
('b34', '202502', 'REP', 11),
('b34', '202503', 'ETP', 19),
('b34', '202503', 'KM', 859),
('b34', '202503', 'NUI', 10),
('b34', '202503', 'REP', 15),
('b4', '202501', 'ETP', 6),
('b4', '202501', 'KM', 436),
('b4', '202501', 'NUI', 12),
('b4', '202501', 'REP', 20),
('b4', '202502', 'ETP', 16),
('b4', '202502', 'KM', 492),
('b4', '202502', 'NUI', 18),
('b4', '202502', 'REP', 16),
('b4', '202503', 'ETP', 12),
('b4', '202503', 'KM', 770),
('b4', '202503', 'NUI', 11),
('b4', '202503', 'REP', 15),
('b50', '202501', 'ETP', 11),
('b50', '202501', 'KM', 739),
('b50', '202501', 'NUI', 10),
('b50', '202501', 'REP', 15),
('b50', '202502', 'ETP', 14),
('b50', '202502', 'KM', 694),
('b50', '202502', 'NUI', 12),
('b50', '202502', 'REP', 10),
('b50', '202503', 'ETP', 20),
('b50', '202503', 'KM', 571),
('b50', '202503', 'NUI', 18),
('b50', '202503', 'REP', 4),
('b59', '202501', 'ETP', 13),
('b59', '202501', 'KM', 348),
('b59', '202501', 'NUI', 2),
('b59', '202501', 'REP', 7),
('b59', '202502', 'ETP', 5),
('b59', '202502', 'KM', 778),
('b59', '202502', 'NUI', 16),
('b59', '202502', 'REP', 15),
('b59', '202503', 'ETP', 16),
('b59', '202503', 'KM', 672),
('b59', '202503', 'NUI', 20),
('b59', '202503', 'REP', 19),
('c14', '202501', 'ETP', 5),
('c14', '202501', 'KM', 697),
('c14', '202501', 'NUI', 16),
('c14', '202501', 'REP', 5),
('c14', '202502', 'ETP', 11),
('c14', '202502', 'KM', 469),
('c14', '202502', 'NUI', 13),
('c14', '202502', 'REP', 7),
('c14', '202503', 'ETP', 4),
('c14', '202503', 'KM', 348),
('c14', '202503', 'NUI', 18),
('c14', '202503', 'REP', 16),
('c3', '202501', 'ETP', 6),
('c3', '202501', 'KM', 677),
('c3', '202501', 'NUI', 11),
('c3', '202501', 'REP', 19),
('c3', '202502', 'ETP', 16),
('c3', '202502', 'KM', 799),
('c3', '202502', 'NUI', 5),
('c3', '202502', 'REP', 10),
('c3', '202503', 'ETP', 11),
('c3', '202503', 'KM', 929),
('c3', '202503', 'NUI', 3),
('c3', '202503', 'REP', 7),
('c54', '202501', 'ETP', 9),
('c54', '202501', 'KM', 614),
('c54', '202501', 'NUI', 18),
('c54', '202501', 'REP', 16),
('c54', '202502', 'ETP', 12),
('c54', '202502', 'KM', 845),
('c54', '202502', 'NUI', 18),
('c54', '202502', 'REP', 13),
('c54', '202503', 'ETP', 19),
('c54', '202503', 'KM', 451),
('c54', '202503', 'NUI', 13),
('c54', '202503', 'REP', 14),
('d13', '202501', 'ETP', 13),
('d13', '202501', 'KM', 829),
('d13', '202501', 'NUI', 20),
('d13', '202501', 'REP', 11),
('d13', '202502', 'ETP', 20),
('d13', '202502', 'KM', 984),
('d13', '202502', 'NUI', 11),
('d13', '202502', 'REP', 9),
('d13', '202503', 'ETP', 20),
('d13', '202503', 'KM', 724),
('d13', '202503', 'NUI', 11),
('d13', '202503', 'REP', 6),
('d51', '202501', 'ETP', 6),
('d51', '202501', 'KM', 952),
('d51', '202501', 'NUI', 18),
('d51', '202501', 'REP', 3),
('d51', '202502', 'ETP', 4),
('d51', '202502', 'KM', 672),
('d51', '202502', 'NUI', 14),
('d51', '202502', 'REP', 8),
('d51', '202503', 'ETP', 12),
('d51', '202503', 'KM', 499),
('d51', '202503', 'NUI', 9),
('d51', '202503', 'REP', 4),
('e22', '202501', 'ETP', 2),
('e22', '202501', 'KM', 324),
('e22', '202501', 'NUI', 10),
('e22', '202501', 'REP', 4),
('e22', '202502', 'ETP', 19),
('e22', '202502', 'KM', 439),
('e22', '202502', 'NUI', 13),
('e22', '202502', 'REP', 5),
('e22', '202503', 'ETP', 16),
('e22', '202503', 'KM', 931),
('e22', '202503', 'NUI', 18),
('e22', '202503', 'REP', 10),
('e24', '202501', 'ETP', 6),
('e24', '202501', 'KM', 406),
('e24', '202501', 'NUI', 18),
('e24', '202501', 'REP', 8),
('e24', '202502', 'ETP', 20),
('e24', '202502', 'KM', 927),
('e24', '202502', 'NUI', 2),
('e24', '202502', 'REP', 3),
('e24', '202503', 'ETP', 11),
('e24', '202503', 'KM', 839),
('e24', '202503', 'NUI', 12),
('e24', '202503', 'REP', 10),
('e39', '202501', 'ETP', 3),
('e39', '202501', 'KM', 776),
('e39', '202501', 'NUI', 16),
('e39', '202501', 'REP', 4),
('e39', '202502', 'ETP', 18),
('e39', '202502', 'KM', 331),
('e39', '202502', 'NUI', 8),
('e39', '202502', 'REP', 19),
('e39', '202503', 'ETP', 3),
('e39', '202503', 'KM', 1000),
('e39', '202503', 'NUI', 4),
('e39', '202503', 'REP', 2),
('e49', '202501', 'ETP', 3),
('e49', '202501', 'KM', 884),
('e49', '202501', 'NUI', 13),
('e49', '202501', 'REP', 20),
('e49', '202502', 'ETP', 8),
('e49', '202502', 'KM', 404),
('e49', '202502', 'NUI', 3),
('e49', '202502', 'REP', 5),
('e49', '202503', 'ETP', 17),
('e49', '202503', 'KM', 571),
('e49', '202503', 'NUI', 7),
('e49', '202503', 'REP', 15),
('e5', '202501', 'ETP', 5),
('e5', '202501', 'KM', 893),
('e5', '202501', 'NUI', 9),
('e5', '202501', 'REP', 12),
('e5', '202502', 'ETP', 20),
('e5', '202502', 'KM', 912),
('e5', '202502', 'NUI', 10),
('e5', '202502', 'REP', 16),
('e5', '202503', 'ETP', 2),
('e5', '202503', 'KM', 692),
('e5', '202503', 'NUI', 11),
('e5', '202503', 'REP', 2),
('e52', '202501', 'ETP', 18),
('e52', '202501', 'KM', 427),
('e52', '202501', 'NUI', 5),
('e52', '202501', 'REP', 17),
('e52', '202502', 'ETP', 20),
('e52', '202502', 'KM', 373),
('e52', '202502', 'NUI', 2),
('e52', '202502', 'REP', 16),
('e52', '202503', 'ETP', 20),
('e52', '202503', 'KM', 446),
('e52', '202503', 'NUI', 3),
('e52', '202503', 'REP', 8),
('f21', '202501', 'ETP', 9),
('f21', '202501', 'KM', 514),
('f21', '202501', 'NUI', 14),
('f21', '202501', 'REP', 3),
('f21', '202502', 'ETP', 6),
('f21', '202502', 'KM', 515),
('f21', '202502', 'NUI', 7),
('f21', '202502', 'REP', 15),
('f21', '202503', 'ETP', 3),
('f21', '202503', 'KM', 704),
('f21', '202503', 'NUI', 7),
('f21', '202503', 'REP', 10),
('f39', '202501', 'ETP', 20),
('f39', '202501', 'KM', 523),
('f39', '202501', 'NUI', 17),
('f39', '202501', 'REP', 5),
('f39', '202502', 'ETP', 14),
('f39', '202502', 'KM', 921),
('f39', '202502', 'NUI', 9),
('f39', '202502', 'REP', 7),
('f39', '202503', 'ETP', 12),
('f39', '202503', 'KM', 940),
('f39', '202503', 'NUI', 16),
('f39', '202503', 'REP', 13),
('f4', '202501', 'ETP', 13),
('f4', '202501', 'KM', 331),
('f4', '202501', 'NUI', 2),
('f4', '202501', 'REP', 19),
('f4', '202502', 'ETP', 5),
('f4', '202502', 'KM', 815),
('f4', '202502', 'NUI', 20),
('f4', '202502', 'REP', 14),
('f4', '202503', 'ETP', 10),
('f4', '202503', 'KM', 331),
('f4', '202503', 'NUI', 16),
('f4', '202503', 'REP', 12);

-- --------------------------------------------------------

--
-- Structure de la table `lignefraishorsforfait`
--

CREATE TABLE `lignefraishorsforfait` (
  `id` int NOT NULL,
  `idvisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `lignefraishorsforfait`
--

INSERT INTO `lignefraishorsforfait` (`id`, `idvisiteur`, `mois`, `libelle`, `date`, `montant`) VALUES
(1864, 'a131', '202501', 'Frais vestimentaire/représentation', '2025-01-28', 270.00),
(1865, 'a131', '202501', 'Location salle conférence', '2025-01-23', 425.00),
(1866, 'a131', '202502', 'Voyage SNCF', '2025-02-24', 42.00),
(1867, 'a131', '202502', 'Location salle conférence', '2025-02-22', 303.00),
(1868, 'a131', '202502', 'Location véhicule', '2025-02-22', 85.00),
(1869, 'a131', '202503', 'Achat espace publicitaire', '2025-03-25', 103.00),
(1870, 'a17', '202501', 'Voyage SNCF', '2025-01-01', 91.00),
(1871, 'a17', '202501', 'Traiteur, alimentation, boisson', '2025-01-02', 245.00),
(1872, 'a17', '202501', 'Location équipement vidéo/sonore', '2025-01-27', 335.00),
(1873, 'a17', '202501', 'Traiteur, alimentation, boisson', '2025-01-05', 278.00),
(1874, 'a17', '202502', 'Achat espace publicitaire', '2025-02-04', 39.00),
(1875, 'a17', '202502', 'Location véhicule', '2025-02-13', 71.00),
(1876, 'a17', '202503', 'Voyage SNCF', '2025-03-12', 34.00),
(1877, 'a17', '202503', 'Voyage SNCF', '2025-03-11', 67.00),
(1878, 'a17', '202503', 'Traiteur, alimentation, boisson', '2025-03-04', 177.00),
(1881, 'a55', '202501', 'Voyage SNCF', '2025-01-23', 130.00),
(1882, 'a55', '202501', 'Repas avec praticien', '2025-01-15', 43.00),
(1883, 'a55', '202501', 'Repas avec praticien', '2025-01-16', 35.00),
(1884, 'a55', '202501', 'Rémunération intervenant/spécialiste', '2025-01-12', 1173.00),
(1885, 'a55', '202501', 'Achat de matériel de papèterie', '2025-01-20', 41.00),
(1886, 'a55', '202501', 'Traiteur, alimentation, boisson', '2025-01-12', 52.00),
(1887, 'a55', '202502', 'Location véhicule', '2025-02-23', 420.00),
(1888, 'a55', '202502', 'Location salle conférence', '2025-02-28', 486.00),
(1889, 'a55', '202502', 'Rémunération intervenant/spécialiste', '2025-02-27', 483.00),
(1890, 'a55', '202503', 'Achat espace publicitaire', '2025-03-15', 149.00),
(1891, 'a55', '202503', 'Location salle conférence', '2025-03-20', 141.00),
(1892, 'a55', '202503', 'Location véhicule', '2025-03-06', 103.00),
(1893, 'a55', '202503', 'Achat de matériel de papèterie', '2025-03-11', 33.00),
(1894, 'a93', '202501', 'Location équipement vidéo/sonore', '2025-01-23', 284.00),
(1895, 'a93', '202501', 'Location véhicule', '2025-01-07', 32.00),
(1896, 'a93', '202501', 'Location équipement vidéo/sonore', '2025-01-09', 790.00),
(1897, 'a93', '202501', 'Rémunération intervenant/spécialiste', '2025-01-12', 496.00),
(1898, 'a93', '202501', 'Achat espace publicitaire', '2025-01-06', 122.00),
(1899, 'a93', '202502', 'Traiteur, alimentation, boisson', '2025-02-15', 414.00),
(1900, 'a93', '202502', 'Achat espace publicitaire', '2025-02-05', 21.00),
(1901, 'a93', '202502', 'Achat espace publicitaire', '2025-02-19', 131.00),
(1902, 'a93', '202502', 'Traiteur, alimentation, boisson', '2025-02-13', 253.00),
(1903, 'a93', '202502', 'Frais vestimentaire/représentation', '2025-02-01', 207.00),
(1904, 'a93', '202503', 'Location véhicule', '2025-03-08', 192.00),
(1905, 'a93', '202503', 'Frais vestimentaire/représentation', '2025-03-04', 56.00),
(1906, 'b13', '202501', 'Traiteur, alimentation, boisson', '2025-01-13', 120.00),
(1907, 'b13', '202501', 'Taxi', '2025-01-04', 28.00),
(1908, 'b13', '202501', 'Location salle conférence', '2025-01-27', 572.00),
(1909, 'b13', '202501', 'Taxi', '2025-01-16', 79.00),
(1910, 'b13', '202501', 'Taxi', '2025-01-20', 27.00),
(1911, 'b13', '202502', 'Rémunération intervenant/spécialiste', '2025-02-10', 261.00),
(1912, 'b13', '202502', 'Location salle conférence', '2025-02-01', 363.00),
(1913, 'b13', '202503', 'Taxi', '2025-03-02', 38.00),
(1914, 'b13', '202503', 'Taxi', '2025-03-01', 38.00),
(1915, 'b13', '202503', 'Achat espace publicitaire', '2025-03-27', 96.00),
(1916, 'b16', '202501', 'Traiteur, alimentation, boisson', '2025-01-28', 82.00),
(1917, 'b16', '202501', 'Traiteur, alimentation, boisson', '2025-01-11', 64.00),
(1918, 'b16', '202502', 'Rémunération intervenant/spécialiste', '2025-02-27', 494.00),
(1919, 'b16', '202502', 'Location équipement vidéo/sonore', '2025-02-12', 503.00),
(1920, 'b16', '202503', 'Achat espace publicitaire', '2025-03-17', 121.00),
(1921, 'b19', '202501', 'Rémunération intervenant/spécialiste', '2025-01-14', 286.00),
(1922, 'b19', '202502', 'Location équipement vidéo/sonore', '2025-02-18', 302.00),
(1923, 'b19', '202502', 'Frais vestimentaire/représentation', '2025-02-14', 123.00),
(1924, 'b19', '202503', 'Location équipement vidéo/sonore', '2025-03-02', 282.00),
(1925, 'b25', '202501', 'Location équipement vidéo/sonore', '2025-01-23', 265.00),
(1926, 'b25', '202501', 'Frais vestimentaire/représentation', '2025-01-07', 106.00),
(1927, 'b25', '202501', 'Traiteur, alimentation, boisson', '2025-01-22', 381.00),
(1928, 'b25', '202501', 'Achat de matériel de papèterie', '2025-01-04', 27.00),
(1929, 'b25', '202502', 'Location salle conférence', '2025-02-02', 184.00),
(1930, 'b25', '202502', 'Taxi', '2025-02-04', 69.00),
(1931, 'b25', '202503', 'Achat espace publicitaire', '2025-03-26', 36.00),
(1932, 'b25', '202503', 'Voyage SNCF', '2025-03-12', 71.00),
(1933, 'b28', '202501', 'Rémunération intervenant/spécialiste', '2025-01-08', 754.00),
(1934, 'b28', '202501', 'Location équipement vidéo/sonore', '2025-01-10', 229.00),
(1935, 'b28', '202501', 'Repas avec praticien', '2025-01-02', 35.00),
(1936, 'b28', '202501', 'Taxi', '2025-01-06', 32.00),
(1937, 'b28', '202502', 'Taxi', '2025-02-17', 21.00),
(1938, 'b28', '202503', 'Frais vestimentaire/représentation', '2025-03-04', 154.00),
(1939, 'b34', '202501', 'Location véhicule', '2025-01-22', 204.00),
(1940, 'b34', '202501', 'Repas avec praticien', '2025-01-21', 40.00),
(1941, 'b34', '202501', 'Location salle conférence', '2025-01-09', 380.00),
(1942, 'b34', '202502', 'Traiteur, alimentation, boisson', '2025-02-26', 47.00),
(1943, 'b34', '202502', 'Taxi', '2025-02-07', 79.00),
(1944, 'b34', '202503', 'Taxi', '2025-03-01', 70.00),
(1945, 'b34', '202503', 'Achat espace publicitaire', '2025-03-11', 132.00),
(1946, 'b4', '202501', 'Taxi', '2025-01-05', 68.00),
(1947, 'b4', '202501', 'Location équipement vidéo/sonore', '2025-01-19', 599.00),
(1948, 'b4', '202501', 'Taxi', '2025-01-11', 47.00),
(1949, 'b4', '202501', 'Repas avec praticien', '2025-01-25', 47.00),
(1950, 'b4', '202501', 'Location équipement vidéo/sonore', '2025-01-07', 405.00),
(1951, 'b4', '202502', 'Achat espace publicitaire', '2025-02-05', 48.00),
(1952, 'b4', '202503', 'Voyage SNCF', '2025-03-09', 66.00),
(1953, 'b4', '202503', 'Achat de matériel de papèterie', '2025-03-11', 11.00),
(1954, 'b4', '202503', 'Location équipement vidéo/sonore', '2025-03-19', 236.00),
(1955, 'b4', '202503', 'Location équipement vidéo/sonore', '2025-03-04', 351.00),
(1956, 'b50', '202501', 'Achat de matériel de papèterie', '2025-01-10', 36.00),
(1957, 'b50', '202501', 'Location équipement vidéo/sonore', '2025-01-01', 158.00),
(1958, 'b50', '202501', 'Frais vestimentaire/représentation', '2025-01-06', 271.00),
(1959, 'b50', '202501', 'Location véhicule', '2025-01-10', 372.00),
(1960, 'b50', '202502', 'Achat de matériel de papèterie', '2025-02-13', 12.00),
(1961, 'b50', '202502', 'Traiteur, alimentation, boisson', '2025-02-20', 402.00),
(1962, 'b50', '202503', 'Location équipement vidéo/sonore', '2025-03-06', 336.00),
(1963, 'b50', '202503', 'Achat de matériel de papèterie', '2025-03-19', 15.00),
(1964, 'b50', '202503', 'Location véhicule', '2025-03-10', 332.00),
(1965, 'b50', '202503', 'Rémunération intervenant/spécialiste', '2025-03-03', 1170.00),
(1966, 'b50', '202503', 'Achat espace publicitaire', '2025-03-14', 75.00),
(1967, 'b59', '202501', 'Location véhicule', '2025-01-08', 142.00),
(1968, 'b59', '202501', 'Taxi', '2025-01-07', 77.00),
(1969, 'b59', '202501', 'Traiteur, alimentation, boisson', '2025-01-21', 425.00),
(1970, 'b59', '202501', 'Repas avec praticien', '2025-01-24', 39.00),
(1971, 'b59', '202501', 'Location véhicule', '2025-01-07', 106.00),
(1972, 'b59', '202502', 'Taxi', '2025-02-18', 44.00),
(1973, 'b59', '202502', 'Achat espace publicitaire', '2025-02-03', 33.00),
(1974, 'b59', '202502', 'Achat de matériel de papèterie', '2025-02-25', 30.00),
(1975, 'b59', '202503', 'Location équipement vidéo/sonore', '2025-03-02', 216.00),
(1976, 'b59', '202503', 'Traiteur, alimentation, boisson', '2025-03-09', 125.00),
(1977, 'b59', '202503', 'Repas avec praticien', '2025-03-28', 42.00),
(1978, 'b59', '202503', 'Frais vestimentaire/représentation', '2025-03-20', 200.00),
(1979, 'b59', '202503', 'Achat de matériel de papèterie', '2025-03-11', 33.00),
(1980, 'b59', '202503', 'Location équipement vidéo/sonore', '2025-03-12', 209.00),
(1981, 'c14', '202501', 'Taxi', '2025-01-24', 45.00),
(1982, 'c14', '202502', 'Rémunération intervenant/spécialiste', '2025-02-24', 1049.00),
(1983, 'c14', '202503', 'Location salle conférence', '2025-03-18', 319.00),
(1984, 'c3', '202501', 'Traiteur, alimentation, boisson', '2025-01-13', 51.00),
(1985, 'c3', '202501', 'Location salle conférence', '2025-01-22', 256.00),
(1986, 'c3', '202501', 'Frais vestimentaire/représentation', '2025-01-09', 282.00),
(1987, 'c3', '202501', 'Location véhicule', '2025-01-05', 213.00),
(1988, 'c3', '202501', 'Traiteur, alimentation, boisson', '2025-01-18', 125.00),
(1989, 'c3', '202502', 'Location salle conférence', '2025-02-17', 221.00),
(1990, 'c3', '202502', 'Location véhicule', '2025-02-03', 181.00),
(1991, 'c3', '202502', 'Location équipement vidéo/sonore', '2025-02-10', 611.00),
(1992, 'c3', '202503', 'Voyage SNCF', '2025-03-13', 103.00),
(1993, 'c3', '202503', 'Voyage SNCF', '2025-03-26', 88.00),
(1994, 'c3', '202503', 'Location salle conférence', '2025-03-16', 254.00),
(1995, 'c54', '202501', 'Voyage SNCF', '2025-01-02', 68.00),
(1996, 'c54', '202501', 'Location équipement vidéo/sonore', '2025-01-04', 228.00),
(1997, 'c54', '202501', 'Location véhicule', '2025-01-02', 71.00),
(1998, 'c54', '202501', 'Repas avec praticien', '2025-01-15', 40.00),
(1999, 'c54', '202501', 'Location équipement vidéo/sonore', '2025-01-09', 502.00),
(2000, 'c54', '202501', 'Achat de matériel de papèterie', '2025-01-28', 42.00),
(2001, 'c54', '202502', 'Frais vestimentaire/représentation', '2025-02-21', 88.00),
(2002, 'c54', '202502', 'Achat espace publicitaire', '2025-02-24', 26.00),
(2003, 'c54', '202502', 'Repas avec praticien', '2025-02-28', 31.00),
(2004, 'c54', '202503', 'Repas avec praticien', '2025-03-07', 31.00),
(2005, 'c54', '202503', 'Traiteur, alimentation, boisson', '2025-03-04', 242.00),
(2006, 'c54', '202503', 'Traiteur, alimentation, boisson', '2025-03-16', 370.00),
(2007, 'c54', '202503', 'Voyage SNCF', '2025-03-06', 60.00),
(2008, 'c54', '202503', 'Traiteur, alimentation, boisson', '2025-03-20', 387.00),
(2009, 'd13', '202501', 'Repas avec praticien', '2025-01-13', 46.00),
(2010, 'd13', '202501', 'Location salle conférence', '2025-01-21', 583.00),
(2011, 'd13', '202501', 'Traiteur, alimentation, boisson', '2025-01-24', 327.00),
(2012, 'd13', '202501', 'Achat espace publicitaire', '2025-01-05', 98.00),
(2013, 'd13', '202502', 'Voyage SNCF', '2025-02-21', 87.00),
(2014, 'd13', '202502', 'Achat de matériel de papèterie', '2025-02-03', 48.00),
(2015, 'd13', '202502', 'Frais vestimentaire/représentation', '2025-02-06', 293.00),
(2016, 'd13', '202502', 'Achat de matériel de papèterie', '2025-02-08', 14.00),
(2017, 'd13', '202502', 'Location équipement vidéo/sonore', '2025-02-15', 747.00),
(2018, 'd13', '202503', 'Location véhicule', '2025-03-25', 26.00),
(2019, 'd51', '202501', 'Location équipement vidéo/sonore', '2025-01-18', 734.00),
(2020, 'd51', '202502', 'Achat de matériel de papèterie', '2025-02-03', 50.00),
(2021, 'd51', '202502', 'Rémunération intervenant/spécialiste', '2025-02-09', 974.00),
(2022, 'd51', '202502', 'Location salle conférence', '2025-02-02', 300.00),
(2023, 'd51', '202502', 'Voyage SNCF', '2025-02-27', 37.00),
(2024, 'd51', '202502', 'Location véhicule', '2025-02-01', 449.00),
(2025, 'd51', '202503', 'Repas avec praticien', '2025-03-13', 43.00),
(2026, 'd51', '202503', 'Achat de matériel de papèterie', '2025-03-06', 25.00),
(2027, 'd51', '202503', 'Location véhicule', '2025-03-26', 129.00),
(2028, 'd51', '202503', 'Location salle conférence', '2025-03-22', 477.00),
(2029, 'd51', '202503', 'Achat espace publicitaire', '2025-03-02', 149.00),
(2030, 'd51', '202503', 'Location équipement vidéo/sonore', '2025-03-12', 824.00),
(2031, 'e22', '202501', 'Repas avec praticien', '2025-01-09', 39.00),
(2032, 'e22', '202501', 'Achat espace publicitaire', '2025-01-27', 58.00),
(2033, 'e22', '202501', 'Location véhicule', '2025-01-22', 69.00),
(2034, 'e22', '202501', 'Achat de matériel de papèterie', '2025-01-23', 23.00),
(2035, 'e22', '202501', 'Location équipement vidéo/sonore', '2025-01-05', 326.00),
(2036, 'e22', '202501', 'Traiteur, alimentation, boisson', '2025-01-27', 57.00),
(2037, 'e22', '202502', 'Achat de matériel de papèterie', '2025-02-28', 29.00),
(2038, 'e22', '202502', 'Traiteur, alimentation, boisson', '2025-02-13', 411.00),
(2039, 'e22', '202502', 'Location équipement vidéo/sonore', '2025-02-09', 376.00),
(2040, 'e22', '202502', 'Taxi', '2025-02-24', 53.00),
(2041, 'e22', '202503', 'Repas avec praticien', '2025-03-12', 46.00),
(2042, 'e22', '202503', 'Traiteur, alimentation, boisson', '2025-03-07', 329.00),
(2043, 'e22', '202503', 'Taxi', '2025-03-27', 43.00),
(2044, 'e24', '202501', 'Voyage SNCF', '2025-01-06', 106.00),
(2045, 'e24', '202502', 'Achat espace publicitaire', '2025-02-01', 103.00),
(2046, 'e24', '202502', 'Rémunération intervenant/spécialiste', '2025-02-17', 913.00),
(2047, 'e24', '202502', 'Location équipement vidéo/sonore', '2025-02-09', 669.00),
(2048, 'e24', '202503', 'Achat espace publicitaire', '2025-03-27', 137.00),
(2049, 'e24', '202503', 'Location équipement vidéo/sonore', '2025-03-17', 344.00),
(2050, 'e24', '202503', 'Voyage SNCF', '2025-03-04', 70.00),
(2051, 'e24', '202503', 'Rémunération intervenant/spécialiste', '2025-03-03', 534.00),
(2052, 'e24', '202503', 'Location équipement vidéo/sonore', '2025-03-25', 518.00),
(2053, 'e24', '202503', 'Location véhicule', '2025-03-05', 262.00),
(2054, 'e39', '202501', 'Taxi', '2025-01-03', 50.00),
(2055, 'e39', '202501', 'Repas avec praticien', '2025-01-16', 30.00),
(2056, 'e39', '202501', 'Location véhicule', '2025-01-05', 271.00),
(2057, 'e39', '202501', 'Location salle conférence', '2025-01-18', 428.00),
(2058, 'e39', '202501', 'Traiteur, alimentation, boisson', '2025-01-18', 435.00),
(2059, 'e39', '202502', 'Location véhicule', '2025-02-02', 25.00),
(2060, 'e39', '202502', 'Location salle conférence', '2025-02-17', 313.00),
(2061, 'e39', '202502', 'Frais vestimentaire/représentation', '2025-02-24', 403.00),
(2062, 'e39', '202503', 'Location salle conférence', '2025-03-26', 571.00),
(2063, 'e49', '202501', 'Taxi', '2025-01-03', 42.00),
(2064, 'e49', '202501', 'Traiteur, alimentation, boisson', '2025-01-16', 340.00),
(2065, 'e49', '202501', 'Repas avec praticien', '2025-01-07', 35.00),
(2066, 'e49', '202502', 'Location véhicule', '2025-02-06', 434.00),
(2067, 'e49', '202502', 'Location véhicule', '2025-02-08', 418.00),
(2068, 'e49', '202502', 'Achat de matériel de papèterie', '2025-02-18', 17.00),
(2069, 'e49', '202502', 'Location équipement vidéo/sonore', '2025-02-06', 399.00),
(2070, 'e49', '202502', 'Achat espace publicitaire', '2025-02-02', 33.00),
(2071, 'e49', '202503', 'Location salle conférence', '2025-03-15', 352.00),
(2072, 'e5', '202501', 'Location équipement vidéo/sonore', '2025-01-10', 757.00),
(2073, 'e5', '202501', 'Voyage SNCF', '2025-01-01', 34.00),
(2074, 'e5', '202501', 'Rémunération intervenant/spécialiste', '2025-01-09', 1109.00),
(2075, 'e5', '202501', 'Achat espace publicitaire', '2025-01-19', 108.00),
(2076, 'e5', '202501', 'Voyage SNCF', '2025-01-23', 66.00),
(2077, 'e5', '202501', 'Achat espace publicitaire', '2025-01-04', 67.00),
(2078, 'e5', '202502', 'Location véhicule', '2025-02-03', 336.00),
(2079, 'e5', '202502', 'Location salle conférence', '2025-02-25', 502.00),
(2080, 'e5', '202502', 'Achat espace publicitaire', '2025-02-22', 135.00),
(2081, 'e5', '202502', 'Taxi', '2025-02-28', 24.00),
(2082, 'e5', '202503', 'Achat espace publicitaire', '2025-03-22', 27.00),
(2083, 'e5', '202503', 'Rémunération intervenant/spécialiste', '2025-03-25', 272.00),
(2084, 'e5', '202503', 'Location véhicule', '2025-03-03', 113.00),
(2085, 'e52', '202501', 'Frais vestimentaire/représentation', '2025-01-02', 403.00),
(2086, 'e52', '202501', 'Traiteur, alimentation, boisson', '2025-01-01', 303.00),
(2087, 'e52', '202502', 'Achat de matériel de papèterie', '2025-02-27', 24.00),
(2088, 'e52', '202502', 'Location salle conférence', '2025-02-17', 412.00),
(2089, 'e52', '202502', 'Rémunération intervenant/spécialiste', '2025-02-18', 1133.00),
(2090, 'e52', '202502', 'Repas avec praticien', '2025-02-02', 41.00),
(2091, 'e52', '202502', 'Repas avec praticien', '2025-02-25', 46.00),
(2092, 'e52', '202503', 'Rémunération intervenant/spécialiste', '2025-03-13', 801.00),
(2093, 'e52', '202503', 'Location véhicule', '2025-03-09', 322.00),
(2094, 'e52', '202503', 'Traiteur, alimentation, boisson', '2025-03-15', 301.00),
(2095, 'e52', '202503', 'Traiteur, alimentation, boisson', '2025-03-24', 273.00),
(2096, 'e52', '202503', 'Voyage SNCF', '2025-03-05', 64.00),
(2097, 'f21', '202501', 'Voyage SNCF', '2025-01-28', 69.00),
(2098, 'f21', '202501', 'Repas avec praticien', '2025-01-11', 42.00),
(2099, 'f21', '202501', 'Repas avec praticien', '2025-01-05', 46.00),
(2100, 'f21', '202501', 'Traiteur, alimentation, boisson', '2025-01-04', 257.00),
(2101, 'f21', '202501', 'Location véhicule', '2025-01-21', 78.00),
(2102, 'f21', '202502', 'Repas avec praticien', '2025-02-19', 49.00),
(2103, 'f21', '202502', 'Frais vestimentaire/représentation', '2025-02-01', 291.00),
(2104, 'f21', '202503', 'Voyage SNCF', '2025-03-02', 127.00),
(2105, 'f21', '202503', 'Achat de matériel de papèterie', '2025-03-12', 15.00),
(2106, 'f21', '202503', 'Rémunération intervenant/spécialiste', '2025-03-22', 647.00),
(2107, 'f21', '202503', 'Achat espace publicitaire', '2025-03-01', 82.00),
(2108, 'f21', '202503', 'Location véhicule', '2025-03-15', 86.00),
(2109, 'f39', '202501', 'Taxi', '2025-01-26', 24.00),
(2110, 'f39', '202501', 'Location équipement vidéo/sonore', '2025-01-05', 212.00),
(2111, 'f39', '202501', 'Achat espace publicitaire', '2025-01-02', 28.00),
(2112, 'f39', '202501', 'Traiteur, alimentation, boisson', '2025-01-06', 410.00),
(2113, 'f39', '202501', 'Frais vestimentaire/représentation', '2025-01-15', 398.00),
(2114, 'f39', '202501', 'Voyage SNCF', '2025-01-13', 127.00),
(2115, 'f39', '202502', 'Repas avec praticien', '2025-02-28', 46.00),
(2116, 'f39', '202502', 'Location véhicule', '2025-02-12', 229.00),
(2117, 'f39', '202502', 'Location véhicule', '2025-02-02', 343.00),
(2118, 'f39', '202502', 'Achat espace publicitaire', '2025-02-20', 149.00),
(2119, 'f39', '202502', 'Repas avec praticien', '2025-02-13', 40.00),
(2120, 'f39', '202502', 'Location équipement vidéo/sonore', '2025-02-10', 196.00),
(2121, 'f39', '202503', 'Traiteur, alimentation, boisson', '2025-03-25', 368.00),
(2122, 'f39', '202503', 'Achat de matériel de papèterie', '2025-03-03', 34.00),
(2123, 'f39', '202503', 'Voyage SNCF', '2025-03-25', 92.00),
(2124, 'f39', '202503', 'Achat de matériel de papèterie', '2025-03-06', 15.00),
(2125, 'f39', '202503', 'Location équipement vidéo/sonore', '2025-03-27', 827.00),
(2126, 'f4', '202501', 'Voyage SNCF', '2025-01-22', 141.00),
(2127, 'f4', '202501', 'Location véhicule', '2025-01-21', 107.00),
(2128, 'f4', '202501', 'Traiteur, alimentation, boisson', '2025-01-07', 46.00),
(2129, 'f4', '202501', 'Frais vestimentaire/représentation', '2025-01-14', 367.00),
(2130, 'f4', '202502', 'Voyage SNCF', '2025-02-17', 45.00),
(2131, 'f4', '202502', 'Achat de matériel de papèterie', '2025-02-23', 48.00),
(2132, 'f4', '202503', 'Rémunération intervenant/spécialiste', '2025-03-26', 824.00),
(2133, 'f4', '202503', 'Repas avec praticien', '2025-03-25', 39.00),
(2134, 'f4', '202503', 'Achat espace publicitaire', '2025-03-01', 51.00),
(2135, 'f4', '202503', 'Achat espace publicitaire', '2025-03-09', 146.00),
(2136, 'f4', '202503', 'Location salle conférence', '2025-03-05', 622.00);

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE `visiteur` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `login` char(20) DEFAULT NULL,
  `mdp` char(20) DEFAULT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `dateembauche` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `visiteur`
--

INSERT INTO `visiteur` (`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateembauche`) VALUES
('a131', 'Villechalane', 'Louis', 'lvillachane', 'jux7g', '8 rue des Charmes', '46000', 'Cahors', '2005-12-21'),
('a17', 'Andre', 'David', 'dandre', 'oppg5', '1 rue Petit', '46200', 'Lalbenque', '1998-11-23'),
('a55', 'Bedos', 'Christian', 'cbedos', 'gmhxd', '1 rue Peranud', '46250', 'Montcuq', '1995-01-12'),
('a93', 'Tusseau', 'Louis', 'ltusseau', 'ktp3s', '22 rue des Ternes', '46123', 'Gramat', '2000-05-01'),
('b13', 'Bentot', 'Pascal', 'pbentot', 'doyw1', '11 allée des Cerises', '46512', 'Bessines', '1992-07-09'),
('b16', 'Bioret', 'Luc', 'lbioret', 'hrjfs', '1 Avenue gambetta', '46000', 'Cahors', '1998-05-11'),
('b19', 'Bunisset', 'Francis', 'fbunisset', '4vbnd', '10 rue des Perles', '93100', 'Montreuil', '1987-10-21'),
('b25', 'Bunisset', 'Denise', 'dbunisset', 's1y1r', '23 rue Manin', '75019', 'paris', '2010-12-05'),
('b28', 'Cacheux', 'Bernard', 'bcacheux', 'uf7r3', '114 rue Blanche', '75017', 'Paris', '2009-11-12'),
('b34', 'Cadic', 'Eric', 'ecadic', '6u8dc', '123 avenue de la République', '75011', 'Paris', '2008-09-23'),
('b4', 'Charoze', 'Catherine', 'ccharoze', 'u817o', '100 rue Petit', '75019', 'Paris', '2005-11-12'),
('b50', 'Clepkens', 'Christophe', 'cclepkens', 'bw1us', '12 allée des Anges', '93230', 'Romainville', '2003-08-11'),
('b59', 'Cottin', 'Vincenne', 'vcottin', '2hoh9', '36 rue Des Roches', '93100', 'Monteuil', '2001-11-18'),
('c14', 'Daburon', 'François', 'fdaburon', '7oqpv', '13 rue de Chanzy', '94000', 'Créteil', '2002-02-11'),
('c3', 'De', 'Philippe', 'pde', 'gk9kx', '13 rue Barthes', '94000', 'Créteil', '2010-12-14'),
('c54', 'Debelle', 'Michel', 'mdebelle', 'od5rt', '181 avenue Barbusse', '93210', 'Rosny', '2006-11-23'),
('d13', 'Debelle', 'Jeanne', 'jdebelle', 'nvwqq', '134 allée des Joncs', '44000', 'Nantes', '2000-05-11'),
('d51', 'Debroise', 'Michel', 'mdebroise', 'sghkb', '2 Bld Jourdain', '44000', 'Nantes', '2001-04-17'),
('e22', 'Desmarquest', 'Nathalie', 'ndesmarquest', 'f1fob', '14 Place d Arc', '45000', 'Orléans', '2005-11-12'),
('e24', 'Desnost', 'Pierre', 'pdesnost', '4k2o5', '16 avenue des Cèdres', '23200', 'Guéret', '2001-02-05'),
('e39', 'Dudouit', 'Frédéric', 'fdudouit', '44im8', '18 rue de l église', '23120', 'GrandBourg', '2000-08-01'),
('e49', 'Duncombe', 'Claude', 'cduncombe', 'qf77j', '19 rue de la tour', '23100', 'La souteraine', '1987-10-10'),
('e5', 'Enault-Pascreau', 'Céline', 'cenault', 'y2qdu', '25 place de la gare', '23200', 'Gueret', '1995-09-01'),
('e52', 'Eynde', 'Valérie', 'veynde', 'i7sn3', '3 Grand Place', '13015', 'Marseille', '1999-11-01'),
('f21', 'Finck', 'Jacques', 'jfinck', 'mpb3t', '10 avenue du Prado', '13002', 'Marseille', '2001-11-10'),
('f39', 'Frémont', 'Fernande', 'ffremont', 'xs5tq', '4 route de la mer', '13012', 'Allauh', '1998-10-01'),
('f4', 'Gest', 'Alain', 'agest', 'dywvt', '30 avenue de la mer', '13025', 'Berre', '1985-11-01');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comptable`
--
ALTER TABLE `comptable`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD PRIMARY KEY (`idvisiteur`,`mois`),
  ADD KEY `idetat` (`idetat`);

--
-- Index pour la table `fraisforfait`
--
ALTER TABLE `fraisforfait`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD PRIMARY KEY (`idvisiteur`,`mois`,`idfraisforfait`),
  ADD KEY `idfraisforfait` (`idfraisforfait`);

--
-- Index pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idvisiteur` (`idvisiteur`,`mois`);

--
-- Index pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2138;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD CONSTRAINT `fichefrais_ibfk_1` FOREIGN KEY (`idetat`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `fichefrais_ibfk_2` FOREIGN KEY (`idvisiteur`) REFERENCES `visiteur` (`id`);

--
-- Contraintes pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD CONSTRAINT `lignefraisforfait_ibfk_1` FOREIGN KEY (`idvisiteur`,`mois`) REFERENCES `fichefrais` (`idvisiteur`, `mois`),
  ADD CONSTRAINT `lignefraisforfait_ibfk_2` FOREIGN KEY (`idfraisforfait`) REFERENCES `fraisforfait` (`id`);

--
-- Contraintes pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD CONSTRAINT `lignefraishorsforfait_ibfk_1` FOREIGN KEY (`idvisiteur`,`mois`) REFERENCES `fichefrais` (`idvisiteur`, `mois`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
