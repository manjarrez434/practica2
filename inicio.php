<?php
//require"class/seguridad.php";
	require 'templates/header.php';
	require 'bd/bd.php';
	require 'class/Preguntas.php';
?>
<?php
	require 'helpers.php';
	if(empty($_GET['url']))
		$_GET['url']='home';
		
	controller($_GET['url']);

$pregunta = new Preguntas();
$pregunta->cuestionario();
?>