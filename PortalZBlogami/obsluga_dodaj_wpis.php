<?php
	SESSION_START();
	require_once "connect.php";
	
	$polaczenie = new mysqli($host, $db_user, $db_password, $db_name);
	$link = mysqli_connect($host, $db_user, $db_password, $db_name);
	
	$polaczenie -> query ('SET NAMES utf8');
	$polaczenie -> query ('SET CHARACTER_SET utf8_polish_ci');
		
	if($polaczenie->connect_errno)
	{
		
		die('Error: '.$polaczenie->connect_errno);
	}
	else{
		
		$file = $_FILES['file'];
		$fileName = $_FILES['file']['name'];
		$fileTmpName = $_FILES['file']['tmp_name'];
		$fileSize = $_FILES['file']['size'];
		$fileError = $_FILES['file']['error'];
		$fileType = $_FILES['file']['type'];
		
		//list($width, $height) = getimagesize($fileTmpName);

		$fileExt = explode('.', $fileName); // Robi tablice. Kropka to separator
		$fileActualExt = strtolower(end($fileExt));
		
		$allowed = array('jpg','jpeg','png','pdf');
		
		if(in_array($fileActualExt, $allowed)){
			if($fileError === 0) { // 3 razy = znaczy ze jest rowna i jest tego samego typu
				if($fileSize < 1000000){
					$fileNameNew = uniqid('',true).".".$fileActualExt;
					$fileDestination = 'img/'.$fileNameNew;
					move_uploaded_file($fileTmpName,$fileDestination);
					
				} else {
					echo "Your file is too big!";
				}
			} else {
				echo "Wystąpił błąd przy próbie wysłania pliku";
			}
		} else{
			echo "You cannot upload files of this type";
		}
		
		//STWORZENIE PLIKU WPISU
		
		$info = getdate();

		$current_date = date('d.m.Y');
		
		$filename = uniqid('',true).".php";
		$file_path = "wpisy/".$filename."";
		$fp = fopen($file_path,"w");
		fwrite($fp,
		"<!doctype html>
			<html lang='pl'>
			  <head>
				<!-- Required meta tags -->
				<meta charset='utf-8'>
				<meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>

				<link rel='stylesheet' href='../style.css'>
				<!-- Bootstrap CSS -->
				<link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>

				<title>Hello, world!</title>
			  </head>
			  <body class='wpis_body'>
				<header class='wpis-header' style='background:linear-gradient( rgba(0, 0, 0, 0.35), rgba(0, 0, 0, 0.35) ),url(../".$fileDestination.");'>
					<div class='tytul-wpisu'>
						<h1>".$_POST['tytul']."</h1>
						<div class='podpis'>
							<h5>".$_SESSION['user']."</h5>
							<h6>".$current_date."</h6>
						</div>
					</div>
				</header>
				
				<main>
					<div class='container wpis p-5'>
						".$_POST['tresc']."
						
					</div>
				</main>

				
				<!-- Optional JavaScript -->
				<!-- jQuery first, then Popper.js, then Bootstrap JS -->
				<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>
				<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js' integrity='sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1' crossorigin='anonymous'></script>
				<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js' integrity='sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM' crossorigin='anonymous'></script>
			  </body>
		</html>"
		
		
		);
		
		fclose($fp);
		
		////////////////////////////////
		
		$sql = "INSERT INTO wpisy(id, tytul, opis, tresc, id_user, image_path, file_tresc_path) VALUES ('NULL','".$_POST["tytul"]."','".$_POST["opis"]."', '".$_POST["tresc"]."','".$_SESSION['id']."', '".$fileDestination."', '".$file_path."')";
		
		if($polaczenie->query($sql)){
			echo "success";
			
			echo $_POST['editor1'];
			header("Location:index.php");
		
		}
		else{
			echo "ERROR";
			
		}
		
	}
	
?>