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
	if (isset($_POST["submit"]))
	{	
		$query = "SELECT FN, LN FROM buyer, buyer_endproduct, end_product WHERE buyer.BuyerID = buyer_endproduct.BEBuyerID AND buyer_endproduct.BEProductID = end_product.ProductID AND end_product.CommercialApplication = "YES" ";
		if($result = mysqli_query($conn,$query))
		{	
			while ($row = mysqli_fetch_assoc($result)) 
			{
				
				$first_name = $row["FN"];
				$last_name = $row["LN"];
				
				//echo "-Customer Name: " .$first_name."";
				
				echo "-Customer Name: " .$first_name. " - Last Name: ".$last_name." "; 
				echo "<br/><br/>";
			}
		}
		
		else
		{
			echo "Error fetching record: " . mysqli_error($conn);
		}
	}	
	
	else 
	{
		echo "<font color='red'>***SUBMIT SIGNAL WAS NOT DETECTED***</font><br/><br/>";
		die();
	}
}	

mysqli_close($conn);
?>