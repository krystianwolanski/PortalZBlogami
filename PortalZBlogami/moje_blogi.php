<html>
	<head>
		<link rel="stylesheet" href="style.css">
	</head>
<?php
	SESSION_START();
	require_once "connect.php";

	$polaczenie = new mysqli($host, $db_user, $db_password, $db_name);
	$polaczenie -> query ('SET NAMES utf8');
	$polaczenie -> query ('SET CHARACTER_SET utf8_polish_ci');
		
	if($polaczenie->connect_errno)
	{
		
		 die('Error: '.$polaczenie->connect_errno);
	}
	else{

		$sql = "SELECT w.date, w.tytul, w.opis, w.tresc, w.image_path, u.login FROM wpisy AS w INNER JOIN uzytkownicy AS u ON w.id_user = u.id WHERE w.id_user=".$_SESSION['id']." ORDER BY w.id DESC ";
		
		if($rezultat = $polaczenie->query($sql)){
			$ile_wynikow = $rezultat->num_rows;
			if($ile_wynikow>0){
				while($wiersz = $rezultat->fetch_assoc()){
					$user = $wiersz['login'];
					$tytul = $wiersz['tytul'];
					$opis = $wiersz['opis'];
					$tresc = $wiersz['tresc'];
					$date = $wiersz['date'];
					$img_path = $wiersz['image_path'];
					$date = date("d.m.Y", strtotime($date));
					
			
					echo
					"<div class='card'>
						<img id='img' src=' ".$img_path."' class='card-img-top' alt='...'>
							<div class='card-body'>
								<div class='top pb-4 d-flex justify-content-between'>
									<div class='author '>".$user."</div>
										<div class='date '>".$date."</div>
									</div>
									<h5 class='card-title'>".$tytul."</h5>
									<p class='card-text'>".$opis."</p>
							</div>
							<ul class='list-group list-group-flush text-center'>
								<li class='list-group-item'>Likes 124
								<i class='far fa-heart pl-4' style='font-size:23px;'></i>
								</li>
							</ul>
					</div>";

				}
					
				}
			}
			$rezultat->free_result();
		}
	

?>
</html>