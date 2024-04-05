<?php
require_once 'config.php';
class Entreprise {
    protected $id = 0;
    protected $nom = "";
    protected $secteur = ""; 
    protected $note = 0.0; 
    protected $like = 0; 
    protected $adresse = "";
    protected $ville = "";
    protected $region = "";
    protected $pays = "";
    protected $nbAdr = 0;
    protected $logo = "";


// ------------------ setteurs ---------------------

public function setId ($var_id){
    $this->id = $var_id;
}
    public function setNom ($var_nom){
        $this->nom = $var_nom;
    }
    public function setSecteur($var_secteur){
        $this->secteur = $var_secteur;
    }
    public function setAdresse($var_adresse){
        $this->adresse = $var_adresse;
    }
    public function setVille($var_ville){
        $this->ville = $var_ville;
    }
    public function setRegion($var_region){
        $this->region = $var_region;
    }
    public function setPays($var_pays){
        $this->pays = $var_pays;
    }
    public function setNbAdr($var_nbAdr){
        $this->nbAdr = $var_nbAdr;
    }
    public function setNote($var_note){
        $this->note = $var_note;
    }
    public function setLike($var_like){
        $this->like = $var_like;
    }
    public function setLogo($var_logo){
        $this->logo = $var_logo;
    }


    // -------------- getteurs ---------------------

    public function getNom (){
        return $this->nom;
    }
    public function getSecteur(){
        return $this->secteur;
    }
    public function getAdresse(){
        return $this->adresse;
    }
    public function getVille(){
        return $this->ville;
    }
    public function getRegion(){
        return $this->region;
    }
    public function getPays(){
        return $this->pays;
    }
    public function getNbAdr(){
        return $this->nbAdr;
    }
    public function getId(){
        return $this->id;
    }

    public function getNote(){
        return $this->note;
    }
    public function getLike(){
        return $this->like;
    }
    public function getLogo(){
        return $this->logo;
    }

    public function Entreprise(){

    }

    public function chercherEntreprise($var_nom, $var_secteur, $var_adresse, $var_ville, $var_pays, $var_note1, $var_note2, $var_note3, $var_note4, $var_note5, $var_note6, $var_note_asc, $var_note_desc, $var_like_asc, $var_like_desc){
        $db = Database::getInstance();
        $connexion = $db->getConnexion();
        $stmt = $connexion->prepare("CALL AfficherEntreprise(:nom, :secteur, :adr, :ville, :pays, :note1, :note2, :note3, :note4, :note5, :note6, :noteasc, :notedesc, :likeasc, :likedesc)");
        $stmt->bindParam(':nom', $var_nom);
        $stmt->bindParam(':secteur', $var_secteur);
        $stmt->bindParam(':adr', $var_adresse);
        $stmt->bindParam(':ville', $var_ville);
        $stmt->bindParam(':pays', $var_pays);
        $stmt->bindParam(':note1', $var_note1);
        $stmt->bindParam(':note2', $var_note2);
        $stmt->bindParam(':note3', $var_note3);
        $stmt->bindParam(':note4', $var_note4);
        $stmt->bindParam(':note5', $var_note5);
        $stmt->bindParam(':note6', $var_note6);
        $stmt->bindParam(':noteasc', $var_note_asc);
        $stmt->bindParam(':notedesc', $var_note_desc);
        $stmt->bindParam(':likeasc', $var_like_asc);
        $stmt->bindParam(':likedesc', $var_like_desc);

        $stmt->execute();
        $results = array();
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $entreprise = new Entreprise();
            $entreprise->setId($row['ID_entreprise']);
            $entreprise->setNom($row['nom']);
            $entreprise->setSecteur($row['secteur_activité']);
            $entreprise->setNote($row['moyenne_notes']);
            $entreprise->setLogo($row['logo']);
            $entreprise->setLike($row['nombre_wishlists']);
            $entreprise->setAdresse($row['adresses']);
            $entreprise->setVille($row['villes']);
            $entreprise->setPays($row['pays']);
            $results[] = $entreprise;
        }
        return $results;
    
    }


    public function masquerEntreprise($var_nom1, $var_nom2){
        $db = Database::getInstance();
        $connexion = $db->getConnexion();
        $stmt = $connexion->prepare("CALL SupprimerEntreprise(:nom1, :nom2)");
        $stmt->bindParam(':nom1', $var_nom1);
        $stmt->bindParam(':nom2', $var_nom2);
        try {
            $stmt->execute();
        } catch(PDOException $e) {
            error_log("Une erreur s'est produite lors du masquage de l'entreprise : " . $e->getMessage());
        }
    }
/*
    public function visibleEntreprise(){
        $db = Database::getInstance();
        $connexion = $db->getConnexion();
        $stmt = $connexion->prepare("CALL VisibleEntreprise(:id)");
        $idIn = $this->getId();
        $stmt->bindParam(':id', $idIn);
        $stmt->execute();
    }*/

    public function entrepriseAModifier($var_nom){
        $db = Database::getInstance();
        $connexion = $db->getConnexion();
        $stmt = $connexion->prepare("CALL EntrepriseAModifier1(:nom,@resid,@resnbadr)");
        $stmt->bindParam(':nom', $var_nom);
        $res = $stmt->execute();
        if ($res == false) {
            return false;
        } else {
            $resId = $connexion->query("SELECT @resid")->fetchColumn();
            $resnbadr = $connexion->query("SELECT @resnbadr")->fetchColumn();
            $i=0;
            while ($i<=$resnbadr){
                
            }
        }
    }


    public function creerEntreprise($var_nom, $var_secteur, $var_logo){
        $db = Database::getInstance();
        $connexion = $db->getConnexion();
        $stmt = $connexion->prepare("CALL CreerEntreprise(:nom, :secteur, :logo, @resEntreprise)");
        $stmt->bindParam(':nom', $var_nom);
        $stmt->bindParam(':secteur', $var_secteur);
        $stmt->bindParam(':logo', $var_logo);
        $res = $stmt->execute();
    
        if ($res == false) {
            return false;
        } else {
            $resId = $connexion->query("SELECT @resEntreprise")->fetchColumn();
            return $resId;
        }
    }

    public function noterEntreprise($var_id_user, $var_statut_user, $var_id_ent, $var_note){
        $db = Database::getInstance();
        $connexion = $db->getConnexion();
        $stmt = $connexion->prepare("CALL NoterEntreprise(:id_user, :statut_user, :id_ent, :note)");
        $stmt->bindParam(':id_user', $var_id_user);
        $stmt->bindParam(':statut_user', $var_statut_user);
        $stmt->bindParam(':id_ent', $var_id_ent);
        $stmt->bindParam(':note', $var_note);
        $res = $stmt->execute();
    
        if ($res == false) {
            return false;
        } else {

        }
    }



    public function creerEntrepriseAdresse($var_adresse, $var_ville, $var_pays, $var_idEnt){
        $db = Database::getInstance();
        $connexion = $db->getConnexion();
        $stmt = $connexion->prepare("CALL VerifPaysVilleAdresse(:pays, :ville, :adresse, @resPays, @resVille, @resAdresse)");
        $stmt->bindParam(':pays', $var_pays);
        $stmt->bindParam(':ville', $var_ville);
        $stmt->bindParam(':adresse', $var_adresse);
        $resVerif = $stmt->execute();
        if ($resVerif == false) {
            return false;
        } else {
            $resIdAdr = $connexion->query("SELECT @resAdresse")->fetchColumn();

            $stmt = $connexion->prepare("CALL CreerEntrepriseAdresse(:idEnt, :idAdr)");
            $stmt->bindParam(':idEnt', $var_idEnt);
            $stmt->bindParam(':idAdr', $resIdAdr);
            $resInsert = $stmt->execute();
            if ($resInsert == false) {
                return false;
            } else { 

            }
        }
    }





};