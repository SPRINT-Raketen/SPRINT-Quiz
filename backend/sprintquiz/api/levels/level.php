<?php
include_once '../util/database.php';
include_once '../obj/level.php';


$requestMode = $_SERVER['REQUEST_METHOD'];
// echo "$requestMode <br/>";
$url = $_SERVER['REQUEST_URI'];
$parts = parse_url($url);
// print_r($parts);
// echo "<br/>";
$filter = "";
if (array_key_exists("query", $parts)) {
    parse_str($parts['query'], $urlArgs);
    // print_r($urlArgs);
    if (array_key_exists('id', $urlArgs)) {
        $id = $urlArgs['id'];
        $filter = " WHERE id=$id";
    }
}

$myConn = new MySqlConnector("sprintquiz");
$myConn->connect();
$sqlstr = "SELECT id, value, text FROM level " . $filter . ";";
// echo $sqlstr."<br/>";
// foreach($myConn->getConnection()->query($sqlstr) as $row){
//     echo $row['id']." - ".$row[1]."<br/>";
// }
// echo "fetching..."."<br/>";
try {
    $stmt = $myConn->getConnection()->prepare($sqlstr);
    $stmt->execute();
    // $result = $stmt->setFetchMode(PDO::FETCH_BOTH);
    // echo "resultat von setFetchMode: ".$result."<br/>";
    $stmt->setFetchMode(PDO::FETCH_OBJ);
    $resArr = $stmt->fetchAll();
    // print_r($resArr);
    // print "<br/>";
    $levels = array();
    foreach ($resArr as $row) {
        $levels[] = new Level($row->id, $row->value, $row->text);
        // echo $row->id.": ".$row->text."<br/>";
    }
    header("Content-Type: application/json; charset=UTF-8");
    http_response_code(200);     // okay
    echo json_encode($levels);
} catch (PDOException $e) {
    // echo "Error: " .$e->getMessage();
    http_response_code(401);
}

$myConn->disconnect();
