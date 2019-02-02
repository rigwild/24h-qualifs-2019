<?php

require __DIR__.'/../lib/Database.class.php';

$dbLink = new Database();

try {
  // Check if user to get the messages from exists
  $res = $dbLink->select(
    "SELECT J.*, CASE WHEN COUNT(A.id_jeu) = 0 THEN 'f'::boolean ELSE 't'::boolean END AS emprunte FROM jeu J LEFT JOIN affectation A ON A.id_jeu = J.id_jeu GROUP BY J.id_jeu;"
  );
} catch (PDOException $e) {
  $error = $e->getMessage();
}

?>
