<?
echo $_POST[cedula];
$cedula=$_POST[cedula];
include("../config.php");
include("../utils.php");
include("../la_ip.php");
if ($cedula==''){
 header("Location: buscar.php");
}else{


$result = pg_query($con, "select * from datos where cedula='".$cedula."'"); 

$row=pg_fetch_array($result);

if ($row['cedula']!=$cedula){
   header("Location: Mdatos.php?id=$cedula&documento=$_POST[documento]");
}else{

   
       if ($_POST[documento]=='AUTENTICACION'){
	 if (($row['cedula']==$cedula) && ($row['titulo']!='') && ($row['codigo']!='') && ($row['folio']!='')&& ($row['tomo']!='') )
           {
               header("Location: ../consulta/ver_rep_autenticacion.php?id=$cedula");
               }else{
               header("Location: ../actualizar/Mdatos.php?id=$row[cedula]&documento=$_POST[documento]");
               }

            }else{
        if ($_POST[documento]=='CULMINACION'){
        //valida que tenga los datos respectivos
	 if (($row['cedula']==$cedula) && ($row['titulo']!='') && ($row['periodo']!=''))
           {
               header("Location: ../consulta/ver_rep_culminacion.php?id=$cedula");
               }else{
               header("Location: ../actualizar/Mdatos.php?id=$row[cedula]&documento=$_POST[documento]");
            }


	}else{
 if (($row['cedula']==$cedula) && ($row['titulo']!='') && ($row['periodo']!=''))
           {
               header("Location: ../consulta/ver_rep_constancia.php?id=$cedula");
               }else{
               header("Location: ../actualizar/Mdatos.php?id=$row[cedula]&documento=$_POST[documento]");
            }
}

}
   
   //  header("Location: ../consulta/ver_rep_culminacion.php?id=$cedula");
//header("Cache-control: private"); // Arregla IE 6
// header("Location: ../actualizar/Mdatos.php?id=$row[cedula]&documento=$_POST[documento]");
   }
	}  

?>      
