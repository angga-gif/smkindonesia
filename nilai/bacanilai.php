<?php
	session_start();
	if(isset($_SESSION['username'])){
		include '../koneksi.php';
	}else{
	   header("location:index.php");
	}
?>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="../style.css">
</head>
<body>
   <h2>Manajemen Nilai</h2>
      <hr>
      <center><input type="button" value="Tambah Data" onClick="location.href='tambahnilai.php'"></center>
      <br>
		<table border='1' cellspacing="0" cellpadding='5'>
		<tr>
			<th>No</th>
			<th>Kode Nilai</th>
			<th>NIS</th>
			<th>Nama Guru</th>
			<th>Nama Jurusan</th>
			<th>Nama Kelas</th>
			<th>Nama Mapel</th>
			<th>TUGAS</th>
			<th>UTS</th>
			<th>UAS</th>
			<th>NA</th>
			<th>Aksi</th>
		</tr>
		<?php
			$no=1;
			$sql = "SELECT * FROM nilai n,siswa s,guru g, jurusan j,kelas k, mapel m WHERE n.kdguru=g.kdguru AND n.kdjurusan=j.kdjurusan AND n.kdkelas=k.kdkelas AND n.kdmapel=m.kdmapel AND n.nis=s.nis";
			$query= mysqli_query($db_link,$sql);
			while($data = mysqli_fetch_array($query))
				{
				echo"
				<tr>
					<td>$no</td>
					<td>$data[kdnilai]</td>
					<td>$data[nis]</td>
					<td>$data[namaguru]</td>
					<td>$data[namajurusan]</td>
					<td>$data[namakelas]</td>
					<td>$data[namamapel]</td>
					<td>$data[uh]</td>
					<td>$data[uts]</td>
					<td>$data[uas]</td>
					<td>$data[na]</td>		
					<td>
						<a href='editnilai.php?id=$data[kdnilai]'>EDIT</a> |
						<a href='hapusnilai.php?id=$data[kdnilai]'>HAPUS</a>
					</td>
				</tr>
				";
				$no++;
				}
		?>
		</table>
</body>
</html>