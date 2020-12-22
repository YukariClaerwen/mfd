<?php

if ($this->method == 'GET'){
	$cn = new connection();
	$idpost = $this->params[0];
    $getData = "call Sp_demluotthich('$idpost');";
    $data = array();
    if ($count = $cn->connect()->query($getData)){
        $like_count = $count->fetch_object();
        $data += array(
            "post_id"       => $idpost,
            "like_count" 	=> (isset($like_count->count) ? $like_count->count : 0)
        );
    };
    $userlist = [];
    $getUsers = "call Sp_dstkyeuthich('$idpost');";
    if ($users = $cn->connect()->query($getUsers)){
        // echo $getTags;
        while($r = $users->fetch_assoc()){
            $userlist[] = $r['username'];
        };
    };
    $data += array(
        "users" => $userlist
    );
	$this->response(200, $data);
	// mysqli_close($connect);
}
elseif ($this->method == 'POST'){
	// Hãy viết code xử lý THÊM dữ liệu ở đây
	// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
	$cn = new connection();
	// get posted data
	$data = array(
		"post_id" 	=> $this->params['post_id'],
		"username" 	=> $this->params['username']
	);
	$result = array();
    if($data['username'] !== "")
    {
        $addLike = "call Sp_themluotthich('".$data['post_id']."','".$data['username']."');";
        $link = $cn->connect();
        if(mysqli_query($link,$addLike)){
            if (mysqli_affected_rows($link) > 0){
                $result = array(
                    "message" => 1
                );
            } else {
                $result = array(
                    "message" => 0
                );
            }
        } else {
            $result = array(
                "message" => 0
            );
        }
	}
	else{
        $result = array(
            "message" => 0
        );
	}
    $this->response(200, $result);
}
elseif ($this->method == 'PUT'){
	// Hãy viết code xử lý CẬP NHẬT dữ liệu ở đây
	// trả về dữ liệu bằng cách gọi: $this->response(200, $data)
}
elseif ($this->method == 'DELETE'){
	// Hãy viết code xử lý XÓA dữ liệu ở đây
    // trả về dữ liệu bằng cách gọi: $this->response(200, $data)
    $cn = new connection();
    $deletedata = "call Sp_Xoathich('".$_REQUEST["postid"]."','".$_REQUEST["user"]."');";
    $result = array();
    $link = $cn->connect();
    if(mysqli_query($link,$deletedata)){
        if (mysqli_affected_rows($link) > 0){
            $result = array(
                "message" => 1
            );
        } else {
            $result = array(
                "message" => 0
            );
        }
    } else {
		$result = array(
			"message" => 0
		);
	}

	$this->response(200, $result);
}

?>