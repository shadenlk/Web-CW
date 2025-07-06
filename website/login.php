<?php
include('db_connect.php');

	/* Login form code references:
	https://www.tutorialspoint.com/php/php_mysql_login.htm
	https://www.javatpoint.com/php-mysql-login-system */
	
	//Conditional that checks form submition
    if(isset($_POST['login_submit'])) {
		
        $EMP_Email = $_POST['Email'];
        $EMP_ID = $_POST['EmployeeID'];
		
		//SQL query and query execution/retrieval
        $sql = "SELECT * FROM employee WHERE EMP_Email = '$EMP_Email' and EMP_ID = '$EMP_ID'";  
        $result = mysqli_query($conn, $sql);  
        $row = mysqli_fetch_array($result, MYSQLI_ASSOC);
		
        $count = mysqli_num_rows($result);

		//Redirect user after successful input that macthes records
        if ($count == 1) {  
            header("location: welcome.php");
		}else {	
         $error = "Your Login Name or Password is invalid";
		}	
			
	}
?>