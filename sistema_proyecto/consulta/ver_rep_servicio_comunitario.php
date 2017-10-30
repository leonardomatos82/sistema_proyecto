<?php
session_start();
include("../config.php");
include("../utils.php");

include("numero2.php"); 
$cedula=$_GET[id];

$result = pg_query($con, "select * from estudiante_teg where cedula='".$cedula."'"); 
$row=pg_fetch_array($result);
$result2 = pg_query($con, "select * from teg where id_teg='".$row['id_teg']."'"); 
$row2=pg_fetch_array($result2);
$result3 = pg_query($con, "select * from estudiante_teg where cedula='".$cedula."'"); 
$row3 = pg_fetch_array($result3);

if($row[tramo]='VIII' || $row[tramo]='XI' || $row[tramo]='X')
{
$tit='LICENCIADO';
}else{
$tit='TSU';
}
$resultpfg = pg_query($con, "select * from titulo where tipo='$tit' and pfg='$row[pfg]';"); 
$rowpfg = pg_fetch_array($resultpfg);
if ($row[pfg]=="PROGRAMA NACIONAL DE FORMACION DE EDUCADORES"){
   if($row2[mencion]==""){}else{
$mencion="MENCION: EDUCACION ".$row2[mencion];}
}

$row2[fecha_inscripcion]=cambiaf_a_normal($row2[fecha_inscripcion]);
//$row[inicio]=cambiaf_a_normal($row[inicio]);
//$row[culminacion]=cambiaf_a_normal($row[culminacion]);
$ano=date("Y");
$fecha=date("d-m-Y");
$resultpl = pg_query($con, "select * from periodo_lectivo where estado='ACTIVO'"); 
$rowpl=pg_fetch_array($resultpl);
$resultau = pg_query($con, "select * from autorizado"); 
$rowau=pg_fetch_array($resultau);

////////////para obtener el id de pasantias
$rc="select id_teg from teg where id_teg='".$row['id_teg']."'";
$qrc=pg_query($con,$rc);
$cant_reg=pg_fetch_array($qrc);
$num=$cant_reg[0];
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
<table align="center" width="700px" height="65px" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td width="144" rowspan="5"><div align="center"><strong><font size="2" face="Times New Roman, Times, serif"><img src="../imagenes/ubv.jpg" width="70" height="70" /><img src="../imagenes/sucre.jpg" width="70" height="70" /></font></strong></div></td>
    <td height="0"><div align="right"><font size="2"><strong><font face="Times New Roman, Times, serif"></font></strong></p></td>
  </tr>
     <tr> 
    <td height="0"><div align="right"><font size="2"><strong><font face="Times New Roman, Times, serif">REPUBLICA BOLIVARIANA 
        DE VENEZUELA</font> </strong></font></td>
  </tr>
  <tr> 
    <td height="0"><div align="right"><font size="2"><strong><font face="Times New Roman, Times, serif">UNIVERSIDAD 
      BOLIVARIANA DE VENEZUELA</font> </strong></font></td>
  </tr>
 <tr> 
    <td height="0"> <div align="right"><font size="2"><strong><font face="Times New Roman, Times, serif">DIRECCION DE EJE GEOPOLITICO REGIONAL GUERRILLERO MAISANTA</font></strong></font></div></td>
  </tr>
<tr> 
    <td height="0"> <div align="right"><font size="2"><strong><font face="Times New Roman, Times, serif">COORDINACION REGIONAL DE INTEGRACION SOCIOEDUCATIVA</font></strong></font></div></td>
  </tr>

  <tr>
    <td height="0"><div align="right"><strong></strong></div></td>
    <td height="0"><strong><font size="2" face="Times New Roman, Times, serif"></font></strong></td>
  </tr>
</table>
<td>&nbsp;</td>

<table width="625" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td><div align="right"><font face="arial"> </strong><font size="5" face="Codabarmedium"><?php include("barcode.php");?></font></font></div></td>
  </tr>
<tr> 
    <td height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif">BARINAS-<? echo $rowpl[periodo]?>-CISE-TEG-<? echo $numerosig; ?>-<?echo $ano;?></font></strong></p></td>
  </tr>
</table>

<td>&nbsp;</td>
<p>&nbsp;</p>
<table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr> 
    <td height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif"></font></strong></p></td>
  </tr>
 <tr> 
    <td height="0" colspan="2"><p align="center"><strong><font size="5" face="Times New Roman, Times, serif">CONSTANCIA</font></strong></p></td>
<td align="right"></td>  </tr>
   <tr> 
<tr> 
    <td height="0" colspan="2"><p align="center"><strong><font size="5" face="Times New Roman, Times, serif">CUMPLIMIENTO DEL SERVICIO COMUNITARIO</font></strong></p></td>
<td align="right"></td>  </tr>
   <tr> 
    <td height="0" colspan="2"><p align="center"><strong><font size="3" face="Times New Roman, Times, serif">UBV BARINAS- PORTUGUESA</font></strong></p></td>
<td align="right"></td>  </tr>
  </tr>
</table>
<td>&nbsp;</td>
</table>


<table width="600" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
   <tr align="justify" style="line-height=150%"><td style="line-height=150%">
<font size="2"><em>&nbsp;&nbsp;&nbsp;&nbsp;POR MEDIO DE LA PRESENTE SE CERTIFICA QUE EL(LA) BACHILLER: <strong><? echo $row[nombre]; ?></strong>, TITULAR DE LA CEDULA DE IDENTIDAD N. <strong><? echo $row[cedula]; ?></strong>, ESTUDIANTE REGULAR DEL PROGRAMA DE FORMACION DE GRADO: <strong><? echo $row3[pfg]; ?></strong>, DURANTE EL PERIODO ACADEMICO <strong><? echo $rowpl[periodo] ; ?></strong>, CULMINO Y APROBO SATISFACTORIAMENTE LA PRESTACION DEL SERVICIO COMUNITARIO  
</td></tr>
 <tr align="justify" style="line-height=150%"><td style="line-height=150%"><font size="2">
<strong>&nbsp;&nbsp;&nbsp;&nbsp;DENOMINADO: <? echo $row2[teg]; ?></strong>


</td></tr>
 <tr align="justify" style="line-height=150%"><td style="line-height=150%"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;
 EN LA COMUNIDAD:  <? echo $row2[comunidad]; ?>, PARROQUIA:  <? echo $row2[parroquia]; ?>, MUNICIPIO:  <? echo $row2[municipio]; ?>, ESTADO:  <? echo $row2[estado]; ?> 

</em></font>
</td></tr>
 </table>
&nbsp;
<table width="600"  align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
 <tr align="justify" style="line-height=150%"><td >
<font size="2"><em>&nbsp;&nbsp;&nbsp;&nbsp;SE CONSIDERA COMO ÚNICO EL CUMPLIMIENTO DEL SERVICIO COMUNITARIO DEL ESTUDIANTE UBV, UNA VEZ QUE HAYA CULMINADO Y APROBADO EL PROYECTO ACADEMICO COMUNITARIO CORRESPONDIENTE A LA SALIDA INTERMEDIA Y PARA LOS PROGRAMAS DE FORMACIÓN DE GRADO QUE NO LA TIENEN, SE CONSIDERARÁ EL ULTIMO TRAMO DEL PROYECTO ACADEMICO/ COMUNITARIO. POR LO TANTO ESTA CONSTANCIA ES VALIDA PARA TSU, LICENCIADO, ABOGADO, ARQUITECTO, INGENIERO O SU EQUIVALENTE.</em></font>
</td></tr>
</table>
&nbsp;
<table width="600" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
 <tr align="left"><td >
<font size="2"><em>&nbsp;&nbsp;&nbsp;&nbsp;BARINAS, 
              <script>
<!--
   nombres_dias = new Array("DOMINGO", "LUNES", "MARTES", "MIERCOLES", "JUEVES", "VIERNES", "SABADO")
   nombres_meses = new Array("ENERO", "FEBRERO", "MARZO", "ABRIL", "MAYO", "JUNIO", "JULIO", "AGOSTO", "SEPTIEMBRE", "OCTUBRE", "NOVIEMBRE", "DICIEMBRE")
   fecha_actual = new Date()
   dia_mes = fecha_actual.getDate()		//dia del mes
   strdia_mes = (dia_mes <= 9) ? "0" + dia_mes : dia_mes
   dia_semana = fecha_actual.getDay()		//dia de la semana
   mes = fecha_actual.getMonth() + 1
   strmes = (mes <= 9) ? "0" + mes : mes
   anio = fecha_actual.getYear()
   if (anio < 100) anio = "19" + anio			//pasa el año a 4 digitos
   else if ( ( anio > 100 ) && ( anio < 999 ) ) {	//efecto 2000
      var cadena_anio = new String(anio)
      anio = "20" + cadena_anio.substring(1,3)
   }
<!-- document.write
document.write (nombres_dias[dia_semana ]+ " " + dia_mes + " DE " + nombres_meses[mes - 1] + " DE " + anio)
 
</script>
            </em></font>
</td></tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>


<table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">  
<tr align="center"> 
    <td>
    <font size="-1"><strong><em></em></strong>
   </td>

<td>
    <font size="-1"><strong><em></em></strong>
   </td>
  </tr>
<tr> 
    <td align="center">
    <font size="2"><strong><em>COORD. INTEGRACION SICIOEDUCATIVA</em></strong>
   </td>
<td align="center">
    <font size="2"><strong><em>PROFESOR DE PROYECTO</em></strong>
   </td>
  </tr>
</table>
<p>&nbsp;</p>
<table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">  
<tr > 
    <td>
    <font size="-1"><strong><em></em></strong>
   </td>

<td>
    <font size="-1"><strong><em></em></strong>
   </td>
  </tr>
<tr> 
    <td align="center">
    <font size="2"><strong><em>COORDINADOR DE PFG O PNF</em></strong>
   </td>
<td align="center">
    <font size="2"><strong><em>ENLACE COMUNITARIO</em></strong>
   </td>
  </tr>
</table>
<p>&nbsp;</p>
<?
	  /////////////////////////////
$valor="-Operacion: IMPRIMIR CONSTANCIA DE CUMPLIMIENTO DE TEG-".$cedula;
 registrarOperacion($con,$_SESSION['login'],$valor);      

///////////////////////////////////////////////////////////////////  
if($conta<3){
echo"<p>&nbsp;</p>";

}
?>