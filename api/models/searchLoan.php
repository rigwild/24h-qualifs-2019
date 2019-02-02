<?php

require __DIR__.'/../lib/Database.class.php';

$dbLink = new Database();

try {
  // Recherche via nom/prénom
  if (!$jeu_nom) {
    $res = $dbLink->select(
      'SELECT u.nom, u.prenom, j.nom_jeu, aff.date_affectation, aff.date_retour FROM utilisateur AS u
      INNER JOIN affectation AS aff ON u.id_user = aff.id_user
      INNER JOIN jeu as j ON aff.id_jeu = j.id_jeu
      WHERE aff.date_retour IS NULL AND u.nom LIKE :nom OR u.prenom LIKE :prenom',
      [
        'nom' => $nom,
        'prenom' => $prenom
      ]
    );
  }
  else if (!$nom || !$prenom) {
    $res = $dbLink->select(
      'SELECT u.nom, u.prenom, j.nom_jeu, aff.date_affectation, aff.date_retour FROM utilisateur AS u
      INNER JOIN affectation AS aff ON u.id_user = aff.id_user
      INNER JOIN jeu as j ON aff.id_jeu = j.id_jeu
      WHERE aff.date_retour IS NULL AND j.nom_jeu LIKE :jeu',
      [
        'jeu' => $jeu_nom
      ]
    );
  }
} catch (PDOException $e) {
  $error = $e->getMessage();
}

?>
