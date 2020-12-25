<?php
    $result = [];
    if(isset($_FILES) && (count($_FILES)) > 0){
        $files = $_FILES['file']['name'];
        $meta = $_POST;
        foreach ($files as $key => $file) {
            $filename = basename($file);
            $random = rand(0, 222);
            $ext=pathinfo($filename,PATHINFO_EXTENSION);
            $file1= $_FILES['file']['tmp_name'][$key];  
            $new_file_name = "pic_". $random . time().'.'.$ext;
            $destination = $meta['targetPath'] . $new_file_name;
            // mysql_query("INSERT INTO prova (gruppo, img) VALUES ('$name', '$file')") or die(mysql_error());
            $move = move_uploaded_file( $file1 , $_SERVER['DOCUMENT_ROOT'] . $destination );
            $result[] = array(
                "name" => $new_file_name
            );
        };
        if($move){
                echo json_encode($result);
                // echo json_encode(array('status' => 'success', 'message' =>'File is valid, and was successfully uploaded'));                
        } else {
                echo json_encode(array('status' => 'failure', 'message' =>'Upload failed'));                            
        }
    }
    else
    {
        echo json_encode(array('status' => 'failure', 'message' =>'Select File'));    
    }
?>