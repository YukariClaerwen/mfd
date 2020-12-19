<?php

if ($this->method == 'GET'){
	$cn= new connection();
	$getData = "select * from tbl_hashtag";
	$query = $cn->connect()->query($getData);   
	$data = array();
	while($row = mysqli_fetch_assoc($query)){
		$data[] = array(
			"IDtag" => $row['Idtag'], 
			"tag" => $row['Tentag'],
			"tagname" => $row['tenhashtag']
		);
	}
	$this->response(200, $data);
	$cn->close();
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