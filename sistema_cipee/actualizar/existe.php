<?
$cedula=$_POST[cedula];
include("../config.php");
include("../utils.php");
include("../la_ip.php");
if ($cedula==''){
 header("Location: buscar.php");
}else{

$result = pg_query($con, "select * from datos where cedula='".$cedula."'"); 

$row=pg_fetch_array($result);

 if (($row['cedula']==$cedula))
  { header("Location: ../consulta/ver_rep_autenticacion.php?id=$cedula");}else {
	
   
    
header("Cache-control: private"); // Arregla IE 6
 header("Location: Mdatos.php?id=$cedula");

	 }
	}  

?>      
