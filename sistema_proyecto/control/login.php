<?
$login=$_POST[login];
$clave=$_POST[password];
include("../config.php");
include("../utils.php");
include("../la_ip.php");
$clave=sha1($_POST[password]);
$result = pg_query($con, "select * from acceso where login='".$login."' and clave='".$clave."'"); 

$row=pg_fetch_array($result);




 echo "/".$row[clave];
 if (($_POST[login]=="") || ($_POST[password]=="") )
  { header("Location: ../index.php");}else {
	
   if (($_POST[login]==$row[login]) && ($clave==$row[clave] )&& $row[estado]=='ACTIVO')
    {
    session_start();
header("Cache-control: private"); // Arregla IE 6
    
                   $_SESSION['estado_proyecto'] = "logeado";
		   $_SESSION['login'] = $row[login];	
		   $_SESSION['clave'] = $clave;	
		   $_SESSION['nomb_usuario'] = $row[nomb_usuario];
                   $_SESSION['tipo'] = $row[tipo];	
                   $_SESSION['ip']=  $ip_real;				  
		   header("Location: ../menu.php?titulo=MENU PRINCIPAL");


///////////////////////////////////////////////////////////////////
$valor="-Operacion: Entrar al Sistema";
registrarOperacion($con,$_SESSION['login'],$valor,$ip_real);      
///////////////////////////////////////////////////////////////////  
	 }
	  else 
	 {
include("../config.php");
include("css.php");
///////////////////////////////////////////////////////////////////
$valor="-Operacion: Error de Acceso";
 registrarOperacion($con,$_POST[login],$valor,$ip_real);      
///////////////////////////////////////////////////////////////////  
		//header("Location: $HTTP_REFERER");
      //	exit;
	 }
 }
?>      
