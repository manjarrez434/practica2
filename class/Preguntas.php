<?php
	class Preguntas{
	
		public function cuestionario(){
			echo"<form id='frmdo' name='frmdo'>";
				$sql = "SELECT id_pregunta,pregunta FROM preguntas ORDER BY RAND() LIMIT 10";
				$consulta = mysql_query($sql) or die ("Error al mostrar preguntas".mysql_error());
				echo"<table class=\"table table-striped\">";
					echo"<tr><td colspan='3'>Pregunta</td></tr>";
					//$cuantos = mysql_num_rows($consulta);
					for($i = 0; $i < 10; $i++){
						$id = mysql_result($consulta,$i,'id_pregunta');
						$pregunta = mysql_result($consulta,$i,'pregunta');
						$num= $i+1;
						echo"<tr><td>".$num.".- $pregunta</td>";
						echo"<td><input type='radio' name='_respuesta".$i."' value='1'> Si</td>
								<td><input type='radio' name='_respuesta".$i."' value='2'> No</td>
								<input type='hidden' name='_idpregunta".$i."' value='$id'>
							</tr>";
					}
				echo"</table>";
				echo"<center><input type='submit' class='btn btn-success' value='Evaluar' id='Evaluar'></center>";
			echo"</form>";
			echo"<div id='resultado'></div>";
			echo'<script type="text/javascript">
					$(function(){
						$("#Evaluar").click(function(){
						//alert($("#frmdo").serialize());
							$.ajax({
								   type: "POST",
								   url: "class/Resultado.php",
								   data: $("#frmdo").serialize(),
								   success: function(data)
								   {
									   $("#resultado").html(data);
								   }
							});
							return false;
						});
					});
				</script>';
		}
		
		public function preguntasResultado($_claveUsuario){
            $total = 0;
            for($i = 0; $i < 10; $i++)
            {
                if($_POST)
                {
                    if(empty($_POST["_respuesta$i"]))
                    {$respuesta = "3";}
                    else
                    {$respuesta = $_POST["_respuesta$i"];}
                    $idpregunta = $_POST["_idpregunta$i"];
                }
                $sql="SELECT id_pregunta FROM preguntas WHERE id_pregunta = $idpregunta AND respuesta = '$respuesta'";
                $consulta=mysql_query($sql) or die ("Error".mysql_error());
                //echo"$sql<br>";
                $num_resul=mysql_num_rows($consulta);
                if($num_resul > 0)
                    $total = $total + 1;
            }
            $sqlAciertos="SELECT calificacion FROM usuario WHERE Id = $_claveUsuario";
            $consultaAciertos=mysql_query($sqlAciertos) or die ("Error al actualizar nuevos aciertos".mysql_error());
            $aciertosActuales=mysql_result($consultaAciertos,0,'calificacion');
            if($total > $aciertosActuales)
            {
                if($total >= 8)
                {
                    $sqlUpdate="CALL actualizarAciertos('$total',$_claveUsuario)";
                    $consultaUpdate=mysql_query($sqlUpdate) or die ("Error al actualizar aciertos".mysql_error());
                    echo"<div class='alert alert-success' role='alert'><strong>FELICIDADES:</strong> Haz aprobado el examen. Tus aciertos han sido actualizados en el sistema.</div>";

                }
                else
                {
                    $sqlUpdate="CALL actualizarAciertos('$total',$_claveUsuario)";
                    $consultaUpdate=mysql_query($sqlUpdate) or die ("Error al actualizar aciertos".mysql_error());
                    echo'<div class="alert alert-warning alert-dismissible" role="alert">
                  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                  <strong>LO SENTIMOS: Haz reprobado el examen.</strong>
                </div>';
                }
            }
            else
            {

                echo'<div class="alert alert-warning alert-dismissible" role="alert">
                  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                  <strong>LO SENTIMOS: Haz reprobado el examen.</strong>
                </div>';
            }
		}
		
		
	}//end PREGUNTAS

?>