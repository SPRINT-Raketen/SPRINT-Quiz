<?php
class Question {
    public $id;
    public $level;
    public $subject;
    public $question;
    public $answers;

    function __construct($id, $level, $subject, $question, $answers)
    {
        $this->id = $id;
        $this->level = $level;
        $this->subject = $subject;
        $this->question = $question;
        $this->answers = $answers;
    }
}
?>