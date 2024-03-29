<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Assets/stylesheet.css">
    <title>Gestion des Pilotes</title>
    <script src="../Assets/script.js"></script>
</head>

<body>
    <header>
        <img src="../Assets/images/logo.png" alt="logo EASYSTAGE">
        <h1 class="GE">Espace Pilote</h1>
    </header>
    <div class="back_to_hub">
    <div class="text_bth" onclick="redirectToAccueil()">Retour à l'accueil</div>
    </div>
    <main>
        <form name="GP_accueil"  action="" method="post"> 
            <fieldset>
                <img src="../Assets/images/logo.png" alt="logo EASYSTAGE">
                <br>
                <button class="button" type="button" onclick="redirectToCrer_GP()">Créer un pilote</button>
                <button class="button" type="button" onclick="redirectToEdit_GP()">Modifier un pilote</button>
                <button class="button" type="button" onclick="redirectToSupp_GP()">Supprimer un pilote</button>
                <button class="button" type="button" onclick="redirectToRecherche_GP()">Rechercher un pilote</button>
            </fieldset>
        </form>
    </main>
    <footer>
        <a class="mentions-legales" href="mentions_legales.html">©2024 - Tous droits réservés -	Mentions légales EasyStage</em>
    </footer>
</body>
</html>  