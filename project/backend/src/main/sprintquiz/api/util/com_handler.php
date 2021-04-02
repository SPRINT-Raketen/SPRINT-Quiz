<?php
    class ComHandler{
        static function echo_answer($response_code, $data){
            header("Content-Type: application/json; charset=UTF-8");
            http_response_code($response_code);
            echo json_encode($data);
            // echo json_encode(array('message'=>'Hallo Welt!'));
        }

        static function get_uri_args($uri){
            $parts = parse_url($uri);
            $uriArgs = null;
            if (array_key_exists("query", $parts)) {
                parse_str($parts['query'], $uriArgs);
            }
            return $uriArgs;
        }
    }
?>