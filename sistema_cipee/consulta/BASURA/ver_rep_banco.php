<?php
include("../config.php");
include("../utils.php");
$query2="SELECT * FROM configuracion where id_configuracion='1'";
$result2=pg_query($con,$query2);
$row2=pg_fetch_array($result2);
$cuenta_reg=0;
/////////////////////
$anio= $_GET['desde_year'];

$anio_sist=date(Y);
//echo $anio_sist;
///////////////



$desde= $_GET['desde_year']."-".$_GET['desde_mes']."-".$_GET['desde_dia'];
$hasta= $_GET['hasta_year']."-".$_GET['hasta_mes']."-".$_GET['hasta_dia'];

$desde2= $_GET['desde_year']."-".$_GET['desde_mes']."-".$_GET['desde_dia'];
$hasta2=$_GET['hasta_year']."-".$_GET['hasta_mes']."-".$_GET['hasta_dia'];
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
 
  
  
  <?php

  
  include("titulo.php");
 echo "<p align=right><font size=2 align=right><small style=width: 50px>Pagina: 1</font></p>";
 $pag++;
$result_ing = pg_query($con,$query="SELECT * from ingresos 
where
(fecha >= '$desde2' AND fecha <= '$hasta2')
");
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
//(fecha_a >  '$desde2') AND (fecha_a < '$hasta2')
//and
$result_sum_cheques2 = pg_query($con,$query="SELECT * from cheque 
where
ESTADO='ANULADO' AND id_cheque<=256 AND

motivo='POR VENCIMIENTO DE FECHA AL MOMENTO QUE EL PROVEEDOR VA A REALIZAR EL COBRO.'
");
while ($tresult_sum_cheque = pg_fetch_row($result_sum_cheques)){
$total_acum_cheq=$total_acum_cheq+$tresult_sum_cheque[2];
}
while ($tresult_sum_cheque2 = pg_fetch_row($result_sum_cheques2)){
echo $tresult_sum_cheque2[2]; 
$total_acum_cheq=$total_acum_cheq+$tresult_sum_cheque2[2];

}


$saldo_anterior=$total_acum_ing-$total_acum_cheq;
$msaldo_anterior=$saldo_anterior;
$tdebe=$tdebe+$total_acum_ing-$total_acum_cheq;
$msaldo_anterior=number_format($msaldo_anterior,2,',','.');
/////////////////////////////////////////////////////////////////////////////////////
//$array = pg_fetch_array($result_ing);
//$array[fecha]=cambiaf_a_normal($array[fecha]);
//$monto=$array[monto];
//$array[monto]=number_format($array[monto],2);
//$saldo=$monto+$saldo_anterior;
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
//if ($array[monto]!=0){
////////////////////////////////////////////////////////
$result_ingresos = pg_query($con,$query="SELECT * from ingresos 
where   
(fecha >= '$desde' AND fecha <= '$hasta')
order by FECHA
");
echo "<tr> ";


while ($resultaingresos = pg_fetch_row($result_ingresos)){
//$marrayl=$resultaingresos[4]+$saldo_anteriorg;
//$saldo_anteriorg=$saldo_anterior+$marrayl;
//$saldo=$resultaingresos[4]+$saldo_anteriorg;

///////////////////////////////////////////////////////

$result = pg_query($con,$query="SELECT cheque.id_cheque,cheque.ncheque,cheque.fecha,cheque.monto_cheque,cheque.beneficiario,cheque.cedula_rif,cheque.concepto,cheque.estado,cheque.fecha_a from cheque 
where
(fecha >= '$desde' AND fecha <= '$hasta')
ORDER BY id_cheque ASC
");
while ($row = pg_fetch_row($result)){

$query22="select p_terciaria.descripcion from distribucion_cheque
 INNER JOIN p_terciaria ON distribucion_cheque.cod_partida= p_terciaria.id_p_terciaria
where distribucion_cheque.ncheque='$row[1]'";
$result22=pg_query($con,$query22);


while ($resulta222 = pg_fetch_row($result22)){
$row22=$row22."--".$resulta222[0];
}

if ($row[7]=='ANULADO'){
$row[4]=$row[4]." (CHEQUE ANULADO)";
$row22="CHEQUE ANULADO";
$row[3]=0;

}
//$haber=$row[3];
//$row[3]=number_format($row[3],2);
//$row[2]=cambiaf_a_normal($row[2]);
if ($fila==19){

$mtdebe=number_format($tdebe,2,',','.');
$mhaber=number_format($thaber,2,',','.');
$saldo=$tdebe-$thaber;
$msaldo=number_format($saldo,2,',','.');
$hasta2=cambiaf_a_normal($hasta2);
echo "<tr>";
echo "<td <font size=2 align=left><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>VAN:</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtdebe</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mhaber</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$msaldo</b></font></td>";
echo "</table>";
include("pie.php");
echo "<p>&nbsp;</p>";
echo "<p>&nbsp;</p>";
echo "<p>&nbsp;</p>";
echo "<p>&nbsp;</p>";
echo "<p>&nbsp;</p>";
include("titulo.php");
$pag++;
 echo "<p align=right><font size=2 align=right><small style=width: 50px>Pagina: $pag</font></p>";
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
echo "<td <font size=2 align=left><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>VIENEN:</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtdebe</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mhaber</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$msaldo</b></font></td>";

$fila=0;

}
if ($fila<19){
//echo "si_".$row[2]."<".$resultaingresos[0];
if (($row[2]<$resultaingresos[0]) ){

$mrow3=number_format($row[3],2,',','.');
$mrow2=cambiaf_a_normal($row[2]);
if ($row[2]>=$fecha_ant){
echo "<tr> ";
echo "<td <font size=2 align=right><small style=width: 50px>$mrow2</font></td>";
echo "<td <font size=2 align=center><small style=width: 50px>$row[1]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$row[4]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$row22</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$mrow3</font></td>";
$saldo_anterior=$saldo_anterior-$row[3];
$msaldo_anterior=number_format($saldo_anterior,2,',','.');

//$saldo=$saldo-$haber;
$thaber=$thaber+$row[3];
//$saldom=number_format($saldo,2);
echo "<td <font size=2 align=right><small style=width: 50px>$msaldo_anterior</font></td>";
echo "</tr> ";
$fila++;
//echo "<td <font size=2 align=left><small style=width: 50px>$fila</font></td>";



}
//}
}else{

//echo "------";
if ($opt==0){  
$opt=1;
echo "<tr> ";
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
$fila++;
}

}
}
$row22="";
?>
</p>
<p></p>

<?PHP


}
$opt=0;
$cont=0;
}
/////////////NUEVO//////////////////
$result = pg_query($con,$query="SELECT cheque.id_cheque,cheque.ncheque,cheque.fecha,cheque.monto_cheque,cheque.beneficiario,cheque.cedula_rif,cheque.concepto,cheque.estado from cheque 
where
(fecha >= '$desde' AND fecha <= '$hasta')
ORDER BY id_cheque ASC
");
while ($row = pg_fetch_row($result)){

$query22="select p_terciaria.descripcion from distribucion_cheque
 INNER JOIN p_terciaria ON distribucion_cheque.cod_partida= p_terciaria.id_p_terciaria
where distribucion_cheque.ncheque='$row[1]'";
$result22=pg_query($con,$query22);
while ($resulta222 = pg_fetch_row($result22)){
$row22=$row22."--".$resulta222[0];
}
if ($row[7]=='ANULADO'){
$row[4]=$row[4]." (CHEQUE ANULADO)";
$row22="CHEQUE ANULADO";
$row[3]=0;

}

if ($fila==19){

$mtdebe=number_format($tdebe,2,',','.');
$mhaber=number_format($thaber,2,',','.');
$saldo=$tdebe-$thaber;
$msaldo=number_format($saldo,2,',','.');
$hasta2=cambiaf_a_normal($hasta2);
echo "<tr>";
echo "<td <font size=2 align=left><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>VAN:</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtdebe</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mhaber</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$msaldo</b></font></td>";
echo "</table>";
include("pie.php");
echo "<p>&nbsp;</p>";
echo "<p>&nbsp;</p>";
echo "<p>&nbsp;</p>";
echo "<p>&nbsp;</p>";
echo "<p>&nbsp;</p>";
include("titulo.php");
$pag++;
 echo "<p align=right><font size=2 align=right><small style=width: 50px>Pagina: $pag</font></p>";
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
echo "<td <font size=2 align=left><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>VIENEN:</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtdebe</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mhaber</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$msaldo</b></font></td>";

$fila=0;

}
if ($fila<19){
//echo "si_".$row[2]."<".$resultaingresos[0];
if (($row[2]>=$resultaingresos[0]) ){

$mrow3=number_format($row[3],2,',','.');
$mrow2=cambiaf_a_normal($row[2]);
if ($row[2]>=$fecha_ant){
echo "<tr> ";
echo "<td <font size=2 align=right><small style=width: 50px>$mrow2</font></td>";
echo "<td <font size=2 align=center><small style=width: 50px>$row[1]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$row[4]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$row22</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$mrow3</font></td>";
$saldo_anterior=$saldo_anterior-$row[3];
$msaldo_anterior=number_format($saldo_anterior,2,',','.');


$thaber=$thaber+$row[3];

echo "<td <font size=2 align=right><small style=width: 50px>$msaldo_anterior</font></td>";
echo "</tr> ";
$fila++;
}}
}

$row22="";

}
/////////////////FIN NUEVO///////////////////////////////
//}

/////////////nueva modificacion28/07/08 -- ---ojo aqui presento falla el 17-04-2009
if ($mrow2==""){
$mrow2=$desde2;


$result_ingresosf = pg_query($con,$queryf="SELECT * from ingresos 
where
(fecha >= '$mrow2' AND fecha <= '$hasta')
order by id_ingresos
");

while ($resultaingresosf = pg_fetch_row($result_ingresosf)){
$mresultaingresosf[4]=number_format($resultaingresosf[4],2,',','.');
$mresultaingresosf[0]=cambiaf_a_normal($resultaingresosf[0]);
echo "<tr>";

echo "<td <font size=2 align=left><small style=width: 50px>$mresultaingresosf[0]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$resultaingresosf[1]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$resultaingresosf[2]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$resultaingresosf[3]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$mresultaingresosf[4]</font></td>";
$tdebe=$tdebe+$resultaingresosf[4];
//S$mmarrayl=number_format($mmarrayl,2);
$saldo_anterior=$saldo_anterior+$resultaingresosf[4];
$msaldo_anterior=number_format($saldo_anterior,2);
echo "<td <font size=2 align=left><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$msaldo_anterior</font></td>";
$fila++;


echo "</tr>";

}
}
////////////////////////////////////////////////////////////////////////////////////////////////////////
echo "<tr>";
$mtdebe=number_format($tdebe,2,',','.');
$mhaber=number_format($thaber,2,',','.');
$saldo=$tdebe-$thaber;
$msaldo=number_format($saldo,2,',','.');
$mhasta2=cambiaf_a_normal($hasta);

echo "<td <font size=2 align=left><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>-</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>SALDO DISPONIBLE AL $mhasta2</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$mtdebe</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$mhaber</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$msaldo</b></font></td>";
echo "</table>";

?>

<?
  include("pie.php"); 
?>

 <p> <a href="../consulta/menu_consulta.php?>">Atras</a>&nbsp; </p>
 
 
 
 
 
 
 
