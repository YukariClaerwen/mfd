<?php

if ($this->method == 'GET'){
	$cn = new connection();
	// $param = $this->params[0];
	$getData = "call Sp_Laydiadiem();";
	$data = array();
	if ($rs = $cn->connect()->query($getData)){
		while($row = $rs->fetch_assoc()){
            $getP = "call Sp_Laydiemdanhgia('".$row['id']."');";
            if ($kq_P = $cn->connect()->query($getP)){
                $point = $kq_P->fetch_object();
            }
			$data[] = array(
				"id"			=> $row['id'],
				"name" 			=> $row['name'],
				"address" 		=> $row['address'],
				"location" 		=> $row['city'],
				// "opentime" 		=> (new DateTime($row['open_time']))->format('G:i'),
				"opentime" 		=> (isset($row['open_time']) ? (new DateTime($row['open_time']))->format('G:i') : ""),
				// "closetime" 	=> (new DateTime($row['close_time']))->format('G:i'),
				"closetime" 	=> (isset($row['close_time']) ? (new DateTime($row['close_time']))->format('G:i') : ""),
				"price"		 	=> $row['price'],
				"review_count"	=> (isset($point->review_count) ? $point->review_count : 0),
                "point"			=> (isset($point->review_sum) ? ($point->review_sum * 2) / $point->review_count : 0),
                "img"           => $row['img']
			);
		}
	} else {
        $data[] = array(
            "message" => 0,
            "message_content" => "Không thể kết nối database"
        );
    };
	$this->response(200, $data);
	$cn->close();
}
elseif ($this->method == 'POST'){
	// Hãy viết code xử lý THÊM dữ liệu ở đây
	// $cn = new connection();
	// // get posted data
	// $data = array(
	// 	"username" 	=> $this->params['username'],
	// 	"follow"	=> $this->params['follow']
	// );
	// $result = array();
    // if($data['username'] !== "" && $data['follow'] !== "")
    // {
    //     $addFollow = "call Sp_theodoi('".$data['username']."','".$data['follow']."');";
    //     $link = $cn->connect();
    //     if(mysqli_query($link, $addFollow)){
    //         if (mysqli_affected_rows($link) > 0){
    //             $result = array(
    //                 "message" => 1
    //             );
    //         } else {
    //             $result = array(
    //                 "message" => 0
    //             );
    //         }
    //     } else {
	// 		$result = array(
	// 			"message" => 0
	// 		);
	// 	}
	// }
	// else{
    //     $result = array(
    //         "message" => 0
    //     );
	// }
    $this->response(200, $result);
	// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
}
elseif ($this->method == 'PUT'){
	// Hãy viết code xử lý CẬP NHẬT dữ liệu ở đây
	// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
}
elseif ($this->method == 'DELETE'){
	// Hãy viết code xử lý XÓA dữ liệu ở đây
	// $cn = new connection();
    // $deletedata = "call Sp_botheodoi('".$_REQUEST['username']."','".$_REQUEST['unfollow']."');";
    // $result = array();
    // $link = $cn->connect();
    // if(mysqli_query($link,$deletedata)){
    //     if (mysqli_affected_rows($link) > 0){
    //         $result = array(
    //             "message" => 1
    //         );
    //     } else {
    //         $result = array(
    //             "message" => 0
    //         );
    //     }
    // } else {
	// 	$result = array(
	// 		"message" => 0
	// 	);
	// }

	// $this->response(200, $result);
	// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
}

?>