<?php 
include("../control/valida.php"); 
include("../css.php");
include("../config.php");
?>
 <?php
include("../atras.php"); 
 ?>

<table width="760" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2">SELECCIONE EL REGISTRO</td>
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
    <td height="59"><p align="right">&nbsp;</p>
    <p align="right">&nbsp;</p></td>
    <td><table width="100%" height="48" border="0"  align="center" cellpadding="0" cellspacing="1" >
      <tbody>
      </tbody>
      <tr>
        <td width="100%" height="42" bordercolor="#000000" bgcolor="#FFFFFF"><?php
$result = pg_query($con,"SELECT * 
 FROM departamento
  ");

echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=100% bgcolor=#FFFFFF >";


 
echo "<tr>";
echo "<td <small style=width: 50px font-weight: bold><b>ID</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>COORDINACION</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>OPT</b></td>";


echo "</tr> ";
while ($row = pg_fetch_row($result)){
echo "<tr> ";
echo "<td <small style=width: 50px >$row[1]</td> ";
echo "<td <small style=width: 100px >$row[0]</td> ";
?>
        </td>
        <td><a href="../direccion/Edireccion.php?id=<?=$row[1]?>&amp;titulo=<?="SEGURO QUE DESEA ELIMINAR"?>"><img
 style="border: 0px solid ; width: 16px; height: 16px;" alt="s"
 src="../imagenes/b_drop.png"></a> </td>
        <?PHP
echo "</tr> ";
}
echo "</table>";
?>
        <td><div align="center"></td>
          </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
 
</table>
 <?php
include("../pie.php"); 
 ?>