<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: subjects');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods, Authorization, X-Requested-With');

  include_once '../../config/Database.php';
  include_once '../../models/Subject.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate subject object
  $subjects = new Subject($db);

  // Get raw subjectsed data
  $data = json_decode(file_get_contents("php://input"));

  $subjects->text = $data->text;
  //$subjects->body = $data->body;
  //$subjects->author = $data->author;
  //$subjects->category_id = $data->category_id;

  // Create subjects
  if($subjects->create()) {
    echo json_encode(
      array('message' => 'Subject Created')
    );
  } else {
    echo json_encode(
      array('message' => 'Subject Not Created')
    );
  }
?>