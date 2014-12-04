	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.html"><b>EXÁMEN</b></a>
        </div>
        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i>Alumno   <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li class="divider"></li>
                    <li><a href="./class/cerrar.php"><i class="fa fa-sign-out fa-fw"></i> Cerrar Sesión</a></li>
                </ul>
            </li>
        </ul>
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
					<li class="sidebar-search">
						<center>
							<div class="input-group custom-search-form">
								<img src="bootstrap/images/user.jpg" width='160px' height='150px' align='center'><p><br></p>
									<?php
										//$id_usuario = $_POST['id_usuario'];
                                    require"./class/seguridad.php";
                                    $claveUsuario = $_SESSION["clave"];
										require("bd/bd.php");
										$sql="SELECT CONCAT(Nombre, ' ' ,ApellidoPaterno, ' ' ,ApellidoMaterno) AS ncompleto FROM usuario WHERE id = $claveUsuario";//$id_usuario
										$consulta=mysql_query($sql) or die ("Error mostrar usuario".mysql_error());
										$ncompleto=mysql_result($consulta,0,'ncompleto');
										echo"<b>USUARIO</b><p><br></p><h5>$ncompleto.</h5>
							</div>
						</center>
                    </li>
					<li>";

						$sql2="SELECT calificacion FROM usuario WHERE id = $claveUsuario";//$id_usuario
						$consulta2=mysql_query($sql2) or die ("Error al mostrar aciertos".mysql_error());
						$calificacion=mysql_result($consulta2,0,'calificacion');
							if($calificacion >= 8){
								echo"<div class='alert alert-success' role='alert'><center><b>CALIFICACIÓN</b><br>$calificacion aciertos</center></div>";
							}
							else{
								echo"<div class='alert alert-danger' role='alert'><center><b>CALIFICACIÓN</b><br>$calificacion aciertos</center></div>";
							}
						?>
					<br style="line-height:200px"/><center>PROGRAMACION DE APLICACIONES<br><b>Iliana Arellano Cruz</b><br>TIC 71</center></li>
                </ul>
            </div>
        </div>
    </nav>
