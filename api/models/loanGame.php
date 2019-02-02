<?php

require __DIR__.'/../lib/Database.class.php';

$dbLink = new Database();

try {
  $res = $dbLink->select(
    'SELECT COUNT(*) count FROM affectation WHERE id_jeu = :id_jeu AND date_retour is null',
    ['id_jeu' => $id_jeu]
  );

  if (count($res) > 0 && $res[0]['count'] > 0) {
    $error = 'Le jeu sélectionné est déjà en location.';
    $httpCode = 409;
    return;
  }

  $res = $dbLink->execute(
    'INSERT INTO affectation (id_jeu, id_user, date_affectation) VALUES (:id_jeu, :id_user, CURRENT_TIMESTAMP)',
    [
      'id_jeu' => $id_jeu,
      'id_user' => $id_user
    ]
  );
} catch (PDOException $e) {
  $error = $e->getMessage();
}

?>
