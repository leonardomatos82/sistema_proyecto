<?php
 session_start();
//include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../utils.php");
$doc=$_GET[documento];

include("../barra.php");
$result = pg_query($con, "select * from pasantia where cedula='".$_POST[cedula]."'"); 
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


if ($_POST[nombre]=="" || $_POST[cedula]=="" || $_POST[sexo]=="" 
|| $_POST[edad]==""
|| $_POST[direccion]==""
|| $_POST[parroquia]==""
|| $_POST[municipio]==""
|| $_POST[estado]==""
|| $_POST[trabaja]==""
|| $_POST[pfg]==""
|| $_POST[turno]==""
|| $_POST[aldea]==""
|| $_POST[institucion]==""
|| $_POST[direccion_institucion]==""
|| $_POST[objetivo_pasantia]==""
|| $_POST[inicio]==""
|| $_POST[culminacion]==""
|| $_POST[area]==""
|| $_POST[actividades_area]==""

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


if (($row['cedula']==$_POST[cedula])){
  echo "<b>Mensaje: </b>".Registro_Ya_existe."<br><br>";
   //die();
}else{

$resultcod = "select count(id_pasantia) from pasantia where periodo='$rowpl[periodo]';"; 
$rowcod = pg_query($resultcod);
$count = pg_fetch_array($rowcod);

 $cod_pasantia=$count[0]+1;


$fecha=date("d-m-Y");
 $sql = "INSERT INTO pasantia(
            nacionalidad, cedula, nombre,sexo, edad, correo, telefono_casa, direccion, 
            parroquia, municipio, estado, trabaja, lugar, condicion_laboral, 
            cargo, departamento, telefono_oficina, pfg, turno, aldea, institucion, 
            direccion_institucion, telefono_institucion, objetivo_pasantia, 
            inicio, culminacion, area, actividades_area, observaciones_generales, 
            documento1, documento2, documento3, documento4,fecha_inscripcion,periodo,cod_pasantia)
values ('$_POST[nacionalidad]',
        '$_POST[cedula]',
        '$_POST[nombre]',
        '$_POST[sexo]',
        '$_POST[edad]',
        '$_POST[correo]',
        '$_POST[telefono_casa]',
        '$_POST[direccion]',
        '$_POST[parroquia]',
        '$_POST[municipio]',
        '$_POST[estado]',
        '$_POST[trabaja]',
        '$_POST[lugar]',
        '$_POST[condicion_laboral]',
        '$_POST[cargo]',
        '$_POST[departamento]',
        '$_POST[telefono_oficina]',
        '$_POST[pfg]','$_POST[turno]','$_POST[aldea]','$_POST[institucion]',
        '$_POST[direccion_institucion]','$_POST[telefono_institucion]',
        '$_POST[objetivo_pasantia]','$_POST[inicio]','$_POST[culminacion]',
        '$_POST[area]','$_POST[actividades_area]','$_POST[observaciones_generales]',
        '$_POST[documento1]','$_POST[documento2]','$_POST[documento3]',
        '$_POST[documento4]','$fecha','$rowpl[periodo]','$cod_pasantia'
        );";
      if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); } 
       
       echo"<b>Mensaje: </b>".Registro_Agregado."<br><br>";
	  /////////////////////////////
$valor="-Operacion: AGREGAR INSCRIPCION DE PASANTIAS -".$_POST[cedula];
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