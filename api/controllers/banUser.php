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
if (!$json || empty($json['id_user']) || empty($json['to_ban'])) {
  http_response_code(400);
  exit();
}

$id_user = $json['id_user'];
$to_ban = $json['to_ban'];

require __DIR__.'/../models/banUser.php';
  
// The database returned an error
if (isset($error))
  require __DIR__.'/error.php';


// Everything is fine, send the result
echo json_encode($res);

?>
