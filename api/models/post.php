<?php

if ($this->method == 'GET'){
	$cn = new connection();
	$getData = null;
	$avardefault = "avarDefault.png";
	$imgdefault = "postDefault.png";
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
			"views" 		=> intval($row['views']),
			"post_status" 	=> (isset($row['post_status']) ? $row['post_status'] : ""),
			"edited" 		=> $row['edited'],
			"post_date" 	=> (new DateTime($row['post_time']))->format('d-m-Y'),
			"post_time" 	=> (new DateTime($row['post_time']))->format('G:i'),
			"title" 		=> $row['title'],
			"like_count" 	=> (isset($like_count->count) ? $like_count->count : 0),
			"comment_count" => (isset($comment_count->count) ? $comment_count->count : 0),
			"featured_img" 	=> (isset($row['featured_img']) ? $row['featured_img'] : $imgdefault),
			"point" 		=> (isset($row['review_point']) ? $row['review_point'] : 0),
			"place"			=> array(
				"id"			=> $row['place_id'],
				"name" 			=> $row['place_name'],
				"address" 		=> $row['place_address'],
				"location" 		=> $row['place_city'],
				"opentime" 		=> (new DateTime($row['place_open_time']))->format('G:i'),
				"closetime" 	=> (new DateTime($row['place_close_time']))->format('G:i'),
				"price"		 	=> $row['place_price'],
				"review_count"	=> (isset($point->review_count) ? $point->review_count : 0),
				"point"			=> (isset($point->review_sum) ? ($point->review_sum * 2) / $point->review_count : 0)
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
	$cn = new connection();
	// get posted data
	$postdata = array(
		"title" 	=> $this->params['post']['title'],
		"content"	=> $this->params['post']['content'],
		"username"	=> $this->params['post']['username']
	);
	$hashtags = $this->params['tags'];
	// $hashtags = $this->params['tags'];
	// echo $data['title'];
		// $hashtags = array(
		// 	0 => array(
		// 		"id" 		=> 0,
		// 		"hashtag" 	=> "cà phê",
		// 		"tag" 		=> "ca phe"
		// 	),
		// 	1 => array(
		// 		"id" 		=> 1,
		// 		"hashtag" 	=> "bánh kem",
		// 		"tag" 		=> "banh kem"
		// 	)
		// );
		
	
	// call Sp_Themhashtag(12, "cà phê", "ca_phe");
	
	$result = array();
    if($postdata['title'] !== "" && $postdata['content'] !== "" && $postdata['username'] !== "")
    {
		$addPost = "insert into tbl_baiviet (Noidung, Tieudebaiviet, Tentaikhoan) values ('".$postdata['content']."', '".$postdata['title']."', '".$postdata['username']."');";
		$addTags = "";
        $link = $cn->connect();
        if(mysqli_query($link, $addPost)){
            if (mysqli_affected_rows($link) > 0){
				if(isset($hashtags)){
					for($i = 0; $i < sizeof($hashtags); $i++) {
						$addTags = "call Sp_Themhashtag(0,'".$hashtags[$i]['hashtag']."','".$hashtags[$i]['tag']."');";
						$query = $cn->connect()->query($addTags); 
					};
				};
				$getNewId = "select max(Idbaiviet) as id from tbl_baiviet;";
				if ($kq = $cn->connect()->query($getNewId)){
					$idbv = $kq->fetch_object();
				}

				$result = array(
					"message" => 1,
					"idbv" => $idbv->id
				);
            } else {
                $result = array(
                    "message" => 0
                );
            };
        } else {
			$result = array(
				"message" => 0
			);
		};
	} else {
        $result = array(
            "message" => 0
        );
	};
    $this->response(200, $result);
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