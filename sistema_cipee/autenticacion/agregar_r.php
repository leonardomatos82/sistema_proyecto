<?php
 session_start();
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../utils.php");
$doc=$_GET[documento];

include("../barra.php");
$result = pg_query($con, "select * from datos where cedula='".$_POST[cedula]."'"); 
$row=pg_fetch_array($result);
if (($doc=='AUTENTICACION')){
 
$val='../consulta/ver_rep_autenticacion.php?id='.$_POST[cedula];
}else{
if (($doc=='CULMINACION')){
$val='../consulta/ver_rep_culminacion.php?id='.$_POST[cedula];
}else{
$val='../consulta/ver_rep_constancia.php?id='.$_POST[cedula];
}
}

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


if ($_POST[nombre]=="" || $_POST[cedula]=="")
		{
		$val='Mdatos.php?documento=$documento';
?>




 <td><form style="width: 615px;" action="<? echo $val; ?>" method="post">
      <p align="left"><br />
  <?       
	echo"<b>Mensaje: </b>".Todos_los_campos_son_obligatorios."<br><br>";	
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

$fecha=date("d-m-Y");
$estado="PROCESADO";
$_POST[nombre]= utf8_decode($_POST[nombre]);
$sql = "INSERT INTO datos (nacion,cedula,nombre,fecha_solicitud,titulo,codigo,tomo,folio,ciudad_r,estado_r,
estatus,periodo,tramo) 
values ('$_POST[nacionalidad]','$_POST[cedula]','$_POST[nombre]','$fecha','$_POST[titulo]','$_POST[codigo]','$_POST[tomo]','$_POST[folio]','$_POST[ciudad]','$_POST[estado]','$estado','$_POST[periodo]','$_POST[tramo]');";
       if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); } 
       
       echo"<b>Mensaje: </b>".Registro_Agregado."<br><br>";
	  /////////////////////////////
$valor="-Operacion: AGREGAR SOLICITUD DE AUTENTICACION DE TITULO -".$_POST[cedula];
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