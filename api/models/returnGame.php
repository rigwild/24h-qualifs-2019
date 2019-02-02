<?php

require __DIR__.'/../lib/Database.class.php';

$dbLink = new Database();

try {
  $temp = 'UPDATE affectation SET date_retour = CURRENT_TIMESTAMP WHERE id_jeu = :id_jeu';
  $res = $dbLink->execute($temp, ['id_jeu' => $id_jeu]);
} catch (PDOException $e) {
  $error = $e->getMessage();
}

?>
