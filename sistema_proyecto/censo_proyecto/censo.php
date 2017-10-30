<?php
//include("../control/valida.php"); 
include("../validar_campos.php");
include("../config.php");
include("../tabla2.php");
include("../barra.php");
include("../utils.php");

$doc=$_POST[cantidad];
$doc=1;
//$result = pg_query($con, "select * from datos where cedula='".$_GET[id]."'"); 
//$row=pg_fetch_array($result);
$resultado1 = pg_query($con,"SELECT * FROM pfg order by nombre_pfg");


$resultpl = pg_query($con, "select * from periodo_lectivo where estado='ACTIVO'"); 
$rowpl=pg_fetch_array($resultpl);
$rowpl[inicio]=cambiaf_a_normal($rowpl[inicio]);
$rowpl[culminacion]=cambiaf_a_normal($rowpl[culminacion]);
?>



<table width="" border="1" align="center" bgcolor="#FFFFFF">
  <tr><td colspan="2">
  <strong>FICHA PARA EL REGISTRO DE LOS PROYECTOS ACADEMICOS COMUNITARIOS</strong>
  </td></tr>
  <tr><td>        
<table align="center" width="100%" border="0"> 
<form style="width: ; height: 300px;" action="agregar_censo.php?cantidad=<?echo $doc;?>"  method="post">
<tr><td>
<em>1.1 Datos personales y académicos del Estudiante/Grupo: <font size=1>(* Campo Requerido)</font></em>
</td></tr>
<table align="center" width="100%" border="1"> 
<tr>
<td><font size="-1">Cedula</font></td>
<td><font size="-1">Nombres y Apellidos</font></td>
<td><font size="-1">Telefono</font></td>
</tr> 
<?php 
$_GET['n']=$doc;
for($i=1;$i<=$_GET['n'];$i++)
{
echo '<tr>';
echo '<td><select name=nacionalidad'.$i.'  ><option value=V selected>V</option><option value=E>E</option></select>'
?>
 <input name="cedula<? echo $i; ?>" type="text" id="cedula" onkeypress="return acceptNum(event)" maxlength=9 size="10" value="<? echo $_POST[cedula]?>" />
</td><td>
<input name="nombre<? echo $i; ?>"  size=38 type="text" maxlength=100 value="" onkeyup="return acceptChar(event)" onkeypress="return acceptChar(event)" value="<? echo $_POST[nombre]?>">
</td><td>
<input name="telefono_estudiante<? echo $i; ?>"  size=12 type="text" maxlength=12 value="" onkeyup="return acceptNum(event)" onkeypress="return acceptNum(event)" value="<? echo $_POST[telefono_estudiante]?>">
</td></tr>
<?
}
?>
</table>



<table align="center" width="100%" border="0"> 
<tr><td>
<font size="-1">* Cantidad de Estudiantes vinculados al PAC:</font>
<input  name="cantidad_estudiantes" type="text" id="id"  size="5" value="" onkeyup="return acceptNum(event)" onkeypress="return acceptNum(event)">
</td></tr>
<tr><td>
<font size="-1">* Aldea donde estudia:</font>
<input  name="aldea" type="text" id="id"  size="66" value="" onkeyup="return acceptChar(event)" onkeypress="return acceptChar(event)">
</td></tr>
<tr><td>
<font size="-1">* Parroquia:</font>
<input  name="parroquia" type="text" id="id"  size="10" value="" onkeyup="return acceptChar(event)" onkeypress="return acceptChar(event)">
<font size="-1">* Municipio:</font>
<select name="municipio" id="" >
<option value="BARINAS" selected>BARINAS</option>
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
<option value="BARINAS" selected>BARINAS</option>
<option value="PORTUGUESA" >PORTUGUESA</option>
</select>
</td></tr>

<tr><td>

<font size="-1">* Trayecto:</font>
<select name="trayecto" id="" >
<option value="I" selected>I</option>
<option value="II" selected>II</option>
<option value="III" selected>III</option>
<option value="IV" >IV</option>
</select>
<font size="-1">* Tramo:</font>
<select name="tramo" id="" >
<option value="I" selected>I</option>
<option value="II" selected>II</option>
<option value="III" selected>III</option>
<option value="IV" selected>IV</option>
<option value="V" selected>V</option>
<option value="VI" >VI</option>
<option value="VII" >VII</option>
<option value="VIII" >VIII</option>
<option value="IX" selected>IX</option>
<option value="X" >X</option>
</select>
<font size="-1">* Sección:</font>
<input  name="seccion" type="text" id=""  maxlength=10 size="10" value="">
</td></tr>
<tr><td>
<font size="-1">* PFG:</font>
<select name="pfg" id="pfg"  >
<option value="" selected>Seleccione</option>
<?php while($obj=pg_fetch_object($resultado1)){?>
<option value="<? echo $obj->nombre_pfg ?>"> <? echo $obj->nombre_pfg?> 
 <? }//Fin while ?>
</select>
<font size="-1">Turno:</font>
<select name="turno" id="turno" >
<option value="" selected></option>
<option value="DIURNO" >DIURNO</option>
<option value="NOCTURNO" >NOCTURNO</option>
<option value="FIN DE SEMANA" >FIN DE SEMANA</option>
</select>
</td></tr>
<?
if ($_GET['n']==1){
?>
<tr><td>
<font size="-1">* Mención:</font>
<select name="mencion" id="mencion" >
<option value="" selected></option>
<option value="SIN MENCION" >SIN MENCION</option>
<option value="INICIAL" >INICIAL</option>
<option value="ESPECIAL" >ESPECIAL</option>
<option value="DEPORTE" >DEPORTE</option>
</select><font size="-2">* Solo PNFE:</font>
</td></tr>
<?
}
?>



<tr><td></td></tr>
<tr><td>
<em>1.2 Datos del Proyecto Academico Comunitario:</em>
</td></tr>
<tr><td>
<font size="-1">* Tipo de Proyecto:</font>
<input  name="tipo_proyecto" type="text" id=""  size="20" value="">

<font size="-1">* Fase actual del Proyecto:</font>
<select name="fase" id="fase" >
<option value="" selected></option>
<option value="DIAGNOSTICO" >DIAGNOSTICO</option>
<option value="FORMULACION" >FORMULACION</option>
<option value="EJECUCION" >EJECUCION</option>
<option value="EVALUACION" >EVALUACION</option>
<option value="SISTEMATIZACION" >SISTEMATIZACION</option>
</select>
</td></tr>
<tr><td>
<font size="-1">* Nombre del Proyecto:</font>
<input  name="nombre_proyecto" type="text" id="teg"  size="70" value="">
</td></tr>
<tr><td>
<font size="-1">* Comunidad:</font>
<input  name="comunidad" type="text" id=""  size="73" value="">
</td></tr>

<tr><td>
<font size="-1">* Objetivo del Proyecto:</font>
</td></tr>
<tr><td>
<input  name="objetivo" type="text" id=""  size="84" value="">
</td></tr>

<tr><td>
<font size="-1">* Area de Vinculación con el Proyecto Nacional Simón Bolívar:</font>
</td></tr>
<tr><td>
<input  name="area_vinculacion" type="text" id=""  size="84" value="">
</td></tr>

<tr><td>
<font size="-1">* Instituciones u organizaciones sociales vinculadas al Proyecto:</font>
</td></tr>
<tr><td>
<input  name="instituciones" type="text" id=""  size="84" value="">
</td></tr>
<tr><td>
<font size="-1">* Alcance del Proyecto:</font>
</td></tr>
<tr><td>
<input  name="alcance" type="text" id=""  size="84" value="">
</td></tr>
<tr><td></td></tr>
<tr><td>
<tr><td>
<em>1.3 Datos y Requerimientos del Proyecto:</em>
</td></tr>
<tr><td>
<font size="-1">Recursos Requeridos:</font>
</td></tr>
<tr><td>
<input  name="recursos_requeridos" type="text" id=""  size="84" value="">
</td></tr>
<tr><td>
<font size="-1">Apoyo Requerido:</font>
</td></tr>
<tr><td>
<input  name="apoyo_requerido" type="text" id=""  size="84" value="">
</td></tr>
<tr><td>
<font size="-1">Monto Asignado:</font>
</td></tr>
<tr><td>
<input  name="monto_asignado" type="text" id=""  size="84" value="">
</td></tr>
<tr><td>
<font size="-1">Otras Ayudas:</font>
</td></tr>
<tr><td>
<input  name="otras_ayudas" type="text" id=""  size="84" value="">
</td></tr>
<tr><td>
<font size="-1">Forma parte de alguna iniciativa o proyecto del estado:</font>
</td></tr>
<tr><td>
<input  name="iniciativa_estado" type="text" id=""  size="84" value="">
</td></tr>



<tr><td>
<em>1.4 Enlaces Responsables del Proyecto Academico Comunitario:</em>
</td></tr>
<tr><td>
<font size="-1">* Prof. de Proyecto:</font>
<input  name="prof_proyecto" type="text" id="id"  size="18" value="" onkeypress="return acceptChar(event)">
<font size="-1">* Correo:</font>
<input  name="correo_proyecto" type="text" id="id"  size="18" value="@">
<font size="-1">* Telefono:</font>
<input  name="tlf_proyecto" type="text" id="id"  size="8" value="" onkeypress="return acceptNum(event)">

<tr><td></td></tr>
<tr><td>
<font size="-1">* Prof. Enlace UBV:</font>
<input  name="enlace_ubv" type="text" id="id"  size="18" value="" onkeypress="return acceptChar(event)">
<font size="-1">* Correo:</font>
<input  name="correo_enlace" type="text" id="id"  size="18" value="@">
<font size="-1">* Telefono:</font>
<input  name="tlf_enlace" type="text" id="id"  size="8" value="" onkeypress="return acceptNum(event)">

<tr><td></td></tr>
<tr><td>
<font size="-1">* Enlace institucional:</font>
<input  name="institucional" type="text" id="id"  size="18" value="" onkeypress="return acceptChar(event)">
<font size="-1">* Correo:</font>
<input  name="correo_institucional" type="text" id="id"  size="18" value="@">
<font size="-1">* Telefono:</font>
<input  name="tlf_institucional" type="text" id="id"  size="8" value="" onkeypress="return acceptNum(event)">

<tr><td></td></tr>
<tr><td>
<font size="-1">* Enlace Comunitario:</font>
<input  name="institucional" type="text" id="id"  size="18" value="" onkeypress="return acceptChar(event)">
<font size="-1">* Correo:</font>
<input  name="correo_institucional" type="text" id="id"  size="18" value="@">
<font size="-1">* Telefono:</font>
<input  name="tlf_institucional" type="text" id="id"  size="8" value="" onkeypress="return acceptNum(event)">
<tr><td></td></tr>
<tr><td>
<font size="-1">Observaciones:</font>
</td></tr>
<tr><td>
<input  name="observaciones" type="text" id=""  size="84" value="">
</td></tr>

<tr><td></td></tr>

<tr><td></td></tr>
<tr><td></td></tr>
<tr><td align="center">
<input value="REGISTRAR CENSO" type="submit" name="submit2">
</td></tr>

</form>
</table>

<p>* Campo requerido</p>
</td></tr>
</table>
   </tr>
 <?php include("../pie.php");?>
