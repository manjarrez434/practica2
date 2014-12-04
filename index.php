<?php
	require 'templates/login.php';
	require 'class/Login.php';
	
	$login = new Login();
	$login->loginFormulario();
?>