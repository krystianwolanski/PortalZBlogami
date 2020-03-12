<?php
	SESSION_START();
	
	session_unset();
	
	header('Location: index.php');
?>