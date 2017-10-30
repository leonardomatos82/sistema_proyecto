<?php
include("../config.php");
include("../utils.php");
$query2="SELECT * FROM configuracion where id_configuracion='1'";
$result2=pg_query($con,$query2);
$row2=pg_fetch_array($result2);

$desde= $_GET['desde_year']."-".$_GET['desde_mes']."-".$_GET['desde_dia'];
$hasta= $_GET['hasta_year']."-".$_GET['hasta_mes']."-".$_GET['hasta_dia'];

$desde2= $_GET['desde_year']."-".$_GET['desde_mes']."-".$_GET['desde_dia'];
$hasta2=$_GET['hasta_year']."-".$_GET['hasta_mes']."-".$_GET['hasta_dia'];
include("../cheque/numero2.php"); 
if ($_GET['tipo']=="FONDO MENSUAL")
{
$c1=1;
$c2=1;

$condicion="FONDO MENSUAL";
}else{
if ($_GET['tipo']=="FONDO ESPECIAL")
{
$condicion="FONDO ESPECIAL";
$c1=1;
$c2=1;
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
    <td height="0" colspan="2"><p align="center"><strong><font size="4" face="Times New Roman, Times, serif">EJECUCION 
        PRESUPUESTARIA GENERAL </font></strong></p></td>
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
$hasta2=cambiaf_a_normal($hasta2);
$result = pg_query($con,$query="SELECT *
from p_terciaria 
ORDER BY id_p_terciaria ASC
");
echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=100% bgcolor=#FFFFFF >";
echo "<tr>";
echo "<td <font size=2 align=left><small style=width: 50px><b>CODIGO</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>DENOMINACION DE LA PARTIDA</b></font></td>";
//echo "<td <font size=2 align=left><small style=width: 50px><b>ASIG. MENSUAL</b></font></td>";
//echo "<td <font size=2 align=left><small style=width: 50px><b>ASIG. ANUAL</b></font></td>";
//echo "<td <font size=2 align=left><small style=width: 50px><b>EJEC. ANT.</b></font></td>";
//echo "<td <font size=2 align=left><small style=width: 50px><b>EJEC. $hasta2 </b></font></td>";
//echo "<td <font size=2 align=left><small style=width: 50px><b>EJEC. ACUM</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>DISPONIBLE</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>PORCENTAJE</b></font></td>";
echo "</tr> ";
while ($row = pg_fetch_row($result)){
if ($row[0]=='0'){}else{ 
echo "<tr> ";
////////////*** lo ejecutado anterior a la fecha dada por el usuario
$pagado="PAGADO"; 
 if ($c1==1){
$query11="select distribucion_cheque.monto from distribucion_cheque
where 
distribucion_cheque.tipo_f='$condicion' AND
distribucion_cheque.cod_partida='$row[4]' AND
distribucion_cheque.estado='$pagado' AND
(distribucion_cheque.fecha >=  '$row2[comienzo_anio]') AND (distribucion_cheque.fecha <= '$desde')
";
$query33="select distribucion_caja_chica.monto_factura from distribucion_caja_chica
where 
distribucion_caja_chica.cod_partida='$row[4]' AND
distribucion_caja_chica.estado='$pagado' AND
(distribucion_caja_chica.fecha >=  '$row2[comienzo_anio]') AND (distribucion_caja_chica.fecha <= '$desde')
";

}else{
$query11="select distribucion_cheque.monto from distribucion_cheque
where 
distribucion_cheque.cod_partida='$row[4]' AND
distribucion_cheque.estado='$pagado' AND
(distribucion_cheque.fecha >=  '$row2[comienzo_anio]') AND (distribucion_cheque.fecha <= '$desde')
";
$query33="select distribucion_caja_chica.monto_factura from distribucion_caja_chica
where 
distribucion_caja_chica.cod_partida='$row[4]' AND
distribucion_caja_chica.estado='$pagado' AND
(distribucion_caja_chica.fecha >=  '$row2[comienzo_anio]') AND (distribucion_caja_chica.fecha <= '$desde')
";
}
$result33=pg_query($con,$query33);
$row33=0;
while ($resulta333 = pg_fetch_row($result33)){
$row33=$row33+$resulta333[0];

}
//echo $row33;

$result11=pg_query($con,$query11);
while ($resulta111 = pg_fetch_row($result11)){
$row11=$row11+$resulta111[0];
}
$row11=$row11+$row33;

////////////*** lo ejecutado en la fecha dada por el usuario
 if ($c2==1){
$query22="select distribucion_cheque.monto from distribucion_cheque
where 
distribucion_cheque.tipo_f='$condicion' AND
distribucion_cheque.cod_partida='$row[4]' AND
distribucion_cheque.estado='$pagado' AND
(distribucion_cheque.fecha >=  '$desde') AND (distribucion_cheque.fecha <= '$hasta')
";
$query44="select distribucion_caja_chica.monto_factura from distribucion_caja_chica
where 
distribucion_caja_chica.cod_partida='$row[4]' AND
distribucion_caja_chica.estado='$pagado' AND
(distribucion_caja_chica.fecha >=  '$desde') AND (distribucion_caja_chica.fecha <= '$hasta')
";
}else{
$query22="select distribucion_cheque.monto from distribucion_cheque
where 
distribucion_cheque.cod_partida='$row[4]' AND
distribucion_cheque.estado='$pagado' AND
(distribucion_cheque.fecha >=  '$desde') AND (distribucion_cheque.fecha <= '$hasta')
";
$query44="select distribucion_caja_chica.monto_factura from distribucion_caja_chica
where 
distribucion_caja_chica.cod_partida='$row[4]' AND
distribucion_caja_chica.estado='$pagado' AND
(distribucion_caja_chica.fecha >=  '$desde') AND (distribucion_caja_chica.fecha <= '$hasta')
";
}
$row44=0;
$result44=pg_query($con,$query44);
while ($resulta444 = pg_fetch_row($result44)){
$row44=$row44+$resulta444[0];
}
$result22=pg_query($con,$query22);
while ($resulta222 = pg_fetch_row($result22)){
$row22=$row22+$resulta222[0];
}



$row22=$row22+$row44;
$ejec_acum=$row11+$row22;
$disponible=$row[2]-$ejec_acum;
$mejec_acum=number_format($ejec_acum,2,',','.');
$mdisponible=number_format($disponible,2,',','.');
$mrow11=number_format($row11,2,',','.');
$mrow22=number_format($row22,2,',','.');
$mrowmes=number_format($row[3],2,',','.');
$mrowanio=number_format($row[2],2,',','.');

$tot_anual=$tot_anual+$row[2];
$tot_mensual=$tot_mensual+$row[3];
$tot_ant=$tot_ant+$row11;
$tot_mes=$tot_mes+$row22;
$tot_acum=$tot_acum+$ejec_acum;
$tot_disp=$tot_disp+$disponible;
//codigo y descripcion de la partida
echo "<td <font size=2 align=left><small style=width: 50px>$row[0]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$row[1]</font></td>";
//montos mensuales y anuales asignados a las partidas
//echo "<td <font size=2 align=right><small style=width: 50px>$mrowmes</font></td>";
//echo "<td <font size=2 align=right><small style=width: 50px>$mrowanio</font></td>";
//lo ejecutado en anterior al rango de fecha dado
//echo "<td <font size=2 align=right><small style=width: 50px>$mrow11</font></td>";
//lo ejecutado en el rango de fecha dado
//echo "<td <font size=2 align=right><small style=width: 50px>$mrow22</font></td>";

//suma lo acumulado entre lo anterior y lo ejecutado en el rango de fecha dado
//echo "<td <font size=2 align=right><small style=width: 50px>$mejec_acum</font></td>";
//resta la asignacion anual con el acumulado 
echo "<td <font size=2 align=right><small style=width: 50px>$mdisponible</font></td>";

echo "<td <font size=2 align=right><small style=width: 50px>$porc</font></td>";
$conta=$conta+1;
$titulos[$conta] =$row[0];
$valores[$conta] =$disponible;
$row22="";
$row11="";
$ejec_acum="";
$disponible="";
?>
</p>
<p></p>

<?PHP

echo "</tr> ";
}
}
echo "<tr>";
$mtot_anual=number_format($tot_anual,2,',','.');
$mtot_mensual=number_format($tot_mensual,2,',','.');
$mtot_ant=number_format($tot_ant,2,',','.');
$mtot_mes=number_format($tot_mes,2,',','.');
$mtot_acum=number_format($tot_acum,2,',','.');
$mtot_disp=number_format($tot_disp,2,',','.');



echo "<td <font size=2 align=center><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>TOTAL DISPONIBILIDAD AL $hasta2:</b></font></td>";
//echo "<td <font size=2 align=right><small style=width: 50px><b>$mtot_mensual</b></font></td>";
//echo "<td <font size=2 align=right><small style=width: 50px><b>$mtot_anual</b></font></td>";
//echo "<td <font size=2 align=right><small style=width: 50px><b>$mtot_ant</b></font></td>";
//echo "<td <font size=2 align=right><small style=width: 50px><b>$mtot_mes</b></font></td>";
//echo "<td <font size=2 align=right><small style=width: 50px><b>$mtot_acum</b></b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtot_disp</b></font></td>";

echo "</tr> ";
echo "</table>";
echo "<tr><td><p align=center valign=center><img src='grafico_cant_presupuesto.php?
titulo1=$titulos[1]&valor1=$valores[1]&
titulo2=$titulos[2]&valor2=$valores[2]&
titulo3=$titulos[3]&valor3=$valores[3]&
titulo4=$titulos[4]&valor4=$valores[4]&
titulo5=$titulos[5]&valor5=$valores[5]&
titulo6=$titulos[6]&valor6=$valores[6]&
titulo7=$titulos[7]&valor7=$valores[7]&
titulo8=$titulos[8]&valor8=$valores[8]&
titulo9=$titulos[9]&valor9=$valores[9]&
titulo10=$titulos[10]&valor10=$valores[10]&
titulo11=$titulos[11]&valor11=$valores[11]&
titulo12=$titulos[12]&valor12=$valores[12]&
titulo13=$titulos[13]&valor13=$valores[13]&
titulo14=$titulos[14]&valor14=$valores[14]&
titulo15=$titulos[15]&valor15=$valores[15]&
titulo16=$titulos[16]&valor16=$valores[16]&
titulo17=$titulos[17]&valor17=$valores[17]&
titulo18=$titulos[18]&valor18=$valores[18]&
titulo19=$titulos[19]&valor19=$valores[19]&
titulo20=$titulos[20]&valor20=$valores[20]&
titulo21=$titulos[21]&valor21=$valores[21]&
titulo22=$titulos[22]&valor22=$valores[22]&
titulo23=$titulos[23]&valor23=$valores[23]&
titulo24=$titulos[24]&valor24=$valores[24]&
titulo25=$titulos[25]&valor25=$valores[25]&
titulo26=$titulos[26]&valor26=$valores[26]&
titulo27=$titulos[27]&valor27=$valores[27]&
titulo28=$titulos[28]&valor28=$valores[28]&
titulo29=$titulos[29]&valor29=$valores[29]&
titulo30=$titulos[30]&valor30=$valores[30]&
titulo31=$titulos[31]&valor31=$valores[31]&
titulo32=$titulos[32]&valor32=$valores[32]&
titulo33=$titulos[33]&valor33=$valores[33]&
titulo34=$titulos[34]&valor34=$valores[34]&
titulo35=$titulos[35]&valor35=$valores[35]&
titulo36=$titulos[36]&valor36=$valores[36]&
titulo37=$titulos[37]&valor37=$valores[37]&
 '></p></td</tr>";
echo "<tr><td align=center><p align=center valign=center><font size=1><strong>Fuente: Coordinacion de Administración UBV BARINAS-PORTUGUESA</strong></font></p></td></tr>";


echo $titulos[1];
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
    <td><div align="left"><font face="CodabarMedium"><?php echo $_GET['desde_dia']."/".$_GET['desde_mes']."/".$_GET['desde_year'];?><?php echo $_GET['hasta_dia']."/".$_GET['hasta_mes']."/".$_GET['hasta_year'];?></font></div></td>
  </tr>
</table>
<p>&nbsp;</p>
 <p> <a href="../consulta/menu_consulta.php?>">Atras</a>&nbsp; </p>
