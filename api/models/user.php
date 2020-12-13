<?php

if ($this->method == 'GET'){
	include './database/conn.php';
	$getData = null;
	if($this->params){
		$param = $this->params[0];
		$getData = "call SP_Timtaikhoan('$param');";
	}
	else {
		$getData = "call SP_Timtaikhoan('');";
	}
	$query = $connect->query($getData);   
	$data = array();
	while($row = mysqli_fetch_assoc($query)){
		$data[] = array(
			"email" => $row['email'], 
			"username" => $row['username'],
			"name" => $row['viewname'],
			"birthday" => $row['birthday'],
			"gender" => $row['gender'],
			"job" => $row['job'],
			"createdate" => $row['createdate'],
			"avatar" => $row['avatar'],
			"status" => $row['userstatus']
		);
	}
	$this->response(200, $data);
	mysqli_close($connect);
}
elseif ($this->method == 'POST'){
	// Hãy viết code xử lý THÊM dữ liệu ở đây
	// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
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