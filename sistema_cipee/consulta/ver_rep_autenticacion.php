<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<?php
header("Content-Type: text/html;charset=utf-8");
session_start();
include("../config.php");
include("../utils.php");
$query2="SELECT * FROM autorizado";
$result2=pg_query($con,$query2);
$row2 = pg_fetch_row($result2);
include("numero2.php"); 
$cedula=$_GET[id];
$result = pg_query($con, "select * from datos where cedula='".$cedula."'"); 
$row=pg_fetch_array($result);

$ano=date("Y");
$fecha=date("d-m-Y");
$estado="AUTENTICACION";


$resultb = pg_query($con, "select * from procesada where cedula='".$cedula."' and fecha_solicitud='".$fecha."' and estatus='".$estado."'"); 
$rowb=pg_fetch_array($resultb);

if ((($rowb['cedula']==$cedula) and ($rowb['fecha_solicitud']==$fecha)) and ($rowb['estatus']==$estado)){}else{

$sql = "INSERT INTO PROCESADA (nacion,cedula,nombre,fecha_solicitud,titulo,codigo,tomo,folio,ciudad_r,estado_r,estatus,periodo,year) 
values ('$row[nacion]','$row[cedula]','$row[nombre]','$fecha','$row[titulo]','$row[codigo]','$row[tomo]','$row[folio]','$row[ciudad_r]','$row[estado_r]','$estado','$row[periodo]','$ano');";
       if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); } 
}
////////////para contar autenticaciones
$rc="select count(id_procesada) from procesada where estatus='$estado' and year='$ano'";
$qrc=pg_query($con,$rc);
$cant_reg=pg_fetch_array($qrc);
$num=$cant_reg[0]+1;
$numerosig=$num;
if ($num<10)
{
$numerosig="0".$num;
}
///////////////////////////////////////////////////////
$a=strlen($cedula);
$b=strlen($numerosig);
if ($a==8 and $b<3){
$valorcodigo=$cedula.$numerosig.'0'.'0';
} else { if($a<8 and $b<3){

$valorcodigo=$cedula.$numerosig.'0'.'0'.'0';


}else{
$valorcodigo=$cedula.$numerosig.'0'.'0'.'0';
}}


include("numero22.php");



$row[3]= utf8_decode($row[3]);
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
<BODY onload="window.print()"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 


<table align="center" width="700px" height="60px" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td width="144" rowspan="5"><div align="center"><strong><font size="2" face="Times New Roman, Times, serif"><img src="banner.png" width="750" height="150" /></font></strong></div></td>
  </tr>
</table>
<p>&nbsp;</p>

<table width="625" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td><div align="right"><font face="arial"> </strong><font size="5" face="Codabarmedium"><?php include("barcode.php");?></font></font></div></td>
  </tr>
<tr> 
    <td height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif">CIPEE-AT-<? echo $numerosig; ?>-<?echo $ano;?></font></strong></p></td>
  </tr>
</table>

<td>&nbsp;</td>

<table width="625" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr> 
    <td height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif"></font></strong></p></td>
  </tr>
 <tr> 
    <td height="0" colspan="2"><p align="center"><strong><font size="5" face="Times New Roman, Times, serif">CERTIFICACIÓN DE FONDO NEGRO DEL TÍTULO</font></strong></p></td>
  </tr>
</table>
 <td>&nbsp;</td> 
<table width="600" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
    <tr> 
    <td height="0" colspan="2"><p align="justify"  style="font: 14pt/20pt Garamond, Georgia, serif;" ><font size="3" face="Times New Roman, Times, serif">&nbsp;&nbsp;   Quien Suscribe,<strong> <? echo $row2[0]; ?></strong>, Titular de la Cédula de identidad <strong> N. V-9990172</strong>,  <strong><? echo $row2[2]; ?></strong>, hace constar por medio de la presente, que el ciudadano(a) <strong> <? echo utf8_encode($row[nombre]); ?></strong>,  <? if ($row[nacion]=='E'){ ?> Portador del Pasaporte <?}else{?> Titular de la Cédula de identidad <? }?> N. <strong> <? echo $row[nacion].'-'.$row[cedula]; ?></strong>, cumplió con todos los requisitos exigidos por las leyes, por cual en nombre de la República Bolivariana de Venezuela y por la autoridad de la ley se le confiere el TITULO DE: <strong> <? echo $row[titulo]; ?></strong>.</font></p></td>
  </tr>
</table>

<table width="600" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">  
<tr> 
    <td height="0" colspan="2"><p align="justify"  style="font: 14pt/20pt Garamond, Georgia, serif;" ><font size="3" face="Times New Roman, Times, serif">&nbsp;&nbsp;   Aparece registrado su título en los libros de acta de la Universidad Bolivariana de Venezuela, bajo el Código del título: <strong> <? echo $row[codigo]; ?></strong>, Tomo: <strong> <? echo $row[tomo]; ?></strong>, Fólio: <strong> <? echo $row[folio]; ?></strong>, en la Ciudad de <strong> <? echo $row[ciudad_r]; ?></strong> del Estado <strong> <? echo $row[estado_r]; ?></strong>.<strong><?php ?></strong>
</td>
</tr>   
<tr> 
    <td height="0" colspan="2"><p align="justify"  style="font: 14pt/20pt Garamond, Georgia, serif;" ><font size="3" face="Times New Roman, Times, serif">&nbsp;&nbsp;   Constancia que se expide a solicitud de la parte interesada a los efectos y fines consiguientes, en BARINAS a los 

 <?php
$dia=date("d");
$mes=date("m");
$yea=date("Y");
?>  
        <script>
<!--
   nombres_dias = new Array("Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado")
   nombres_meses = new Array("ENERO", "FEBRERO", "MARZO", "ABRIL", "MAYO", "JUNIO", "JULIO", "AGOSTO", "SEPTIEMBRE", "OCTUBRE", "NOVIEMBRE", "DICIEMBRE")
   fecha_actual = new Date()
    dia_mes = '<?echo $dia;?>'		//dia del mes
   strdia_mes = (dia_mes <= 9) ? "0" + dia_mes : dia_mes
   dia_semana = fecha_actual.getDay()-1		//dia de la semana
   mes = '<?echo $mes;?>'
   strmes = (mes <= 9) ?   mes : mes
   anio = '<?echo $yea;?>'
      if (anio < 100) anio = "19" + anio			//pasa el ao a 4 digitos
   else if ( ( anio > 100 ) && ( anio < 999 ) ) {	//efecto 2000
      var cadena_anio = new String(anio)
      anio = "20" + cadena_anio.substring(1,3)
   }
<!-- document.write
document.write (dia_mes + " días del mes de " + nombres_meses[mes - 1] + " del año " + anio)
 
                </script>.
 </font></p></td>
  </tr>
 
</table>
<p>&nbsp;</p><p>&nbsp;</p>
<p>&nbsp;</p>
<table width="600" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr> 
    <td height="0" colspan="2"><p align="center"><font size="3" face="Times New Roman, Times, serif"><strong><? echo $row2[0]; ?>
 </font></p></td>
  </tr>
    <tr> 
    <td height="0" colspan="2"><p align="center"><font size="3" face="Times New Roman, Times, serif"><strong><? echo $row2[1]; ?>
 </font></p></td>
  </tr>
    <tr> 
    <td height="0" colspan="2"><p align="center"><font size="2" face="Times New Roman, Times, serif"><strong><? echo $row2[3]; ?>
 </font></p></td>
  </tr>
</table>

<table width="600" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr> 
 <td height="2" colspan="2"><p align="left"><font size="1" face="Times New Roman, Times, serif"><strong>XR/<? echo $_SESSION['login']; ?>

 </font></p></td>
  </tr>
</table>
<?
	  /////////////////////////////
$valor="-Operacion: IMPRIMIR AUTENTICACION DE TITULO -".$cedula;
 registrarOperacion($con,$_SESSION['login'],$valor);      
///////////////////////////////////////////////////////////////////  
if($conta<3){
echo"<p>&nbsp;</p>";

}
?>
 <td><font size="1"> <? include("../pie.php");  ?></font></td>