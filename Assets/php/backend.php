<?php //Il s'agit d'un test il y aura bien plus de fichiers php pour créer une classe par table
$pdo = new PDO("mysql:host=localhost;dbname=Projet_Web", 'root', 'Jemyf371');
$result = $pdo->query("SELECT * from entreprise"); 
foreach ($result as $row) {
    echo $row['*'] . PHP_EOL; 
}
