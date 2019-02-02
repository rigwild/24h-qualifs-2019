<?php

require __DIR__.'/../lib/Database.class.php';

$dbLink = new Database();

try {
  $res = $dbLink->select(
    'SELECT * FROM utilisateur WHERE username = :username',
    ['username' => $username]
  );

  if (count($res) === 0) {
    // Error : User not found
    $error = "Nom d'utilisateur ou mot de passe incorrect.";
    $httpCode = 401;
    return;
  }

  $res = $res[0];

  if ($res['banned']) {
    // Error : User is banned
    $error = "Vous êtes banni.";
    $httpCode = 403;
    return;
  }
  
  if (!password_verify($password, $res['password'])) {
    // Error : Bad password
    $error = "Nom d'utilisateur ou mot de passe incorrect.";
    $httpCode = 401;
    return;
  }

  // We remove useless infos for $_SESSION
  $res = [
    'id_user' => $res['id_user'],
    'username' => $res['username']
  ];
} catch (PDOException $e) {
  $error = $e->getMessage();
}

?>
