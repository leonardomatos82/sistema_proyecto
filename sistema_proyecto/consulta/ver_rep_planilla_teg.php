<?php
session_start();
include("../config.php");
include("../utils.php");

include("numero2.php"); 
$cedula=$_GET[id];
$resultpl = pg_query($con, "select * from periodo_lectivo where estado='ACTIVO'"); 
$rowpl=pg_fetch_array($resultpl);
$resultau = pg_query($con, "select * from autorizado"); 
$rowau=pg_fetch_array($resultau);
$result = pg_query($con, "select * from estudiante_teg where cedula='".$cedula."'
ORDER BY id_teg DESC LIMIT 1 
"); 
$row=pg_fetch_array($result);
$result2 = pg_query($con, "select * from teg where periodo='".$rowpl['periodo']."' and id_teg='".$row['id_teg']."'"); 
$row2=pg_fetch_array($result2);
$result3 = pg_query($con, "select * from estudiante_teg where id_teg='".$row['id_teg']."'"); 


$row2[fecha_inscripcion]=cambiaf_a_normal($row2[fecha_inscripcion]);
$ano=date("Y");
$fecha=date("d-m-Y");


////////////para obtener el id de pasantias
$rc="select id_teg from teg where id_teg='".$row2[id_teg]."'";
$qrc=pg_query($con,$rc);
$cant_reg=pg_fetch_array($qrc);
$num=$cant_reg[0]-1195;
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
<td>&nbsp;</td>

<table width="625" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td><div align="right"><font face="arial"> </strong><font size="5" face="Codabarmedium"><?php include("barcode.php");?></font></font></div></td>
  </tr>
<tr> 
    <td height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif">BARINAS-<? echo $rowpl[periodo]?>-CISE-TEG-<? echo $row2['cod_teg']; ?>-<?echo $ano;?></font></strong></p></td>
  </tr>
</table>

<td>&nbsp;</td>

<table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr> 
    <td height="0" colspan="2"><p align="right"><strong><font size="2" face="Times New Roman, Times, serif"></font></strong></p></td>
  </tr>
 <tr> 
    <td height="0" colspan="2"><p align="center"><strong><font size="4" face="Times New Roman, Times, serif">PLANILLA DE INSCRIPCIÓN DEL TRABAJO ESPECIAL DE GRADO (TEG)</font></strong></p></td>
<td align="right"></td>  </tr>
  
  </tr>
</table>
<td>&nbsp;</td>

 </table>
<table width="700" align="center" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
   <tr><td>
<font size="-2"><strong><em>Datos Personales y Academicos del Solicitante</em></strong></font>
</td></tr>
 </table>
<table width="700" align="center" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
 <tr>
<td width=20%"><font size="-2">Periodo Academico</font></td>
<td><font size="-2">Trayecto</font></td>
<td><font size="-2">Tramo</font></td>
<td><font size="-2">Sección</font></td>
<td><font size="-2">Fecha Inscripción</font></td>
</tr> 
 <tr>

<td width=20%" align=center><font size="-2"><? echo $row2[periodo];?>   </font></td>
<td width=20%" align=center><font size="-2"><? echo $row2[trayecto];?>   </font></td>
<td width=20%" align=center><font size="-2"><? echo $row2[tramo];?>   </font></td>
<td width=20%" align=center><font size="-2"><? echo $row2[seccion];?>   </font></td>
<td width=20%" align=center><font size="-2"><? echo $row2[fecha_inscripcion];?>   </font></td>
</tr>  
   
 </table>


<table width="700" align="center" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >

 <tr><td>
<font size="-2">Parroquia:
<? echo $row2[parroquia]; ?></font>
<font size="-2"> , Municipio:
 <? echo $row2[municipio]; ?></font>
<font size="-2"> , Estado:
<? echo $row2[estado]; ?></font>
</td></tr> 
 <tr><td>
<font size="-2">Aldea:
<? echo $row2[aldea]; ?></font>
</td></tr> 
 <tr><td>
<font size="-2">PFG:
<? echo $row2[pfg]; ?></font>
</td></tr> 
 </table>

 <table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
    <tr>  <td>

<table align="center" width="100%" border="1"> 
<tr>
<td><font size="-2">Nº</font></td>
<td><font size="-2">Cedula</font></td>
<td><font size="-2">Nombres y Apellidos</font></td>

<td><font size="-2">Telefono</font></td>
</tr> 
<?php 
$_GET['n']=$doc;
$c=1;
while ($row3 = pg_fetch_array($result3)){
echo '<tr>';
echo '<td><font size="-2">';
echo $c++;
echo '</font></td>';

echo '<td align=left><font size="-2">';
echo $row3[cedula];
echo '</font></td>';
echo '<td><font size="-2">';
echo $row3[nombre];
echo '</font></td>';
echo '<td><font size="-2">';
echo $row3[telefono_estudiante];
echo '</font></td>';
echo '</tr>'; 
}
?>
</table>


<table width="700" align="center" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
   <tr><td>
<font size="-2"><strong><em>Nombre del Trabajo Especial de Grado</em></strong></font>
</td></tr>
<tr><td>
<font size="-2"><? echo $row2[teg]; ?>

</td>
</tr>    
   <tr><td>
<font size="-2"><strong><em>Objetivos de la Investigación</em></strong></font>
</td></tr>
<tr><td>
<font size="-2"><? echo $row2[objetivo]; ?>

</td>
</tr>    

<tr><td></td></tr>
<tr><td>
<font size="-2"><strong><em>Comunidad o Sector donde se desarrollo el TEG</em></strong>
</font></td></tr>  
<tr><td>
<font size="-2"><? echo $row2[comunidad]; ?></font>
</td></tr>

<tr><td>
<font size="-2"><strong><em>Area de Vinculación con el Proyecto Nacional Simón Bolívar</em></strong>
</font></td></tr>
<tr><td>
<font size="-2"><? echo $row2[area_vinculacion]; ?></font>
</td></tr>

<tr><td>
<font size="-2"><strong><em>Instituciones u Organizaciones Sociales vinculadas al Proyecto</em></strong>
</font></td></tr>
<tr><td>
<font size="-2"><? echo $row2[instituciones]; ?></font>
</td></tr>

<tr><td>
<font size="-2"><strong><em>Observaciones:</em></strong>
</font></td></tr>
<tr><td>
<font size="-2"><? echo $row2[observaciones_generales]; ?></font>
</td></tr>

<tr><td>
<font size="-2"><strong><em>Fecha de Socialización del TEG:</em></strong>
</font></td></tr>
<tr><td>
<font size="-2"><? echo $rowpl[fecha_socializacion_teg]; ?></font>
</td></tr>
</table>

<p>&nbsp;</p>


<table width="700" align="center" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">  
<tr> 
    <td>
    <font size="-1"><strong><em><? echo $rowau[nombre_proyecto]; ?></em></strong>
   </td>
   <td>
    <font size="-1"><strong><em></em></strong>
   </td>
<td>
    <font size="-1"><strong><em><? echo $row[nombre]; ?></em></strong>
   </td>
  </tr>
<tr> 
    <td>
    <font size="-1"><strong><em>Coord. Integración Socioeducativa</em></strong>
   </td>
   <td>
    <font size="-1"><strong><em></em></strong>
   </td>
<td>
    <font size="-1"><strong><em>Solicitante</em></strong>
   </td>
  </tr>
</table>

<?
	  /////////////////////////////
$valor="-Operacion: IMPRIMIR PLANILLA DE TEG".$cedula;
 registrarOperacion($con,$_SESSION['login'],$valor);      

///////////////////////////////////////////////////////////////////  
if($conta<3){
echo"<p>&nbsp;</p>";

}
?>