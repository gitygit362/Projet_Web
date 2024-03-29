<?php

// Accéder aux données du cookie dans une autre page
if(isset($_COOKIE['userData'])) {
    // Récupérer les données du cookie et les décoder
    $userData = json_decode($_COOKIE['userData'], true);

    // Utiliser les données utilisateur comme nécessaire
    $nom = $userData['nom'];
    $prenom = $userData['prenom'];

    // Vous pouvez maintenant utiliser $nom et $prenom sur cette page
    echo "Nom: $nom <br>";
    echo "Prénom: $prenom <br>";
} else {
    echo "Le cookie userData n'est pas défini.";
}

