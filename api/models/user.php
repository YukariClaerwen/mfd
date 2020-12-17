<?php

if ($this->method == 'GET'){
	
	$cn = new connection();
	$getData = null;
	$data = array();
	$avardefault = "avarDefault.png";
	if(isset($this->params[1])){
		/**
		* Lấy danh sách theo dõi
		* Link 1: user/<username>/<following>
		* Link 2: user/<username>/<followers>
		*/
		if($this->params[1] == "following"){
			$getData = "call SP_Dangtheodoi('".$this->params[0]."');";
			if($rs = $cn->connect()->query($getData)){
				while($row = $rs->fetch_assoc()){
					$data[] = array(
						"username" 	=> $row['following'],
						"name" 		=> $row['viewname'],
						"avatar" 	=> (isset($row['avatar']) ? $row['avatar'] : $avardefault)
					);
				}
			}
		} else {
			$getData = "call SP_Nguoitheodoi('".$this->params[0]."');";
			if($rs = $cn->connect()->query($getData)){
				while($row = $rs->fetch_assoc()){
					$data[] = array(
						"username" 	=> $row['followers'],
						"name" 		=> $row['viewname'],
						"avatar" 	=> (isset($row['avatar']) ? $row['avatar'] : $avardefault)
					);
				}
			}
		}
	}
	else {
		/**
		* Lấy danh sách các user: /user
		* Lấy 1 user: user/<username>
		*/
		if(isset($this->params[0])){
			$getData = "call SP_Timtaikhoan('".$this->params[0]."');";
		}
		else {
			$getData = "call SP_Timtaikhoan('');";
		}  
		if ($rs = $cn->connect()->query($getData)){
			while($row = $rs->fetch_assoc()){
				$getFL = "call Sp_DemTheoDoi('".$row['username']."');";
				if ($kq = $cn->connect()->query($getFL)){
					$follow = $kq->fetch_object();
				}

				$data[] = array(
					"email" 		=> $row['email'], 
					"username" 		=> $row['username'],
					"name" 			=> $row['viewname'],
					"birthday" 		=> $row['birthday'],
					"gender" 		=> $row['gender'],
					"job" 			=> $row['job'],
					"createdate" 	=> $row['createdate'],
					"avatar" 		=> (isset($row['avatar']) ? $row['avatar'] : $avardefault),
					"status" 		=> $row['userstatus'],
					"following" 	=> $follow->following, 
					"followers" 	=> $follow->followers
				);
			}
		} 
	}
	$this->response(200, $data);
}
elseif ($this->method == 'POST'){
	// Hãy viết code xử lý THÊM dữ liệu ở đây
	// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
	$cn = new connection();
	// get posted data
	$data = array(
		"email" 	=> $this->params['email'],
		"username" 	=> $this->params['username']
	);
	if(
		!empty($data['username']) &&
		!empty($data['email']) 
	){
				
		$sql = "select * from tbl_Taikhoan where Tentaikhoan = '".$data['username']."';";
		$sql2 = "select * from tbl_Taikhoan where Email = '".$data['email']."';";
		// $kq = $cn->connect()->query($sql);
		if($cn->connect()->query($sql)->num_rows>0){
			echo json_encode(array("message" => "tai khoan da co"));
		}
		// $kq = $cn->connect()->query($sql2);
		if($cn->connect()->query($sql2)->num_rows>0){
			echo json_encode(array("message" => "email da co"));
		}
		else{//thêm vào CSDL
			// $pass = md5($matkhau);
			// if ($rs = $connect->query($query)) $count = $rs->fetch_object();
			// $manv = $count->sumnv;
			// $manv++;
			$query = "INSERT INTO tbl_Taikhoan
			SET
				Email='".$data['email']."', 
				Tentaikhoan='".$data['username']."', 
				Matkhau=md5('123456'),
				Tenhienthi='".$data['username']."';";
			//nếu thêm thành công		
			if ($result = $cn->connect()->query($query)) {
				$this->response(200, $data);
			}
        
			else //nếu thêm thất bại
			{
				echo json_encode(array("message" => "Unable to create user. Data is incomplete."));
				// echo '<script language="javascript">alert("Chúng tôi rất tiếc rằng Máy chủ đang gặp sự cố, vui lòng quay lại sau!");window.location="../view/index.php?p=themnv";</script>';
			}
		}
	}
	  
	// tell the user data is incomplete
	else{
	  
		// set response code - 400 bad request
		http_response_code(400);
	  
		// tell the user
		echo json_encode(array("message" => "Unable to create user. Data is incomplete."));
	}
	$cn->close();
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