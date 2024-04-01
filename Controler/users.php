<?php
include "../Modèle/index_modele.php";
error_reporting(E_ALL);
ini_set('display_errors', 1);


$servername = 'localhost';
$username = 'root';
$password = 'jydtntom';
$dbname = 'Projet_Web';


try{
    $db = new PDO("mysql:host=$servername;dbname=$dbname", $username);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e){
    echo "Erreur :".$e->getMessage();
}
//______________________________________________________________________________________________________

$data = json_decode(file_get_contents('php://input'), true);
$nom_pilote = $data['nom'];
$prenom_pilote = $data['prenom'];
$centre_pilote = $data['centre'];
$promo_pilote =  $data['promo'];


function create_pilote(){
    global $nom_pilote, $prenom_pilote, $centre_pilote, $promo_pilote,$db;
    $obj = new GestionPilote($nom_pilote,$prenom_pilote,$centre_pilote,$promo_pilote);
    $resultat = $obj->creer($db);
    if($resultat == false){
        header('Content-Type: test/plain');
        echo 'false';
    } else {
        //si le statut du cookie = etudiant alors utiliser le truc etudiant
        //faire heritage dans le modéle pour créer des obj de type etudiant et pilote en fonction du id ???
        echo 'true';
    }
}

if (isset($_GET['action']) && $_GET['action'] === 'createpilote') {
    create_pilote();
} 







