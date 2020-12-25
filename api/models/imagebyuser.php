<?php

if ($this->method == 'GET'){
	// include './database/conn.php';
	$cn = new connection();
	$getData = "call Sp_LayhinhanhUser('".$this->params[0]."')";
	$query = $cn->connect()->query($getData);   
	$data = array();
	while($row = mysqli_fetch_assoc($query)){
		$data[] = array(
			"IDimage" => $row['id'], 
			"src" => $row['src'],
			"IDpost" => $row['postid']
		);
	}
	$this->response(200, $data);
	// mysqli_close($connect);
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