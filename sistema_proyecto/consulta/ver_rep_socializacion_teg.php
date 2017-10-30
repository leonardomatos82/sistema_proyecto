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
$row2[fecha_socializacion]=cambiaf_a_normal($row2[fecha_socializacion]);
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
    <td width="144" rowspan="5"><div align="center"><strong><font size="2" face="Times New Roman, Times, serif"><img src="../imagenes/ubv.jpg" width="70" height="70" /></font></strong></div></td>
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

<table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr> 
    <td height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif"></font></strong></p></td>
  </tr>
 <tr> 
    <td height="0" colspan="2"><p align="center"><strong><font size="5" face="Times New Roman, Times, serif">SOCIALIZACION DEL TRABAJO ESPECIAL DE GRADO (TEG)</font></strong></p></td>
<td align="right"></td>  </tr>
   <tr> 
    <td height="0" colspan="2"><p align="center"><strong><font size="3" face="Times New Roman, Times, serif">UBV BARINAS- PORTUGUESA</font></strong></p></td>
<td align="right"></td>  </tr>
  </tr>
</table>
<td>&nbsp;</td>

 </table>
<table width="700" align="center" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >

<tr height="25px"><td>
<font size="-2"><strong><em>FECHA DE SOCIALIZACION: <? echo $row2[fecha_socializacion]; ?></em></strong></font>
</td></tr>
 </table>
<table width="700" align="center" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
 
 <tr><td>
<font size="-2"><strong><em>ESTUDIANTE EVALUADO:</em></strong></font>
</td><td>
<font size="-2"><strong><em>CEDULA:</em></strong></font>
</td></tr>
<tr height="25px"><td>
<font size="2"><? echo $row3[nombre]; ?></td><td><font size="2"><? echo $row3[cedula]; ?>

</td>
</tr> 
 </table>
<table width="700" align="center" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
   <tr><td>
<font size="-2"><strong><em>PROGRAMA DE FORMACION DE GRADO</em></strong></font>
</td></tr>
<tr height="25px"><td>
<font size="2"><? echo $row3[pfg]; ?>

</td>
</tr> 
 </table>
<table width="700" align="center" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
   <tr><td>
<font size="-2"><strong><em>TITULO DEL PROYECTO:</em></strong></font>
</td></tr>
<tr height="80px"><td>
<font size="1"><? echo $row2[teg]; ?>

</td>
</tr>    
   <tr><td>
<font size="-2"><strong><em>PARA OPTAR AL TITULO DE:</em></strong></font>
</td></tr>
<tr height="35px"><td>
<font size="2"><? echo $rowpfg[titulo]." ".$mencion; ?>
</td>
</tr>


<tr><td></td></tr>
<tr><td>
<font size="1"><strong><em>LUEGO DE REALIZADA LA PRESENTACION POR PARTE DEL ESTUDIANTE Y LA EVALUACION POR PARTE DEL JURADO, SE CONSIDERA EL TRABAJO ESPECIAL DE GRADO:</em></strong>
</font></td></tr>  
<tr height="35px"><td align="center">
<font size="2"><strong>APROBADO:_<? if($row2[estado]=='APROBADO'){echo " X ";}?>___        NO APROBADO:_<? if($row2[estado]=='NO APROBADO'){echo " X ";}?>___        APROBADO CON MODIFICACIONES:_<? if($row2[estado]=='APROBADO MODIFICACIONES'){echo " X ";}?>___</strong></font>
</td></tr>

<tr><td>
<font size="-2"><strong><em>OBSERVACIONES:</em></strong>
</font></td></tr>
<tr height="80px"><td align="left">
<font size="2"><? echo $row2[observaciones_generales]." ".$mencion; ?>
</td></tr>
</table>

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
    <font size="-2"><strong><em>JURADO CALIFICADOR UBV</em></strong>
   </td>
<td align="center">
    <font size="-2"><strong><em>JURADO CALIFICADOR UBV</em></strong>
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
    <font size="-2"><strong><em>JURADO COMUNITARIO</em></strong>
   </td>
<td align="center">
    <font size="-2"><strong><em>PROFESOR DE PROYECTO</em></strong>
   </td>
  </tr>
</table>
<p>&nbsp;</p>
<table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
 <tr><td>
<font size="-2"><strong><em>SELLO DEL P.F.G.</em></strong></font>
</td></tr>

 </table>

<table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
<tr height="25px"><td>
<font size="-3">LA PRESENTACION DE TRABAJOS ESPECIALES DE GRADO SE REGIRAN POR LAS NORMAS TRANSITORIAS PARA LA PRESENTACION Y EVALUACION DEL TRABAJO ESPECIAL DE GRADO UBV</td>
</tr>  </table>
<?
	  /////////////////////////////
$valor="-Operacion: IMPRIMIR PLANILLA DE SOCIALIZACION DE TEG-".$cedula;
 registrarOperacion($con,$_SESSION['login'],$valor);      

///////////////////////////////////////////////////////////////////  
if($conta<2){
//echo"<p>&nbsp;</p>";

}
?>