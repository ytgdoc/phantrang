<?php
/**
 * Class Model
 * @author JullySoft
 *
 */
date_default_timezone_set('Asia/Ho_Chi_Minh');
class Model
{
    function __construct()
    {

    }
    public  function  getHour(){
        $dt = new DateTime();
        $gettime = $dt->format('H:i:s');
        $hour = explode(":",$gettime)[0];
        return $hour;
    }
}