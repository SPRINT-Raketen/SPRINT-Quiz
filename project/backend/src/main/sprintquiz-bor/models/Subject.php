<?php
  class Subject {
    // DB Stuff
    private $conn;
    private $table = 'subject';

    // Properties
    public $id;
    public $text;
    
    // Constructor with DB
    public function __construct($db) {
      $this->conn = $db;
    }

  // Create Subject
  public function create() {
    // Create Query
    $query = 'INSERT INTO ' .
      $this->table . '
    SET
      text = :text';

  // Prepare Statement
  $stmt = $this->conn->prepare($query);

  // Clean data
  $this->text = htmlspecialchars(strip_tags($this->text));

  // Bind data
  $stmt-> bindParam(':text', $this->text);

  // Execute query
  if($stmt->execute()) {
    return true;
  }

  // Print error if something goes wrong
  printf("Error: $s.\n", $stmt->error);

  return false;
  }

  // Update Subject
  public function update() {
    // Create Query
    $query = 'UPDATE ' .
      $this->table . '
    SET
      text = :text
      WHERE
      id = :id';

  // Prepare Statement
  $stmt = $this->conn->prepare($query);

  // Clean data
  $this->text = htmlspecialchars(strip_tags($this->text));
  $this->id = htmlspecialchars(strip_tags($this->id));

  // Bind data
  $stmt-> bindParam(':text', $this->text);
  $stmt-> bindParam(':id', $this->id);

  // Execute query
  if($stmt->execute()) {
    return true;
  }

  // Print error if something goes wrong
  printf("Error: $s.\n", $stmt->error);

  return false;
  }

  // Delete Subject
  public function delete() {
    // Create query
    $query = 'DELETE FROM ' . $this->table . ' WHERE id = :id';

    // Prepare Statement
    $stmt = $this->conn->prepare($query);

    // clean data
    $this->id = htmlspecialchars(strip_tags($this->id));

    // Bind Data
    $stmt-> bindParam(':id', $this->id);

    // Execute query
    if($stmt->execute()) {
      return true;
    }

    // Print error if something goes wrong
    printf("Error: $s.\n", $stmt->error);

    return false;
    }
  }
?>