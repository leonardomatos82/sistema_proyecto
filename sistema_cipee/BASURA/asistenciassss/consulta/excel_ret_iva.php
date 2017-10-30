<?php
 header("Content-type: application/vnd.ms-excel");
 header("Content-Disposition:  filename=\"BARINAS_RET_IVA_al_$hasta2.$_GET[archivo]\";");
include("../config.php");
include("../utils.php");
$query2="SELECT * FROM configuracion where id_configuracion='1'";
$result2=pg_query($con,$query2);
$row2=pg_fetch_array($result2);
$archivo=$_GET['archivo'];
$desde= $_GET['desde_year']."-".$_GET['desde_mes']."-".$_GET['desde_dia'];
$hasta= $_GET['hasta_year']."-".$_GET['hasta_mes']."-".$_GET['hasta_dia'];
$desde2= $_GET['desde_dia']."-".$_GET['desde_mes']."-".$_GET['desde_year'];
$hasta2= $_GET['hasta_dia']."-".$_GET['hasta_mes']."-".$_GET['hasta_year'];
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

<?PHP 
echo "<table border =0>";
 echo "<tr> REPUBLICA BOLIVARIANA DE VENEZUELA $archivo</tr>";
 echo "<tr> MINISTERIO DEL PODER 
        POPULAR PARA LA EDUCACION SUPERIOR </tr>";
 echo "<tr> UNIVERSIDAD BOLIVARIANA DE VENEZUELA </tr>";
  echo "<tr> SEDE BARINAS-PORTUGUESA </tr>";
 echo "</table>";
  ?> 
<tr><strong><font size="4" face="Times New Roman, Times, serif">RELACION DE RETENCIONES 
  DEL IVA</font></strong> Desde: <strong><font size="2" face="Times New Roman, Times, serif"><?php echo $_GET['desde_dia']."/".$_GET['desde_mes']."/".$_GET['desde_year'];?></font></strong>, 
  Hasta:<strong><font size="2" face="Times New Roman, Times, serif"> <?php echo $_GET['hasta_dia']."/".$_GET['hasta_mes']."/".$_GET['hasta_year'];?></font></strong> 
  <strong></strong> </tr>
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
</p>
<p>
  <?php
    if ($c==1){
$result = pg_query($con,$query="SELECT *
from retencion_iva 
inner join cheque on cheque.ncheque=retencion_iva.ncheque	
where
cheque.tipo_f='$condicion' AND
cheque.estado='PAGADO' and
(cheque.fecha >=  '$desde') AND (cheque.fecha < '$hasta')
ORDER BY (cheque.id_cheque) 
");
}else{
$result = pg_query($con,$query="SELECT *
from retencion_iva 
inner join cheque on cheque.ncheque=retencion_iva.ncheque	
where
cheque.estado='PAGADO' and
(cheque.fecha >=  '$desde') AND (cheque.fecha < '$hasta')
ORDER BY (cheque.id_cheque) 
");

}

//RECUERDA ORDENARLOS POR FECHA-----EN EL ORDER BY Y GROUP BY
echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=100% bgcolor=#FFFFFF >";
echo "<tr>";
echo "<td <font size=2 align=left><small style=width: 50px><b>RIF CONTRIB.</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>PERIODO</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>FECHA FACTURA</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>RIF PROVEEDOR</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>Nº FACTURA</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>Nº CONTROL</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>MONTO TOTAL</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>BASE IMPONIBLE</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>__I.V.A__</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>_IVA RET_</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>Nº DOC AJUST.</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>COMPROBANTE</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>EXENTO</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>% ALICUOTA</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>Nº DOCUMENTO</b></font></td>";
echo "</tr> ";
while ($row = pg_fetch_row($result)){

//if ($row[6]=='0' or $row[6]=='42'){}else{ 
//if ($cheq==$row[1]){}else{ 
//$c++;
//$tcheque=$row[5];
$total_monto_cheque=$total_monto_cheque+$tcheque;
$row9=number_format($row[9],2,',','.');	
$row10=number_format($row[10],2,',','.');
$row11=number_format($row[11],2,',','.');
$row12=number_format($row[12],2,',','.');	
$row13=number_format($row[13],2,',','.');
$row[0]=cambiaf_a_periodo($row[0]);
$tfactura=$tfactura+$row[9];
$base=$base+$row[11];
$iva=$iva+$row[12];
$iva_ret=$iva_ret+$row[13];
$exento=$exento+$row[10];
$total_base_imponible=$total_base_imponible+$base;
$total_iva=$total_iva+$iva;
$total_factura=$total_factura+$tfactura;
$total_ret_iva=$total_ret_iva+$iva_ret;
$total_exento=$total_exento+$exento;
echo "<tr> ";
echo "<td <font size=2 align=center><small style=width: 50px>$row2[rif]</font></td>";
echo "<td <font size=2 align=center><small style=width: 50px>$row[0]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$row[4]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$row[2]</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row[5]</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row[6]</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row9</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row11</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row12</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row13</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row[3]</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row[10]</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row[16]</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row[7]</font></td>";
//$query11="select * from retencion_isrl
//where retencion_isrl.ncheque='$row[1]'";
//$result11=pg_query($con,$query11);
//while ($resulta111 = pg_fetch_row($result11)){
//$isrl_ret=$isrl_ret+$resulta111[8];
//}
//$query22="select * from retencion_iva
//where retencion_iva.ncheque='$row[1]'";
//$result22=pg_query($con,$query22);
//while ($resulta222 = pg_fetch_row($result22)){


//$total_ret_isrl=$total_ret_isrl+$isrl_ret;
//$total_general=$total_general+$total_pagar;
//$mexento=number_format($exento,2);
//$mbase=number_format($base,2);
//$miva=number_format($iva,2);
//$mtfactura=number_format($tfactura,2);
//$miva_ret=number_format($iva_ret,2);
//$misrl_ret=number_format($isrl_ret,2);
//$mtotal_pagar=number_format($total_pagar,2);

//echo "<td <font size=2 align=right><small style=width: 50px>$mbase</font></td>";
//echo "<td <font size=2 align=right><small style=width: 50px>$miva</font></td>";
//echo "<td <font size=2 align=right><small style=width: 50px>$mexento</font></td>";
//echo "<td <font size=2 align=right><small style=width: 50px>$mtfactura</font></td>";
//echo "<td <font size=2 align=right><small style=width: 50px>$miva_ret</font></td>";
//echo "<td <font size=2 align=right><small style=width: 50px>$misrl_ret</font></td>";
//echo "<td <font size=2 align=right><small style=width: 50px>$mtotal_pagar</font></td>";
//$cheq=$row[1];
$base=0;
$exento=0;
$iva=0;
$tfactura=0;
$iva_ret=0;
//$isrl_ret=0;
//$total_pagar=0;
?>
</p>
<p></p>

<?PHP

echo "</tr> ";
//}
//}

$mtotal_factura=number_format($total_factura,2,',','.');
$mtotal_base_imponible=number_format($total_base_imponible,2,',','.');
$mtotal_iva=number_format($total_iva,2,',','.');
$mtotal_exento=number_format($total_exento,2,',','.');

$mtotal_ret_iva=number_format($total_ret_iva,2,',','.');
}
echo "<tr>";
echo "<td <font size=2 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>TOTALES:</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtotal_factura</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtotal_base_imponible</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtotal_iva</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtotal_ret_iva</b></font></td>";


echo "<td <font size=2 align=right><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtotal_exento</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>-</b></font></td>";
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
    <td><font size="2"><?php echo "ADMINISTRADOR";?></font></td>
    <td><font size="2"><?php echo "COORD. ADMINISTRATIVO";?></font></td>
    <td><font size="2"><?php echo"COORD. DE SEDE";?></font></td>  
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
    <td><div align="left"><font face="CodabarMedium"><?php echo $_GET['desde_dia']."/".$_GET['desde_mes']."/".$_GET['desde_year'];?><?php echo $_GET['hasta_dia']."/".$_GET['hasta_mes']."/".$_GET['hasta_year'];?></font></div></td>
  </tr>
</table>
