<?php
/**
 * @author JullySoft
 * @link URL on https://jullysoftware.com
 * **/

include './include/DBHandler.php';
include './model/Model.php';
$db = new DBHandler();
$model = new Model();
//echo  $model->getHour();
$dataComputer = array();
$check = 0;//bang 0 la k co du lieu, bang 2 la co du lieu, 1 la chua nhap method
$tutime = 0;
$dentime = 0;
$thamsochia =5;
error_reporting(0);
if (isset($_GET['method']) && !empty($_GET["method"])) {
    $method = $_GET['method'];
    $tutime = $_GET['tutime'];
    $dentime = $_GET['dentime'];
    if (strcmp($method, 'DanhsachComputer') == 0) {
        $res = $db->GetTotalComputer();
        if ($res != 0)
            $check = 2;
    } else {
        $check=0;
    }
} else
    $check = 1;
?>
<html xmlns="http://www.w3.org/1999/xhtml" lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>List Computer</title>
    <link rel="stylesheet" type="text/css" href="css/listuser.css">
    <meta name="description" content="List Computer">
    <meta name="keywords" content="List Computer">
    <script src="js/jquery-3.3.1.js" type="text/javascript"></script>
    <link rel="shortcut icon" href="GUI/icon.PNG" type="image/x-icon">
</head>
<body>
<?php if ($check == 2) { ?>
    <div class="avd">
        <table class="table_none">
            <tr>
                <td><h4>Total Computer: <?php echo $res; ?></h4></td>
                <td>Total Pages: <?php
                    $total = (int)($res / $thamsochia) + ($res % $thamsochia > 0 ? 0 : 1);
                    echo ($total == 0) ? "1" : $total; ?> </td>
                <td class="btn"><input type="button" style="width: 100px;height: 25px;color: white;background:
            #5cb85c;cursor:pointer; font-size: 13px;font-weight: bold" value="&laquo; Previous" onclick="funPrevious()"/> </td>
                <td class="btn"><input type="button" style="width: 100px;height: 25px;color: white;background:
            #5cb85c;cursor:pointer; font-size: 13px;font-weight: bold" value="Next &raquo;" onclick="funcNext()"/></td>
                <td class="btn"><input type="button" style="width: 100px;height: 25px;color: white;background:
            #5cb85c;cursor:pointer; font-size: 13px;font-weight: bold" value="Reset" onclick="funcReset()"/></td>
            </tr>
        </table>
    </div>
    <?php
    if ($dentime == 0)
        $den_time = $db->GetLastComputer();
    else
        $den_time = $dentime;

    if ($tutime == 0)
        $tu_time = $den_time - $thamsochia;
    else
        $tu_time = $tutime;
    ?>
    <input type="hidden" name="pre" id="pre" value="<?php echo($tu_time); ?>"/>
    <input type="hidden" name="next" id="next" value="<?php echo($den_time); ?>"/>
    <?php

    $dataListUser = $db->GetListComputerById($tu_time, $den_time);
    while ($row = mysqli_fetch_assoc($dataListUser)) {
        $dataComputer[] = $row;
    }
    if (count($dataComputer) > 0) { ?>
        <table>
            <thead>
            <tr>
                <th>Computer Name</th>
                <th>Computer Model</th>
                <th>Loại bảo hành</th>
                <th>Thời gian bảo hành</th>
                <th>Cửa hàng</th>
                <th>Địa chỉ cửa hàng</th>
                <th>Ngày mua</th>
            </tr>
            </thead>
            <?php
            for ($stt = 0; $stt < count($dataComputer); $stt++) { ?>
                <tr>
                    <td><?php echo($dataComputer[$stt]['computername']); ?></td>
                    <td><?php echo($dataComputer[$stt]['computermodel']); ?></td>
                    <td><?php echo($dataComputer[$stt]['loaibaohanh']); ?></td>
                    <td><?php echo($dataComputer[$stt]['time']); ?></td>
                    <td><?php echo($dataComputer[$stt]['store']); ?></td>
                    <td><?php echo($dataComputer[$stt]['address']); ?></td>
                    <td><?php echo($dataComputer[$stt]['date_create']); ?></td>
                </tr>
            <?php } ?>
        </table>
        <?php
    } else {
        ?>
        <div class="nodata">
            <br/>
            <h3>Không có dữ liệu trong trong data</h3>
        </div>
        <?php
    }
    ?>
<?php } else if ($check == 0) { ?>
    <h3>Không có dữ liệu</h3>
<?php } else { ?>
    <h3>Chưa nhập method</h3>
<?php } ?>
</body>
<script type="text/javascript">
    let thamsochia =5;
    function funPrevious() {
        let dentime = parseInt(document.getElementById('pre').value);
        dentime-=1;//600017
        const tutime = dentime - thamsochia;//600012
        let href = window.location.href;//lay url hien tai cua trinh duyet http://localhost/HuongDanPHP/PhanTrang/AppAPI/phantrang.php?method=DanhsachComputer
        if (href.includes("&")) {
            let ext = href.split('?');
            let item = ext[1].split('&');
            let _tutiem = item[1].split('=')[0] + '=' + tutime;
            let _dentime = item[2].split('=')[0] + '=' + dentime;
            ext[1] = item[0] + '&' + _tutiem + '&' + _dentime;
            href = ext[0] + '?' + ext[1];
        } else {
            href += "&tutime=" + tutime + "&dentime=" + dentime;
        }
        console.log(href);
        window.location.href = href;
    }

    function funcNext() {
        let tutime = parseInt(document.getElementById('next').value);
        tutime+=1;
        const dentime = tutime + thamsochia;
        //alert(dentime);
        let href = window.location.href;
        if (href.includes("&")) {
            let ext = href.split('?');
            let item = ext[1].split('&');
            let _tutiem = item[1].split('=')[0] + '=' + tutime;
            let _dentime = item[2].split('=')[0] + '=' + dentime;
            ext[1] = item[0] + '&' + _tutiem + '&' + _dentime;
            href = ext[0] + '?' + ext[1];
        } else {
            href += "&tutime=" + tutime + "&dentime=" + dentime;
        }
        console.log(href);
        window.location.href = href;
    }
    function funcReset() {
        let href = window.location.href;
        if (href.includes("&"))
        {
            href = href.split('&')[0];//http://localhost/HuongDanPHP/PhanTrang/AppAPI/phantrang.php?method=DanhsachComputer&tutime=600024&dentime=600029
        }
        window.location.href = href;
    }
</script>
</html>
