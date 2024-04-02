<?php
require "connect_db.php";
include "../Modèle/index_modele.php";

//______________________________________________________________________________________________________

$data = json_decode(file_get_contents('php://input'), true);
$nom_pilote = $data['nom'];
$prenom_pilote = $data['prenom'];
$centre_pilote = $data['centre'];
$promo_pilote =  $data['promo'];

global $nom_pilote, $prenom_pilote, $centre_pilote, $promo_pilote,$db;
$obj = new GestionPilote($nom_pilote,$prenom_pilote,$centre_pilote,$promo_pilote);

function create_pilote(){
    global $obj,$db;
    $resultat = $obj->creer($db);
    if($resultat == false){
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        echo 'true';
    }
}

function preedit_pilote(){
    global $obj,$db;
    $resultat = $obj->recherche($db);
    if($resultat == null){
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        echo 'true' ;
    }
}

function edit_pilote(){
    global $obj,$db;
    $resultat = $obj->modifier($db);
    if($resultat == false){
        
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        echo 'true'.'.'.$resultat;
    }
}

if (isset($_GET['action']) && $_GET['action'] === 'createpilote') {
    create_pilote();
} 

if (isset($_GET['action']) && $_GET['action'] === 'preeditpilote') {
    preedit_pilote();
} 

if (isset($_GET['action']) && $_GET['action'] === 'editpilote') {
    edit_pilote();
} 



