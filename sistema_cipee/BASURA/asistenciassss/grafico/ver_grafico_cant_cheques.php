<?php
include("../config.php");
$query2="SELECT * FROM configuracion where id_configuracion='1'";
$result2=pg_query($con,$query2);
$row2=pg_fetch_array($result2);
include("../consulta/titulo3.php");
//include("../utils.php");

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

$desde= $_GET['desde_year']."-".$_GET['desde_mes']."-".$_GET['desde_dia'];
$hasta= $_GET['hasta_year']."-".$_GET['hasta_mes']."-".$_GET['hasta_dia'];

$desde2= $_GET['desde_dia']."-".$_GET['desde_mes']."-".$_GET['desde_year'];
$hasta2=$_GET['hasta_dia']."-".$_GET['hasta_mes']."-".$_GET['hasta_year'];
include("../cheque/numero2.php"); 


if ($c1==1){

$query2="select count(id_cheque) from cheque
where cheque.tipo_f='$condicion' AND
(fecha >=  '$desde') AND (fecha < '$hasta')
";
$result_sum_cheq = pg_query($con,$query2);

$query3="select count(id_cheque) from cheque
where cheque.tipo_f='$condicion' AND
ESTADO='PAGADO' AND
(fecha >=  '$desde') AND (fecha < '$hasta')
";
$result_sum_pag = pg_query($con,$query3);



}else{
$result_sum_cheq = pg_query($con,$query2="select count(id_cheque) from cheque

where
(fecha >=  '$desde') AND (fecha < '$hasta')
");
$result_sum_pag = pg_query($con,$query3="select count(id_cheque) from cheque

where
ESTADO='PAGADO' AND
(fecha >=  '$desde') AND (fecha < '$hasta')
");

}

while ($tresult_sum_cheq = pg_fetch_row($result_sum_cheq)){
$total_acum_cheq=$tresult_sum_cheq[0];
}

//////////

while ($tresult_sum_pag = pg_fetch_row($result_sum_pag)){
$total_acum_pag=$tresult_sum_pag[0];
}






$diferencia=$total_acum_cheq-$total_acum_pag;
//$mdiferencia=number_format($diferencia,2);
//$mtotal_acum_pag=number_format($total_acum_pag,2);
//$mtotal_acum_cheq=number_format($total_acum_cheq,2);
$ptotal="100.00%";
$por1=($total_acum_pag*100)/$total_acum_cheq;
$ppagado=number_format($por1,2);
$por2=($diferencia*100)/$total_acum_cheq;
$pdiferencia=number_format($por2,2);
echo"<table align=center width=300 border=1>
<tr><td align=LEFT><font size=2 class=normal><strong>DESCRIPCION</strong></td><td align=right><font size=2 class=normal><strong> CANTIDAD</strong></td><td align=right><font size=2 class=normal><strong> %</strong></td></tr>
<tr><td align=LEFT><font size=2 class=normal>CHEQUES EMITIDOS</td><td align=right><font size=2 class=normal> $total_acum_cheq</td><td align=right><font size=2 class=normal> $ptotal</td></tr>
<tr><td align=LEFT><font size=2 class=normal>CHEQUES PAGADOS</td><td align=right><font size=2 class=normal>    $total_acum_pag</td><td align=right><font size=2 class=normal>    $ppagado%</td></tr>
<tr><td align=LEFT><font size=2 class=normal>CHEQUES ANULADOS</td><td align=right><font size=2 class=normal>  $diferencia</td><td align=right><font size=2 class=normal>  $pdiferencia%</td></tr>
</table>";
echo "<tr><td><p align=center valign=center><img src='grafico_cant_cheques.php?anual=$total_anual&ingreso=$total_acum_cheq&pagado=$total_acum_pag'></p></td</tr>";
echo "<tr><td align=center><p align=center valign=center><font size=1><strong>Fuente: Coordinacion de Administraci�n UBV BARINAS-PORTUGUESA</strong></font></p></td></tr>";

?>
<p>&nbsp;</p>
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
    <td>&nbsp;</td>
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