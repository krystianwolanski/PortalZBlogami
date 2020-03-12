<!doctype html>
<html lang="pl">
  <head>
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<!-- Style CSS-->
	<link href="https://fonts.googleapis.com/css?family=Lato:400,400i,700,900&display=swap&subset=latin-ext" rel="stylesheet"> 
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
	
    <title>Hello, world!</title>
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	<script>
	
		function remove_class_without(s_class){
			var ids = ["#wszystkie_blogi","#moje_blogi"];
			
			for(i=0;i<ids.length;i++){
				if(ids[i]!=s_class){
					$(ids[i]).removeClass("active");
				}
			}
		}
		$(document).ready(function(){
			$("#wpisy").load("pokaz_wszystkie_blogi.php");
			$("#wszystkie_blogi").click(function(){
				$("#wszystkie_blogi").addClass("active");
				remove_class_without("#wszystkie_blogi");
				$("#wpisy").load("pokaz_wszystkie_blogi.php");
			});
			$("#moje_blogi").click(function(){
				$("#moje_blogi").addClass("active");
				remove_class_without("#moje_blogi");
				$("#wpisy").load("moje_blogi.php");
			});
		});
	</script>
	

  </head>
  <body >
	
	<header class="sticky-top">
		<nav class="navbar navbar-light bg-light justify-content-beetwen">
			<a class="navbar-brand ml-3">Brand</a>
			<form class="form-inline">
				<input class="form-control mr-sm-2 " type="search" placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
	  
	<?php
		SESSION_START();
			
		echo "<div class='przyciski mr-2 dropdown'>
					<a href='dodaj_wpis.php'><button type='button' class='btn btn-primary mr-3'>+ Dodaj wpis</button></a>
				  ";
			
		if(isset($_SESSION['zalogowany']) and $_SESSION['zalogowany']==true){

			echo
				"<a href='wylogowanie.php'>
					<button type='button' class='btn btn-outline-success'>Wyloguj</button>
				</a></div>";
		}
		else{
			echo 
				"<button type='button' class='btn btn-success dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>
					Zaloguj
				</button>
				<div class='dropdown-menu dropdown-menu-right'>
  
					<form class='px-4 py-3' action='zaloguj.php' method='post'>
						<div class='form-group'>
						  <label for='exampleDropdownFormEmail1'>Login</label>
						  <input name='login' type='text' class='form-control' id='exampleDropdownFormEmail1' placeholder='Login'>
						</div>
					<div class='form-group'>
					  <label for='exampleDropdownFormPassword1'>Hasło</label>
					  <input name='password' type='password' class='form-control' id='exampleDropdownFormPassword1' placeholder='Hasło'>
					</div>
					<div class='form-group'>
					  <div class='form-check'>
						<input type='checkbox' class='form-check-input' id='dropdownCheck'>
						<label class='form-check-label' for='dropdownCheck'>
						  Zapamiętaj
						</label>
					  </div>
					</div>

					<button type='submit' class='btn btn-primary'>Zaloguj</button>";
					
					if(isset($_SESSION['blad']))
						echo $_SESSION['blad'];
					
						echo "
					</form>
				  
					<div class='dropdown-divider'></div>
					<a class='dropdown-item' href='#'>Nowy? Zarejestruj się</a>
					<a class='dropdown-item' href='#'>Zapomniałeś hasła?</a>
				</div>
			  
			</div>";
			}
	  ?>
	  
		</nav>
	</header>

	<main>	
	
		<header>
			<div class="navbar nawigacja-bar bg-dark ">
				<nav class="nav nav-pills justify-content-center py-2 mx-auto">
					<a id="wszystkie_blogi" class="nav-item nav-link active h5" href="#">Blogi</a>
					 <a id="moje_blogi" class="nav-item nav-link h5" href="#">Moje blogi</a>
					 <a class="nav-item nav-link h5" href="#">Subskrybowane</a>
					 <a class="nav-item nav-link h5" href="#">Ulubione</a>
				</nav>
				<div class="dropdown mr-3 position-absolute sort">
					  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Sort by
					  </button>
					  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="#">Action</a>
						<a class="dropdown-item" href="#">Another action</a>
						<a class="dropdown-item" href="#">Something else here</a>
					  </div>
				</div>
			</div>
		</header>
		
		<div class="container-fluid">
			<div class="row justify-content-center mt-5">
				<div class='col-sm-12'>
					<div id="wpisy" class='card-columns'>
					
					</div>
				</div>
			</div>
		</div>
		
		
	</main>

	



  </body>
</html>