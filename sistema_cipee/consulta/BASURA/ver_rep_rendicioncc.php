<?php
include("../config.php");
include("../utils.php");
$query2="SELECT * FROM configuracion where id_configuracion='1'";
$result2=pg_query($con,$query2);
$row2=pg_fetch_array($result2);

$desde= $_GET['desde_year']."-".$_GET['desde_mes']."-".$_GET['desde_dia'];
$hasta= $_GET['hasta_year']."-".$_GET['hasta_mes']."-".$_GET['hasta_dia'];
include("../cheque/numero2.php"); 

if ($_GET['tipo']=="FONDO MENSUAL")
{
$c=1;

$condicion="FONDO MENSUAL";
}else{
if ($_GET['tipo']=="FONDO ESPECIAL")
{
$condicion="FONDO ESPECIAL";
$c=1;
}
}

?>
<script language="JavaScript">
function acceptNum(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key <= 13 || (key >= 47 && key <= 57));
}
var nav4 = window.Event ? true : false;
function acceptChar(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key < 48 || key > 57);
}
function textCounter(field, countfield, maxlimit) {
if (field.value.length > maxlimit)
field.value = field.value.substring(0, maxlimit);
else 
countfield.value = maxlimit - field.value.length;
}

  </script>
<table width="617" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td width="144" rowspan="5"><div align="center"><strong><font size="2" face="Times New Roman, Times, serif"><img src="../imagenes/ubv.jpg" width="70" height="62" /></font></strong></div></td>
    <td height="0"><p align="left"><strong><font size="1">REPUBLICA BOLIVARIANA 
        DE VENEZUELA</font></strong></p></td>
  </tr>
  <tr> 
    <td height="0"> <div align="left"><font size="1"><strong>MINISTERIO DEL PODER 
        POPULAR PARA LA</strong></font></div></td>
  </tr>
  <tr> 
    <td height="21"> <div align="left"><font size="1"><strong><font face="Times New Roman, Times, serif">EDUCACION 
        SUPERIOR</font></strong></font></div></td>
  </tr>
  <tr> 
    <td height="0"><font size="1"><strong><font face="Times New Roman, Times, serif">UNIVERSIDAD 
      BOLIVARIANA DE VENEZUELA</font> </strong></font></td>
  </tr>
  <tr> 
    <td height="0"><strong><font size="1" face="Times New Roman, Times, serif">SEDE 
      <?php echo $row2['sede'];?> -PORTUGUESA</font></strong></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="0"><div align="right"><strong> </strong></div></td>
  </tr>
</table>
<table width="617" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td height="0" colspan="3"> <div align="center"></div></td>
  </tr>
  <tr> 
    <td width="144" rowspan="3"><div align="center"><strong></strong></div></td>
    <td height="0" colspan="2"><p align="center"><strong><font size="3" face="Times New Roman, Times, serif">RENDICI&Oacute;N 
        DE FONDOS CAJA CHICA (<?php echo $_GET['tipo'];?>)</font></strong></p></td>
  </tr>
  <tr> 
    <td height="0" colspan="2"> <div align="center"><strong> </strong><font size="1">Desde:</font> <strong><font size="1" face="Times New Roman, Times, serif"><?php echo $_GET['desde_dia']."/".$_GET['desde_mes']."/".$_GET['desde_year'];?></font></strong>, 
        <font size="1">Hasta:</font><strong><font size="1" face="Times New Roman, Times, serif"> <?php echo $_GET['hasta_dia']."/".$_GET['hasta_mes']."/".$_GET['hasta_year'];?></font></strong> 
        <strong></strong>&nbsp;<strong> </strong></div></td>
  </tr>
  <tr> 
    <td width="345" height="0"> <div align="center"><strong> </strong></div></td>
    <td width="128" height="0">&nbsp;</td>
  </tr>
  <tr> 
    <td><div align="right"><strong><font size="1">BANCO :</font><font size="1"> 
        :</font></strong></div></td>
    <td colspan="2"> <div align="left"><img src="../imagenes/BIV.jpg" width="113" height="26">&nbsp;</div></td>
  </tr>
  <tr>
    <td><div align="right"><font size="1"><strong>CUENTA :</strong></font></div></td>
    <td colspan="2"><font size="1" face="Times New Roman, Times, serif"><?php echo $row2['cuenta'];?></font</td>
  </tr>
</table>
<p>
  <?php
$ncajachica ="select *
from asignacion_caja_chica
where estado='EN EJECUCION'
";
$ncajachica2=pg_query($con,$ncajachica);
$rowncajachica=pg_fetch_array($ncajachica2);  

echo "<td <font size=1 align=left><small style=width: 50px><b>$rowncajachica[3]</b></font></td>";
  if ($c==1){
$result = pg_query($con,$query="select p_terciaria.descripcion,p_terciaria.codigo_t,distribucion_caja_chica.monto_factura
from distribucion_caja_chica
 INNER JOIN p_terciaria ON distribucion_caja_chica.cod_partida= p_terciaria.id_p_terciaria where
distribucion_caja_chica.ESTADO='PAGADO'
(fecha >= '$desde' AND fecha <= '$hasta')
ORDER BY p_terciaria.codigo_t ASC
");


}else{
$result = pg_query($con,$query="select p_terciaria.descripcion,p_terciaria.codigo_t,distribucion_caja_chica.monto_factura from distribucion_caja_chica
 INNER JOIN p_terciaria ON distribucion_caja_chica.cod_partida= p_terciaria.id_p_terciaria where
distribucion_caja_chica.ESTADO='PAGADO'
 AND(distribucion_caja_chica.fecha >= '$desde' AND distribucion_caja_chica.fecha <= '$hasta')
ORDER BY p_terciaria.codigo_t ASC
");
}
echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=70% bgcolor=#FFFFFF >";
echo "<tr>";
echo "<td <font size=2 align=left><small style=width: 50px><b>PARTIDA</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>DESCRIPCION</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>MONTO BSF</b></font></td>";


echo "</tr> ";

while ($row = pg_fetch_row($result)){
$partida=$row[1];
$subtotal=0;
$resultado3 = pg_query($con,$query="select distribucion_caja_chica.monto_factura from distribucion_caja_chica
 INNER JOIN p_terciaria ON distribucion_caja_chica.cod_partida= p_terciaria.id_p_terciaria where

p_terciaria.codigo_t='$partida' and
distribucion_caja_chica.ESTADO='PAGADO'
 AND(distribucion_caja_chica.fecha >= '$desde' AND distribucion_caja_chica.fecha <= '$hasta')
 

");
while ($roww = pg_fetch_row($resultado3)){
$subtotal=$subtotal+$roww[0];

}


$dd++;
$total=$total+$row[2];

$valorA=$row[1];
if ($dd==1){$valorA=$row[1];$valorB=0;}
if ($valorA!=$valorB)
{
$valorB=$row[1];
$msubtotal=number_format($subtotal,2,',','.');
echo "<tr> ";
echo "<td <font size=2 align=left><small style=width: 50px>$row[1]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$row[0]</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$msubtotal</font></td>";

?>
</p>
<p></p>

<?PHP
echo "</tr> ";

}

}
$mtotal=number_format($total,2);
echo "<tr>";
echo "<td <font size=2 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>TOTAL:</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtotal</b></font></td>";
echo "</tr> ";
echo "</table>";
?>
<p>&nbsp;</p>
<table width="830" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr bordercolor="#CCCCCC"> 
    <td width="192"><strong><font size="1">ELABORADO POR</font></strong></td>
    <td width="201"><strong><font size="1">REVISADO POR</font></strong></td>
    <td width="273"><strong><font size="1">AUTORIZADO POR</font></strong></td>
  
  </tr>
  <tr> 
    <td><font size="1"><?php echo $row2['custodio_chica'];?></font></td>
    <td><font size="1"><?php echo $row2['coordinador_adm'];?></font></td>
    <td><font size="1"><?php echo $row2['coordinador_sede'];?></font></td>
   
  </tr>
      <tr> 
    <td><font size="2">CUSTODIO DE CAJA CHICA</font></td>
    <td><font size="2"><?php echo $row2['cargo2'];?></font></td>
    <td><font size="2"><?php echo $row2['cargo1'];?></font></td>  
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
 
  <tr> 
      <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>

</table>

<table width="93%" border="0" align="left" cellpadding="0" cellspacing="0">
  <tr> 
    <td><div align="left"><font face="CodabarMedium"> </strong><font size="2" face=CodabarMedium"><?php echo $_GET['desde_dia']."/".$_GET['desde_mes']."/".$_GET['desde_year'];?><?php echo $_GET['hasta_dia']."/".$_GET['hasta_mes']."/".$_GET['hasta_year'];?></font></font></div></td>
  </tr>
</table>
<p>&nbsp;</p>
 <td><font size="1"> <p> <a href="../consulta/menu_consulta.php?>">Atras</a>&nbsp; </p></font></td>