<?php 
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");


include("../barra.php");
session_start();
?>

<table width="750" border="0" align="center" bgcolor="#FFFFFF">
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
        <td width="100%" height="42" bordercolor="#000000" bgcolor="#FFFFFF">
<?php
$sql="select * from acceso 
where  id_acceso<>2
order by id_acceso";
$result=pg_query($con,$sql);

echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=100% bgcolor=#FFFFFF >";
echo "<tr>";
echo "<td <small style=width: 50px font-weight: bold><b>ID</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>LOGIN</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>TIPO</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>ESTADO</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>OPT</b></td>";
echo "</tr> ";
while ($row = pg_fetch_array($result)){
echo "<tr> ";
echo "<td <small style=width: 50px >$row[id_acceso]</td> ";
echo "<td <small style=width: 100px >$row[login]</td> ";
echo "<td <small style=width: 50px >$row[tipo]</td> ";
echo "<td <small style=width: 50px >$row[estado]</td> ";

?>
        </td>
        <td><a href="../acceso/Anular_acceso.php?id=<?=$row[3]?>&estado=<?=$row[5]?>"><img
 style="border: 0px solid ; width: 16px; height: 16px;" alt="k"
 src="../imagenes/b_edit.png"></a> </td>
        <?PHP
echo "</tr> ";
}
echo "</table>";
echo "</table>";echo "</table>";
?>
        
<?php
include("../pie.php"); 
 ?>

