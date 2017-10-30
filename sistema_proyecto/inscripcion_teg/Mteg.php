<?php
//include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../barra.php");
include("../utils.php");

$id=$_GET[id];
$doc=$_GET[doc];

if ($doc=="CODIGO"){
$resulta = pg_query($con, "select * from teg where id_teg='".$_GET[id]."'"); 
$rowa=pg_fetch_array($resulta);
$resultb = pg_query($con, "select * from estudiante_teg where id_teg='".$rowa[id_teg]."'"); 
$rowb=pg_fetch_array($resultb);
}else{
$resultb = pg_query($con, "select * from estudiante_teg where cedula='".$_GET[id]."'"); 
$rowb=pg_fetch_array($resultb);
$resulta = pg_query($con, "select * from teg where id_teg='".$rowb[id_teg]."'"); 
$rowa=pg_fetch_array($resulta);
}
$resultcount = pg_query($con, "select COUNT(cedula) from estudiante_teg where id_teg='".$rowa[id_teg]."'"); 
$rowcount=pg_fetch_row($resultcount);


$resultado1 = pg_query($con,"SELECT * FROM pfg order by nombre_pfg");


$resultpl = pg_query($con, "select * from periodo_lectivo where estado='ACTIVO'"); 
$rowpl=pg_fetch_array($resultpl);
$rowpl[inicio]=cambiaf_a_normal($rowpl[inicio]);
$rowpl[culminacion]=cambiaf_a_normal($rowpl[culminacion]);
?>



<table width="" border="1" align="center" bgcolor="#FFFFFF">
  <tr><td colspan="2">
  <strong>PLANILLA DE INSCRIPCION DEL TEG</strong>
  </td></tr>
  <tr><td>        
<table align="center" width="100%" border="0"> 
<form style="width: ; height: 300px;" action="actualizarteg.php?cantidad=<?echo $rowcount[0];?>"  method="post">
<tr><td>
<em>1.1 Datos personales y académicos del Estudiante/Grupo: <font size=1>(* Campo Requerido)</font></em>
</td></tr>
<tr><td>
<font size="-1">* Codigo:</font>
<input  readonly name="codigo" type="text" id="id"  size="2" value="<? echo $rowa[id_teg];?>">
</td></tr>
<table align="center" width="100%" border="1"> 

<tr>
<td><font size="-1"></font></td>
<td><font size="-1">Cedula</font></td>
<td><font size="-1">Nombres y Apellidos</font></td>
<td><font size="-1">Telefono</font></td>
</tr> 
<?php 
$_GET['n']=$rowcount[0];
$resultciclo = pg_query($con, "select * from estudiante_teg where id_teg='".$rowa[id_teg]."'"); 
while($objc=pg_fetch_array($resultciclo))
{
$i++;
echo '<tr>';
echo '<td><input  readonly name=id_estudiante_teg'.$i.' type=text size=2 value='.$objc[id_estudiante_teg].'></td>';
echo '<td>
<select name=nacionalidad'.$i.'  ><option value=V selected>V</option><option value=E>E</option></select><input  name=cedula'.$i.' type=text id=cedula  size=8 value='.$objc[cedula].'></td>';
?>
<td><input  name=nombre<? echo $i;?> type="text"   size=38 value="<? echo $objc[nombre]?>"></td>
<?
echo '<td><input  name=telefono_estudiante'.$i.' type=text size=12 value='.$objc[telefono_estudiante].'></td>';
echo '</tr>'; 
}
?>
</table>



<table align="center" width="100%" border="0"> 

<tr><td>
<font size="-1">* Aldea donde estudia:</font>
<input  name="aldea" type="text" id="id"  size="66" value="<? echo $rowa[aldea];?>">
</td></tr>
<tr><td>
<font size="-1">* Parroquia:</font>
<input  name="parroquia" type="text" id="id"  size="10" value="<? echo $rowa[parroquia];?>">
<font size="-1">* Municipio:</font>
<select name="municipio" id="" >
<option value="<? echo $rowa[municipio];?>" selected><? echo $rowa[municipio];?></option>
<option value="BARINAS" >BARINAS</option>
<option value="ALBERTO ARVELO TORREALBA" >ALBERTO ARVELO TORREALBA</option>
<option value="ANDRES ELOY BLANCO" >ANDRES ELOY BLANCO</option>
<option value="ANTONIO JOSE DE SUCRE" >ANTONIO JOSE DE SUCRE</option>
<option value="ARISMENDI" >ARISMENDI</option>
<option value="BOLIVAR" >BOLIVAR</option>
<option value="CRUZ PAREDES" >CRUZ PAREDES</option>
<option value="EZEQUIEL ZAMORA" >EZEQUIEL ZAMORA</option>
<option value="OBISPOS" >OBISPOS</option>
<option value="PEDRAZA" >PEDRAZA</option>
<option value="ROJAS" >ROJAS</option>
<option value="SOSA" >SOSA</option>
</select>
<font size="-1">* Estado:</font>
<select name="estado" id="estado" >
<option value="<? echo $rowa[estado];?>" selected><? echo $rowa[estado];?></option>
<option value="BARINAS">BARINAS</option>
<option value="PORTUGUESA" >PORTUGUESA</option>
</select>
</td></tr>

<tr><td>

<font size="-1">* Trayecto:</font>
<select name="trayecto" id="" >
<option value="<? echo $rowa[trayecto];?>" selected><? echo $rowa[trayecto];?></option>
<option value="II" >II</option>
<option value="III" >III</option>
<option value="IV" >IV</option>
</select>
<font size="-1">* Tramo:</font>
<select name="tramo" id="" >
<option value="<? echo $rowa[tramo];?>" selected><? echo $rowa[tramo];?></option>
<option value="V" >V</option>
<option value="VI" >VI</option>
<option value="VII" >VII</option>
<option value="VIII" >VIII</option>
<option value="IX" >IX</option>
<option value="X" >X</option>
</select>
<font size="-1">* Sección:</font>
<input  name="seccion" type="text" id=""  size="10" value="<? echo $rowa[seccion];?>">
</td></tr>
<tr><td>
<font size="-1">* PFG:</font>
<select name="pfg" id="pfg"  >
<option value="" selected>Seleccione</option>
<option value="<? echo $rowa[pfg];?>" selected><? echo $rowa[pfg];?></option>
<?php while($obj=pg_fetch_object($resultado1)){?>
<option value="<? echo $obj->nombre_pfg ?>"> <? echo $obj->nombre_pfg?> 
 <? }//Fin while ?>
</select>
<font size="-1">Turno:</font>
<select name="turno" id="turno" >
<option value="<? echo $rowa[turno];?>" selected><? echo $rowa[turno];?></option>
<option value="DIURNO" >DIURNO</option>
<option value="NOCTURNO" >NOCTURNO</option>
<option value="FIN DE SEMANA" >FIN DE SEMANA</option>
</select>
</td></tr>
<tr><td>
<font size="-1">* Mención:</font>
<select name="mencion" id="mencion" >
<option value="<? echo $rowa[mencion];?>" selected><? echo $rowa[mencion];?></option>
<option value="SIN MENCION" >SIN MENCION</option>
<option value="INICIAL" >INICIAL</option>
<option value="ESPECIAL" >ESPECIAL</option>
<option value="DEPORTE" >DEPORTE</option>
</select><font size="-2">* Solo PNFE:</font>
</td></tr>




<tr><td></td></tr>
<tr><td>
<em>1.2 Datos del TEG:</em>
</td></tr>

<tr><td>
<font size="-1">* Nombre:</font>
<input  name="teg" type="text" id="teg"  size="76" value="<? echo $rowa[teg];?>">
</td></tr>
<tr><td>
<font size="-1">* Comunidad:</font>
<input  name="comunidad" type="text" id=""  size="73" value="<? echo $rowa[comunidad];?>">
</td></tr>
<tr><td>
<font size="-1">* Parroquia:</font>
<input  name="comunidad_parroquia" type="text" id="id"  size="10" value="<? echo $rowa[comunidad_parroquia];?>">
<font size="-1">* Municipio:</font>
<select name="comunidad_municipio" id="" >
<option value="<? echo $rowa[comunidad_municipio];?>" selected><? echo $rowa[comunidad_municipio];?></option>
<option value="BARINAS" >BARINAS</option>
<option value="ALBERTO ARVELO TORREALBA" >ALBERTO ARVELO TORREALBA</option>
<option value="ANDRES ELOY BLANCO" >ANDRES ELOY BLANCO</option>
<option value="ANTONIO JOSE DE SUCRE" >ANTONIO JOSE DE SUCRE</option>
<option value="ARISMENDI" >ARISMENDI</option>
<option value="BOLIVAR" >BOLIVAR</option>
<option value="CRUZ PAREDES" >CRUZ PAREDES</option>
<option value="EZEQUIEL ZAMORA" >EZEQUIEL ZAMORA</option>
<option value="OBISPOS" >OBISPOS</option>
<option value="PEDRAZA" >PEDRAZA</option>
<option value="ROJAS" >ROJAS</option>
<option value="SOSA" >SOSA</option>
</select>
<font size="-1">* Estado:</font>
<select name="comunidad_estado" id="estado" >
<option value="<? echo $rowa[comunidad_estado];?>" selected><? echo $rowa[comunidad_estado];?></option>
<option value="BARINAS">BARINAS</option>
<option value="PORTUGUESA" >PORTUGUESA</option>
</select>
</td></tr>

<tr><td>
<font size="-1">* Objetivos de la Investigación:</font>
</td></tr>
<tr><td>
<input  name="objetivo" type="text" id=""  size="84" value="<? echo $rowa[objetivo];?>">
</td></tr>

<tr><td>
<font size="-1">* Area de Vinculación con el Proyecto Nacional Simón Bolívar:</font>
</td></tr>
<tr><td>
<input  name="area_vinculacion" type="text" id=""  size="84" value="<? echo $rowa[area_vinculacion];?>">
</td></tr>

<tr><td>
<font size="-1">* Instituciones u organizaciones Vinculadas:</font>
</td></tr>
<tr><td>
<input  name="instituciones" type="text" id=""  size="84" value="<? echo $rowa[instituciones];?>">
</td></tr>

<tr><td></td></tr>
<tr><td>
<em>1.2 Datos de los Docentes Asesores :</em>
</td></tr>
<tr><td>
<font size="-1">* Enlace:</font>
<input  name="enlace" type="text" id="id"  size="18" value="<? echo $rowa[enlace];?>">
<font size="-1">* Correo:</font>
<input  name="correo_enlace" type="text" id="id"  size="18" value="<? echo $rowa[correo_enlace];?>">
<font size="-1">* Telefono:</font>
<input  name="tlf_enlace" type="text" id="id"  size="8" value="<? echo $rowa[tlf_enlace];?>">

<tr><td></td></tr>
<tr><td>
<font size="-1">* Asesor Academico:</font>
<input  name="academico" type="text" id="id"  size="18" value="<? echo $rowa[academico];?>">
<font size="-1">* Correo:</font>
<input  name="correo_academico" type="text" id="id"  size="18" value="<? echo $rowa[correo_academico];?>">
<font size="-1">* Telefono:</font>
<input  name="tlf_academico" type="text" id="id"  size="8" value="<? echo $rowa[tlf_academico];?>">

<tr><td></td></tr>
<tr><td>
<font size="-1">* Institucional:</font>
<input  name="institucional" type="text" id="id"  size="18" value="<? echo $rowa[institucional];?>">
<font size="-1">* Correo:</font>
<input  name="correo_institucional" type="text" id="id"  size="18" value="<? echo $rowa[correo_institucional];?>">
<font size="-1">* Telefono:</font>
<input  name="tlf_institucional" type="text" id="id"  size="8" value="<? echo $rowa[tlf_institucional];?>">

<tr><td></td></tr>


<tr><td>
<font size="-1">Observaciones generales:</font>
</td></tr>
<tr><td>
<input  name="observaciones_generales" type="text" id=""  size="84" value="<? echo $rowa[observaciones_generales];?>">
</td></tr>


<tr><td></td></tr>
<tr><td>
<em>1.3 Documentos Consignados:</em>
</td></tr>
<tr><td>
<?
if ($rowa[documento1]=='on'){
$val1="checked";
}
if ($rowa[documento2]=='on'){
$val2="checked";
}
if ($rowa[documento3]=='on'){
$val3="checked";
}
if ($rowa[documento4]=='on'){
$val4="checked";
}

?>
<input type="checkbox" name="documento1" <?echo $val1?>>
<font size="-1">1 Trabajo Especial de grado en Físico y/o Digital.</font>
</td></tr>
<tr><td>
<input type="checkbox" name="documento2" <?echo $val2?>>
<font size="-1">1 Copia ampliada de la Cedula o pasaporte sin recortar.</font>
</td></tr>
<tr><td>
<input type="checkbox" name="documento3" <?echo $val3?>>
<font size="-1">1 Copia de la planilla de consignación de documentos emitida por CIPEE UBV.</font>
</td></tr>
<tr><td>
<input type="checkbox" name="documento4" <?echo $val4?>>
<font size="-1">1 Copia de la planilla de inscripción emitida por CIPEE UBV del periodo Lectivo.</font>
</td></tr>



<tr><td></td></tr>
<tr><td></td></tr>
<tr><td align="center">
<input value="ACTUALIZAR TEG" type="submit" name="submit2">
</td></tr>

</form>
</table>

<p>* Campo requerido</p>
</td></tr>
</table>
   </tr>
 <?php include("../pie.php");?>