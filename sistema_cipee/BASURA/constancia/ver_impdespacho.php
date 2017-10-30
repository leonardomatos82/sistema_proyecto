<?php 
//include("../control/valida.php"); 
include("../css.php");
include("../config.php");
//include("../utils.php");
//include("cantidad.php");
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
        <td width="100%" height="42" bordercolor="#000000" bgcolor="#FFFFFF">
            <?php
$result = pg_query($con,"SELECT despacho.id_despacho,despacho.nombre_entrega,
departamento.nombre_departamento,despacho.fecha
 FROM despacho
 INNER JOIN departamento on departamento.id_departamento=despacho.id_departamento 
 where (estado ='DESPACHADO')  ORDER BY id_despacho DESC
 ");
 
 echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=100% bgcolor=#FFFFFF >";

 echo "<tr>";
 echo "<td <font size=2 align=right><small style=width: 50px>ID</font></td>";
 echo "<td <font size=2 align=center><small style=width: 50px>----FECHA----</font></td>";
 echo "<td <font size=2 align=center><small style=width: 50px>--ENTREGADO A:--</font></td>";
  echo "<td <font size=2 align=right><small style=width: 50px>DEPARTAMENTO</font></td>";
  echo "<td <font size=2 align=left><small style=width: 50px>_OPT_</font></td>";
echo "</tr> ";
//$c=$numerosig;
while ($row = pg_fetch_row($result)){;
echo "<tr> ";
$row[3]=cambiaf_a_normal($row[3]);
//$row[2]=number_format($row[2],2);

echo "<td <font size=2 align=center><small style=width: 50px>$row[0]</font></td>";
echo "<td <font size=2 align=center><small style=width: 50px>$row[3]</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row[1]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$row[2]</font></td>";
?>
            </p>
        </div></td>
        <td><a href="../suministros/ver_despacho.php?id=<?=$row[0]?>&amp;titulo=<?="IMPRIMIR CHEQUE"?>"><img
 style="border: 0px solid ; width: 16px; height: 16px;" alt="Cheque"
 src="../imagenes/b_print.png"></a></td>
  
        <?PHP
echo "</tr> ";
}
echo "</table>";
?>
     <?php
include("../pie.php"); 
 ?>