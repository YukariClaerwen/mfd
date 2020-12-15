<?php

if ($this->method == 'GET'){
	
	$cn = new connection();
	$getData = null;
	if($this->params){
		$param = $this->params[0];
		$getData = "call SP_Timtaikhoan('$param');";
	}
	else {
		$getData = "call SP_Timtaikhoan('');";
	}
	// $query = $connect->query($getData);   
	$data = array();
	$user;
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
				"avatar" 		=> $row['avatar'],
				"status" 		=> $row['userstatus'],
				"following" 	=> $follow->following, 
				"followers" 	=> $follow->followers
			);
		}
	} 

	// if ($rs = $cn->connect()->query($getFL)){
	// 	while($row = $rs->fetch_assoc()){
	// 		$data[0] += [ 
	// 			"following" => $row['following'], 
	// 			"followers" => $row['followers']
	// 		];
	// 	}
	// } 
	// $cn->close();
	// while($row = mysqli_fetch_assoc($query)){
	// 	$data[] = array(
	// 		"email" 		=> $row['email'], 
	// 		"username" 		=> $row['username'],
	// 		"name" 			=> $row['viewname'],
	// 		"birthday" 		=> $row['birthday'],
	// 		"gender" 		=> $row['gender'],
	// 		"job" 			=> $row['job'],
	// 		"createdate" 	=> $row['createdate'],
	// 		"avatar" 		=> $row['avatar'],
	// 		"status" 		=> $row['userstatus']
	// 	);
	// }
	$this->response(200, $data);
}
elseif ($this->method == 'POST'){
	// Hãy viết code xử lý THÊM dữ liệu ở đây
	// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
	$cn = new connection();
	// get posted data
	$email 		= $this->params['email'];
	$username 	= $this->params['username'];
	if(
		!empty($this->params['username']) &&
		!empty($this->params['username']) 
	){
		$data = array(
			"email" 	=> $this->params['email'],
			"username" 	=> $this->params['username']
		);
				
		$sql = "select * from tbl_Taikhoan where Tentaikhoan = '$username'";
		$cn->connect()->query($sql);
		if($cn->connect()->affected_rows>0){
			echo json_encode(array("message" => "tai khoan da co"));
		}
		else{//thêm vào CSDL
			// $pass = md5($matkhau);
			// if ($rs = $connect->query($query)) $count = $rs->fetch_object();
			// $manv = $count->sumnv;
			// $manv++;
			$query = "INSERT INTO tbl_Taikhoan
			SET
				Email='$email', 
				Tentaikhoan='$username', 
				Matkhau=md5('123456'),
				Tenhienthi='$username'";
			//nếu thêm thành công		
			if ($result = $cn->connect()->query($query)) {
				$this->response(200, $data);
			}
        
			else //nếu thêm thất bại
			{
				echo $query;
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