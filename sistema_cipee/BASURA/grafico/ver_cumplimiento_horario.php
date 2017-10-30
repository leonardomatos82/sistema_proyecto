<?php
include("../config.php");
include("../utils.php");
$desde2= $_POST['desde_year']."-".$_POST['desde_mes']."-".$_POST['desde_dia'];
$hasta2= $_POST['hasta_year']."-".$_POST['hasta_mes']."-".$_POST['hasta_dia'];
if ($_POST[cedula]==''){
$_POST[cedula]=$_POST[codigo];
}
$sql="SELECT * FROM asistencia 
inner join trabajador
on asistencia.cedula=trabajador.cedula
where asistencia.cedula='$_POST[cedula]' 
and (asistencia.fecha >=  '$desde2' AND asistencia.fecha <=  '$hasta2') 
ORDER BY asistencia.fecha ASC";
$resultp=pg_query($con,$sql);
$rowp = pg_fetch_row($resultp)
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
    <td height="0" colspan="2"><p align="center"><strong><font size="5" face="Times New Roman, Times, serif">CUMPLIMIENTO DEL HORARIO POR TRABAJADOR</font></strong></p></td>
  </tr>

</table>



<table align="center" width="750px"  border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr>
    <td height="0"><div align="left"><strong>TRABAJADOR: </strong> <? echo $rowp[15];?></div></td>
  </tr>
<tr>
    <td height="0"><div align="left"><strong>CEDULA: </strong><? echo $rowp[14];?></div></td>
  </tr>
<tr>
    <td height="0"><div align="left"><strong>CARGO: </strong><? echo $rowp[18];?></div></td>
  </tr>
<tr>
    <td height="0"><div align="left"><strong>DEPARTAMENTO: </strong><? echo $rowp[19];?></div></td>
  </tr>
</table>

<p>&nbsp;</p>

<? 
$queryb="SELECT * FROM asistencia 
inner join trabajador
on asistencia.cedula=trabajador.cedula
where asistencia.cedula='$_POST[cedula]' 
and (asistencia.fecha >=  '$desde2' AND asistencia.fecha <=  '$hasta2') 
ORDER BY asistencia.fecha ASC";
//and (asistencia.fecha >=  '$desde2' AND asistencia.fecha <=  '$hasta2') 
$resultb=pg_query($con,$queryb);
while ($rowb = pg_fetch_array($resultb)){  

if ($rowb[entra1]!='' and $rowb[entra1]<='08:15'){
$cr=$cr+1;
}else{
$ci=$ci+1;
}
if ($rowb[sale1]!='' and $rowb[sale1]>='11:50'){
$cr=$cr+1;
}else{
$ci=$ci+1;
}
if ( $rowb[entra2]!='' and $rowb[entra2]<='01:15'){
$cr=$cr+1;
}else{
$ci=$ci+1;
}
if ($rowb[sale2]!='' and $rowb[sale2]>='04:00'){
$cr=$cr+1;
}else{
$ci=$ci+1;
}
}

$suma=$cr+$ci;
$porcr=($cr*100)/$suma;
$porci=($ci*100)/$suma;


$anchura1=$porcr*4;
$anchura2=$porci*4;
$porcr=number_format($porcr,0,',', '.');



?>

<table align="center" border=0 cellspacing=0 cellpadding=0>
	<tr><td align=right><font size=6><strong><? echo $porcr;?>%<strong></font></td><td valign=bottom></td></tr>	
<tr>	
		
		
	
		<td valign=bottom>
			<img border=2 src="cuadro_verde.gif" width=<?echo $anchura1?> height=40></td><td valign=bottom><img border=2 src="cuadro_rojo.gif" width=<?echo $anchura2?> height=40>
		</td>
</tr>


</table>
<table align="center" border=0 cellspacing=0 cellpadding=0>
	<tr><td align=right><img border=2 src="cuadro_verde.gif" width=10 height=10><strong><strong></td><td valign=bottom><font size=2>CUMPLE EL HORARIO</font></td></tr>	
<tr>	
		
		
	
		<td valign=bottom>
			<img border=2 src="cuadro_rojo.gif" width=10 height=10></td><strong><strong><td valign=bottom><font size=2>NO CUMPLE EL HORARIO</font>
		</td>
</tr>
</table>

<p>&nbsp;</p>
<table width="35%" height="38" border="0"  align="center" cellpadding="0" cellspacing="1" >
      <tbody>
      </tbody>
      <tr>
        <td width="100%" height="42" bordercolor="#000000" bgcolor="#FFFFFF">




<?php
$sql="SELECT * FROM asistencia 
inner join trabajador
on asistencia.cedula=trabajador.cedula
where asistencia.cedula='$_POST[cedula]' 
and (asistencia.fecha >=  '$desde2' AND asistencia.fecha <=  '$hasta2') 
ORDER BY asistencia.fecha ASC";
$result=pg_query($con,$sql);

echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=100% bgcolor=#FFFFFF >";

 
echo "<tr>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=2>FECHA</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b><font size=2>ENTRA</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=2>SALE</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=2>ENTRA</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=2>SALE</b></td>";


echo "</tr> ";

while ($row = pg_fetch_row($result)){
$color1='cuadro_rojo.gif';
$color2='cuadro_rojo.gif';
$color3='cuadro_rojo.gif';
$color4='cuadro_rojo.gif';

if ($row[4]!='' and $row[4]<='08:15'){
$color1='cuadro_verde.gif';
}
if ($row[5]!='' and $row[5]>='11:50'){
$color2='cuadro_verde.gif';
}
if ($row[6]!='' and $row[6]<='01:15'){
$color3='cuadro_verde.gif';
}
if ($row[7]!='' and $row[7]>='04:00'){
$color4='cuadro_verde.gif';
}
echo "<tr> ";
$row[1]=cambiaf_a_normal($row[1]);
echo "<td <small style=width: 100px ><font size=2>$row[1]</td> ";
echo "<td background='$color1'<small style=width: 50px ><font size=2>$row[4]</td> ";
echo "<td background='$color2'<small style=width: 50px ><font size=2>$row[5]</td> ";
echo "<td background='$color3'<small style=width: 50px ><font size=2>$row[6]</td> ";
echo "<td background='$color4'<small style=width: 50px ><font size=2>$row[7]</td> ";
?>
        </td>
      
        <?PHP
echo "</tr> ";
}
echo "</table>";
echo "</table>";
?>





