<?php

require __DIR__.'/../lib/Database.class.php';

$dbLink = new Database();

try {
  // Check if user to get the messages from exists
  $res = $dbLink->select(
    'SELECT U.id_user, nom, prenom, email, telephone, banned, username,
    J.id_jeu, date_affectation, date_retour, (date_affectation + 7) date_retour_limite,
    nom_jeu, etat, valeur FROM utilisateur U
    INNER JOIN affectation A ON A.id_user = U.id_user
    INNER JOIN jeu J ON J.id_jeu = A.id_jeu'
  );
} catch (PDOException $e) {
  $error = $e->getMessage();
}

?>
