<?php
class Answer {
    public $text;
    public $feedback;

    function __construct($text,$feedback){
        $this->text = $text;
        $this->feedback = $feedback;
    }
}
?>