<?php

if ($this->method == 'GET'){
	// include './database/conn.php';
	$avardefault = "avarDefault.png";
	$getData = null;
	if($this->params){
		$idpost = $this->params[0];
		$getData = "call SP_Laybinhluan('$idpost');";
	}
	else {
		$getData = "call SP_Laybinhluan('');";
	}
	$cn = new connection();
	$query = $cn->connect()->query($getData);   
	$data = array();
	while($r = mysqli_fetch_assoc($query)){
		$data[] = array(
			"id" 		=> $r['Idbinhluan'], 
			"content" 	=> $r['Noidung'],
			"date"		=> (new DateTime($r['Ngaybinhluan']))->format('d-m-Y'),
			"time"		=> (new DateTime($r['Ngaybinhluan']))->format('G:i'),
			"username"	=> $r['Tentaikhoan'],
			"name"		=> $r['viewname'],
			"avatar"	=> (isset($r['avatar']) ? $r['avatar'] : $avardefault)
		);
	}
	$this->response(200, $data);
	// mysqli_close($connect);
}
elseif ($this->method == 'POST'){
	// Hãy viết code xử lý THÊM dữ liệu ở đây
	// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
	$cn = new connection();
	// get posted data
	$avardefault = "avarDefault.png";
	$data = array(
		"content" 	=> $this->params['content'],
		"post_id" 	=> $this->params['post_id'],
		"username" 	=> $this->params['username']
	);
	$result = array();
	if(
		$data['content'] !== ""
	){
		$createCmt = "call Sp_Thembinhluan('".$data['content']."','".$data['post_id']."','".$data['username']."');";
		//echo $createUser;
		$query = $cn->connect()->query($createCmt);
		
		$getCmts = "call SP_Laybinhluan('".$data['post_id']."');";
		if ($kq = $cn->connect()->query($getCmts)){
			// echo $getTags;
			while($r = $kq->fetch_assoc()){
				$result[] = array(
					"id" 		=> $r['Idbinhluan'], 
					"content" 	=> $r['Noidung'],
					"date"		=> (new DateTime($r['Ngaybinhluan']))->format('d-m-Y'),
					"time"		=> (new DateTime($r['Ngaybinhluan']))->format('G:i'),
					"username"	=> $r['Tentaikhoan'],
					"name"		=> $r['viewname'],
					"avatar"	=> (isset($r['avatar']) ? $r['avatar'] : $avardefault)
				);
			};
		}; 
		
		$this->response(200, $result);
	}
	  
	// tell the user data is incomplete
	else{
	  
		// set response code - 400 bad request
		http_response_code(400);
	  
		// tell the user
		echo json_encode(array("message" => "Unable to create user. Data is incomplete."));
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