<?php


class GestionUser
{
    protected $nom;
    protected $prenom;
    protected $centre;
    protected $promo;
    protected $id;

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
    public function getid(){
        return $this->id;
    }

    public function setid($id){
        $this->id = $id;
    }
}

class GestionPilote extends GestionUser
{
    public function creer($db){
        
        $req = $db->prepare("CALL CreerPilote (:nom, :prenom, :centre, :promo, :mdp)");
        $req->bindParam(':nom',$this->nom);
        $req->bindParam(':prenom',$this->prenom);
        $req->bindParam(':centre',$this->centre);
        $req->bindParam(':promo',$this->promo);

        $caracteres = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $longueurMax = strlen($caracteres)-1;
        $chaineAleatoire = '';
        for ($i = 0; $i < 10; $i++)
        {
            $chaineAleatoire .= $caracteres[rand(0, $longueurMax)];
        }    
        $hashHex = hash('sha256', $chaineAleatoire);
        $req->bindParam(':mdp',$hashHex);
        return $req->execute();

    }

    public function recherche($db){
        $req = $db->prepare("CALL RechercherPilote (:nom, :prenom, :centre, :promo)");
        $req->bindParam(':nom',$this->nom);
        $req->bindParam(':prenom',$this->prenom);
        $req->bindParam(':centre',$this->centre);
        $req->bindParam(':promo',$this->promo);
        $res = $req->execute();
        $row = $req->fetch(PDO::FETCH_NUM);
        return $row;
    }

    public function modifier($db,$id_user){
        $req = $db->prepare("CALL ModifierPilote (:nom, :prenom, :centre, :promo, :id)");
        $req->bindParam(':nom',$this->nom);
        $req->bindParam(':prenom',$this->prenom);
        $req->bindParam(':centre',$this->centre);
        $req->bindParam(':promo',$this->promo);
        $req->bindParam(':id',$id_user);
        return $req->execute();
    }

    public function supprimer($db){
        $req = $db->prepare("CALL SupprimerPilote (:nom, :prenom, :centre, :promo)");
        $req->bindParam(':nom',$this->nom);
        $req->bindParam(':prenom',$this->prenom);
        $req->bindParam(':centre',$this->centre);
        $req->bindParam(':promo',$this->promo);
        return $req->execute();
    }
}