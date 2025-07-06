<?php
include('db_connect.php');
include('login.php');
?>

<!DOCTYPE html>
<html lang="en-US">
<head>
    <title>Accommodation Staff Login</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	
	<!-- JS Makes sure that either Email or ID feilds arent empty -->
	<script>
    function isvalid() {
        var Email = document.forms["form"]["Email"].value;
        var EmployeeID = document.forms["form"]["EmployeeID"].value;

        if (Email.length == 0 || EmployeeID.length == 0) {
            alert("Email and Employee ID must not be empty");
            return false;
        }
        return true;
    }
	</script>
</head>
<body>
<div style = "margin: 2% 2%" class = "boarder">
	<div style = "margin:50px">
		<h1>Accommodation Services Staff Login</h1>
		<h2>Input Login credentials</h2>
	</div>

	<div>
		<form name="form" action="" method="post" onsubmit="return isvalid()">  
			<div class="container">
			
				<label>Email : </label><br>
				<input type="text" placeholder="Enter Email" name="Email" ><br>
				
				<label>EmployeeID : </label><br>
				<input type="password" placeholder="Enter Employee ID" name="EmployeeID" ><br>
				
				<button type="submit" name="login_submit">Login</button>   
			</div>					
		</form> 
	</div>	
		<div style="margin:20px" class="error" align="center"> 
			<?php echo isset($error) ? $error : ''; 
			$conn->close();
			?> 			
		</div>
	</div>
</body>
</html>
