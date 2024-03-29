<?php 
// Database.Class.php pour le singleton de connexion
class Database {
    // Instance unique de la classe
    private static $instance = null;

    // Informations de connexion à la base de données
    private $host = 'localhost';
    private $username = 'root';
    private $password = 'Jemyf371'; // changer par le mdp de chacun 
    private $dbname = 'Projet_Web';

    // Connexion PDO
    private $connexion;

    // Constructeur privé pour empêcher l'instanciation directe de la classe
    private function __construct() {
        try {
            $this->connexion = new PDO("mysql:host=$this->host;dbname=$this->dbname", $this->username, $this->password);
            $this->connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch(PDOException $e) {
            echo "La connexion à la base de données a échoué : " . $e->getMessage();
        }
    }

    // Méthode statique pour récupérer l'instance unique de la classe
    public static function getInstance() {
        if (self::$instance === null) {
            self::$instance = new Database();
        }
        return self::$instance;
    }

    // Méthode pour récupérer la connexion à la base de données
    public function getConnexion() {
        return $this->connexion;
    }
}