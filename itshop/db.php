<?php

$hostname = 'localhost';
$username = 'root';
$password = '';
$dbname = 'itshop';


$conn = mysqli_connect($hostname,$username,$password,$dbname)
        or die('Gagal terhubung kedatabase');

?>