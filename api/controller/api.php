<?php

class R_api {
    protected $method = '';
    protected $endpoint = '';
    protected $params = array();
    protected $file = null;

    public function __construct(){
        $this -> _input();
        $this -> _process_api();
    }

    // vd: GET GET http://api.domain.com/user/<user_id>/<some_other_param>
    // endpoint --> user
    // params --> các tham số phía sau
    // lấy endpoint và params bằng hàm input
    private function _input(){
        
        
        $this->params = explode('/', trim($_SERVER['PATH_INFO'],'/'));
        $this->endpoint = array_shift($this->params);

        //lấy method của request
        $method       = $_SERVER['REQUEST_METHOD'];
        $allow_method = array('GET', 'POST', 'PUT', 'DELETE');

        if (in_array($method, $allow_method)){
            $this->method = $method;
        }

        //nhận thêm dữ liệu tương ứng theo từng loại method
        switch ($this->method){
            case 'POST': $this->params = $_POST;
            break;
            case 'GET': //đã lấy thẳng từ url nên không cần nhận
            break;
            case 'PUT': $this->file = file_get_contents("php://input");
            break;
            case 'DELETE': //đã lấy thẳng từ url nên không cần nhận
            break;
            default: $this->response(500, "Invalid Method");
            break;
        }
    }
    
    private function _process_api(){
        if(method_exists($this, $this->endpoint)){
            $this->{$this->endpoint}();
        }
        else{
            $this->response(500, "Unknown endpoint");
        }
    }
    /**
    * Trả dữ liệu về client
    * param: $status_code: mã http trả về
    * param: $data: dữ liệu trả về
    */
    protected function response($status_code, $data = NULL){
        // header($this->_build_http_header_string($status_code));
        // header('Content-Type: application/json; charset = utf-8;');
        // echo json_encode($data);
        // die();

        header('content-type: application/json');
        echo json_encode($data);
        die();
        // mysqli_close($connect);
    }
    
    /**
     * Tạo chuỗi http header
     * param: $status_code: mã http
     * return: Chuỗi http header, ví dụ: HTTP/1.1 404 Not Found
    */
    private function _build_http_header_string($status_code){
        $status = array(
            200 => 'OK',
            404 => 'Not Found',
            405 => 'Method not allowed',
            500 => 'Internal Server Error'
        );
        return "HTTP/1.1" . $status_code . " " . $status[$status_code];
    }
}

?>