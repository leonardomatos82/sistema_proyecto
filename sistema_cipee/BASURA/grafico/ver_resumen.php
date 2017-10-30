<?php
include("../config.php");
$query1="select count(solicitud.id_solicitud) from solicitud
inner join trabajador on
trabajador.cedula=solicitud.cedula";
$result1=pg_query($con,$query1);
$row1 = pg_fetch_row($result1);


 $query2="select count(solicitud.id_solicitud) from solicitud
inner join trabajador on
trabajador.cedula=solicitud.cedula
where trabajador.departamento='$_POST[dpto]'";

$result2=pg_query($con,$query2);
$row2= pg_fetch_row($result2);
include ("jpgraph.php");
include ("jpgraph_pie.php");
include ("jpgraph_pie3d.php");
$demas=$row1[0]-$row2[0];
$total=($row2[0]*100)/$row1[0];
$total2=100-$total;
$total=number_format($total,2,',', '.');
$total2=number_format($total2,2,',', '.');
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
<p>&nbsp;</p>
<table align="center" width="750px" height="75px" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">

 <tr>
    <td height="0" colspan="2"><p align="center"><strong><font size="5" face="Times New Roman, Times, serif">GRAFICO DE SOLICITUD DE CONSTANCIAS DE TRABAJO</font></strong></p></td>
  </tr>
 <tr>
    <td height="0" colspan="2"><p align="center"><strong><font size="3" face="Times New Roman, Times, serif">COORDINACION <? echo $_POST[dpto];?></font></strong></p></td>
  </tr>
</table>
<p>&nbsp;</p>
<table width="300" align="center" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr> 
    <td height="0" colspan="2"><p align="left"><strong><font size="3" face="Times New Roman, Times, serif">Descripcion</font></strong></p></td>
 <td height="0" colspan="2"><p align="left"><strong><font size="3" face="Times New Roman, Times, serif">Solicitudes</font></strong></p></td>
 <td height="0" colspan="2"><p align="right"><strong><font size="3" face="Times New Roman, Times, serif">%</font></strong></p></td>
</tr>
  
 <tr>  
 <td height="0" colspan="2"><p align="left"><strong><font size="1" face="Times New Roman, Times, serif"><?echo $_POST[dpto] ?></font></strong></p></td>
 <td height="0" colspan="2"><p align="center"><strong><font size="3" face="Times New Roman, Times, serif"><? echo $row2[0]; ?></font></strong></p></td>
 <td height="0" colspan="2"><p align="right"><strong><font size="3" face="Times New Roman, Times, serif"><? echo $total; ?></font></strong></p></td>
</tr>
<tr>  
 <td height="0" colspan="2"><p align="left"><strong><font size="1" face="Times New Roman, Times, serif">DEMAS COORDINACIONES</font></strong></p></td>
 <td height="0" colspan="2"><p align="center"><strong><font size="3" face="Times New Roman, Times, serif"><? echo $demas; ?></font></strong></p></td>
 <td height="0" colspan="2"><p align="right"><strong><font size="3" face="Times New Roman, Times, serif"><? echo $total2; ?></font></strong></p></td>
</tr>
<tr>  
 <td height="0" colspan="2"><p align="right"><strong><font size="1" face="Times New Roman, Times, serif">TOTALES</font></strong></p></td>
 <td height="0" colspan="2"><p align="center"><strong><font size="3" face="Times New Roman, Times, serif"><? echo $tot=$row1[0]; ?></font></strong></p></td>
 <td height="0" colspan="2"><p align="right"><strong><font size="3" face="Times New Roman, Times, serif">100</font></strong></p></td>
</tr>
</table>
<? 
echo "<tr><td><p align=center valign=center><img src='grafico_cant_departamento.php?dpto=$_POST[dpto]'></p></td</tr>";
 ?>
<td><font size="1"> <? include("../pie.php");  ?></font></td>



