<?php 
include("../control/valida.php"); 
//include("../css.php");
//include("../utils.php");
include("../config.php");
$query2="SELECT * FROM configuracion where id_configuracion='1'";
$result2=pg_query($con,$query2);
$row2=pg_fetch_array($result2);
?>
<table width="617" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td width="144" rowspan="5"><div align="center"><strong><font size="1" face="Times New Roman, Times, serif"><img src="../imagenes/ubv.jpg" width="70" height="62" /></font></strong></div></td>
    <td height="0"><p align="left"><strong><font size="1">REPUBLICA BOLIVARIANA 
        DE VENEZUELA</font></strong></p></td>
  </tr>
  <tr> 
    <td height="0"> <div align="left"><font size="1"><strong>MINISTERIO DEL PODER 
        POPULAR PARA LA</strong></font></div></td>
  </tr>
  <tr> 
    <td height="21"> <div align="left"><font size="1"><strong>EDUCACION 
        SUPERIOR</font></strong></font></div></td>
  </tr>
  <tr> 
    <td height="0"><font size="1"><strong>UNIVERSIDAD 
      BOLIVARIANA DE VENEZUELA</font> </strong></font></td>
  </tr>
  <tr> 
    <td height="0"><strong>SEDE 
      <?php echo $row2['sede'];?> -PORTUGUESA</font></strong></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td height="0"><strong> </strong></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="0"><div align="right"><strong> </strong></div></td>
  </tr>
<table width="100%" border="0" align="center" bgcolor="#FFFFFF">
    <tr ><td align="center"><font size="4">REGISTRO DE PROVEEDORES </font></td></tr>
      <tr>
        <td width="100%" height="42" bordercolor="#000000" bgcolor="#FFFFFF"><?php
$result = pg_query($con,"SELECT * 
 FROM USUARIO WHERE tipo='PROVEEDOR' order by nombre
  ");

echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=100% bgcolor=#FFFFFF >";


 
echo "<tr>";
echo "<td <font size=2 align=left><small style=width: 50px><b>N</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>RIF</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>PROVEEDOR</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>DIRECCION</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>TELEFONOS</b></font></td>";
echo "</tr> ";
while ($row = pg_fetch_row($result)){

//if ($row[0]=='0'){}else{
//$tmensual=$tmensual+$row[3];
//$tanual=$tanual+$row[2];
//$row2=number_format($row[2],2,',','.');
//$row3=number_format($row[3],2,',','.');
$c++;
echo "<tr> ";
echo "<td <font size=2 align=right><small style=width: 50px>$c</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row[0]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$row[1]</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row[2]</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row[3]</font></td>";
?>
        </td>
               <?PHP
echo "</tr> ";
//}
}


echo "</table>";
?>
        <td><div align="center"></td>
          </tr>
    </table></td>
</table>
