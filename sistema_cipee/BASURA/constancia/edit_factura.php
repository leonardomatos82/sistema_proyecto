<?php
 session_start();
include("../control/valida.php"); 
include("../config.php");
include("../tabla.php");
include("../utils.php");

include("../barra.php");

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
$val='../menu.php';
if($_POST[nfactura]=="" )
		{
		$ids=$_POST[ids];
		$val='Mfactura.php?ids='.$ids;
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
$estado='PAGADO';
 $sql = "UPDATE orden_pedido SET nfactura='$_POST[nfactura]',estado='$estado' 
WHERE id_pedido='$_POST[ids]'";
if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); } 

 $sql2 = "UPDATE detalle_pedido SET nfactura='$_POST[nfactura]',status='$estado' 
WHERE id_pedido='$_POST[ids]'";
if (!pg_query($con,$sql2)) { die('Errordd:' . pg_result_error()); } 
       
       echo"<b>Mensaje: </b>".FACTURA_ASIGNADA_A_ORDEN_DE_PEDIDO."<br><br>";
	    /////////////////////////////
$valor="-Operacion: Modificar -Asignar factura:  -Registro ID: ".$_POST[id];
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

