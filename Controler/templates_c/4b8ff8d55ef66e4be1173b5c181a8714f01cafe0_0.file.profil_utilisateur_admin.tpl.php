<?php
/* Smarty version 4.5.1, created on 2024-04-05 09:27:41
  from 'C:\www\Projet_Web\View\profil_utilisateur_admin.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.1',
  'unifunc' => 'content_660fa7ed66de62_49450222',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '4b8ff8d55ef66e4be1173b5c181a8714f01cafe0' => 
    array (
      0 => 'C:\\www\\Projet_Web\\View\\profil_utilisateur_admin.tpl',
      1 => 1712302058,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_660fa7ed66de62_49450222 (Smarty_Internal_Template $_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CESI</title>
    <link rel="stylesheet" href="../View/Assets/stylesheet.css">
    <meta name="theme-color" content="#FFA500s">
    <?php echo '<script'; ?>
 src="../Controler/script.js"><?php echo '</script'; ?>
>
</head>
<body>
    <header class="header1">
        <img src="../View/Assets/images/logo.png" alt="logo EASYSTAGE">
        <nav class="navbar">Profil Utilisateur
            <a href="accueil.php">Accueil</a>
            <a href="../View/offres_stages.html">Offres de stages</a>
            <a href="entreprises.php">Entreprises</a>
            <?php echo $_smarty_tpl->tpl_vars['directionEtudiant']->value;?>

            <?php echo $_smarty_tpl->tpl_vars['directionPilote']->value;?>

            <a class="DeconnectProfil" href="../View/page_connexion.html" onclick="deconnexion(event)">Déconnexion</a>
        </nav>
    </header>
    <main>
        <div class="container">
            <div class="profil">
                <img src="../View/Assets/images/profile.jpg" alt="Photo de profil">
            </div>
            <div class="informations">
                <span>Nom : </span><label><?php echo $_smarty_tpl->tpl_vars['nomUser']->value;?>
</label><br>
                <span>Prenom: </span><label><?php echo $_smarty_tpl->tpl_vars['prenomUser']->value;?>
</label><br>
            </div>
            
        </div>
    </div> 
    <img src="../View/Assets/images/etudiant.jpg" alt="Description de l'image" class="full-width-image">
    <h2 class="page-title">Les centres</h2>
    <div class="centres-container">
<?php echo $_smarty_tpl->tpl_vars['centre1']->value;?>
 <?php echo $_smarty_tpl->tpl_vars['centre2']->value;
echo $_smarty_tpl->tpl_vars['centre3']->value;
echo $_smarty_tpl->tpl_vars['centre4']->value;
echo $_smarty_tpl->tpl_vars['centre5']->value;
echo $_smarty_tpl->tpl_vars['centre6']->value;
echo $_smarty_tpl->tpl_vars['centre7']->value;
echo $_smarty_tpl->tpl_vars['centre8']->value;
echo $_smarty_tpl->tpl_vars['centre9']->value;
echo $_smarty_tpl->tpl_vars['centre10']->value;
echo $_smarty_tpl->tpl_vars['centre11']->value;
echo $_smarty_tpl->tpl_vars['centre12']->value;
echo $_smarty_tpl->tpl_vars['centre13']->value;?>

<?php echo $_smarty_tpl->tpl_vars['centre14']->value;
echo $_smarty_tpl->tpl_vars['centre15']->value;
echo $_smarty_tpl->tpl_vars['centre16']->value;
echo $_smarty_tpl->tpl_vars['centre17']->value;
echo $_smarty_tpl->tpl_vars['centre18']->value;
echo $_smarty_tpl->tpl_vars['centre19']->value;
echo $_smarty_tpl->tpl_vars['centre20']->value;
echo $_smarty_tpl->tpl_vars['centre21']->value;
echo $_smarty_tpl->tpl_vars['centre22']->value;
echo $_smarty_tpl->tpl_vars['centre23']->value;
echo $_smarty_tpl->tpl_vars['centre24']->value;
echo $_smarty_tpl->tpl_vars['centre25']->value;?>

    </div>
</main>
<footer>
    <a class="mentions-legales" href="../View/mentions_legales.html" aria-label="Accéder aux mentions légales">©2024 - Tous droits réservés -	Mentions légales EasyStage</em>
</footer>
</body>
</html>

<?php }
}
