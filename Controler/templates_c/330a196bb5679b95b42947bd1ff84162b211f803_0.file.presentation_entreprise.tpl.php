<?php
/* Smarty version 4.5.1, created on 2024-04-04 17:27:32
  from 'C:\www\Projet_Web\View\presentation_entreprise.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.1',
  'unifunc' => 'content_660ec6e49f0849_42020966',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '330a196bb5679b95b42947bd1ff84162b211f803' => 
    array (
      0 => 'C:\\www\\Projet_Web\\View\\presentation_entreprise.tpl',
      1 => 1712242458,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_660ec6e49f0849_42020966 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../View/Assets/stylesheet.css">
    <?php echo $_smarty_tpl->tpl_vars['manifest']->value;?>

    <title>Présentation de l'entreprise</title>
</head>
<body>
    <header class="header1">
        <img src="../View/Assets/images/logo.png" alt="logo EASYSTAGE">
        <nav class="navbar">
            <a href="../Controler/accueil.php">Accueil</a>
            <a href="../View/offres_stages.html">Offres de stages</a>
            <a href="../Controler/entreprises.php" id="pagepre">Entreprises</a>
            <?php echo $_smarty_tpl->tpl_vars['directionEtudiant']->value;?>

            <?php echo $_smarty_tpl->tpl_vars['directionPilote']->value;?>

            <div class="DivDeconnexion" onmouseover="showLogout()" onmouseout="hideLogout()">
            <?php echo $_smarty_tpl->tpl_vars['directionProfil']->value;?>

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
            <img class="logoEnt" src="../View/<?php echo $_smarty_tpl->tpl_vars['LogoEnt']->value;?>
.png" alt="logo EASYSTAGE">
            <h2 class="TitrePresEnt"><?php echo $_smarty_tpl->tpl_vars['NomEnt']->value;?>
</h2>
        </div>
        <div class="flex-container-Présentation-Offre">
            <pre class="DescriptionCompletOffre">       <h2>Informations sur l'Entreprise :</h2>

 <b>- secteur d'activité : </b><?php echo $_smarty_tpl->tpl_vars['SecteurEnt']->value;?>



 <b>- adresses : </b><?php echo $_smarty_tpl->tpl_vars['AdrEnt']->value;?>
 

 
 <b>- villes : </b><?php echo $_smarty_tpl->tpl_vars['VillesEnt']->value;?>



 <b>- pays : </b><?php echo $_smarty_tpl->tpl_vars['PaysEnt']->value;?>



 <b>- note de l'entreprise : </b><?php echo $_smarty_tpl->tpl_vars['NoteEnt']->value;?>



 <b>- nombre de wishlist contenants leurs offres : </b><?php echo $_smarty_tpl->tpl_vars['WhListEnt']->value;?>


    </pre>

        </div>
</div>
<div>
</div>
<div class="PilotesFonctionsOffre">
    <button class="ModifierButton" type="button" onclick="redirectToOffreFromEnt()">Voir les stages disponibles</button>
</div>
</main>
<footer>
    <a class="mentions-legales" href="../View/mentions_legales.html">©2024 - Tous droits réservés -	Mentions légales EasyStage</em>
</footer>

<?php echo '<script'; ?>
 src="../Controler/script.js"><?php echo '</script'; ?>
>
<?php echo '<script'; ?>
 src="../Controler/entreprises.js"><?php echo '</script'; ?>
>
</body><?php }
}
