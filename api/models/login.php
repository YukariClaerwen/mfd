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
		"password" 	=> $this->params['password']
	);
	$kq = array();
	$flag;
	if(!empty($data['email']) && !empty($data['password']))
	{
		// $sql = "select * from tbl_Taikhoan where Email = '".$data['email']."' and Matkhau = '".$data['password']."';";
		$sql = "select Fn_kiemtraDangnhap('".$data['email']."', '".$data['password']."');";
		if ($rs = $cn->connect()->query($sql)){
			$flag = $rs->fetch_row();
			if($flag[0] == 1){
				$kq[] = array(
					"success" 		=> $flag[0], 
					"message" 		=> "Tai khoan chua xac thuc"
				);
				$this->response(200, $kq);
			}
			elseif($flag[0] == 2) {
				// flag = 2 -> tai khoan con hieu luc
				$sql2 = "select * from tbl_Taikhoan where Email = '".$data['email']."';";
				if($r = $cn->connect()->query($sql2)){
					$user = $r->fetch_object();
					$kq[] = array(
						"success" 		=> $flag[0], 
						"message" 		=> "Dang nhap thanh cong",
						"username"		=> $user->Tentaikhoan
					);
					$this->response(200, $kq);
				}
			}
			elseif($flag[0] == 3){
				$kq[] = array(
					"success" 		=> $flag[0], 
					"message" 		=> "Tai khoan da bi khoa"
				);
				$this->response(200, $kq);
			}
			elseif($flag[0] == 4){
				$kq[] = array(
					"success" 		=> $flag[0], 
					"message" 		=> "Tai khoan da xoa"
				);
				$this->response(200, $kq);
			}
			else {
				// flag = 2 -> tai khoan con hieu luc
				$kq[] = array(
					"success" 		=> $flag[0], 
					"message" 		=> "Tai khoan khong ton tai"
				);
				$this->response(200, $kq);
			}
		} else {
			$kq[] = array(
				"success" => 	0,
				"message" =>	"Loi ket noi server"
			);
			$this->response(200, $kq);
		}
		// $cn->connect()->query($sql);
		// // $kq = $cn->connect()->query($sql);
		// if($cn->connect()->query($sql)->num_rows==0){
		// 	$kq[] = array(
		// 		"success" 		=> 2, 
		// 		"message" 		=> "Thong tin dang nhap sai"
		// 	);
		// 	$this->response(200, $kq);
		// }
		// else{
		
		// }
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