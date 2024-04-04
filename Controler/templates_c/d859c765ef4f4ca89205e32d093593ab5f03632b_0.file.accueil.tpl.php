<?php
/* Smarty version 4.5.1, created on 2024-04-04 20:43:20
  from 'C:\www\Projet_Web\View\accueil.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.1',
  'unifunc' => 'content_660ef4c87e3119_84856430',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'd859c765ef4f4ca89205e32d093593ab5f03632b' => 
    array (
      0 => 'C:\\www\\Projet_Web\\View\\accueil.tpl',
      1 => 1712255924,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_660ef4c87e3119_84856430 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html lang="fr">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../View/Assets/stylesheet.css">
        <meta name="theme-color" content="#FFA500s">
        <title>Accueil</title>
        <?php echo $_smarty_tpl->tpl_vars['manifest']->value;?>

    </head>

    <body>
        <header class="header1">
            <img src="../View/Assets/images/logo.png" alt="logo EASYSTAGE">
            <nav class="navbar">
                Accueil&nbsp;       
                <a href="../View/offres_stages.html">Offres de stage</a>
                <a href="../Controler/entreprises.php">Entreprises</a>
                <?php echo $_smarty_tpl->tpl_vars['directionEtudiant']->value;?>

                <?php echo $_smarty_tpl->tpl_vars['directionPilote']->value;?>

                <div class="DivDeconnexion" onmouseover="showLogout()" onmouseout="hideLogout()">
                    <?php echo $_smarty_tpl->tpl_vars['directionProfil']->value;?>

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
            <a class="mentions-legales" href="../View/mentions_legales.html" aria-label="Accéder aux mentions légales">©2024 - Tous droits réservés -	Mentions légales EasyStage</em>
        </footer>
    <?php echo '<script'; ?>
 src="../Controler/script.js"><?php echo '</script'; ?>
>
    </body>
</html><?php }
}
