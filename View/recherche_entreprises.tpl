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
            <a href="../Controler/accueil.php">Accueil</a>
            <a href="../View/offres_stages.html">Offres de stage</a>
            {$directionEtudiant}
            {$directionPilote}
            <div class="DivDeconnexion" onmouseover="showLogout()" onmouseout="hideLogout()">
                {$directionProfil}
                <a class="Deconnexion" href="page_connexion.html" onclick="deconnexion(event)">Déconnexion</a>
            </div>
        </nav>
    </header>
        <main>
            {$espaceEnt}
            <div id="Entreprise">
            </div>

                <form class="flex-rechercher-Entreprise">
                        <input id="rechercheNom" class="rechercheEntreprise" type="text" name="rechercher" placeholder="Rechercher">
                        <button class="rechercheBouton" type="button" onclick="requeteFiltre(event, 1)">Rechercher</button>
                </form> 




            <div id="flex-Entreprise-resultat">
                <div class="resultatsEntreprises">
                    <h2>Résultats de la recherche</h2>

                    <ul class="optionsEntreprise">
                        {$Ent1}
                        {$Ent2}
                        {$Ent3}
                        {$Ent4}
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




                <form id="filtresForm" class="filtresEntreprises">
                    <h2>Filtres de la recherche : </h2>

                    <div>
                        <h3 onclick="EntrepriseFilter()">Nom ▼</h3>
                        <label id="hideEntreprise" class="hideEntreprise">Nom de l'entreprise :</label>
                        <input id="inputEntreprise" type="text" name="entreprise" value="Nom">
                    </div>

                    <div>
                        <h3 onclick="ActiviteFilter()">Secteur d'activité ▼</h3>
                        <input id="inputActivite" type="text" name="activite" value="Activite"> 
           
                    </div>

                    <div>
                        <h3 onclick="LieuFilter()">Lieu ▼</h3>
                        <label class="hideLieu">Pays :</label>
                        <input class="inputLieu" type="text" name="pays" value="Pays">
                        <label class="hideLieu">Ville :</label>
                        <input class="inputLieu" type="text" name="ville" value="Ville">
                        <label class="hideLieu">Adresse :</label>
                        <input class="inputLieu" type="text" name="adresse" value="Adresse">
                    </div>
                
                    <div>
                        <h3 onclick="NotesFilter()">Note ▼</h3>
                        <label class="hideNote"><input type="checkbox" id="evaluationFilter1" name="evaluationFilter1" value="1"> de 0 à 1 étoile</label>
                        <label class="hideNote"><input type="checkbox" id="evaluationFilter2" name="evaluationFilter2" value="1"> de 1 à 2 étoiles</label>
                        <label class="hideNote"><input type="checkbox" id="evaluationFilter3" name="evaluationFilter3" value="1"> de 2 à 3 étoiles</label>
                        <label class="hideNote"><input type="checkbox" id="evaluationFilter4" name="evaluationFilter4" value="1"> de 3 à 4 étoiles</label>
                        <label class="hideNote"><input type="checkbox" id="evaluationFilter5" name="evalutionFilter5" value="1"> de 4 à 5 étoiles</label>
                        <label class="hideNote"><input type="checkbox" id="evaluationFilter6" name="evaluationFilter6" value="1" checked> tout</label>
                    </div>

                    <div>
                        <h3 onclick="TrierFilter()">Trier par ▼</h3>
                        <div class="trier">
                            <input type="radio" id="NoteAsc" name="trieroffre" value="1"> Note croissante
                        </div>
                        <div class="trier">
                            <input type="radio" id="NoteDesc" name="trieroffre" value="1"> Note décroissante
                        </div>
                        <div class="trier">
                            <input type="radio" id="LikeAsc" name="trieroffre" value="1"> Likes croissants
                        </div>
                        <div class="trier">
                            <input type="radio" id="LikeDesc" name="trieroffre" value="1"> Likes décroissants
                        </div>
                    </div>
                    <button class="filterButton" type="button" onclick="requeteFiltre(event, 2)">Valider</button>
                </form>
            </div>

        <h2 class="topEntreprises">Entreprises les plus recherchées</h2>
     
            <div class="flex-top-Enterprises-1">
                <div>
                    {$TopEnt1}
                </div>
                <!-- Ajoutez d'autres offres ici -->
                <div>
                    {$TopEnt2}
                </div>
                <div>
                    {$TopEnt3}
                </div>
            </div>

            <div class="flex-top-Enterprises-2">
                <div>
                    {$TopEnt4}
                </div>
                <div>
                    {$TopEnt5}
                </div>
                <div>
                    {$TopEnt6}
                </div>
            </div>
        </main>
        <footer id="footerMentions">
            <a class="mentions-legales" href="mentions_legales.html">©2024 - Tous droits réservés -	Mentions légales EasyStage</em>
        </footer>


    <script src="../Controler/script.js"></script>
    <script src="../Controler/entreprises.js"></script>
    </body>