<?php

require './controller/api.php';
include_once './database/conn.php';

class api extends R_api{

    function __construct(){parent::__construct();}
    
    function post(){ include './models/post.php';}
    function user(){ include './models/user.php';}
    function follow(){ include './models/follow.php';}
    function plan(){ include './models/plan.php';}
    function comment(){ include './models/comment.php';}
    function image(){ include './models/image.php';}
    function likepost(){ include './models/likepost.php';}
    function hashtag(){ include './models/hashtag.php';}
    function login(){ include './models/login.php';}
    function postlike(){ include './models/postlike.php';}
    function city(){ include './models/city.php';}
    function postview(){ include './models/postview.php';}
    function place(){ include './models/place.php';}
    function imagebyuser(){ include './models/imagebyuser.php';}
}
    $api = new api();
?>