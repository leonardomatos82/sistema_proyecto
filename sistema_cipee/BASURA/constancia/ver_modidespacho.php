<?php 
include("../control/valida.php"); 
include("../config.php");
include("../tabla.php");
include("../utils.php");

include("../barra.php");
session_start();
?>
<?php
//include("../atras.php"); 
 ?>
<table width="750" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2">SELECCIONE EL REGISTRO</td>
   <td width="200">&nbsp;</td>
  </tr>
  <tr>
    <td width="149">&nbsp;</td>
    <td width="584">&nbsp;</td>
  
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  
  </tr>
  <tr>
    <td height="59"><p align="right">&nbsp;</p>
    <p align="right">&nbsp;</p></td>
    <td><table width="100%" height="48" border="0"  align="center" cellpadding="0" cellspacing="1" >
      <tbody>
      </tbody>
      <tr>
        <td width="100%" height="42" bordercolor="#000000" bgcolor="#FFFFFF"><?php
$sql="select * from orden_pedido where estado='ORDENADO'
order by id_pedido DESC";
$result=pg_query($con,$sql);

echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=100% bgcolor=#FFFFFF >";

 
echo "<tr>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=1>ID</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b><font size=1>FECHA</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=1>RAZON SOCIAL</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=1>CEDULA/RIF</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=1>MONTO</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=1>OPT</b></td>";


echo "</tr> ";
while ($row = pg_fetch_row($result)){
echo "<tr> ";
$row[1]=cambiaf_a_normal($row[1]);
echo "<td <small style=width: 50px ><font size=1>$row[0]</td> ";
echo "<td <small style=width: 100px ><font size=1>$row[1]</td> ";
echo "<td <small style=width: 50px ><font size=1>$row[2]</td> ";
echo "<td <small style=width: 50px ><font size=1>$row[4]</td> ";
echo "<td <small style=width: 50px ><font size=1>$row[6]</td> ";
?>
        </td>
        <td><a href="Mdespacho.php?ids=<?=$row[0]?>"><img
 style="border: 0px solid ; width: 25px; height: 25px;" alt="k"
 src="../imagenes/b_edit.png"></a> </td>
        <?PHP
echo "</tr> ";
}
echo "</table>";
echo "</table>";
echo "</table>";
?>
  
 <?php
include("../pie.php"); 
 ?>
