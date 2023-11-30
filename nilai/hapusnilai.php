<?php
	include "../koneksi.php";
	
	$id = $_GET['id'];
	$sql = "DELETE FROM nilai WHERE kdnilai = '$id'";
	$query = mysqli_query($db_link,$sql);
	if($query)
	{
	header('location:bacanilai.php');
	}
	else
	{
	echo "hapus nilai Gagal";
	}
?>