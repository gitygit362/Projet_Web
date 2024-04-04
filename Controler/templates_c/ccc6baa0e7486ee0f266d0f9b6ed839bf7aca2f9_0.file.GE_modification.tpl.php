<?php
/* Smarty version 4.5.1, created on 2024-04-03 14:58:34
  from 'C:\www\Projet_Web\View\gestion_entreprise\GE_modification.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.1',
  'unifunc' => 'content_660d527a6c1b57_14876515',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ccc6baa0e7486ee0f266d0f9b6ed839bf7aca2f9' => 
    array (
      0 => 'C:\\www\\Projet_Web\\View\\gestion_entreprise\\GE_modification.tpl',
      1 => 1712149112,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_660d527a6c1b57_14876515 (Smarty_Internal_Template $_smarty_tpl) {
?><head>
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
                <input type="text" id="nom_entreprise" name="nom_entreprise" value='<?php echo $_smarty_tpl->tpl_vars['nomEntreprise']->value;?>
' required>
                <label for="secteur_entreprise">Secteur d'entreprise :</label>
                <input type="text" id="secteur_entreprise" name="secteur_entreprise" value='<?php echo $_smarty_tpl->tpl_vars['secteurEntreprise']->value;?>
' required>
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
    <?php echo '<script'; ?>
 src="script.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="entreprises.js"><?php echo '</script'; ?>
>
</body><?php }
}
