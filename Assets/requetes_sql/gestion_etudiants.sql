/* SFx 17 - Rechercher un compte Etudiant */

SELECT ID_utilisateur, nom, prenom, nom_centre, promo
FROM Utilisateurs
JOIN Etudiant on Etudiant.ID_utilisateur = Utilisateurs.ID_utilisateur
JOIN Centre on Centre.ID_centre = Etudiant.ID_centre
JOIN Promo on Promo.ID_promo = Etudiant.ID_promo
WHERE nom = "nom_input"
    AND prenom = "prenom_input"
    AND nom_centre = "CESI Nantes"
    AND promo = "A2"
;
--IL FAUDRA RENVOYER VERS LA PAGE DE L'ETUDIANT

/* SFx 18 - Créer un compte Etudiant */

START TRANSACTION;

INSERT INTO Utilisateurs (nom, prenom, mot_de_passe)
VALUES ('nom_input', 'prenom_input', 'password_input')
;

INSERT INTO Etudiant (ID_centre, ID_utilisateur, ID_promo)
VALUES ((SELECT ID_centre FROM Centre WHERE nom_centre = 'CESI Nantes'), (SELECT ID_utilisateur FROM Utilisateurs WHERE nom = 'nom_input' AND prenom = 'prenom_input'), (SELECT ID_promo FROM Promo WHERE promo = 'A2'))
;

COMMIT;

/* SFx 19 - Modifier un compte Etudiant */

START TRANSACTION;

SET @id_utilisateur = (SELECT ID_utilisateur FROM Utilisateurs WHERE nom = 'nom_input' AND prenom = 'prenom_input');

UPDATE Utilisateurs
SET nom = 'nom_modif', prenom = 'prenom_modif'
WHERE ID_utilisateur = @id_utilisateur
;

UPDATE Etudiant
SET ID_centre = (SELECT ID_centre FROM Centre WHERE nom_centre = 'CESI Poitiers'), ID_promo = (SELECT ID_promo FROM Promo WHERE promo = 'A3')
WHERE ID_utilisateur = @id_utilisateur
;

COMMIT;


/* SFx 20 - Supprimer un compte Etudiant */

START TRANSACTION;

SET @id_utilisateur = (SELECT ID_utilisateur FROM Utilisateurs WHERE nom = 'nom_input' AND prenom = 'prenom_input');

DELETE FROM Etudiant
WHERE ID_utilisateur = @id_utilisateur
;

DELETE FROM Utilisateurs
WHERE ID_utilisateur = @id_utilisateur
;

COMMIT;



/* SFx 21 - Consulter les statistiques d'un compte Etudiant */

