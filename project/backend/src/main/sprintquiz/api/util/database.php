<?php
interface Db_Connector
{
    public function connect();
    public function disconnect();
    public function getConnection();
}

class MySqlConnector implements Db_Connector
{
    private $servername;
    private $username;
    private $passwort;
    private $conn;
    private $dbname;

    function __construct($dbname)
    {
        $this->servername = "localhost";
        $this->username = "root";
        $this->passwort = "";
        $this->conn = null;
        $this->dbname = $dbname;
        // echo "__construct"."<br/>";
    }

    // Interface Db_Connector
    public function connect()
    {
        // echo "Trying to connect..."."<br/>";
        try {
            $connstr = "mysql:host=$this->servername;dbname=$this->dbname;charset=utf8";
            $myconn = new PDO($connstr, $this->username, $this->passwort);
            // echo "new PDO.<br/>";
            $myconn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            // echo "Connected successfully"."<br/>";
            $this->conn = $myconn;
        } catch (PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
        }
    }

    public function disconnect()
    {
        $this->conn = null;
    }

    public function getConnection()
    {
        return $this->conn;
    }
}
