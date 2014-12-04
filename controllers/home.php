<?php
	$titulo="Exámen";
	$contenido="Responda las preguntas correctamente.";
	
	$variables=array('titulo'=>$titulo,'contenido'=>$contenido);
	
	view('home',$variables);
	
	//$pregunta = new Preguntas();
	//$pregunta -> cuestionario();
?>