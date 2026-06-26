<?php
$servername = "localhost";
$username = "root"; 
$password = ""; 
$dbname = "portfolio_db"; 

// Create connection using object-oriented mysqli
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    error_log("Connection failed: " . $conn->connect_error);
    die("A database connection error occurred. Please try again later.");
}

// Set charset to utf8mb4 for security and full character support
$conn->set_charset("utf8mb4");
?>