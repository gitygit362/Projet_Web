<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../View/Assets/stylesheet.css">
    <title>Modification d'une entreprise</title>
</head>

<body>
    <header>
        <img src="../View/Assets/images/logo.png" alt="logo EASYSTAGE">
        <h1 class="GE">Modification entreprise</h1>
    </header>
    <div class="back_to_hub">
    <div class="text_bth" onclick="redirectToEditEnt_GE()">retour</div>
    </div>
    <main>
        <form name="GE_creation"  action="" method="post">
            <fieldset>

                <img src="../View/Assets/images/logo.png" alt="logo EASYSTAGE">
                <div class="info">
                <div class="info_txt">Nouvelles informations de l'entreprise :</div>
                </div>
                <label for="nom_entreprise">Nom de l'entreprise :</label>
                <input type="text" id="nom_entreprise" name="nom_entreprise" value='{$nomEntreprise}' required>
                <label for="secteur_entreprise">Secteur d'entreprise :</label>
                <input type="text" id="secteur_entreprise" name="secteur_entreprise" value='{$secteurEntreprise}' required>
                <label for="localite1_entreprise">localité(s) :</label>
                <input type="text" id="localite1_entreprise" name="localite_entreprise" required>
                <div id="LocaliteSupp"></div>
                <button class="addCompetence" type="button" onclick="AddLocaliteEnt()">ajouter une adresse</button>
                <button class="button" type="button" onclick="redirectToGE_modification(event, 2)">Modifier</button>
            </fieldset>
        </form>
    </main>
    <footer>
        <a class="mentions-legales" href="mentions_legales.html">©2024 - Tous droits réservés -	Mentions légales EasyStage</em>
    </footer>
    <script src="script.js"></script>
    <script src="entreprises.js"></script>
</body>