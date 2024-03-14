/* SFx 17 - Rechercher un compte Etudiant */

SELECT ID_utilisateur, nom, prenom, nom_centre, promo
FROM Utilisateurs
JOIN Etudiant on Etudiant.ID_utilisateur = Utilisateurs.ID_utilisateur
JOIN Centre on Centre.ID_centre = Etudiant.ID_centre
JOIN contient on contient.ID_centre = Centre.ID_centre
JOIN Promo on Promo.ID_promo = contient.ID_promo
WHERE nom = "Textbox_nom"
    AND prenom = "Textbox_prenom"
    AND nom_centre = "Textbox_centre"
    AND promo = "Textbox_promo"
;

/* SFx 18 - Créer un compte Etudiant */

BEGIN TRANSACTION;

INSERT INTO Utilisateurs
VALUES ('Test1_nom', 'Test1_prenom', 'Test1_password')
;

INSERT INTO Etudiant DEFAULT VALUES;

DECLARE @userID INT;
SET @userID = SCOPE_IDENTITY();

INSERT INTO etudiant (id_utilisateur)
VALUES (@id_utilisateur)
;

COMMIT;

/* SFx 19 - Modifier un compte Etudiant */


/* SFx 20 - Supprimer un compte Etudiant */


/* SFx 21 - Consulter les statistiques d'un compte Etudiant */

