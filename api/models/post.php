<?php

if ($this->method == 'GET'){
	$cn = new connection();
	$getData = null;
	if($this->params){
		if((int)$this->params[0]>0){
			$id = $this->params[0];
			$getData = "call SP_Timbaiviet('$id');";
		}
		else{
			$hashtag= $this->params[0];
			$getData= "call SP_TimbaivietTheoHashTag('$hashtag');";
		}
	}
	else {
		$getData = "call SP_Timbaiviet(-1);";
	}
	$query = $cn->connect()->query($getData);   
	$data = array();
	while($row = mysqli_fetch_assoc($query)){
		$data[] = array(
			"ID" => $row['Idbaiviet'], 
			"content" => html_entity_decode($row['Noidung']),
			"views" => $row['Soluotxem'],
			"restaurant" => $row['Tenquan'],
			"point" => $row['Diemdanhgia'],
			"address" => $row['Diachiquan'],
			"location" => $row['Diadiem'],
			"opentime" => $row['Thoigianmocua'],
			"price" => $row['Giaban'],
			"post_status" => $row['Trangthaibaiviet'],
			"edited" => $row['Dachinhsua'],
			"post_date" => $row['Ngaydangbaiviet'],
			"title" => $row['Tieudebaiviet'],
			"username" => $row['Tentaikhoan'],
			"like_count" => $row['soluotthich'],
			"featured_img" => $row['hinhmacdinh']
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