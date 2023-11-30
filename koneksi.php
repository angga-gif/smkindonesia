<?php
	
	$host ="localhost";
	$user_name ="root";
	$password ="smk";
	$database_name ="smkindonesia";
	$port ="3309";
	$db_link =mysqli_connect($host,$user_name,$password,$database_name,$port);
	if(!$db_link) {
		echo"Gagal Terhubung ke Server";
		}
?>
