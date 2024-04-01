<?php
require_once '../Modèle/header.php';
require '../Modèle/entreprise.class.php';

$ent = new Entreprise();

$resEnt = $ent->chercherEntreprise('', '', '', '', '', 0, 0, 0 ,0 ,0 ,1 ,0 ,0 ,0 , 0); // apres chargement pas de trie ni de filtre

$resTopEnt = $ent->chercherEntreprise('', '', '', '', '', 0, 0, 0 ,0 ,0 ,1 ,0 ,0 ,0 , 1); // top entreprise (like)





// -------------------------------------------------- Présentation Entreprise -----------------------------------------------------------

if (isset($_GET['id']) && isset($_GET['s']) && $_GET['s'] === 'Onload') {
    // Afficher la page de présentation de l'entreprise
    $current_ent = $_GET['id'];
    $smarty_obj->assign('LogoEnt', $resEnt[$current_ent]->getLogo());
    $smarty_obj->assign('NomEnt', $resEnt[$current_ent]->getNom());
    $smarty_obj->assign('SecteurEnt', $resEnt[$current_ent]->getSecteur());
    $smarty_obj->assign('AdrEnt', $resEnt[$current_ent]->getAdresse());
    $smarty_obj->assign('VillesEnt', $resEnt[$current_ent]->getVille());
    $smarty_obj->assign('PaysEnt', $resEnt[$current_ent]->getPays());
    $smarty_obj->assign('NoteEnt', $resEnt[$current_ent]->getNote());
    $smarty_obj->assign('WhListEnt', $resEnt[$current_ent]->getLike());
    if ($_SESSION['statut'] == 'etudiant'){
        $smarty_obj->assign('masquer', '');
    } else {
        $smarty_obj->assign('masquer', "<label id='masquer'>masquer<input  id='masquerInput' type='checkbox' name='masquer' value='masquer'></label>");
    }
    $smarty_obj->display("../View/presentation_entreprise.tpl");

} else if (isset($_GET['id']) && isset($_GET['s']) && $_GET['s'] === 'TopEntreprise') {
    // Afficher la page de présentation de top Entreprise
    $current_ent = $_GET['id'];
    $smarty_obj->assign('LogoEnt', $resTopEnt[$current_ent]->getLogo());
    $smarty_obj->assign('NomEnt', $resTopEnt[$current_ent]->getNom());
    $smarty_obj->assign('SecteurEnt', $resTopEnt[$current_ent]->getSecteur());
    $smarty_obj->assign('AdrEnt', $resTopEnt[$current_ent]->getAdresse());
    $smarty_obj->assign('VillesEnt', $resTopEnt[$current_ent]->getVille());
    $smarty_obj->assign('PaysEnt', $resTopEnt[$current_ent]->getPays());
    $smarty_obj->assign('NoteEnt', $resTopEnt[$current_ent]->getNote());
    $smarty_obj->assign('WhListEnt', $resTopEnt[$current_ent]->getLike());
    if ($_SESSION['statut'] == 'etudiant'){
        $smarty_obj->assign('masquer', '');
    } else {
        $smarty_obj->assign('masquer', "<label id='masquer'>masquer<input  id='masquerInput' type='checkbox' name='masquer' value='masquer'></label>");
    }
    $smarty_obj->display("../View/presentation_entreprise.tpl");


} else {



   
//-------------------------------------------- Avec recherche filtres (page de base) ---------------------------------------------------------
    
$current_page = isset($_GET['page']) ? $_GET['page'] : 1;

/*  $json_data = json_decode(file_get_contents('php://input'), true);

    if (isset($json_data['type']) && $json_data['type'] === "filtres") {
        // Traiter les données de filtres
    
        $nom = ($json_data['nom'] == 'all') ? "" : $json_data['nom'];
        $activite = ($json_data['activite'] == 'all') ? "" : $json_data['activite'];
        $pays = ($json_data['pays'] == 'all') ? "" : $json_data['pays'];
        $ville = ($json_data['ville'] == 'all') ? "" : $json_data['ville'];
        $adresse = ($json_data['adresse'] == 'all') ? "" : $json_data['adresse'];
        $filtre1 = isset($json_data['evaluationFilter1']) ? $json_data['evaluationFilter1'] : 0;
        $filtre2 = isset($json_data['evaluationFilter2']) ? $json_data['evaluationFilter2'] : 0;
        $filtre3 = isset($json_data['evaluationFilter3']) ? $json_data['evaluationFilter3'] : 0;
        $filtre4 = isset($json_data['evaluationFilter4']) ? $json_data['evaluationFilter4'] : 0;
        $filtre5 = isset($json_data['evaluationFilter5']) ? $json_data['evaluationFilter5'] : 0;
        $filtre6 = isset($json_data['evaluationFilter6']) ? $json_data['evaluationFilter6'] : 0;
        $trie1 = isset($json_data['NoteAsc']) ? $json_data['NoteAsc'] : 0;
        $trie2 = isset($json_data['NoteDesc']) ? $json_data['NoteDesc'] : 0;
        $trie3 = isset($json_data['LikeAsc']) ? $json_data['LikeAsc'] : 0;
        $trie4 = isset($json_data['LikeDesc']) ? $json_data['LikeDesc'] : 0;
        */

if ($_SERVER["REQUEST_METHOD"] === "GET") {
    $data = file_get_contents("php://input");
    $jsonData = json_decode($data);

    if (isset($jsonData->type) && $jsonData->type === "filtres") {
        // Traiter les données de filtres

        $nom = ($_GET['nom'] == 'all') ? "" : $_GET['nom'];

        $activite = ($_GET['activite'] == 'all') ? "" : $_GET['activite'];
        $pays = ($_GET['pays'] == 'all') ? "" : $_GET['pays'];
        $ville = ($_GET['ville'] == 'all') ? "" : $_GET['ville'];
        $adresse = ($_GET['adresse'] == 'all') ? "" : $_GET['adresse'];
        $filtre1 = isset($_GET['evaluationFilter1']) ? $_GET['evaluationFilter1'] : 0;
        $filtre1 = isset($_GET['evaluationFilter2']) ? $_GET['evaluationFilter2'] : 0;
        $filtre1 = isset($_GET['evaluationFilter3']) ? $_GET['evaluationFilter3'] : 0;
        $filtre1 = isset($_GET['evaluationFilter4']) ? $_GET['evaluationFilter4'] : 0;
        $filtre1 = isset($_GET['evaluationFilter5']) ? $_GET['evaluationFilter5'] : 0;
        $filtre1 = isset($_GET['evaluationFilter6']) ? $_GET['evaluationFilter6'] : 0;
        $trie1 = isset($_GET['NoteAsc']) ? $_GET['NoteAsc'] : 0;
        $trie2 = isset($_GET['NoteDesc']) ? $_GET['NoteDesc'] : 0;
        $trie3 = isset($_GET['LikeAsc']) ? $_GET['LikeAsc'] : 0;
        $trie4 = isset($_GET['LikeDesc']) ? $_GET['LikeDesc'] : 0;
    
        $resFiltresEnt = $ent->chercherEntreprise($entreprise, $activite, $pays, $ville, $adresse, $filtre1, $filtre2, $filtre3, $filtre4, $filtre5, $filtre6, $trie1, $trie2, $trie3, $trie4);

        $nbtotalEnt = count($resFiltresEnt);

        $nbpage = ceil($nbtotalEnt / 4);

        $livre = ceil($current_page / 6);
    
        $derpage = $livre * 6;
    
        $page1 = $derpage -5;
        $page2 = $derpage -4;
        $page3 = $derpage -3;
        $page4 = $derpage -2;
        $page5 = $derpage -1;
    
        $i = 4 * ($current_page - 1);

        $smarty_obj->assign('Ent1',"<li class='OptionEntreprise' onclick='voirEntreprise(". $i .", 0)'><article><h5 class='TitreEntreprise'>". $resFiltresEnt[$i]->getNom() ."</h5><p class='DescriptionEntreprise'>note : ". $resFiltresEnt[$i]->getNote() . " &nbsp;&nbsp;&nbsp; likes : ". $resFiltresEnt[$i]->getLike() ."</p></article></li>");
        $smarty_obj->assign('Ent2',"<li class='OptionEntreprise' onclick='voirEntreprise(". ($i+1) .", 0)'><article><h5 class='TitreEntreprise'>". $resFiltresEnt[$i+1]->getNom() ."</h5><p class='DescriptionEntreprise'>note : ". $resFiltresEnt[$i+1]->getNote() ." &nbsp;&nbsp;&nbsp; likes :". $resFiltresEnt[$i+1]->getLike() ."</p></article></li>");
        $smarty_obj->assign('Ent3',"<li class='OptionEntreprise' onclick='voirEntreprise(". ($i+2) .", 0)'><article><h5 class='TitreEntreprise'>". $resFiltresEnt[$i+2]->getNom() ."</h5><p class='DescriptionEntreprise'>note : ". $resFiltresEnt[$i+2]->getNote() ." &nbsp;&nbsp;&nbsp; likes : ". $resFiltresEnt[$i+2]->getLike() ."</p></article></li>");
        $smarty_obj->assign('Ent4',"<li class='OptionEntreprise' onclick='voirEntreprise(". ($i+3) .", 0)'><article><h5 class='TitreEntreprise'>". $resFiltresEnt[$i+3]->getNom() ."</h5><p class='DescriptionEntreprise'>note : ". $resFiltresEnt[$i+3]->getNote() ." &nbsp;&nbsp;&nbsp; likes : ". $resFiltresEnt[$i+3]->getLike() ."</p></article></li>");
    }



//-------------------------------------------- Apres chargement (page de base) --------------------------------------------------------------

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


    $smarty_obj->assign('Ent1',"<li class='OptionEntreprise' onclick='voirEntreprise(". $i .", 0)'><article><h5 class='TitreEntreprise'>". $resEnt[$i]->getNom() ."</h5><p class='DescriptionEntreprise'>note : ". $resEnt[$i]->getNote() . " &nbsp;&nbsp;&nbsp; likes : ". $resEnt[$i]->getLike() ."</p></article></li>");
    $smarty_obj->assign('Ent2',"<li class='OptionEntreprise' onclick='voirEntreprise(". ($i+1) .", 0)'><article><h5 class='TitreEntreprise'>". $resEnt[$i+1]->getNom() ."</h5><p class='DescriptionEntreprise'>note : ". $resEnt[$i+1]->getNote() ." &nbsp;&nbsp;&nbsp; likes :". $resEnt[$i+1]->getLike() ."</p></article></li>");
    $smarty_obj->assign('Ent3',"<li class='OptionEntreprise' onclick='voirEntreprise(". ($i+2) .", 0)'><article><h5 class='TitreEntreprise'>". $resEnt[$i+2]->getNom() ."</h5><p class='DescriptionEntreprise'>note : ". $resEnt[$i+2]->getNote() ." &nbsp;&nbsp;&nbsp; likes : ". $resEnt[$i+2]->getLike() ."</p></article></li>");
    $smarty_obj->assign('Ent4',"<li class='OptionEntreprise' onclick='voirEntreprise(". ($i+3) .", 0)'><article><h5 class='TitreEntreprise'>". $resEnt[$i+3]->getNom() ."</h5><p class='DescriptionEntreprise'>note : ". $resEnt[$i+3]->getNote() ." &nbsp;&nbsp;&nbsp; likes : ". $resEnt[$i+3]->getLike() ."</p></article></li>");

}





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


if (count($resTopEnt) >= 6) {
    // Première entreprise  
    $smarty_obj->assign('TopEnt1',"<article class='OptionTopEntreprises' onclick='voirEntreprise(0, 1)'><h5 class='TitreEntreprise'>". $resTopEnt[0]->getNom() ."</h5><p class='DescriptionEntreprise'>note : ". $resTopEnt[0]->getNote() ." &nbsp;&nbsp;&nbsp; likes : ". $resTopEnt[0]->getLike() ."</p></article>");

    // Deuxième entreprise
    $smarty_obj->assign('TopEnt2',"<article class='OptionTopEntreprises' onclick='voirEntreprise(1, 1)'><h5 class='TitreEntreprise'>". $resTopEnt[1]->getNom() ."</h5><p class='DescriptionEntreprise'>note : ". $resTopEnt[1]->getNote() ." &nbsp;&nbsp;&nbsp; likes : ". $resTopEnt[1]->getLike() ."</p></article>");

    // Troisième entreprise
    $smarty_obj->assign('TopEnt3',"<article class='OptionTopEntreprises' onclick='voirEntreprise(2, 1)'><h5 class='TitreEntreprise'>". $resTopEnt[2]->getNom() ."</h5><p class='DescriptionEntreprise'>note : ". $resTopEnt[2]->getNote() ." &nbsp;&nbsp;&nbsp; likes : ". $resTopEnt[2]->getLike() ."</p></article>");

    // Quatrième entreprise
    $smarty_obj->assign('TopEnt4',"<article class='OptionTopEntreprises' onclick='voirEntreprise(3, 1)'><h5 class='TitreEntreprise'>". $resTopEnt[3]->getNom() ."</h5><p class='DescriptionEntreprise'>note : ". $resTopEnt[3]->getNote() ." &nbsp;&nbsp;&nbsp; likes : ". $resTopEnt[3]->getLike() ."</p></article>");

    // Cinquième entreprise
    $smarty_obj->assign('TopEnt5',"<article class='OptionTopEntreprises' onclick='voirEntreprise(4, 1)'><h5 class='TitreEntreprise'>". $resTopEnt[4]->getNom() ."</h5><p class='DescriptionEntreprise'>note : ". $resTopEnt[4]->getNote() ." &nbsp;&nbsp;&nbsp; likes : ". $resTopEnt[4]->getLike() ."</p></article>");

    // Sixième entreprise 
    $smarty_obj->assign('TopEnt6',"<article class='OptionTopEntreprises' onclick='voirEntreprise(5, 1)'><h5 class='TitreEntreprise'>". $resTopEnt[5]->getNom() ."</h5><p class='DescriptionEntreprise'>note : ". $resTopEnt[5]->getNote() ." &nbsp;&nbsp;&nbsp; likes : ". $resTopEnt[5]->getLike() ."</p></article>");
}

$smarty_obj->display('../View/recherche_entreprises.tpl');

}




function MasquerEntreprise(){
    if (isset($_GET['id']) && $_GET['s'] === 'Onload') {
        $current_ent = $_GET['id'];
        global $resEnt;
        $resEnt[$current_ent]->masquerEntreprise();

    }
    else if (isset($_GET['id']) && $_GET['s'] === 'TopEntreprise') {
        $current_ent = $_GET['id'];
        global $resTopEnt;
        $resTopEnt[$current_ent]->masquerEntreprise();
        global $ent;
        $resTopEnt = $ent->chercherEntreprise('', '', '', '', '', 0, 0, 0 ,0 ,0 ,1 ,0 ,0 ,0 , 1);
    }
}

function VisibleEntreprise(){
    if (isset($_GET['id']) && $_GET['s'] === 'Onload') {
        $current_ent = $_GET['id'];
        global $resEnt;
        $resEnt[$current_ent]->visibleEntreprise();
    }
    else if (isset($_GET['id']) && $_GET['s'] === 'TopEntreprise') {
        $current_ent = $_GET['id'];
        global $resTopEnt;
        $resTopEnt[$current_ent]->visibleEntreprise();
        global $ent;
        $resTopEnt = $ent->chercherEntreprise('', '', '', '', '', 0, 0, 0 ,0 ,0 ,1 ,0 ,0 ,0 , 1);
    }
}