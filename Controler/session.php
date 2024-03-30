<?php
session_start();

if (isset($_GET['action']) && $_GET['action'] === 'supprimerSession') {
    supprimerSession();
}

function demarrerSession() {
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }
}

function creerSession() {
    $userData = json_decode($_COOKIE['userData'], true);
    $_SESSION['id'] = $userData['id'];
    $_SESSION['statut'] = $userData['statut'];
}

function supprimerSession() {
    if (isset($_COOKIE[session_name()])) {
        setcookie(session_name(), '', time() - 1, '/');
    }

    // Détruire la session
    session_destroy();
}
