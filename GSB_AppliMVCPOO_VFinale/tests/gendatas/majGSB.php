<?php
/**
 * Génération d'un jeu d'essai
 *
 * PHP Version 8
 *
 * @category  AP
 * @package   GSB
 * @link      Contexte « Laboratoire GSB »
 */

 //Initialisation de l'année et mois de début de la création du jeu d'essai
 //A MODIFIER POUR GENERER VOTRE JEU D'ESSAI
$moisDebut = '202501';
require 'fonctions.php';

$pdo = new PDO('mysql:host=localhost;dbname=gsb_frais', 'root', '');
$pdo->query('SET CHARACTER SET utf8');

creationFichesFrais($pdo);
creationFraisForfait($pdo);
creationFraisHorsForfait($pdo);
majFicheFrais($pdo);
//Affichage du récapitutalif des actions faites
echo '<br>' . getNbTable($pdo, 'fichefrais') . ' fiches de frais créées !';
echo '<br>' . getNbTable($pdo, 'lignefraisforfait')
        . ' lignes de frais au forfait créées !';
echo '<br>' . getNbTable($pdo, 'lignefraishorsforfait')
        . ' lignes de frais hors forfait créées !';
