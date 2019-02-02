<?php

require __DIR__.'/../lib/Util.class.php';

// Get the body from the request
$json = Util::getJSON();

// API endpoint request method
$requestType = 'POST';

// Check if HTTP method matches
if ($_SERVER['REQUEST_METHOD'] !== $requestType) {
  http_response_code(405);
  exit();
}

$jeu_nom = $json['jeu_nom'];
$prenom = $json['prenom'];
$nom = $json['nom'];

require __DIR__.'/../models/searchLoan.php';
  
// The database returned an error
if (isset($error))
  require __DIR__.'/error.php';


// Everything is fine, send the result
echo json_encode($res);

?>
