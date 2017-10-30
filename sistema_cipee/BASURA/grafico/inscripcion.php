<?php
session_register('Sesion');
$login=$Sesion[login]; 
$password=$Sesion[password];
$cedula_alumno=$Sesion[cedula_alumno]; 

$mostrar_uc=$_POST[mostrar_uc];
$periodo=$_POST[periodo];
$tramo=$_POST[tramo];
$seccion=$_POST[seccion];
$estado_vzla=$_POST[estado_vzla];
$pfg=$_POST[pfg];
$registro_inscripcion=$_POST[registro_inscripcion];
$modalidad=$_POST[modalidad];

$fecha_reg=date("Y-m-d");  
$hora_reg=date("H:i:s");
$codigo=$cedula_alumno.$fecha_reg;

echo"<script>
function validar_form_inscripcion(form_inscripcion)
{
 if(form_inscripcion.tramo.value=='-- SELECCIONE')
  {
  alert('Debe seleccionar un \"Tramo o Semestre\".');
  form_inscripcion.tramo.focus();
  return(false);
  }
 if(form_inscripcion.modalidad.value=='-- SELECCIONE')
  {
  alert('Debe seleccionar una \"Modalidad\".');
  form_inscripcion.modalidad.focus();
  return(false);
  }
}

function validar_inscripcion(inscripcion)
{
 return(confirm('Esta seguro de registrar la inscripción'));
}

</script>";


if($registro_inscripcion==1)
{
$conn=verifica_usuario($login,$password);

# COMPRUEBA SI YA EXISTE UN REGISTRO
$result=pg_exec($conn,"SELECT id_alumno FROM inscripcion WHERE id_alumno='$cedula_alumno'");  
$arr=pg_fetch_array($result);
if($arr[0]=='')
{
$result2=pg_exec($conn,"SELECT id_estado FROM estado_vzla where estado='$estado_vzla'");  
$arr2=pg_fetch_array($result2);
$id_estado_vzla=$arr2[0];

$result2=pg_exec($conn,"SELECT id_modalidad FROM modalidad where nombre_modalidad='$modalidad'");  
$arr2=pg_fetch_array($result2);
$id_modalidad=$arr2[0];

$result2=pg_exec($conn,"SELECT id_pfg FROM programaformaciongrado where denominacion_pfg='$pfg'");  
$arr2=pg_fetch_array($result2);
$id_pfg=$arr2[0];

if($result=pg_exec($conn,"INSERT INTO inscripcion(id_estado_vzla,id_alumno,id_pfg,tramo,seccion,periodo,id_modalidad,hora_reg,fecha_reg,codigo) values('$id_estado_vzla','$cedula_alumno','$id_pfg','$tramo','$seccion','$periodo','$id_modalidad','$hora_reg','$fecha_reg','$codigo')"))
  echo "<script language=JavaScript>alert('El registro de sú inscripción fue exitoso.')</script>";
else
  echo "<script language=JavaScript>alert('Disculpe, no se pudo realizar sú inscripción.')</script>";
}
else
{
 $result=pg_exec($conn,"SELECT codigo FROM inscripcion WHERE id_alumno='$cedula_alumno'");  
 $arr=pg_fetch_array($result);
 $codigo=$arr[0];
}

}

$result3=pg_exec($conn,"SELECT id_alumno FROM inscripcion WHERE id_alumno='$cedula_alumno'");
$arr3=pg_fetch_array($result3);
if($arr3[0]!='')
{
 $result=pg_exec($conn,"select e.id_alumno,p.denominacion_pfg,a.nombres,a.apellidos,m.municipio,es.estado,parr.parroquia,e.nombre_aldea from estado_academico e, alumno a, programaformaciongrado p,municipio_vzla m, estado_vzla es, parroquia_vzla parr where e.id_alumno=a.id_alumno and e.id_pfg=p.id_pfg and e.id_municipio=m.id_municipio and m.id_estado=es.id_estado and e.id_municipio=parr.id_municipio  and e.id_alumno='$cedula_alumno'");
 $arr=pg_fetch_array($result);
 $pfg=$arr[1];
 $nombres=$arr[2];
 $apellidos=$arr[3];
 $municipio_vzla=$arr[4];
 $estado_vzla=$arr[5];
 $parroquia_vzla=$arr[6];
 $nombre_aldea=$arr[7];

  echo"
  <table cellpadding=0 cellspacing=0 border=0 width=770 align=center bgcolor=#fafafa>
  <tr><td align=center>
 
  <table cellpadding=1 cellspacing=1 border=0 width=770><form action=$page method=post><input type=hidden name=imprimir_comprobante value=1>
  <tr><td colspan=4 align=center bgcolor=#990000 background=images/bg_barra1.jpg><font class=normal color=#ffffff><b>USTED YA REALIZO SU INSCRIPCION</b></td></tr>
  <tr><td colspan=4 height=10></td></tr>
  <tr><td align=right><font class=normal color=#878787>Cédula:</td><td><font class=normal>$cedula_alumno</td><td align=right><font class=normal color=#878787>Estado:</td><td valign=bottom><font class=normal>$estado_vzla</td></tr>
  <tr><td align=right><font class=normal color=#878787>Nombres:</td><td><font class=normal>$nombres</td><td align=right><font class=normal color=#878787>Municipio:</td><td valign=bottom><font class=normal>$municipio_vzla</td></tr>
  <tr><td align=right><font class=normal color=#878787>Apellidos:</td><td><font class=normal>$apellidos</td><td align=right><font class=normal color=#878787>Parroquia:</td><td valign=bottom><font class=normal>$parroquia_vzla</td></tr>
  <tr><td align=right><font class=normal color=#878787>Programa de Formación de Grado:</td><td valign=bottom><font class=normal>$pfg</td><td align=right><font class=normal color=#878787>Nombre de Aldea:</td><td valign=bottom><font class=normal>$nombre_aldea</td></tr> 
  <tr><td colspan=4></td></tr>
  <tr><td colspan=4 align=center >
  
  <table cellpadding=1 cellspacing=1>
  <tr><td colspan=4 align=center>
  <input type=hidden name=comprobante_inscripcion value=1>
  <input type=hidden name=codigo value='$codigo'>
  <input type=submit style='color:#990000' class=boton10 value='Imprimir comprobante'></td></form><td width=3><form action=$page method=post></td><td><input class=boton4 style='color:#990000' type=submit value=Cancelar></td></tr></form>
  </table>
  
  <tr><td colspan=4></td></tr>
  <tr><td colspan=4 align=center><font class=normal color=red><b>Recuerda que tienes que validar el comprobante con el coordinador de tu aldea.</b>
  </td></tr>
  </table>
  
  </td></tr>
  </table>
  </td></tr>";

}
elseif($conn=verifica_usuario($login,$password)) 
{
 $result=pg_exec($conn,"select e.id_alumno,p.denominacion_pfg,a.nombres,a.apellidos,m.municipio,es.estado,parr.parroquia,e.nombre_aldea from estado_academico e, alumno a, programaformaciongrado p,municipio_vzla m, estado_vzla es, parroquia_vzla parr where e.id_alumno=a.id_alumno and e.id_pfg=p.id_pfg and e.id_municipio=m.id_municipio and m.id_estado=es.id_estado and e.id_municipio=parr.id_municipio  and e.id_alumno='$cedula_alumno'");
 $arr=pg_fetch_array($result);
 $pfg=$arr[1];
 $nombres=$arr[2];
 $apellidos=$arr[3];
 $municipio_vzla=$arr[4];
 $estado_vzla=$arr[5];
 $parroquia_vzla=$arr[6];
 $nombre_aldea=$arr[7];

 if($estado_vzla=='BARINAS')
 {
 $estado_boton='disabled';
 $color_boton='#878787';
 }
 else
 { 
 $estado_boton='enable';
 $color_boton='#990000';
 }

  echo"<table cellpadding=0 cellspacing=0 border=0 width=770 align=center>
  <tr><td background=images/bg_barra1.jpg height=15 align=center><font class=normal color=#ffffff><b>INSCRIPCION UBV</b></td></tr>
  <tr><td height=1 bgcolor=#878787></td></tr>
  <tr><td align=center>
  
  <table cellpadding=1 cellspacing=1 border=0>
  <tr><td colspan=4 height=8></td></tr>
  <tr><td align=right><font class=normal color=#878787>Cédula:</td><td><font class=normal>$cedula_alumno</td></tr>
  <tr><td align=right><font class=normal color=#878787>Nombres:</td><td><font class=normal>$nombres</td></tr>
  <tr><td align=right><font class=normal color=#878787>Apellidos:</td><td><font class=normal>$apellidos</td></tr>
  <tr><td align=right><font class=normal color=#878787>Programa de Formación de Grado:</td><td valign=bottom><font class=normal>$pfg</td></tr> 
  <tr><td align=right><font class=normal color=#878787>Estado:</td><td valign=bottom><font class=normal>$estado_vzla</td></tr>
  <tr><td align=right><font class=normal color=#878787>Municipio:</td><td valign=bottom><font class=normal>$municipio_vzla</td></tr>
  <tr><td align=right><font class=normal color=#878787>Parroquia:</td><td valign=bottom><font class=normal>$parroquia_vzla</td></tr>
  <tr><td align=right><font class=normal color=#878787>Nombre de Aldea:</td><td valign=bottom><font class=normal>$nombre_aldea</td></tr>
  <tr><td colspan=4 height=8></td></tr>
  </table>
  
  </td></tr>
  <tr><td valign=top align=center>
  <table cellpadding=1 cellspacing=1 border=0 style='border:1px solid #990000' width=550><form action=$page method=post name=form_inscripcion onSubmit='return(validar_form_inscripcion(this))'>
  <tr><td colspan=4 bgcolor=#990000 align=center><font class=normal color=#ffffff>INSCRIBIR PARA EL PERIODO: 2007-I</td></tr>
  <tr><td bgcolor=#d9d9d9 align=center class=celda_menu align=center><font class=normal>TRAMO O SEMESTRE</td>
  <td bgcolor=#d9d9d9 align=center class=celda_menu class=celda_menu><font class=normal>MODALIDAD</td>
  <td bgcolor=#d9d9d9 align=center class=celda_menu><font class=normal>SECCION</td>
  <td bgcolor=#d9d9d9 align=center class=celda_menu><font class=normal>UNIDADES CURRICULARES</td></tr>
  <tr><td align=center><select style='border:1px solid #d9d9d9' class=boton name=tramo><option>-- SELECCIONE</option>";
    
  $result2=pg_exec($conn,"select o.tramo from oferta_academica o, programaformaciongrado p where o.id_pfg=p.id_pfg and p.denominacion_pfg='$pfg' group by o.tramo order by o.tramo;");  
  while($arr2=pg_fetch_array($result2))
  {
   echo"<option>$arr2[0]</option>";
  }
 echo"</select></td>
 
 <td align=center><select style='border:1px solid #878787' class=boton name=modalidad><option>-- SELECCIONE</option>";

 $result2=pg_exec($conn,"SELECT nombre_modalidad FROM modalidad order by id_modalidad");  
 while($arr2=pg_fetch_array($result2))
 {
  echo"<option>$arr2[0]</option>";
 } 
 echo"</select></td>
 <td align=center><input style='border:1px solid #878787' class=boton size=10 name=seccion readonly value='UNICA'></td>
 <td align=center>
 <input type=hidden name=inscripcion value=1>
 <input type=hidden name=mostrar_uc value=1>
 <input type=hidden name=periodo value='2007-II'>
 <input type=hidden name=estado_vzla value='$estado_vzla'>
 <input type=hidden name=pfg='$pfg'>
 
 <input type=submit class=boton3 style='color:#990000' value=Mostar></td></tr>
 </table></form> 
 
 </td></tr>";

if($mostrar_uc==1)
{
 $nro=1;
 echo"
 <tr><td align=center valign=top>
 
 <table cellpadding=1 cellspacing=1 border=0 style='border:1px solid #990000' width=550><form action=$page method=post onSubmit='return(validar_inscripcion(this))'>
 <tr><td align=center bgcolor=#990000 width=15><font class=normal color=#ffffff><b>UC</b></td><td align=center bgcolor=#990000><font class=normal color=#ffffff><b>UNIDADES CURRICULARES SEGUN OFERTA<b></td></tr>";
 $result2=pg_exec($conn,"select o.uc from oferta_academica o, programaformaciongrado p, estado_vzla e where o.tramo=$tramo and o.id_pfg=p.id_pfg and p.denominacion_pfg='$pfg' and o.id_estado_vzla=e.id_estado and e.estado='$estado_vzla' order by o.uc");
 while($arr2=pg_fetch_array($result2))
 {
  echo"<tr><td align=center bgcolor=#d9d9d9><font class=normal>$nro</td><td bgcolor=#d9d9d9><font class=normal>$arr2[0]</td></tr>";
  $nro++;
 }
echo"
<tr><td colspan=2 align=center>

<table><tr><td>
<input type=hidden name=registro_inscripcion value=1>
<input type=hidden name=inscripcion value=1>
<input type=hidden name=periodo value='2007-II'>
<input type=hidden name=estado_vzla value='$estado_vzla'>
<input type=hidden name=pfg value='$pfg'>
<input type=hidden name=modalidad value='$modalidad'>
<input type=hidden name=tramo value='$tramo'>
<input type=hidden name=seccion value='$seccion'>

<input type=submit class=boton4 style='color:$color_boton' $estado_boton value=Inscribir></td></form><form action=$page method=post>
<td>
<input type=hidden name=inscripcion value=1>
<input type=submit class=boton4 style='color:#990000' value=Cancelar></td></tr></form>
</table>

</td></tr>
</table>
</td></tr>
<tr><td height=10></td></tr>";
} 
echo"</td></tr></table>";
}
?>