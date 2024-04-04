
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CESI</title>
    <link rel="stylesheet" href="../View/Assets/stylesheet.css">
    {$manifest}
</head>
<body>
    <header class="header1">
        <img src="../View/Assets/images/logo.png" alt="logo EASYSTAGE">
        <nav class="navbar">Profil Utilisateur
            <a href="accueil.php">Accueil</a>
            <a href="offres_stages.php">Offres de stages</a>
            <a href="entreprises.php">Entreprises</a>
            {$directionEtudiant}
            {$directionPilote}
            <a class="DeconnectProfil" href="../View/page_connexion.html">Déconnexion</a>
        </nav>
    </header>
        
    <div class="container">
        <div class="profil">
            <img src="../View/Assets/images/profile.jpg" alt="Photo de profil">
        </div>
        <div class="informations">
            <span>Nom  </span><label>{$nomUser}</label><br>
            <span>Prenom: </span><label>{$prenomUser}</label><br>
        </div>
    </div>
  </div> 
<img src="../View/Assets/images/etudiant.jpg" alt="Description de l'image" class="full-width-image">
<h2 class="page-title">Les centres</h2>
<div class="centres-container">
{$centre1} {$centre2}{$centre3}{$centre4}{$centre5}{$centre6}{$centre7}{$centre8}{$centre9}{$centre10}{$centre11}{$centre12}{$centre13}
{$centre14}{$centre15}{$centre16}{$centre17}{$centre18}{$centre19}{$centre20}{$centre21}{$centre22}{$centre23}{$centre24}{$centre25}

</div>
<h3 class="page-title2">Mes promotions</h3>

<details class="details-table">
<summary>Informations des promotions</summary>
<center>
<table>
  <tr>
      <th>Promotions</th>
  </tr>
{$promo1}
{$promo2}
{$promo3}
{$promo4}
{$promo5}
{$promo6}
{$promo7}
{$promo8}
{$promo9}
{$promo10}
</table>
</center>
</details>



</body>
<script src="script.js"></script>
</html>

