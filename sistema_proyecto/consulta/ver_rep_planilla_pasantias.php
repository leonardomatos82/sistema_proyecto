<?php
session_start();
include("../config.php");
include("../utils.php");

include("numero2.php"); 
$cedula=$_GET[id];
$result = pg_query($con, "select * from pasantia where cedula='".$cedula."'"); 
$row=pg_fetch_array($result);
$row[fecha_inscripcion]=cambiaf_a_normal($row[fecha_inscripcion]);
$row[inicio]=cambiaf_a_normal($row[inicio]);
$row[culminacion]=cambiaf_a_normal($row[culminacion]);
$ano=date("Y");
$fecha=date("d-m-Y");
$resultpl = pg_query($con, "select * from periodo_lectivo where estado='ACTIVO'"); 
$rowpl=pg_fetch_array($resultpl);
$resultau = pg_query($con, "select * from autorizado"); 
$rowau=pg_fetch_array($resultau);

////////////para obtener el id de pasantias
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
    <td><div align="right"><font face="arial"> </strong><font size="5" face="Codabarmedium"><?php include("barcode.php");?></font></font></div></td>
  </tr>
<tr> 
    <td height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif">BARINAS-<? echo $rowpl[periodo]?>-CISE-PASANTIAS-<? echo $row['cod_pasantia']; ?>-<?echo $ano;?></font></strong></p></td>
  </tr>
</table>

<td>&nbsp;</td>

<table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr> 
    <td height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif"></font></strong></p></td>
  </tr>
 <tr> 
    <td height="0" colspan="2"><p align="center"><strong><font size="5" face="Times New Roman, Times, serif">PLANILLA DE INSCRIPCIÓN DE PASANTÍAS</font></strong></p></td>
<td align="right"><img border="1" src="../imagenes/iconos/postit2.png" width="85" height="90" /></td>  </tr>
  
  </tr>
</table>
 <table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
    <tr>  
 </table>




<table width="700" align="center" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
   <tr><td>
<font size="2"><strong><em>DATOS PERSONALES Y ACADEMICOS DEL SOLICITANTE</em></strong></font>
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
<font size="-1"> , Sexo:
<? echo $row[sexo]; ?></font>
<font size="-1">, Edad:
<? echo $row[edad]; ?></font>
</td></tr>
<tr><td>
<font size="-1"> Correo Electrónico:
<? echo $row[correo]; ?></font>
<font size="-1"> , Teléfono:
<? echo $row[telefono_casa]; ?></font>
</td></tr>
<tr><td>
<font size="-1">Dirección:
<? echo $row[direccion]; ?></font>
</td></tr>   
 <tr><td>
<font size="-1">Parroquia:
<? echo $row[parroquia]; ?></font>
<font size="-1"> , Municipio:
 <? echo $row[municipio]; ?></font>
<font size="-1"> , Estado:
<? echo $row[estado]; ?></font>
</td></tr>  
<tr><td>
<font size="-1"> Trabaja:
<? echo $row[trabaja]; ?></font>
<font size="-1"> , Lugar:
<? echo $row[lugar]; ?></font>
<font size="-1"> , Condición Laboral:
<? echo $row[condicion_laboral]; ?></font>
</td></tr>
<tr><td>
<font size="-1"> Cargo:
<? echo $row[cargo]; ?></font>
<font size="-1"> , Departamento:
<? echo $row[departamento]; ?></font>
<font size="-1"> , Teléfono:
<? echo $row[telefono_oficina]; ?></font>
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
<font size="2"><strong><em>DATOS DE LA INSTITUCIÓN EN LA QUE REALIZARÁ LAS PASANTÍAS</em></strong>
</font></td></tr>  
<tr><td>
<font size="-1">Nombre:
<? echo $row[institucion]; ?></font>
</td></tr>
<tr><td>
<font size="-1">Dirección:
<? echo $row[direccion_institucion]; ?></font>
<font size="-1"> , Telefono:
<? echo $row[telefono_institucion]; ?></font>
</td></tr>
<tr><td>
<font size="-1">Objetivos de la pasantía:
</td></tr>
<tr><td>
<font size="-1"><? echo $row[objetivo_pasantia]; ?></font>
</td></tr>

<tr><td>
<font size="-1">Fecha de Inicio:
 <? echo $row[inicio]; ?></font>
<font size="-1">Fecha de culminación:
 <? echo $row[culminacion]; ?></font>
<tr><td></td></tr>
<tr><td>
<font size="2"><strong><em>AREA DONDE DESARROLLARÁ LAS PASANTÍAS</em></strong>
</font></td></tr>
<tr><td>
<font size="-1">Nombre del área:
<? echo $row[area]; ?></font>
</td></tr>
<tr><td>
<font size="-1">Explique brevemente las actividades que se desarrollan en esa área:</font>
</td></tr>
<tr><td>
<font size="-1"><? echo $row[actividades_area]; ?></font>
</td></tr>
<tr><td>
<font size="-1">Observaciones generales:</font>
</td></tr>
<tr><td>
<font size="-1"><? echo $row[observaciones_generales]; ?></font>
</td></tr>     
</table>

<p>&nbsp;</p>


<table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">  
<tr> 
    <td>
    <font size="2"><strong><em><? echo $rowau[nombre_proyecto]; ?></em></strong>
   </td>
   <td>
    <font size="2"><strong><em></em></strong>
   </td>
<td>
    <font size="2"><strong><em><? echo $row[nombre]; ?></em></strong>
   </td>
  </tr>
<tr> 
    <td>
    <font size="2"><strong><em>Coord. Regional de Pasantías</em></strong>
   </td>
   <td>
    <font size="2"><strong><em></em></strong>
   </td>
<td>
    <font size="2"><strong><em>Solicitante</em></strong>
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
