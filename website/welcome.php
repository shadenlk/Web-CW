<?php
	include('db_connect.php');
	
?>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <title>Interface</title>
	<link rel="stylesheet" type="text/css" href="welcomestyle.css">
	<script>
	<!-- Show contenants of maintenance and payments tables on button click. -->
		function showMaintenaceTable() {
					var MaintenaceTable = document.getElementById("MaintenaceTable");
					MaintenaceTable.style.display = "block";
				}
		function showPaymentsTable() {
			var PaymentsTable = document.getElementById("PaymentsTable");
			PaymentsTable.style.display = "block";
		}
	</script>
</head>

<body>
<div style = "margin: 2% 2%" class = "boarder" >
	<div style = "margin: 5%">
		<div class="container">
			<h1>Accommodation Services</h1>
			<h2>Welcome</h2>
		</div>
	</div>
	
    <section style = "margin: 5%">
            <div style="margin: auto" class="Bcontainer" align="left">
                <img src="maintenance.png" alt="">
                <button class="button" onclick="showMaintenaceTable()"><b>Maintenance Requests</b></button>
            </div>
			<div class="tablecontainerBG">
			<div class="table" id="MaintenaceTable" style="display: none;">
				<?php
					$sql = "SELECT R_Maintenance, RoomID, BuildingID FROM room WHERE R_Maintenance = 'Y'";
					$result = $conn->query($sql);

					if ($result->num_rows > 0) {
						echo "<table class='table'><tr>
								<th class='header-cell'>Maintenance</th>
								<th class='header-cell'>RoomID</th>
								<th class='header-cell'>BuildingID</th>
							  </tr>";
						while ($row = $result->fetch_assoc()) {
							echo "<tr><td>" . $row["R_Maintenance"] . "</td><td>" . $row["RoomID"] . "</td><td>". $row["BuildingID"] . "</td></tr>";
						}
						echo "</table>";
					} else {
						echo "0 results";
					}
				?>
			</div>
			</div>
	</section>
	<section  style = "margin: 5%">
		<div style="margin: auto" class="Bcontainer" align="left">
			<img src="pendingpayments.png" alt="">
			<button class="button" onclick="showPaymentsTable()"><b>Pending Payments</b></button>
		</div>

		<div class="tablecontainerBG">
			<div class="table" id="PaymentsTable" style="display: none;">
				<?php
					$sql = "SELECT URN, APP_Email, APP_PaymentStatus FROM account WHERE APP_PaymentStatus = 'Pending'";
					$result = $conn->query($sql);

					if ($result->num_rows > 0) {
						echo "<table class='table'><tr>
								<th class='header-cell'>Payment Status</th>
								<th class='header-cell'>URN</th>
								<th class='header-cell'>Email</th>
							  </tr>";
						while ($row = $result->fetch_assoc()) {
							echo "<tr><td>" . $row["APP_PaymentStatus"] . "</td><td>" . $row["URN"] . "</td><td>" . $row["APP_Email"] . "</td></tr>";
						}
						echo "</table> ";
					} else {
						echo "0 results";
						$conn->close();
					}
				?>
			</div>
		</div>
	</section>
</div>
</body>
