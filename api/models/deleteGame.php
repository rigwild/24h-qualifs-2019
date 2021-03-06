<?php

require __DIR__.'/../lib/Database.class.php';

$dbLink = new Database();

try {
  if (!is_array($id_jeu)) {
    $error = "La liste des jeux à supprimer doit être un tableau.";
    $httpCode = 400;
    return;
  }

  $temp = 'DELETE FROM jeu WHERE id_jeu IN ('.join(', ', $id_jeu).')';
  $res = $dbLink->execute($temp);
} catch (PDOException $e) {
  $error = $e->getMessage();
}

?>
