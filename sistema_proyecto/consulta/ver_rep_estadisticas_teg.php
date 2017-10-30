<?php
session_start();
include("../config.php");
include("../utils.php");
$query2="SELECT * FROM periodo_lectivo where periodo='$_POST[periodo]'";
$result2=pg_query($con,$query2);
$row2 = pg_fetch_array($result2);
$periodo=$row2[periodo];
$ano=date("Y");

include("numero2.php"); 
$cedula=$_GET[id];
$result1 = pg_query($con, "select count(id_teg) from teg where periodo='$_POST[periodo]'"); 
$row1=pg_fetch_array($result1);


$fecha=date("d-m-Y");




?>
<SCRIPT LANGUAGE="JavaScript">
<!-- Beginning of JavaScript -
textstring="<?echo 'Este egresado Tiene: '.$num2.' solicitudes';?>";
function MsgBox () {

alert (textstring)
 }

// - End of JavaScript - -->
</SCRIPT>
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
<BODY onload="<? if($num2>=3){?> MsgBox() ,<?}?> window.print()"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
<table align="center" width="700px" height="75px" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
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
    <td height="0"> <div align="right"><font size="2"><strong><font face="Times New Roman, Times, serif">DIRECCION DE EJE GEOPOLITICO REGIONAL GUERRILLERO MAISANTA</font></strong></font></div></td>
  </tr>
 <tr> 
    <td height="0"> <div align="right"><font size="2"><strong><font face="Times New Roman, Times, serif">BARINAS- ESTADO BARINAS</font></strong></font></div></td>
  </tr>

  <tr>
    <td height="0"><div align="right"><strong></strong></div></td>
    <td height="0"><strong><font size="2" face="Times New Roman, Times, serif"></font></strong></td>
  </tr>
</table>
<p>&nbsp;</p>

<table width="625" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td><div align="right"><font face="arial"> </strong><font size="5" face="Codabarmedium"><?php include("barcode.php");?></font></font></div></td>
  </tr>
<tr> 
    <td height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif"></font></strong></p></td>
  </tr>
</table>




<table width="625" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr> 
    <td height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif"></font></strong></p></td>
  </tr>
 <tr> 
    <td height="0" colspan="2"><p align="center"><strong><font size="5" face="Times New Roman, Times, serif">ESTADISTICAS DE INSCRIPCION DE TEG <? echo $_POST[periodo];?></font></strong></p></td>
  </tr>
</table>
 <td>&nbsp;</td> 
<table width="600" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
   
 <tr> 
    <td height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif">TOTAL INSCRIPCIONES: <? echo $row1[0] ?></font></strong></p></td>
  </tr>
</table>
<table width="625" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
   
 <tr> 
    <td height="0" colspan="2"><p align="left"><strong><font size="2" face="Times New Roman, Times, serif">INSCRITOS POR PFG</font></strong></p></td>
  </tr>
</table>

<table width="625" align="center" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr> <td width="20" height="0" colspan="2"><p align="left"><font size="2" face="Times New Roman, Times, serif">N</td>
    <td width="520" height="0" colspan="2"><p align="left"><font size="2" face="Times New Roman, Times, serif">PROGRAMA DE FORMACION DE GRADO<td height="0" colspan="2"><p align="center"><font size="2" face="Times New Roman, Times, serif">INSCRITOS</font></p></td><td height="0" colspan="2"><p align="center"><font size="2" face="Times New Roman, Times, serif">%</font></p></td>
  </tr>

<?
$resultadopfg= pg_query($con,"SELECT * FROM pfg order by nombre_pfg");

while($obj=pg_fetch_array($resultadopfg)){
$l++;
$array[$l]=$obj[nombre_pfg];
}



$c=1;
for($i=1;$i<=$l;$i++){
$result = pg_query($con, "select count(id_teg) from teg where pfg='".$array[$i]."' and periodo='$periodo'"); 
$row=pg_fetch_array($result);
$cant=$cant+$row[0];
?>    


 <tr> 
<td width="" height="0" colspan="2"><p align="left"><font size="2" face="Times New Roman, Times, serif"><? echo $c++;?>
    <td width="500" height="0" colspan="2"><p align="left"><font size="2" face="Times New Roman, Times, serif"><? echo $array[$i];?><td height="0" colspan="2"><p align="center"><font size="2" face="Times New Roman, Times, serif"><? echo $row[0]; ?></font></p></td><td height="0" colspan="2"><p align="center"><font size="2" face="Times New Roman, Times, serif"><? echo number_format($porc=($row[0]*100)/$row1[0],2); ?></font></p></td>
  </tr>
<?
}
?>
<tr>   <td width="" height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif">
    <td width="500" height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif">TOTAL:<td height="0" colspan="2"><p align="center"><strong><font size="2" face="Times New Roman, Times, serif"><? echo $cant; ?></font></strong></p></td><td height="0" colspan="2"><p align="center"><strong><font size="2" face="Times New Roman, Times, serif">100%</font></strong></p></td>
  </tr>



</table>

<table width="625" align="center" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"><tr> <td>
<table>
<tr>

<?
$e=0;

for($i=1;$i<=$l;$i++){
$color='cuadro_verde.gif';
$e++;
$result = pg_query($con, "select count(id_teg) from teg where pfg='".$array[$i]."' and periodo='$periodo'"); 
$row=pg_fetch_array($result);
$porc=(number_format(($row[0]*100)/$row1[0]))*4;
$porc2=number_format(($row[0]*100)/$row1[0],2);
if($porc<=10){
$color='cuadro_rojo.gif';
}else{
if (($porc>10 && $porc<=40)){
$color='cuadro_azul.gif';
}
}
?>
<tr>

	
	        <td><font size="2" face="Times New Roman, Times, serif"><? echo $e; ?></td>
		<td valign=bottom><img border=2 src="<?echo $color?>" width=<? echo $porc; ?> height=13></td>
                 <td><font size="2" face="Times New Roman, Times, serif"><? echo $porc2; ?>%</td>
</tr>	
      


<?}?>
</tr>
</table> </td></tr>
</table>



<table width="625" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
   
 <tr> 
    <td height="0" colspan="2"><p align="left"><strong><font size="2" face="Times New Roman, Times, serif">PROCESADOS POR ESTADO</font></strong></p></td>
  </tr>
<p>&nbsp;</p>
</table>
<table width="550" align="center" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr> 
    <td width="500" height="0" colspan="2"><p align="left"><font size="2" face="Times New Roman, Times, serif">ESTADO<td height="0" colspan="2"><p align="center"><font size="2" face="Times New Roman, Times, serif">PROCESADOS</font></p></td><td height="0" colspan="2"><p align="center"><font size="2" face="Times New Roman, Times, serif">%</font></p></td>
  </tr>


<?
$array = array(
"BARINAS", "PORTUGUESA"
);

for($i=0;$i<2;$i++){
$result = pg_query($con, "select count(id_teg) from teg where estado='".$array[$i]."' and periodo='$periodo'"); 
$row=pg_fetch_array($result);
$cant_estado=$cant_estado+$row[0];

?>    


 <tr> 
    <td width="500" height="0" colspan="2"><p align="left"><font size="2" face="Times New Roman, Times, serif"><? echo $array[$i];?><td height="0" colspan="2"><p align="center"><font size="2" face="Times New Roman, Times, serif"><? echo $row[0]; ?></font></p></td>
<td height="0" colspan="2"><p align="center"><font size="2" face="Times New Roman, Times, serif"><? echo number_format($porc=($row[0]*100)/$row1[0],2); ?></font></p></td>
  </tr>
<?
}
?>
<tr> 
    <td width="500" height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif">TOTAL:<td height="0" colspan="2"><p align="center"><strong><font size="2" face="Times New Roman, Times, serif"><? echo $cant_estado; ?></font></strong></p></td><td height="0" colspan="2"><p align="center"><strong><font size="2" face="Times New Roman, Times, serif">100%</font></strong></p></td>
  </tr>

</table>




<table width="600" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr> 
 <td height="2" colspan="2"><p align="left"><font size="1" face="Times New Roman, Times, serif"><strong>EA/<? echo $_SESSION['login']; ?>
 </font></p></td>
  </tr>
</table>
<?
	  /////////////////////////////
$valor="-Operacion: IMPRIMIR ESTADISTICA DE INSCRIPCION DE TEG-".$cedula;
 registrarOperacion($con,$_SESSION['login'],$valor);      
///////////////////////////////////////////////////////////////////  
if($conta<3){
echo"<p>&nbsp;</p>";

}
?>
 <td><font size="1"> <? include("../pie.php");  ?></font></td>
