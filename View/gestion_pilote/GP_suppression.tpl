<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Assets/stylesheet.css">
    <title>Suppression d'un Pilote</title>
    <script src="../Assets/script.js"></script>
</head>

<body>
    <header>
        <img src="../Assets/images/logo.png" alt="logo EASYSTAGE">
        <h1 class="GE">Suppression pilote</h1>
    </header>
    <div class="back_to_hub">
    <div class="text_bth" onclick="redirectToAccueilGP()">Espace Pilote</div>
    </div>
    <main>
        <form name="GE_suppression"  action="" method="post">
            <fieldset>

                <img src="../Assets/images/logo.png" alt="logo EASYSTAGE">
                <div class="info">
                <div class="info_txt">Informations du pilote :</div>
                </div>
                <label for="nom_pilote">Nom :</label>
                <input type="text" id="nom_pilote" name="nom_pilote" required>
                <label for="prenom_pilote">Prénom :</label>
                <input type="text" id="prenom_pilote" name="prenom_pilote" required>
                <label for="centre">Centre :</label>
                <input type="text" id="centre_pilote" name="centre_pilote" required>
                <label for="promo_pilote">Promotion :</label>
                <input type="text" id="promo_pilote" name="promo_pilote" required>
                <button class="button" type="button" onclick="redirectToAccueilGP()">Supprimer</button>
            </fieldset>
        </form>
    </main>
    <footer>
        <a class="mentions-legales" href="mentions_legales.html">©2024 - Tous droits réservés -	Mentions légales EasyStage</em>
    </footer>
</body>