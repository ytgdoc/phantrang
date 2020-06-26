<?php


class DBConnect
{
    private $conn;
    function __construct()
    {
    }
    function connect(){
        include_once dirname(__FILE__). '/Config.php';

        //Connecting to mysql database nhe
        $this->conn = new mysqli(DB_HOST,DB_USERNAME,DB_PASSWORD,DB_NAME);
        mysqli_set_charset($this->conn,'utf8');

        //Check for connection database
        if (mysqli_connect_errno()){
            echo  "Failed to connect to MySQL:".mysqli_connect_error();
            exit();
        }
        return $this->conn;
    }
}