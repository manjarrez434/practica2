<?php
require"seguridad.php";
$claveUsuario = $_SESSION["clave"];
	require 'Preguntas.php';
	require"../bd/bd.php";
	$pregunta = new Preguntas();
	$pregunta->preguntasResultado($claveUsuario);
?>