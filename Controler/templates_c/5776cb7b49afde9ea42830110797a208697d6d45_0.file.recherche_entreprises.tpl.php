<?php
/* Smarty version 4.5.1, created on 2024-04-02 11:10:56
  from 'C:\Users\axel0\Desktop\Bloc_Dev_WEB\projet\code\Projet_Web\View\recherche_entreprises.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.5.1',
  'unifunc' => 'content_660bcba01e7a67_38122142',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '5776cb7b49afde9ea42830110797a208697d6d45' => 
    array (
      0 => 'C:\\Users\\axel0\\Desktop\\Bloc_Dev_WEB\\projet\\code\\Projet_Web\\View\\recherche_entreprises.tpl',
      1 => 1712047913,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_660bcba01e7a67_38122142 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE HTML>
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
            <?php echo $_smarty_tpl->tpl_vars['directionEtudiant']->value;?>

            <?php echo $_smarty_tpl->tpl_vars['directionPilote']->value;?>

            <div class="DivDeconnexion" onmouseover="showLogout()" onmouseout="hideLogout()">
                <?php echo $_smarty_tpl->tpl_vars['directionProfil']->value;?>

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
                        <?php echo $_smarty_tpl->tpl_vars['Ent1']->value;?>

                        <?php echo $_smarty_tpl->tpl_vars['Ent2']->value;?>

                        <?php echo $_smarty_tpl->tpl_vars['Ent3']->value;?>

                        <?php echo $_smarty_tpl->tpl_vars['Ent4']->value;?>

                    </ul>
                    <div class="center">
                        <div class="pagination">
                            <?php echo $_smarty_tpl->tpl_vars['PaginationPre']->value;?>

                            <?php echo $_smarty_tpl->tpl_vars['Page1']->value;?>

                            <?php echo $_smarty_tpl->tpl_vars['Page2']->value;?>

                            <?php echo $_smarty_tpl->tpl_vars['Page3']->value;?>

                            <?php echo $_smarty_tpl->tpl_vars['Page4']->value;?>

                            <?php echo $_smarty_tpl->tpl_vars['Page5']->value;?>

                            <?php echo $_smarty_tpl->tpl_vars['Page6']->value;?>

                            <?php echo $_smarty_tpl->tpl_vars['PaginationSui']->value;?>

                            </div>
                    </div>
                </div>




                <form id="filtresForm" class="filtresEntreprises">
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
                    <button class="filterButton" type="submit">Valider</button>
                </form>
            </div>

        <h2 class="topEntreprises">Entreprises les plus recherchées</h2>
     
            <div class="flex-top-Enterprises-1">
                <div>
                    <?php echo $_smarty_tpl->tpl_vars['TopEnt1']->value;?>

                </div>
                <!-- Ajoutez d'autres offres ici -->
                <div>
                    <?php echo $_smarty_tpl->tpl_vars['TopEnt2']->value;?>

                </div>
                <div>
                    <?php echo $_smarty_tpl->tpl_vars['TopEnt3']->value;?>

                </div>
            </div>

            <div class="flex-top-Enterprises-2">
                <div>
                    <?php echo $_smarty_tpl->tpl_vars['TopEnt4']->value;?>

                </div>
                <div>
                    <?php echo $_smarty_tpl->tpl_vars['TopEnt5']->value;?>

                </div>
                <div>
                    <?php echo $_smarty_tpl->tpl_vars['TopEnt6']->value;?>

                </div>
            </div>
        </main>
        <footer id="footerMentions">
            <a class="mentions-legales" href="mentions_legales.html">©2024 - Tous droits réservés -	Mentions légales EasyStage</em>
        </footer>


    <?php echo '<script'; ?>
 src="../Controler/script.js"><?php echo '</script'; ?>
>
    <?php echo '<script'; ?>
 src="../Controler/entreprises.js"><?php echo '</script'; ?>
>
    </body><?php }
}
