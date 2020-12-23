<?php

    if($this->method == 'GET'){
        $cn = new connection();
        if($this->params){
            $user = $this->params[0];
            //echo $user;
            $getPlan = "select * from tbl_kehoachkhampha where Tentaikhoan = '$user';";
        }
        $data= array();
        $Detail= array();
        $query1 = $cn->connect()->query($getPlan); 
        while($row = mysqli_fetch_assoc($query1)){
            $getDetail = "select * from tbl_chitietkehoach where Idkehoachkhampha =".$row['Idkehoachkhampha'].";";
            $query2 = $cn->connect()->query($getDetail); 
            while($row1 = mysqli_fetch_assoc($query2)){
                $Detail[] =array(
                    "IdDetail" => $row1['Idchitietkehoach'],
                    "Activity" => $row1['Hoatdong'],
                    "State" => $row1['Trangthai'],
                    "Address" => $row1['Diachi'],
                    "Date" => (new DateTime($row1['Ngaydutinhthuchien']))->format('d-m-Y') 
                );
            }
            $data[]= array(
                "Idplan" => $row['Idkehoachkhampha'],
                "Name" => $row['Tenkehoach'],
                "Location" => $row['Diadiem'],
                "Detail" => $Detail
            );
            $Detail = array();
        }
        $this->response(200,$data);
        $cn->close();  
    }
    elseif ($this->method == 'POST'){
        // Hãy viết code xử lý THÊM dữ liệu ở đây
        // trả về dữ liệu bằng cách gọi: $this->response(200, $data)
        $cn = new connection();
        if($this->params){
            if(isset($this->params['user']) && $this->params['user'] != ""){
                $data = array(
                    "user" => $this->params['user'],
                    "namePlan" => $this->params['namePlan'],
                    "City"  => $this->params['city']
                );
                $result = array();
                $createPlan ="Call Sp_Taokehoachamthuc('".$data['namePlan']."','".$data['user']."','".$data['City']."');";
                    $query = $cn->connect()->query($createPlan);
                while($row = mysqli_fetch_assoc($query)){
                    $result[]= array(
                        "Idplan" => $row['Idkehoachkhampha'],
                        "Name" => $row['Tenkehoach'],
                        "Location" => $row['Diadiem']
                    );
                }
                $this->response(200, $result);
                $cn->close();
            }
            else{
                $data = array(
                    "id" => $this->params['id'],
                    "Activity" => $this->params['Activity'],
                    "Address"  => $this->params['Address'],
                    "Date"  => $this->params['Date']
                );
                $result = array();
                $createAct ="Call Sp_Themhoatdong('".$data['Activity']."','".$data['Date']."','".$data['Address']."',".$data['id'].");";
                echo $createAct;
                    $query = $cn->connect()->query($createAct);
                while($row1 = mysqli_fetch_assoc($query)){
                    $result[]= array(
                        "IdDetail" => $row1['Idchitietkehoach'],
                        "Activity" => $row1['Hoatdong'],
                        "State" => $row1['Trangthai'],
                        "Address" => $row1['Diachi'],
                        "Date" => (new DateTime($row1['Ngaydutinhthuchien']))->format('d-m-Y') 
                    );
                }
                $this->response(200, $result);
                $cn->close();
            }
        }
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