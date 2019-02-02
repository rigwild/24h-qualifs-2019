<?php

require __DIR__.'/../lib/Database.class.php';

$dbLink = new Database();

try {
  $res = $dbLink->execute(
    'UPDATE utilisateur SET banned = :toBan WHERE id_user = :id_user',
    [
      'id_user' => $id_user,
      'toBan' => $toBan
    ]
  );
} catch (PDOException $e) {
  $error = $e->getMessage();
}

?>
