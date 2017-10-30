<?php
 session_start();
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../utils.php");

include("../barra.php");
$result = pg_query($con, "select * from datos where id_solicitud='".$_POST[id]."'"); 
$row=pg_fetch_array($result);
if (($row['id']==$_POST[id])){
$val='../menu.php';
}else{
$val='../menu.php';
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
		$val='Mdatos.php';
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

$fecha=date("d-m-Y");
$estado="PROCESADO";
//$_POST[nombre]= utf8_decode($_POST[nombre]);
echo $sql = "UPDATE datos SET cedula='$_POST[cedula]',nacion='$_POST[nacionalidad]',nombre='$_POST[nombre]',fecha_solicitud='$fecha',titulo='$_POST[titulo]',codigo='$_POST[codigo]',tomo='$_POST[tomo]',folio='$_POST[folio]',ciudad_r='$_POST[ciudad]',estado_r='$_POST[estado]',estatus='$estado',periodo='$_POST[periodo]',tramo='$_POST[tramo]' where id_solicitud='$_POST[id]';";
       if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); } 
       
       echo"<b>Mensaje: </b>".Registro_Actualizado."<br><br>";
	  /////////////////////////////
$valor="-Operacion: ACTUALIZAR DATOS DEL EGRESADO -".$_POST[cedula];
 registrarOperacion($con,$_SESSION['login'],$valor);      
///////////////////////////////////////////////////////////////////  
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