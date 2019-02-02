<?php

class Util {
  // Check if the user is logged in. $shouldBe = page require login
  public static function checkLoggedInAPI($shouldBe = true)
  {
    if ($_SESSION['loggedIn'] !== $shouldBe) {
      $httpCode = 401;
      $error = 'You need to be logged '.($shouldBe ? 'in' : 'out').' to do/use this.';
      require __DIR__.'/../controllers/error.php';
    }
  }

  // Escape bad HTML chars
  public static function escapeHTML($content = "")
  {
    return htmlspecialchars($content, ENT_QUOTES, 'UTF-8');
  }

  // Get JSON sent to the server
  public static function getJSON()
  {
    $json = file_get_contents('php://input');
    $json = json_decode($json, true);
    return json_last_error() === JSON_ERROR_NONE ? $json : null;
  }
}

?>
