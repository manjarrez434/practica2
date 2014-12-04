<?php
	class Login{
		private $user;
		private $password;
		private $status;
		
		public function loginFormulario(){
			echo"<div class=table-responsive>";
			echo"<table class=\"table table-striped\">";
			echo"<form id=frmdo name=frmdo>";
			echo"<tr><td>Usuario:</td><td><input type=text name=usuario></td>";
			echo"<tr><td>Contraseña:</td><td><input type=password name=password></td>";
			echo"<tr><td colspan=2 align='center'><input type=submit name=Entrar value=Entrar id=Entrar></td></tr>";
			echo"</table>";
			echo"</div>";
			echo"</form>";
						echo"<div id=ajax></div>";
			echo'<script type="text/javascript">
					$(function(){
					   $("#Entrar").click(function(){
							$.ajax({
								   type: "POST",
								   url: "class/valida.php",
								   data: $("#frmdo").serialize(),
								   success: function(data)
								   {
									   $("#ajax").html(data); 
								   }
								 });
							return false; 
						});
					});
				</script>';
		}
		
		public function validarUsuario($getuser,$getpassword){
			$sql="CALL validateLogin('$getuser','$getpassword')";
			$consulta=mysql_query($sql) or die ("Error al validar informacion");
			$cuantos=mysql_num_rows($consulta);
				if($cuantos>0){
					$estatus=mysql_result($consulta,0,'Estatus');
					if($estatus==1){
						$id=mysql_result($consulta,0,'Id');
						echo"<form method='POST' action='class/login2.php' name='frm'>";
							echo"<input type='hidden' name='_id' value=$id>";										
						echo"</form>";
						echo"<script language='JavaScript'>document.frm.submit();</script>";
						}
					else{
						echo"<div class='alert alert-warning' role='alert'><center><b>USUARIO INACTIVO</b></center></div>";
					}
				}
				else{
					echo"<div class='alert alert-danger' role='alert'><center><b>DATOS INCORRECTOS</b></center></div>";
				}
		}
		
		public function accesoSistema(){
			$id=$_POST['_id'];
			
			session_start();
            $_SESSION['clave']=$id;
            if($id!="" ){
				print"<meta http-equiv='refresh' content='0; url=../inicio.php'>";
			}
            else{
				print "<meta http-equiv='refresh' content='0; url=../index.php'>";
			}
        }

        public function brindarSeguridad()
        {
            session_start();
            @$usuario_id2=$_SESSION['clave'];
            if($usuario_id2=="")
            {
                print"<meta http-equiv='refresh' content='0;url=index.php'>";
                exit;
            }
        }
	}//end class LOGIN
?>