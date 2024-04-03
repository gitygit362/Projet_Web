
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CESI</title>
    <link rel="stylesheet" href="../View/Assets/stylesheet.css">
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
            {$directionEtudiant}
            {$directionPilote}
            <a class="DeconnectProfil" href="page_connexion.html">Déconnexion</a>
        </nav>
    </header>
    <main>

        <div class="container">
            <div class="profil">
                <img src="../View/Assets/images/profile.jpg" alt="Photo de profil">
            </div>
            <div class="informations">
                <span>Nom  </span><label>{$nomUser}</label><br>
                <span>Prenom: </span><label>{$prenomUser}</label><br>
                <span>Centre: </span><label>{$centreUser}</label><br>
                <span>Promotion: </span><label>{$promoUser}</label><br>
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
    {$WL0}
    {$WL1}
    {$WL2}
    {$WL3}
    {$WL4}
    {$WL5}
    {$WL6}
    {$WL7}
    {$WL8}
    {$WL9}
    {$WL10}
    {$WL11}
    {$WL12}
    {$WL13}
    {$WL14}
    {$WL15}
    {$WL16}
    {$WL17}
    {$WL18}
    {$WL19}

    </main>
    <script src="../Controler/script.js"></script>
</body>
</html>

