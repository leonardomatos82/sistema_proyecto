<?
$_POST[documento];
$cedula=$_POST[cedula];
include("../config.php");
include("../utils.php");
include("../la_ip.php");
if ($cedula==''){
 header("Location: buscarsocializacion.php");
}else{


$result = pg_query($con, "select * from estudiante_teg where cedula='".$cedula."'"); 

$row=pg_fetch_array($result);

if ($row['cedula']!=$cedula){
     header("Location: buscarsocializacion.php");
}else{

   
       if ($_POST[documento]=='SOCIALIZACION DE TEG'){
	 if (($row['cedula']==$cedula) )
           {
               header("Location: ../consulta/ver_rep_socializacion_teg.php?id=$cedula");
               }else{
                  header("Location: buscarsocializacion.php");
               }

            }else{
        if ($_POST[documento]=='SERVICIO COMUNITARIO'){

       // if ($row['estado']!="APROBADO"){

 //header("Location: ../consulta/buscarsocializacion.php?mensaje=Estudiante no ha Socializado TEG");
//}else{
        //valida que tenga los datos respectivos
	   if (($row['cedula']==$cedula))
           {
               header("Location: ../consulta/ver_rep_servicio_comunitario.php?id=$cedula");
               }else{
               header("Location: buscarsocializacion.php");
            }
        // }

	}
	
	else{
 
}

}
   
   //  header("Location: ../consulta/ver_rep_culminacion.php?id=$cedula");
//header("Cache-control: private"); // Arregla IE 6
// header("Location: ../actualizar/Mdatos.php?id=$row[cedula]&documento=$_POST[documento]");
   }
	}  

?>