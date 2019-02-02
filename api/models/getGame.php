<?php

require __DIR__.'/../lib/Database.class.php';

$dbLink = new Database();

try {
  // Check if user to get the messages from exists
  $res = $dbLink->select(
    "SELECT J.*, CASE WHEN (SELECT COUNT(*) FROM affectation A WHERE A.id_jeu = J.id_jeu AND A.date_retour IS NULL) = 0 THEN 'f'::boolean ELSE 't'::boolean END AS emprunte FROM jeu J;"
  );
} catch (PDOException $e) {
  $error = $e->getMessage();
}

?>
