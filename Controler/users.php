<?php
require "connect_db.php";
include "../Modèle/index_modele.php";

//______________________________________________________________________________________________________

$data = json_decode(file_get_contents('php://input'), true);
$nom = $data['nom'];
$prenom = $data['prenom'];
$centre = $data['centre'];
$promo =  $data['promo'];



$pilote = new GestionPilote($nom,$prenom,$centre,$promo);
$etudiant = new GestionEtudiant($nom,$prenom,$centre,$promo);

function create_pilote(){
    global $pilote,$db;
    $resultat = $pilote->creer($db);
    if($resultat == false){
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        echo 'true';
    }
}

function find_pilote(){
    global $pilote,$db;
    $resultat = $pilote->recherche($db);
    if($resultat == null){
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        echo 'true'.'.'.$resultat[0];
    }
}

function edit_pilote(){
    global $pilote,$db,$data;
    $id = $data['id'];
    $id = intval($id);
    $resultat = $pilote->modifier($db,$id);
    if($resultat == false){
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        echo 'true';
    }
}

function delete_pilote(){
    global $pilote,$db;
    $resultat = $pilote->supprimer($db);
    if($resultat == null){
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        echo 'true';
    }
}

function create_etudiant(){
    global $etudiant,$db;
    $resultat = $etudiant->creer($db);
    if($resultat == false){
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        echo 'true';
    }
}

function find_etudiant(){
    global $etudiant,$db;
    $resultat = $etudiant->recherche($db);
    if($resultat == null){
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        echo 'true'.'.'.$resultat[0];
    }
}

function edit_etudiant(){
    global $etudiant,$db,$data;
    $id = $data['id'];
    $id = intval($id);
    $resultat = $etudiant->modifier($db,$id);
    if($resultat == false){
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        echo 'true';
    }
}

function delete_etudiant(){
    global $etudiant,$db;
    $resultat = $etudiant->supprimer($db);
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