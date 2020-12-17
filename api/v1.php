<?php

require './controller/api.php';

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
}
    $api = new api();
?>