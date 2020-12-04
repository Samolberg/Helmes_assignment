<?php
//MySQL Database
$servername = "localhost";
$username = "root";
$password = "qwerty";
$datab = "proovitoo";

// Create connection
$conn = new mysqli($servername, $username, $password, $datab);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}





