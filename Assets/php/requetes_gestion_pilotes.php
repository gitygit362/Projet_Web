<?php

require("connection.php");

//---------------------------------------------------------------------------------
// SFx 13 - Rechercher un compte pilote
//---------------------------------------------------------------------------------


$nom_input = 'ESSAID';
$prenom_input = 'Amira';
$centre_input = 'CESI Strasbourg';

$sql_query = 'SELECT Utilisateurs.ID_utilisateur, nom, prenom, nom_centre, promo
FROM Utilisateurs
JOIN Pilote on Pilote.ID_utilisateur = Utilisateurs.ID_utilisateur
JOIN Centre on Centre.ID_centre = Pilote.ID_centre
JOIN Promo_pilote on Promo_pilote.ID_pilote = Pilote.ID_pilote
JOIN Promo on Promo.ID_promo = Promo_pilote.ID_promo
WHERE nom = :nom_input
    AND prenom = :prenom_input
    AND nom_centre = :centre_input
;';


$statement = $db->prepare($sql_query);

$statement->bindParam(':nom_input', $nom_input, PDO::PARAM_STR);
$statement->bindParam(':prenom_input', $prenom_input, PDO::PARAM_STR);
$statement->bindParam(':centre_input', $centre_input, PDO::PARAM_STR);

$statement->execute();

$promos = '';

while ($result = $statement->fetch(PDO::FETCH_ASSOC)) {
    $id = $result['ID_utilisateur'];
    $nom = $result['nom'];
    $prenom = $result['prenom'];
    $centre = $result['nom_centre'];
    $promos .= $result['promo'];
    $promos .= ', ';
}   

echo $nom.' '.$prenom.' (ID '.$id.') pilote la/les promo(s) '.$promos.'au '.$centre.'.';


//------------------------------------------------------------
// SFx 14 - Créer un compte pilote
//------------------------------------------------------------

$nom_input = 'ESSAID';
$prenom_input = 'Amira';
$password_input = 'CESI67';
$centre_input = 'CESI Strasbourg';

$sql_query = 'START TRANSACTION;
INSERT INTO Utilisateurs (nom, prenom, mot_de_passe)
VALUES (:nom_input, :prenom_input, :password_input)
;
SET @id_utilisateur = (SELECT ID_utilisateur FROM Utilisateurs WHERE nom = :nom_input AND prenom = :prenom_input)
;
INSERT INTO Pilote (ID_centre, ID_utilisateur)
VALUES ((SELECT ID_centre FROM Centre WHERE nom_centre = :centre_input), (SELECT ID_utilisateur FROM Utilisateurs WHERE nom = :nom_input AND prenom = :prenom_input))
;'
;

// A lier avec les checkbox du choix de promos
$A1 = true;
$A2 = true;
$A3 = false;
$A4 = false;
$A5 = false;

// Morceau de requêtes à ajouter en fonction des promos
$A1_query = ' INSERT INTO Promo_pilote (ID_promo, ID_pilote)
VALUES ((SELECT ID_promo FROM Promo WHERE promo = "A1"), (SELECT ID_pilote FROM Pilote WHERE ID_utilisateur = @id_utilisateur));';

$A2_query = ' INSERT INTO Promo_pilote (ID_promo, ID_pilote)
VALUES ((SELECT ID_promo FROM Promo WHERE promo = "A2"), (SELECT ID_pilote FROM Pilote WHERE ID_utilisateur = @id_utilisateur));';

$A3_query = ' INSERT INTO Promo_pilote (ID_promo, ID_pilote)
VALUES ((SELECT ID_promo FROM Promo WHERE promo = "A3"), (SELECT ID_pilote FROM Pilote WHERE ID_utilisateur = @id_utilisateur));';

$A4_query = ' INSERT INTO Promo_pilote (ID_promo, ID_pilote)
VALUES ((SELECT ID_promo FROM Promo WHERE promo = "A4"), (SELECT ID_pilote FROM Pilote WHERE ID_utilisateur = @id_utilisateur));';

$A5_query = ' INSERT INTO Promo_pilote (ID_promo, ID_pilote)
VALUES ((SELECT ID_promo FROM Promo WHERE promo = "A5"), (SELECT ID_pilote FROM Pilote WHERE ID_utilisateur = @id_utilisateur));';

if($A1){
    $sql_query .= $A1_query;
}
if($A2){
    $sql_query .= $A2_query;
}
if($A3){
    $sql_query .= $A3_query;
}
if($A4){
    $sql_query .= $A4_query;
}
if($A5){
    $sql_query .= $A5_query;
}

$sql_query .= ' COMMIT;';

echo $sql_query;


$statement = $db->prepare($sql_query);

$statement->bindParam(':nom_input', $nom_input, PDO::PARAM_STR);
$statement->bindParam(':prenom_input', $prenom_input, PDO::PARAM_STR);
$statement->bindParam(':password_input', $password_input, PDO::PARAM_STR);
$statement->bindParam(':centre_input', $centre_input, PDO::PARAM_STR);

$statement->execute();

echo '<br>Nombre de lignes affectées dans la BDD : '.$statement->rowCount();


//-------------------------------------------------------------------------------
// SFx 15 - Modifier un compte pilote
//-------------------------------------------------------------------------------

$nom_input = 'ESSAID';
$prenom_input = 'Amira';

$nom_modif = 'HECK';
$prenom_modif = 'Sylvain';
$centre_modif = 'CESI Poitiers';

// A lier avec les checkbox du choix de promos
$A1 = false;
$A2 = true;
$A3 = false;
$A4 = true;
$A5 = false;

// Morceau de requêtes à ajouter en fonction des promos
$A1_query = ' INSERT INTO Promo_pilote (ID_promo, ID_pilote)
VALUES ((SELECT ID_promo FROM Promo WHERE promo = "A1"), (SELECT ID_pilote FROM Pilote WHERE ID_utilisateur = @id_utilisateur));';

$A2_query = ' INSERT INTO Promo_pilote (ID_promo, ID_pilote)
VALUES ((SELECT ID_promo FROM Promo WHERE promo = "A2"), (SELECT ID_pilote FROM Pilote WHERE ID_utilisateur = @id_utilisateur));';

$A3_query = ' INSERT INTO Promo_pilote (ID_promo, ID_pilote)
VALUES ((SELECT ID_promo FROM Promo WHERE promo = "A3"), (SELECT ID_pilote FROM Pilote WHERE ID_utilisateur = @id_utilisateur));';

$A4_query = ' INSERT INTO Promo_pilote (ID_promo, ID_pilote)
VALUES ((SELECT ID_promo FROM Promo WHERE promo = "A4"), (SELECT ID_pilote FROM Pilote WHERE ID_utilisateur = @id_utilisateur));';

$A5_query = ' INSERT INTO Promo_pilote (ID_promo, ID_pilote)
VALUES ((SELECT ID_promo FROM Promo WHERE promo = "A5"), (SELECT ID_pilote FROM Pilote WHERE ID_utilisateur = @id_utilisateur));';


$sql_query = 'START TRANSACTION;

SET @id_utilisateur = (SELECT ID_utilisateur FROM Utilisateurs WHERE nom = :nom_input AND prenom = :prenom_input);
SET @id_pilote = (SELECT ID_pilote FROM Pilote WHERE ID_utilisateur = @id_utilisateur);

UPDATE Utilisateurs
SET nom = :nom_modif, prenom = :prenom_modif
WHERE ID_utilisateur = @id_utilisateur
;

UPDATE Pilote
SET ID_centre = (SELECT ID_centre FROM Centre WHERE nom_centre = :centre_modif)
WHERE ID_pilote = @id_pilote
;

COMMIT;'
;


// Vérification de la présence des lignes nécessaires + suppression des lignes inutiles

$check_query = 'SELECT true FROM promo_pilote WHERE ID_pilote = 37 AND ID_promo = :id_promo;';


if($A1){
    $id_promo = 1;
    $statement = $db->prepare($check_query);
    $statement->bindParam('id_promo', $id_promo, PDO::PARAM_INT);
    $statement->execute();
    $result = $statement->fetch(PDO::FETCH_ASSOC);
    if(!$result){
        $sql_query .= $A1_query;
    }
} else{
    $delete_query = 'DELETE FROM promo_pilote where ID_pilote = @id_pilote AND ID_promo = 1;';
    $sql_query .= $delete_query;
}

if($A2){
    $id_promo = 2;
    $statement = $db->prepare($check_query);
    $statement->bindParam('id_promo', $id_promo, PDO::PARAM_INT);
    $statement->execute();
    $result = $statement->fetch(PDO::FETCH_ASSOC);
    if(!$result){
        $sql_query .= $A2_query;
    }
} else{
    $delete_query = 'DELETE FROM promo_pilote where ID_pilote = @id_pilote AND ID_promo = 2; ';
    $sql_query .= $delete_query;
}

if($A3){
    $id_promo = 3;
    $statement = $db->prepare($check_query);
    $statement->bindParam('id_promo', $id_promo, PDO::PARAM_INT);
    $statement->execute();
    $result = $statement->fetch(PDO::FETCH_ASSOC);
    if(!$result){
        $sql_query .= $A3_query;
    }
} else{
    $delete_query = 'DELETE FROM promo_pilote where ID_pilote = @id_pilote AND ID_promo = 3; ';
    $sql_query .= $delete_query;
}

if($A4){
    $id_promo = 4;
    $statement = $db->prepare($check_query);
    $statement->bindParam('id_promo', $id_promo, PDO::PARAM_INT);
    $statement->execute();
    $result = $statement->fetch(PDO::FETCH_ASSOC);
    if(!$result){
        $sql_query .= $A4_query;
    }
} else{
    $delete_query = 'DELETE FROM promo_pilote where ID_pilote = @id_pilote AND ID_promo = 4; ';
    $sql_query .= $delete_query;
}

if($A5){
    $id_promo = 5;
    $statement = $db->prepare($check_query);
    $statement->bindParam('id_promo', $id_promo, PDO::PARAM_INT);
    $statement->execute();
    $result = $statement->fetch(PDO::FETCH_ASSOC);
    if(!$result){
        $sql_query .= $A5_query;
    }
} else{
    $delete_query = 'DELETE FROM promo_pilote where ID_pilote = @id_pilote AND ID_promo = 5; ';
    $sql_query .= $delete_query;
}

echo $sql_query;


$statement = $db->prepare($sql_query);

$statement->bindParam(':nom_input', $nom_input, PDO::PARAM_STR);
$statement->bindParam(':prenom_input', $prenom_input, PDO::PARAM_STR);
$statement->bindParam(':nom_modif', $nom_modif, PDO::PARAM_STR);
$statement->bindParam(':prenom_modif', $prenom_modif, PDO::PARAM_STR);
$statement->bindParam(':centre_modif', $centre_modif, PDO::PARAM_STR);


$statement->execute();


//-------------------------------------------------------------------------------
// SFx 16 - Supprimer un compte pilote
//-------------------------------------------------------------------------------

$nom_input = 'ESSAID';
$prenom_input = 'Amira';

$sql_query = 'START TRANSACTION;

SET @id_utilisateur = (SELECT ID_utilisateur FROM Utilisateurs WHERE nom = :nom_input AND prenom = :prenom_input);
SET @id_pilote = (SELECT ID_pilote FROM Pilote WHERE ID_utilisateur = @id_utilisateur);

SELECT @id_pilote;

DELETE FROM promo_pilote where ID_pilote = @id_pilote;

DELETE FROM Pilote WHERE ID_pilote = @id_pilote;

DELETE FROM Utilisateurs WHERE ID_utilisateur = @id_utilisateur;

COMMIT;'
;

echo $sql_query;

$statement = $db->prepare($sql_query);

$statement->bindParam(':nom_input', $nom_input, PDO::PARAM_STR);
$statement->bindParam(':prenom_input', $prenom_input, PDO::PARAM_STR);

$statement->execute();

echo '<br>Nombre de lignes affectées dans la BDD : '.$statement->rowCount();

