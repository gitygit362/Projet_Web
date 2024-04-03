<?php
require_once 'config.php';
class Utilisateur {
    protected $id = 0;
    protected $nom = "";
    protected $prenom = ""; 
    protected $centre = []; 
    protected $promo = []; 
    protected $evaluation = [];
    protected $whlists = [];
    protected $candidature = [];

// ------------------ setteurs ---------------------

public function setId ($var_id){
    $this->id = $var_id;
}
    public function setNom ($var_nom){
        $this->nom = $var_nom;
    }
    public function setPrenom($var_prenom){
        $this->prenom = $var_prenom;
    }
    public function setCentre($var_centre){
        $this->centre = $var_centre;
    }
    public function setPromo($var_promo){
        $this->promo = $var_promo;
    }
    public function setEvaluation($var_evaluation){
        $this->evaluation = $var_evaluation;
    }
    public function setWhLists($var_whlists){
        $this->whlists = $var_whlists;
    }
    public function setCandidature($var_candidature){
        $this->candidature = $var_candidature;
    }


    // -------------- getteurs ---------------------

    public function getId(){
        return $this->id;
    }
    public function getNom (){
        return $this->nom;
    }
    public function getPrenom(){
        return $this->prenom;
    }
    public function getCentre(){
        return $this->centre;
    }
    public function getPromo(){
        return $this->promo;
    }
    public function getEvaluation(){
        return $this->evaluation;
    }
    public function getWhLists(){
        return $this->whlists;
    }
    public function getCandidature(){
        return $this->candidature;
    }

    public function Utilisateur(){

    }

    public function infosUtilisateur($var_id_user, $var_statut_user){
        $this->id = $var_id_user;
        $db = Database::getInstance();
        $connexion = $db->getConnexion();
        $stmt = $connexion->prepare("CALL InfosUtilisateur(:id_user, @resNom, @resPrenom)");
        $stmt->bindParam(':id_user', $var_id_user);
        $res1 = $stmt->execute();
    
        if ($res1 == false) {
            return false;
        } else {
            $this->setNom($connexion->query("SELECT @resNom")->fetchColumn());
            $this->setPrenom($connexion->query("SELECT @resPrenom")->fetchColumn());
        }
    }

    public function piloteCentrePromo(){
        $db = Database::getInstance();
        $connexion = $db->getConnexion();

        //promo
        $stmt = $connexion->prepare("SELECT promo.promo FROM pilote INNER JOIN promo_pilote ON pilote.ID_pilote = promo_pilote.ID_pilote INNER JOIN promo ON promo_pilote.ID_promo = promo.ID_promo WHERE pilote.ID_utilisateur = :id_user;");
        $id_user = $this->getId();
        $stmt->bindParam(':id_user', $id_user);
        $stmt->execute();
        $resPromo = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $promos = [];
        foreach ($resPromo as $row) {
            $promos[] = $row['promo'];
        }
        $this->setPromo($promos);

        // centre 
        $stmt = $connexion->prepare("SELECT centre.nom_centre FROM pilote INNER JOIN centre ON pilote.ID_centre = centre.ID_centre WHERE pilote.ID_utilisateur = :id_user;");
        $stmt->bindParam(':id_user', $id_user);
        $stmt->execute();
        $resCentre = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $centres = [];
        foreach ($resCentre as $row) {
            $centres[] = $row['nom_centre'];
        }
        $this->setCentre($centres);
    }

    





};