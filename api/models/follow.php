<?php

if ($this->method == 'GET'){
	$cn = new connection();
	$param = $this->params[0];
	$getData = "call Sp_DemTheoDoi('$param');";
	$data = array();
	if ($rs = $cn->connect()->query($getData)){
		while($row = $rs->fetch_assoc()){
			$data[] = array(
				"following" => $row['following'], 
				"followers" => $row['followers']
			);
		}
	} 
	
	$this->response(200, $data);
	$cn->close();
}
elseif ($this->method == 'POST'){
	// Hãy viết code xử lý THÊM dữ liệu ở đây
	$cn = new connection();
	// get posted data
	$data = array(
		"username" 	=> $this->params['username'],
		"follow"	=> $this->params['follow']
	);
	$result = array();
    if($data['username'] !== "" && $data['follow'] !== "")
    {
        $addFollow = "call Sp_theodoi('".$data['username']."','".$data['follow']."');";
        $link = $cn->connect();
        if(mysqli_query($link, $addFollow)){
            if (mysqli_affected_rows($link) > 0){
                $result = array(
                    "message" => 1
                );
            } else {
                $result = array(
                    "message" => 0
                );
            }
        } else {
			$result = array(
				"message" => 0
			);
		}
	}
	else{
        $result = array(
            "message" => 0
        );
	}
    $this->response(200, $result);
	// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
}
elseif ($this->method == 'PUT'){
	// Hãy viết code xử lý CẬP NHẬT dữ liệu ở đây
	// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
}
elseif ($this->method == 'DELETE'){
	// Hãy viết code xử lý XÓA dữ liệu ở đây
	$cn = new connection();
    $deletedata = "call Sp_botheodoi('".$_REQUEST['username']."','".$_REQUEST['unfollow']."');";
    $result = array();
    $link = $cn->connect();
    if(mysqli_query($link,$deletedata)){
        if (mysqli_affected_rows($link) > 0){
            $result = array(
                "message" => 1
            );
        } else {
            $result = array(
                "message" => 0
            );
        }
    } else {
		$result = array(
			"message" => 0
		);
	}

	$this->response(200, $result);
	// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
}

?>