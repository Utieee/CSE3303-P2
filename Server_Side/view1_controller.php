<?php

$host = "localhost";
$dbusername = "root";
$dbpassword = "";
$dbname="renim";

//Create Connection
$conn = mysqli_connect($host, $dbusername, $dbpassword, $dbname);

//check Connection
if(!$conn)
{
	die("Connection failed");
}	

//start processing

else
{
	$scid = filter_input(INPUT_POST,'cid');
	
	if (isset($_POST["submit"]))
	{	
	
		$query = "SELECT FN, LN,Items FROM buyer_endproduct_info". mysqli_real_escape_string($conn,$scid) ."'";
		$result = mysqli_query($conn,$query);
			
		if (mysqli_num_rows($result) > 0) 
		{
			while ($row = mysqli_fetch_assoc($result)) {
		
				$first_name = $row["FN"];
				$last_name = $row["LN"];
				$items = $row["Items"];
				
				echo "-Customer Name: " .first_name. " - Last Name: ".last_name." - NumberOfReturn Items: " .items.""; 
				
			}
			
		else 
		{
			echo "<font color='red'>***NO RESULTS***</font><br/><br/>";
			die();
		}
		
	}	
}	

mysqli_close($conn);
?>