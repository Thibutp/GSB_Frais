<?php

/**
 * Class Controller Comptable
 * 
 * Liste des méthodes qui correspondent à une action demandée par le Comptable
 */

class Comptable
{
    public function accueil($params)
    {
        //extraction des paramètres pour récupérer action à faire et autres (GET|POST)
        extract($params);
        //Affichage de la vue accueil Visiteur
        $myView = new View('vc_accueil');
        $myView->render(array('estConnecte' => true));
    }

    public function validerFrais($params)
    {
        $pdo = GsbManager::getPdoGsb();
        //Recup les données actuelles
        $idcomptable = $_SESSION['id'];
        //extraction des paramètres pour récupérer action à faire et autres (GET|POST)
        extract($params);
        //En fonction de l'action demandée par le visiteur
        switch ($action) {
            case 'selectionnerVisiteur':
                //Recherche des visiteurs avec FF etat CL en BD 
                $lesVisiteurs = $pdo->getLesVisiteursAValider("CL");

                //Affichage de la vue 
                $myView = new View('vc_listeVisiteurs');
                $myView->renderc(array(
                    'estConnecte' => true,
                    'lesVisiteurs' => $lesVisiteurs
                ));
            break;
            case 'selectionnerMois':
                //Quel visiteur
                $idVisiteur = $lstVisiteurs;
                //Recherche des visiteurs et les mois du visiteur avec FF etat CL en BD 
                $lesVisiteurs = $pdo->getLesVisiteursAValider("CL");
                $lesMois = $pdo->getLesMoisAValider($idVisiteur, "CL");
                // Afin de sélectionner par défaut le dernier mois dans la zone de liste
                // on demande toutes les clés, et on prend la première,
                // les mois étant triés décroissants
                $lesCles = array_keys($lesMois);
                $moisASelectionner = $lesCles[0];
                //Affichage de la vue actualisée
                $myView = new View('vc_listeMois');
                $myView->renderc(array(
                    'estConnecte' => true,
                    'visiteurSelectionne' => $idVisiteur,
                    'lesVisiteurs' => $lesVisiteurs,
                    'lesMois' => $lesMois,
                    'moisSelectionne' => $moisASelectionner
                ));
            break;
            case 'voirFiche':
                //Récupérer les infos du formulaire
                $idVisiteur = $lstVisiteurs;
                $leMois = $lstMois;
                //Recherche des visiteurs et les mois du visiteur avec FF etat CL en BD 
                $lesVisiteurs = $pdo->getLesVisiteursAValider("CL");
                $lesMois = $pdo->getLesMoisAValider($idVisiteur, "CL");
                //Récupérer les informations et la fiche du visiteur             
                $lesFraisHorsForfait = $pdo->getLesFraisHorsForfait($idVisiteur, $leMois);
                $lesFraisForfait = $pdo->getLesFraisForfait($idVisiteur, $leMois);
                $lesInfosFicheFrais = $pdo->getLesInfosFicheFrais($idVisiteur, $leMois);
                $numAnnee = substr($leMois, 0, 4);
                $numMois = substr($leMois, 4, 2);
                $libEtat = $lesInfosFicheFrais['libEtat'];
                $montantValide = $lesInfosFicheFrais['montantValide'];
                $nbJustificatifs = $lesInfosFicheFrais['nbJustificatifs'];
                $dateModif = dateAnglaisVersFrancais($lesInfosFicheFrais['dateModif']);
                //Appel de la vue v_etatFrais
                $myView = new View('vc_ficheFrais');
                $myView->renderc(array(
                    'estConnecte' => true,
                    'visiteurSelectionne' => $idVisiteur,
                    'lesVisiteurs' => $lesVisiteurs,
                    'idVisiteur' => $idVisiteur,
                    'lstMois' => $leMois,
                    'lesMois' => $lesMois,
                    'numMois' => $numMois,
                    'numAnnee' => $numAnnee,
                    'libEtat' => $libEtat,
                    'dateModif' => $dateModif,
                    'montantValide' => $montantValide,
                    'nbJustificatifs' => $nbJustificatifs,
                    'lesFraisForfait' => $lesFraisForfait,
                    'lesFraisHorsForfait' => $lesFraisHorsForfait
                ));
            break;
            case 'modifierFicheFrais':
                //Récup les données du formulaire
                $idVisiteur = $leVisiteur;
                $leMois = $lstMois;
                // Effectuer les modifications du comptable : 
                $pdo->majFraisForfait($idVisiteur, $leMois, $lesFrais);
                $pdo->majMontantFicheFrais($idVisiteur, $leMois);
                //Récupérer les informations et fiches du visiteur
                $lesVisiteurs = $pdo->getLesVisiteursAValider("CL");
                $lesMois = $pdo->getLesMoisAValider($idVisiteur, "CL");
                
                $lesFraisHorsForfait = $pdo->getLesFraisHorsForfait($idVisiteur, $leMois);
                $lesFraisForfait = $pdo->getLesFraisForfait($idVisiteur, $leMois);
                $lesInfosFicheFrais = $pdo->getLesInfosFicheFrais($idVisiteur, $leMois);
                $numAnnee = substr($leMois, 0, 4);
                $numMois = substr($leMois, 4, 2);
                $libEtat = $lesInfosFicheFrais['libEtat'];
                $montantValide = $lesInfosFicheFrais['montantValide'];
                $nbJustificatifs = $lesInfosFicheFrais['nbJustificatifs'];
                $dateModif = dateAnglaisVersFrancais($lesInfosFicheFrais['dateModif']);
                // Message de confirmation : 
                //ajouterInformation('Les éléments forfaitisés de la fiche de frais ont bien étés mis a jours');
                //Appel de la vue vc_ficheFrais
                $myView = new View('vc_ficheFrais');
                $myView->renderc(array(
                    'estConnecte' => true,
                    'visiteurSelectionne' => $idVisiteur,
                    'lesVisiteurs' => $lesVisiteurs,
                    'lstMois' => $leMois,
                    'lesMois' => $lesMois,
                    'numMois' => $numMois,
                    'numAnnee' => $numAnnee,
                    'libEtat' => $libEtat,
                    'dateModif' => $dateModif,
                    'montantValide' => $montantValide,
                    'nbJustificatifs' => $nbJustificatifs,
                    'lesFraisForfait' => $lesFraisForfait,
                    'lesFraisHorsForfait' => $lesFraisHorsForfait
                ));
            break;
            case 'refuserHF':
                //Récup données formulaire
                $leFHF = $idFHF;
                $idVisiteur = $leVisiteur;
                $leMois = $lstMois;
                //Suppression du FHF
                $pdo->supprimerFraisHorsForfait($leFHF);
                //Recalculer le montant de la fiche
                $pdo->majMontantFicheFrais($idVisiteur, $leMois);
                //Retour à la vue
                $lesVisiteurs = $pdo->getLesVisiteursAValider("CL");
                $lesMois = $pdo->getLesMoisAValider($idVisiteur, "CL");
                $leMois = $lstMois;
                $lesFraisHorsForfait = $pdo->getLesFraisHorsForfait($idVisiteur, $leMois);
                $lesFraisForfait = $pdo->getLesFraisForfait($idVisiteur, $leMois);
                $lesInfosFicheFrais = $pdo->getLesInfosFicheFrais($idVisiteur, $leMois);
                $numAnnee = substr($leMois, 0, 4);
                $numMois = substr($leMois, 4, 2);
                $libEtat = $lesInfosFicheFrais['libEtat'];
                $montantValide = $lesInfosFicheFrais['montantValide'];
                $nbJustificatifs = $lesInfosFicheFrais['nbJustificatifs'];
                $dateModif = dateAnglaisVersFrancais($lesInfosFicheFrais['dateModif']);
                // Message de confirmation : 
                //ajouterInformation('Les éléments forfaitisés de la fiche de frais ont bien étés mis a jours');
                //Appel de la vue vc_ficheFrais
                $myView = new View('vc_ficheFrais');
                $myView->renderc(array(
                    'estConnecte' => true,
                    'visiteurSelectionne' => $idVisiteur,
                    'lesVisiteurs' => $lesVisiteurs,
                    'lstMois' => $leMois,
                    'lesMois' => $lesMois,
                    'numMois' => $numMois,
                    'numAnnee' => $numAnnee,
                    'libEtat' => $libEtat,
                    'dateModif' => $dateModif,
                    'montantValide' => $montantValide,
                    'nbJustificatifs' => $nbJustificatifs,
                    'lesFraisForfait' => $lesFraisForfait,
                    'lesFraisHorsForfait' => $lesFraisHorsForfait
                ));
            break;
        case 'validerFicheFrais':
            //Récup données formulaire
            $idVisiteur = $leVisiteur;
            $leMois = $lstMois;
            //Metre à jour état FF à VA + date
            $pdo->majEtatFicheFrais($idVisiteur, $leMois, "VA");
            //Réaffichage de la vue
            $lesVisiteurs = $pdo->getLesVisiteursAValider("CL");
            $lesMois = $pdo->getLesMoisAValider($idVisiteur, "CL");
            $leMois = $lstMois;
            $lesFraisHorsForfait = $pdo->getLesFraisHorsForfait($idVisiteur, $leMois);
            $lesFraisForfait = $pdo->getLesFraisForfait($idVisiteur, $leMois);
            $lesInfosFicheFrais = $pdo->getLesInfosFicheFrais($idVisiteur, $leMois);
            $numAnnee = substr($leMois, 0, 4);
            $numMois = substr($leMois, 4, 2);
            $libEtat = $lesInfosFicheFrais['libEtat'];
            $montantValide = $lesInfosFicheFrais['montantValide'];
            $nbJustificatifs = $lesInfosFicheFrais['nbJustificatifs'];
            $dateModif = dateAnglaisVersFrancais($lesInfosFicheFrais['dateModif']);
            // Message de confirmation : 
            //ajouterInformation('Les éléments forfaitisés de la fiche de frais ont bien étés mis a jours');
            //Appel de la vue vc_ficheFrais
            $myView = new View('vc_ficheFrais');
            $myView->renderc(array(
                'estConnecte' => true,
                'visiteurSelectionne' => $idVisiteur,
                'lesVisiteurs' => $lesVisiteurs,
                'lstMois' => $leMois,
                'lesMois' => $lesMois,
                'numMois' => $numMois,
                'numAnnee' => $numAnnee,
                'libEtat' => $libEtat,
                'dateModif' => $dateModif,
                'montantValide' => $montantValide,
                'nbJustificatifs' => $nbJustificatifs,
                'lesFraisForfait' => $lesFraisForfait,
                'lesFraisHorsForfait' => $lesFraisHorsForfait
            ));
        break;
        default:
            //Cas erreur action inexistante
            $this->erreur();
        break;
        }
    }

    public function suivreFrais($params)
    {
        $pdo = GsbManager::getPdoGsb();
        //extraction des paramètres pour récupérer action à faire et autres (GET|POST)
        extract($params);
        //En fonction de l'action demandée par le visiteur
        switch ($action) {
            case 'selectionnerVisiteur':
                //Recherche des visiteurs avec FF etat VA en BD 
                $lesVisiteurs = $pdo->getLesVisiteursAValider("VA");

                //Affichage de la vue 
                $myView = new View('vc_listeVisiteursVA');
                $myView->renderc(array(
                    'estConnecte' => true,
                    'lesVisiteurs' => $lesVisiteurs
                ));
            break;
            case 'selectionnerMois':
                //Quel visiteur
                $idVisiteur = $lstVisiteurs;
                //Recherche des visiteurs et les mois du visiteur avec FF etat CL en BD 
                $lesVisiteurs = $pdo->getLesVisiteursAValider("VA");
                $lesMois = $pdo->getLesMoisAValider($idVisiteur, "VA");
                // Afin de sélectionner par défaut le dernier mois dans la zone de liste
                // on demande toutes les clés, et on prend la première,
                // les mois étant triés décroissants
                $lesCles = array_keys($lesMois);
                $moisASelectionner = $lesCles[0];
                //Affichage de la vue actualisée
                $myView = new View('vc_listeMoisVA');
                $myView->renderc(array(
                    'estConnecte' => true,
                    'visiteurSelectionne' => $idVisiteur,
                    'lesVisiteurs' => $lesVisiteurs,
                    'lesMois' => $lesMois,
                    'moisSelectionne' => $moisASelectionner
                ));
            break;

            case 'voirFiche':
                //Récup données formulaire
                $idVisiteur = $leVisiteur;
                $leMois = $lstMois;
                //Réaffichage de la vue
                $lesVisiteurs = $pdo->getLesVisiteursAValider("VA");
                $lesMois = $pdo->getLesMoisAValider($idVisiteur, "VA");
                $leMois = $lstMois;
                $lesFraisHorsForfait = $pdo->getLesFraisHorsForfait($idVisiteur, $leMois);
                $lesFraisForfait = $pdo->getLesFraisForfait($idVisiteur, $leMois);
                $lesInfosFicheFrais = $pdo->getLesInfosFicheFrais($idVisiteur, $leMois);
                $numAnnee = substr($leMois, 0, 4);
                $numMois = substr($leMois, 4, 2);
                $libEtat = $lesInfosFicheFrais['libEtat'];
                $montantValide = $lesInfosFicheFrais['montantValide'];
                $nbJustificatifs = $lesInfosFicheFrais['nbJustificatifs'];
                $dateModif = dateAnglaisVersFrancais($lesInfosFicheFrais['dateModif']);
                // Message de confirmation : 
                //ajouterInformation('Les éléments forfaitisés de la fiche de frais ont bien étés mis a jours');
                //Appel de la vue vc_ficheFrais
                $myView = new View('vc_ficheFraisVA');
                $myView->renderc(array(
                    'estConnecte' => true,
                    'visiteurSelectionne' => $idVisiteur,
                    'lesVisiteurs' => $lesVisiteurs,
                    'lstMois' => $leMois,
                    'lesMois' => $lesMois,
                    'numMois' => $numMois,
                    'numAnnee' => $numAnnee,
                    'libEtat' => $libEtat,
                    'dateModif' => $dateModif,
                    'montantValide' => $montantValide,
                    'nbJustificatifs' => $nbJustificatifs,
                    'lesFraisForfait' => $lesFraisForfait,
                    'lesFraisHorsForfait' => $lesFraisHorsForfait
                ));
                break;
            case 'MPFicheFrais':
                //Récup données formulaire
                $idVisiteur = $leVisiteur;
                $leMois = $lstMois;
                //Mettre à jour état FF à PM + date
                $pdo->majEtatFicheFrais($idVisiteur, $leMois, "PM");
                //Réaffichage de la vue
                $lesVisiteurs = $pdo->getLesVisiteursAValider("VA");
                $lesMois = $pdo->getLesMoisAValider($idVisiteur, "VA");
                $leMois = $lstMois;
                $lesFraisHorsForfait = $pdo->getLesFraisHorsForfait($idVisiteur, $leMois);
                $lesFraisForfait = $pdo->getLesFraisForfait($idVisiteur, $leMois);
                $lesInfosFicheFrais = $pdo->getLesInfosFicheFrais($idVisiteur, $leMois);
                $numAnnee = substr($leMois, 0, 4);
                $numMois = substr($leMois, 4, 2);
                $libEtat = $lesInfosFicheFrais['libEtat'];
                $montantValide = $lesInfosFicheFrais['montantValide'];
                $nbJustificatifs = $lesInfosFicheFrais['nbJustificatifs'];
                $dateModif = dateAnglaisVersFrancais($lesInfosFicheFrais['dateModif']);
                // Message de confirmation : 
                //ajouterInformation('Les éléments forfaitisés de la fiche de frais ont bien étés mis a jours');
                //Appel de la vue vc_ficheFrais
                $myView = new View('vc_ficheFraisVA');
                $myView->renderc(array(
                    'estConnecte' => true,
                    'visiteurSelectionne' => $idVisiteur,
                    'lesVisiteurs' => $lesVisiteurs,
                    'lstMois' => $leMois,
                    'lesMois' => $lesMois,
                    'numMois' => $numMois,
                    'numAnnee' => $numAnnee,
                    'libEtat' => $libEtat,
                    'dateModif' => $dateModif,
                    'montantValide' => $montantValide,
                    'nbJustificatifs' => $nbJustificatifs,
                    'lesFraisForfait' => $lesFraisForfait,
                    'lesFraisHorsForfait' => $lesFraisHorsForfait
                ));
            break;
            case 'RemboursementFicheFrais':
                //Récup données formulaire
                $idVisiteur = $leVisiteur;
                $leMois = $lstMois;
                //Metre à jour état FF à RB + date
                $pdo->majEtatFicheFrais($idVisiteur, $leMois, "RB");

                $lesVisiteurs = $pdo->getLesVisiteursAValider("VA");
                $lesMois = $pdo->getLesMoisAValider($idVisiteur, "VA");
                $leMois = $lstMois;
                $lesFraisHorsForfait = $pdo->getLesFraisHorsForfait($idVisiteur, $leMois);
                $lesFraisForfait = $pdo->getLesFraisForfait($idVisiteur, $leMois);
                $lesInfosFicheFrais = $pdo->getLesInfosFicheFrais($idVisiteur, $leMois);
                $numAnnee = substr($leMois, 0, 4);
                $numMois = substr($leMois, 4, 2);
                $libEtat = $lesInfosFicheFrais['libEtat'];
                $montantValide = $lesInfosFicheFrais['montantValide'];
                $nbJustificatifs = $lesInfosFicheFrais['nbJustificatifs'];
                $dateModif = dateAnglaisVersFrancais($lesInfosFicheFrais['dateModif']);
                // Message de confirmation : 
                //ajouterInformation('Les éléments forfaitisés de la fiche de frais ont bien étés mis a jours');
                //Appel de la vue vc_ficheFrais
                $myView = new View('vc_ficheFraisVA');
                $myView->renderc(array(
                    'estConnecte' => true,
                    'visiteurSelectionne' => $idVisiteur,
                    'lesVisiteurs' => $lesVisiteurs,
                    'lstMois' => $leMois,
                    'lesMois' => $lesMois,
                    'numMois' => $numMois,
                    'numAnnee' => $numAnnee,
                    'libEtat' => $libEtat,
                    'dateModif' => $dateModif,
                    'montantValide' => $montantValide,
                    'nbJustificatifs' => $nbJustificatifs,
                    'lesFraisForfait' => $lesFraisForfait,
                    'lesFraisHorsForfait' => $lesFraisHorsForfait
                ));
                break;
            default:
                //Cas erreur action inexistante
                $this->erreur();
            break;
        }
    }

    public function erreur()
    {
      //Affichage de la vue 404
        $myView = new View('v_404');
        $myView->render(array('estConnecte' => true));

    }
}
