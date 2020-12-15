<?php

class connection  {
    var $host = 'localhost';
    var $user = 'root';
    var $pass = 'admin';
    var $data = 'reviewthucpham';
    var $mydb;

    function connect() {
        $con = mysqli_connect($this->host, $this->user, $this->pass, $this->data);
        if (!$con) {
            die('Could not connect to database!<br>');
        } else {
            $this->mydb = $con;
            echo 'Connection established!<br>';
        }
        return $this->mydb;
    }

    function close() {
        mysqli_close($this->mydb);
        echo '<br>Connection closed!';
    }

}

?>