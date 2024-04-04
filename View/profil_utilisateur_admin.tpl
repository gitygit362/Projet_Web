
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CESI</title>
    <link rel="stylesheet" href="../View/Assets/stylesheet.css">
    <meta name="theme-color" content="#FFA500s">
    <script src="../Controler/script.js"></script>
</head>
<body>
    <header class="header1">
        <img src="../View/Assets/images/logo.png" alt="logo EASYSTAGE">
        <nav class="navbar">Profil Utilisateur
            <a href="../Controler/accueil.php">Accueil</a>
            <a href="../View/offres_stages.html">Offres de stages</a>
            <a href="../View/recherche_entreprises.html">Entreprises</a>
            {$directionEtudiant}
            {$directionPilote}
            <a class="DeconnectProfil" href="../View/page_connexion.html">Déconnexion</a>
        </nav>
    </header>
    <main>
        <div class="container">
            <div class="profil">
                <img src="../View/Assets/images/profile.jpg" alt="Photo de profil">
            </div>
            <div class="informations">
                <span>Nom : </span><label>{$nomUser}</label><br>
                <span>Prenom: </span><label>{$prenomUser}</label><br>
            </div>
            
        </div>
    </div> 
    <img src="../View/Assets/images/etudiant.jpg" alt="Description de l'image" class="full-width-image">
    <h2 class="page-title">Les centres</h2>
    <div class="centres-container">
{$centre1} {$centre2}{$centre3}{$centre4}{$centre5}{$centre6}{$centre7}{$centre8}{$centre9}{$centre10}{$centre11}{$centre12}{$centre13}
{$centre14}{$centre15}{$centre16}{$centre17}{$centre18}{$centre19}{$centre20}{$centre21}{$centre22}{$centre23}{$centre24}{$centre25}
    </div>
</main>
<footer>
    <a class="mentions-legales" href="../View/mentions_legales.html" aria-label="Accéder aux mentions légales">©2024 - Tous droits réservés -	Mentions légales EasyStage</em>
</footer>
</body>
</html>

