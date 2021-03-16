<?php
class Subject
{
    public $id;
    public $text;

    function __construct($id, $text)
    {
        $this->id = $id;
        $this->text = $text;
    }
}
?>