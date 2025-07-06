<!--  PHP code for connecting to the MySQL database -->
<?php
$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "accom";
$port = "3306"; 

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
?>