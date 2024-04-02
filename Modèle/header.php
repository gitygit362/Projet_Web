<?php 
require_once '../Controler/libs/Smarty.class.php';
require_once '../Controler/session.php';
$smarty_obj = new Smarty();
demarrerSession();
creerSession();

if ($_SESSION['statut'] == 'admin'){
    $smarty_obj->assign('directionEtudiant', "<a class='refPilote' href='gestion_etudiant/GETU_accueil.html'>Etudiants</a>");
    $smarty_obj->assign('directionPilote', "<a class='refAdmin' href='gestion_pilote/GP_accueil.html'>Pilotes</a>");
    $smarty_obj->assign('directionProfil', "<button class='Profil' type='button' onclick='redirectToProfil(\"admin\")'>Mon profil</button>");
}
else if ($_SESSION['statut'] == 'pilote'){
    $smarty_obj->assign('directionEtudiant', "<a class='refPilote' href='gestion_etudiant/GETU_accueil.html'>Etudiants</a>");
    $smarty_obj->assign('directionPilote', '');
    $smarty_obj->assign('directionProfil', "<button class='Profil' type='button' onclick='redirectToProfil(\"pilote\")'>Mon profil</button>");
}
else if ($_SESSION['statut'] == 'etudiant'){
    $smarty_obj->assign('directionEtudiant', '');
    $smarty_obj->assign('directionPilote', '');
    $smarty_obj->assign('directionProfil', "<button class='Profil' type='button' onclick='redirectToProfil(\"etudiant\")'>Mon profil</button>");
}



