<?php
session_start();
//include("../control/valida.php"); 
//include("../css.php");
include("../config.php");
//include("../utils.php");
 header("Location: ver_anularacceso.php"); 
?> 

          <?php
$id=$_GET[id];
$query="select * from acceso where acceso.id_acceso=$id";
$result=pg_query($con,$query);
$row=pg_fetch_array($result);
$mlist=$row['id_acceso'];
	
	if ($row['estado']=='ACTIVO'){
		$row['estado']='INACTIVO';
	}ELSE{
	$row['estado']='ACTIVO';
	}		
	   
	   $sql = "UPDATE acceso SET estado='$row[estado]' WHERE id_acceso='$row[id_acceso]'";
            
       if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); } 
 pg_close($con)

?>
    
