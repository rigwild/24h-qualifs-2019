<?php

require __DIR__.'/../lib/Database.class.php';

$dbLink = new Database();

try {
  $res = $dbLink->execute(
    'UPDATE utilisateur SET banned = :to_ban WHERE id_user = :id_user',
    [
      'id_user' => $id_user,
      'to_ban' => $to_ban
    ]
  );
} catch (PDOException $e) {
  $error = $e->getMessage();
}

?>
