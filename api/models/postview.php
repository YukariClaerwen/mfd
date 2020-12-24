<?php

if ($this->method == 'GET'){

}
elseif ($this->method == 'POST'){
	// Hãy viết code xử lý THÊM dữ liệu ở đây
	// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
}
elseif ($this->method == 'PUT'){
    // Hãy viết code xử lý CẬP NHẬT dữ liệu ở đây
    $cn = new connection();
    $data = json_decode($this->file, true);
    $updateData ="call Sp_capnhatluotxem(".$data['post_id'].");";
    $result= array();
    $link = $cn->connect();
    if(mysqli_query($link,$updateData)){
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
	$this->response(200,$result);
	// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
}
elseif ($this->method == 'DELETE'){
	// Hãy viết code xử lý XÓA dữ liệu ở đây
	// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
}

?>