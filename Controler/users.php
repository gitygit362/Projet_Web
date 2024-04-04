<?php
require "../Modèle/config.php";
include "../Modèle/index_modele.php";

//______________________________________________________________________________________________________

$data = json_decode(file_get_contents('php://input'), true);
$nom = $data['nom'];
$prenom = $data['prenom'];
$centre = $data['centre'];
$promo =  $data['promo'];



$pilote = new GestionPilote($nom,$prenom,$centre,$promo);
$etudiant = new GestionEtudiant($nom,$prenom,$centre,$promo);
$db = Database::getInstance();
$connexion = $db->getConnexion();
function create_pilote(){
    global $pilote,$connexion;
    $resultat = $pilote->creer($connexion);
    if($resultat == false){
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        echo 'true';
    }
}

function find_pilote(){
    global $pilote,$connexion;
    $resultat = $pilote->recherche($connexion);
    if($resultat == null){
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        echo 'true'.'.'.$resultat[0];
    }
}

function edit_pilote(){
    global $pilote,$connexion,$data;
    $id = $data['id'];
    $id = intval($id);
    $resultat = $pilote->modifier($connexion,$id);
    if($resultat == false){
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        echo 'true';
    }
}

function delete_pilote(){
    global $pilote,$connexion;
    $resultat = $pilote->supprimer($connexion);
    if($resultat == null){
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        echo 'true';
    }
}

function create_etudiant(){
    global $etudiant,$connexion;
    $resultat = $etudiant->creer($connexion);
    if($resultat == false){
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        echo 'true';
    }
}

function find_etudiant(){
    global $etudiant,$connexion;
    $resultat = $etudiant->recherche($connexion);
    if($resultat == null){
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        echo 'true'.'.'.$resultat[0];
    }
}

function edit_etudiant(){
    global $etudiant,$connexion,$data;
    $id = $data['id'];
    $id = intval($id);
    $resultat = $etudiant->modifier($connexion,$id);
    if($resultat == false){
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        echo 'true';
    }
}

function delete_etudiant(){
    global $etudiant,$connexion;
    $resultat = $etudiant->supprimer($connexion);
    if($resultat == null){
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

if (isset($_GET['action']) && $_GET['action'] === 'supprpilote') {
    delete_pilote();
} 

//____________________________________________________________________________________

if (isset($_GET['action']) && $_GET['action'] === 'creeretudiant') {
    create_etudiant();
} 

if (isset($_GET['action']) && $_GET['action'] === 'preeditetudiant' || isset($_GET['action']) && $_GET['action'] === 'rechercheetudiant') {
    find_etudiant();
} 

if (isset($_GET['action']) && $_GET['action'] === 'editetudiant') {
    edit_etudiant();
} 

if (isset($_GET['action']) && $_GET['action'] === 'suppretudiant') {
    delete_etudiant();
} 