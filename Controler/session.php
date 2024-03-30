<?php
session_start();

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
    $_SESSION = array();

    if (ini_get("session.use_cookies")) {
        $params = session_get_cookie_params();
        setcookie(session_name(), '', time() - 42000,
            $params["path"], $params["domain"],
            $params["secure"], $params["httponly"]
        );
    }

    session_destroy();
}