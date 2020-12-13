<?php
include './database/conn.php';


$getData = "select * from tbl_baiviet";
$qur = $connect->query($getData);

while($row = mysqli_fetch_assoc($qur)){

$msg[] = array(
        "ID" => $row['Idbaiviet'], 
        "title" => $row['Tieudebaiviet'],
        "like_count" => $row['soluotthich'],
        "featured_img" => $row['hinhmacdinh']
    );
}
$json = $msg;

header('content-type: application/json');
echo json_encode($json);

mysqli_close($connect);

?>