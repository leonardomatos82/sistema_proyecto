<?php 
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");


include("../barra.php");
session_start();
?>
<?php
//include("../atras.php"); 
 ?>

<table width="750" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2"><font size=1>SOLICITUD DE CONSTANCIAS DE TRABAJO PENDIENTES</td>
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
    <td>

<table width="100%" height="38" border="0"  align="center" cellpadding="0" cellspacing="1" >
      <tbody>
      </tbody>
      <tr>
        <td width="100%" height="42" bordercolor="#000000" bgcolor="#FFFFFF"><?php
$sql="select * from solicitud where estado='PENDIENTE'
order by id_solicitud";
$result=pg_query($con,$sql);

echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=100% bgcolor=#FFFFFF >";

 
echo "<tr>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=1>CODIGO</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b><font size=1>CEDULA</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=1>TRABAJADOR</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=1>FECHA SOL</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=1>IMPRIMIR</b></td>";


echo "</tr> ";
while ($row = pg_fetch_row($result)){
echo "<tr> ";

echo "<td <small style=width: 100px ><font size=1>$row[1]</td> ";
echo "<td <small style=width: 50px ><font size=1>$row[2]</td> ";
echo "<td <small style=width: 50px ><font size=1>$row[3]</td> ";
echo "<td <small style=width: 50px ><font size=1>$row[4]</td> ";

?>
        </td>
        <td><a href="../consulta/ver_rep_constancia.php?id=<?=$row[2];?>&num=<?=$row[0];?>"><img
 style="border: 0px solid ; width: 25px; height: 25px;" alt="k"
 src="../imagenes/b_print.png"></a> </td>
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