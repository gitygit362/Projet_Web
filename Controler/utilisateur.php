<?php
require_once '../Modèle/header.php';
require '../Modèle/utilisateur.class.php';

$id_user = $_SESSION['id'];

if ($_SESSION['statut'] == 'admin'){
    $smarty_obj->assign("","");
    $smarty_obj->assign("","");
    $smarty_obj->assign("","");


    $smarty_obj->display('../View/profil_utilisateur_admin.tpl');
}
else if ($_SESSION['statut'] == 'pilote'){
    $utilisateur = new Utilisateur();
    $utilisateur->infosUtilisateur($_SESSION['id'], $_SESSION['statut']);
    $utilisateur->piloteCentrePromo();
    $id = $utilisateur->getId();
    $nom = $utilisateur->getNom();
    $prenom = $utilisateur->getPrenom();
    $centres = $utilisateur->getCentre();
    $taille = count($centres);
    $promo = $utilisateur->getPromo();
    $taille2 = count($promo);
    $smarty_obj->assign("NomUser",$nom);
    $smarty_obj->assign("PrenomUser", $prenom);

    for ($i = 0; $i < 25; $i++) {
        if ($i < $taille) {
            $smarty_obj->assign("centre" . ($i + 1), "<button class='centre-button'>" . $centres[$i] . "</button>");
        } else {
            $smarty_obj->assign("centre" . ($i + 1), "");
        }
    }

    for ($i = 0; $i < 10; $i++) {
        if ($i < $taille2) {
            $smarty_obj->assign("promo". ($i + 1), "<tr><td>" . $promo[$i] . "</td></tr>");
        } else {
            $smarty_obj->assign("promo" . ($i + 1), "");
        }
    }

    $smarty_obj->display('../View/profil_utilisateur_pilote.tpl');
}
else if ($_SESSION['statut'] == 'etudiant'){
    $smarty_obj->assign("","");
    $smarty_obj->assign("","");
    $smarty_obj->assign("","");

    
    $smarty_obj->display('../View/profil_utilisateur_etudiant.tpl');
}