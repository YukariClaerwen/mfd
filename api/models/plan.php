<?php

    if($this->method == 'GET'){
        include './database/conn.php';
        $getData = null;
        if($this->params){
            $param = $this->params[0];
            $getData = "call Sp_Laykehoach('$param');";
        }
        else{
            $getData = "call Sp_Laykehoach('');";
        }
        $query = $connect->query($getData); 
        $data= array();
        while($row = mysqli_fetch_assoc($query)){
            $data[] =array(
                "Idplan" => $row['Idkehoachkhampha'],
                "Name" => $row['Tenkehoach'],
                "Location" => $row['Diadiem'],
                "IdDetail" => $row['Idchitietkehoach'],
                "Activity" => $row['Hoatdong'],
                "State" => $row['Trangthai'],
                "Address" => $row['Diachi'],   
            );
        }
        $this->response(200,$data);
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