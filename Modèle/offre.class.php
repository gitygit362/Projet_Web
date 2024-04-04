<?php
require_once 'coinfig.php';

class Offre_stages {
    protected $id = 0;
    protected $date_debut = "";
    protected $date_fin = "";
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



//-------------- Getters ----------------------------------------

    public function getId(){
        return $this->id;
    }

    public function getDateDebut(){
        return $this->date_debut;
    }

    public function getDateFin(){
        return $this->date_fin;
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



//----------------------- Setters --------------------------------

    public function setID($id){
        $this->id = $id;
    }

    public function setDateDebut($dateDebut){
        $this->date_debut = $dateDebut;
    }

    public function setDateFin($dateFin){
        $this->dateFin = $dateFin;
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















}
