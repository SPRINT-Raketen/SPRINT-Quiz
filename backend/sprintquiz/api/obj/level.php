<?php
class Level {
    public $id;
    public $value;
    public $text;

    function __construct($id, $value, $text)
    {
        $this->id = $id;
        $this->value = $value;
        $this->text = $text;
    }

}