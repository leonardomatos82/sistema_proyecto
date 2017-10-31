 <?php

include("conexion.php");
//include("controls/consulta_user.php");

$usuario = $_POST["usuario"];
//$clave = $_POST["clave"];
$clave = md5($_POST["clave"]);


 $query = "SELECT * FROM usuario WHERE login='$usuario' and clave='$clave';";
 $result = pg_query($query) or die('La consulta fallo: ' . pg_last_error());
 $row = pg_fetch_array($result);




if ($row["login"]==$usuario && $row["clave"]==$clave)
{
      session_start();
      $_SESSION["k_username"] = $row["nombre_usuario"];
      
      
	  echo '<script type="text/javascript">alert("Bienvenido '.$_SESSION['k_username'].'");</script>';
	  echo '<SCRIPT LANGUAGE="javascript">location.href = "inicio.php";</SCRIPT>';
}
else
{
	  echo '<script type="text/javascript">alert("Error: Usuario O clave incorrecto");</script>';
	  echo '<SCRIPT LANGUAGE="javascript">location.href = "index.php";</SCRIPT>';
}

	
?>
