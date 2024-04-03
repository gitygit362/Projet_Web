<?php 
require_once '../Modèle/entreprise.class.php';
require 'session.php';
require_once '../Controler/libs/Smarty.class.php';

demarrerSession();
creerSession();

$smarty_obj = new Smarty();

$id = null; 

if (isset($_GET['action']) && $_GET['action'] == 'creerEntreprise') {
    $data = json_decode(file_get_contents("php://input"));

    $entreprise = new Entreprise();
    $resultat = $entreprise->creerEntreprise($data->nom, $data->secteur, $data->logo);

    $id = $resultat;
    $entreprise->noterEntreprise($_SESSION['id'], $_SESSION['statut'], $id, $data->note);
    echo $resultat;
}

if (isset($_GET['action']) && $_GET['action'] == 'creerEntrepriseAdresse') {
    $data2 = json_decode(file_get_contents("php://input"));
    $entreprise = new Entreprise();
    $resultat = $entreprise->creerEntrepriseAdresse($data2->adresse, $data2->ville, $data2->pays, $data2->id);
    echo 'true';

}

if(isset($_GET['action']) && $_GET['action'] == 'masquerEntreprise'){
    $data = json_decode(file_get_contents("php://input"));
    $entreprise = new Entreprise();
    $entreprise->masquerEntreprise($data->nom1, $data->nom2);
    echo 'true';
}

if(isset($_GET['action']) && $_GET['action'] == 'aModifierEntreprise'){
    $data = json_decode(file_get_contents("php://input"));
    $entreprise = new Entreprise();
    echo $resData = $entreprise->entrepriseAModifier($data->nom);
}
else {
    $smarty_obj->assign("nomEntreprise", "");
    $smarty_obj->assign("secteurEntreprise", "");
    $smarty_obj->display("../View/gestion_entreprise/GE_modification.tpl");
}

