<?php
	
	SESSION_START();
	
	require_once "connect.php";
	
	$polaczenie = @new mysqli($host, $db_user, $db_password, $db_name);
	
	if($polaczenie->connect_errno)
	{
		
		 die('Error: '.$polaczenie->connect_errno);
	}
	else
	{
			$login = $_POST['login'];
			$haslo = $_POST['password'];
			
			$sql = "SELECT * FROM uzytkownicy where login='$login' AND password='$haslo'";
			
			
			
			if($rezultat = $polaczenie->query($sql))
			{
				$ilu_userow = $rezultat->num_rows;
				if($ilu_userow>0)
				{
					$_SESSION['zalogowany'] = true;
					$wiersz = $rezultat->fetch_assoc();
					$_SESSION['user'] = $wiersz['login'];
					$_SESSION['id'] = $wiersz['id'];
					
					unset($_SESSION['blad']);
					$rezultat->free_result();
					
					header('Location: index.php');
				}
				else
				{
					$_SESSION['blad'] = "<span style='color:red'>Nieprawidłowy login lub hasło!</span>";
					header('Location:index.php');
				}
				
			}
			
			
			
			
			$polaczenie->close();
	}
	
?>