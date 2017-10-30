<?php
 session_start();
//include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../utils.php");
$doc=$_GET[documento];

include("../barra.php");
$result = pg_query($con, "select * from censo where cedula='".$_POST[cedula1]."'"); 
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


if ($_POST[cedula1]=="" || $_POST[nombre1]==""

)
		{
		$val='censo.php?documento=$documento';
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


if (($row['cedula']==$_POST[cedula1])){
  echo "<b>Mensaje: </b>".Registro_Ya_existe."<br><br>";
   //die();
}else{

$fecha=date("d-m-Y");
$estado="CENSADO";


echo $sql = "INSERT INTO censo(
            nacionalidad, cedula, nombre, telefono_estudiante, 
            cantidad_estudiante, aldea, parroquia, municipio, estado, trayecto, 
            tramo, seccion, pfg, turno, mencion, tipo_proyecto, fase, nombre_proyecto, 
            comunidad, objetivo, area_vinculacion, instituciones, alcance, 
            recursos_requeridos, apoyo_requerido, monto_asignado, otras_ayudas, 
            iniciativa_estado, prof_proyecto, correo_proyecto, tlf_proyecto, 
            enlace_ubv, correo_enlace, tlf_enlace, institucional, correo_institucional, 
            tlf_institucional, comunitario, correo_comunitario, tlf_comunitario, 
            observaciones, estado_proyecto, fecha_inscripcion,periodo)
    VALUES (
'$_POST[nacionalidad1]',
'$_POST[cedula1]',
'$_POST[nombre1]',
'$_POST[telefono_estudiante1]',
'$_POST[cantidad_estudiantes]',
'$_POST[aldea]',
'$_POST[parroquia]',
'$_POST[municipio]',
'$_POST[estado]',
'$_POST[trayecto]',
'$_POST[tramo]',
'$_POST[seccion]',
'$_POST[pfg]',
'$_POST[turno]',
'$_POST[mencion]',
'$_POST[tipo_proyecto]',
'$_POST[fase]',
'$_POST[nombre_proyecto]',
'$_POST[comunidad]',   
'$_POST[objetivo]',
'$_POST[area_vinculacion]',
'$_POST[instituciones]',
'$_POST[alcance]',
'$_POST[recursos_requeridos]',
'$_POST[apoyo_requerido]',
'$_POST[monto_asignado]',
'$_POST[otras_ayudas]',
'$_POST[iniciativa_estado]',
'$_POST[prof_proyecto]',
'$_POST[correo_proyecto]',
'$_POST[tlf_proyecto]',
'$_POST[enlace_ubv]',
'$_POST[correo_enlace]',
'$_POST[tlf_enlace]',
'$_POST[institucional]',
'$_POST[correo_institucional]',
'$_POST[tlf_institucional]',
'$_POST[comunitario]',
'$_POST[correo_comunitario]',
'$_POST[tlf_comunitario]',
'$_POST[observaciones]',
'$estado',
'$fecha',
'$rowpl[periodo]'
      );";
      if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); }
       
       echo"<b>Mensaje: </b>".CENSO_REGISTRADO."<br><br>";
	  /////////////////////////////
$valor="-Operacion: AGREGAR CENSO -".$_POST[cedula1];
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

