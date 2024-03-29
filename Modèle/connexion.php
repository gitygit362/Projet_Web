<?php

require "config.php";
// require_once "../../libs/Smarty.class.php";
$db = Database::getInstance();
$connexion = $db->getConnexion();

$data = json_decode(file_get_contents('php://input'), true);

$username = $data['user'];
$password = $data['passwd'];//'zW96UhV';

$parties = explode('.', $username);
$lastname =  $parties[0];//'Bow';
$firstname = $parties[1]; //'Pénélope';

//requete SQL ----------------------
$stmt = $connexion->prepare("CALL Authentification(:nom, :prenom, :mdp, @resId, @resSt)");
$stmt->bindParam(':nom', $lastname);
$stmt->bindParam(':prenom', $firstname);
$stmt->bindParam(':mdp', $password);

$res = $stmt->execute();

if ($res == false) {
    header('Content-Type: text/plain');
    echo 'false';
} else {
    $resId = $connexion->query("SELECT @resId")->fetchColumn();
    $resStatut = $connexion->query("SELECT @resSt")->fetchColumn();

    if ($resId !== 0) {
        $userData = array(
            'id' => $resId,
            'lastname' => $lastname,
            'firstname' => $firstname,
            'statut' => $resStatut
        );

        // Création du cookie avec les informations utilisateur
        $userDataJSON = json_encode($userData);
        $userDataJSON = trim($userDataJSON); // Supprimer les espaces supplémentaires
        setcookie('userData', $userDataJSON, time() + 3600, '/');
        header('Content-Type: text/plain');
        echo 'true';

    } else {
        header('Content-Type: text/plain');
        echo 'false';
    }
}

exit();
