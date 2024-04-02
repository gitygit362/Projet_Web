<?php 
require_once '../Modèle/entreprise.class.php'; // Inclure votre classe PHP

if (isset($_GET['action']) && $_GET['action'] == 'creerEntreprise') {
    $data = json_decode(file_get_contents("php://input"));

    $entreprise = new Entreprise();
    $resultat = $entreprise->creerEntreprise($data->nom, $data->secteur, $data->logo);

    $id = $resultat;

}

if (isset($_GET['action']) && $_GET['action'] == 'creerEntrepriseAdresse') {
    $data = json_decode(file_get_contents("php://input"));

    $entreprise = new Entreprise();
    $resultat = $entreprise->creerEntrepriseAdresse($data->adresse, $data->ville, $data->pays, $id);

}
