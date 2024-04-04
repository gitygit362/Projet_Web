<?php

$servername = 'localhost';
$username = 'root';
$password = 'Jemyf371';
$dbname = 'Projet_Web';


try{
    $db = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    /*$query = $db->prepare("SELECT mot_de_passe FROM utilisateurs WHERE nom = 'Bow'");
    $query->execute();
    $tab = $query->fetch(PDO::FETCH_ASSOC);
    if ($tab ==false)
        die(var_dump($db->errorInfo()));
    else
        echo $tab['mot_de_passe'];
        echo "\nreussite";*/
} catch(PDOException $e){
    echo "Erreur :".$e->getMessage();
}