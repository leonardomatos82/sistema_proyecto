<?php
 session_start();
//include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../utils.php");
$doc=$_GET[documento];

include("../barra.php");
$result = pg_query($con, "select * from teg where teg='".$_POST[teg]."'"); 
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


if ($_POST[teg]=="" || $_POST[aldea]=="" || $_POST[pfg]==""

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


if (($row['teg']==$_POST[teg])){
  echo "<b>Mensaje: </b>".Registro_Ya_existe."<br><br>";
   //die();
}else{

$resultcod = "select count(id_teg) from teg where periodo='$rowpl[periodo]'"; 
$rowcod = pg_query($resultcod);
$count = pg_fetch_array($rowcod);
$cod_teg=$count[0]+1;


$fecha=date("d-m-Y");
$estado_teg="INSCRITO";
$sql = "INSERT INTO teg(
            fecha_inscripcion, periodo, parroquia, municipio, estado, 
            trayecto, tramo, seccion, pfg, turno, aldea, teg, comunidad, 
            objetivo, area_vinculacion, instituciones, enlace, correo_enlace, 
            tlf_enlace, academico, correo_academico, tlf_academico, institucional, 
            correo_institucional, tlf_institucional, observaciones_generales, 
            documento1, documento2, documento3, documento4,estado_teg,mencion,cod_teg)
values (
'$fecha','$rowpl[periodo]','$_POST[parroquia]','$_POST[municipio]',
'$_POST[estado]',
        '$_POST[trayecto]',
        '$_POST[tramo]',
        '$_POST[seccion]',
        '$_POST[pfg]','$_POST[turno]','$_POST[aldea]','$_POST[teg]',
        '$_POST[comunidad]','$_POST[objetivo]',
        '$_POST[area_vinculacion]','$_POST[instituciones]',   
        '$_POST[enlace]','$_POST[correo_enlace]','$_POST[tlf_enlace]',
	'$_POST[academico]','$_POST[correo_academico]','$_POST[tlf_academico]',
	'$_POST[institucional]','$_POST[correo_institucional]','$_POST[tlf_institucional]',


        '$_POST[observaciones_generales]',
        '$_POST[documento1]','$_POST[documento2]','$_POST[documento3]',
        '$_POST[documento4]','$estado_teg','$_POST[mencion]','$cod_teg'
        );";
      if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); }else{

$result = pg_query($con, "select * from teg where teg='".$_POST[teg]."'"); 
$row=pg_fetch_array($result);


for($i=1;$i<=$_GET['cantidad'];$i++){
$nacionalidad='nacionalidad'.$i;
$cedula='cedula'.$i;
$nombre='nombre'.$i;

$telefono_estudiante='telefono_estudiante'.$i;
$sql2 ="INSERT INTO estudiante_teg(
            nacionalidad, cedula, nombre, telefono_estudiante, pfg, id_teg)
    VALUES ('$_POST[$nacionalidad]', '$_POST[$cedula]', '$_POST[$nombre]', '$_POST[$telefono_estudiante]',
'$_POST[pfg]',$row[id_teg]);";
if (!pg_query($con,$sql2)) { die('Error: ' . pg_result_error()); }
}


} 
       
       echo"<b>Mensaje: </b>".Registro_Agregado."<br><br>";
	  /////////////////////////////
$valor="-Operacion: AGREGAR INSCRIPCION DE TEG -".$_POST[teg];
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