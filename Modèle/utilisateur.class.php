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
    protected $offres = [];

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
    public function setOffres($var_offres){
        // Fusionner le tableau des nouvelles offres avec le tableau existant
        $this->offres = array_merge($this->offres, $var_offres);
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

    public function getOffres(){
        return $this->offres;
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


    public function etudiantCentrePromo(){
        $db = Database::getInstance();
        $connexion = $db->getConnexion();

        //promo
        $stmt = $connexion->prepare("SELECT promo.promo FROM etudiant INNER JOIN promo ON etudiant.ID_promo = promo.ID_promo WHERE etudiant.ID_utilisateur = :id_user;");
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
        $stmt = $connexion->prepare("SELECT centre.nom_centre FROM etudiant INNER JOIN centre ON etudiant.ID_centre = centre.ID_centre WHERE etudiant.ID_utilisateur = :id_user;");
        $stmt->bindParam(':id_user', $id_user);
        $stmt->execute();
        $resCentre = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $centres = [];
        foreach ($resCentre as $row) {
            $centres[] = $row['nom_centre'];
        }
        $this->setCentre($centres);
    }
    

    public function etudiantWhList(){
        $db = Database::getInstance();
        $connexion = $db->getConnexion();

        // recherche des offres de la wl
        $stmt = $connexion->prepare("CALL WishListEtudiant(:id_user)");
        $id_user = $this->getId();
        $stmt->bindParam(':id_user', $id_user);
        $stmt->execute();
        $resWL = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $wl = [];
        foreach ($resWL as $row) {
            $wl[] = $row['ID_offre'];
        }
        $this->setWhLists($wl);
    }

    public function etudiantOffreWhList($var_id_offre){
        $db = Database::getInstance();
        $connexion = $db->getConnexion();

        //chercher les info de l'offre de la wl
        $stmt = $connexion->prepare("CALL OffreWLEtudiant(:id_offre)");
        $stmt->bindParam(':id_offre', $var_id_offre);
        $stmt->execute();
        $offre = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($offre) {
            $this->setOffres($offre);
        }
    }


    public function adminCentres(){
        $db = Database::getInstance();
        $connexion = $db->getConnexion();

        //promo
        $stmt = $connexion->prepare("SELECT nom_centre FROM centre");
        $stmt->execute();
        $resCentres = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $centres = [];
        foreach ($resCentres as $row) {
            $centres[] = $row['nom_centre'];
        }
        $this->setCentre($centres);
    }

};