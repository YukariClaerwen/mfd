<?php

$link = mysqli_connect("127.0.0.1", "root","ncph3008105", "Reviewthucpham");

if (!$link) {
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    exit;
}


?>