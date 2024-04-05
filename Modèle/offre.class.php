<?php
require_once 'config.php';

class Offre_stages {
    protected $id = 0;
    protected $duree = 0;
    protected $date_online = "";
    protected $nb_places = 0;
    protected $like = 0;
    protected $adresse = "";
    protected $ville = "";
    protected $region = "";
    protected $pays = "";
    protected $nb_competences = 0;
    protected $competence = "";
    protected $promo = "";
    protected $entreprise = "";
    protected $remuneration = 0;
    protected $nb_candidatures = 0;



//-------------- Getters ----------------------------------------

    public function getId(){
        return $this->id;
    }

    public function getDuree(): int {
        return $this->duree;
    }

    public function getDateOnline(){
        return $this->date_online;
    }

    public function getNbPlaces(){
        return $this->nb_places;
    }

    public function getLike(){
        return $this->like;
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

    public function getNbCompetences(){
        return $this->nb_competences;
    }

    public function getCompetence(){
        return $this->competence;
    }

    public function getPromo(){
        return $this->promo;
    }

    public function getEntreprise(){
        return $this->entreprise;
    }

    public function getremuneration(){
        return $this->remuneration;
    }

    public function getNbCandidatures(){
        return $this->nb_candidatures;
    }


//----------------------- Setters --------------------------------

    public function setID($id){
        $this->id = $id;
    }

    public function setDuree($duree){
        $this->duree = $duree;
    }

    public function setDateOnline($dateOnline){
        $this->date_online = $dateOnline;
    }

    public function setNbPlaces($nb_places){
        $this->nb_places = $nb_places;
    }

    public function setLike($like){
        $this->like = $like;
    }

    public function setAdresse($adresse){
        $this->adresse = $adresse;
    }

    public function setVille($ville){
        $this->ville = $ville;
    }

    public function setRegion($region){
        $this->region = $region;
    }

    public function setPays($pays){
        $this->pays = $pays;
    }

    public function setNbCompetence($nb_competences){
        $this->nb_competences = $nb_competences;
    }

    public function setCompetence($competence){
        $this->competence = $competence;
    }

    public function setPromo($promo){
        $this->promo = $promo;
    }

    public function setEntreprise($entreprise){
        $this->entreprise = $entreprise;
    }

    public function setRemuneration($remuneration){
        $this->remuneration = $remuneration;
    }

    public function setNbCandidatures($nb_candidatures){
        $this->nb_candidatures = $nb_candidatures;
    }

    // Constructeur
    public function Offres_stages(){

    }

//---------------------------------------------------------------

    public function chercherOffre($var_id, $var_competence, $var_adresse, $var_ville, $var_region, $var_pays, $var_entreprise, $var_promo, $var_date_fin, $var_date_debut, $var_remuneration, $var_date_online, $var_nb_places){
        

        // A REPRENDRE -> Requete

        $db = Database::getInstance();
        $connexion = $db->getConnexion();
        $sql_query = 'SELECT distinct offre_de_stage.ID_offre, nom_competence, adresse, ville, région, nom_pays, nom, promo, DATEDIFF(fin, debut) AS Durée, rémunération, date_offre, nombre_places, COUNT(ID_candidature) AS NombreDeCandidatures
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
        /*Condition WHERE*/
        GROUP BY  offre_de_stage.ID_offre, nom_competence, adresse, ville, région, nom_pays, nom, promo, DATEDIFF(fin, debut), rémunération, date_offre, nombre_places
        ORDER BY ID_offre, promo, nom_competence
        ;';

        $statement = $connexion->prepare($sql_query);
        $statement->bindParam(':id_offre', $var_id, PDO::PARAM_INT);
        $statement->bindParam(':competence', $var_competence, PDO::PARAM_STR);
        $statement->bindParam(':adresse', $var_adresse, PDO::PARAM_STR);
        $statement->bindParam(':ville', $var_ville, PDO::PARAM_STR);
        $statement->bindParam(':region', $var_region, PDO::PARAM_STR);
        $statement->bindParam(':pays', $var_pays, PDO::PARAM_STR);
        $statement->bindParam(':entreprise', $var_entreprise, PDO::PARAM_STR);
        $statement->bindParam(':promo', $var_promo, PDO::PARAM_STR);
        $statement->bindParam(':date_fin', $var_date_fin, PDO::PARAM_STR);
        $statement->bindParam(':date_debut', $var_date_debut, PDO::PARAM_STR);
        $statement->bindParam(':remuneration', $var_remuneration, PDO::PARAM_STR);
        $statement->bindParam(':date_online', $var_date_online, PDO::PARAM_STR);
        $statement->bindParam(':nb_places', $var_nb_places, PDO::PARAM_INT);

        $statement->execute();

        $results = array();
        while ($row = $statement->fetch(PDO::FETCH_ASSOC)) {
            $offre = new Offre_stages();
            $offre->setID($row['ID_offre']);
            $offre->setCompetence($row['nom_competence']);
            $offre->setAdresse($row['adresse']);
            $offre->setVille($row['ville']);
            $offre->setRegion($row['région']);
            $offre->setPays($row['nom_pays']);
            $offre->setEntreprise($row['nom']);
            $offre->setPromo($row['promo']);
            $offre->setDuree($row['Durée']);
            $offre->setRemuneration($row['rémunération']);
            $offre->setDateOnline($row['date_offre']);
            $offre->setNbPlaces($row['nombre_places']);
            $offre->setNbCandidatures($row['NombreDeCandidatures']);

            $results[] = $offre;
        }
        return $results;
    }















}
