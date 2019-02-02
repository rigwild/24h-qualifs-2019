  <?php

require __DIR__.'/../lib/Util.class.php';

// We verify the user is not logged in
Util::checkLoggedInAPI();

// Get the body from the request
$json = Util::getJSON();

// API endpoint request method
$requestType = 'POST';

// Check if HTTP method matches
if ($_SERVER['REQUEST_METHOD'] !== $requestType) {
  http_response_code(405);
  exit();
}

// Check if the body of the request contains the needed data
if (!$json || empty($json['nom_jeu']) || empty($json['etat']) || empty($json['valeur'])) {
  http_response_code(400);
  exit();
}

$nom_jeu = $json['nom_jeu'];
$etat = $json['etat'];
$valeur = $json['valeur'];

require __DIR__.'/../models/addGame.php';
  
// The database returned an error
if (isset($error))
  require __DIR__.'/error.php';


// Everything is fine, send the result
echo json_encode(true);

?>
