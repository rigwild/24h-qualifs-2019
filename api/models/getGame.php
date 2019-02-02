<?php

require __DIR__.'/../lib/Database.class.php';

$dbLink = new Database();

try {
  // Check if user to get the messages from exists
  $res = $dbLink->select(
    'SELECT * FROM jeu'
  );
} catch (PDOException $e) {
  $error = $e->getMessage();
}

?>
