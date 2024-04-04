<?php
/* Smarty version 4.5.1, created on 2024-04-04 22:26:13
  from 'C:\www\Projet_Web\View\profil_utilisateur_etudiant.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.1',
  'unifunc' => 'content_660f0ce5852c06_73896011',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '3bf211beea2fea3ad079391dbbf1f026ff3b7a3a' => 
    array (
      0 => 'C:\\www\\Projet_Web\\View\\profil_utilisateur_etudiant.tpl',
      1 => 1712262316,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_660f0ce5852c06_73896011 (Smarty_Internal_Template $_smarty_tpl) {
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CESI</title>
    <link rel="stylesheet" href="../View/Assets/stylesheet.css">
    <meta name="theme-color" content="#FFA500s">
    <?php echo $_smarty_tpl->tpl_vars['manifest']->value;?>

</head>
<body>
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

            <a class="DeconnectProfil" href="page_connexion.html" onclick="deconnexion(event)">Déconnexion</a>
        </nav>
    </header>
    <main>

        <div class="container">
            <div class="profil">
                <img src="../View/Assets/images/profile.jpg" alt="Photo de profil">
            </div>
            <div class="informations">
                <span>Nom  </span><label><?php echo $_smarty_tpl->tpl_vars['nomUser']->value;?>
</label><br>
                <span>Prenom: </span><label><?php echo $_smarty_tpl->tpl_vars['prenomUser']->value;?>
</label><br>
                <span>Centre: </span><label><?php echo $_smarty_tpl->tpl_vars['centreUser']->value;?>
</label><br>
                <span>Promotion: </span><label><?php echo $_smarty_tpl->tpl_vars['promoUser']->value;?>
</label><br>
            </div>
        </div>
    </div> 
    <img src="../View/Assets/images/etudiant.jpg" alt="Description de l'image" class="full-width-image">
    <h3 class="page-title2">Candidatures</h3>

    <details class="details-table">
        <summary>Mes candidatures</summary>
        <table>
            <tr>
                <th>Poste</th>
                <th>Salaire</th>
                <th>Durée</th>
                <th>Date</th>
                <th>État</th>
            </tr>
            <tr>
                <td>Poste1</td>
                <td>Salaire1</td>
                <td>Durée1</td>
                <td>Date1</td>
                <td>État1</td>
            </tr>
            
            <tr>
                <td>Poste2</td>
                <td>Salaire2</td>
                <td>Durée2</td>
                <td>Date2</td>
                <td>État2</td>
            </tr>
            <tr>
                <td>Poste3</td>
                <td>Salaire3</td>
                <td>Durée3</td>
                <td>Date3</td>
                <td>État3</td>
            </tr>
            <!-- ... -->
        </table>
        <div id="EvaluationDiv">
            <center><button id="EvaluationETU" class="Profil" type="button" onclick="EvaluateETU()">Evaluer votre dernier stage</button></center>
            <br>
        </div>
    </details>


    <h4 class="page-title3">Ma liste de souhaits</h4>
    <?php echo $_smarty_tpl->tpl_vars['WL0']->value;?>

    <?php echo $_smarty_tpl->tpl_vars['WL1']->value;?>

    <?php echo $_smarty_tpl->tpl_vars['WL2']->value;?>

    <?php echo $_smarty_tpl->tpl_vars['WL3']->value;?>

    <?php echo $_smarty_tpl->tpl_vars['WL4']->value;?>

    <?php echo $_smarty_tpl->tpl_vars['WL5']->value;?>

    <?php echo $_smarty_tpl->tpl_vars['WL6']->value;?>

    <?php echo $_smarty_tpl->tpl_vars['WL7']->value;?>

    <?php echo $_smarty_tpl->tpl_vars['WL8']->value;?>

    <?php echo $_smarty_tpl->tpl_vars['WL9']->value;?>

    <?php echo $_smarty_tpl->tpl_vars['WL10']->value;?>

    <?php echo $_smarty_tpl->tpl_vars['WL11']->value;?>

    <?php echo $_smarty_tpl->tpl_vars['WL12']->value;?>

    <?php echo $_smarty_tpl->tpl_vars['WL13']->value;?>

    <?php echo $_smarty_tpl->tpl_vars['WL14']->value;?>

    <?php echo $_smarty_tpl->tpl_vars['WL15']->value;?>

    <?php echo $_smarty_tpl->tpl_vars['WL16']->value;?>

    <?php echo $_smarty_tpl->tpl_vars['WL17']->value;?>

    <?php echo $_smarty_tpl->tpl_vars['WL18']->value;?>

    <?php echo $_smarty_tpl->tpl_vars['WL19']->value;?>


    </main>
    <?php echo '<script'; ?>
 src="../Controler/script.js"><?php echo '</script'; ?>
>
    <footer>
        <a class="mentions-legales" href="../View/mentions_legales.html" aria-label="Accéder aux mentions légales">©2024 - Tous droits réservés -	Mentions légales EasyStage</em>
    </footer>
</body>
</html>

<?php }
}
