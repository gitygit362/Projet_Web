<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../View/Assets/stylesheet.css">
    <title>Présentation de l'entreprise</title>
</head>
<body>
    <header class="header1">
        <img src="../View/Assets/images/logo.png" alt="logo EASYSTAGE">
        <nav class="navbar">
            <a href="../Controler/accueil.php">Accueil</a>
            <a href="../View/offres_stages.html">Offres de stages</a>
            <a href="../Controler/entreprises.php" id="pagepre">Entreprises</a>
            {$directionEtudiant}
            {$directionPilote}
            <div class="DivDeconnexion" onmouseover="showLogout()" onmouseout="hideLogout()">
            {$directionProfil}
            <a class="Deconnexion" href="page_connexion.html" onclick="deconnexion(event)">Déconnexion</a>
            </div>
        </nav> 
        <style>
            #pagepre {
                background: linear-gradient(to bottom, white, white, rgb(255, 221, 0));
            }
        </style>
    </header>
    <main>
        <div class="DivRetourPresEnt">
            <button class="RetourPresEnt" type="button" onclick="redirectToPrecPageEnt()">retour</button>
        </div>
        <div id="headerPresEnt">
            <img class="logoEnt" src="../View/{$LogoEnt}.png" alt="logo EASYSTAGE">
            <h2 class="TitrePresEnt">{$NomEnt}</h2>
        </div>
        <div class="flex-container-Présentation-Offre">
            <pre class="DescriptionCompletOffre">       <h2>Informations sur l'Entreprise :</h2>

 <b>- secteur d'activité : </b>{$SecteurEnt}


 <b>- adresses : </b>{$AdrEnt} 

 
 <b>- villes : </b>{$VillesEnt}


 <b>- pays : </b>{$PaysEnt}


 <b>- note de l'entreprise : </b>{$NoteEnt}


 <b>- nombre de wishlist contenants leurs offres : </b>{$WhListEnt}

    </pre>
        {$masquer}
        </div>
</div>
<div>
</div>
<div class="PilotesFonctionsOffre">
    <button class="ModifierButton" type="button" onclick="redirectToOffreFromEnt()">Voir les stages disponibles</button>
</div>
</main>
<footer>
    <a class="mentions-legales" href="mentions_legales.html">©2024 - Tous droits réservés -	Mentions légales EasyStage</em>
</footer>

<script src="../Controler/script.js"></script>
<script src="../Controler/entreprises.js"></script>
</body>