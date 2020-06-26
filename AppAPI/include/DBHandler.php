<?php


class DBHandler
{
    private $conn;

    function __construct()
    {
        require_once dirname(__FILE__). '/DBConnect.php';
        //opening db connection nhe
        $db = new DBConnect();
        $this->conn = $db->connect();
        header('Content-type:text/html; charset=utf-8');
    }
    function GetTotalComputer(){
        $sql = "select count(*) as count from computer";
        $result = mysqli_query($this->conn,$sql);
        $value= mysqli_fetch_object($result);
        $total = $value->count;
        return $total;
    }
    function GetLastComputer(){
        $sql = "select pk_seq from computer order by PK_SEQ desc limit 1";
        $result = mysqli_query($this->conn,$sql);
        $value= mysqli_fetch_object($result);
        $total = $value->pk_seq;
        return $total;
    }
    public function GetListComputerById($tutime,$dentime){
        $sql = "SELECT a.computername,a.computermodel,b.loaibaohanh,b.time,(SELECT storename FROM store WHERE PK_SEQ = a.store_fk) as store,
                (SELECT Address FROM store WHERE PK_SEQ = a.store_fk) as address,
                a.date_create from computer a 
                LEFT JOIN baohanh b on a.mabaohanh_fk=b.mabaohanh
                WHERE a.status=1 AND b.status=1 and a.PK_SEQ>$tutime and a.PK_SEQ<=$dentime ORDER BY a.PK_SEQ DESC";
        $result = mysqli_query($this->conn, $sql);
        return $result;
    }
}