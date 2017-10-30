<?php
session_start();
include("../config.php");
include("../utils.php");

include("numero2.php"); 
$cedula=$_GET[id];
$result = pg_query($con, "select * from pasantia where cedula='".$cedula."'"); 
$row=pg_fetch_array($result);
//$row[fecha_inscripcion]='2013-02-25';
$row[fecha_inscripcion]=cambiaf_a_normal($row[fecha_inscripcion]);
$ano=date("Y");
$fecha=date("d-m-Y");
$resultpl = pg_query($con, "select * from periodo_lectivo where estado='ACTIVO'"); 
$rowpl=pg_fetch_array($resultpl);


////////////para contar autenticaciones
$rc="select id_pasantia from pasantia where cedula='".$cedula."'";
$qrc=pg_query($con,$rc);
$cant_reg=pg_fetch_array($qrc);
$num=$cant_reg[0]-297;
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
    <td width="144" rowspan="5"><div align="center"><strong><font size="2" face="Times New Roman, Times, serif"><img src="../imagenes/ubv.jpg" width="70" height="70" /><img src="../imagenes/corazon_venezolano22.png" width="70" height="70" /></font></strong></div></td>
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
    <td height="0"><div align="right"><strong></strong></div></td>
    <td height="0"><strong><font size="2" face="Times New Roman, Times, serif"></font></strong></td>
  </tr>
</table>
<p>&nbsp;</p>

<table width="625" border="0" align="center" cellpadding="0" cellspacing="0">
 
<tr> 
    <td height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif">BARINAS-<? echo $rowpl[periodo];?>-CISE-PASANTIAS-<? echo $row['cod_pasantia']; ?>-<?echo $ano;?></font></strong></p></td>
  </tr>
</table>

<td>&nbsp;</td>

<table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr> 
    <td height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif"></font></strong></p></td>
  </tr>
 <tr> 
    <td height="0" colspan="2"><p align="center"><strong><font size="4" face="Times New Roman, Times, serif">COMPROBANTE DE CONSIGNACIÓN DE RECAUDOS PARA PASANTÍAS</font></strong></p></td>
  </tr>
  
  </tr>
</table>
 <table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
    <tr>  
 </table>

<table width="700" align="center" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
   <tr><td>
<font size="2"><strong><em>Se Hace constar que el (la) Bachiller:</em></strong></font>
</td></tr>
<tr><td>
<font size="-1"> Cedula de Identidad:
<? echo $row[nacionalidad]; ?>
<? echo -$row[cedula]; ?></font>
</td>
</tr>    
<tr><td>
<font size="-1"> Nombres y apellidos:
<? echo $row[nombre]; ?>
</td></tr>

<tr><td>
<font size="-1">PFG que estudia:
<? echo $row[pfg]; ?></font>
<font size="-1"> , Turno:
<? echo $row[turno]; ?></font>
</td></tr>
<tr><td>
<font size="-1">Aldea donde estudia:
<? echo $row[aldea]; ?></font>
</td></tr>
<tr><td></td></tr>
<tr><td>
<font size="1"><strong><em>Ha consignado los siguientes Documentos:</em></strong>
</font></td></tr> 
 <tr><td>
<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">  
<tr> 
    <td>.</td>
    <td><font size="1">Documento</font></td>
       <td><font size="1">Consignado</font></td>
  </tr>
  <tr> 
      <td><font size="1">01</font></td>
    <td><font size="1">Una (01) foto de frente tipo carnet o pasaporte</font></td>
    <td><font size="1"><? if ($row[documento1]=='on'){ echo ' SI '; }else{ echo ' NO '; } ?></font></td>
  </tr>
    <tr> 
      <td><font size="1">02</font></td>
    <td><font size="1">Una (01) copia ampliada de la cedula de identidad o pasaporte sin recortar</font></td>
    <td><font size="1"><? if ($row[documento2]=='on'){ echo ' SI '; }else{ echo ' NO ';} ?></font></td>
  </tr>
    <tr> 
      <td><font size="1">03</font></td>
    <td><font size="1">Una (01) Copia de la Planilla de consignación de documentos emitida por CIPEE UBV</font></td>
    <td><font size="1"><? if ($row[documento3]=='on'){ echo ' SI '; }else{ echo ' NO ';} ?></font></td>
  </tr>
    <tr> 
      <td><font size="1">04</font></td>
    <td><font size="1">Una (01) copia de la planilla de inscripción emitida por SUR@UBV</font></td>
    <td><font size="1"><? if ($row[documento4]=='on'){ echo ' SI '; }else{ echo ' NO '; } ?></font></td>
  </tr>
  
  
</table>
</td></tr>
</table>
<table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">  
<tr> 
    <td>
    <font size="2"><strong><em>OBSERVACIONES:</em></strong>
   </td>
  </tr>
</table>

<table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">  
<tr> 
    <td>
    <font size="2"><strong><em>FECHA: <? echo $row[fecha_inscripcion]; ?></em></strong>
   </td>   <td align="center">
    <font size="2"><strong><em>Firma y Sello:</em></strong>
   </td>
  </tr>
</table>
<table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">  
<tr> 
    <td><strong>
    ________________________________________________________________________________________
   </strong></td>
  </tr>
</table>
<table align="center" width="700px" height="65px" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td width="144" rowspan="5"><div align="center"><strong><font size="2" face="Times New Roman, Times, serif"><img src="../imagenes/ubv.jpg" width="70" height="70" /><img src="../imagenes/corazon_venezolano22.png" width="70" height="70" /></font></strong></div></td>
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
    <td height="0"><div align="right"><strong></strong></div></td>
    <td height="0"><strong><font size="2" face="Times New Roman, Times, serif"></font></strong></td>
  </tr>
</table>
<p>&nbsp;</p>

<table width="625" border="0" align="center" cellpadding="0" cellspacing="0">
<tr> 
    <td height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif">BARINAS-<? echo $rowpl[periodo];?>-CISE-PASANTIAS-<? echo $numerosig; ?>-<?echo $ano;?></font></strong></p></td>
  </tr>
</table>

<td>&nbsp;</td>

<table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr> 
    <td height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif"></font></strong></p></td>
  </tr>
 <tr> 
    <td height="0" colspan="2"><p align="center"><strong><font size="4" face="Times New Roman, Times, serif">COMPROBANTE DE CONSIGNACIÓN DE RECAUDOS PARA PASANTÍAS</font></strong></p></td>
  </tr>
  
  </tr>
</table>
 <table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
    <tr>  
 </table>




<table width="700" align="center" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
   <tr><td>
<font size="2"><strong><em>Se Hace constar que el (la) Bachiller:</em></strong></font>
</td></tr>
<tr><td>
<font size="-1"> Cedula de Identidad:
<? echo $row[nacionalidad]; ?>
<? echo -$row[cedula]; ?></font>
</td>
</tr>    
<tr><td>
<font size="-1"> Nombres y apellidos:
<? echo $row[nombre]; ?>
</td></tr>

<tr><td>
<font size="-1">PFG que estudia:
<? echo $row[pfg]; ?></font>
<font size="-1"> , Turno:
<? echo $row[turno]; ?></font>
</td></tr>
<tr><td>
<font size="-1">Aldea donde estudia:
<? echo $row[aldea]; ?></font>
</td></tr>
<tr><td></td></tr>
<tr><td>
<font size="1"><strong><em>Ha consignado los siguientes Documentos:</em></strong>
</font></td></tr> 
 <tr><td>
<table width="100%" align="center" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">  
<tr> 
    <td>.</td>
    <td><font size="1">Documento</font></td>
       <td><font size="1">Consignado</font></td>
  </tr>
  <tr> 
      <td><font size="1">01</font></td>
    <td><font size="1">Una (01) foto de frente tipo carnet o pasaporte</font></td>
    <td><font size="1"><? if ($row[documento1]=='on'){ echo ' SI '; }else{ echo ' NO '; } ?></font></td>
  </tr>
    <tr> 
      <td><font size="1">02</font></td>
    <td><font size="1">Una (01) copia ampliada de la cedula de identidad o pasaporte sin recortar</font></td>
    <td><font size="1"><? if ($row[documento2]=='on'){ echo ' SI '; }else{ echo ' NO ';} ?></font></td>
  </tr>
    <tr> 
      <td><font size="1">03</font></td>
    <td><font size="1">Una (01) Copia de la Planilla de consignación de documentos emitida por CIPEE UBV</font></td>
    <td><font size="1"><? if ($row[documento3]=='on'){ echo ' SI '; }else{ echo ' NO ';} ?></font></td>
  </tr>
    <tr> 
      <td><font size="1">04</font></td>
    <td><font size="1">Una (01) copia de la planilla de inscripción emitida por SUR@UBV</font></td>
    <td><font size="1"><? if ($row[documento4]=='on'){ echo ' SI '; }else{ echo ' NO '; } ?></font></td>
  </tr>
  
  
</table>
</td></tr>
</table>
<table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">  
<tr> 
    <td>
    <font size="2"><strong><em>OBSERVACIONES:</em></strong>
   </td>
  </tr>
</table>

<table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">  
<tr> 
    <td>
    <font size="2"><strong><em>FECHA: <? echo $row[fecha_inscripcion]; ?></em></strong>
   </td>   <td align="center">
    <font size="2"><strong><em>Firma y Sello:</em></strong>
   </td>
  </tr>
</table>

<?
	  /////////////////////////////
$valor="-Operacion: IMPRIMIR PLANILLA DE PASANTIAS-".$cedula;
 registrarOperacion($con,$_SESSION['login'],$valor);      
///////////////////////////////////////////////////////////////////  
if($conta<3){
echo"<p>&nbsp;</p>";

}
?>
