<?php
	//1. FUNCION CONTROLLER: Establecer la ruta de archivos controller
	//2. FUNCION VIEW: Establecer la ruta de archivos view
	
	function view($plantilla, $variables = array()){
		extract($variables);
		require('views/'.$plantilla.'.tpl.php');
	}
	//Pagina que se quiere desplegar
	function controller($nombre){
		if(empty($nombre))
			$nombre = 'home';
		
		$archivo = "controllers/$nombre.php";
		
		if(file_exists($archivo))
			require($archivo);
		else
			echo"Error, archivo no encontrado";	
	}
?>