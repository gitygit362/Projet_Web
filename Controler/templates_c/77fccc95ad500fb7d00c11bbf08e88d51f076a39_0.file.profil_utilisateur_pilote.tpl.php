<?php
/* Smarty version 4.5.1, created on 2024-04-03 18:59:05
  from 'C:\www\Projet_Web\View\profil_utilisateur_pilote.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.1',
  'unifunc' => 'content_660d8ad915ba56_90425156',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '77fccc95ad500fb7d00c11bbf08e88d51f076a39' => 
    array (
      0 => 'C:\\www\\Projet_Web\\View\\profil_utilisateur_pilote.tpl',
      1 => 1712163360,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_660d8ad915ba56_90425156 (Smarty_Internal_Template $_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CESI</title>
    <link rel="stylesheet" href="../View/Assets/stylesheet.css">
</head>
<body>
    <header class="header1">
        <img src="../View/Assets/images/logo.png" alt="logo EASYSTAGE">
        <nav class="navbar">Profil Utilisateur
            <a href="accueil.php">Accueil</a>
            <a href="offres_stages.php">Offres de stages</a>
            <a href="entreprises.php">Entreprises</a>
            <a class="refPilote" href="../View/gestion_etudiant/GETU_accueil.html">Etudiants</a>
            <a class="refAdmin" href="../View/gestion_pilote/GP_accueil.html">Pilotes</a>
            <a class="DeconnectProfil" href="../View/page_connexion.html">Déconnexion</a>
        </nav>
    </header>
        
    <div class="container">
        <div class="profil">
            <img src="../View/Assets/images/profile.jpg" alt="Photo de profil">
        </div>
        <div class="informations">
            <span>Nom  </span><label><?php echo $_smarty_tpl->tpl_vars['NomUser']->value;?>
</label><br>
            <span>Prenom: </span><label><?php echo $_smarty_tpl->tpl_vars['PrenomUser']->value;?>
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
<h3 class="page-title2">Mes promotions</h3>

<details class="details-table">
<summary>Informations des promotions</summary>
<center>
<table>
  <tr>
      <th>Promotions</th>
  </tr>
<?php echo $_smarty_tpl->tpl_vars['promo1']->value;?>

<?php echo $_smarty_tpl->tpl_vars['promo2']->value;?>

<?php echo $_smarty_tpl->tpl_vars['promo3']->value;?>

<?php echo $_smarty_tpl->tpl_vars['promo4']->value;?>

<?php echo $_smarty_tpl->tpl_vars['promo5']->value;?>

<?php echo $_smarty_tpl->tpl_vars['promo6']->value;?>

<?php echo $_smarty_tpl->tpl_vars['promo7']->value;?>

<?php echo $_smarty_tpl->tpl_vars['promo8']->value;?>

<?php echo $_smarty_tpl->tpl_vars['promo9']->value;?>

<?php echo $_smarty_tpl->tpl_vars['promo10']->value;?>

</table>
</center>
</details>



</body>
<?php echo '<script'; ?>
 src="script.js"><?php echo '</script'; ?>
>
</html>

<?php }
}
