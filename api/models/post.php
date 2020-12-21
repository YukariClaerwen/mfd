<?php

if ($this->method == 'GET'){
	$cn = new connection();
	$getData = null;
	$avardefault = "avarDefault.png";
	if($this->params){
		if((int)$this->params[0]>0){
			$id = $this->params[0];
			$getData = "call SP_Timbaiviet('$id');";
		}
		elseif($this->params[0] =='hashtag'){
			$hashtag= $this->params[1];
			$getData= "call SP_TimbaivietTheoHashTag('$hashtag');";
		}
		elseif($this->params[0] =='key'){
			$key= $this->params[1];
			$getData= "call Sp_TimbaivietTheoTuKhoa('$key');";
		}
		elseif($this->params[0] =='location'){
			$location= $this->params[1];
			$getData= "call Sp_TimbaivietTheoTuKhoa('$location');";
		}
		else{

		}
	}
	else {
		$getData = "call SP_Timbaiviet(-1);";
	}
	$query = $cn->connect()->query($getData);   
	$data = array();
	while($row = mysqli_fetch_assoc($query)){
		$getFL = "call Sp_DemTheoDoi('".$row['Tentaikhoan']."');";
		if ($kq_FL = $cn->connect()->query($getFL)){
			$follow = $kq_FL->fetch_object();
		}
		$getUser = "call SP_Timtaikhoan('".$row['Tentaikhoan']."');";
		if ($kq_U = $cn->connect()->query($getUser)){
			$user = $kq_U->fetch_object();
			$cn->close();
		}
		$getTags = "call Sp_Laytagsbaiviet('".$row['Idbaiviet']."');";
		$tags = array();
		if ($kq_T = $cn->connect()->query($getTags)){
			// echo $getTags;
			while($r = $kq_T->fetch_assoc()){
				$tags += array(
					$r['tag']=>array(
						"IDtag" 	=> $r['IDtag'], 
						"tag" 		=> $r['tag'],
						"tagname"	=> $r['tagname']
					)
				);
			};
		};
		$data[] = array(
			"ID" 			=> $row['Idbaiviet'], 
			"content" 		=> html_entity_decode($row['Noidung']),
			"views" 		=> $row['Soluotxem'],
			"restaurant" 	=> $row['Tenquan'],
			"point" 		=> $row['Diemdanhgia'],
			"address" 		=> $row['Diachiquan'],
			"location" 		=> $row['Diadiem'],
			"opentime" 		=> $row['Thoigianmocua'],
			"price"		 	=> $row['Giaban'],
			"post_status" 	=> $row['Trangthaibaiviet'],
			"edited" 		=> $row['Dachinhsua'],
			"post_date" 	=> (new DateTime($row['Ngaydangbaiviet']))->format('d-m-Y'),
			"post_time" 	=> (new DateTime($row['Ngaydangbaiviet']))->format('G:i'),
			"title" 		=> $row['Tieudebaiviet'],
			"like_count" 	=> $row['soluotthich'],
			"featured_img" 	=> $row['hinhmacdinh'],
			"user" 			=> array(
				"username" 		=> $row['Tentaikhoan'],
				"name" 			=> $user->viewname,
				"avatar" 		=> (isset($user->avatar) ? $user->avatar : $avardefault),
				"following" 	=> $follow->following, 
				"followers" 	=> $follow->followers
			),
			"tags"			=> $tags
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