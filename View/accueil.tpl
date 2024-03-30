<!DOCTYPE html>
<html lang="fr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../View/Assets/stylesheet.css">
    </head>

    <body>
        <header class="header1">
            <img src="../View/Assets/images/logo.png" alt="logo EASYSTAGE">
            <nav class="navbar">
                Accueil&nbsp;       
                <a href="../View/offres_stages.html">Offres de stage</a>
                <a href="../View/recherche_entreprises.html">Entreprises</a>
                {$directionEtudiant}
                {$directionPilote}
                <div class="DivDeconnexion" onmouseover="showLogout()" onmouseout="hideLogout()">
                    {$directionProfil}
                    <a class="Deconnexion" href="page_connexion.html" onclick="deconnexion(event)">Déconnexion</a>
                </div>
            </nav>

        </header>

        <main>

            <article id="background_img_accueil">
                <div class="overlay">
                    <div>
                        <h1 id="accroche_accueil">Le dernier né des sites d'offres de stage...</h1>
                    </div>
                    <div id="rechercher">
                        <button type="button" class="button" onclick="redirectToOffres()">
                            RECHERCHER MAINTENANT
                        </button>
                    </div>
                </div>    
            </article>

            <h1 style="width: 50%; font-size: 200%; text-decoration: underline; margin-left: 10px;">Dernières offres</h1>
            <article class="container">
                <section class="intitule">
                    <h2>Intitulé stage 1</h2>
                    <button type="button" class="button" onclick="redirectToPresentationOffre()">Voir l'offre</button>
                </section>
                <section class="intitule">
                    <h2>Intitulé stage 2</h2>
                    <button type="button" class="button" onclick="redirectToPresentationOffre()">Voir l'offre</button>
                </section>
                <section class="intitule">
                    <h2>Intitulé stage 3</h2>
                    <button type="button" class="button" onclick="redirectToPresentationOffre()">Voir l'offre</button>
                </section>  
            </article>

        </main>

        <footer>
            <a class="mentions-legales" href="mentions_legales.html">©2024 - Tous droits réservés -	Mentions légales EasyStage</em>
        </footer>
            <script>
        {literal}
        function redirectToProfil(statut) {
            var Statut = statut;
            window.location.href = "../View/profil_utilisateur_" + Statut + ".html";
        }
        {/literal}
    </script>
    <script src="../Controler/script.js"></script>
    </body>
</html>