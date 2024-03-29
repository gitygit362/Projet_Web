<?php 
require_once ("../../libs/Smarty.class.php");
session_start();
$smarty_obj = new Smarty();
$userData = json_decode($_COOKIE['userData'], true);

$_SESSION['id'] = $userData['id'];
$_SESSION['statut'] = $userData['statut'];

    if ($_SESSION['statut'] == 'admin'){
        $smarty_obj->assign('directionEtudiant', "<a class='refPilote' href='gestion_etudiant/GETU_accueil.html'>Etudiants</a>");
        $smarty_obj->assign('directionPilote', "<a class='refAdmin' href='gestion_pilote/GP_accueil.html'>Pilotes</a>");
        $smarty_obj->assign('directionProfil', "<button class='Profil' type='button' onclick='redirectToProfil(".$_SESSION['statut'].")'>Mon profil</button>");
    }
    else if ($_SESSION['statut'] == 'pilote'){
        $smarty_obj->assign('directionEtudiant', "<a class='refPilote' href='gestion_etudiant/GETU_accueil.html'>Etudiants</a>");
        $smarty_obj->assign('directionPilote', '');
        $smarty_obj->assign('directionProfil', "<button class='Profil' type='button' onclick='redirectToProfil(".$_SESSION['statut'].")'>Mon profil</button>");
    }
    else if ($_SESSION['statut'] == 'etudiant'){
        $smarty_obj->assign('directionEtudiant', '');
        $smarty_obj->assign('directionPilote', '');
        $smarty_obj->assign('directionProfil', "<button class='Profil' type='button' onclick='redirectToProfil(".$_SESSION['statut'].")'>Mon profil</button>");
    }