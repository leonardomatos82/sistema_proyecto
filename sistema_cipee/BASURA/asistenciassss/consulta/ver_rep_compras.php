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
    <td width="144" rowspan="5"><div align="center"><strong><font size="4" face="Times New Roman, Times, serif"><img src="../imagenes/ubv.jpg" width="70" height="62" /></font></strong></div></td>
    <td height="0"><p align="left"><strong><font size="2">REPUBLICA BOLIVARIANA 
        DE VENEZUELA</font></strong></p></td>
  </tr>
  <tr> 
    <td height="0"> <div align="left"><font size="2"><strong>MINISTERIO DEL PODER 
        POPULAR PARA LA</strong></font></div></td>
  </tr>
  <tr> 
    <td height="15"> 
      <div align="left"><font size="2"><strong><font face="Times New Roman, Times, serif">EDUCACION 
        SUPERIOR</font></strong></font></div></td>
  </tr>
  <tr> 
    <td height="0"><font size="2"><strong><font face="Times New Roman, Times, serif">UNIVERSIDAD 
      BOLIVARIANA DE VENEZUELA</font> </strong></font></td>
  </tr>
  <tr> 
    <td height="0"><strong><font size="2" face="Times New Roman, Times, serif">SEDE 
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
</table>
<table width="617" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td height="0" colspan="3"> <div align="center"></div></td>
  </tr>
  <tr> 
    <td width="144" rowspan="3"><div align="center"><strong></strong></div></td>
    <td height="0" colspan="2"><p align="center"><strong><font size="4" face="Times New Roman, Times, serif">LIBRO 
        DE COMPRAS (<?php echo $_GET['tipo'];?>)</font></strong></p></td>
  </tr>
  <tr> 
    <td height="0" colspan="2"> <div align="center"><strong> </strong>Desde: <strong><font size="2" face="Times New Roman, Times, serif"><?php echo $_GET['desde_dia']."/".$_GET['desde_mes']."/".$_GET['desde_year'];?></font></strong>, 
        Hasta:<strong><font size="2" face="Times New Roman, Times, serif"> <?php echo $_GET['hasta_dia']."/".$_GET['hasta_mes']."/".$_GET['hasta_year'];?></font></strong> 
        <strong></strong>&nbsp;<strong> </strong></div></td>
  </tr>
  <tr> 
    <td width="345" height="0"> <div align="center"><strong> </strong></div></td>
    <td width="128" height="0">&nbsp;</td>
  </tr>
</table>
<p>
  <?php
  if ($c==1){
$result = pg_query($con,$query="SELECT distinct(SUBSTR(distribucion_cheque.ncheque,3)),cheque.ncheque,cheque.fecha,cheque.beneficiario,cheque.cedula_rif,cheque.monto_cheque,distribucion_cheque.cod_partida 
from distribucion_cheque 
inner join cheque on cheque.ncheque=distribucion_cheque.ncheque	
where
cheque.tipo_f='$condicion' AND
distribucion_cheque.estado='PAGADO' and
(cheque.fecha >=  '$desde') AND (cheque.fecha < '$hasta')
ORDER BY (SUBSTR(distribucion_cheque.ncheque,3))
");
}else{
$result = pg_query($con,$query="SELECT distinct(SUBSTR(distribucion_cheque.ncheque,3)),cheque.ncheque,cheque.fecha,cheque.beneficiario,cheque.cedula_rif,cheque.monto_cheque,distribucion_cheque.cod_partida 
from distribucion_cheque 
inner join cheque on cheque.ncheque=distribucion_cheque.ncheque	
where
distribucion_cheque.estado='PAGADO' and
(cheque.fecha >=  '$desde') AND (cheque.fecha < '$hasta')
ORDER BY (SUBSTR(distribucion_cheque.ncheque,3))
");
}


echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=100% bgcolor=#FFFFFF >";
echo "<tr>";
echo "<td <font size=2 align=left><small style=width: 50px><b>N�</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>FECHA</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>N� CHEQUE</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>BENEFICIARIO</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>CEDULA/RIF</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>MONTO CHEQUE</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>BASE IMPONIBLE</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>I.V.A</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>EXENTO</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>TOTAL FACTURA</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>RET IVA</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>RET ISRL</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>TOTAL A PAGAR</b></font></td>";
echo "</tr> ";
while ($row = pg_fetch_row($result)){

if ($row[6]=='0' or $row[6]=='49' or $row[6]=='16' or $row[6]=='41'or $row[6]=='42'){}else{ 
if ($cheq==$row[1]){}else{ 
$c++;
$tcheque=$row[5];
$texe=$row[5];
$total_monto_cheque=$total_monto_cheque+$tcheque;
$row[5]=number_format($row[5],2);	
$row[2]=cambiaf_a_normal($row[2]);

echo "<tr> ";
echo "<td <font size=2 align=center><small style=width: 50px>$c</font></td>";
echo "<td <font size=2 align=center><small style=width: 50px>$row[2]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$row[1]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$row[3]</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row[4]</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row[5]</font></td>";
$query11="select * from retencion_isrl
where retencion_isrl.ncheque='$row[1]'";
$result11=pg_query($con,$query11);
while ($resulta111 = pg_fetch_row($result11)){
$isrl_ret=$isrl_ret+$resulta111[8];
}
$query22="select * from retencion_iva
where retencion_iva.ncheque='$row[1]'";
$result22=pg_query($con,$query22);
while ($resulta222 = pg_fetch_row($result22)){
$base=$base+$resulta222[11];
$exento=$exento+$resulta222[10];
$iva=$iva+$resulta222[12];
$tfactura=$tfactura+$resulta222[9];
$iva_ret=$iva_ret+$resulta222[13];
}
if ($tfactura==0){$tfactura=$tcheque;}
$total_pagar=$tfactura-($iva_ret+$isrl_ret);
$total_base_imponible=$total_base_imponible+$base;
$total_iva=$total_iva+$iva;
$total_exento=$total_exento+$exento;
$total_factura=$total_factura+$tfactura;
$total_ret_iva=$total_ret_iva+$iva_ret;
$total_ret_isrl=$total_ret_isrl+$isrl_ret;
$total_general=$total_general+$total_pagar;
if($iva==""){
$exento=$texe;
$total_exento=$total_exento+$exento;
}
$mexento=number_format($exento,2);
$mbase=number_format($base,2);
$miva=number_format($iva,2);

$mtfactura=number_format($tfactura,2);
$miva_ret=number_format($iva_ret,2);
$misrl_ret=number_format($isrl_ret,2);
$mtotal_pagar=number_format($total_pagar,2);

echo "<td <font size=2 align=right><small style=width: 50px>$mbase</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$miva</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$mexento</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$mtfactura</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$miva_ret</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$misrl_ret</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$mtotal_pagar</font></td>";
$cheq=$row[1];
$base=0;
$exento=0;
$iva=0;
$tfactura=0;
$iva_ret=0;
$isrl_ret=0;
$total_pagar=0;
?>
</p>
<p></p>

<?PHP

echo "</tr> ";}}

$mtotal_monto_cheque=number_format($total_monto_cheque,2);
$mtotal_base_imponible=number_format($total_base_imponible,2);
$mtotal_iva=number_format($total_iva,2);
$mtotal_exento=number_format($total_exento,2);
$mtotal_factura=number_format($total_factura,2);
$mtotal_ret_iva=number_format($total_ret_iva,2);
$mtotal_ret_isrl=number_format($total_ret_isrl,2);
$mtotal_general=number_format($total_general,2);
}
echo "<tr>";
echo "<td <font size=2 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>TOTALES:</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtotal_monto_cheque</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtotal_base_imponible</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtotal_iva</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtotal_exento</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtotal_factura</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtotal_ret_iva</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtotal_ret_isrl</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtotal_general</b></font></td>";
echo "</tr> ";

echo "</table>";
?>
<p>&nbsp;</p>
<table width="830" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr bordercolor="#CCCCCC"> 
    <td width="192"><strong><font size="2">ELABORADO POR</font></strong></td>
    <td width="201"><strong><font size="2">REVISADO POR</font></strong></td>
    <td width="273"><strong><font size="2">AUTORIZADO POR</font></strong></td>
    <td width="164">&nbsp;</td>
  </tr>
  <tr> 
    <td><font size="2"><?php echo $row2['administrador'];?></font></td>
    <td><font size="2"><?php echo $row2['coordinador_adm'];?></font></td>
    <td><font size="2"><?php echo $row2['coordinador_sede'];?></font></td>
    <td><strong>SELLO</strong></td>
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
 <p> <a href="../consulta/menu_consulta.php?>">Atras</a>&nbsp; </p>