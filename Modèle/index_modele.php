<?php
class GestionUser
{
    protected $nom;
    protected $prenom;
    protected $centre;
    protected $promo;
    protected $user_type;

    public function __construct($n, $p, $c, $pro){
        $this->nom = $n;
        $this->prenom = $p;
        $this->centre = $c;
        $this->promo = $pro;
    }


    public function getnom(){
        return $this->nom;
    }

    public function setnom($nom){
        $this->nom = $nom;
    }

    public function getprenom(){
        return $this->prenom;
    }

    public function setprenom($prenom){
        $this->prenom = $prenom;
    }

    public function getcentre(){
        return $this->centre;
    }

    public function setcentre($centre){
        $this->centre = $centre;
    }

    public function getpromo(){
        return $this->promo;
    }

    public function setpromo($promo){
        $this->promo = $promo;
    }
}

class GestionEtudiant extends GestionUser
{
    public function creer(){
        /*
        $req = $db->prepare("CALL CreerPilote (:nom, :prenom, :centre, :promo)");
        $req->bindParam(':nom',$this->nom);
        $req->bindParam(':prenom',$this->prenom);
        $req->bindParam(':centre',$this->centre);
        $req->bindParam(':promo',$this->promo);
        return $req->execute();*/
        //attente de requete sql d'ajout de pilote ensuite enlever le true en dessous
        return true;
    }
}