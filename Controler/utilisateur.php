<?php
require_once '../Modèle/header.php';
require '../Modèle/utilisateur.class.php';


if (isset($_GET['action']) && $_GET['id_users'] === 'suppretudiant') {
    $id_user = $_GET['id'];
} else{
    $id_user = $_SESSION['id'];
}

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
    $smarty_obj->assign("nomUser",$nom);
    $smarty_obj->assign("prenomUser", $prenom);

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
    $utilisateur = new Utilisateur();
    $utilisateur->infosUtilisateur($_SESSION['id'], $_SESSION['statut']);
    $utilisateur->etudiantCentrePromo();
    $id = $utilisateur->getId();
    $nom = $utilisateur->getNom();
    $prenom = $utilisateur->getPrenom();
    $centres = $utilisateur->getCentre();
    $promo = $utilisateur->getPromo();
    $smarty_obj->assign("nomUser",$nom);
    $smarty_obj->assign("prenomUser", $prenom);
    $smarty_obj->assign("centreUser",$centres[0]);
    $smarty_obj->assign("promoUser",$promo[0]);

    $utilisateur->etudiantWhList();
    $wl = $utilisateur->getWhLists();
    $nbWl = count($wl); 
    var_dump($wl);
    // Initialiser un tableau pour stocker toutes les offres
    $allOffres = [];
    
    // Pour chaque ID_offre de la wishlist
    foreach ($wl as $id_offre) {
        // Récupérer les informations de l'offre
        $utilisateur->etudiantOffreWhList($id_offre);
        $allOffres[] = $utilisateur->getOffres();
    }
    
    // Convertir le tableau multidimensionnel en un tableau unidimensionnel
    $uniqueArray = call_user_func_array('array_merge', $allOffres);
    
    // Supprimer les doublons en conservant les clés
    $uniqueArray = array_unique($uniqueArray);
    
    // Réindexer le tableau
    $uniqueArray = array_values($uniqueArray);
    var_dump($allOffres);

    
    for($i=0; $i<20; $i++){
        if ($i<$nbWl){
            $smarty_obj->assign("WL".$i,"<div class='job-offer-container'>
            <div class='job-offer-header'><img src='../View/". $allOffres[$i]['logo'] ."' class='brand-logo'><h3>". $allOffres[$i]['ID_offre'] ."</h3><p>". $allOffres[$i]['nom'] ."</p></div>
            <div class='job-offer-details'><span class='detail'>". $allOffres[$i]['secteur_activité'] ."</span><span class='detail'>niveau :". $allOffres[$i]['promo'] ."</span><span class='detail'>nb places :". $allOffres[$i]['nombre_places'] ."</span><span class='detail'>duree :". $allOffres[$i]['duree'] ." semaines</span></div>
            <button class='delete-button' onclick='SupprWishList(".$allOffres[$i]['ID_offre'].")'><img src='../View/Assets/images/bin.png' alt='Delete'></button></div>");
        }
        else {
            $smarty_obj->assign("WL".$i,"");
        }
    }



    $smarty_obj->display('../View/profil_utilisateur_etudiant.tpl');
}