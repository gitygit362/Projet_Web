use Projet_Web;
/*créer avec auto_increment*/

CREATE TABLE Competence(
   ID_competence INT NOT NULL AUTO_INCREMENT,
   nom_competence VARCHAR(50),
   PRIMARY KEY(ID_competence)
);

CREATE TABLE Promo(
   ID_promo INT NOT NULL AUTO_INCREMENT,
   promo VARCHAR(2),
   PRIMARY KEY(ID_promo)
);

CREATE TABLE Entreprise(
   ID_entreprise INT NOT NULL AUTO_INCREMENT,
   secteur_activité VARCHAR(50),
   nom VARCHAR(50),
   logo VARCHAR(100),		-- Notre url Assets/images/logo n° fait 26 caractères à voir si plus 
   PRIMARY KEY(ID_entreprise)
);



/* adresses */

CREATE TABLE Pays(
   ID_pays INT NOT NULL AUTO_INCREMENT,
   nom_pays VARCHAR(50),
   PRIMARY KEY(ID_pays)
);

CREATE TABLE Région(
   ID_région INT NOT NULL AUTO_INCREMENT,
   région VARCHAR(50),
   ID_pays INT,
   PRIMARY KEY(ID_région),
   constraint FOREIGN KEY(ID_pays) REFERENCES Pays(ID_pays)
);


CREATE TABLE Ville(
   ID_ville INT NOT NULL AUTO_INCREMENT,
   ville VARCHAR(50),
   ID_région INt,
   PRIMARY KEY(ID_ville),
   constraint FOREIGN KEY(ID_région) REFERENCES Région(ID_région)
);

CREATE TABLE Adresse(
   ID_adresse INT NOT NULL AUTO_INCREMENT,
   adresse VARCHAR(50),
   ID_ville INT,
   PRIMARY KEY(ID_adresse),
   constraint FOREIGN KEY(ID_ville) REFERENCES Ville(ID_ville)
);

/*-----------------------------------------*/


CREATE TABLE Utilisateurs(
   ID_utilisateur INT NOT NULL AUTO_INCREMENT,
   nom VARCHAR(50),
   prenom VARCHAR(50),
   mot_de_passe VARCHAR(50),
   PRIMARY KEY(ID_utilisateur)
);


CREATE TABLE Centre(
   ID_centre INT NOT NULL AUTO_INCREMENT,
   nom_centre VARCHAR(50),
   PRIMARY KEY(ID_centre)
);


CREATE TABLE Etudiant(/*45*/
   ID_etudiant INT NOT NULL AUTO_INCREMENT,
   ID_centre INT NOT NULL,
   ID_utilisateur INT NOT NULL,
   ID_promo INT NOT NULL;
   PRIMARY KEY(ID_etudiant),
   constraint FOREIGN KEY(ID_centre) REFERENCES Centre(ID_centre),
   constraint FOREIGN KEY(ID_utilisateur) REFERENCES Utilisateurs(ID_utilisateur),
   constraint FOREIGN KEY(ID_promo) REFERENCES Promo(ID_promo)
);

CREATE TABLE Pilote( /*25*/
   ID_pilote INT NOT NULL AUTO_INCREMENT,
   ID_centre INT NOT NULL,
   ID_utilisateur INT NOT NULL,
   PRIMARY KEY(ID_pilote),
   constraint FOREIGN KEY(ID_centre) REFERENCES Centre(ID_centre),
   constraint FOREIGN KEY(ID_utilisateur) REFERENCES Utilisateurs(ID_utilisateur)
);

CREATE TABLE Admin( /*5*/
   ID_admin INT NOT NULL AUTO_INCREMENT,
   ID_utilisateur INT NOT NULL,
   PRIMARY KEY(ID_admin),
   constraint FOREIGN KEY(ID_utilisateur) REFERENCES Utilisateurs(ID_utilisateur)
);

CREATE TABLE Wish_list(
   ID_wish_list INT NOT NULL AUTO_INCREMENT,
   ID_etudiant INT NOT NULL,
   PRIMARY KEY(ID_wish_list),
   constraint FOREIGN KEY(ID_etudiant) REFERENCES Etudiant(ID_etudiant)
);

CREATE TABLE Evaluation(
   ID_evaluation INT NOT NULL AUTO_INCREMENT,
   note DECIMAL(2,1),
   ID_pilote INT NOT NULL,
   ID_etudiant INT NOT NULL,
   ID_entreprise INT NOT NULL,
   PRIMARY KEY(ID_evaluation),
   constraint FOREIGN KEY(ID_pilote) REFERENCES Pilote(ID_pilote),
   constraint FOREIGN KEY(ID_etudiant) REFERENCES Etudiant(ID_etudiant),
   constraint FOREIGN KEY(ID_entreprise) REFERENCES Entreprise(ID_entreprise)
);

CREATE TABLE Offre_de_stage(
   ID_offre INT NOT NULL AUTO_INCREMENT,
   debut DATE,
   rémunération DECIMAL(15,3),
   fin DATE,
   nombre_places INT,
   Date_offre DATE,
   nombre_like INT,
   ID_adresse INT NOT NULL,
   ID_entreprise INT NOT NULL,
   PRIMARY KEY(ID_offre),
   constraint FOREIGN KEY(ID_adresse) REFERENCES Adresse(ID_adresse),
   constraint FOREIGN KEY(ID_entreprise) REFERENCES Entreprise(ID_entreprise)
);

CREATE TABLE Offre_Competence(
   ID_Offre_Competence INT NOT NULL AUTO_INCREMENT,
   ID_offre INT NOT NULL,
   ID_competence INT NOT NULL,
   PRIMARY KEY(ID_Offre_Competence),
   constraint FOREIGN KEY(ID_offre) REFERENCES Offre_de_stage(ID_offre),
   constraint FOREIGN KEY(ID_competence) REFERENCES Competence(ID_competence)
);

CREATE TABLE Candidature(
   ID_candidature INT NOT NULL AUTO_INCREMENT,
   lettre_motivation VARCHAR(5000),/*CV*/
   ID_etudiant INT NOT NULL,
   ID_offre INT NOT NULL,
   PRIMARY KEY(ID_candidature),
   constraint FOREIGN KEY(ID_etudiant) REFERENCES Etudiant(ID_etudiant),
   constraint FOREIGN KEY(ID_offre) REFERENCES Offre_de_stage(ID_offre)
);

CREATE TABLE Promo_Offre(
   ID_Promo_Offre INT NOT NULL AUTO_INCREMENT, /*auto*/
   ID_offre INT NOT NULL, /*1 et max*/
   ID_promo INT NOT NULL, /*1 et max*/
   PRIMARY KEY(ID_Promo_Offre), /*plus*/
   constraint FOREIGN KEY(ID_offre) REFERENCES Offre_de_stage(ID_offre),
   constraint FOREIGN KEY(ID_promo) REFERENCES Promo(ID_promo)
);

CREATE TABLE Offre_WL(
   ID_Offre_WL INT NOT NULL AUTO_INCREMENT, -- auto
   ID_offre INT NOT NULL, -- 1 et max
   ID_wish_list INT NOT NULL, -- 1 et max
   PRIMARY KEY(ID_Offre_WL), /*plus*/
   constraint FOREIGN KEY(ID_offre) REFERENCES Offre_de_stage(ID_offre),
   constraint FOREIGN KEY(ID_wish_list) REFERENCES Wish_list(ID_wish_list)
);

CREATE TABLE Entreprise_Adresse(
   ID_Ent_Adr INT NOT NULL AUTO_INCREMENT, -- auto
   ID_entreprise INT NOT NULL,-- 1 et max
   ID_adresse INT NOT NULL,-- auto
   PRIMARY KEY(ID_Ent_Adr),-- nombre d'address
   constraint FOREIGN KEY(ID_entreprise) REFERENCES Entreprise(ID_entreprise),
   constraint FOREIGN KEY(ID_adresse) REFERENCES Adresse(ID_adresse)
);


CREATE TABLE Promo_Pilote(
   ID_Promo_Centre INT NOT NULL AUTO_INCREMENT, -- auto
   ID_promo INT NOT NULL,-- 1 et max
   ID_pilote INT NOT NULL,-- 1 et max
   PRIMARY KEY(ID_Promo_Centre),-- plus
   constraint FOREIGN KEY(ID_promo) REFERENCES Promo(ID_promo),
   constraint FOREIGN KEY(ID_pilote) REFERENCES Pilote(ID_pilote)
);
