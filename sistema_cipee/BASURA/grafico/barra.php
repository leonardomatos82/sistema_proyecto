<?
include("../config.php");
$_POST[cedula]=$_GET[cedula];
$query2="SELECT * FROM asistencia 
inner join trabajador
on asistencia.cedula=trabajador.cedula
where asistencia.cedula='$_POST[cedula]' 
ORDER BY asistencia.fecha ASC";
//and (asistencia.fecha >=  '$desde2' AND asistencia.fecha <=  '$hasta2') 
$result2=pg_query($con,$query2);
while ($row2 = pg_fetch_array($result2)){  

if ($row2[entra1]!='' and $row2[entra1]<='08:15'){
$cr=$cr+1;
}else{
$ci=$ci+1;
}
if ($row2[sale1]!='' and $row2[sale1]>='12:00'){
$cr=$cr+1;
}else{
$ci=$ci+1;
}
if ( $row2[entra2]!='' and $row2[entra2]<='01:15'){
$cr=$cr+1;
}else{
$ci=$ci+1;
}
if ($row2[sale2]!='' and $row2[sale2]>='04:00'){
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
