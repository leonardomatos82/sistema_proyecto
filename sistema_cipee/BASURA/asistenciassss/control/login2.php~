<?
$login=$_POST[login];
$clave=$_POST[password];
include("../config.php");
include("../utils.php");
$result = pg_query($con, "select * from acceso where login='".$login."' and clave='".$clave."'"); 

$row=pg_fetch_array($result);

 if (($_POST[login]=="") || ($_POST[password]=="") )
  { header("Location: ../index.php");}else {
	
   if (($_POST[login]==$row[login]) && ($_POST[password]==$row[clave]) )
    {
    session_start();
header("Cache-control: private"); // Arregla IE 6
    
         $_SESSION['estado'] = "logeado";
		   $_SESSION['login'] = $row[login];	
		   $_SESSION['clave'] = $row[clave];	
		    $_SESSION['dpto'] = $row[id_dpto];	
		   $_SESSION['nomb_usuario'] = $row[nomb_usuario];
                   $_SESSION['tipo'] = $row[tipo];					  
		   header("Location: ../menu.php?titulo=MENU PRINCIPAL");
		   	    /////////////////////////////
$valor="-Operacion: Entrar al sistema";
        registrarOperacion($con,$_SESSION['login'],$valor);      
///////////////////////////////////////////////////////////////////  
			
	 }
	  else 
	 {
include("../config.php");
include("css2.php");
		//header("Location: $HTTP_REFERER");
      //	exit;
	 }
 }
?>      