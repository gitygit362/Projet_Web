<?php
require "connect_db.php";
include "../Modèle/index_modele.php";

//______________________________________________________________________________________________________

$data = json_decode(file_get_contents('php://input'), true);
$nom_pilote = $data['nom'];
$prenom_pilote = $data['prenom'];
$centre_pilote = $data['centre'];
$promo_pilote =  $data['promo'];



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

function find_pilote(){
    global $obj,$db;
    $resultat = $obj->recherche($db);
    if($resultat == null){
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        echo 'true'.'.'.$resultat[0];
    }
}

function edit_pilote(){
    global $obj,$db,$data;
    $id = $data['id'];
    $id = intval($id);
    $resultat = $obj->modifier($db,$id);
    if($resultat == false){
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        echo 'true';
    }
}




if (isset($_GET['action']) && $_GET['action'] === 'createpilote') {
    create_pilote();
} 

if (isset($_GET['action']) && $_GET['action'] === 'preeditpilote' || isset($_GET['action']) && $_GET['action'] === 'recherchepilote') {
    find_pilote();
} 

if (isset($_GET['action']) && $_GET['action'] === 'editpilote') {
    edit_pilote();
} 




