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
  <strong>DATOS DE LA SOCIALIZACION DEL TEG</strong>
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
<td><font size="-1">Estado</font></td>
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
<select name=nacionalidad'.$i.'  ><option readonly value=V selected>V</option><option value=E>E</option></select><input readonly name=cedula'.$i.' type=text id=cedula  size=8 value='.$objc[cedula].'></td>';
?>
<td><input readonly name=nombre<? echo $i;?> type="text"   size=38 value="<? echo $objc[nombre]?>"></td>
<?
echo '<td>
<select name=estado'.$i.'  ><option value=APROBADO selected>APROBADO</option><option value=NO APROBADO>NO APROBADO</option></select></td>';
echo '</tr>'; 
}
?>
</table>



<table align="center" width="100%" border="0"> 
<tr><td>
<em>Fecha de Socializacion del TEG:</em><input name="fecha_socializacion" type="text" id="cedula" maxlength=12 onkeypress="return acceptfecha(event)" size="15" value="<? echo $rowa[fecha_socializacion]?>"/>
</td></tr>
<tr><td></td></tr>
<tr><td>
<em>TITULO del TEG:</em>
</td></tr>

<tr><td>
<textarea name="teg" rows="3" cols="80"><? echo $rowa[teg];?></textarea>
</td></tr>
<tr><td>
<font size="-1">SE CONSIDERA:</font>
</td></tr>
<tr><td>
<select name="considera" id="considera" >
                <option value="APROBADO">APROBADO</option>
              <option value="NO APROBADO">NO APROBADO</option>
            <option value="APROBADO MODIFICACIONES">APROBADO CON MODIFICACIONES</option>
              
                </option>
              
              </select>
</td></tr>
<tr><td>
<font size="-1">Observaciones generales:</font>
</td></tr>
<tr><td>
<textarea name="observaciones_generales" rows="3" cols="80"><? echo $rowa[observaciones_generales];?></textarea>
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
