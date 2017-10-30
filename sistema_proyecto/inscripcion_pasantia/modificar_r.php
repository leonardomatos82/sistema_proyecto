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
		$val='Mdatos2.php?documento=$documento';
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


//if (($row['cedula']==$_POST[cedula])){
 // echo "<b>Mensaje: </b>".Registro_Ya_existe."<br><br>";
   //die();
//}else{

//$resultcod = "select count(id_pasantia) from pasantia where periodo='$rowpl[periodo]';"; 
//$rowcod = pg_query($resultcod);
//$count = pg_fetch_array($rowcod);

 //$cod_pasantia=$count[0]+1;

   $fecha=date("d-m-Y");

$sql ="UPDATE pasantia SET
nacionalidad='$_POST[nacionalidad]', 
cedula='$_POST[cedula]', 
nombre='$_POST[nombre]',
sexo='$_POST[sexo]', 
edad='$_POST[edad]', 
correo='$_POST[correo]', 
telefono_casa='$_POST[telefono_casa]', 
direccion='$_POST[direccion]', 
parroquia='$_POST[parroquia]', 
municipio='$_POST[municipio]', 
estado='$_POST[estado]', 
trabaja='$_POST[trabaja]', 
lugar='$_POST[lugar]', 
condicion_laboral='$_POST[condicion_laboral]', 
cargo='$_POST[cargo]', 
departamento='$_POST[departamento]', 
telefono_oficina='$_POST[telefono_oficina]', 
pfg='$_POST[pfg]', 
turno='$_POST[turno]', 
aldea='$_POST[aldea]', 
institucion='$_POST[institucion]', 
direccion_institucion='$_POST[direccion_institucion]', 
telefono_institucion='$_POST[telefono_institucion]', 
objetivo_pasantia='$_POST[objetivo_pasantia]', 
inicio='$_POST[inicio]', 
culminacion='$_POST[culminacion]', 
area='$_POST[area]', 
actividades_area='$_POST[parroquia]', 
observaciones_generales='$_POST[observaciones_generales]', 
documento1='$_POST[documento1]', 
documento2='$_POST[documento2]', 
documento3='$_POST[documento3]', 
documento4='$_POST[documento4]'
WHERE
id_pasantia='$_POST[id_pasantia]';
";
if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); } 
       
       echo"<b>Mensaje: </b>".Registro_Modificado."<br><br>";
	  /////////////////////////////
$valor="-Operacion: MODIFICAR INSCRIPCION DE PASANTIAS -".$_POST[cedula];
 registrarOperacion($con,$_SESSION['login'],$valor);      
///////////////////////////////////////////////////////////////////  
   //   }     
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