<?php
include("../config.php");

?>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
<table align="center" width="750px" height="75px" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td width="144" rowspan="5"><div align="center"><strong><font size="2" face="Times New Roman, Times, serif"><img src="../imagenes/ubv.jpg" width="75" height="75" /></font></strong></div></td>
    <td height="0"><p align="right"><strong><font size="2">REPUBLICA BOLIVARIANA 
        DE VENEZUELA</font></strong></p></td>
  </tr>
   
  <tr> 
    <td height="0"><div align="right"><font size="2"><strong><font face="Times New Roman, Times, serif">UNIVERSIDAD 
      BOLIVARIANA DE VENEZUELA</font> </strong></font></td>
  </tr>
 <tr> 
    <td height="0"> <div align="right"><font size="2"><strong><font face="Times New Roman, Times, serif">RECTORADO</font></strong></font></div></td>
  </tr>
 <tr> 
    <td height="0"><div align="right"><strong><font size="2" face="Times New Roman, Times, serif">COORDINACION DE DESARROLLO DE TALENTO HUMANO EJE BARINAS- PORTUGUESA</font></strong></td>
  </tr>

  <tr>
    <td height="0"><div align="right"><strong></strong></div></td>
    <td height="0"><strong><font size="2" face="Times New Roman, Times, serif"></font></strong></td>
  </tr>
</table>
<td>&nbsp;</td>
<table width="625" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr> 
    <td height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif">TH-<? echo $_POST[num] ?>-<?echo $ano;?></font></strong></p></td>
  </tr>
 <tr> 
    <td height="0" colspan="2"><p align="center"><strong><font size="5" face="Times New Roman, Times, serif">ESTADISTICAS DEL SISTEMA DE CONTROL DE CONSTANCIAS DE TRABAJO</font></strong></p></td>
  </tr>
</table>
 <td>&nbsp;</td>
<?
$query2="SELECT * FROM configuracion where id_configuracion='1'";
$result2=pg_query($con,$query2);
$row2=pg_fetch_array($result2);
include("../consulta/titulo3.php");


include("../cheque/numero2.php"); 





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
echo "<tr><td align=center><p align=center valign=center><font size=1><strong>Fuente: Coordinacion de Administración UBV BARINAS-PORTUGUESA</strong></font></p></td></tr>";

?>

