
-- --------------------------------- Entreprises ----------------------------------------



-- SFx 3 – Créer une entreprise
-- -------- Créer -------------------------------------------------------
	
-- > procéder de la création d'une entreprise 
/*
	-> on insere dans entreprise l'entreprise
(boucle en php) : 
	-> pour chaque input adresse/ville/pays on effectue la procédure VerifPaysVilleAdresse 
    on se sert du php pour récup la variable de sortie de la procedure et pour la mettre en entrée dans l'autre
    -> on insere l'entreprise et l'id adresse dans la table entreprise_adresse
*/


-- 1 fois ------------------------------


drop procedure if exists CreerEntreprise;

DELIMITER //
create procedure CreerEntreprise (
	IN var_entreprise VARCHAR(50),
    IN var_secteur VARCHAR(50),
    IN var_logo VARCHAR(100),
    IN var_evaluation DECIMAL(2,1),
    IN var_pilote_id INT,
    IN var_admin_id INT,
    OUT resEntreprise INT
    )
BEGIN 
    DECLARE enterprise_id INT;
	insert into Entreprise(secteur_activité, nom, logo, statut) value (var_secteur, var_entreprise, var_logo, 'visible');
	SET resEntreprise = LAST_INSERT_ID();
    insert into Evaluation(note, ID_pilote, ID_etudiant, ID_admin) value (var_evaluation, null, var_pilote, var_admin);
END;


call CreerEntreprise('entreprise', 'secteur', 'logo', 4.3, null, 2, @resEntreprise); -- nomEntreprise, secteurActivite, logo, note, idPilote, idAdmin, sortie : id_entrepise

-- select @resEntreprise; pour afficher

-- on stocke la sortie dans une variable php pour pouvoir la réutiliser apres dans la boucle 



-- boucle -------------------------------

-- check puis ajout si ca existe pas

drop procedure if exists VerifPaysVilleAdresse;

DELIMITER //
create procedure VerifPaysVilleAdresse (
	IN var_pays VARCHAR(50),
	IN var_ville VARCHAR(50),
    IN var_adresse VARCHAR(50),
    OUT resPays INT,
    OUT resVille INT,
    OUT resAdresse INT
    )
    BEGIN
    DECLARE pays_id INT;
    DECLARE ville_id INT;
	DECLARE adresse_id INT;
    
    -- Pays 
		select ID_pays into pays_id from Pays where nom_pays like var_pays limit 1;
		-- Si le pays existe, retourne son ID
    IF pays_id IS NOT NULL THEN
        SET resPays = pays_id; -- Si le pays existe, retourne son ID
    ELSE
		insert into Pays(nom_pays) value (var_pays);
        SET resPays = LAST_INSERT_ID(); -- Si le pays n'existe pas, l'insere et ressort l'id
    END IF;


	-- Ville 
    -- Recherche de l'ID de la ville correspondant au nom de la ville fourni
    SELECT ID_ville INTO ville_id FROM Ville WHERE ville LIKE concat('%', var_ville, '%') LIMIT 1;
    IF ville_id IS NOT NULL THEN
        SET resVille = ville_id; -- Si la ville existe, retourne son ID
    ELSE
		insert into Ville(ville, ID_pays) value (var_ville, resPays);
        SET resVille = LAST_INSERT_ID(); -- Si le pays n'existe pas, l'insere et ressort l'id
    END IF;


	-- Adresse 
    -- Recherche de l'ID de l'adresse correspondant au nom de l'adresse fourni
    SELECT ID_adresse INTO adresse_id FROM Adresse WHERE adresse = var_adresse;
    IF adresse_id IS NOT NULL THEN
        SET resAdresse = adresse_id; -- Si l'adresse existe, retourne son ID
    ELSE
		insert into Adresse(adresse, ID_ville) value (var_adresse, resVille);
        SET resAdresse = LAST_INSERT_ID(); -- Si l'adresse n'existe pas, l'insere et ressort l'id
    END IF;


	END;
    // DELIMITER 
    
call VerifPaysVilleAdresse('République Démocratique du Congo', 'Brazzaville', 'Chu brazzaville Chu rue loutay', @resPays, @resVille, @resAdresse);
select @resPays, @resVille, @resAdresse;

-- faut l'appeler avec ce qu'on ressort de celles d'avant en fonction de ce que ca ressort (existe ou pas) 

DELIMITER //
drop procedure if exists CreerEntrepriseAdresse;
create procedure CreerEntrepriseAdresse (
	IN var_entreprise_id INT,
    IN var_adresse_id INT
    )
BEGIN 
	DECLARE resEntAdr INT;
	insert into Entreprise_Adresse(ID_entreprise, ID_adresse) value (var_entreprise_id, var_adresse_id);
	SET resEntAdr = LAST_INSERT_ID();
    select * from entreprise_adresse where ID_Ent_Adr = resEntAdr;
END;
//

call CreerEntrepriseAdresse(@resEntreprise, @resAdresse); -- variable de sortie de l'entreprise et variable de sortie de l'adresse







-- SFx 2 – Rechercher une entreprise 	-- SFx 7 – Consulter les statistiques des entreprises
-- ------------ Afficher -------------------------------------------------------

drop procedure if exists AfficherEntreprise;

DELIMITER //
CREATE PROCEDURE AfficherEntreprise (
    IN var_nom VARCHAR(50), 
    IN var_secteur VARCHAR(50), 
    IN var_adr VARCHAR(50),
    IN var_ville VARCHAR(50),
    IN var_pays VARCHAR(50),
    IN var_note1 BOOL, -- (0 à 1)
    IN var_note2 BOOL, -- (1 à 2)
    IN var_note3 BOOL, -- (2 à 3)
    IN var_note4 BOOL, -- (3 à 4)
    IN var_note5 BOOL, -- (4 à 5)
    IN var_note6 BOOL, -- (0 à 5)
    IN tri_note_asc BOOL, -- (trie par note croissant)
    IN tri_note_desc BOOL, -- (trie par note décroissant)
	IN tri_like_asc BOOL, -- (trie par like croissant)
    IN tri_like_desc BOOL -- (trie par like décroissant)
)
BEGIN 
    SELECT entreprise.ID_entreprise,
		   entreprise.nom, 
           entreprise.secteur_activité, 
           AVG(evaluation.note) as moyenne_notes, 
           entreprise.logo,	
           COUNT(DISTINCT offre_wl.ID_wish_list) AS nombre_wishlists,	
		   group_concat(distinct adresse.adresse) as adresses,
           group_concat(distinct ville.ville) as villes, 
           group_concat(distinct pays.nom_pays) as pays
    FROM entreprise 
    LEFT JOIN entreprise_adresse ON entreprise.ID_entreprise = entreprise_adresse.ID_entreprise
    LEFT JOIN evaluation ON entreprise.ID_entreprise = evaluation.ID_entreprise
    LEFT JOIN adresse ON entreprise_adresse.ID_adresse = adresse.ID_adresse
    LEFT JOIN ville ON adresse.ID_ville = ville.ID_ville
    LEFT JOIN région ON ville.ID_région = région.ID_région
    LEFT JOIN pays ON région.ID_pays = pays.ID_pays
	LEFT JOIN Offre_de_Stage ON entreprise.ID_entreprise = Offre_de_Stage.ID_entreprise
    LEFT JOIN offre_wl ON Offre_de_Stage.ID_offre = offre_wl.ID_offre
    
    WHERE (var_nom = '' OR entreprise.nom LIKE CONCAT('%',var_nom, '%')) 
        AND (var_secteur = '' OR entreprise.secteur_activité LIKE CONCAT('%', var_secteur, '%'))
        AND (var_adr = '' OR adresse.adresse LIKE CONCAT('%', var_adr, '%'))
        AND (var_ville = '' OR ville.ville LIKE CONCAT('%', var_ville, '%'))
        AND (var_pays = '' OR pays.nom_pays LIKE CONCAT('%', var_pays, '%'))
	group by
		entreprise.ID_entreprise,
		entreprise.nom, 
		entreprise.secteur_activité, 
		entreprise.logo
        HAVING (
            (var_note1 = TRUE AND var_note6 = FALSE AND AVG(evaluation.note) >= 0 AND AVG(evaluation.note) <= 1) OR
            (var_note2 = TRUE AND var_note6 = FALSE AND AVG(evaluation.note) > 1 AND AVG(evaluation.note) <= 2) OR
            (var_note3 = TRUE AND var_note6 = FALSE AND AVG(evaluation.note) > 2 AND AVG(evaluation.note) <= 3) OR
            (var_note4 = TRUE AND var_note6 = FALSE AND AVG(evaluation.note) > 3 AND AVG(evaluation.note) <= 4) OR
            (var_note5 = TRUE AND var_note6 = FALSE AND AVG(evaluation.note) > 4 AND AVG(evaluation.note) <= 5) OR
            (var_note6 = TRUE AND AVG(evaluation.note) >= 0 AND AVG(evaluation.note) <= 5)
        )
		order by 
        CASE
            WHEN tri_note_asc = TRUE THEN moyenne_notes
            WHEN tri_note_desc = TRUE THEN moyenne_notes * -1
			WHEN tri_like_asc = TRUE THEN nombre_wishlists
            WHEN tri_like_desc = TRUE THEN nombre_wishlists * -1
			else entreprise.id_entreprise
        END;
END//


call AfficherEntreprise('', '', '', '', '', 0, 0 , 0, 0, 0, 1, 0, 0, 0, 1); -- nom, secteur, adresse, ville, pays, note1 (0 à 1), note2 (1 à 2), note3 (2 à 3), note4 (3 à 4), note5 (4 à 5), trie note coissant, trie note decroissant, trie wishlist croissant, trie wishlist decroissant




/* SFx 4 - Modifier une entreprise */
-- -----------Modifier ---------------------------------------------------------


-- modifie la partie entreprise ------

drop procedure if exists ModifierEntreprise;

DELIMITER //
create procedure ModifierEntreprise (
	IN var_entreprise VARCHAR(50),
    IN var_secteur VARCHAR(50),
    IN var_logo VARCHAR(100),
    OUT resEntreprise INT
    )
BEGIN 
	DECLARE entreprise_id INT;
	SELECT ID_entreprise INTO entreprise_id FROM Entreprise WHERE nom = var_entreprise;
    
IF entreprise_id IS NOT NULL THEN
	SET resEntreprise = entreprise_id;
	IF var_entreprise != '' THEN
		UPDATE Entreprise SET nom = var_entreprise WHERE ID_entreprise = entreprise_id;
	END IF;
	IF var_secteur != '' THEN
		UPDATE Entreprise SET secteur_activité = var_secteur WHERE ID_entreprise = entreprise_id;
	END IF;
	
	IF var_logo != '' THEN
		UPDATE Entreprise SET logo = var_logo WHERE ID_entreprise = entreprise_id;
	END IF;
	ELSE
	SET resEntreprise = NULL;
	END IF;
END;

call ModifierEntreprise('entreprise','', '', @resEntreprise); -- nomEntreprise, sortie : 

-- select @resEntreprise; pour afficher

-- on fait appelle a afficher pour afficher l'entreprise 
-- on fait appelle a la fonction d'ajout d'adresse en cas d'ajout d'une adresse 




-- modifie la partie adresse -- A voir avec le php pour le bon fonctionnement de la requête

/* a faire */









/* SFx 5 - Evaluer une entreprise */
-- ----------------- Evaluer ---------------------------------------------------

drop procedure if exists EvaluerEntreprise;

DELIMITER //
create procedure EvaluerEntreprise (
	IN var_id_etudiant INT,
    IN var_note DECIMAL (2,1),
    OUT resEvaluation BOOL
    )
    BEGIN 
    DECLARE entreprise_id INT;
    SELECT id_entreprise into entreprise_id
FROM offre_de_stage INNER JOIN candidature ON offre_de_stage.id_offre = candidature.id_offre WHERE offre_de_stage.fin = (
    SELECT MAX(fin) 
    FROM offre_de_stage 
    INNER JOIN candidature ON offre_de_stage.id_offre = candidature.id_offre 
    WHERE candidature.id_etudiant = 1 
    AND candidature.etat = 'valider' 
    AND offre_de_stage.fin < CURDATE()
);

if (select note from evaluation where id_entreprise = entreprise_id and id_etudiant = var_id_etudiant) is null then 
	insert into evaluation (note, id_etudiant) values (var_note, var_id_etudiant);
    set resEvaluation = 1;
else 
	set resEvaluation = 0;
end if;
END;

call ('nomEtudiant', note, @resEvaluation) -- si résultat est null dire "vous avez déjà évaluer votre dernier stage"




/* SFx 6 - Rendre invisible pour les étudiants */
-- -------------- Masquer ------------------------------------------------------

drop procedure if exists MasquerEntreprise;

DELIMITER //
create procedure MasquerEntreprise (
	IN var_id_entreprise INT
    )
    BEGIN 
		UPDATE entreprise SET etat = 'masquer' WHERE id_entreprise = var_id_entreprise;
    END;

call MasquerEntreprise(id); 





-- ---------- Supprimer --------------------------------------------------------


DROP PROCEDURE IF EXISTS SupprimerEntreprise;

DELIMITER //

CREATE PROCEDURE SupprimerEntreprise (
    IN var_nom1 VARCHAR(50),
    IN var_nom2 VARCHAR(50)
)
BEGIN
    DECLARE entreprise_id INT;
    DECLARE adresse_id INT;
    DECLARE ville_id INT;
    DECLARE pays_id INT;
    DECLARE count_adresses INT;
    DECLARE count_villes INT;
    DECLARE count_pays INT;

    -- Récupère l'ID de l'entreprise à supprimer
    SELECT ID_entreprise INTO entreprise_id FROM entreprise WHERE nom = var_nom1 AND nom = var_nom2 LIMIT 1;

    -- Récupère l'ID de l'adresse associée à l'entreprise
    SELECT ID_adresse INTO adresse_id FROM entreprise_adresse WHERE ID_entreprise = entreprise_id;

    -- Récupère l'ID de la ville associée à l'entreprise
    SELECT ID_ville INTO ville_id FROM adresse WHERE ID_adresse = adresse_id;
    
        -- Récupère l'ID du pays associée à l'entreprise
    SELECT ID_pays INTO pays_id FROM ville WHERE ID_ville = ville_id;
    
	-- Compter le nombre d'entreprises utilisant la même adresse
    SELECT COUNT(*) INTO count_adresses FROM entreprise_adresse WHERE ID_adresse = adresse_id;

    -- Compter le nombre d'entreprises utilisant la même ville
    SELECT COUNT(*) INTO count_villes FROM adresse WHERE ID_ville = ville_id;
    
	-- Compter le nombre d'entreprises utilisant la même ville
    SELECT COUNT(*) INTO count_pays FROM ville WHERE ID_pays = pays_id;
    
 -- Supprimer la liaison entreprise_adresse
    DELETE FROM entreprise_adresse WHERE ID_entreprise = entreprise_id;

    -- Supprimer l'entreprise elle-même
    DELETE FROM entreprise WHERE ID_entreprise = entreprise_id;

    -- Supprimer les entrées correspondantes dans la table adresse si nécessaire
    IF count_adresses <= 1 THEN
        DELETE FROM adresse WHERE ID_adresse = adresse_id;
    END IF;

    -- Supprimer les entrées correspondantes dans la table ville si nécessaire
    IF count_villes <= 1 THEN
        DELETE FROM ville WHERE ID_ville = ville_id;
    END IF;
    
    -- Supprimer les entrées correspondantes dans la table pays si nécessaire
    IF count_pays <= 1 THEN
        DELETE FROM pays WHERE ID_pays = pays_id;
    END IF;

END;
//

call SupprimerEntreprise('entreprise1','entreprise1');







/* SFx 7 - Consulter les statistiques des entreprises */

-- c'est quand on affiche l'entreprise les statistiques sont avec 

