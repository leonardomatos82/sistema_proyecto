<?php
//include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../barra.php");
include("../utils.php");
include("../validar_campos.php");
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
<form style="width: ; height: 300px;" action="agregar_r.php?documento=<?echo $doc;?>"  method="post">
<tr><td>
<em>1.1 Datos personales y académicos del solicitante: <font size=1>(* Campo Requerido)</font></em>
</td></tr>
  
<tr><td>
<font size="-1">* Cedula de Identidad:</font>
<select name="nacionalidad" id="nacionalidad" >
<option value="V" selected>V</option>
<option value="E">E</option>
</select>
<input  name="cedula" type="text" id="cedula"  size="9" value="<? echo $_POST['cedula'];?>" maxlength=9 onkeyup="return acceptNum(event)" onkeypress="return acceptNum(event)">
</td></tr>  

<tr><td>
<font size="-1">* Nombres y apellidos:</font>
<input  name="nombre" type="text" id="nombre"  size="45" value="" maxlength=100 onkeyup="return acceptChar(event)" onkeypress="return acceptChar(event)">
<font size="-1">* Sexo:</font>
<select name="sexo" id="sexo" >
<option value=" " selected ></option>
<option value="M">M</option>
<option value="F">F</option>
</select>
<font size="-1">* Edad:</font><input  name="edad" type="text" id="edad"  size="1" value="" maxlength=2 onkeyup="return acceptNum(event)" onkeypress="return acceptNum(event)">
</td></tr>

<tr><td>
<font size="-1">Correo Electrónico:</font>
<input  name="correo" type="text" id="id"  size="30" value="@">
<font size="-1">* Teléfono:</font>
<input  name="telefono_casa" type="text" id="id"  size="10" value="@">
</td></tr>

<tr><td>
<font size="-1">* Dirección:</font>
<input  name="direccion" type="text" id="id"  size="75" value="">
</td></tr>

<tr><td>
<font size="-1">* Parroquia:</font>
<input  name="parroquia" type="text" id="id"  size="10" value="">
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
<font size="-1">* Trabaja:</font>
<select name="trabaja" id="trabaja" >
<option value="" selected></option>
<option value="SI" >SI</option>
<option value="NO" >NO</option>
</select>
<font size="-1">Lugar:</font>
<input  name="lugar" type="text" id="id"  size="31" value="">
<font size="-1">Condición Laboral:</font>
<select name="condicion_laboral" id="" >
<option value="" selected></option>
<option value="FIJO" >FIJO</option>
<option value="CONTRATADO" >CONTRATADO</option>
</select>
</td></tr>

<tr><td>
<font size="-1">Cargo:</font>
<input  name="cargo" type="text" id="id"  size="18" value="">
<font size="-1">Departamento:</font>
<input  name="departamento" type="text" id="id"  size="21" value="">
<font size="-1">Teléfono:</font>
<input  name="telefono_oficina" type="text" id="id"  size="10" value="" maxlength=12 onkeyup="return acceptNum(event)" onkeypress="return acceptNum(event)">
</td></tr>

<tr><td>
<font size="-1">* PFG que estudia:</font>
<select name="pfg" id="pfg"  >
<option value="" selected>Seleccione</option>
<?php while($obj=pg_fetch_object($resultado1)){?>
<option value="<? echo $obj->nombre_pfg ?>"> <? echo $obj->nombre_pfg?> 
 <? }//Fin while ?>
</select>
<font size="-1">* Turno:</font>
<select name="turno" id="turno" >
<option value="" selected></option>
<option value="DIURNO" >DIURNO</option>
<option value="NOCTURNO" >NOCTURNO</option>
<option value="FIN DE SEMANA" >FIN DE SEMANA</option>
</select>
</td></tr>

<tr><td>
<font size="-1">* Aldea donde estudia:</font>
<input  name="aldea" type="text" id="id"  size="66" value="" maxlength=100 onkeyup="return acceptChar(event)" onkeypress="return acceptChar(event)">
</td></tr>


<tr><td></td></tr>
<tr><td>
<em>1.2 Datos de la institución y/u organización social en la que realizará las pasantías:</em>
</td></tr>

<tr><td>
<font size="-1">* Nombre:</font>
<input  name="institucion" type="text" id="institucion"  size="76" value="">
</td></tr>
<tr><td>
<font size="-1">* Dirección:</font>
<input  name="direccion_institucion" type="text" id="direccion"  size="53" value="">
<font size="-1">Telefono:</font>
<input  name="telefono_institucion" type="text" id=""  size="10" value="" maxlength=12 onkeyup="return acceptNum(event)" onkeypress="return acceptNum(event)">
</td></tr>

<tr><td>
<font size="-1">* Objetivos de la pasantía:</font>
</td></tr>
<tr><td>
<input  name="objetivo_pasantia" type="text" id=""  size="84" value="">
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
<input  name="area" type="text" id="area"  size="84" value="">
</td></tr>
<tr><td>
<font size="-1">* Explique brevemente las actividades que se desarrollan en esa área:</font>
</td></tr>
<tr><td>
<input  name="actividades_area" type="text" id=""  size="84" value="">
</td></tr>
<tr><td>
<font size="-1">Observaciones generales:</font>
</td></tr>
<tr><td>
<input  name="observaciones_generales" type="text" id=""  size="84" value="">
</td></tr>


<tr><td></td></tr>
<tr><td>
<em>1.4 Documentos Consignados:</em>
</td></tr>
<tr><td>
<input type="checkbox" name="documento1">
<font size="-1">1 Foto de frente tipo Carnet.</font>
</td></tr>
<tr><td>
<input type="checkbox" name="documento2">
<font size="-1">1 Copia ampliada de la Cedula o pasaporte sin recortar.</font>
</td></tr>
<tr><td>
<input type="checkbox" name="documento3">
<font size="-1">1 Copia de la planilla de consignación de documentos emitida por CIPEE UBV.</font>
</td></tr>
<tr><td>
<input type="checkbox" name="documento4">
<font size="-1">1 Copia de la planilla de inscripción emitida por CIPEE UBV del periodo Lectivo.</font>
</td></tr>



<tr><td></td></tr>
<tr><td></td></tr>
<tr><td align="center">
<input value="INSCRIBIR PASANTIAS" type="submit" name="submit2">
</td></tr>

</form>
</table>

<p>* Campo requerido</p>
</td></tr>
</table>
   </tr>
 <?php include("../pie.php");?>