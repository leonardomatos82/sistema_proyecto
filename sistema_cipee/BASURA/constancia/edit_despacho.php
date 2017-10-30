<?php
session_start();
include("../control/valida.php"); 
include("../config.php");
include("../tabla.php");
include("../utils.php");

include("../barra.php");
$veces=$_GET[id];

?> 
<table width="760" border="0" align="center" bgcolor="#FFFFFF">
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
 <?php
$val='../menu.php';
if($_POST[v1]=="" || $_POST[v2]=="" || $_POST[v3]=="" || $_POST[v4]=="")
		{
		$val='Mdespacho.php';

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

         
	         $estado="ORDENADO";
	     $fecha=cambiaf_a_postgres($_POST[fecha]);



	    $sql1="UPDATE orden_pedido
   SET fecha='$fecha', nombrerazon='$_POST[v1]', direccion='$_POST[v2]', rifci='$_POST[v3]', formapago='$_POST[v4]', 
       total='$_POST[total]', estado='$estado'
 WHERE id_pedido=$_POST[ids]"; 
      if (!pg_query($con,$sql1)) { die('Error: ' . pg_result_error()); }

  if ($_POST[parte1]== ""  AND  $_POST[descripcion1]== ""){}else{
 $sqle="DELETE from detalle_pedido WHERE id_pedido='$_POST[ids]'";
    if (!pg_query($con,$sqle)) { die('Error: 1' . pg_result_error()); } 
	} 

/////////////////////////////////////////////////////
for($x=1; $x<=$veces; $x=$x+1)
{ 
$parte="parte".$x;
$descripcion="descripcion".$x;
$cantidad="cantidad".$x;
$monto="monto".$x;
$montot="montot".$x;
echo $_POST[$partida];

if ($_POST[$parte]== ""  AND  $_POST[$descripcion]== "" AND  $_POST[$cantidad]== "")
{}else{
      
                          $rc2="SELECT MAX(id_pedido)  FROM orden_pedido";
                          $qrc2=pg_query($con,$rc2);
                          $cant_reg2=pg_fetch_array($qrc2);
                          $estado="ORDENADO";

	 echo $sql2="INSERT INTO detalle_pedido(id_pedido,codigo, id_repuesto, costo, cantidad, status)
       VALUES ($cant_reg2[0],'$_POST[$parte]',$_POST[$descripcion],$_POST[$montot],'$_POST[$cantidad]','$estado')"; 
    	 if (!pg_query($con,$sql2)) { die('Error:ojo ' . pg_result_error()); } 
    	
	$sql3="UPDATE REPUESTO SET cantidad=cantidad-'$_POST[$cantidad]' where id_repuesto='$_POST[$descripcion]'";
        if (!pg_query($con,$sql3)) { die('Error: ' . pg_result_error()); }        
                 
             
}
 };

//////////////////////////////////////////////////////	   
	     echo " Registro  Agregado";
 $_POST[fecha]="" ;
 $_POST[recibe]="" ;
 $_POST[departamento]="";
}
 pg_close($con);
?>
      </p>
      <p align="left">
        <input name="submit" type="submit" value="Volver" />
      </p>
    </form></td>
  
</table>
