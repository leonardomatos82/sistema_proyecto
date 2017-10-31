 <?php

include("conexion.php");


$usuario = $_POST["usuario"];
$clave = $_POST["clave"];
$clave = md5($_POST["clave"]);
// Conectar (se detendrá la ejecución si se produce un error) - * RELLENA LOS DATOS QUE FALTAN *:
	$conexion = conectar_PostgreSQL( "postgres", "12345", "localhost" );


// Crea usuario
	$ok = crear_user( $conexion, $usuario, $clave);
  
  if ($ok==''){
echo $sql; 
	}else{
		  echo '<script type="text/javascript">alert("El usuario fue creado con exito");</script>';
          echo '<SCRIPT LANGUAGE="javascript">location.href = "index.php";</SCRIPT>';
	}
?>
