<?php
require_once '../Modèle/header.php';
require '../Modèle/entreprise.class.php';

$ent = new Entreprise();

$current_page = isset($_GET['page']) ? $_GET['page'] : 1;

$resEnt = $ent->chercherEntreprise('', '', '', '', '', 0, 0, 0 ,0 ,0 ,1 ,0 ,0 ,0 , 0); // apres chargement pas de trie ni de filtre

$nbtotalEnt = count($resEnt);

$nbpage = ceil($nbtotalEnt / 4);

$livre = ceil($current_page / 6);

$derpage = $livre * 6;

$page1 = $derpage -5;
$page2 = $derpage -4;
$page3 = $derpage -3;
$page4 = $derpage -2;
$page5 = $derpage -1;

$i = 4 * ($current_page - 1);


$smarty_obj->assign('Ent1',"<li class='OptionEntreprise' onclick='voirEntreprise()'><article><h5 class='TitreEntreprise'>". $resEnt[$i]->getNom() ."</h5><p class='DescriptionEntreprise'>note : ". $resEnt[$i]->getNote() . " &nbsp;&nbsp;&nbsp; likes : ". $resEnt[$i]->getLike() ."</p></article></li>");
$smarty_obj->assign('Ent2',"<li class='OptionEntreprise' onclick='voirEntreprise()'><article><h5 class='TitreEntreprise'>". $resEnt[$i+1]->getNom() ."</h5><p class='DescriptionEntreprise'>note : ". $resEnt[$i+1]->getNote() ." &nbsp;&nbsp;&nbsp; likes :". $resEnt[$i+1]->getLike() ."</p></article></li>");
$smarty_obj->assign('Ent3',"<li class='OptionEntreprise' onclick='voirEntreprise()'><article><h5 class='TitreEntreprise'>". $resEnt[$i+2]->getNom() ."</h5><p class='DescriptionEntreprise'>note : ". $resEnt[$i+2]->getNote() ." &nbsp;&nbsp;&nbsp; likes : ". $resEnt[$i+2]->getLike() ."</p></article></li>");
$smarty_obj->assign('Ent4',"<li class='OptionEntreprise' onclick='voirEntreprise()'><article><h5 class='TitreEntreprise'>". $resEnt[$i+3]->getNom() ."</h5><p class='DescriptionEntreprise'>note : ". $resEnt[$i+3]->getNote() ." &nbsp;&nbsp;&nbsp; likes : ". $resEnt[$i+3]->getLike() ."</p></article></li>");




$smarty_obj->assign('Page1', "<a href='?page=". $page1 ."'class='active'>". $page1 ."</a>");
$smarty_obj->assign('Page2', "<a href='?page=". $page2 ."'>". $page2 ."</a>");
$smarty_obj->assign('Page3', "<a href='?page=". $page3 ."'>". $page3 ."</a>");
$smarty_obj->assign('Page4', "<a href='?page=". $page4 ."'>". $page4 ."</a>");
$smarty_obj->assign('Page5', "<a href='?page=". $page5 ."'>". $page5 ."</a>");
$smarty_obj->assign('Page6', "<a href='?page=". $derpage ."'>". $derpage ."</a>");

$paginationPre = "";
$paginationSui = "";

if ($livre > 1) {
    $paginationPre = "<a href='?page=". ((($livre-1)*6)-5) ."'>&laquo;</a>";
}

if (($derpage + 1) <= $nbpage) {
    $paginationSui = "<a href='?page=". ($derpage + 1) ."'>&raquo;</a>";
}

// Assignation des liens de pagination à Smarty
$smarty_obj->assign('PaginationPre', $paginationPre);
$smarty_obj->assign('PaginationSui', $paginationSui);









// ---------------------------  TOP ENTREPRISES ----------------------------------------

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