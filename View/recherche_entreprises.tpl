<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../View/Assets/stylesheet.css">
    <title>Entreprises</title>
</head>
<body>
    <header class="header1">
        <img src="../View/Assets/images/logo.png" alt="logo EASYSTAGE">
        <nav class="navbar">Entreprises
            <a href="../Modèle/accueil.php">Accueil</a>
            <a href="offres_stages.html">Offres de stage</a>
            {$directionEtudiant}
            {$directionPilote}
            <div class="DivDeconnexion" onmouseover="showLogout()" onmouseout="hideLogout()">
                {$directionProfil}
                <a class="Deconnexion" href="page_connexion.html">Déconnexion</a>
            </div>
        </nav>
    </header>
        <main>
            <a id="espaceEntreprise" href="gestion_entreprise/GE_accueil.html">Espace entreprise</a>
            <div id="Entreprise">
            </div>

                <form class="flex-rechercher-Entreprise">
                        <input class="rechercheEntreprise" type="text" name="rechercher" placeholder="Rechercher">
                        <button class="rechercheBouton" type="submit">Rechercher</button>
                </form> 




            <div id="flex-Entreprise-resultat">
                <div class="resultatsEntreprises">
                    <h2>Résultats de la recherche</h2>

                    <ul class="optionsEntreprise">
                        <li class="OptionEntreprise" onclick="voirEntreprise()"><article><h5 class="TitreEntreprise">Entreprise 1</h5><p class="DescriptionEntreprise">note : 3,9 &nbsp;&nbsp;&nbsp; likes : 432</p></article></li>
                        <!-- Ajoutez d'autres offres ici -->
                        <li class="OptionEntreprise" onclick="voirEntreprise()"><article><h5 class="TitreEntreprise">Entreprise 2</h5><p class="DescriptionEntreprise">note : 4,1 &nbsp;&nbsp;&nbsp; likes : 573</p></article></li>
                        <li class="OptionEntreprise" onclick="voirEntreprise()"><article><h5 class="TitreEntreprise">Entreprise 3</h5><p class="DescriptionEntreprise">note : 4,9 &nbsp;&nbsp;&nbsp; likes : 752</p></article></li>
                        <li class="OptionEntreprise" onclick="voirEntreprise()"><article><h5 class="TitreEntreprise">Entreprise 4</h5><p class="DescriptionEntreprise">note : 2,6 &nbsp;&nbsp;&nbsp; likes : 398</p></article></li>
                    </ul>
                    <div class="center">
                        <div class="pagination">
                            {$PaginationPre}
                            {$Page1}
                            {$Page2}
                            {$Page3}
                            {$Page4}
                            {$Page5}
                            {$Page6}
                            {$PaginationSui}
                            </div>
                    </div>
                </div>




                <form class="filtresEntreprises">
                    <h2>Filtres de la recherche : </h2>
                
                <!-- filtres -->

                    <div>
                        <h3 onclick="EntrepriseFilter()">Nom ▼</h3>
                        <label id="hideEntreprise" class="hideEntreprise">Nom de l'entreprise :</label>
                        <input id="inputEntreprise" type="text" name="entreprise">
                    </div>

                    <div>
                        <h3 onclick="ActiviteFilter()">Secteur d'activité ▼</h3>
                        <input id="inputActivite" type="text" name="activite"> 
            <!-- faudra donnée les propositions de la BDD quand il tape pcq sinon c trop compliquer pour l'utilisateur =-->
                    </div>

                    <div>
                        <h3 onclick="LieuFilter()">Lieu ▼</h3>
                        <label class="hideLieu">Pays :</label>
                        <input class="inputLieu" type="text" name="pays">
                        <label class="hideLieu">Ville :</label>
                        <input class="inputLieu" type="text" name="ville">
                        <label class="hideLieu">Adresse :</label>
                        <input class="inputLieu" type="text" name="adresse">
                    </div>
                
                    <div>
                        <h3 onclick="NotesFilter()">Note ▼</h3>
                        <label class="hideNote"><input type="checkbox" name="evaluationFilter1" value="de 0 à 1 étoile"> de 0 à 1 étoile</label>
                        <label class="hideNote"><input type="checkbox" name="evaluationFilter2" value="de 1 à 2 étoiles"> de 1 à 2 étoiles</label>
                        <label class="hideNote"><input type="checkbox" name="evaluationFilter3" value="de 3 à 4 étoiles"> de 3 à 4 étoiles</label>
                        <label class="hideNote"><input type="checkbox" name="evalutionFilter4" value="de 4 à 5 étoiles"> de 4 à 5 étoiles</label>
                        <label class="hideNote"><input type="checkbox" name="evaluationFilter5" value="tout" checked> tout</label>
                    </div>

                    <div>
                        <h3 onclick="TrierFilter()">Trier par ▼</h3>
                        <div class="trier">
                            <input type="radio" name="trieroffre" value="PlusRécentes"> Note croissante
                        </div>
                        <div class="trier">
                            <input type="radio" name="trieroffre" value="PlusAnciennes"> Note décroissante
                        </div>
                        <div class="trier">
                            <input type="radio" name="trieroffre" value="SalairesCroissants"> Likes croissants
                        </div>
                        <div class="trier">
                            <input type="radio" name="trieroffre" value="SalairesDécroissants"> Likes décroissants
                        </div>
                    </div>
                    <button class="filterButton" type="submit">Valider</button>
                </form>
            </div>

        <h2 class="topEntreprises">Entreprises les plus recherchées</h2>
     
            <div class="flex-top-Enterprises-1">
                <div>
                    <article class="OptionTopEntreprises" onclick="voirEntreprise()"><h5 class="TitreEntreprise">{$TopEnt1Nom}</h5><p class="DescriptionEntreprise">note : {$TopEnt1Note} &nbsp;&nbsp;&nbsp; likes : {$TopEnt1Like}</p></article>
                </div>
                <!-- Ajoutez d'autres offres ici -->
                <div>
                    <article class="OptionTopEntreprises" onclick="voirEntreprise()"><h5 class="TitreEntreprise">{$TopEnt2Nom}</h5><p class="DescriptionEntreprise">note : {$TopEnt2Note} &nbsp;&nbsp;&nbsp; likes : {$TopEnt2Like}</p></article>
                </div>
                <div>
                    <article class="OptionTopEntreprises" onclick="voirEntreprise()"><h5 class="TitreEntreprise">{$TopEnt3Nom}</h5><p class="DescriptionEntreprise">note : {$TopEnt3Note} &nbsp;&nbsp;&nbsp; likes : {$TopEnt3Like}</p></article>
                </div>
            </div>

            <div class="flex-top-Enterprises-2">
                <div>
                    <article class="OptionTopEntreprises" onclick="voirEntreprise()"><h5 class="TitreEntreprise">{$TopEnt4Nom}</h5><p class="DescriptionEntreprise">note : {$TopEnt4Note} &nbsp;&nbsp;&nbsp; likes : {$TopEnt4Like}</p></article>
                </div>
                <div>
                    <article class="OptionTopEntreprises" onclick="voirEntreprise()"><h5 class="TitreEntreprise">{$TopEnt5Nom}</h5><p class="DescriptionEntreprise">note : {$TopEnt5Note} &nbsp;&nbsp;&nbsp; likes : {$TopEnt5Like}</p></article>
                </div>
                <div>
                    <article class="OptionTopEntreprises" onclick="voirEntreprise()"><h5 class="TitreEntreprise">{$TopEnt6Nom}</h5><p class="DescriptionEntreprise">note : {$TopEnt6Note} &nbsp;&nbsp;&nbsp; likes : {$TopEnt6Like}</p></article>
                </div>
            </div>
        </main>
        <footer id="footerMentions">
            <a class="mentions-legales" href="mentions_legales.html">©2024 - Tous droits réservés -	Mentions légales EasyStage</em>
        </footer>


    <script src="../Controler/script.js"></script>
    <script src="../Controler/entreprises.js"></script>
    </body>