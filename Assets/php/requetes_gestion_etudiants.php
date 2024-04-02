<?php

require("connection.php");

//---------------------------------------------------------------------------------
// SFx 17 - Rechercher un compte étudiant
//---------------------------------------------------------------------------------

$nom_input = 'HIRLI';
$prenom_input = 'Baptiste';
$centre_input = 'CESI Strasbourg';

$sql_query = 'SELECT ID_utilisateur, nom, prenom, nom_centre, promo
FROM Utilisateurs
JOIN Etudiant on Etudiant.ID_utilisateur = Utilisateurs.ID_utilisateur
JOIN Centre on Centre.ID_centre = Etudiant.ID_centre
JOIN Promo on Promo.ID_promo = Etudiant.ID_promo
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


//---------------------------------------------------------------------------------
// SFx 18 - Créer un compte étudiant
//---------------------------------------------------------------------------------

$nom_input = 'HIRLI';
$prenom_input = 'Baptiste';
$password_input = 'CESI67';
$centre_input = 'CESI Strasbourg';
$promo_input = '';

$sql_query = 'START TRANSACTION;

INSERT INTO Utilisateurs (nom, prenom, mot_de_passe)
VALUES (:nom_input, :prenom_input, :password_input)
;

INSERT INTO Etudiant (ID_centre, ID_utilisateur, ID_promo)
VALUES ((SELECT ID_centre FROM Centre WHERE nom_centre = :centre_input), (SELECT ID_utilisateur FROM Utilisateurs WHERE nom = :nom_input AND prenom = :prenom_input), (SELECT ID_promo FROM Promo WHERE promo = :promo_input))
;

COMMIT;'
;

echo $sql_query;

$statement = $db->prepare($sql_query);

$statement->bindParam(':nom_input', $nom_input, PDO::PARAM_STR);
$statement->bindParam(':prenom_input', $prenom_input, PDO::PARAM_STR);
$statement->bindParam(':password_input', $password_input, PDO::PARAM_STR);
$statement->bindParam(':centre_input', $centre_input, PDO::PARAM_STR);
$statement->bindParam(':promo_input', $promo_input, PDO::PARAM_STR);

$statement->execute();


//-------------------------------------------------------------------------------
// SFx 19 - Modifier un compte étudiant
//-------------------------------------------------------------------------------

$nom_input = 'HIRLI';
$prenom_input = 'Baptiste';

$nom_modif = 'RINALDI';
$prenom_modif = 'Johan';
$centre_modif = 'CESI Caen';
$promo_modif = 'A3';

$sql_query = 'START TRANSACTION;

SET @id_utilisateur = (SELECT ID_utilisateur FROM Utilisateurs WHERE nom = :nom_input AND prenom = :prenom_input);

UPDATE Utilisateurs
SET nom = :nom_modif, prenom = :prenom_modif
WHERE ID_utilisateur = @id_utilisateur
;

UPDATE Etudiant
SET ID_centre = (SELECT ID_centre FROM Centre WHERE nom_centre = :centre_modif), ID_promo = (SELECT ID_promo FROM Promo WHERE promo = :promo_modif)
WHERE ID_utilisateur = @id_utilisateur
;

COMMIT;'
;

echo $sql_query;

$statement = $db->prepare($sql_query);

$statement->bindParam(':nom_input', $nom_input, PDO::PARAM_STR);
$statement->bindParam(':prenom_input', $prenom_input, PDO::PARAM_STR);
$statement->bindParam(':nom_modif', $nom_modif, PDO::PARAM_STR);
$statement->bindParam(':prenom_modif', $prenom_modif, PDO::PARAM_STR);
$statement->bindParam(':centre_modif', $centre_modif, PDO::PARAM_STR);
$statement->bindParam(':promo_modif', $promo_modif, PDO::PARAM_STR);


$statement->execute();


//-------------------------------------------------------------------------------
// SFx 20 - Supprimer un compte étudiant
//-------------------------------------------------------------------------------

$nom_input = 'HIRLI';
$prenom_input = 'Baptiste';


$sql_query = 'START TRANSACTION;

SET @id_utilisateur = (SELECT ID_utilisateur FROM Utilisateurs WHERE nom = :nom_input AND prenom = :prenom_input);

DELETE FROM Etudiant
WHERE ID_utilisateur = @id_utilisateur
;

DELETE FROM Utilisateurs
WHERE ID_utilisateur = @id_utilisateur
;

COMMIT;'
;

echo $sql_query;

$statement = $db->prepare($sql_query);

$statement->bindParam(':nom_input', $nom_input, PDO::PARAM_STR);
$statement->bindParam(':prenom_input', $prenom_input, PDO::PARAM_STR);

$statement->execute();