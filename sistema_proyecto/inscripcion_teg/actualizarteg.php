<?php
 session_start();
//include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../utils.php");
$doc=$_GET[documento];

include("../barra.php");
$result = pg_query($con, "select * from teg where id_teg='".$_POST[codigo]."'"); 
$resultpl = pg_query($con, "select * from periodo_lectivo where estado='ACTIVO'"); 
$rowpl=pg_fetch_array($resultpl);

$row=pg_fetch_array($result);
$val='../menu.php';


?> 
<table width="750" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2">&nbsp;</td>
    <td width="77">&nbsp;</td>
  </tr>
  <tr>
    <td width="149">&nbsp;</td>
    <td width="584">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="88"><p align="right">&nbsp;</p>
        <p align="right">&nbsp;</p></td>
    <td>


 <?php


if ($_POST[teg]=="" || $_POST[aldea]==""

)
		{
		$val='Mdatos.php?documento=$documento';
?>




 <td><form style="width: 615px;" action="<? echo $val; ?>" method="post">
      <p align="left"><br />
  <?       
	echo"<b>Mensaje: </b>".Todos_los_campos_son_obligatorios."<br><br>";	
	   ?>
	<a href="javascript:window.history.back()"><img style="border: 0px solid ; width: 25px; height: 25px;" alt="Atras"
 src="../imagenes/atras.png"></a>
     <? 
     die();   
    	}
	  else 
	   {
 ?>
 <td><form style="width: 615px;" action="<? echo $val; ?>" method="post">
      <p align="left"><br />

<?


if (($row['id_teg']==$_POST[codigo])){
$fecha=date("d-m-Y");
$estado_teg="INSCRITO";



$sql = "UPDATE teg
   SET parroquia='$_POST[parroquia]', municipio='$_POST[municipio]', 
       estado='$_POST[estado]', trayecto='$_POST[trayecto]', tramo='$_POST[tramo]', seccion='$_POST[seccion]', pfg='$_POST[pfg]', turno='$_POST[turno]', aldea='$_POST[aldea]', 
       teg='$_POST[teg]', comunidad='$_POST[comunidad]',comunidad_parroquia='$_POST[comunidad_parroquia]', comunidad_municipio='$_POST[comunidad_municipio]', 
       comunidad_estado='$_POST[comunidad_estado]', objetivo='$_POST[objetivo]', area_vinculacion='$_POST[area_vinculacion]', instituciones='$_POST[instituciones]', 
       enlace='$_POST[enlace]', correo_enlace='$_POST[correo_enlace]', tlf_enlace='$_POST[tlf_enlace]', academico='$_POST[academico]', correo_academico='$_POST[correo_academico]', 
       tlf_academico='$_POST[tlf_academico]', institucional='$_POST[institucional]', correo_institucional='$_POST[correo_institucional]', tlf_institucional='$_POST[tlf_institucional]', 
       observaciones_generales='$_POST[observaciones_generales]', documento1='$_POST[documento1]', documento2='$_POST[documento2]', documento3='$_POST[documento3]', 
       documento4='$_POST[documento4]',mencion='$_POST[mencion]'
 WHERE id_teg=$_POST[codigo];";

      if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); }else{

$result = pg_query($con, "select * from teg where id_teg='".$_POST[codigo]."'"); 
$row=pg_fetch_array($result);
for($i=1;$i<=$_GET['cantidad'];$i++){
$nacionalidad='nacionalidad'.$i;
$cedula='cedula'.$i;
$nombre='nombre'.$i;
$telefono_estudiante='telefono_estudiante'.$i;
$id_estudiante_teg='id_estudiante_teg'.$i;

$sql2 ="update estudiante_teg set
            nacionalidad='$_POST[$nacionalidad]', cedula='$_POST[$cedula]', nombre='$_POST[$nombre]', telefono_estudiante='$_POST[$telefono_estudiante]', pfg='$_POST[pfg]' where id_estudiante_teg='$_POST[$id_estudiante_teg]';";
if (!pg_query($con,$sql2)) { die('Error : ' . pg_result_error()); }
}


} 
       
       echo"<b>Mensaje: </b>".Registro_Actualizado."<br><br>";
	  /////////////////////////////
$valor="-Operacion: MODIFICAR INSCRIPCION DE TEG -".$_POST[teg];
 registrarOperacion($con,$_SESSION['login'],$valor);      
///////////////////////////////////////////////////////////////////  
      }     
        }
 pg_close($con);
?>
      </p>
      <p align="left">
        <input name="submit2" type="submit" value="Volver" />
      </p>
    </form></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>

</table>

  <?php
include("../pie.php"); 
 ?>