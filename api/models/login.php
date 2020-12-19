<?php

if ($this->method == 'GET'){
	// Hãy viết code xử lý Lấy dữ liệu ở đây
	// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
}
elseif ($this->method == 'POST'){
	// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
	$cn = new connection();
	// get posted data
	$data = array(
		"email" 	=> $this->params['email'],
		"password" 	=> md5($this->params['password'])
	);
	$kq = array();
	if(!empty($data['email']) && !empty($data['password']))
	{
		$sql = "select * from tbl_Taikhoan where Email = '".$data['email']."' and Matkhau = '".$data['password']."';";
		$cn->connect()->query($sql);
		// $kq = $cn->connect()->query($sql);
		if($cn->connect()->query($sql)->num_rows==0){
			$kq[] = array(
				"success" 		=> 2, 
				"message" 		=> "Thong tin dang nhap sai"
			);
			$this->response(200, $kq);
		}
		else{
			$kq[] = array(
				"success" 		=> 1, 
				"message" 		=> "Dang nhap thanh cong"
			);
			$this->response(200, $kq);
		}
	}
	// tell the user data is incomplete
	else{
		// set response code - 400 bad request
		http_response_code(400);
		// tell the user
		$kq[] = array(
			"success" 		=> 0, 
			"message" 		=> "Chua dien day du thong tin. Dang nhap that bai"
		);
		$this->response(200, $kq);
	}
	// $cn->close();
}
elseif ($this->method == 'PUT'){
	// Hãy viết code xử lý CẬP NHẬT dữ liệu ở đây
	// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
}
elseif ($this->method == 'DELETE'){
	// Hãy viết code xử lý XÓA dữ liệu ở đây
	// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
}

?>