<?
echo $_POST[documento];
$cedula=$_POST[cedula];
include("../config.php");
include("../utils.php");
include("../la_ip.php");
if ($cedula==''){
 header("Location: buscar2.php");
}else{


$result = pg_query($con, "select * from estudiante_teg where cedula='".$cedula."'"); 

$row=pg_fetch_array($result);

if ($row['cedula']!=$cedula){
  header("Location: buscar2.php");
}else{

   
       if ($_POST[documento]=='PLANILLA DE INSCRIPCION DE TEG'){
	 if (($row['cedula']==$cedula) )
           {
               header("Location: ../consulta/ver_rep_planilla_teg.php?id=$cedula");
               }else{
              header("Location: buscar2.php");
               }

            }else{
        if ($_POST[documento]=='COMPROBANTE DE INSCRIPCION DE TEG'){
        //valida que tenga los datos respectivos
	 if (($row['cedula']==$cedula))
           {
               header("Location: ../consulta/ver_rep_comprobante_teg.php?id=$cedula");
               }else{
              header("Location: buscar2.php");
            }


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