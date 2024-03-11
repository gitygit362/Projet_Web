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
   logo VARCHAR(MAX)
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

CREATE TABLE Candidature(
   ID_candidature INT,
   lettre_motivation VARCHAR(5000),--CV
   PRIMARY KEY(ID_candidature)
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

CREATE TABLE Etudiant(
   ID_etudiant INT,
   ID_centre INT,
   ID_utilisateur INT,
   PRIMARY KEY(ID_etudiant),
   
   FOREIGN KEY(ID_centre) REFERENCES Centre(ID_centre),
   FOREIGN KEY(ID_utilisateur) REFERENCES Utilisateurs(ID_utilisateur)
);

CREATE TABLE Pilote(
   ID_pilote INT,
   ID_centre INT,
   ID_utilisateur INT,
   PRIMARY KEY(ID_pilote),
   
   FOREIGN KEY(ID_centre) REFERENCES Centre(ID_centre),
   FOREIGN KEY(ID_utilisateur) REFERENCES Utilisateurs(ID_utilisateur)
);

CREATE TABLE Admin(
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
   note DECIMAL(4,2),
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
   ID_offre INT,
   ID_competence INT,
   PRIMARY KEY(ID_offre, ID_competence),
   FOREIGN KEY(ID_offre) REFERENCES Offre_de_stage(ID_offre),
   FOREIGN KEY(ID_competence) REFERENCES Competence(ID_competence)
);

CREATE TABLE postule(
   ID_offre INT,
   ID_candidature INT,
   PRIMARY KEY(ID_offre, ID_candidature),
   FOREIGN KEY(ID_offre) REFERENCES Offre_de_stage(ID_offre),
   FOREIGN KEY(ID_candidature) REFERENCES Candidature(ID_candidature)
);

CREATE TABLE cherche(
   ID_offre INT,
   ID_promo INT,
   PRIMARY KEY(ID_offre, ID_promo),
   FOREIGN KEY(ID_offre) REFERENCES Offre_de_stage(ID_offre),
   FOREIGN KEY(ID_promo) REFERENCES Promo(ID_promo)
);

CREATE TABLE stocke(
   ID_offre INT,
   ID_wish_list INT,
   PRIMARY KEY(ID_offre, ID_wish_list),
   FOREIGN KEY(ID_offre) REFERENCES Offre_de_stage(ID_offre),
   FOREIGN KEY(ID_wish_list) REFERENCES Wish_list(ID_wish_list)
);

CREATE TABLE se_situe(
   ID_entreprise INT,
   ID_adresse INT,
   PRIMARY KEY(ID_entreprise, ID_adresse),
   FOREIGN KEY(ID_entreprise) REFERENCES Entreprise(ID_entreprise),
   FOREIGN KEY(ID_adresse) REFERENCES Adresse(ID_adresse)
);

CREATE TABLE fait(
   ID_etudiant INT,
   ID_candidature INT,
   PRIMARY KEY(ID_etudiant, ID_candidature),
   FOREIGN KEY(ID_etudiant) REFERENCES Etudiant(ID_etudiant),
   FOREIGN KEY(ID_candidature) REFERENCES Candidature(ID_candidature)
);

CREATE TABLE contient(
   ID_promo INT,
   ID_centre INT,
   PRIMARY KEY(ID_promo, ID_centre),
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
INSERT INTO Entreprise (ID_entreprise, secteur_activité, nom, logo) VALUES (30, 'Sécurité/Technologie de l''information', 'Enigma Enterprises', 'Assets\logo\logo30');
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
insert into Utilisateurs (ID_utilisateur, nom, prenom, mot_de_passe) values (60, 'Gard', 'Thérèsa', 'mV3YDX');


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






insert into Etudiant (ID_etudiant) values (1);
insert into Etudiant (ID_etudiant) values (2);
insert into Etudiant (ID_etudiant) values (3);
insert into Etudiant (ID_etudiant) values (4);
insert into Etudiant (ID_etudiant) values (5);
insert into Etudiant (ID_etudiant) values (6);
insert into Etudiant (ID_etudiant) values (7);
insert into Etudiant (ID_etudiant) values (8);
insert into Etudiant (ID_etudiant) values (9);
insert into Etudiant (ID_etudiant) values (10);
insert into Etudiant (ID_etudiant) values (11);
insert into Etudiant (ID_etudiant) values (12);
insert into Etudiant (ID_etudiant) values (13);
insert into Etudiant (ID_etudiant) values (14);
insert into Etudiant (ID_etudiant) values (15);
insert into Etudiant (ID_etudiant) values (16);
insert into Etudiant (ID_etudiant) values (17);
insert into Etudiant (ID_etudiant) values (18);
insert into Etudiant (ID_etudiant) values (19);
insert into Etudiant (ID_etudiant) values (20);
insert into Etudiant (ID_etudiant) values (21);
insert into Etudiant (ID_etudiant) values (22);
insert into Etudiant (ID_etudiant) values (23);
insert into Etudiant (ID_etudiant) values (24);
insert into Etudiant (ID_etudiant) values (25);
insert into Etudiant (ID_etudiant) values (26);
insert into Etudiant (ID_etudiant) values (27);
insert into Etudiant (ID_etudiant) values (28);
insert into Etudiant (ID_etudiant) values (29);
insert into Etudiant (ID_etudiant) values (30);
insert into Etudiant (ID_etudiant) values (31);
insert into Etudiant (ID_etudiant) values (32);
insert into Etudiant (ID_etudiant) values (33);
insert into Etudiant (ID_etudiant) values (34);
insert into Etudiant (ID_etudiant) values (35);
insert into Etudiant (ID_etudiant) values (36);
insert into Etudiant (ID_etudiant) values (37);
insert into Etudiant (ID_etudiant) values (38);
insert into Etudiant (ID_etudiant) values (39);
insert into Etudiant (ID_etudiant) values (40);
insert into Etudiant (ID_etudiant) values (41);
insert into Etudiant (ID_etudiant) values (42);
insert into Etudiant (ID_etudiant) values (43);
insert into Etudiant (ID_etudiant) values (44);
insert into Etudiant (ID_etudiant) values (45);


insert into Pilote (ID_pilote) values (1);
insert into Pilote (ID_pilote) values (2);
insert into Pilote (ID_pilote) values (3);
insert into Pilote (ID_pilote) values (4);
insert into Pilote (ID_pilote) values (5);
insert into Pilote (ID_pilote) values (6);
insert into Pilote (ID_pilote) values (7);
insert into Pilote (ID_pilote) values (8);
insert into Pilote (ID_pilote) values (9);
insert into Pilote (ID_pilote) values (10);
insert into Pilote (ID_pilote) values (11);
insert into Pilote (ID_pilote) values (12);

insert into Admin (ID_admin) values (1);
insert into Admin (ID_admin) values (2);
insert into Admin (ID_admin) values (3);



insert into Wish_list (ID_wish_list) values (1);
insert into Wish_list (ID_wish_list) values (2);
insert into Wish_list (ID_wish_list) values (3);
insert into Wish_list (ID_wish_list) values (4);
insert into Wish_list (ID_wish_list) values (5);
insert into Wish_list (ID_wish_list) values (6);
insert into Wish_list (ID_wish_list) values (7);
insert into Wish_list (ID_wish_list) values (8);
insert into Wish_list (ID_wish_list) values (9);
insert into Wish_list (ID_wish_list) values (10);
insert into Wish_list (ID_wish_list) values (11);
insert into Wish_list (ID_wish_list) values (12);
insert into Wish_list (ID_wish_list) values (13);
insert into Wish_list (ID_wish_list) values (14);
insert into Wish_list (ID_wish_list) values (15);
insert into Wish_list (ID_wish_list) values (16);
insert into Wish_list (ID_wish_list) values (17);
insert into Wish_list (ID_wish_list) values (18);
insert into Wish_list (ID_wish_list) values (19);
insert into Wish_list (ID_wish_list) values (20);
insert into Wish_list (ID_wish_list) values (21);
insert into Wish_list (ID_wish_list) values (22);
insert into Wish_list (ID_wish_list) values (23);
insert into Wish_list (ID_wish_list) values (24);
insert into Wish_list (ID_wish_list) values (25);
insert into Wish_list (ID_wish_list) values (26);
insert into Wish_list (ID_wish_list) values (27);
insert into Wish_list (ID_wish_list) values (28);
insert into Wish_list (ID_wish_list) values (29);
insert into Wish_list (ID_wish_list) values (30);
insert into Wish_list (ID_wish_list) values (31);
insert into Wish_list (ID_wish_list) values (32);
insert into Wish_list (ID_wish_list) values (33);
insert into Wish_list (ID_wish_list) values (34);
insert into Wish_list (ID_wish_list) values (35);
insert into Wish_list (ID_wish_list) values (36);
insert into Wish_list (ID_wish_list) values (37);
insert into Wish_list (ID_wish_list) values (38);
insert into Wish_list (ID_wish_list) values (39);
insert into Wish_list (ID_wish_list) values (40);
insert into Wish_list (ID_wish_list) values (41);
insert into Wish_list (ID_wish_list) values (42);
insert into Wish_list (ID_wish_list) values (43);
insert into Wish_list (ID_wish_list) values (44);
insert into Wish_list (ID_wish_list) values (45);


insert into Evaluation (ID_evaluation, note) values (1, 3.16);
insert into Evaluation (ID_evaluation, note) values (2, 2.43);
insert into Evaluation (ID_evaluation, note) values (3, 3.08);
insert into Evaluation (ID_evaluation, note) values (4, 1.41);
insert into Evaluation (ID_evaluation, note) values (5, 3.19);
insert into Evaluation (ID_evaluation, note) values (6, 2.63);
insert into Evaluation (ID_evaluation, note) values (7, 1.92);
insert into Evaluation (ID_evaluation, note) values (8, 3.18);
insert into Evaluation (ID_evaluation, note) values (9, 3.24);
insert into Evaluation (ID_evaluation, note) values (10, 4.44);
insert into Evaluation (ID_evaluation, note) values (11, 4.7);
insert into Evaluation (ID_evaluation, note) values (12, 3.2);
insert into Evaluation (ID_evaluation, note) values (13, 3.04);
insert into Evaluation (ID_evaluation, note) values (14, 4.04);
insert into Evaluation (ID_evaluation, note) values (15, 2.4);
insert into Evaluation (ID_evaluation, note) values (16, 4.7);
insert into Evaluation (ID_evaluation, note) values (17, 2.39);
insert into Evaluation (ID_evaluation, note) values (18, 2.14);
insert into Evaluation (ID_evaluation, note) values (19, 2.24);
insert into Evaluation (ID_evaluation, note) values (20, 3.49);
insert into Evaluation (ID_evaluation, note) values (21, 3.93);
insert into Evaluation (ID_evaluation, note) values (22, 4.26);
insert into Evaluation (ID_evaluation, note) values (23, 1.75);
insert into Evaluation (ID_evaluation, note) values (24, 1.59);
insert into Evaluation (ID_evaluation, note) values (25, 4.38);
insert into Evaluation (ID_evaluation, note) values (26, 5.0);
insert into Evaluation (ID_evaluation, note) values (27, 3.17);
insert into Evaluation (ID_evaluation, note) values (28, 2.99);
insert into Evaluation (ID_evaluation, note) values (29, 1.84);
insert into Evaluation (ID_evaluation, note) values (30, 3.53);
insert into Evaluation (ID_evaluation, note) values (31, 3.3);
insert into Evaluation (ID_evaluation, note) values (32, 2.62);
insert into Evaluation (ID_evaluation, note) values (33, 1.59);
insert into Evaluation (ID_evaluation, note) values (34, 3.27);
insert into Evaluation (ID_evaluation, note) values (35, 2.69);
insert into Evaluation (ID_evaluation, note) values (36, 1.51);
insert into Evaluation (ID_evaluation, note) values (37, 2.98);
insert into Evaluation (ID_evaluation, note) values (38, 1.4);
insert into Evaluation (ID_evaluation, note) values (39, 3.45);
insert into Evaluation (ID_evaluation, note) values (40, 1.22);
insert into Evaluation (ID_evaluation, note) values (41, 3.17);
insert into Evaluation (ID_evaluation, note) values (42, 4.23);
insert into Evaluation (ID_evaluation, note) values (43, 1.92);
insert into Evaluation (ID_evaluation, note) values (44, 3.92);
insert into Evaluation (ID_evaluation, note) values (45, 3.03);


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
(25, 'Mulhouse', 8); -- Grand Est


-- Insertion des adresses pour les campus CESI
INSERT INTO Adresse (ID_adresse, adresse, ID_ville) VALUES
(1, '1 Rue de la Paix', 1), -- Paris
(2, '10 Avenue de l''Europe', 2), -- Toulouse
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
(13, '11 Rue de l''Innovation', 13), -- Rouen
(14, '7 Avenue de la Science', 14), -- Grenoble
(15, '14 Boulevard du Sud', 15), -- Toulon
(16, '3 Rue du Savoir', 16), -- Tours
(17, '18 Rue de l''Excellence', 17), -- Reims
(18, '23 Avenue de la Technologie', 18), -- Le Mans
(19, '6 Rue de l''Ingénieur', 19), -- Poitiers
(20, '19 Rue de l''Énergie', 20), -- Saint-Nazaire
(21, '4 Boulevard de la Mer', 21), -- Brest
(22, '21 Avenue de la Connaissance', 22), -- Caen
(23, '16 Rue de la Créativité', 23), -- Dijon
(24, '2 Avenue de l''Innovation', 24), -- Orléans
(25, '13 Rue de la Réussite', 25); -- Mulhouse





insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (1, '19/05/2024', 939.73, '19/08/2024', 3, '19/03/2024', 655);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (2, '17/03/2024', 856.64, '17/01/2025', 3, '17/07/2024', 150);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (3, '25/02/2025', 886.89, '25/08/2025', 8, '25/01/2025', 122);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (4, '19/11/2024', 1163.63, '19/05/2025', 7, '19/10/2024', 822);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (5, '30/01/2025', 440.09, '30/03/2025', 8, '30/08/2024', 784);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (6, '15/08/2024', 958.78, '15/10/2025', 6, '15/06/2024', 922);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (7, '22/05/2024', 524.25, '22/07/2025', 1, '22/03/2024', 517);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (8, '26/09/2024', 354.55, '26/08/2025', 8, '26/01/2024', 637);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (9, '13/05/2024', 1191.37, '13/03/2025', 1, '13/12/2023', 512);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (10, '02/10/2024', 611.77, '02/08/2025', 10, '02/05/2024', 814);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (11, '26/04/2024', 839.64, '26/07/2024', 1, '26/01/2024', 442);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (12, '18/10/2024', 1019.63, '18/07/2025', 8, '18/05/2024', 450);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (13, '25/12/2024', 976.66, '25/07/2025', 7, '25/09/2024', 45);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (14, '06/01/2025', 541.18, '06/03/2025', 4, '06/10/2024', 903);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (15, '04/03/2025', 1078.4, '04/04/2025', 7, '04/12/2023', 586);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (16, '29/12/2024', 662.32, '29/01/2025', 5, '29/09/2024', 164);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (17, '30/08/2024', 715.28, '30/10/2024', 8, '30/05/2024', 552);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (18, '20/04/2024', 438.5, '20/10/2024', 3, '20/01/2024', 477);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (19, '23/02/2025', 1118.63, '23/07/2025', 1, '23/11/2024', 111);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (20, '22/12/2024', 999.12, '22/12/2024', 1, '22/09/2024', 348);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (21, '24/11/2024', 315.9, '24/04/2025', 1, '24/08/2024', 339);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (22, '02/05/2024', 586.56, '02/11/2024', 1, '02/02/2024', 201);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (23, '01/01/2025', 976.36, '01/01/2025', 10, '01/09/2024', 214);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (24, '28/01/2025', 656.45, '28/10/2024', 1, '28/01/2025', 193);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (25, '05/02/2025', 987.67, '05/02/2025', 5, '05/11/2024', 359);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (26, '06/10/2024', 756.96, '06/03/2025', 10, '06/02/2024', 913);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (27, '01/08/2024', 982.24, '01/11/2024', 7, '01/04/2024', 719);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (28, '05/01/2025', 874.72, '05/01/2025', 5, '05/09/2024', 659);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (29, '19/09/2024', 749.07, '19/02/2025', 2, '19/06/2024', 634);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (30, '22/03/2024', 384.0, '22/08/2024', 6, '22/05/2023', 93);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (31, '13/12/2024', 685.9, '13/09/2024', 3, '13/08/2023', 416);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (32, '14/10/2024', 359.77, '14/02/2025', 6, '14/06/2024', 732);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (33, '16/02/2025', 346.93, '16/04/2025', 1, '16/10/2024', 170);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (34, '31/08/2024', 1128.85, '31/05/2025', 6, '31/07/2024', 184);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (35, '16/11/2024', 628.01, '16/11/2024', 7, '16/06/2024', 88);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (36, '14/05/2024', 867.75, '14/07/2025', 2, '14/03/2024', 20);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (37, '05/06/2024', 372.44, '05/10/2025', 5, '05/02/2024', 404);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (38, '23/06/2024', 782.68, '23/02/2025', 10, '23/03/2024', 667);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (39, '30/04/2024', 354.44, '30/07/2024', 8, '30/01/2024', 232);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (40, '09/03/2024', 719.25, '09/09/2024', 10, '09/12/2023', 281);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (41, '10/05/2024', 623.9, '10/08/2024', 2, '10/02/2024', 485);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (42, '29/11/2024', 927.84, '29/05/2025', 6, '29/08/2024', 78);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (43, '20/02/2025', 1159.85, '20/08/2025', 5, '20/11/2024', 620);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (44, '02/05/2024', 853.6, '02/08/2024', 1, '02/02/2024', 261);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (45, '25/10/2024', 645.77, '25/12/2025', 1, '25/02/2024', 330);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (46, '01/04/2024', 306.86, '01/04/2025', 3, '01/02/2024', 619);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (47, '28/11/2024', 886.67, '28/09/2025', 9, '28/08/2024', 535);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (48, '29/06/2024', 900.84, '29/01/2025', 2, '29/05/2024', 49);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (49, '21/06/2024', 407.63, '21/02/2025', 7, '21/05/2024', 381);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (50, '30/12/2024', 403.87, '30/12/2024', 2, '30/09/2024', 116);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (51, '06/03/2025', 932.48, '06/06/2025', 2, '06/12/2023', 779);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (52, '31/12/2024', 303.8, '31/10/2025', 6, '31/07/2024', 231);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (53, '18/03/2024', 431.34, '18/06/2025', 1, '18/10/2023', 256);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (54, '22/11/2024', 659.76, '22/02/2025', 5, '22/07/2024', 464);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (55, '04/07/2024', 519.82, '04/08/2025', 10, '04/03/2024', 666);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (56, '22/07/2024', 444.72, '22/06/2025', 6, '22/01/2024', 989);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (57, '27/12/2024', 529.12, '27/08/2025', 1, '27/07/2024', 704);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (58, '28/08/2024', 867.49, '28/11/2024', 8, '28/05/2024', 337);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (59, '19/12/2024', 483.29, '19/12/2024', 3, '19/07/2024', 79);
insert into Offre_de_stage (ID_offre, debut, rémunération, fin, nombre_places, Date_offre, nombre_like) values (60, '24/08/2024', 1075.4, '24/09/2025', 2, '24/02/2024', 605);
