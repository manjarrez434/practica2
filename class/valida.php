<?php
	if($_POST){
		$usuario = $_POST['usuario'];
		$password = $_POST['password'];
	}
	//echo"$usuario<br>$password ";	
	require '../bd/bd.php';
	require 'Login.php';
	
	$login = new Login();
	$login->validarUsuario($usuario,$password);
?>