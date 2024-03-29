<?php
/* Smarty version 4.5.1, created on 2024-03-29 18:47:14
  from 'C:\www\Projet_Web\View\accueil.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.1',
  'unifunc' => 'content_6606fea26c9e41_18028767',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4688d181056146624f705c751d156fae0e5790ed' => 
    array (
      0 => 'C:\\www\\Projet_Web\\View\\accueil.tpl',
      1 => 1711734432,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6606fea26c9e41_18028767 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
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
                <a href="offres_stages.html">Offres de stage</a>
                <a href="recherche_entreprises.html">Entreprises</a>
                <?php echo $_smarty_tpl->tpl_vars['directionEtudiant']->value;?>

                <?php echo $_smarty_tpl->tpl_vars['directionPilote']->value;?>

                <div class="DivDeconnexion" onmouseover="showLogout()" onmouseout="hideLogout()">
                    <?php echo $_smarty_tpl->tpl_vars['directionProfil']->value;?>

                    <a class="Deconnexion" href="page_connexion.html">Déconnexion</a>
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
    <?php echo '<script'; ?>
 src="../Controler/script.js"><?php echo '</script'; ?>
>
    </body>
</html><?php }
}
