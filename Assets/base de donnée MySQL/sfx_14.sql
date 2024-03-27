-- SFx 14 – Créer un compte Pilote

-- Description : Cette fonctionnalité doit permettre à l'utilisateur de créer un compte Pilote.

-- Data : [nom – prénom – centre – promotions assignées].

DELIMITER //

CREATE PROCEDURE CreerComptePilote(
    IN p_nom VARCHAR(50),
    IN p_prenom VARCHAR(50),
    IN p_centre INT,
    IN p_promotion VARCHAR(2)
)
BEGIN    
    INSERT INTO Utilisateurs (nom, prenom) VALUES (p_nom, p_prenom);
    SET nv_id_user = LAST_INSERT_ID();
    
    INSERT INTO Centre (nom_centre) VALUES(p_centre);
    SET nv_centre_p = LAST_INSERT_ID();
    
    INSERT INTO Pilote (ID_centre, ID_utilisateur) VALUES (nv_centre_p, nv_id_user);
    SET nv_id_p = LAST_INSERT_ID();

    INSERT INTO Promo (promo) VALUES (promo);
    SET nv_promo_p = LAST_INSERT_ID();

    Insert into Promo_Centre(ID_promo, ID_centre) VALUES (nv_promo_p, nv_centre_p);
END //

DELIMITER ;