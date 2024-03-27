/* SFx 13 - Rechercher un compte Pilote */

/*
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
*/

/* SFx 14 - Créer un compte Pilote */

START TRANSACTION;

INSERT INTO Utilisateurs (nom, prenom, mot_de_passe)
VALUES ('nom_input', 'prenom_input', 'password_input')
;

SET @id_utilisateur = (SELECT ID_utilisateur FROM Utilisateurs WHERE nom = 'nom_input' AND prenom = 'prenom_input')
;

INSERT INTO Pilote (ID_centre, ID_utilisateur)
VALUES ((SELECT ID_centre FROM Centre WHERE nom_centre = 'CESI Rennes'), (SELECT ID_utilisateur FROM Utilisateurs WHERE nom = 'nom_input' AND prenom = 'prenom_input'))
;

INSERT INTO Promo_pilote (ID_promo, ID_pilote)
VALUES ((SELECT ID_promo FROM Promo WHERE promo = 'A4'), (SELECT ID_pilote FROM Pilote WHERE ID_utilisateur = @id_utilisateur))
;

-- NE FONCTIONNE POUR L'INSTANT QUE POUR UNE SEULE PROMO
-- POUR PLUSIEURS PROMO ON PEUT :
-- Déclarer 5 variables booléennes en sql, une pour chaque promo
-- Lors de la création du pilote, l'utilisateur coche les box des promos que le pilote gère
-- Selon que la box est checké ou non, on assigne des valeurs TRUE ou FALSE aux variables booléennes
-- Puis on utilise une suite de IF pour les requêtes SQL : seuls les promos en TRUE seront ajoutées

COMMIT;





/*SFx 15 - Modifier un compte Pilote */

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


/*SFx 16 - Supprimer un compte Pilote*/

START TRANSACTION;

SET @id_utilisateur = (SELECT ID_utilisateur FROM Utilisateurs WHERE nom = :nom_input AND prenom = :prenom_input);

DELETE FROM promo_pilote where ID_pilote = (SELECT ID_pilote FROM Pilote WHERE ID_utilisateur = @id_utilisateur)

DELETE FROM Pilote
WHERE ID_utilisateur = @id_utilisateur
;

DELETE FROM Utilisateurs
WHERE ID_utilisateur = @id_utilisateur
;

COMMIT;