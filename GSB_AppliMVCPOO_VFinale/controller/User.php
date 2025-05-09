<?php

/**
 * Class Controller User
 * 
 * Liste des méthodes qui correspondent aux actions de connexion/déconnexion des visiteurs ou comptables
 */

class User
{

    /**
     * fonction de connexion
     *
     * @param [type] $params : paramètres de URL
     * @return void
     */
    public function connexion($params)
    {
        $myView = new View('v_connexion');
        $myView->render(array('estConnecte' => null));
    }

    public function validerConnexion($params)
    {   
        //extraction des paramètres pour récupérer action à faire et autres (GET|POST)
        extract($params);
        //Le visiteur existe-t-il ?
        $pdo = GsbManager::getPdoGsb();
        $visiteur = $pdo->getInfosVisiteur($login, $mdp);
        if (!is_array($visiteur)) {
            //Est-ce un Comptable ?
            $comptable = $pdo->getInfosComptable($login, $mdp);
            if(!is_array($comptable))
            {
                //Vue erreur informations erronnées
                ajouterErreur('Login ou mot de passe incorrect');
                $myView = new View('v_erreurs');
                $myView->render(array('estConnecte' => null, 'retour' => "/"));
            }
            else{
                //Récupérer les données du comptable extraites de la BD
                $id = $comptable['id'];
                $nom = $comptable['nom'];
                $prenom = $comptable['prenom'];
                $statut = "C";
                //Appel de la méthode connecter()
                connecter($statut, $id, $nom, $prenom);
                //Affichage de la vue accueil Visiteur
                $myView = new View('vc_accueil');
                $myView->render(array('estConnecte' => true));
            }
            
        } else {
            //Récupérer les données extraites de la BD
            $id = $visiteur['id'];
            $nom = $visiteur['nom'];
            $prenom = $visiteur['prenom'];
            $statut = "V";
            //Appel de la méthode connecter()
            connecter($statut, $id, $nom, $prenom);
            //Affichage de la vue accueil Visiteur
            $myView = new View('v_accueil');
            $myView->render(array('estConnecte' => true));
        }
    }
    
    public function deconnexion($params)
    {
        //Appel de la vue
        $myView = new View('v_deconnexion');
        deconnecter();
        $myView->render(array('estConnecte' => true));
    }
}