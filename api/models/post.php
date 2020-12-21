<?php

if ($this->method == 'GET'){
	$cn = new connection();
	$getData = null;
	$avardefault = "avarDefault.png";
	if($this->params){
		if((int)$this->params[0]>0){
			$id = $this->params[0];
			$getData = "call SP_Timbaiviet('$id','');";
		}
		elseif($this->params[0] =='hashtag'){
			$hashtag= $this->params[1];
			$getData= "call SP_Timbaiviet('','$hashtag');";
		}
		// elseif($this->params[0] =='key'){
		// 	$key= $this->params[1];
		// 	$getData= "call Sp_TimbaivietTheoTuKhoa('$key');";
		// }
		// elseif($this->params[0] =='location'){
		// 	$location= $this->params[1];
		// 	$getData= "call Sp_TimbaivietTheoTuKhoa('$location');";
		// }
		else{

		}
	}
	else {
		$getData = "call SP_Timbaiviet('','');";
	}
	$query = $cn->connect()->query($getData);   
	$data = array();
	while($row = mysqli_fetch_assoc($query)){
		$getL = "call Sp_demluotthich('".$row['Id']."');";
		if ($kq_L = $cn->connect()->query($getL)){
			$like_count = $kq_L->fetch_object();
		}
		$getBL = "call Sp_demluotbinhluan('".$row['Id']."');";
		if ($kq_BL = $cn->connect()->query($getBL)){
			$comment_count = $kq_BL->fetch_object();
		}
		$getP = "call Sp_Laydiemdanhgia('".$row['place_id']."');";
		if ($kq_P = $cn->connect()->query($getP)){
			$point = $kq_P->fetch_object();
		}
		$getFL = "call Sp_DemTheoDoi('".$row['username']."');";
		if ($kq_FL = $cn->connect()->query($getFL)){
			$follow = $kq_FL->fetch_object();
		}
		$getUser = "call SP_Timtaikhoan('".$row['username']."');";
		if ($kq_U = $cn->connect()->query($getUser)){
			$user = $kq_U->fetch_object();
		}
		$getTags = "call Sp_Laytagsbaiviet('".$row['Id']."');";
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
		$getCmts = "call Sp_Laybinhluan('".$row['Id']."');";
		$cmts = array();
		if ($kq_C = $cn->connect()->query($getCmts)){
			// echo $getTags;
			while($r = $kq_C->fetch_assoc()){
				$cmts += array(
					$r['Idbinhluan']=>array(
						"id" 		=> $r['Idbinhluan'], 
						"content" 	=> $r['Noidung'],
						"date"		=> (new DateTime($r['Ngaybinhluan']))->format('d-m-Y'),
						"time"		=> (new DateTime($r['Ngaybinhluan']))->format('G:i'),
						"username"	=> $r['Tentaikhoan'],
						"name"	=> $r['viewname'],
						"avatar"	=> (isset($r['avatar']) ? $r['avatar'] : $avardefault)
					)
				);
			};
		};
		$data[] = array(
			"ID" 			=> $row['Id'], 
			"content" 		=> html_entity_decode($row['content']),
			"views" 		=> $row['views'],
			"post_status" 	=> $row['post_status'],
			"edited" 		=> $row['edited'],
			"post_date" 	=> (new DateTime($row['post_time']))->format('d-m-Y'),
			"post_time" 	=> (new DateTime($row['post_time']))->format('G:i'),
			"title" 		=> $row['title'],
			"like_count" 	=> (isset($like_count->count) ? $like_count->count : 0),
			"comment_count" => (isset($comment_count->count) ? $comment_count->count : 0),
			"featured_img" 	=> $row['featured_img'],
			"point" 		=> $row['review_point'],
			"place"			=> array(
				"id"			=> $row['place_id'],
				"name" 			=> $row['place_name'],
				"address" 		=> $row['place_address'],
				"location" 		=> $row['place_city'],
				"opentime" 		=> $row['place_open_time'],
				"closetime" 	=> $row['place_close_time'],
				"price"		 	=> $row['place_price'],
				"point"			=> $point->review_sum / $point->review_count
			),
			"user" 			=> array(
				"username" 		=> $row['username'],
				"name" 			=> $user->viewname,
				"avatar" 		=> (isset($user->avatar) ? $user->avatar : $avardefault),
				"following" 	=> $follow->following, 
				"followers" 	=> $follow->followers
			),
			"comments"		=> $cmts,
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