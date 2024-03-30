<?php
class GestionUser
{
    private $nom;
    private $prenom;
    private $centre;
    private $promotion;
    private $user_type;

    public function __construct($n, $p, $c, $pro, $ut){
        $this->nom = $n;
        $this->prenom = $p;
        $this->centre = $c;
        $this->promotion = $pro;
        $this->user_type = $ut;
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

    public function getpromotion(){
        return $this->promotion;
    }

    public function setpromotion($promotion){
        $this->promotion = $promotion;
    }

    public function getusertype(){
        return $this->user_type;
    }

    public function setusertype($user_type){
        $this->user_type = $user_type;
    }

    public function ajouter($n,$p,$c,$pro,$ut){
        //return 
    }

}