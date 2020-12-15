<?php

require './controller/api.php';

class api extends R_api{

    function __construct(){parent::__construct();}

    function post(){ include './models/post.php';}
    function user(){ include './models/user.php';}
    function follow(){ include './models/follow.php';}
}

    $api = new api();
?>