<?php
include_once '../util/database.php';
include_once '../obj/question.php';
include_once '../obj/subject.php';
include_once '../obj/level.php';
include_once '../obj/answer.php';


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
        $filter = " question.id=$id";
    }
    if (array_key_exists('level', $urlArgs)){
        $levelId = $urlArgs['level'];
        if(strlen($filter)>0){
            $filter = $filter . " AND id_level=$levelId";
        } else {
            $filter = " id_level=$levelId";
        }
    }
    if (array_key_exists('subject', $urlArgs)){
        $subjectId = $urlArgs['subject'];
        if(strlen($filter)>0){
            $filter = $filter . " AND id_subject=$subjectId";
        } else {
            $filter = " id_subject=$subjectId";
        }
    }
    if(strlen($filter)>0){
        $filter = " WHERE ".$filter;
    }
}

$myConn = new MySqlConnector("sprintquiz");
$myConn->connect();
$sqlstr = "SELECT question.*,subject.text AS subject_text, level.value, level.text AS level_text FROM question " 
            . "INNER JOIN subject ON subject.id=question.id_subject "
            . "INNER JOIN level ON level.id=question.id_level "
            . $filter . ";";
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
    $questions = array();
    foreach ($resArr as $row) {
        // print_r($row);
        $answers = array();
        $answers[] = new Answer($row->answer1,$row->feedback1);
        $answers[] = new Answer($row->answer2,$row->feedback2);        
        $answers[] = new Answer($row->answer3,$row->feedback3);
        $answers[] = new Answer($row->answer4,$row->feedback4);
        $subject = new Subject($row->id_subject,$row->subject_text);
        $level = new Level($row->id_level,$row->value,$row->level_text);
        $questions[] = new Question($row->id,$level,$subject, $row->text,$answers);
        // echo $row->id.": ".$row->text."<br/>";
    }
    header("Content-Type: application/json; charset=UTF-8");
    http_response_code(200);     // okay
    echo json_encode($questions);
} catch (PDOException $e) {
    echo "Error: " .$e->getMessage();
    http_response_code(401);
}

$myConn->disconnect();
