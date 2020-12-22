<?php

    if($this->method == 'GET'){
        $cn = new connection();
        $data = array();
        $getCity = "select * from tbl_tinhthanh;";
        $query = $cn->connect()->query($getCity);
        while($row = mysqli_fetch_assoc($query)){
            $data[] = array(
                "IdCity" => $row['IdTinhthanh'],
                "Name" => $row['Tentinhthanh']
            );
        }
        $this->response(200,$data);
        $cn->close();  
    }
    elseif ($this->method == 'POST'){
        // Hãy viết code xử lý THÊM dữ liệu ở đây
        // trả về dữ liệu bằng cách gọi: $this->response(200, $data)
        $cn = new connection();

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