<?php 
include("../control/valida.php"); 
include("../css.php");
include("../config.php");
//include("../utils.php");
?>
<table width="824" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2">REGISTRO DE TRANSACCIONES</td>
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
    <td><table width="88%" height="48" border="0"  align="center" cellpadding="0" cellspacing="1"   style="background-color: rgb(255, 255, 255); text-align: center; width: 77%; height: 50px;" >
      <tbody>
      </tbody>
      <tr>
        <td width="88%" height="42" bordercolor="#000000" bgcolor="#FFFFFF"><?php
$sql="select * from transaccion order by fecha,hora asc";
$result=pg_query($con,$sql);

echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=100% bgcolor=#FFFFFF >";

 
echo "<tr>";
echo "<td <font size=1><small style=width: 50px font-weight: bold ><b>FECHA</b></font></td>";
echo "<td <font size=1><small style=width: 50px font-weight: bold ><b>HORA</b></font></td>";
echo "<td <font size=1><small style=width: 50px font-weight: bold ><b>OPERACION</b></font></td>";
echo "<td <font size=1><small style=width: 50px font-weight: bold ><b>USUARIO</b></font></td>";
echo "</tr> ";
while ($row = pg_fetch_row($result)){
echo "<tr> ";
$row[0]=cambiaf_a_normal($row[0]);
echo "<td <font size=1><small style=width: 50px font-weight: bold >$row[0]</font></td>";
echo "<td <font size=1><small style=width: 50px font-weight: bold >$row[1]</font></td>";
echo "<td <font size=1><small style=width: 50px font-weight: bold >$row[2]</font></td>";
echo "<td <font size=1><small style=width: 50px font-weight: bold >$row[3]</font></td>";
?>
       
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
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3"><div align="center"><img src="../imagenes/mural1.png" alt="d" width="850" height="13" /></div></td>
  </tr>
</table>

