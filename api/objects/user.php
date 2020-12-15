<?php
class User{
  
    // database connection and table name
    private $conn;
    private $table_name = "tbl_Taikhoan";
  
    // object properties
    public $email;
    public $username;
  
    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    // read object
    function read(){
      
        // select all query
        $query = "call SP_Timtaikhoan('');";
      
        // prepare query statement
        $stmt = $this->conn->prepare($query);
      
        // execute query
        $stmt->execute();
      
        return $stmt;
    }
    // create user
    function create(){
    
        // query to insert record
        $query = "INSERT INTO
                    " . $this->table_name . "
                SET
                    Email=:email, 
                    Tentaikhoan=:username, 
                    Matkhau=md5('123456')";
    
        // prepare query
        $stmt = $this->conn->prepare($query);
    
        // sanitize
        $this->email=htmlspecialchars(strip_tags($this->email));
        $this->username=htmlspecialchars(strip_tags($this->username));
    
        // bind values
        $stmt->bindParam(":email", $this->email);
        $stmt->bindParam(":username", $this->username);
    
        // execute query
        if($stmt->execute()){
            return true;
        }
    
        return false;
        
    }
}
?>