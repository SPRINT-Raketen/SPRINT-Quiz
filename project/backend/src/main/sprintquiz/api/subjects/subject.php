<?php
include_once '../util/database.php';
include_once '../util/http_response_codes.php';
include_once '../util/com_handler.php';
include_once '../obj/subject.php';

function get_request($conn, $uriArgs)
{
    $filter = "";
    if (!is_null($uriArgs)) {
        if (array_key_exists('id', $uriArgs)) {
            $id = $uriArgs['id'];
            $filter = " WHERE `id`=$id";
        }
    }
    $sqlstr = "SELECT `id`, `text` FROM `subject` " . $filter . ";";
    try {
        $stmt = $conn->prepare($sqlstr);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_OBJ);
        $resArr = $stmt->fetchAll();
        if (count($resArr) > 0) {
            $subjects = array();
            foreach ($resArr as $row) {
                $subjects[] = new Subject($row->id, $row->text);
            }
            ComHandler::echo_answer(Http_Response_Codes::OK,$subjects);
        } else {
            $msgText = "No subjects found.";
            ComHandler::echo_answer(Http_Response_Codes::NOT_FOUND,array("message" => $msgText));
        }
    } catch (PDOException $e) {
        ComHandler::echo_answer(Http_Response_Codes::SERVICE_UNAVAILABLE,array("message" => $e->getMessage()));
    }
}

function post_request($conn)
{
    $body = json_decode(file_get_contents('php://input'), true);
    $subjectText = htmlspecialchars(strip_tags($body['text']));
    if (strlen($subjectText) > 0) {
        $subjectText = "'" . $subjectText . "'";
        $sqlstr = "INSERT INTO `subject` (`text`) VALUES ($subjectText)" . ";";
        try {
            // ToDo:
            //  - teste auf Duplikat
            //  - Untersuche, ob die Autoincrement id ausfindig gemacht werden kann
            //  - eventuell soll die erstellte Resource zurückgegeben werden - klären!
            $conn->exec($sqlstr);
            http_response_code(Http_Response_Codes::CREATED);        //created
            echo json_encode($subjectText);
        } catch (PDOException $e) {
            $msgText = "Unable to create subject '" . $subjectText . "'. " . $e->getMessage();
            ComHandler::echo_answer(Http_Response_Codes::SERVICE_UNAVAILABLE,array("message" => $msgText));
        }
    } else {
        $msgText = "Unable to create subject, 'text' must not be empty.";
        ComHandler::echo_answer(Http_Response_Codes::BAD_REQUEST,array("message" => $msgText));
    }
}

function put_request($conn, $uriArgs)
{
    $body = json_decode(file_get_contents('php://input'), true);
    $subjectText = htmlspecialchars(strip_tags($body['text']));
    $filter = "";
    $id = "";
    if (strlen($subjectText) > 0) {
        if (!is_null($uriArgs)) {
            if (array_key_exists('id', $uriArgs)) {
                $id = $uriArgs['id'];
                $filter = " WHERE `id`=$id";
            }
            $subjectText = "'" . $subjectText . "'";
            $sqlstr = "UPDATE `subject` SET `text`=" . $subjectText . $filter;
            try {
                $stmt = $conn->prepare($sqlstr);
                $stmt->execute();
                $count = $stmt->rowCount();
                if ($count > 0) {
                    get_request($conn, $uriArgs);       // return changed Subject
                } else {
                    $msgText = "Update not successful.";
                    ComHandler::echo_answer(Http_Response_Codes::SERVICE_UNAVAILABLE,array("message" => $msgText));
                }
            } catch (PDOException $e) {
                $msgText = "Unable to update subject id" . $id . ". " . $e->getMessage();
                ComHandler::echo_answer(Http_Response_Codes::SERVICE_UNAVAILABLE,array("message" => $msgText));
            }
        } else {
            $msgText = "No 'id' given.";
            ComHandler::echo_answer(Http_Response_Codes::BAD_REQUEST,array("message" => $msgText));
        }
    } else {
        $msgText = "Unable to create subject, 'text' must not be empty.";
        ComHandler::echo_answer(Http_Response_Codes::BAD_REQUEST,array("message" => $msgText));
    }
}

function delete_request($conn, $uriArgs)
{
    $filter = "";
    $id = "";
    if (!is_null($uriArgs)) {
        if (array_key_exists('id', $uriArgs)) {
            $id = $uriArgs['id'];
            $filter = " WHERE `id`=$id";
        }
        $sqlstr = "DELETE FROM `subject` " . $filter;
        try {
            $stmt = $conn->prepare($sqlstr);
            $stmt->execute();
            $count = $stmt->rowCount();
            if ($count > 0) {
                $msgText = "Subject deleted successfully.";
                ComHandler::echo_answer(Http_Response_Codes::OK,array("message" => $msgText));
            } else {
                $msgText = "Subject not in database.";
                ComHandler::echo_answer(Http_Response_Codes::NOT_FOUND,array("message" => $msgText));
            }
        } catch (PDOException $e) {
            $msgText = "Unable to delete subject id" . $id . ". " . $e->getMessage();
            ComHandler::echo_answer(Http_Response_Codes::SERVICE_UNAVAILABLE,array("message" => $msgText));
        }
    } else {
        $msgText = "Unable to delete subject, no 'id' given.";
        ComHandler::echo_answer(Http_Response_Codes::BAD_REQUEST,array("message" => $msgText));
    }
}

$requestMode = $_SERVER['REQUEST_METHOD'];
$uriArgs = ComHandler::get_uri_args($_SERVER['REQUEST_URI']);

$myConn = new MySqlConnector("sprintquiz");
$myConn->connect();

if ($requestMode == 'GET') {
    get_request($myConn->getConnection(), $uriArgs);
} elseif ($requestMode == 'POST') {
    post_request($myConn->getConnection());
} elseif ($requestMode == 'PUT') {
    put_request($myConn->getConnection(), $uriArgs);
} elseif ($requestMode == 'DELETE') {
    delete_request($myConn->getConnection(), $uriArgs);
}

$myConn->disconnect();
?>