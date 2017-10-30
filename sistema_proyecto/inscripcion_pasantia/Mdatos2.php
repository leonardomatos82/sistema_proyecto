<?php
//include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../barra.php");
include("../utils.php");
include("../validar_campos.php");

$id=$_GET[id];
$doc=$_GET[doc];

if ($doc=="CODIGO"){
$resulta = pg_query($con, "select * from pasantia where id_pasantia='".$_GET[id]."'"); 
$rowa=pg_fetch_array($resulta);

}else{
$resulta = pg_query($con, "select * from pasantia where cedula='".$_GET[id]."'"); 
$rowa=pg_fetch_array($resulta);

}

//echo $rowa[cedula];
$resultcount = pg_query($con, "select COUNT(cedula) from pasantia where id_pasantia='".$rowa[id_pasantia]."'"); 
$rowcount=pg_fetch_row($resultcount);




$resultado1 = pg_query($con,"SELECT * FROM pfg order by nombre_pfg");


$resultpl = pg_query($con, "select * from periodo_lectivo where estado='ACTIVO'"); 
$rowpl=pg_fetch_array($resultpl);
$rowpl[inicio]=cambiaf_a_normal($rowpl[inicio]);
$rowpl[culminacion]=cambiaf_a_normal($rowpl[culminacion]);
?>



<table width="" border="1" align="center" bgcolor="#FFFFFF">
  <tr><td colspan="2">
  <strong>PLANILLA DE INSCRIPCION DE PASANTIAS</strong>
  </td></tr>
  <tr><td>        
<table align="center" width="100%" border="0"> 
<form style="width: ; height: 300px;" action="modificar_r.php?documento=<?echo $doc;?>"  method="post">
<tr><td>
<em>1.1 Datos personales y académicos del solicitante: <font size=1>(* Campo Requerido)</font></em>
</td></tr>
<tr>
<td>
<font size="-1">* Codigo:</font>
<input  name="id_pasantia" type="text" id="id_pasantia"  size="5" readonly value="<? echo $rowa[id_pasantia]; ?>" maxlength=5 onkeyup="return acceptNum(event)" onkeypress="return acceptNum(event)">
</td></tr>  
<tr>
<td>
<font size="-1">* Cedula de Identidad:</font>
<select name="nacionalidad" id="nacionalidad" >
<option value="V" selected>V</option>
<option value="E">E</option>
</select>
<input  name="cedula" type="text" id="cedula"  size="9" value="<? echo $rowa[cedula]; ?>" maxlength=9 onkeyup="return acceptNum(event)" onkeypress="return acceptNum(event)">
</td></tr>  

<tr><td>
<font size="-1">* Nombres y apellidos:</font>
<input  name="nombre" type="text" id="nombre"  size="45" value="<? echo $rowa[nombre]; ?>" maxlength=100 onkeyup="return acceptChar(event)" onkeypress="return acceptChar(event)">
<font size="-1">* Sexo:</font>

<select name="sexo" id="sexo" >
<option value="<? echo $rowa[sexo]; ?>" selected ><? echo $rowa[sexo]; ?></option>
<option value="M">M</option>
<option value="F">F</option>
</select>
<font size="-1">* Edad:</font><input  name="edad" type="text" id="edad"  size="1" value="<? echo $rowa[edad]; ?>" maxlength=2 onkeyup="return acceptNum(event)" onkeypress="return acceptNum(event)">
</td></tr>

<tr><td>
<font size="-1">Correo Electrónico:</font>
<input  name="correo" type="text" id="id"  size="30" value="<? echo $rowa[correo]; ?>">
<font size="-1">* Teléfono:</font>
<input  name="telefono_casa" type="text" id="id"  size="10" value="<? echo $rowa[telefono_casa]; ?>">
</td></tr>

<tr><td>
<font size="-1">* Dirección:</font>
<input  name="direccion" type="text" id="id"  size="75" value="<? echo $rowa[direccion]; ?>">
</td></tr>

<tr><td>
<font size="-1">* Parroquia:</font>
<input  name="parroquia" type="text" id="id"  size="10" value="<? echo $rowa[parroquia]; ?>">
<font size="-1">* Municipio:</font>
<select name="municipio" id="" >
<option value="<? echo $rowa[municipio]; ?>" selected><? echo $rowa[municipio]; ?></option>
<option value="BARINAS">BARINAS</option>
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
<option value="<? echo $rowa[estado]; ?>" selected><? echo $rowa[estado]; ?></option>
<option value="BARINAS" >BARINAS</option>
<option value="PORTUGUESA" >PORTUGUESA</option>
</select>
</td></tr>

<tr><td>
<font size="-1">* Trabaja:</font>
<select name="trabaja" id="trabaja" >
<option value="<? echo $rowa[trabaja]; ?>" selected><? echo $rowa[trabaja]; ?></option>
<option value="SI" >SI</option>
<option value="NO" >NO</option>
</select>
<font size="-1">Lugar:</font>
<input  name="lugar" type="text" id="id"  size="31" value="<? echo $rowa[lugar]; ?>">
<font size="-1">Condición Laboral:</font>
<select name="condicion_laboral" id="" >
<option value="<? echo $rowa[condicion_laboral]; ?>" selected><? echo $rowa[condicion_laboral]; ?></option>
<option value="FIJO" >FIJO</option>
<option value="CONTRATADO" >CONTRATADO</option>
</select>
</td></tr>

<tr><td>
<font size="-1">Cargo:</font>
<input  name="cargo" type="text" id="id"  size="18" value="<? echo $rowa[cargo]; ?>">
<font size="-1">Departamento:</font>
<input  name="departamento" type="text" id="id"  size="21" value="<? echo $rowa[departamento]; ?>">
<font size="-1">Teléfono:</font>
<input  name="telefono_oficina" type="text" id="id"  size="10" value="<? echo $rowa[telefono_oficina]; ?>" maxlength=12 onkeyup="return acceptNum(event)" onkeypress="return acceptNum(event)">
</td></tr>

<tr><td>
<font size="-1">* PFG que estudia:</font>
<select name="pfg" id="pfg"  >
<option value="<? echo $rowa[pfg]; ?>" selected><? echo $rowa[pfg]; ?></option>
<?php while($obj=pg_fetch_object($resultado1)){?>
<option value="<? echo $obj->nombre_pfg ?>"> <? echo $obj->nombre_pfg?> 
 <? }//Fin while ?>
</select>
<font size="-1">* Turno:</font>
<select name="turno" id="turno" >
<option value="<? echo $rowa[turno]; ?>" selected><? echo $rowa[turno]; ?></option>
<option value="DIURNO" >DIURNO</option>
<option value="NOCTURNO" >NOCTURNO</option>
<option value="FIN DE SEMANA" >FIN DE SEMANA</option>
</select>
</td></tr>

<tr><td>
<font size="-1">* Aldea donde estudia:</font>
<input  name="aldea" type="text" id="id"  size="66" value="<? echo $rowa[aldea]; ?>" maxlength=100 onkeyup="return acceptChar(event)" onkeypress="return acceptChar(event)">
</td></tr>


<tr><td></td></tr>
<tr><td>
<em>1.2 Datos de la institución y/u organización social en la que realizará las pasantías:</em>
</td></tr>

<tr><td>
<font size="-1">* Nombre:</font>
<input  name="institucion" type="text" id="institucion"  size="76" value="<? echo $rowa[institucion]; ?>">
</td></tr>
<tr><td>
<font size="-1">* Dirección:</font>
<input  name="direccion_institucion" type="text" id="direccion"  size="53" value="<? echo $rowa[direccion_institucion]; ?>">
<font size="-1">Telefono:</font>
<input  name="telefono_institucion" type="text" id=""  size="10" value="<? echo $rowa[telefono_institucion]; ?>" maxlength=12 onkeyup="return acceptNum(event)" onkeypress="return acceptNum(event)">
</td></tr>

<tr><td>
<font size="-1">* Objetivos de la pasantía:</font>
</td></tr>
<tr><td>
<input  name="objetivo_pasantia" type="text" id=""  size="84" value="<? echo $rowa[objetivo_pasantia]; ?>">
</td></tr>

<tr><td>
<font size="-1">* Fecha de Inicio:</font>
<input  name="inicio" type="text" id="id"  size="18" value="<? echo $rowpl['inicio']; ?>" maxlength=12 onkeypress="return acceptfecha(event)">
<font size="-1">* Fecha de culminación:</font>
<input  name="culminacion" type="text" id="id"  size="18" value="<? echo $rowpl['culminacion']; ?>" maxlength=12 onkeypress="return acceptfecha(event)">

<tr><td></td></tr>
<tr><td>
<em>1.3 Area donde desarrollará las pasantías:</em>
</td></tr>

<tr><td>
<font size="-1">* Nombre del área:</font>
<input  name="area" type="text" id="area"  size="84" value="<? echo $rowa[area]; ?>">
</td></tr>
<tr><td>
<font size="-1">* Explique brevemente las actividades que se desarrollan en esa área:</font>
</td></tr>
<tr><td>
<input  name="actividades_area" type="text" id=""  size="84" value="<? echo $rowa[actividades_area]; ?>">
</td></tr>
<tr><td>
<font size="-1">Observaciones generales:</font>
</td></tr>
<tr><td>
<input  name="observaciones_generales" type="text" id=""  size="84" value="<? echo $rowa[observaciones_generales]; ?>">
</td></tr>


<tr><td></td></tr>
<tr><td>
<em>1.4 Documentos Consignados:</em>
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
<font size="-1">1 Foto de frente tipo Carnet.</font>
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
<input value="MODIFICAR REGISTRO PASANTIAS" type="submit" name="submit2">
</td></tr>

</form>
</table>

<p>* Campo requerido</p>
</td></tr>
</table>
   </tr>
 <?php include("../pie.php");?>