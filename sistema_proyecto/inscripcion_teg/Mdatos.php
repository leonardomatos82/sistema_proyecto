<?php
//include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../barra.php");
include("../utils.php");
//$doc=$_GET[documento];
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
  <strong>PLANILLA DE INSCRIPCION DEL TEG</strong>
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
<input  name="cedula" type="text" id="cedula"  size="9" value="<? echo $_POST['cedula'];?>">
</td></tr>  

<tr><td>
<font size="-1">* Nombres y apellidos:</font>
<input  name="nombre" type="text" id="nombre"  size="45" value="">
<font size="-1">* Sexo:</font>
<select name="sexo" id="sexo" >
<option value=" " selected ></option>
<option value="M">M</option>
<option value="F">F</option>
</select>

</td></tr>

<tr><td>
<font size="-1">Correo Electrónico:</font>
<input  name="correo" type="text" id="id"  size="30" value="@">
<font size="-1">* Teléfono:</font>
<input  name="telefono_casa" type="text" id="id"  size="10" value="">
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

<font size="-1">* Trayecto:</font>
<select name="trayecto" id="" >
<option value="II" selected>II</option>
<option value="IV" >IV</option>
</select>
<font size="-1">* Tramo:</font>
<select name="tramo" id="" >
<option value="V" selected>V</option>
<option value="VI" >VI</option>
<option value="IX" selected>IX</option>
<option value="X" >X</option>
</select>
<font size="-1">* Sección:</font>
<input  name="seccion" type="text" id="id"  size="10" value="">
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
<input  name="aldea" type="text" id="id"  size="66" value="">
</td></tr>


<tr><td></td></tr>
<tr><td>
<em>1.2 Datos del TEG:</em>
</td></tr>

<tr><td>
<font size="-1">* Nombre:</font>
<input  name="teg" type="text" id="teg"  size="76" value="">
</td></tr>
<tr><td>
<font size="-1">* Comunidad:</font>
<input  name="direccion_institucion" type="text" id="direccion"  size="53" value="">
</td></tr>

<tr><td>
<font size="-1">* Objetivos de la Investigación:</font>
</td></tr>
<tr><td>
<input  name="objetivo_pasantia" type="text" id=""  size="84" value="">
</td></tr>

<tr><td>
<font size="-1">* Area de Vinculación:</font>
</td></tr>
<tr><td>
<input  name="objetivo_pasantia" type="text" id=""  size="84" value="">
</td></tr>

<tr><td>
<font size="-1">* Instituciones u organizaciones Vinculadas:</font>
</td></tr>
<tr><td>
<input  name="objetivo_pasantia" type="text" id=""  size="84" value="">
</td></tr>

<tr><td></td></tr>
<tr><td>
<em>1.2 Datos de los Docentes Asesores :</em>
</td></tr>
<tr><td>
<font size="-1">* Enlace:</font>
<input  name="inicio" type="text" id="id"  size="18" value="<? echo $rowpl['']; ?>">
<font size="-1">* Correo:</font>
<input  name="culminacion" type="text" id="id"  size="18" value="<? echo $rowpl['']; ?>">
<font size="-1">* Telefono:</font>
<input  name="culminacion" type="text" id="id"  size="8" value="<? echo $rowpl['']; ?>">

<tr><td></td></tr>
<tr><td>
<font size="-1">* Academico:</font>
<input  name="inicio" type="text" id="id"  size="18" value="<? echo $rowpl['']; ?>">
<font size="-1">* Correo:</font>
<input  name="culminacion" type="text" id="id"  size="18" value="<? echo $rowpl['']; ?>">
<font size="-1">* Telefono:</font>
<input  name="culminacion" type="text" id="id"  size="8" value="<? echo $rowpl['']; ?>">

<tr><td></td></tr>
<tr><td>
<font size="-1">* Institucional:</font>
<input  name="inicio" type="text" id="id"  size="18" value="<? echo $rowpl['']; ?>">
<font size="-1">* Correo:</font>
<input  name="culminacion" type="text" id="id"  size="18" value="<? echo $rowpl['']; ?>">
<font size="-1">* Telefono:</font>
<input  name="culminacion" type="text" id="id"  size="8" value="<? echo $rowpl['']; ?>">

<tr><td></td></tr>


<tr><td>
<font size="-1">Observaciones generales:</font>
</td></tr>
<tr><td>
<input  name="observaciones_generales" type="text" id=""  size="84" value="">
</td></tr>


<tr><td></td></tr>
<tr><td>
<em>1.3 Documentos Consignados:</em>
</td></tr>
<tr><td>
<input type="checkbox" name="documento1">
<font size="-1">1 Trabajo Especial de grado en Físico y/o Digital.</font>
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
<input value="INSCRIBIR TEG" type="submit" name="submit2">
</td></tr>

</form>
</table>

<p>* Campo requerido</p>
</td></tr>
</table>
   </tr>
 <?php include("../pie.php");?>