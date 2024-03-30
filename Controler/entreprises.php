<?php
require_once '../Modèle/header.php';
require '../Modèle/entreprise.class.php';

$ent = new Entreprise();
$resTopEnt = $ent->chercherEntreprise('', '', '', '', '', 0, 0, 0 ,0 ,0 ,1 ,0 ,0 ,0 , 1); // top entreprise (like)

if (count($resTopEnt) >= 6) {
    // Première entreprise
    $topEnt1 = $resTopEnt[0];
    $smarty_obj->assign('TopEnt1Nom', $topEnt1->getNom());
    $smarty_obj->assign('TopEnt1Note', $topEnt1->getNote());
    $smarty_obj->assign('TopEnt1Like', $topEnt1->getLike());

    // Deuxième entreprise
    $topEnt2 = $resTopEnt[1];
    $smarty_obj->assign('TopEnt2Nom', $topEnt2->getNom());
    $smarty_obj->assign('TopEnt2Note', $topEnt2->getNote());
    $smarty_obj->assign('TopEnt2Like', $topEnt2->getLike());

    // Troisième entreprise
    $topEnt3 = $resTopEnt[2];
    $smarty_obj->assign('TopEnt3Nom', $topEnt3->getNom());
    $smarty_obj->assign('TopEnt3Note', $topEnt3->getNote());
    $smarty_obj->assign('TopEnt3Like', $topEnt3->getLike());

    // Quatrième entreprise
    $topEnt4 = $resTopEnt[3];
    $smarty_obj->assign('TopEnt4Nom', $topEnt4->getNom());
    $smarty_obj->assign('TopEnt4Note', $topEnt4->getNote());
    $smarty_obj->assign('TopEnt4Like', $topEnt4->getLike());

    // Cinquième entreprise
    $topEnt5 = $resTopEnt[4];
    $smarty_obj->assign('TopEnt5Nom', $topEnt5->getNom());
    $smarty_obj->assign('TopEnt5Note', $topEnt5->getNote());
    $smarty_obj->assign('TopEnt5Like', $topEnt5->getLike());

    // Sixième entreprise
    $topEnt6 = $resTopEnt[5];
    $smarty_obj->assign('TopEnt6Nom', $topEnt6->getNom());
    $smarty_obj->assign('TopEnt6Note', $topEnt6->getNote());
    $smarty_obj->assign('TopEnt6Like', $topEnt6->getLike());
}

$smarty_obj->display('../View/recherche_entreprises.tpl');

// apres check les post et faire un display 