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
    <td height="0" colspan="2"><p align="center"><strong><font size="3" face="Times New Roman, Times, serif">RELACI&Oacute;N 
        DE ASISTENCIAS</font></strong></p></td>
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
  if ($c==1){
$result = pg_query($con,$query="SELECT 

where
tipo_f='$condicion' AND
ESTADO='PAGADO' AND
(fecha >= '$desde' AND fecha <= '$hasta')
ORDER BY id_cheque ASC
");

}else{
$result = pg_query($con,$query="SELECT cheque.id_cheque,cheque.ncheque,cheque.fecha,cheque.monto_cheque,cheque.beneficiario,cheque.cedula_rif,cheque.concepto from cheque 
where
ESTADO='PAGADO' AND
(fecha >= '$desde' AND fecha <= '$hasta')
ORDER BY id_cheque ASC
");
}

echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=100% bgcolor=#FFFFFF >";

 
echo "<tr>";
echo "<td <font size=1 align=left><small style=width: 50px><b>CHEQUE NUMERO</b></font></td>";
echo "<td <font size=1 align=left><small style=width: 50px><b>FECHA EMISION</b></font></td>";
echo "<td <font size=1 align=left><small style=width: 50px><b>MONTO BS</b></font></td>";
echo "<td <font size=1 align=left><small style=width: 50px><b>BENEFICIARIO</b></font></td>";
echo "<td <font size=1 align=left><small style=width: 50px><b>CEDULA/RIF</b></font></td>";
echo "<td <font size=1 align=left><small style=width: 50px><b>CONCEPTO</b></font></td>";

echo "</tr> ";
while ($row = pg_fetch_row($result)){

echo "<tr> ";
$query22="select p_terciaria.descripcion from distribucion_cheque
 INNER JOIN p_terciaria ON distribucion_cheque.cod_partida= p_terciaria.id_p_terciaria
where distribucion_cheque.ncheque='$row[1]'";
$result22=pg_query($con,$query22);
while ($resulta222 = pg_fetch_row($result22)){
$row22=$row22."--".$resulta222[0];
}

if ($row[5]=='G-000000000'){ }else{
$total=$total+$row[3];
$row[3]=number_format($row[3],2);
$row[2]=cambiaf_a_normal($row[2]);


echo "<td <font size=1 align=center><small style=width: 50px>$row[1]</font></td>";
echo "<td <font size=1 align=right><small style=width: 50px>$row[2]</font></td>";
echo "<td <font size=1 align=right><small style=width: 50px>$row[3]</font></td>";

echo "<td <font size=1 align=left><small style=width: 50px>$row[4]</font></td>";
echo "<td <font size=1 align=left><small style=width: 50px>$row[5]</font></td>";
echo "<td <font size=1 align=left><small style=width: 50px>$row22</font></td>";
$row22="";
$mtotal=number_format($total,2);
?>
</p>
<p></p>

<?PHP

echo "</tr> ";

}
}

echo "<tr>";
echo "<td <font size=1 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=1 align=left><small style=width: 50px><b>TOTAL:</b></font></td>";
echo "<td <font size=1 align=right><small style=width: 50px><b>$mtotal</b></font></td>";
echo "<td <font size=1 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=1 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=1 align=left><small style=width: 50px><b>-</b></font></td>";

echo "</tr> ";
echo "</table>";
?>
<p>&nbsp;</p>
<table width="830" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr bordercolor="#CCCCCC"> 
    <td width="192"><strong><font size="1">ELABORADO POR</font></strong></td>
    <td width="201"><strong><font size="1">REVISADO POR</font></strong></td>
    <td width="273"><strong><font size="1">AUTORIZADO POR</font></strong></td>
    <td width="164">&nbsp;</td>
  </tr>
  <tr> 
    <td><font size="1"><?php echo $row2['administrador'];?></font></td>
    <td><font size="1"><?php echo $row2['coordinador_adm'];?></font></td>
    <td><font size="1"><?php echo $row2['coordinador_sede'];?></font></td>
    <td width="192"><strong><font size="1"><strong>SELLO</strong></td>
  </tr>
      <tr> 
    <td><font size="2"><?php echo $row2['cargo3'];?></font></td>
    <td><font size="2"><?php echo $row2['cargo2'];?></font></td>
    <td><font size="2"><?php echo $row2['cargo1'];?></font></td>  
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  <tr> 
      <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr></tr>
</table>

<table width="93%" border="0" align="left" cellpadding="0" cellspacing="0">
  <tr> 
    <td><div align="left"><font face="CodabarMedium"> </strong><font size="2" face=CodabarMedium"><?php echo $_GET['desde_dia']."/".$_GET['desde_mes']."/".$_GET['desde_year'];?><?php echo $_GET['hasta_dia']."/".$_GET['hasta_mes']."/".$_GET['hasta_year'];?></font></font></div></td>
  </tr>
</table>
<p>&nbsp;</p>
 <td><font size="1"> <p> <a href="../consulta/menu_consulta.php?>">Atras</a>&nbsp; </p></font></td>