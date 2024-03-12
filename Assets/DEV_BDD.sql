USE Web_projet;

-- Supprimer les tables
DROP TABLE IF EXISTS contient;
DROP TABLE IF EXISTS fait;
DROP TABLE IF EXISTS se_situe;
DROP TABLE IF EXISTS stocke;
DROP TABLE IF EXISTS cherche;
DROP TABLE IF EXISTS postule;
DROP TABLE IF EXISTS requiere;
DROP TABLE IF EXISTS Offre_de_stage;
DROP TABLE IF EXISTS Adresse;
DROP TABLE IF EXISTS Ville;
DROP TABLE IF EXISTS Evaluation;
DROP TABLE IF EXISTS Wish_list;
DROP TABLE IF EXISTS Admin;
DROP TABLE IF EXISTS Pilote;
DROP TABLE IF EXISTS Etudiant;
DROP TABLE IF EXISTS Région;
DROP TABLE IF EXISTS Centre;
DROP TABLE IF EXISTS Candidature;
DROP TABLE IF EXISTS Utilisateurs;
DROP TABLE IF EXISTS Pays;
DROP TABLE IF EXISTS Entreprise;
DROP TABLE IF EXISTS Promo;
DROP TABLE IF EXISTS Competence;

GO



CREATE TABLE Competence(
   ID_competence INT,
   nom_competence VARCHAR(50),
   PRIMARY KEY(ID_competence)
);

CREATE TABLE Promo(
   ID_promo INT,
   promo VARCHAR(2),
   PRIMARY KEY(ID_promo)
);

CREATE TABLE Entreprise(
   ID_entreprise INT,
   secteur_activité VARCHAR(50),
   nom VARCHAR(50),
   logo VARCHAR(MAX),
   PRIMARY KEY(ID_entreprise)
);

CREATE TABLE Pays(
   ID_pays INT,
   nom_pays VARCHAR(50),
   PRIMARY KEY(ID_pays)
);

CREATE TABLE Utilisateurs(
   ID_utilisateur INT,
   nom VARCHAR(50),
   prenom VARCHAR(50),
   mot_de_passe VARCHAR(50),
   PRIMARY KEY(ID_utilisateur)
);


CREATE TABLE Centre(
   ID_centre INT,
   nom_centre VARCHAR(50),
   PRIMARY KEY(ID_centre)
);

CREATE TABLE Région(
   ID_région INT,
   région VARCHAR(50),
   ID_pays INT,
   PRIMARY KEY(ID_région),
   FOREIGN KEY(ID_pays) REFERENCES Pays(ID_pays)
);

CREATE TABLE Etudiant(--45
   ID_etudiant INT,
   ID_centre INT,
   ID_utilisateur INT,
   PRIMARY KEY(ID_etudiant),
   
   FOREIGN KEY(ID_centre) REFERENCES Centre(ID_centre),
   FOREIGN KEY(ID_utilisateur) REFERENCES Utilisateurs(ID_utilisateur)
);

CREATE TABLE Pilote( --25
   ID_pilote INT,
   ID_centre INT,
   ID_utilisateur INT,
   PRIMARY KEY(ID_pilote),
   
   FOREIGN KEY(ID_centre) REFERENCES Centre(ID_centre),
   FOREIGN KEY(ID_utilisateur) REFERENCES Utilisateurs(ID_utilisateur)
);

CREATE TABLE Admin( --5
   ID_admin INT,
   ID_utilisateur INT,
   PRIMARY KEY(ID_admin),
   
   FOREIGN KEY(ID_utilisateur) REFERENCES Utilisateurs(ID_utilisateur)
);

CREATE TABLE Wish_list(
   ID_wish_list INT,
   ID_etudiant INT,
   PRIMARY KEY(ID_wish_list),
   FOREIGN KEY(ID_etudiant) REFERENCES Etudiant(ID_etudiant)
);

CREATE TABLE Evaluation(
   ID_evaluation INT,
   note DECIMAL(2,1),
   ID_pilote INT,
   ID_etudiant INT ,
   ID_entreprise INT ,
   PRIMARY KEY(ID_evaluation),
   FOREIGN KEY(ID_pilote) REFERENCES Pilote(ID_pilote),
   FOREIGN KEY(ID_etudiant) REFERENCES Etudiant(ID_etudiant),
   FOREIGN KEY(ID_entreprise) REFERENCES Entreprise(ID_entreprise)
);

CREATE TABLE Ville(
   ID_ville INT,
   ville VARCHAR(50),
   ID_région INt,
   PRIMARY KEY(ID_ville),
   FOREIGN KEY(ID_région) REFERENCES Région(ID_région)
);

CREATE TABLE Adresse(
   ID_adresse INT,
   adresse VARCHAR(50),
   ID_ville INT,
   PRIMARY KEY(ID_adresse),
   FOREIGN KEY(ID_ville) REFERENCES Ville(ID_ville)
);

CREATE TABLE Offre_de_stage(
   ID_offre INT,
   debut DATE,
   rémunération DECIMAL(15,3),
   fin DATE,
   nombre_places INT,
   Date_offre DATE,
   nombre_like INT,
   ID_adresse INT,
   ID_entreprise INT ,
   PRIMARY KEY(ID_offre),
   FOREIGN KEY(ID_adresse) REFERENCES Adresse(ID_adresse),
   FOREIGN KEY(ID_entreprise) REFERENCES Entreprise(ID_entreprise)
);

CREATE TABLE requiere(
   ID_requiere INT,
   ID_offre INT,
   ID_competence INT,
   PRIMARY KEY(ID_requiere),
   FOREIGN KEY(ID_offre) REFERENCES Offre_de_stage(ID_offre),
   FOREIGN KEY(ID_competence) REFERENCES Competence(ID_competence)
);

CREATE TABLE Candidature(
   ID_candidature INT,
   lettre_motivation VARCHAR(5000),--CV
   ID_etudiant INT,
   ID_offre INT,
   PRIMARY KEY(ID_candidature),
   FOREIGN KEY(ID_etudiant) REFERENCES Etudiant(ID_etudiant),
   FOREIGN KEY(ID_offre) REFERENCES Offre_de_stage(ID_offre),
);

CREATE TABLE cherche(
   ID_cherche INT, --auto
   ID_offre INT, --1 et max
   ID_promo INT, -- 1 et max
   PRIMARY KEY(ID_cherche), --plus
   FOREIGN KEY(ID_offre) REFERENCES Offre_de_stage(ID_offre),
   FOREIGN KEY(ID_promo) REFERENCES Promo(ID_promo)
);

CREATE TABLE stocke(
   ID_stocke INT, -- auto
   ID_offre INT, -- 1 et max
   ID_wish_list INT, -- 1 et max
   PRIMARY KEY(ID_stocke), --plus
   FOREIGN KEY(ID_offre) REFERENCES Offre_de_stage(ID_offre),
   FOREIGN KEY(ID_wish_list) REFERENCES Wish_list(ID_wish_list)
);

CREATE TABLE se_situe(
   ID_se_situe INT, --auto
   ID_entreprise INT,-- 1 et max
   ID_adresse INT,-- auto
   PRIMARY KEY(ID_se_situe),--nombre d'address
   FOREIGN KEY(ID_entreprise) REFERENCES Entreprise(ID_entreprise),
   FOREIGN KEY(ID_adresse) REFERENCES Adresse(ID_adresse)
);


CREATE TABLE contient(
   ID_contient INT, --auto
   ID_promo INT,-- 1 et max
   ID_centre INT,-- 1 et max
   PRIMARY KEY(ID_contient),--plus
   FOREIGN KEY(ID_promo) REFERENCES Promo(ID_promo),
   FOREIGN KEY(ID_centre) REFERENCES Centre(ID_centre)
);


insert into Competence (ID_competence, nom_competence) values (1, 'Communication écrite');
insert into Competence (ID_competence, nom_competence) values (2, 'Communication orale');
insert into Competence (ID_competence, nom_competence) values (3, 'Capacité de recherche');
insert into Competence (ID_competence, nom_competence) values (4, 'Résolution de problèmes');
insert into Competence (ID_competence, nom_competence) values (5, 'Esprit d''analyse');
insert into Competence (ID_competence, nom_competence) values (6, 'Capacité à travailler en équipe');
insert into Competence (ID_competence, nom_competence) values (7, 'Organisation');
insert into Competence (ID_competence, nom_competence) values (8, 'Gestion du temps');
insert into Competence (ID_competence, nom_competence) values (9, 'Adaptabilité');
insert into Competence (ID_competence, nom_competence) values (10, 'Créativité');
insert into Competence (ID_competence, nom_competence) values (11, 'Maîtrise des outils informatiques');
insert into Competence (ID_competence, nom_competence) values (12, 'Competence en programmation');
insert into Competence (ID_competence, nom_competence) values (13, 'Competence en conception graphique');
insert into Competence (ID_competence, nom_competence) values (14, 'Competence en marketing digital');
insert into Competence (ID_competence, nom_competence) values (15, 'Competence en gestion de projet');
insert into Competence (ID_competence, nom_competence) values (16, 'Competence en gestion de base de données');
insert into Competence (ID_competence, nom_competence) values (17, 'Capacité à résoudre les conflits');
insert into Competence (ID_competence, nom_competence) values (18, 'Leadership');
insert into Competence (ID_competence, nom_competence) values (19, 'Gestion du stress');
insert into Competence (ID_competence, nom_competence) values (20, 'Autonomie');
insert into Competence (ID_competence, nom_competence) values (21, 'Esprit d''initiative');
insert into Competence (ID_competence, nom_competence) values (22, 'Capacité à apprendre rapidement');
insert into Competence (ID_competence, nom_competence) values (23, 'Competence en présentation');
insert into Competence (ID_competence, nom_competence) values (24, 'Competence en négociation');
insert into Competence (ID_competence, nom_competence) values (25, 'Competence en relations interpersonnelles');
insert into Competence (ID_competence, nom_competence) values (26, 'Capacité à travailler sous pression');
insert into Competence (ID_competence, nom_competence) values (27, 'Competence en analyse financière');
insert into Competence (ID_competence, nom_competence) values (28, 'Competence linguistiques');
insert into Competence (ID_competence, nom_competence) values (29, 'Competence en recherche de marché');
insert into Competence (ID_competence, nom_competence) values (30, 'Competence en gestion des réseaux sociaux.');


insert into Promo (ID_promo, promo) values (1, 'A1');
insert into Promo (ID_promo, promo) values (2, 'A2');
insert into Promo (ID_promo, promo) values (3, 'A3');
insert into Promo (ID_promo, promo) values (4, 'A4');
insert into Promo (ID_promo, promo) values (5, 'A5');


INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (1, 'Technologie/Informatique', 'NovaTech Solutions', 'Assets\logo\logo1');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (2, 'Finance/Investissement', 'Quantum Ventures', 'Assets\logo\logo2');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (3, 'Technologie/Électronique', 'BlueWave Innovations', 'Assets\logo\logo3');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (4, 'Fabrication/Industrie', 'SilverLinx Industries', 'Assets\logo\logo4');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (5, 'Ingénierie/Mécanique', 'Zenith Dynamics', 'Assets\logo\logo5');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (6, 'Consulting/Conseil', 'OptiMystic Enterprises', 'Assets\logo\logo6');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (7, 'Énergie/Renouvelable', 'Apex Fusion Group', 'Assets\logo\logo7');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (8, 'Médias/Communication', 'Velocity Visions Inc.', 'Assets\logo\logo8');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (9, 'Services professionnels', 'Stellar Synergy Co.', 'Assets\logo\logo9');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (10, 'Immobilier/Construction', 'Horizon Heights Corporation', 'Assets\logo\logo10');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (11, 'Technologie/Internet', 'Nexus Nexus Inc.', 'Assets\logo\logo11');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (12, 'Fabrication/Métallurgie', 'Fusion Forge Industries', 'Assets\logo\logo12');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (13, 'Technologie/Audio', 'EchoEcho Enterprises', 'Assets\logo\logo13');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (14, 'Santé/Pharmaceutique', 'OmniGenix Solutions', 'Assets\logo\logo14');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (15, 'Technologie/Robotique', 'Phoenix Spark Technologies', 'Assets\logo\logo15');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (16, 'Chimie/Matériaux', 'Alchemy Alcove Ltd.', 'Assets\logo\logo16');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (17, 'Maritime/Transport', 'TitanTide Ventures', 'Assets\logo\logo17');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (18, 'Éducation/Formation', 'Pinnacle Prodigy Inc.', 'Assets\logo\logo18');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (19, 'Environnement/Développement durable', 'Solstice Solutions Group', 'Assets\logo\logo19');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (20, 'Luxe/Mode', 'Lumina Luxe Enterprises', 'Assets\logo\logo20');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (21, 'Logistique/Transport', 'Streamline Syndicate', 'Assets\logo\logo21');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (22, 'Environnement/Énergie propre', 'Infinity Impact Inc.', 'Assets\logo\logo22');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (23, 'Technologie/Cloud computing', 'Nimbus Nexus Corporation', 'Assets\logo\logo23');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (24, 'Astronomie/Technologie spatiale', 'Astral Axis Solutions', 'Assets\logo\logo24');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (25, 'Technologie/Communication vocale', 'VirtuVox Ventures', 'Assets\logo\logo25');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (26, 'Technologie/Internet des objets (IoT)', 'EchoSphere Enterprises', 'Assets\logo\logo26');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (27, 'Recherche/Développement', 'Arcane Innovations Inc.', 'Assets\logo\logo27');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (28, 'Marketing/Publicité', 'Element Edge Group', 'Assets\logo\logo28');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (29, 'Divertissement/Jeux vidéo', 'Radiant Realms Corporation', 'Assets\logo\logo29');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (30, 'Sécurité/Technologie de l information', 'Enigma Enterprises', 'Assets\logo\logo30');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (31, 'Design/Architecture', 'Cascade Concepts Co.', 'Assets\logo\logo31');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (32, 'Beauté/Produits de soins', 'Elysian Elements Inc.', 'Assets\logo\logo32');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (33, 'Aérospatiale/Aviation', 'Aurora Apex Ventures', 'Assets\logo\logo33');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (34, 'Technologie/Logiciel', 'Nexus Nucleus Solutions', 'Assets\logo\logo34');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (35, 'Consulting/Conseil en stratégie', 'Envision Enterprises', 'Assets\logo\logo35');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (36, 'Énergie/Éolien', 'Zephyr Zenith Inc.', 'Assets\logo\logo36');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (37, 'Santé/Bien-être', 'Serenity Systems Group', 'Assets\logo\logo37');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (38, 'Technologie/Énergie alternative', 'Synergy Sphere Solutions', 'Assets\logo\logo38');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (39, 'Voyage/Tourisme spatial', 'Odyssey OmniCorp', 'Assets\logo\logo39');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (40, 'Finance/Trading', 'Momentum Matrix Ltd.', 'Assets\logo\logo40');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (41, 'Technologie/Bien-être numérique', 'TranquilTech Enterprises', 'Assets\logo\logo41');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (42, 'Métallurgie/Fonderie', 'Phoenix Forge Inc.', 'Assets\logo\logo42');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (43, 'Équipement/Électronique grand public', 'Apex Ascent Corporation', 'Assets\logo\logo43');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (44, 'Technologie/Blockchain', 'Paragon Pinnacle Group', 'Assets\logo\logo44');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (45, 'Éducation/Formation en ligne', 'Genesis Grid Solutions', 'Assets\logo\logo45');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (46, 'Énergie/Fusion nucléaire', 'Quantum Quest Enterprises', 'Assets\logo\logo46');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (47, 'Technologie/Internet spatial', 'Fusion Flux Inc.', 'Assets\logo\logo47');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (48, 'Secteur non spécifié', 'Nebula Nexus Co.', 'Assets\logo\logo48');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (49, 'Technologie/Informatique', 'Apexia Alliance Ltd.', 'Assets\logo\logo49');
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (50, 'Finance/Investissement', 'Zenith Zone Ventures', 'Assets\logo\logo50');



-- Insertion des pays
INSERT INTO Pays (ID_pays, nom_pays) VALUES
(1, 'France'),
(2, 'Espagne'),
(3, 'Allemagne'),
(4, 'Italie'),
(5, 'Royaume-Uni'),
(6, 'Belgique'),
(7, 'Pays-Bas'),
(8, 'Portugal'),
(9, 'Suisse'),
(10, 'Suède'),
(11, 'Norvège'),
(12, 'Danemark'),
(13, 'Finlande'),
(14, 'Autriche'),
(15, 'Grèce'),
(16, 'Turquie'),
(17, 'Canada'),
(18, 'États-Unis'),
(19, 'Australie'),
(20, 'Japon');



insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (1, 'Bow', 'Pénélope', 'zW96UhV');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (2, 'Wearn', 'Mà', 'rY4ree##<');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (3, 'Petracchi', 'Loïca', 'bM5''uqQIl');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (4, 'MacAllen', 'Athéna', 'mB2{2V!');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (5, 'Moult', 'Mårten', 'zI6.W3CLqf');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (6, 'Bullivent', 'Cléopatre', 'xK0=g');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (7, 'O''Connor', 'Maïwenn', 'rE2qg');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (8, 'Crawshay', 'Marie-ève', 'mM9ovTb~');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (9, 'Ripper', 'Bérangère', 'bH7qw*''d');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (10, 'Zincke', 'Göran', 'oU3DXPsx');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (11, 'Reside', 'Stévina', 'oD83>');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (12, 'McCleary', 'Faîtes', 'vI9zCT1R(T');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (13, 'Lemar', 'Véronique', 'xA9..');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (14, 'Goggan', 'Åsa', 'vZ2*ned~');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (15, 'Ogelsby', 'Mà', 'wV5Jee');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (16, 'Seeborne', 'Lucrèce', 'hJ3|u1');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (17, 'Crinage', 'André', 'eL5ocm"M');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (18, 'Harbert', 'André', 'bP6SQn');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (19, 'Piddlehinton', 'Lóng', 'nE0?Q,B');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (20, 'Tolchard', 'Lén', 'kL7,<6=0');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (21, 'Ackwood', 'Desirée', 'fT2&=EAkKE');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (22, 'Ourtic', 'Crééz', 'wR4KFRoK');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (23, 'Waind', 'Anaël', 'xE20=');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (24, 'Ottee', 'Ophélie', 'hU3*2>l$aE');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (25, 'Bullon', 'Daphnée', 'sB0!X');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (26, 'McEniry', 'Clémence', 'tZ4UQ+`r');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (27, 'Dowty', 'Annotés', 'rM4}9');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (28, 'Klebes', 'Mylène', 'hJ5(?q5%');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (29, 'Stone', 'Miléna', 'xM6fOh{');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (30, 'Chalk', 'Uò', 'qC1?s.S*M');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (31, 'Dolton', 'Annotée', 'rJ8l&4');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (32, 'Minto', 'Aloïs', 'dJ7E6)jv%~');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (33, 'Obee', 'Léonie', 'pX1{F');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (34, 'Hiskey', 'Edmée', 'eC1/%Vd');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (35, 'Pickthall', 'Laïla', 'tI3jF{');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (36, 'Danell', 'Naëlle', 'aE8BBy7x');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (37, 'Skase', 'Mélia', 'yG6Ys');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (38, 'Shaw', 'Méthode', 'bL3M<h\_');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (39, 'Keogh', 'Bérengère', 'yL9DF$');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (40, 'Fender', 'Thérèsa', 'iI9)6iO>Rj');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (41, 'Oppery', 'Gaétane', 'tE7a8j');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (42, 'Handlin', 'Tán', 'eS65n(z+');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (43, 'Belsham', 'Chloé', 'vK5''CTKw');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (44, 'Heape', 'Adélie', 'xF51{q_z');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (45, 'Mains', 'Solène', 'iT6i@');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (46, 'Murtagh', 'Kuí', 'lB2!$`*"`');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (47, 'Saunper', 'Béatrice', 'pJ74k');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (48, 'Eloi', 'Mylène', 'lL1$_qa8w@');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (49, 'Hector', 'Méng', 'iQ2ANI');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (50, 'Grinval', 'Valérie', 'bQ2I3>_J`');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (51, 'Riccardo', 'Léandre', 'qB4jM~\?');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (52, 'Pittoli', 'Gaëlle', 'hM7/HP');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (53, 'Albasini', 'Illustrée', 'cK0\!%');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (54, 'Lovell', 'Märta', 'yU2wRQ');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (55, 'Hanigan', 'Liè', 'bJ7A\G5');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (56, 'Giovanni', 'Cinéma', 'yK34o4&');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (57, 'Milberry', 'Loïs', 'dY0pv12>9?');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (58, 'Brixey', 'Joséphine', 'oB6@T7Osg9');
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (59, 'Durston', 'Léane', 'oM52yal3(');
INSERT INTO Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) VALUES (60, 'Gard', 'Thérèsa', 'mV3YDX');
INSERT INTO Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) VALUES (61, 'Kenny', 'Théa', 'oP6E7Q7z');
INSERT INTO Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) VALUES (62, 'Daubeney', 'Eléa', 'mV8D3~');
INSERT INTO Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) VALUES (63, 'Golsworthy', 'Máni', 'xV4$2DQaJ');
INSERT INTO Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) VALUES (64, 'Bedwin', 'Zoé', 'eZ5Bb4');
INSERT INTO Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) VALUES (65, 'Brockelsby', 'Méabh', 'nI9>Fm9');
INSERT INTO Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) VALUES (66, 'Fuge', 'Márton', 'lE6qJk');
INSERT INTO Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) VALUES (67, 'Agneau', 'Adélie', 'eH3@6Z0');
INSERT INTO Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) VALUES (68, 'Galbreth', 'Lénora', 'hL0*YN)l@');
INSERT INTO Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) VALUES (69, 'Featherstonhalgh', 'Amélie', 'sV4@"x');
INSERT INTO Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) VALUES (70, 'Kleimt', 'Göran', 'oR8XM9');
INSERT INTO Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) VALUES (71, 'Kilburn', 'Félix', 'iW8EC');
INSERT INTO Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) VALUES (72, 'Bilney', 'Löic', 'wV3FeB?');
INSERT INTO Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) VALUES (73, 'Abrehart', 'Louane', 'pZ3$n4?');
INSERT INTO Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) VALUES (74, 'Hully', 'Andréanne', 'qG9}9i@B');
INSERT INTO Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) VALUES (75, 'Kincaid', 'Mårten', 'rD5T3Z$');



INSERT INTO Centre (ID_centre, nom_centre) VALUES
(1, 'CESI Paris'),
(2, 'CESI Toulouse'),
(3, 'CESI Lyon'),
(4, 'CESI Bordeaux'),
(5, 'CESI Nantes'),
(6, 'CESI Lille'),
(7, 'CESI Rennes'),
(8, 'CESI Strasbourg'),
(9, 'CESI Nice'),
(10, 'CESI Montpellier'),
(11, 'CESI Aix-en-Provence'),
(12, 'CESI Angers'),
(13, 'CESI Rouen'),
(14, 'CESI Grenoble'),
(15, 'CESI Toulon'),
(16, 'CESI Tours'),
(17, 'CESI Reims'),
(18, 'CESI Le Mans'),
(19, 'CESI Poitiers'),
(20, 'CESI Saint-Nazaire'),
(21, 'CESI Brest'),
(22, 'CESI Caen'),
(23, 'CESI Dijon'),
(24, 'CESI Orléans'),
(25, 'CESI Mulhouse');


-- Insertion des régions de France
INSERT INTO Région (ID_région, région, ID_pays) VALUES
(1, 'Auvergne-Rhône-Alpes', 1),
(2, 'Bourgogne-Franche-Comté', 1),
(3, 'Bretagne', 1),
(4, 'Centre-Val de Loire', 1),
(5, 'Corse', 1),
(6, 'Grand Est', 1),
(7, 'Hauts-de-France', 1),
(8, 'Île-de-France', 1),
(9, 'Normandie', 1),
(10, 'Nouvelle-Aquitaine', 1),
(11, 'Occitanie', 1),
(12, 'Pays de la Loire', 1),
(13, 'Provence-Alpes-Côte d''Azur', 1);






INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (1, 14, 1);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (2, 7, 2);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (3, 20, 3);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (4, 2, 4);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (5, 23, 5);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (6, 12, 6);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (7, 18, 7);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (8, 5, 8);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (9, 10, 9);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (10, 25, 10);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (11, 3, 11);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (12, 16, 12);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (13, 21, 13);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (14, 9, 14);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (15, 1, 15);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (16, 24, 16);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (17, 4, 17);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (18, 17, 18);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (19, 22, 19);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (20, 8, 20);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (21, 15, 21);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (22, 6, 22);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (23, 19, 23);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (24, 11, 24);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (25, 13, 25);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (26, 14, 26);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (27, 7, 27);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (28, 20, 28);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (29, 2, 29);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (30, 23, 30);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (31, 12, 31);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (32, 18, 32);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (33, 5, 33);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (34, 10, 34);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (35, 25, 35);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (36, 3, 36);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (37, 16, 37);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (38, 21, 38);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (39, 9, 39);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (40, 1, 40);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (41, 24, 41);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (42, 4, 42);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (43, 17, 43);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (44, 22, 44);
INSERT INTO Etudiant (ID_etudiant, ID_centre, ID_utilisateur) VALUES (45, 8, 45);


INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (1, 1, 46);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (2, 2, 47);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (3, 3, 48);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (4, 4, 49);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (5, 5, 50);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (6, 6, 51);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (7, 7, 52);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (8, 8, 53);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (9, 9, 54);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (10, 10, 55);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (11, 11, 56);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (12, 12, 57);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (13, 13, 58);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (14, 14, 59);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (15, 15, 60);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (16, 16, 61);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (17, 17, 62);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (18, 18, 63);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (19, 19, 64);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (20, 20, 65);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (21, 21, 66);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (22, 22, 67);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (23, 23, 68);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (24, 24, 69);
INSERT INTO Pilote (ID_pilote, ID_centre, ID_utilisateur) VALUES (25, 25, 70);


insert into Admin (ID_admin,ID_utilisateur) values (1,71);
insert into Admin (ID_admin,ID_utilisateur) values (2,72);
insert into Admin (ID_admin,ID_utilisateur) values (3,73);
insert into Admin (ID_admin,ID_utilisateur) values (4,74);
insert into Admin (ID_admin,ID_utilisateur) values (5,75);



INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (1, 1);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (2, 2);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (3, 3);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (4, 4);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (5, 5);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (6, 6);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (7, 7);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (8, 8);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (9, 9);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (10, 10);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (11, 11);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (12, 12);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (13, 13);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (14, 14);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (15, 15);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (16, 16);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (17, 17);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (18, 18);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (19, 19);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (20, 20);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (21, 21);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (22, 22);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (23, 23);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (24, 24);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (25, 25);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (26, 26);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (27, 27);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (28, 28);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (29, 29);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (30, 30);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (31, 31);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (32, 32);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (33, 33);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (34, 34);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (35, 35);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (36, 36);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (37, 37);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (38, 38);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (39, 39);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (40, 40);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (41, 41);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (42, 42);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (43, 43);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (44, 44);
INSERT INTO Wish_list (ID_wish_list, ID_etudiant) VALUES (45, 45);


insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (1, 4.0, 5, 39, 4);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (2, 3.1, 11, 30, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (3, 3.5, 24, 45, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (4, 3.5, 16, 4, 49);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (5, 4.3, 1, 11, 41);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (6, 3.6, 17, 10, 47);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (7, 4.2, 23, 22, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (8, 1.8, 10, 42, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (9, 3.0, 19, 28, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (10, 4.2, 10, 21, 25);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (11, 4.8, 4, 37, 38);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (12, 4.0, 21, 17, 41);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (13, 1.5, 9, 22, 35);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (14, 3.1, 19, 34, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (15, 3.9, 4, 9, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (16, 3.8, 22, 21, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (17, 2.6, 17, 39, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (18, 1.9, 20, 11, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (19, 2.1, 18, 1, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (20, 2.1, 18, 8, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (21, 3.5, 15, 29, 38);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (22, 4.5, 1, 29, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (23, 2.2, 3, 45, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (24, 2.6, 3, 36, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (25, 3.0, 10, 15, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (26, 5.0, 13, 33, 17);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (27, 1.6, 22, 2, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (28, 1.8, 7, 35, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (29, 2.6, 16, 6, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (30, 2.5, 19, 13, 26);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (31, 3.1, 21, 2, 29);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (32, 4.6, 23, 27, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (33, 1.6, 3, 24, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (34, 3.1, 6, 43, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (35, 3.1, 23, 32, 8);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (36, 2.1, 23, 33, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (37, 4.5, 11, 40, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (38, 2.3, 25, 24, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (39, 3.2, 24, 30, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (40, 2.6, 17, 36, 21);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (41, 1.8, 1, 22, 21);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (42, 3.5, 5, 33, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (43, 1.7, 21, 20, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (44, 4.7, 5, 37, 29);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (45, 4.4, 15, 43, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (46, 1.7, 16, 8, 25);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (47, 2.6, 4, 16, 28);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (48, 3.2, 10, 34, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (49, 5.0, 12, 24, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (50, 2.9, 15, 18, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (51, 3.2, 3, 35, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (52, 4.7, 17, 23, 12);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (53, 1.4, 24, 40, 28);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (54, 4.5, 24, 17, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (55, 2.2, 6, 14, 42);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (56, 2.1, 22, 34, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (57, 1.2, 16, 44, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (58, 3.6, 15, 6, 19);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (59, 3.0, 2, 34, 23);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (60, 4.7, 15, 25, 36);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (61, 2.8, 1, 23, 19);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (62, 1.8, 13, 18, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (63, 4.0, 15, 22, 44);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (64, 3.9, 17, 40, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (65, 3.3, 13, 20, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (66, 4.6, 1, 27, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (67, 4.8, 12, 45, 28);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (68, 2.6, 13, 18, 42);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (69, 2.8, 8, 30, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (70, 1.8, 11, 44, 49);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (71, 1.6, 6, 15, 4);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (72, 3.1, 22, 24, 19);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (73, 2.9, 17, 6, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (74, 4.0, 3, 31, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (75, 4.6, 21, 44, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (76, 1.3, 10, 33, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (77, 4.3, 20, 3, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (78, 4.7, 17, 4, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (79, 4.6, 23, 44, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (80, 4.1, 5, 26, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (81, 4.2, 15, 9, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (82, 3.5, 4, 26, 33);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (83, 4.7, 23, 3, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (84, 4.7, 4, 45, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (85, 2.8, 17, 44, 33);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (86, 1.4, 6, 33, 4);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (87, 1.3, 10, 12, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (88, 2.0, 19, 22, 4);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (89, 3.9, 18, 15, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (90, 2.2, 13, 22, 33);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (91, 3.5, 16, 42, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (92, 4.2, 22, 19, 7);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (93, 1.6, 6, 29, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (94, 3.5, 9, 19, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (95, 1.3, 18, 21, 38);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (96, 4.4, 3, 27, 35);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (97, 3.2, 9, 1, 19);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (98, 1.7, 17, 36, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (99, 1.1, 4, 40, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (100, 4.4, 25, 40, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (101, 4.4, 8, 22, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (102, 2.9, 1, 18, 8);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (103, 3.9, 3, 42, 17);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (104, 3.9, 11, 6, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (105, 3.4, 14, 17, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (106, 4.4, 17, 12, 36);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (107, 3.6, 3, 3, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (108, 4.2, 14, 18, 29);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (109, 4.9, 18, 11, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (110, 4.9, 8, 32, 21);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (111, 4.7, 9, 31, 37);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (112, 3.0, 16, 22, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (113, 3.9, 12, 23, 25);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (114, 1.2, 1, 30, 41);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (115, 3.2, 17, 27, 38);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (116, 2.2, 1, 15, 4);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (117, 3.7, 6, 28, 29);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (118, 3.3, 14, 7, 17);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (119, 3.0, 10, 31, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (120, 3.6, 8, 16, 44);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (121, 2.9, 4, 33, 44);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (122, 1.2, 14, 43, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (123, 4.0, 24, 11, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (124, 3.9, 17, 38, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (125, 3.9, 12, 35, 29);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (126, 1.8, 16, 27, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (127, 2.1, 16, 23, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (128, 3.0, 20, 24, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (129, 3.3, 21, 42, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (130, 3.4, 20, 21, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (131, 1.9, 25, 8, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (132, 4.6, 21, 8, 47);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (133, 2.3, 25, 21, 28);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (134, 2.5, 15, 7, 28);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (135, 3.0, 3, 14, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (136, 4.2, 12, 27, 35);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (137, 3.1, 17, 45, 19);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (138, 4.4, 12, 40, 46);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (139, 1.8, 11, 45, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (140, 2.9, 23, 8, 16);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (141, 2.1, 5, 31, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (142, 4.0, 16, 15, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (143, 3.9, 11, 23, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (144, 4.2, 4, 29, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (145, 4.6, 2, 40, 25);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (146, 1.8, 2, 45, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (147, 4.5, 14, 15, 47);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (148, 1.7, 4, 2, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (149, 4.6, 1, 3, 33);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (150, 1.4, 10, 40, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (151, 2.1, 15, 37, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (152, 4.3, 24, 9, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (153, 1.7, 19, 38, 41);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (154, 1.8, 23, 27, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (155, 4.8, 15, 40, 7);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (156, 4.3, 14, 10, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (157, 4.6, 1, 30, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (158, 2.9, 12, 28, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (159, 1.7, 24, 17, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (160, 1.9, 10, 11, 36);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (161, 4.2, 7, 13, 4);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (162, 4.2, 9, 15, 35);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (163, 2.1, 17, 43, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (164, 2.5, 22, 31, 44);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (165, 3.1, 6, 22, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (166, 4.4, 8, 7, 16);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (167, 1.2, 16, 31, 29);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (168, 4.2, 19, 28, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (169, 4.4, 6, 44, 47);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (170, 3.0, 24, 5, 21);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (171, 3.3, 15, 22, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (172, 4.7, 18, 1, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (173, 1.2, 23, 27, 12);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (174, 1.0, 17, 2, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (175, 4.9, 5, 3, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (176, 1.1, 13, 2, 26);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (177, 1.9, 24, 6, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (178, 4.3, 21, 45, 28);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (179, 4.8, 5, 10, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (180, 3.3, 15, 40, 33);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (181, 4.1, 9, 23, 7);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (182, 2.8, 5, 26, 37);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (183, 4.3, 16, 20, 25);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (184, 1.7, 11, 15, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (185, 1.9, 20, 35, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (186, 4.8, 15, 33, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (187, 1.4, 4, 27, 33);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (188, 1.0, 12, 41, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (189, 3.4, 1, 2, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (190, 1.5, 17, 7, 12);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (191, 1.8, 22, 6, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (192, 4.3, 14, 42, 7);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (193, 1.8, 9, 20, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (194, 3.0, 5, 35, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (195, 4.1, 11, 8, 49);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (196, 4.5, 23, 17, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (197, 2.4, 21, 37, 7);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (198, 3.6, 17, 1, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (199, 3.7, 1, 34, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (200, 2.9, 18, 7, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (201, 1.0, 11, 37, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (202, 4.2, 24, 38, 26);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (203, 1.1, 21, 26, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (204, 4.7, 25, 16, 26);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (205, 1.7, 14, 15, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (206, 4.8, 22, 26, 11);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (207, 1.5, 7, 45, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (208, 1.3, 5, 45, 36);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (209, 2.6, 12, 29, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (210, 4.8, 17, 12, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (211, 3.9, 1, 26, 35);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (212, 4.3, 23, 27, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (213, 1.4, 12, 12, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (214, 2.1, 10, 10, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (215, 4.1, 2, 44, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (216, 4.0, 17, 3, 2);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (217, 3.0, 16, 1, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (218, 3.2, 8, 32, 8);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (219, 1.6, 24, 22, 8);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (220, 3.5, 10, 28, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (221, 3.4, 1, 27, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (222, 4.7, 10, 39, 47);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (223, 2.1, 19, 1, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (224, 4.3, 9, 26, 28);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (225, 4.5, 22, 9, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (226, 4.1, 17, 15, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (227, 3.2, 17, 23, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (228, 2.3, 12, 43, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (229, 4.2, 21, 44, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (230, 2.7, 10, 14, 49);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (231, 2.6, 4, 8, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (232, 4.3, 20, 20, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (233, 2.5, 9, 12, 4);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (234, 4.2, 6, 39, 36);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (235, 3.8, 4, 8, 11);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (236, 1.3, 19, 10, 19);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (237, 1.2, 17, 35, 35);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (238, 1.0, 7, 43, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (239, 2.4, 2, 15, 8);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (240, 2.1, 15, 1, 23);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (241, 1.5, 21, 1, 33);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (242, 3.4, 13, 1, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (243, 3.2, 12, 23, 4);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (244, 2.7, 14, 5, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (245, 1.1, 16, 42, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (246, 4.0, 23, 3, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (247, 4.3, 23, 9, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (248, 3.3, 9, 29, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (249, 4.5, 21, 31, 33);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (250, 2.0, 19, 17, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (251, 3.0, 10, 15, 8);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (252, 4.0, 21, 24, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (253, 2.6, 9, 45, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (254, 1.2, 21, 15, 36);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (255, 4.8, 5, 3, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (256, 3.2, 4, 13, 2);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (257, 1.9, 23, 13, 35);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (258, 1.9, 2, 4, 19);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (259, 3.9, 1, 33, 19);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (260, 3.3, 5, 6, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (261, 1.5, 21, 12, 49);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (262, 4.5, 21, 40, 12);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (263, 2.1, 21, 29, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (264, 1.2, 16, 25, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (265, 3.8, 21, 29, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (266, 1.3, 21, 15, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (267, 4.0, 23, 18, 23);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (268, 1.2, 12, 42, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (269, 1.3, 2, 25, 41);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (270, 1.8, 3, 32, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (271, 1.2, 3, 43, 41);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (272, 1.4, 7, 5, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (273, 2.4, 24, 40, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (274, 1.3, 11, 31, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (275, 2.7, 18, 28, 21);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (276, 1.2, 16, 6, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (277, 5.0, 4, 12, 23);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (278, 3.9, 9, 24, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (279, 1.6, 9, 45, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (280, 2.5, 8, 12, 26);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (281, 4.6, 1, 23, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (282, 4.3, 17, 13, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (283, 2.3, 24, 23, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (284, 1.5, 22, 45, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (285, 3.2, 23, 14, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (286, 4.9, 10, 19, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (287, 3.0, 17, 1, 41);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (288, 2.2, 7, 9, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (289, 1.2, 9, 2, 42);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (290, 1.3, 10, 33, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (291, 4.3, 12, 13, 23);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (292, 3.3, 21, 32, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (293, 2.8, 23, 24, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (294, 2.5, 14, 36, 4);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (295, 3.6, 3, 19, 11);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (296, 3.6, 3, 44, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (297, 1.3, 1, 24, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (298, 2.7, 19, 23, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (299, 3.9, 15, 17, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (300, 1.6, 11, 16, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (301, 4.0, 17, 25, 46);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (302, 2.0, 14, 45, 2);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (303, 2.5, 9, 21, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (304, 1.8, 25, 21, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (305, 4.4, 20, 16, 11);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (306, 2.8, 17, 25, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (307, 1.3, 21, 45, 28);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (308, 2.5, 5, 40, 16);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (309, 4.1, 23, 12, 44);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (310, 2.1, 16, 31, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (311, 4.2, 18, 6, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (312, 2.8, 25, 12, 29);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (313, 4.0, 5, 2, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (314, 3.1, 21, 32, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (315, 4.5, 9, 13, 12);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (316, 4.1, 1, 12, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (317, 1.6, 6, 39, 33);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (318, 4.7, 3, 3, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (319, 3.4, 19, 5, 35);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (320, 2.7, 5, 3, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (321, 3.0, 1, 20, 7);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (322, 1.1, 19, 25, 35);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (323, 4.7, 16, 25, 49);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (324, 4.6, 5, 40, 38);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (325, 4.9, 21, 15, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (326, 3.3, 14, 1, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (327, 3.3, 5, 44, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (328, 2.9, 9, 40, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (329, 4.6, 9, 11, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (330, 3.8, 8, 43, 23);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (331, 3.0, 25, 4, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (332, 4.1, 9, 42, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (333, 1.3, 21, 40, 37);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (334, 3.4, 18, 31, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (335, 2.8, 10, 45, 33);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (336, 4.1, 6, 1, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (337, 2.7, 9, 2, 21);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (338, 3.5, 6, 35, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (339, 4.1, 1, 6, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (340, 1.7, 25, 6, 44);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (341, 4.3, 24, 44, 26);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (342, 1.4, 22, 28, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (343, 2.2, 18, 16, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (344, 1.1, 2, 29, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (345, 2.7, 5, 3, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (346, 3.9, 1, 31, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (347, 1.9, 24, 43, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (348, 2.2, 15, 14, 47);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (349, 2.5, 17, 3, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (350, 4.2, 8, 42, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (351, 4.1, 22, 20, 36);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (352, 1.3, 9, 21, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (353, 2.8, 12, 12, 33);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (354, 2.8, 4, 22, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (355, 4.5, 13, 16, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (356, 1.8, 2, 4, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (357, 1.5, 18, 3, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (358, 1.7, 15, 13, 25);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (359, 1.9, 21, 34, 12);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (360, 4.6, 20, 45, 23);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (361, 3.9, 22, 10, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (362, 3.8, 6, 41, 7);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (363, 4.1, 9, 37, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (364, 4.1, 24, 44, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (365, 1.0, 14, 20, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (366, 2.0, 9, 21, 16);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (367, 1.9, 6, 21, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (368, 3.3, 21, 28, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (369, 3.2, 1, 38, 4);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (370, 1.5, 13, 31, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (371, 1.9, 23, 32, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (372, 1.9, 20, 25, 25);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (373, 1.9, 4, 45, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (374, 4.0, 25, 23, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (375, 3.2, 24, 15, 2);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (376, 3.2, 25, 38, 36);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (377, 3.3, 11, 6, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (378, 5.0, 10, 26, 29);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (379, 4.7, 18, 42, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (380, 3.3, 1, 36, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (381, 3.1, 17, 39, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (382, 2.5, 23, 6, 46);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (383, 1.6, 6, 44, 4);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (384, 2.6, 25, 19, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (385, 3.8, 24, 8, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (386, 3.7, 23, 15, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (387, 3.9, 6, 12, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (388, 4.1, 15, 45, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (389, 4.8, 11, 32, 11);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (390, 1.9, 10, 29, 2);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (391, 4.5, 23, 37, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (392, 2.7, 11, 11, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (393, 3.9, 4, 32, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (394, 5.0, 9, 32, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (395, 3.5, 11, 28, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (396, 3.4, 1, 45, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (397, 3.8, 7, 43, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (398, 4.8, 11, 39, 33);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (399, 3.8, 21, 31, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (400, 1.1, 2, 35, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (401, 2.1, 15, 15, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (402, 4.9, 11, 41, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (403, 3.6, 23, 18, 38);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (404, 4.7, 6, 36, 47);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (405, 1.4, 18, 21, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (406, 2.5, 23, 28, 21);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (407, 4.5, 16, 12, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (408, 1.2, 17, 7, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (409, 2.8, 17, 2, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (410, 3.4, 17, 23, 23);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (411, 1.3, 15, 1, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (412, 2.1, 19, 3, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (413, 4.0, 20, 45, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (414, 3.4, 7, 30, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (415, 2.3, 13, 33, 2);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (416, 4.3, 13, 34, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (417, 1.4, 13, 20, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (418, 1.6, 10, 45, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (419, 2.4, 18, 25, 16);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (420, 1.0, 22, 40, 12);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (421, 3.5, 9, 8, 33);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (422, 3.9, 9, 20, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (423, 2.4, 13, 40, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (424, 1.2, 15, 17, 8);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (425, 2.0, 15, 13, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (426, 4.6, 15, 17, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (427, 4.2, 21, 22, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (428, 2.0, 2, 10, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (429, 4.0, 1, 43, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (430, 1.1, 11, 24, 35);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (431, 4.1, 13, 33, 16);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (432, 4.4, 14, 12, 16);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (433, 2.2, 25, 12, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (434, 3.6, 15, 8, 21);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (435, 2.6, 22, 34, 23);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (436, 1.7, 20, 15, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (437, 3.3, 16, 24, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (438, 1.3, 20, 17, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (439, 4.1, 22, 33, 8);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (440, 1.5, 17, 2, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (441, 3.4, 25, 1, 21);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (442, 2.6, 13, 44, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (443, 4.2, 12, 15, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (444, 4.9, 3, 24, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (445, 3.9, 14, 42, 49);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (446, 2.3, 25, 42, 4);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (447, 1.1, 23, 22, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (448, 2.0, 11, 35, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (449, 1.1, 3, 5, 47);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (450, 3.4, 25, 32, 19);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (451, 1.4, 12, 34, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (452, 3.0, 13, 25, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (453, 2.6, 10, 14, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (454, 2.5, 22, 17, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (455, 3.5, 24, 28, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (456, 1.1, 10, 9, 29);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (457, 4.8, 20, 31, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (458, 3.1, 1, 18, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (459, 4.6, 11, 27, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (460, 3.4, 18, 4, 17);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (461, 1.9, 16, 30, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (462, 2.9, 6, 39, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (463, 4.8, 3, 36, 2);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (464, 3.1, 8, 41, 26);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (465, 3.1, 15, 40, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (466, 2.1, 22, 25, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (467, 4.4, 21, 39, 33);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (468, 3.0, 12, 28, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (469, 3.3, 12, 31, 28);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (470, 4.9, 13, 44, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (471, 4.3, 11, 13, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (472, 2.6, 22, 30, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (473, 1.2, 3, 27, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (474, 3.0, 2, 25, 16);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (475, 2.9, 23, 8, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (476, 3.4, 12, 30, 8);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (477, 1.1, 23, 36, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (478, 2.9, 8, 35, 26);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (479, 3.2, 2, 2, 44);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (480, 4.0, 18, 20, 2);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (481, 1.4, 11, 40, 49);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (482, 2.6, 21, 37, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (483, 2.0, 22, 26, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (484, 1.5, 17, 16, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (485, 2.0, 23, 36, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (486, 4.6, 17, 42, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (487, 4.4, 12, 28, 19);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (488, 2.0, 15, 11, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (489, 4.5, 4, 37, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (490, 3.8, 14, 14, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (491, 3.5, 23, 4, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (492, 4.7, 6, 6, 35);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (493, 1.9, 16, 38, 21);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (494, 2.2, 21, 10, 25);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (495, 1.4, 2, 32, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (496, 4.9, 5, 31, 25);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (497, 1.9, 7, 20, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (498, 4.1, 12, 31, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (499, 1.9, 10, 37, 36);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (500, 2.8, 23, 28, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (501, 3.4, 7, 4, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (502, 1.6, 16, 20, 12);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (503, 1.3, 23, 17, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (504, 3.4, 4, 39, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (505, 2.5, 16, 26, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (506, 2.2, 18, 9, 36);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (507, 2.2, 25, 40, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (508, 2.1, 6, 32, 49);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (509, 3.1, 16, 3, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (510, 3.3, 2, 12, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (511, 2.7, 23, 12, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (512, 4.4, 2, 25, 2);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (513, 1.6, 17, 6, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (514, 2.2, 5, 44, 44);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (515, 4.5, 17, 26, 36);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (516, 2.6, 14, 6, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (517, 2.2, 10, 23, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (518, 4.3, 22, 13, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (519, 4.1, 8, 7, 4);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (520, 3.3, 23, 39, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (521, 3.7, 12, 34, 26);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (522, 4.8, 4, 26, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (523, 3.2, 17, 17, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (524, 3.0, 16, 11, 8);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (525, 3.1, 5, 6, 38);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (526, 3.2, 23, 34, 47);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (527, 3.8, 12, 41, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (528, 3.2, 16, 15, 17);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (529, 4.9, 4, 1, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (530, 3.5, 17, 35, 38);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (531, 3.8, 7, 18, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (532, 2.0, 7, 33, 36);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (533, 4.8, 23, 3, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (534, 3.1, 8, 29, 47);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (535, 1.9, 3, 2, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (536, 3.5, 1, 9, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (537, 3.1, 24, 24, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (538, 2.9, 2, 24, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (539, 1.8, 3, 44, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (540, 3.2, 2, 3, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (541, 4.8, 10, 18, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (542, 4.6, 18, 19, 29);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (543, 4.7, 21, 29, 47);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (544, 4.1, 14, 21, 25);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (545, 2.0, 25, 17, 16);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (546, 2.7, 5, 16, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (547, 2.9, 20, 38, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (548, 3.2, 17, 19, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (549, 4.8, 2, 37, 25);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (550, 3.5, 15, 15, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (551, 2.9, 19, 15, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (552, 3.6, 20, 29, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (553, 2.9, 5, 21, 21);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (554, 4.5, 2, 37, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (555, 2.8, 8, 15, 25);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (556, 1.4, 1, 32, 25);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (557, 3.6, 23, 26, 38);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (558, 1.3, 2, 43, 49);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (559, 1.9, 3, 25, 8);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (560, 1.6, 24, 38, 42);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (561, 4.0, 24, 10, 44);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (562, 3.6, 4, 24, 26);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (563, 4.1, 13, 42, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (564, 4.9, 12, 9, 42);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (565, 2.2, 10, 2, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (566, 3.3, 24, 11, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (567, 4.8, 18, 30, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (568, 2.4, 14, 22, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (569, 1.7, 8, 25, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (570, 3.2, 11, 22, 29);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (571, 3.6, 14, 21, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (572, 1.4, 8, 30, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (573, 4.4, 8, 45, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (574, 2.0, 18, 17, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (575, 1.8, 16, 25, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (576, 4.9, 22, 23, 7);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (577, 3.8, 4, 34, 2);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (578, 2.3, 8, 10, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (579, 2.5, 17, 12, 11);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (580, 1.9, 11, 18, 37);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (581, 2.1, 9, 43, 8);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (582, 3.5, 15, 18, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (583, 2.6, 25, 12, 38);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (584, 2.3, 11, 6, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (585, 2.1, 24, 41, 12);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (586, 2.5, 9, 24, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (587, 2.0, 6, 5, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (588, 2.4, 17, 41, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (589, 1.7, 11, 8, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (590, 1.7, 2, 34, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (591, 1.6, 24, 7, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (592, 4.5, 12, 22, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (593, 1.5, 10, 42, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (594, 4.4, 15, 4, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (595, 4.5, 2, 21, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (596, 3.1, 24, 3, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (597, 1.2, 16, 15, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (598, 4.0, 8, 43, 37);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (599, 3.4, 13, 38, 46);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (600, 4.1, 14, 11, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (601, 1.9, 10, 29, 4);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (602, 4.7, 4, 43, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (603, 2.1, 14, 12, 23);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (604, 3.4, 19, 2, 19);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (605, 2.1, 12, 20, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (606, 5.0, 24, 6, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (607, 2.0, 22, 27, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (608, 3.2, 15, 34, 37);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (609, 2.0, 2, 22, 46);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (610, 3.0, 8, 44, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (611, 3.7, 20, 24, 4);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (612, 2.1, 14, 7, 41);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (613, 2.9, 10, 10, 21);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (614, 1.2, 22, 3, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (615, 3.0, 22, 37, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (616, 1.4, 15, 6, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (617, 1.6, 20, 31, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (618, 1.3, 2, 2, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (619, 4.1, 1, 16, 41);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (620, 3.2, 12, 20, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (621, 3.1, 3, 23, 21);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (622, 1.2, 16, 2, 29);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (623, 3.2, 21, 13, 33);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (624, 3.3, 7, 11, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (625, 4.2, 13, 41, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (626, 2.6, 2, 14, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (627, 4.3, 4, 10, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (628, 2.4, 9, 1, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (629, 3.8, 19, 10, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (630, 3.8, 5, 4, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (631, 2.7, 7, 25, 28);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (632, 3.5, 23, 3, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (633, 4.9, 21, 2, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (634, 3.3, 12, 36, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (635, 4.0, 5, 15, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (636, 1.8, 25, 41, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (637, 1.3, 21, 25, 7);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (638, 2.8, 23, 2, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (639, 1.5, 7, 27, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (640, 1.4, 16, 6, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (641, 3.0, 18, 21, 38);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (642, 2.9, 19, 41, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (643, 1.1, 9, 21, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (644, 3.3, 5, 30, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (645, 3.4, 14, 24, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (646, 3.6, 20, 26, 17);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (647, 4.9, 2, 7, 11);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (648, 1.4, 3, 16, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (649, 2.0, 10, 26, 8);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (650, 4.5, 18, 1, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (651, 4.9, 17, 3, 42);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (652, 3.6, 24, 42, 28);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (653, 1.1, 17, 1, 19);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (654, 4.3, 8, 16, 12);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (655, 2.8, 7, 10, 28);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (656, 3.2, 1, 24, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (657, 3.5, 9, 18, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (658, 3.1, 7, 45, 41);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (659, 2.3, 3, 34, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (660, 4.1, 20, 43, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (661, 3.2, 1, 38, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (662, 4.6, 3, 39, 26);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (663, 1.6, 18, 24, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (664, 1.8, 17, 39, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (665, 3.1, 23, 27, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (666, 4.6, 14, 2, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (667, 3.1, 24, 12, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (668, 3.0, 4, 16, 28);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (669, 3.2, 1, 31, 46);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (670, 3.0, 22, 34, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (671, 3.7, 17, 32, 38);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (672, 3.1, 17, 35, 42);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (673, 4.7, 8, 40, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (674, 3.7, 1, 44, 44);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (675, 4.4, 22, 11, 37);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (676, 1.2, 6, 32, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (677, 1.1, 3, 25, 11);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (678, 3.3, 6, 19, 35);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (679, 3.1, 10, 27, 2);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (680, 2.0, 25, 41, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (681, 2.7, 5, 2, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (682, 3.7, 25, 2, 23);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (683, 2.6, 23, 6, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (684, 2.6, 5, 19, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (685, 1.6, 17, 34, 23);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (686, 3.4, 19, 20, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (687, 2.1, 11, 15, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (688, 2.6, 14, 28, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (689, 3.3, 23, 15, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (690, 4.0, 24, 12, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (691, 4.1, 11, 24, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (692, 2.4, 2, 4, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (693, 2.2, 14, 41, 46);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (694, 3.1, 3, 6, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (695, 1.9, 21, 32, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (696, 2.3, 6, 43, 35);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (697, 2.6, 23, 35, 17);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (698, 4.0, 10, 2, 25);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (699, 2.4, 23, 14, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (700, 3.5, 7, 15, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (701, 2.6, 12, 11, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (702, 4.2, 25, 20, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (703, 4.9, 13, 14, 49);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (704, 2.9, 10, 39, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (705, 3.6, 14, 1, 28);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (706, 2.4, 11, 40, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (707, 2.6, 9, 36, 21);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (708, 3.5, 11, 16, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (709, 3.5, 24, 42, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (710, 2.0, 10, 44, 11);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (711, 4.9, 21, 37, 8);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (712, 2.7, 3, 21, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (713, 4.4, 24, 30, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (714, 1.1, 5, 20, 19);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (715, 4.9, 12, 20, 44);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (716, 3.6, 23, 43, 17);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (717, 1.9, 17, 19, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (718, 1.4, 8, 12, 38);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (719, 3.4, 11, 24, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (720, 1.3, 12, 38, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (721, 3.5, 13, 14, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (722, 2.5, 12, 16, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (723, 3.8, 7, 42, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (724, 3.4, 12, 22, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (725, 2.1, 10, 21, 8);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (726, 1.2, 18, 3, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (727, 4.7, 9, 28, 21);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (728, 1.2, 17, 32, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (729, 4.6, 20, 24, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (730, 1.3, 4, 4, 46);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (731, 4.9, 18, 35, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (732, 2.7, 23, 37, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (733, 1.3, 18, 15, 16);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (734, 1.3, 8, 33, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (735, 3.6, 15, 13, 26);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (736, 4.1, 1, 29, 8);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (737, 3.8, 20, 36, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (738, 3.1, 15, 15, 11);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (739, 1.5, 2, 13, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (740, 1.0, 3, 20, 11);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (741, 3.8, 10, 21, 21);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (742, 4.3, 11, 34, 26);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (743, 2.1, 6, 14, 11);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (744, 4.6, 1, 16, 12);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (745, 1.9, 21, 19, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (746, 1.8, 11, 2, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (747, 3.9, 16, 44, 33);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (748, 2.8, 9, 38, 49);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (749, 3.3, 25, 23, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (750, 4.7, 5, 28, 21);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (751, 1.1, 14, 27, 37);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (752, 2.3, 3, 9, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (753, 3.2, 23, 24, 38);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (754, 1.2, 18, 23, 16);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (755, 3.5, 23, 16, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (756, 2.1, 20, 36, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (757, 3.3, 22, 10, 7);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (758, 2.5, 8, 36, 17);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (759, 4.1, 19, 23, 35);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (760, 1.4, 14, 42, 17);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (761, 3.4, 15, 31, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (762, 2.2, 4, 31, 11);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (763, 4.9, 16, 44, 46);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (764, 2.9, 17, 18, 37);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (765, 4.9, 5, 5, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (766, 1.3, 17, 5, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (767, 2.8, 14, 25, 17);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (768, 4.8, 9, 28, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (769, 4.7, 17, 25, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (770, 2.8, 13, 19, 49);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (771, 2.2, 24, 28, 2);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (772, 2.4, 23, 45, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (773, 1.1, 22, 27, 37);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (774, 2.2, 1, 7, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (775, 4.3, 4, 30, 26);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (776, 4.2, 19, 18, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (777, 2.3, 2, 16, 11);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (778, 3.9, 11, 42, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (779, 2.9, 3, 32, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (780, 2.2, 18, 22, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (781, 4.0, 8, 10, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (782, 1.6, 6, 11, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (783, 2.1, 2, 34, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (784, 4.1, 1, 26, 36);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (785, 1.6, 17, 18, 8);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (786, 2.8, 12, 31, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (787, 1.7, 24, 45, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (788, 1.3, 19, 2, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (789, 4.3, 12, 45, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (790, 3.9, 19, 42, 37);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (791, 2.7, 19, 9, 29);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (792, 4.8, 22, 9, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (793, 4.3, 2, 5, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (794, 1.4, 7, 34, 46);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (795, 3.0, 19, 24, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (796, 1.6, 18, 38, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (797, 3.4, 20, 35, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (798, 3.0, 21, 18, 37);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (799, 2.5, 23, 6, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (800, 1.1, 13, 17, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (801, 3.9, 22, 24, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (802, 1.9, 20, 41, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (803, 3.2, 16, 11, 46);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (804, 1.3, 11, 43, 19);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (805, 3.1, 13, 18, 23);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (806, 2.1, 24, 44, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (807, 1.9, 25, 28, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (808, 1.9, 20, 1, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (809, 4.2, 19, 31, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (810, 2.8, 15, 8, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (811, 4.7, 8, 4, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (812, 1.7, 3, 21, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (813, 3.3, 14, 1, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (814, 3.8, 24, 7, 46);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (815, 4.7, 16, 16, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (816, 4.0, 20, 22, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (817, 3.5, 21, 20, 25);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (818, 2.5, 21, 43, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (819, 3.1, 25, 8, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (820, 1.3, 17, 3, 21);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (821, 4.5, 22, 7, 36);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (822, 1.5, 7, 8, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (823, 4.7, 21, 42, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (824, 1.4, 9, 17, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (825, 3.4, 17, 11, 42);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (826, 3.7, 6, 30, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (827, 4.9, 2, 30, 21);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (828, 1.9, 8, 44, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (829, 3.4, 24, 1, 49);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (830, 4.8, 12, 10, 41);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (831, 1.3, 23, 20, 2);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (832, 2.8, 13, 17, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (833, 5.0, 22, 12, 19);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (834, 3.6, 8, 20, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (835, 4.6, 18, 5, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (836, 1.0, 25, 39, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (837, 3.7, 4, 42, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (838, 1.0, 19, 33, 23);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (839, 2.7, 15, 21, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (840, 3.9, 6, 35, 37);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (841, 4.8, 22, 19, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (842, 4.0, 13, 40, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (843, 1.2, 19, 1, 29);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (844, 4.0, 7, 43, 4);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (845, 2.2, 20, 12, 41);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (846, 2.5, 11, 36, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (847, 1.1, 9, 44, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (848, 2.9, 7, 6, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (849, 2.4, 3, 44, 4);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (850, 3.3, 11, 31, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (851, 2.7, 18, 18, 23);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (852, 1.4, 25, 34, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (853, 5.0, 20, 24, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (854, 4.3, 4, 11, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (855, 4.6, 19, 7, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (856, 2.1, 9, 41, 49);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (857, 2.7, 16, 16, 12);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (858, 4.9, 22, 40, 49);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (859, 4.8, 24, 23, 34);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (860, 4.3, 13, 35, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (861, 4.9, 13, 12, 35);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (862, 1.8, 19, 17, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (863, 1.2, 22, 33, 25);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (864, 3.8, 4, 25, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (865, 2.8, 18, 37, 41);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (866, 1.6, 14, 7, 16);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (867, 4.9, 20, 44, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (868, 4.7, 16, 14, 44);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (869, 3.4, 13, 31, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (870, 4.4, 6, 34, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (871, 2.7, 19, 2, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (872, 4.8, 11, 2, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (873, 4.7, 2, 31, 23);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (874, 3.8, 2, 14, 44);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (875, 2.4, 8, 8, 4);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (876, 4.4, 8, 9, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (877, 4.9, 2, 3, 29);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (878, 3.5, 25, 41, 7);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (879, 1.2, 3, 34, 19);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (880, 1.8, 23, 33, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (881, 2.2, 20, 1, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (882, 1.6, 7, 22, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (883, 2.7, 5, 32, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (884, 4.4, 11, 1, 9);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (885, 4.0, 9, 30, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (886, 1.8, 22, 29, 41);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (887, 4.7, 6, 32, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (888, 1.5, 6, 36, 47);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (889, 3.4, 14, 11, 47);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (890, 3.0, 8, 18, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (891, 1.5, 17, 43, 42);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (892, 1.9, 23, 19, 7);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (893, 2.4, 6, 7, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (894, 3.6, 7, 22, 29);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (895, 3.8, 25, 18, 29);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (896, 3.6, 24, 45, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (897, 4.3, 23, 11, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (898, 4.8, 18, 5, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (899, 4.6, 10, 27, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (900, 1.2, 11, 14, 5);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (901, 1.7, 2, 22, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (902, 1.2, 24, 24, 25);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (903, 1.9, 13, 14, 11);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (904, 1.1, 2, 19, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (905, 2.4, 15, 14, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (906, 4.9, 11, 3, 48);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (907, 3.4, 20, 29, 33);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (908, 1.9, 21, 19, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (909, 3.6, 21, 40, 38);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (910, 1.9, 19, 15, 41);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (911, 2.8, 19, 32, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (912, 4.0, 13, 13, 26);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (913, 2.0, 25, 40, 42);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (914, 2.5, 2, 18, 41);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (915, 1.9, 21, 39, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (916, 4.2, 17, 30, 14);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (917, 1.0, 8, 34, 27);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (918, 2.2, 6, 4, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (919, 1.4, 22, 39, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (920, 3.6, 11, 15, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (921, 4.6, 13, 26, 44);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (922, 1.4, 23, 43, 37);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (923, 3.6, 6, 11, 12);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (924, 4.4, 8, 15, 42);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (925, 2.6, 17, 20, 7);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (926, 5.0, 14, 42, 49);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (927, 1.2, 1, 15, 35);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (928, 2.4, 15, 39, 20);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (929, 3.9, 22, 31, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (930, 4.6, 21, 26, 46);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (931, 2.0, 10, 21, 30);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (932, 2.8, 25, 21, 37);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (933, 2.0, 24, 33, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (934, 2.9, 18, 42, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (935, 1.6, 19, 37, 36);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (936, 4.3, 3, 36, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (937, 2.6, 16, 23, 47);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (938, 3.5, 18, 24, 18);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (939, 1.5, 14, 42, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (940, 4.5, 17, 1, 16);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (941, 4.3, 11, 39, 26);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (942, 3.4, 1, 21, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (943, 3.6, 20, 17, 29);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (944, 3.1, 8, 6, 46);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (945, 1.3, 12, 32, 17);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (946, 4.2, 22, 1, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (947, 3.5, 19, 31, 44);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (948, 1.6, 6, 1, 35);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (949, 4.3, 3, 11, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (950, 3.7, 2, 37, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (951, 2.7, 13, 40, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (952, 2.0, 8, 30, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (953, 3.6, 16, 30, 47);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (954, 3.8, 24, 11, 38);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (955, 1.4, 16, 28, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (956, 3.7, 20, 26, 47);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (957, 3.4, 22, 27, 40);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (958, 1.8, 20, 3, 44);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (959, 2.1, 10, 16, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (960, 2.0, 22, 12, 41);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (961, 3.3, 17, 22, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (962, 3.2, 17, 25, 26);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (963, 3.0, 13, 34, 50);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (964, 4.2, 4, 43, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (965, 4.9, 14, 18, 44);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (966, 1.6, 23, 5, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (967, 1.4, 11, 20, 24);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (968, 3.8, 9, 5, 8);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (969, 3.5, 23, 10, 44);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (970, 4.2, 3, 26, 38);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (971, 4.6, 1, 8, 28);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (972, 2.7, 10, 14, 43);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (973, 4.9, 10, 44, 6);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (974, 4.6, 9, 15, 35);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (975, 2.2, 24, 14, 11);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (976, 3.4, 17, 20, 15);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (977, 1.9, 25, 1, 3);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (978, 1.5, 20, 10, 11);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (979, 5.0, 14, 16, 46);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (980, 3.8, 18, 13, 19);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (981, 3.8, 9, 10, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (982, 4.2, 3, 32, 4);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (983, 1.1, 3, 9, 22);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (984, 2.0, 7, 43, 12);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (985, 4.5, 20, 22, 39);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (986, 3.2, 1, 23, 11);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (987, 1.5, 16, 26, 33);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (988, 1.1, 9, 1, 10);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (989, 2.5, 3, 26, 23);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (990, 3.5, 20, 21, 2);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (991, 3.9, 4, 20, 45);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (992, 3.3, 8, 4, 47);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (993, 2.3, 9, 38, 13);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (994, 2.6, 5, 23, 32);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (995, 2.6, 12, 8, 1);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (996, 2.5, 2, 33, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (997, 4.2, 13, 26, 17);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (998, 3.3, 20, 37, 31);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (999, 3.8, 14, 17, 36);
insert into Evaluation (ID_evaluation, note, ID_pilote, ID_etudiant, ID_entreprise) values (1000, 2.0, 6, 6, 2);



-- Insertion des villes avec les régions correspondantes
INSERT INTO Ville (ID_ville, ville, ID_région) VALUES
(1, 'Paris', 8), -- Île-de-France
(2, 'Toulouse', 11), -- Occitanie
(3, 'Lyon', 1), -- Auvergne-Rhône-Alpes
(4, 'Bordeaux', 10), -- Nouvelle-Aquitaine
(5, 'Nantes', 12), -- Pays de la Loire
(6, 'Lille', 7), -- Hauts-de-France
(7, 'Rennes', 3), -- Bretagne
(8, 'Strasbourg', 6), -- Grand Est
(9, 'Nice', 13), -- Provence-Alpes-Côte d'Azur
(10, 'Montpellier', 11), -- Occitanie
(11, 'Aix-en-Provence', 13), -- Provence-Alpes-Côte d'Azur
(12, 'Angers', 12), -- Pays de la Loire
(13, 'Rouen', 9), -- Normandie
(14, 'Grenoble', 1), -- Auvergne-Rhône-Alpes
(15, 'Toulon', 13), -- Provence-Alpes-Côte d'Azur
(16, 'Tours', 4), -- Centre-Val de Loire
(17, 'Reims', 8), -- Grand Est
(18, 'Le Mans', 12), -- Pays de la Loire
(19, 'Poitiers', 10), -- Nouvelle-Aquitaine
(20, 'Saint-Nazaire', 12), -- Pays de la Loire
(21, 'Brest', 3), -- Bretagne
(22, 'Caen', 9), -- Normandie
(23, 'Dijon', 2), -- Bourgogne-Franche-Comté
(24, 'Orléans', 4), -- Centre-Val de Loire
(25, 'Mulhouse', 8), -- Grand Est
(26, 'Metz', 8), -- Grand Est
(27, 'Besançon', 2), -- Bourgogne-Franche-Comté
(28, 'Limoges', 10), -- Nouvelle-Aquitaine
(29, 'Annecy', 1), -- Auvergne-Rhône-Alpes
(30, 'Perpignan', 11), -- Occitanie
(31, 'Béziers', 11), -- Occitanie
(32, 'Avignon', 13), -- Provence-Alpes-Côte d'Azur
(33, 'Cannes', 13), -- Provence-Alpes-Côte d'Azur
(34, 'Marseille', 13), -- Provence-Alpes-Côte d'Azur
(35, 'Nîmes', 11), -- Occitanie
(36, 'Niort', 10), -- Nouvelle-Aquitaine
(37, 'Pau', 11), -- Occitanie
(38, 'Bayonne', 10), -- Nouvelle-Aquitaine
(39, 'Vannes', 12), -- Pays de la Loire
(40, 'La Rochelle', 10), -- Nouvelle-Aquitaine
(41, 'La Roche-sur-Yon', 12), -- Pays de la Loire
(42, 'Cholet', 12), -- Pays de la Loire
(43, 'Valence', 1), -- Auvergne-Rhône-Alpes
(44, 'Chambéry', 1), -- Auvergne-Rhône-Alpes
(45, 'Saint-Étienne', 1), -- Auvergne-Rhône-Alpes
(46, 'Le Havre', 9), -- Normandie
(47, 'Amiens', 7), -- Hauts-de-France
(48, 'Arras', 7), -- Hauts-de-France
(49, 'Calais', 7), -- Hauts-de-France
(50, 'Lens', 7), -- Hauts-de-France
(51, 'Beauvais', 7), -- Hauts-de-France
(52, 'Évreux', 9), -- Normandie
(53, 'Épinal', 8), -- Grand Est
(54, 'Colmar', 8), -- Grand Est
(55, 'Sarreguemines', 8), -- Grand Est
(56, 'Charleville-Mézières', 8), -- Grand Est
(57, 'Troyes', 8), -- Grand Est
(58, 'Châlons-en-Champagne', 8), -- Grand Est
(59, 'Laon', 8), -- Grand Est
(60, 'Saint-Quentin', 8), -- Grand Est
(61, 'Vesoul', 2), -- Bourgogne-Franche-Comté
(62, 'Auxerre', 2), -- Bourgogne-Franche-Comté
(63, 'Mâcon', 1), -- Auvergne-Rhône-Alpes
(64, 'Saint-Brieuc', 3), -- Bretagne
(65, 'Quimper', 3), -- Bretagne
(66, 'Morlaix', 3), -- Bretagne
(67, 'Vannes', 3), -- Bretagne
(68, 'Pontivy', 3), -- Bretagne
(69, 'Vitré', 3), -- Bretagne
(70, 'Dinard', 3), -- Bretagne
(71, 'Rennes', 3), -- Bretagne
(72, 'Saint-Malo', 3), -- Bretagne
(73, 'Quimperlé', 3), -- Bretagne
(74, 'Lannion', 3), -- Bretagne
(75, 'Côtes-d Armor', 3), -- Bretagne
(76, 'Quimper', 3), -- Bretagne
(77, 'Morlaix', 3), -- Bretagne
(78, 'Vannes', 3), -- Bretagne
(79, 'Pontivy', 3), -- Bretagne
(80, 'Vitré', 3), -- Bretagne
(81, 'Dinard', 3), -- Bretagne
(82, 'Rennes', 3), -- Bretagne
(83, 'Saint-Malo', 3), -- Bretagne
(84, 'Quimperlé', 3), -- Bretagne
(85, 'Lannion', 3), -- Bretagne
(86, 'Côtes-d''Armor', 3), -- Bretagne
(87, 'Le Puy-en-Velay', 1), -- Auvergne-Rhône-Alpes
(88, 'Moulins', 1), -- Auvergne-Rhône-Alpes
(89, 'Rodez', 14), -- Occitanie
(90, 'Cahors', 14), -- Occitanie
(91, 'Foix', 14), -- Occitanie
(92, 'Mende', 14), -- Occitanie
(93, 'Pamiers', 14), -- Occitanie
(94, 'Troyes', 8), -- Grand Est
(95, 'Châlons-en-Champagne', 8), -- Grand Est
(96, 'Laon', 8), -- Grand Est
(97, 'Saint-Quentin', 8), -- Grand Est
(98, 'Vesoul', 2), -- Bourgogne-Franche-Comté
(99, 'Auxerre', 2), -- Bourgogne-Franche-Comté
(100, 'Mâcon', 1); -- Auvergne-Rhône-Alpes



-- Insertion des adresses pour les campus CESI
INSERT INTO Adresse (ID_adresse, adresse, ID_ville) VALUES
(1, '1 Rue de la Paix', 1), -- Paris
(2, '10 Avenue de l Europe', 2), -- Toulouse
(3, '25 Rue de la Liberté', 3), -- Lyon
(4, '5 Boulevard des Étoiles', 4), -- Bordeaux
(5, '8 Rue du Progrès', 5), -- Nantes
(6, '12 Avenue des Roses', 6), -- Lille
(7, '17 Rue de la République', 7), -- Rennes
(8, '20 Rue de la Renaissance', 8), -- Strasbourg
(9, '15 Avenue des Palmiers', 9), -- Nice
(10, '30 Rue de la Mer', 10), -- Montpellier
(11, '9 Avenue du Soleil', 11), -- Aix-en-Provence
(12, '22 Boulevard du Printemps', 12), -- Angers
(13, '11 Rue de l Innovation', 13), -- Rouen
(14, '7 Avenue de la Science', 14), -- Grenoble
(15, '14 Boulevard du Sud', 15), -- Toulon
(16, '3 Rue du Savoir', 16), -- Tours
(17, '18 Rue de l Excellence', 17), -- Reims
(18, '23 Avenue de la Technologie', 18), -- Le Mans
(19, '6 Rue de l Ingénieur', 19), -- Poitiers
(20, '19 Rue de l Énergie', 20), -- Saint-Nazaire
(21, '4 Boulevard de la Mer', 21), -- Brest
(22, '21 Avenue de la Connaissance', 22), -- Caen
(23, '16 Rue de la Créativité', 23), -- Dijon
(24, '2 Avenue de l Innovation', 24), -- Orléans
(25, '13 Rue de la Réussite', 25), -- Mulhouse
(26, '7 Rue du Coeur', 26), -- Metz
(27, '14 Avenue de la Liberté', 27), -- Besançon
(28, '3 Boulevard de la Paix', 28), -- Limoges
(29, '5 Rue de la Joie', 29), -- Annecy
(30, '8 Boulevard de la Victoire', 30), -- Perpignan
(31, '12 Rue de l Amour', 31), -- Béziers
(32, '2 Avenue de la Plage', 32), -- Avignon
(33, '6 Boulevard du Bonheur', 33), -- Cannes
(34, '9 Rue de la Croisette', 34), -- Marseille
(35, '4 Avenue des Arènes', 35), -- Nîmes
(36, '11 Rue de la Nature', 36), -- Niort
(37, '15 Avenue du Sport', 37), -- Pau
(38, '18 Boulevard de la Mer', 38), -- Bayonne
(39, '23 Rue de la Culture', 39), -- Vannes
(40, '20 Avenue des Vents', 40), -- La Rochelle
(41, '21 Rue de la Plage', 41), -- La Roche-sur-Yon
(42, '8 Boulevard de la Forêt', 42), -- Cholet
(43, '10 Rue de la Montagne', 43), -- Valence
(44, '3 Avenue des Lacs', 44), -- Chambéry
(45, '9 Rue des Montagnes', 45), -- Saint-Étienne
(46, '2 Rue des Falaises', 46), -- Le Havre
(47, '5 Boulevard des Plages', 47), -- Amiens
(48, '8 Avenue du Phare', 48), -- Arras
(49, '11 Rue des Dunes', 49), -- Calais
(50, '14 Boulevard du Sable', 50), -- Lens
(51, '17 Avenue des Coquillages', 51), -- Beauvais
(52, '20 Rue de la Plage', 52), -- Évreux
(53, '3 Boulevard de la Mer', 53), -- Épinal
(54, '6 Avenue des Montagnes', 54), -- Colmar
(55, '9 Rue des Fleurs', 55), -- Sarreguemines
(56, '12 Avenue des Champs', 56), -- Charleville-Mézières
(57, '15 Boulevard de la Vigne', 57), -- Troyes
(58, '18 Rue des Vignes', 58), -- Châlons-en-Champagne
(59, '21 Avenue du Vin', 59), -- Laon
(60, '24 Rue des Vins', 60), -- Saint-Quentin
(61, '4 Rue du Vin', 61), -- Vesoul
(62, '7 Rue des Vignobles', 62), -- Auxerre
(63, '10 Avenue du Vin', 63), -- Mâcon
(64, '5 Rue de la Paix', 1), -- Paris
(65, '10 Avenue de l Europe', 2), -- Toulouse
(66, '25 Rue de la Liberté', 3), -- Lyon
(67, '5 Boulevard des Étoiles', 4), -- Bordeaux
(68, '8 Rue du Progrès', 5), -- Nantes
(69, '12 Avenue des Roses', 6), -- Lille
(70, '17 Rue de la République', 7), -- Rennes
(71, '20 Rue de la Renaissance', 8), -- Strasbourg
(72, '15 Avenue des Palmiers', 9), -- Nice
(73, '30 Rue de la Mer', 10), -- Montpellier
(74, '9 Avenue du Soleil', 11), -- Aix-en-Provence
(75, '22 Boulevard du Printemps', 12), -- Angers
(76, '11 Rue de l Innovation', 13), -- Rouen
(77, '7 Avenue de la Science', 14), -- Grenoble
(78, '14 Boulevard du Sud', 15), -- Toulon
(79, '3 Rue du Savoir', 16), -- Tours
(80, '18 Rue de l Excellence', 17), -- Reims
(81, '23 Avenue de la Technologie', 18), -- Le Mans
(82, '6 Rue de l Ingénieur', 19), -- Poitiers
(83, '19 Rue de l Énergie', 20), -- Saint-Nazaire
(84, '4 Boulevard de la Mer', 21), -- Brest
(85, '21 Avenue de la Connaissance', 22), -- Caen
(86, '16 Rue de la Créativité', 23), -- Dijon
(87, '2 Avenue de l Innovation', 24), -- Orléans
(88, '13 Rue de la Réussite', 25), -- Mulhouse
(89, '7 Rue du Coeur', 26), -- Metz
(90, '14 Avenue de la Liberté', 27), -- Besançon
(91, '3 Boulevard de la Paix', 28), -- Limoges
(92, '5 Rue de la Joie', 29), -- Annecy
(93, '8 Boulevard de la Victoire', 30), -- Perpignan
(94, '12 Rue de l''Amour', 31), -- Béziers
(95, '2 Avenue de la Plage', 32), -- Avignon
(96, '6 Boulevard du Bonheur', 33), -- Cannes
(97, '9 Rue de la Croisette', 34), -- Marseille
(98, '4 Avenue des Arènes', 35), -- Nîmes
(99, '11 Rue de la Nature', 36), -- Niort
(100, '15 Avenue du Sport', 37); -- Pau





insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (4, '19/11/2024', 1163.63, '19/05/2025', 7, '19/10/2024', 822, 85, 12);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (5, '30/01/2025', 440.09, '30/03/2025', 8, '30/08/2024', 784, 53, 4);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (6, '15/08/2024', 958.78, '15/10/2025', 6, '15/06/2024', 922, 76, 29);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (7, '22/05/2024', 524.25, '22/07/2025', 1, '22/03/2024', 517, 11, 14);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (8, '26/09/2024', 354.55, '26/08/2025', 8, '26/01/2024', 637, 97, 49);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (9, '13/05/2024', 1191.37, '13/03/2025', 1, '13/12/2023', 512, 67, 45);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (10, '02/10/2024', 611.77, '02/08/2025', 10, '02/05/2024', 814, 2, 1);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (11, '26/04/2024', 839.64, '26/07/2024', 1, '26/01/2024', 442, 23, 20);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (12, '18/10/2024', 1019.63, '18/07/2025', 8, '18/05/2024', 450, 49, 14);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (13, '25/12/2024', 976.66, '25/07/2025', 7, '25/09/2024', 45, 33, 19);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (14, '06/01/2025', 541.18, '06/03/2025', 4, '06/10/2024', 903, 71, 12);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (15, '04/03/2025', 1078.4, '04/04/2025', 7, '04/12/2023', 586, 64, 7);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (16, '29/12/2024', 662.32, '29/01/2025', 5, '29/09/2024', 164, 9, 39);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (17, '30/08/2024', 715.28, '30/10/2024', 8, '30/05/2024', 552, 26, 14);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (18, '20/04/2024', 438.5, '20/10/2024', 3, '20/01/2024', 477, 30, 36);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (19, '23/02/2025', 1118.63, '23/07/2025', 1, '23/11/2024', 111, 39, 10);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (20, '22/12/2024', 999.12, '22/12/2024', 1, '22/09/2024', 348, 7, 36);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (21, '24/11/2024', 315.9, '24/04/2025', 1, '24/08/2024', 339, 35, 20);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (22, '02/05/2024', 586.56, '02/11/2024', 1, '02/02/2024', 201, 45, 1);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (23, '01/01/2025', 976.36, '01/01/2025', 10, '01/09/2024', 214, 78, 15);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (24, '28/01/2025', 656.45, '28/10/2024', 1, '28/01/2025', 193, 16, 23);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (25, '05/02/2025', 987.67, '05/02/2025', 5, '05/11/2024', 359, 81, 7);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (26, '06/10/2024', 756.96, '06/03/2025', 10, '06/02/2024', 913, 87, 27);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (27, '01/08/2024', 982.24, '01/11/2024', 7, '01/04/2024', 719, 59, 50);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (28, '05/01/2025', 874.72, '05/01/2025', 5, '05/09/2024', 659, 55, 20);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (29, '19/09/2024', 749.07, '19/02/2025', 2, '19/06/2024', 634, 14, 27);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (30, '22/03/2024', 384.0, '22/08/2024', 6, '22/05/2023', 93, 74, 19);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (31, '13/12/2024', 685.9, '13/09/2024', 3, '13/08/2023', 416, 89, 14);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (32, '14/10/2024', 359.77, '14/02/2025', 6, '14/06/2024', 732, 68, 22);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (33, '16/02/2025', 346.93, '16/04/2025', 1, '16/10/2024', 170, 38, 17);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (34, '31/08/2024', 1128.85, '31/05/2025', 6, '31/07/2024', 184, 46, 27);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (35, '16/11/2024', 628.01, '16/11/2024', 7, '16/06/2024', 88, 15, 45);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (36, '14/05/2024', 867.75, '14/07/2025', 2, '14/03/2024', 20, 62, 34);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (37, '05/06/2024', 372.44, '05/10/2025', 5, '05/02/2024', 404, 73, 39);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (38, '23/06/2024', 782.68, '23/02/2025', 10, '23/03/2024', 667, 96, 50);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (39, '30/04/2024', 354.44, '30/07/2024', 8, '30/01/2024', 232, 3, 2);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (40, '09/03/2024', 719.25, '09/09/2024', 10, '09/12/2023', 281, 77, 33);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (41, '10/05/2024', 623.9, '10/08/2024', 2, '10/02/2024', 485, 18, 36);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (42, '29/11/2024', 927.84, '29/05/2025', 6, '29/08/2024', 78, 43, 9);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (43, '20/02/2025', 1159.85, '20/08/2025', 5, '20/11/2024', 620, 84, 3);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (44, '02/05/2024', 853.6, '02/08/2024', 1, '02/02/2024', 261, 29, 13);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (45, '25/10/2024', 645.77, '25/12/2025', 1, '25/02/2024', 330, 70, 36);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (46, '16/08/2024', 1098.92, '16/04/2025', 9, '16/06/2024', 444, 91, 20);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (47, '19/12/2024', 479.18, '19/04/2025', 2, '19/09/2024', 33, 42, 19);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (48, '09/07/2024', 537.82, '09/10/2025', 3, '09/05/2024', 93, 83, 46);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (49, '12/08/2024', 964.13, '12/05/2025', 10, '12/01/2024', 297, 25, 3);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (50, '07/10/2024', 710.29, '07/10/2025', 2, '07/07/2024', 490, 67, 28);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (51, '18/08/2024', 1150.68, '18/12/2024', 10, '18/01/2024', 88, 66, 36);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (52, '24/11/2024', 872.07, '24/05/2025', 4, '24/09/2024', 177, 95, 15);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (53, '26/02/2025', 673.59, '26/05/2024', 5, '26/11/2024', 735, 22, 29);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (54, '28/03/2024', 1154.84, '28/03/2025', 6, '28/12/2023', 494, 60, 16);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (55, '15/02/2025', 946.08, '15/09/2024', 8, '15/05/2024', 681, 34, 4);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (56, '25/04/2024', 629.4, '25/05/2025', 3, '25/12/2023', 207, 85, 11);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (57, '19/03/2025', 891.16, '19/01/2025', 5, '19/01/2025', 239, 98, 32);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (58, '13/06/2024', 1087.05, '13/06/2024', 1, '13/06/2024', 641, 36, 28);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (59, '09/08/2024', 491.96, '09/08/2025', 10, '09/08/2024', 478, 14, 40);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like, ID_adresse, ID_entreprise) values (60, '27/01/2025', 1065.56, '27/03/2025', 5, '27/01/2024', 27, 49, 45);


insert into requiere (ID_requiere, ID_offre, ID_competence) values (1, 29, 18);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (2, 10, 8);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (3, 18, 18);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (4, 7, 50);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (5, 14, 39);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (6, 23, 49);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (7, 6, 44);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (8, 13, 20);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (9, 28, 39);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (10, 6, 9);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (11, 18, 51);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (12, 4, 35);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (13, 4, 7);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (14, 7, 40);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (15, 20, 58);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (16, 2, 25);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (17, 19, 34);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (18, 27, 52);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (19, 25, 30);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (20, 14, 2);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (21, 6, 25);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (22, 7, 58);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (23, 27, 47);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (24, 18, 34);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (25, 2, 46);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (26, 8, 11);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (27, 18, 47);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (28, 23, 57);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (29, 19, 39);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (30, 18, 3);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (31, 30, 2);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (32, 24, 4);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (33, 2, 58);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (34, 16, 23);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (35, 14, 11);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (36, 9, 30);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (37, 2, 28);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (38, 11, 49);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (39, 3, 35);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (40, 12, 11);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (41, 11, 35);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (42, 29, 15);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (43, 13, 26);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (44, 6, 53);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (45, 7, 40);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (46, 27, 59);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (47, 27, 15);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (48, 19, 22);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (49, 23, 11);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (50, 11, 29);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (51, 2, 45);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (52, 17, 2);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (53, 15, 56);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (54, 7, 54);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (55, 28, 58);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (56, 22, 43);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (57, 17, 48);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (58, 7, 56);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (59, 26, 26);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (60, 14, 38);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (61, 26, 29);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (62, 8, 57);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (63, 7, 15);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (64, 2, 49);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (65, 7, 29);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (66, 14, 59);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (67, 11, 55);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (68, 17, 14);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (69, 19, 12);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (70, 28, 53);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (71, 23, 17);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (72, 9, 53);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (73, 9, 37);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (74, 26, 49);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (75, 15, 16);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (76, 13, 44);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (77, 4, 58);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (78, 2, 17);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (79, 22, 27);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (80, 27, 7);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (81, 16, 32);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (82, 21, 49);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (83, 22, 47);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (84, 8, 24);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (85, 22, 18);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (86, 29, 39);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (87, 27, 58);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (88, 22, 22);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (89, 9, 9);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (90, 4, 15);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (91, 1, 25);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (92, 11, 8);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (93, 14, 18);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (94, 2, 38);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (95, 20, 11);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (96, 23, 47);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (97, 28, 43);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (98, 11, 25);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (99, 17, 42);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (100, 19, 35);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (101, 19, 52);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (102, 17, 10);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (103, 25, 42);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (104, 9, 38);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (105, 28, 12);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (106, 22, 18);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (107, 3, 43);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (108, 29, 16);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (109, 10, 6);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (110, 16, 31);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (111, 9, 25);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (112, 17, 34);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (113, 21, 34);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (114, 9, 39);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (115, 23, 49);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (116, 28, 25);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (117, 23, 22);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (118, 11, 21);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (119, 26, 33);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (120, 25, 34);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (121, 25, 1);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (122, 30, 12);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (123, 13, 36);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (124, 14, 15);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (125, 28, 2);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (126, 15, 46);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (127, 4, 46);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (128, 17, 1);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (129, 8, 27);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (130, 28, 34);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (131, 5, 40);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (132, 13, 53);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (133, 16, 31);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (134, 20, 55);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (135, 26, 24);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (136, 24, 3);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (137, 1, 4);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (138, 12, 23);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (139, 8, 51);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (140, 10, 53);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (141, 16, 3);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (142, 21, 10);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (143, 28, 1);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (144, 12, 5);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (145, 10, 16);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (146, 23, 50);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (147, 13, 5);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (148, 1, 15);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (149, 14, 3);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (150, 16, 17);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (151, 8, 48);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (152, 24, 43);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (153, 28, 19);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (154, 4, 3);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (155, 24, 21);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (156, 10, 17);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (157, 28, 17);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (158, 26, 7);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (159, 10, 27);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (160, 12, 20);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (161, 9, 37);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (162, 25, 24);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (163, 11, 19);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (164, 24, 6);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (165, 21, 32);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (166, 7, 13);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (167, 3, 27);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (168, 22, 12);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (169, 5, 49);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (170, 21, 44);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (171, 16, 7);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (172, 27, 51);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (173, 3, 41);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (174, 10, 23);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (175, 26, 54);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (176, 12, 3);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (177, 27, 13);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (178, 16, 3);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (179, 2, 15);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (180, 19, 22);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (181, 26, 28);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (182, 1, 50);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (183, 14, 54);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (184, 30, 48);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (185, 9, 34);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (186, 28, 12);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (187, 7, 16);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (188, 9, 47);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (189, 3, 13);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (190, 1, 58);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (191, 21, 48);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (192, 24, 12);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (193, 2, 55);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (194, 25, 26);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (195, 19, 35);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (196, 24, 8);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (197, 1, 60);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (198, 8, 23);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (199, 20, 47);
insert into requiere (ID_requiere, ID_offre, ID_competence) values (200, 20, 37);

insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (1, "Votre entreprise est reconnue pour son excellence et son innovation, ce qui m'inspire à contribuer à votre équipe. Mon engagement envers l'apprentissage continu et ma passion pour relever de nouveaux défis me permettront de m'intégrer harmonieusement à votre environnement de travail. Je suis convaincu que mes compétences en résolution de problèmes et mon attitude proactive seront des atouts précieux pour atteindre vos objectifs.", 40, 49);
insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (2, "Je suis enthousiaste à l'idée de rejoindre votre entreprise innovante et dynamique. Ma formation solide et mon expérience pratique m'ont préparé à contribuer de manière significative à votre équipe. Je suis convaincu que mon éthique de travail rigoureuse et ma capacité à m'adapter rapidement seront des atouts précieux pour réaliser vos objectifs. Je suis impatient de saisir cette opportunité passionnante.", 28, 47);
insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (3, "Je suis intéressé par l'opportunité de rejoindre votre entreprise réputée pour son engagement envers l'excellence et l'innovation. Ma passion pour l'industrie et mon désir de contribuer au progrès technologique me motivent à postuler pour ce poste. Je suis convaincu que mes compétences techniques et mon esprit d'équipe seront des atouts précieux pour votre équipe. Je suis impatient de pouvoir apporter ma contribution à vos projets passionnants.", 35, 10);
insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (4, "Je suis fasciné par votre entreprise et son engagement envers l'innovation et l'excellence. Ma formation académique solide et mon expérience pratique me fournissent les compétences nécessaires pour contribuer de manière significative à votre équipe. Je suis convaincu que mon enthousiasme et ma capacité à travailler sous pression seront des atouts précieux pour atteindre vos objectifs. Je suis impatient de pouvoir mettre mes compétences au service de votre entreprise.", 4, 47);
insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (5, "Je suis passionné par l'opportunité de rejoindre votre entreprise réputée pour son excellence et son innovation. Mon engagement envers l'apprentissage continu et ma volonté de relever de nouveaux défis me permettront de contribuer de manière significative à votre équipe. Je suis convaincu que ma créativité et ma capacité à travailler en équipe seront des atouts précieux pour réaliser vos objectifs. Je suis enthousiaste à l'idée de saisir cette opportunité.", 34, 28);
insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (6, "Je suis motivé à rejoindre votre entreprise innovante et dynamique en raison de son engagement envers l'excellence et l'innovation. Ma passion pour l'industrie et mon désir de contribuer au progrès technologique me motivent à postuler pour ce poste. Je suis convaincu que mes compétences techniques et mon esprit d'équipe seront des atouts précieux pour votre équipe. Je suis impatient de pouvoir apporter ma contribution à vos projets passionnants.", 29, 56);
insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (7, "Votre entreprise est réputée pour son leadership dans le secteur et son engagement envers l'excellence. Ma passion pour l'innovation et mon désir de contribuer au succès de votre entreprise me motivent à postuler pour ce poste. Je suis convaincu que mon expérience et mes compétences seront des atouts précieux pour votre équipe. Je suis enthousiaste à l'idée de saisir cette opportunité et de contribuer à vos projets.", 37, 45);
insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (8, "Je suis enthousiaste à l'idée de rejoindre votre entreprise réputée pour son excellence et son innovation. Mon expérience et mes compétences me permettront de contribuer de manière significative à votre équipe. Je suis convaincu que mon attitude positive et ma capacité à travailler sous pression seront des atouts précieux pour atteindre vos objectifs. Je suis impatient de pouvoir apporter ma contribution à votre entreprise.", 1, 13);
insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (9, "Je suis intéressé par l'opportunité de rejoindre votre entreprise réputée pour son leadership dans le secteur. Mon engagement envers l'apprentissage continu et ma volonté de relever de nouveaux défis me permettront de contribuer de manière significative à votre équipe. Je suis convaincu que mon expérience diversifiée et ma capacité à travailler en équipe seront des atouts précieux pour votre entreprise. Je suis impatient de saisir cette opportunité passionnante.", 33, 19);
insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (10, "Je suis fasciné par votre entreprise et son engagement envers l'excellence et l'innovation. Ma passion pour l'industrie et mon désir de contribuer au progrès technologique me motivent à postuler pour ce poste. Je suis convaincu que mes compétences techniques et mon esprit d'équipe seront des atouts précieux pour votre équipe. Je suis impatient de pouvoir apporter ma contribution à vos projets passionnants.", 38, 43);
insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (11, "Je suis enthousiaste à l'idée de rejoindre votre entreprise réputée pour son excellence et son innovation. Mon expérience et ma passion pour l'industrie me permettront de contribuer de manière significative à votre équipe. Je suis convaincu que mon éthique de travail solide et ma capacité à travailler sous pression seront des atouts précieux pour atteindre vos objectifs. Je suis impatient de pouvoir apporter ma contribution à votre entreprise.", 19, 3);
insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (12, "Votre entreprise est reconnue pour son excellence et son innovation, ce qui m'inspire à contribuer à votre équipe. Mon engagement envers l'apprentissage continu et ma passion pour relever de nouveaux défis me permettront de m'intégrer harmonieusement à votre environnement de travail. Je suis convaincu que mes compétences en résolution de problèmes et mon attitude proactive seront des atouts précieux pour atteindre vos objectifs.", 24, 24);
insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (13, "Je suis motivé à rejoindre votre entreprise innovante et dynamique en raison de son engagement envers l'excellence et l'innovation. Ma passion pour l'industrie et mon désir de contribuer au progrès technologique me motivent à postuler pour ce poste. Je suis convaincu que mes compétences techniques et mon esprit d'équipe seront des atouts précieux pour votre équipe. Je suis impatient de pouvoir apporter ma contribution à vos projets passionnants.", 21, 26);
insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (14, "Je suis passionné par l'opportunité de rejoindre votre entreprise réputée pour son excellence et son innovation. Mon engagement envers l'apprentissage continu et ma volonté de relever de nouveaux défis me permettront de contribuer de manière significative à votre équipe. Je suis convaincu que ma créativité et ma capacité à travailler en équipe seront des atouts précieux pour réaliser vos objectifs. Je suis enthousiaste à l'idée de saisir cette opportunité.", 39, 38);
insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (15, "Je suis motivé à rejoindre votre entreprise innovante et dynamique en raison de son engagement envers l'excellence et l'innovation. Ma passion pour l'industrie et mon désir de contribuer au progrès technologique me motivent à postuler pour ce poste. Je suis convaincu que mes compétences techniques et mon esprit d'équipe seront des atouts précieux pour votre équipe. Je suis impatient de pouvoir apporter ma contribution à vos projets passionnants.", 45, 32);
insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (16, "Je suis fasciné par votre entreprise et son engagement envers l'excellence et l'innovation. Ma passion pour l'industrie et mon désir de contribuer au progrès technologique me motivent à postuler pour ce poste. Je suis convaincu que mes compétences techniques et mon esprit d'équipe seront des atouts précieux pour votre équipe. Je suis impatient de pouvoir apporter ma contribution à vos projets passionnants.", 26, 28);
insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (17, "Je suis enthousiaste à l'idée de rejoindre votre entreprise réputée pour son excellence et son innovation. Mon expérience et ma passion pour l'industrie me permettront de contribuer de manière significative à votre équipe. Je suis convaincu que mon éthique de travail solide et ma capacité à travailler sous pression seront des atouts précieux pour atteindre vos objectifs. Je suis impatient de pouvoir apporter ma contribution à votre entreprise.", 4, 60);
insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (18, "Votre entreprise est reconnue pour son excellence et son innovation, ce qui m'inspire à contribuer à votre équipe. Mon engagement envers l'apprentissage continu et ma passion pour relever de nouveaux défis me permettront de m'intégrer harmonieusement à votre environnement de travail. Je suis convaincu que mes compétences en résolution de problèmes et mon attitude proactive seront des atouts précieux pour atteindre vos objectifs.", 39, 44);
insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (19, "Je suis motivé à rejoindre votre entreprise innovante et dynamique en raison de son engagement envers l'excellence et l'innovation. Ma passion pour l'industrie et mon désir de contribuer au progrès technologique me motivent à postuler pour ce poste. Je suis convaincu que mes compétences techniques et mon esprit d'équipe seront des atouts précieux pour votre équipe. Je suis impatient de pouvoir apporter ma contribution à vos projets passionnants.", 44, 39);
insert into Candidature (ID_candidature, lettre_motivation, ID_etudiant, ID_offre) values (20, "Je suis passionné par l'opportunité de rejoindre votre entreprise réputée pour son excellence et son innovation. Mon engagement envers l'apprentissage continu et ma volonté de relever de nouveaux défis me permettront de contribuer de manière significative à votre équipe. Je suis convaincu que ma créativité et ma capacité à travailler en équipe seront des atouts précieux pour réaliser vos objectifs. Je suis enthousiaste à l'idée de saisir cette opportunité.", 4, 40);


insert into cherche (ID_cherche, ID_offre, ID_promo) values (1, 45, 3);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (2, 32, 4);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (3, 3, 5);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (4, 40, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (5, 58, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (6, 36, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (7, 34, 5);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (8, 57, 5);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (9, 30, 5);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (10, 26, 5);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (11, 53, 4);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (12, 23, 4);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (13, 1, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (14, 11, 4);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (15, 56, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (16, 25, 3);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (17, 4, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (18, 30, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (19, 26, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (20, 12, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (21, 3, 3);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (22, 39, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (23, 53, 5);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (24, 30, 3);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (25, 54, 3);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (26, 47, 4);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (27, 29, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (28, 18, 3);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (29, 24, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (30, 41, 3);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (31, 32, 4);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (32, 11, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (33, 1, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (34, 8, 4);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (35, 32, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (36, 29, 3);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (37, 58, 5);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (38, 47, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (39, 29, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (40, 23, 5);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (41, 24, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (42, 36, 3);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (43, 4, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (44, 34, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (45, 54, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (46, 14, 4);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (47, 26, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (48, 13, 5);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (49, 29, 5);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (50, 46, 3);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (51, 47, 5);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (52, 26, 5);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (53, 45, 3);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (54, 48, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (55, 34, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (56, 9, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (57, 34, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (58, 28, 3);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (59, 15, 3);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (60, 4, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (61, 40, 4);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (62, 50, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (63, 28, 4);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (64, 11, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (65, 46, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (66, 40, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (67, 15, 3);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (68, 34, 3);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (69, 20, 5);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (70, 5, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (71, 51, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (72, 44, 3);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (73, 58, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (74, 3, 3);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (75, 6, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (76, 51, 4);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (77, 59, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (78, 50, 5);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (79, 15, 3);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (80, 51, 4);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (81, 53, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (82, 29, 5);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (83, 41, 4);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (84, 50, 5);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (85, 16, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (86, 20, 5);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (87, 40, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (88, 49, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (89, 41, 4);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (90, 10, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (91, 40, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (92, 48, 5);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (93, 47, 3);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (94, 37, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (95, 34, 2);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (96, 43, 4);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (97, 34, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (98, 28, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (99, 35, 1);
insert into cherche (ID_cherche, ID_offre, ID_promo) values (100, 6, 1);

insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (1, 38, 7);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (2, 28, 10);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (3, 1, 40);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (4, 11, 4);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (5, 28, 32);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (6, 46, 43);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (7, 17, 8);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (8, 29, 25);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (9, 28, 6);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (10, 37, 43);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (11, 22, 33);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (12, 60, 3);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (13, 52, 19);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (14, 11, 29);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (15, 32, 8);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (16, 17, 36);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (17, 57, 42);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (18, 3, 25);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (19, 16, 22);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (20, 21, 9);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (21, 15, 13);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (22, 10, 26);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (23, 56, 25);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (24, 5, 27);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (25, 32, 26);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (26, 12, 12);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (27, 48, 20);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (28, 42, 6);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (29, 52, 13);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (30, 47, 13);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (31, 3, 1);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (32, 53, 11);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (33, 39, 19);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (34, 39, 15);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (35, 10, 10);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (36, 33, 3);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (37, 16, 28);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (38, 49, 35);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (39, 20, 6);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (40, 44, 7);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (41, 32, 19);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (42, 29, 31);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (43, 55, 41);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (44, 40, 14);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (45, 41, 15);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (46, 54, 13);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (47, 33, 39);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (48, 29, 10);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (49, 2, 11);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (50, 29, 24);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (51, 31, 20);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (52, 21, 28);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (53, 39, 12);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (54, 41, 1);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (55, 56, 22);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (56, 5, 21);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (57, 23, 11);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (58, 21, 25);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (59, 23, 9);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (60, 45, 28);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (61, 20, 9);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (62, 30, 29);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (63, 47, 27);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (64, 56, 23);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (65, 2, 39);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (66, 30, 4);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (67, 34, 36);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (68, 48, 1);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (69, 45, 26);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (70, 50, 9);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (71, 51, 18);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (72, 31, 8);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (73, 16, 28);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (74, 58, 15);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (75, 54, 41);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (76, 35, 5);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (77, 49, 15);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (78, 3, 14);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (79, 42, 20);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (80, 12, 6);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (81, 59, 8);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (82, 44, 8);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (83, 40, 38);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (84, 21, 7);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (85, 21, 36);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (86, 36, 2);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (87, 58, 28);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (88, 54, 1);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (89, 6, 41);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (90, 57, 45);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (91, 52, 22);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (92, 24, 3);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (93, 19, 1);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (94, 20, 19);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (95, 24, 20);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (96, 56, 35);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (97, 58, 22);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (98, 27, 45);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (99, 37, 42);
insert into stocke (ID_stocke, ID_offre, ID_wish_list) values (100, 10, 33);


insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (1, 7, 1);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (2, 45, 2);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (3, 37, 3);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (4, 33, 4);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (5, 47, 5);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (6, 19, 6);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (7, 9, 7);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (8, 11, 8);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (9, 37, 9);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (10, 40, 10);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (11, 8, 11);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (12, 34, 12);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (13, 21, 13);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (14, 2, 14);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (15, 19, 15);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (16, 16, 16);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (17, 12, 17);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (18, 37, 18);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (19, 47, 19);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (20, 44, 20);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (21, 12, 21);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (22, 42, 22);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (23, 24, 23);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (24, 46, 24);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (25, 44, 25);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (26, 47, 26);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (27, 25, 27);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (28, 46, 28);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (29, 16, 29);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (30, 17, 30);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (31, 44, 31);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (32, 4, 32);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (33, 48, 33);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (34, 44, 34);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (35, 14, 35);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (36, 28, 36);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (37, 15, 37);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (38, 45, 38);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (39, 3, 39);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (40, 29, 40);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (41, 17, 41);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (42, 26, 42);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (43, 32, 43);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (44, 44, 44);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (45, 50, 45);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (46, 10, 46);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (47, 34, 47);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (48, 21, 48);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (49, 31, 49);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (50, 6, 50);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (51, 18, 51);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (52, 17, 52);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (53, 15, 53);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (54, 1, 54);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (55, 2, 55);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (56, 17, 56);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (57, 5, 57);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (58, 22, 58);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (59, 42, 59);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (60, 6, 60);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (61, 47, 61);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (62, 37, 62);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (63, 1, 63);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (64, 34, 64);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (65, 17, 65);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (66, 50, 66);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (67, 3, 67);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (68, 19, 68);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (69, 45, 69);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (70, 40, 70);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (71, 50, 71);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (72, 37, 72);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (73, 47, 73);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (74, 38, 74);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (75, 30, 75);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (76, 3, 76);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (77, 11, 77);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (78, 31, 78);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (79, 5, 79);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (80, 42, 80);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (81, 38, 81);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (82, 2, 82);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (83, 23, 83);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (84, 41, 84);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (85, 33, 85);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (86, 23, 86);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (87, 46, 87);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (88, 46, 88);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (89, 13, 89);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (90, 24, 90);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (91, 34, 91);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (92, 31, 92);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (93, 38, 93);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (94, 36, 94);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (95, 34, 95);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (96, 1, 96);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (97, 2, 97);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (98, 41, 98);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (99, 48, 99);
insert into se_situe (ID_se_situe, ID_entreprise, ID_adresse) values (100, 21, 100);


insert into contient (ID_contient, ID_promo, ID_centre) values (1, 3, 21);
insert into contient (ID_contient, ID_promo, ID_centre) values (2, 2, 8);
insert into contient (ID_contient, ID_promo, ID_centre) values (3, 1, 3);
insert into contient (ID_contient, ID_promo, ID_centre) values (4, 1, 6);
insert into contient (ID_contient, ID_promo, ID_centre) values (5, 5, 17);
insert into contient (ID_contient, ID_promo, ID_centre) values (6, 2, 12);
insert into contient (ID_contient, ID_promo, ID_centre) values (7, 4, 9);
insert into contient (ID_contient, ID_promo, ID_centre) values (8, 5, 5);
insert into contient (ID_contient, ID_promo, ID_centre) values (9, 2, 1);
insert into contient (ID_contient, ID_promo, ID_centre) values (10, 1, 15);
insert into contient (ID_contient, ID_promo, ID_centre) values (11, 5, 21);
insert into contient (ID_contient, ID_promo, ID_centre) values (12, 4, 25);
insert into contient (ID_contient, ID_promo, ID_centre) values (13, 5, 8);
insert into contient (ID_contient, ID_promo, ID_centre) values (14, 5, 5);
insert into contient (ID_contient, ID_promo, ID_centre) values (15, 3, 21);
insert into contient (ID_contient, ID_promo, ID_centre) values (16, 4, 20);
insert into contient (ID_contient, ID_promo, ID_centre) values (17, 1, 22);
insert into contient (ID_contient, ID_promo, ID_centre) values (18, 4, 17);
insert into contient (ID_contient, ID_promo, ID_centre) values (19, 3, 17);
insert into contient (ID_contient, ID_promo, ID_centre) values (20, 3, 10);
insert into contient (ID_contient, ID_promo, ID_centre) values (21, 4, 3);
insert into contient (ID_contient, ID_promo, ID_centre) values (22, 2, 9);
insert into contient (ID_contient, ID_promo, ID_centre) values (23, 5, 7);
insert into contient (ID_contient, ID_promo, ID_centre) values (24, 2, 25);
insert into contient (ID_contient, ID_promo, ID_centre) values (25, 2, 16);
insert into contient (ID_contient, ID_promo, ID_centre) values (26, 5, 13);
insert into contient (ID_contient, ID_promo, ID_centre) values (27, 1, 16);
insert into contient (ID_contient, ID_promo, ID_centre) values (28, 4, 19);
insert into contient (ID_contient, ID_promo, ID_centre) values (29, 2, 24);
insert into contient (ID_contient, ID_promo, ID_centre) values (30, 4, 14);
insert into contient (ID_contient, ID_promo, ID_centre) values (31, 5, 16);
insert into contient (ID_contient, ID_promo, ID_centre) values (32, 1, 12);
insert into contient (ID_contient, ID_promo, ID_centre) values (33, 5, 9);
insert into contient (ID_contient, ID_promo, ID_centre) values (34, 2, 12);
insert into contient (ID_contient, ID_promo, ID_centre) values (35, 2, 6);
insert into contient (ID_contient, ID_promo, ID_centre) values (36, 4, 12);
insert into contient (ID_contient, ID_promo, ID_centre) values (37, 3, 18);
insert into contient (ID_contient, ID_promo, ID_centre) values (38, 1, 8);
insert into contient (ID_contient, ID_promo, ID_centre) values (39, 1, 7);
insert into contient (ID_contient, ID_promo, ID_centre) values (40, 2, 11);
insert into contient (ID_contient, ID_promo, ID_centre) values (41, 4, 1);
insert into contient (ID_contient, ID_promo, ID_centre) values (42, 3, 16);
insert into contient (ID_contient, ID_promo, ID_centre) values (43, 2, 14);
insert into contient (ID_contient, ID_promo, ID_centre) values (44, 1, 3);
insert into contient (ID_contient, ID_promo, ID_centre) values (45, 4, 3);
insert into contient (ID_contient, ID_promo, ID_centre) values (46, 3, 18);
insert into contient (ID_contient, ID_promo, ID_centre) values (47, 4, 18);
insert into contient (ID_contient, ID_promo, ID_centre) values (48, 4, 1);
insert into contient (ID_contient, ID_promo, ID_centre) values (49, 2, 4);
insert into contient (ID_contient, ID_promo, ID_centre) values (50, 2, 8);
insert into contient (ID_contient, ID_promo, ID_centre) values (51, 4, 8);
insert into contient (ID_contient, ID_promo, ID_centre) values (52, 3, 4);
insert into contient (ID_contient, ID_promo, ID_centre) values (53, 1, 7);
insert into contient (ID_contient, ID_promo, ID_centre) values (54, 5, 16);
insert into contient (ID_contient, ID_promo, ID_centre) values (55, 1, 1);
insert into contient (ID_contient, ID_promo, ID_centre) values (56, 3, 25);
insert into contient (ID_contient, ID_promo, ID_centre) values (57, 4, 19);
insert into contient (ID_contient, ID_promo, ID_centre) values (58, 1, 9);
insert into contient (ID_contient, ID_promo, ID_centre) values (59, 1, 3);
insert into contient (ID_contient, ID_promo, ID_centre) values (60, 5, 3);
insert into contient (ID_contient, ID_promo, ID_centre) values (61, 1, 22);
insert into contient (ID_contient, ID_promo, ID_centre) values (62, 1, 21);
insert into contient (ID_contient, ID_promo, ID_centre) values (63, 1, 9);
insert into contient (ID_contient, ID_promo, ID_centre) values (64, 5, 24);
insert into contient (ID_contient, ID_promo, ID_centre) values (65, 5, 14);
insert into contient (ID_contient, ID_promo, ID_centre) values (66, 4, 4);
insert into contient (ID_contient, ID_promo, ID_centre) values (67, 5, 11);
insert into contient (ID_contient, ID_promo, ID_centre) values (68, 4, 11);
insert into contient (ID_contient, ID_promo, ID_centre) values (69, 5, 6);
insert into contient (ID_contient, ID_promo, ID_centre) values (70, 5, 25);
insert into contient (ID_contient, ID_promo, ID_centre) values (71, 1, 7);
insert into contient (ID_contient, ID_promo, ID_centre) values (72, 4, 3);
insert into contient (ID_contient, ID_promo, ID_centre) values (73, 3, 11);
insert into contient (ID_contient, ID_promo, ID_centre) values (74, 5, 23);
insert into contient (ID_contient, ID_promo, ID_centre) values (75, 2, 23);
insert into contient (ID_contient, ID_promo, ID_centre) values (76, 5, 18);
insert into contient (ID_contient, ID_promo, ID_centre) values (77, 1, 18);
insert into contient (ID_contient, ID_promo, ID_centre) values (78, 3, 17);
insert into contient (ID_contient, ID_promo, ID_centre) values (79, 4, 15);
insert into contient (ID_contient, ID_promo, ID_centre) values (80, 1, 7);
insert into contient (ID_contient, ID_promo, ID_centre) values (81, 4, 19);
insert into contient (ID_contient, ID_promo, ID_centre) values (82, 5, 1);
insert into contient (ID_contient, ID_promo, ID_centre) values (83, 2, 9);
insert into contient (ID_contient, ID_promo, ID_centre) values (84, 5, 17);
insert into contient (ID_contient, ID_promo, ID_centre) values (85, 4, 24);
insert into contient (ID_contient, ID_promo, ID_centre) values (86, 2, 5);
insert into contient (ID_contient, ID_promo, ID_centre) values (87, 1, 23);
insert into contient (ID_contient, ID_promo, ID_centre) values (88, 2, 8);
insert into contient (ID_contient, ID_promo, ID_centre) values (89, 3, 1);
insert into contient (ID_contient, ID_promo, ID_centre) values (90, 4, 13);
insert into contient (ID_contient, ID_promo, ID_centre) values (91, 1, 15);
insert into contient (ID_contient, ID_promo, ID_centre) values (92, 4, 2);
insert into contient (ID_contient, ID_promo, ID_centre) values (93, 1, 10);
insert into contient (ID_contient, ID_promo, ID_centre) values (94, 5, 19);
insert into contient (ID_contient, ID_promo, ID_centre) values (95, 1, 1);
insert into contient (ID_contient, ID_promo, ID_centre) values (96, 4, 12);
insert into contient (ID_contient, ID_promo, ID_centre) values (97, 4, 17);
insert into contient (ID_contient, ID_promo, ID_centre) values (98, 3, 17);
insert into contient (ID_contient, ID_promo, ID_centre) values (99, 1, 6);
insert into contient (ID_contient, ID_promo, ID_centre) values (100, 1, 14);