<?php
include("../config.php");
include("../utils.php");
$query2="SELECT * FROM configuracion where id_configuracion='1'";
$result2=pg_query($con,$query2);
$row2=pg_fetch_array($result2);
$cuenta_reg=0;
$anio= $_GET['desde_year'];
$mes=$_GET['desde_mes'];
$anio_sist=date(Y);
$desde= $_GET['desde_year']."-".$_GET['desde_mes']."-".$_GET['desde_dia'];
$hasta= $_GET['hasta_year']."-".$_GET['hasta_mes']."-".$_GET['hasta_dia'];

$desde2= $_GET['desde_year']."-".$_GET['desde_mes']."-".$_GET['desde_dia'];
$hasta2=$_GET['hasta_year']."-".$_GET['hasta_mes']."-".$_GET['hasta_dia'];



$dia1=$_GET['desde_dia']."-".$_GET['desde_mes']."-".$_GET['desde_year'];
$dia2=$_GET['hasta_dia']."-".$_GET['hasta_mes']."-".$_GET['hasta_year'];
// Ej.: con fechas fijas
$resultado_resta = restaFechas($dia1,$dia2);
echo "".$resultado_resta." días.";











include("../cheque/numero2.php"); 
if ($_GET['tipo']!="0")
{
$c=1;
$condicion=$_GET['tipo'];
}
?>
<?php
include("titulo.php");
 echo "<p align=right><font size=2 align=right><small style=width: 50px>Pagina: 1</font></p>";
 $pag++;

/////////////////////////////////////////////////////////////////////////////////////////////////
$result_sum_ing = pg_query($con,$query="SELECT * from ingresos 
where
(fecha >=  '$row2[comienzo_anio]') AND (fecha < '$desde2')
");
while ($tresult_sum_ing = pg_fetch_row($result_sum_ing)){
$total_acum_ing=$total_acum_ing+$tresult_sum_ing[4];

}
$result_sum_cheques = pg_query($con,$query="SELECT * from cheque 
where
ESTADO='PAGADO' AND
(fecha >=  '2008-01-01') AND (fecha < '$desde2')
order by fecha
");
while ($tresult_sum_cheque2 = pg_fetch_row($result_sum_cheques2)){
echo $tresult_sum_cheque2[2]; 
$total_acum_cheq=$total_acum_cheq+$tresult_sum_cheque2[2];
}
$saldo_anterior=$total_acum_ing-$total_acum_cheq;
$msaldo_anterior=$saldo_anterior;
$tdebe=$tdebe+$total_acum_ing-$total_acum_cheq;
$msaldo_anterior=number_format($msaldo_anterior,2,',','.');
$desde2=cambiaf_a_normal($desde2);
echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=100% bgcolor=#FFFFFF >";
echo "<tr>";
echo "<td <font size=2 align=left><small style=width: 50px><b>_FECHA_</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>CODIGO</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>BENEFICIARIO</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>CONCEPTO</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>_DEBE_</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>_HABER_</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>_SALDO_</b></font></td>";
echo "</tr> ";
echo "<tr>";
echo "<td <font size=2 align=center><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=center><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>SALDO ANTERIOR AL $desde2 ...</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$msaldo_anterior</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$msaldo_anterior</font></td>";
echo "</tr> ";
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////




for ($i=1;$i<=$resultado_resta;$i++)
{
echo $i;
}





$query66 = pg_query($con,$query="select * from debitos"); 

$result = pg_query($con,$query="SELECT cheque.id_cheque,cheque.ncheque,cheque.fecha,cheque.monto_cheque,cheque.beneficiario,cheque.cedula_rif,cheque.concepto,cheque.estado,cheque.fecha_a from cheque 
where
(fecha >= '$desde' AND fecha <= '$hasta')
ORDER BY id_cheque ASC
");

$result_ingresos = pg_query($con,$query="SELECT * from ingresos 
order by FECHA
");






while ($resultaingresos = pg_fetch_row($result_ingresos)){

$fecha_ant=$resultaingresos[0];
$mresultaingresos=number_format($resultaingresos[4],2,',','.');
$mresultaingresos0=cambiaf_a_normal($resultaingresos[0]);
echo "<td <font size=2 align=left><small style=width: 50px>$mresultaingresos0</font></td>";
echo "<td <font size=2 align=center><small style=width: 50px>$resultaingresos[1]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$resultaingresos[2]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$resultaingresos[3]</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$mresultaingresos</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>-</font></td>";

$tdebe=$tdebe+$resultaingresos[4];
//S$mmarrayl=number_format($mmarrayl,2);
$saldo_anterior=$saldo_anterior+$resultaingresos[4];
$msaldo_anterior=number_format($saldo_anterior,2,',','.');
echo "<td <font size=2 align=right><small style=width: 50px>$msaldo_anterior</font></td>";
echo "</tr> ";

}








 
while ($resultadebito = pg_fetch_row($query66)){
$queryss="select p_terciaria.descripcion from debitos
 INNER JOIN p_terciaria ON debitos.cod_partida= p_terciaria.id_p_terciaria
where debitos.id_debitos=$resultadebito[7]";
$resultss=pg_query($con,$queryss);
$rowss="";
while ($resultasss = pg_fetch_row($resultss)){
$rowss=$rowss."--".$resultasss[0];
}
$mfecha=cambiaf_a_normal($resultadebito[0]);
$mresultadebito=number_format($resultadebito[5],2,',','.');
echo "<tr> ";
echo "<td <font size=2 align=right><small style=width: 50px>$mfecha</font></td>";
echo "<td <font size=2 align=center><small style=width: 50px>$resultadebito[1]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$resultadebito[3]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$rowss</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$mresultadebito</font></td>";

$saldo_anterior=$saldo_anterior-$resultadebito[5];
$msaldo_anterior=number_format($saldo_anterior,2,',','.');


$thaber=$thaber+$resultadebito[5];

echo "<td <font size=2 align=right><small style=width: 50px>$msaldo_anterior</font></td>";
echo "</tr> ";
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////




while ($row = pg_fetch_row($result)){
$query22="select p_terciaria.descripcion from distribucion_cheque
 INNER JOIN p_terciaria ON distribucion_cheque.cod_partida= p_terciaria.id_p_terciaria
where distribucion_cheque.ncheque='$row[1]'";
$result22=pg_query($con,$query22);
$row22="";
$mrow3=number_format($row[3],2,',','.');
$mrow2=cambiaf_a_normal($row[2]);
while ($resulta222 = pg_fetch_row($result22)){
$row22=$row22."--".$resulta222[0];
}
echo "<tr> ";
echo "<td <font size=2 align=right><small style=width: 50px>$mrow2</font></td>";
echo "<td <font size=2 align=center><small style=width: 50px>$row[1]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$row[4]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$row22</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$mrow3</font></td>";
$saldo_anterior=$saldo_anterior-$row[3];
$msaldo_anterior=number_format($saldo_anterior,2,',','.');
echo "<td <font size=2 align=right><small style=width: 50px>$msaldo_anterior</font></td>";
echo "</tr> ";

}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

































