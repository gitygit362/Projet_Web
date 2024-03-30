<?php
include "index_modele.php";
error_reporting(E_ALL);
ini_set('display_errors', 1);


$servername = 'localhost';
$username = 'root';
$password = 'jydtntom';
$dbname = 'Projet_Web';


try{
    $db = new PDO("mysql:host=$servername;dbname=$dbname", $username);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $query = $db->prepare("SELECT mot_de_passe FROM utilisateurs WHERE nom = 'Bow'");
    $query->execute();
    $tab = $query->fetch(PDO::FETCH_ASSOC);
    if ($tab ==false)
        die(var_dump($db->errorInfo()));
    else
        echo $tab['mot_de_passe'];
        echo "\nreussite";
}

catch(PDOException $e){
    echo "Erreur :".$e->getMessage();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nom_etudiant = $_POST['nom_etudiant'];
    $prenom_etudiant = $_POST['prenom_etudiant'];
    $centre_etudiant = $_POST['centre_etudiant'];
    $promo_etudiant = $_POST['promo_etudiant'];
    $obj = new GestionUser($nom_etudiant,$prenom_etudiant,$centre_etudiant,$promo_etudiant,"etudiant");
    //echo $obj->getnom();
    header("Location: GETU_accueil.html");
    exit();
}


$data = json_decode(file_get_contents('php://input'), true);

$nom_pilote = $data['nom'];
$prenom_pilote = $data['prenom'];
$centre_pilote = $data['centre'];
$promo_pilote =  $data['pilote'];

$req = $db->prepare("CALL CreerPilote (:nom, :prenom, :centre, :promo)");
$req->bindParam(':nom',$nom_pilote);
$req->bindParam(':prenom',$prenom_pilote);
$req->bindParam(':centre',$centre_pilote);
$req->bindParam(':promo',$promo_pilote);

$resultat = $req->execute();
if($resultat == false){
    header('Content-Type: test/plain');
    echo 'false';
} else {
    //si le statut du cookie = etudiant alors utiliser le truc etudiant
    //faire heritage dans le modéle pour créer des obj de type etudiant et pilote en fonction du id ???
}