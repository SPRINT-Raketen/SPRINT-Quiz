<?php
include_once '../util/database.php';
include_once '../util/http_response_codes.php';
include_once '../util/com_handler.php';
include_once '../obj/question.php';
include_once '../obj/subject.php';
include_once '../obj/level.php';
include_once '../obj/answer.php';

function construct_filter($uriArgs)
{
    $filter = "";
    if (!is_null($uriArgs)) {
        if (array_key_exists('id', $uriArgs)) {
            $id = $uriArgs['id'];
            $filter = " question.id=$id";
        }
        if (array_key_exists('level', $uriArgs)) {
            $levelId = $uriArgs['level'];
            if (strlen($filter) > 0) {
                $filter = $filter . " AND id_level=$levelId";
            } else {
                $filter = " id_level=$levelId";
            }
        }
        if (array_key_exists('subject', $uriArgs)) {
            $subjectId = $uriArgs['subject'];
            if (strlen($filter) > 0) {
                $filter = $filter . " AND id_subject=$subjectId";
            } else {
                $filter = " id_subject=$subjectId";
            }
        }
        if (strlen($filter) > 0) {
            $filter = " WHERE " . $filter;
        }
    }
    return $filter;
}

function get_request($conn, $uriArgs)
{
    $filter = construct_filter($uriArgs);
    $sqlstr = "SELECT question.*,subject.text AS subject_text, level.value, level.text AS level_text FROM question "
        . "INNER JOIN subject ON subject.id=question.id_subject "
        . "INNER JOIN level ON level.id=question.id_level "
        . $filter . ";";
    try {
        $stmt = $conn->prepare($sqlstr);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_OBJ);
        $resArr = $stmt->fetchAll();
        $questions = array();
        foreach ($resArr as $row) {
            $answers = array();
            $answers[] = new Answer($row->answer1, $row->feedback1);
            $answers[] = new Answer($row->answer2, $row->feedback2);
            $answers[] = new Answer($row->answer3, $row->feedback3);
            $answers[] = new Answer($row->answer4, $row->feedback4);
            $subject = new Subject($row->id_subject, $row->subject_text);
            $level = new Level($row->id_level, $row->value, $row->level_text);
            $questions[] = new Question($row->id, $level, $subject, $row->text, $answers);
        }
        ComHandler::echo_answer(Http_Response_Codes::OK, $questions);
    } catch (PDOException $e) {
        ComHandler::echo_answer(Http_Response_Codes::SERVICE_UNAVAILABLE, array("message" => $e->getMessage()));
    }
}

function service_not_available()
{
    $msgText = "Only 'GET' allowed.";
    ComHandler::echo_answer(Http_Response_Codes::SERVICE_UNAVAILABLE, array("message" => $msgText));
}

$requestMode = $_SERVER['REQUEST_METHOD'];
$uriArgs = ComHandler::get_uri_args($_SERVER['REQUEST_URI']);

$myConn = new MySqlConnector("sprintquiz");
$myConn->connect();

if ($requestMode == 'GET') {
    get_request($myConn->getConnection(), $uriArgs);
} else {
    service_not_available();
}

$myConn->disconnect();
