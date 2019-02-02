<?php

require __DIR__.'/../lib/Util.class.php';

// API endpoint request method
$requestType = 'GET';

// Check if HTTP method matches
if ($_SERVER['REQUEST_METHOD'] !== $requestType) {
  http_response_code(405);
  exit();
}

require __DIR__.'/../models/getLoan.php';

// The database returned an error
if (isset($error))
  require __DIR__.'/error.php';

// Everything is fine, send the result
echo json_encode($res);
?>
