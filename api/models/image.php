<?php

if ($this->method == 'GET'){
	// include './database/conn.php';
	$cn = new connection();
	$getData = null;
	if($this->params){
		$idpost = $this->params[0];
		$getData = "call SP_Layhinhanh('$idpost');";
	}
	else {
		$getData = "call SP_Layhinhanh('');";
	}
	$query = $cn->connect()->query($getData);   
	$data = array();
	while($row = mysqli_fetch_assoc($query)){
		$data[] = array(
			"IDimage" => $row['Idhinhanh'], 
			"src" => $row['Duongdan'],
			"IDpost" => $row['Idbaiviet']
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