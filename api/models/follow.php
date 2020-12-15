<?php

if ($this->method == 'GET'){
	include './database/conn.php';
	$param = $this->params[0];
	$getData = "call Sp_DemTheoDoi('$param');";
	$data = array();
	if ($rs = $connect->query($getData)){
		while($row = $rs->fetch_assoc()){
			$data[] = array(
				"following" => $row['following'], 
				"followers" => $row['followers']
			);
		}
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