/* SFx 8 - Rechercher une offre */

SELECT distinct offre_de_stage.ID_offre, nom_competence, adresse, ville, région, nom_pays, nom, promo, DATEDIFF(fin, debut) AS Durée, rémunération, date_offre, nombre_places, COUNT(ID_candidature) AS NombreDeCandidatures
FROM offre_de_stage
LEFT JOIN Offre_competence ON Offre_competence.ID_offre = offre_de_stage.ID_offre
LEFT JOIN competence ON competence.ID_competence = Offre_competence.ID_competence
LEFT JOIN Adresse ON Adresse.ID_adresse = offre_de_stage.ID_adresse
LEFT JOIN Ville ON Ville.ID_ville = Adresse.ID_ville
LEFT JOIN Région ON Région.ID_région = Ville.ID_région
LEFT JOIN Pays ON Pays.ID_pays = Région.ID_pays
LEFT JOIN Entreprise ON Entreprise.ID_entreprise = offre_de_stage.ID_entreprise
LEFT JOIN Promo_offre ON Promo_offre.ID_offre = offre_de_stage.ID_offre
LEFT JOIN Promo ON Promo.ID_promo = Promo_offre.ID_promo
LEFT JOIN Candidature ON Candidature.ID_offre = offre_de_stage.ID_offre
GROUP BY  offre_de_stage.ID_offre, nom_competence, adresse, ville, région, nom_pays, nom, promo, DATEDIFF(fin, debut), rémunération, date_offre, nombre_places
ORDER BY ID_offre, promo, nom_competence
;

-- Faire en sorte qu'on puisse l'adapter avec des filtres -> WHERE


/* SFx 9 - Créer une offre */


/* SFx 10 - Modifier une offre */


/* SFx 11 - Supprimer une offre */


/* SFx 12 - Consulter les statistiques des offres */

