

<?php
    $connect = mysqli_connect("localhost","root","ncph3008105","reviewthucpham");

    // Check connection
    if (mysqli_connect_errno()) {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
    exit();
    }
?>