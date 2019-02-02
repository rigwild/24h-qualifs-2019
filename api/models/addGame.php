<?php

require __DIR__.'/../lib/Database.class.php';

$dbLink = new Database();

try {
  $res = $dbLink->execute(
    'INSERT INTO  jeu (nom_jeu, etat, valeur) VALUES (:nom_jeu, :etat, :valeur)',
    [
      'nom_jeu' => $nom_jeu,
      'etat' => $etat,
      'valeur' => $valeur
    ]
  );
} catch (PDOException $e) {
  $error = $e->getMessage();
}

?>
