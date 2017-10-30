<?php
$login=$Sesion[login]; 
$password=$Sesion[password];
$cedula_alumno=$Sesion[cedula_alumno]; 
if($conn=verifica_usuario($login,$password)) 
{
 $result=pg_exec($conn,"select t.nombre_tipo_usuario from activo a, tipo_usuario t where a.id_tipo_usuario=t.id_tipo_usuario and id_alumno='$cedula_alumno'"); 
 $arr=pg_fetch_array($result);
 $nombre_tipo_usuario=$arr[0];
 
 if($nombre_tipo_usuario=='ALUMNO')
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

  echo"<table cellpadding=1 cellspacing=1 border=0 width=770 align=center>
  <tr><td height=10></td></tr>
  <tr><td align=center align=center valign=middle>
  
  <table cellpadding=1 cellspacing=0 border=0 style='border:1px solid #990000'><form action=sesion_alumno.php  name=form_bienvenida method=post>
  <tr><td colspan=2 height=12 bgcolor=#990000 align=center background=images/bg_barra1.jpg height=20><font class=boton color=#ffffff><b>- BIENVENIDO A SUR@UBV -</b></td></tr>
  <tr><td align=right width=250><font class=normal color=#878787>Nombres:</td><td width=300><font class=normal>$nombres</td></tr>
  <tr><td align=right><font class=normal color=#878787>Apellidos:</td><td><font class=normal>$apellidos</td></tr>
  <tr><td align=right><font class=normal color=#878787>Cédula:</td><td><font class=normal>$cedula_alumno</td></tr>
  <tr><td align=right><font class=normal color=#878787>Programa de Formación de Grado:</td><td valign=bottom><font class=normal>$pfg</td></tr> 
  <tr><td align=right><font class=normal color=#878787>Estado:</td><td valign=bottom><font class=normal>$estado_vzla</td></tr> 
  <tr><td align=right><font class=normal color=#878787>Municipio:</td><td valign=bottom><font class=normal>$municipio_vzla</td></tr> 
  <tr><td align=right><font class=normal color=#878787>Parroquia:</td><td valign=bottom><font class=normal>$parroquia_vzla</td></tr> 
  <tr><td align=right><font class=normal color=#878787>Nombre de Aldea:</td><td valign=bottom><font class=normal>$nombre_aldea</td></tr> 
  <tr><td colspan=2 height=12 align=center>
  <table>
  <tr><td><input type=submit class=boton4 style='color:#990000' name=inicio_sesion value=Ingresar></td></form><td width=3></td><form action=$page method=post><td>
  <input type=hidden name=cancelar value=1>
  <input type=submit class=boton4 style='color:#990000' value=Cancelar></td></tr></table>
  </td></tr>
  </table></form>
  
  </td></tr>
 </table>";
 }
 elseif($nombre_tipo_usuario=='COORDINADOR')
 {
   echo"<table cellpadding=1 cellspacing=1 border=0 width=770 align=center>
  <tr><td height=10></td></tr>
  <tr><td align=center align=center valign=middle>
  
  <table cellpadding=1 cellspacing=0 border=0 style='border:1px solid #990000'><form action=sesion_coord.php method=post>
  <tr><td colspan=2 height=12 bgcolor=#990000 align=center background=images/bg_barra1.jpg height=20><font class=boton color=#ffffff><b>- BIENVENIDO A SUR@UBV -</b></td></tr>
  <tr><td align=right width=250><font class=normal color=#878787>Nombres:</td><td width=300><font class=normal>$nombres</td></tr>
  <tr><td align=right><font class=normal color=#878787>Apellidos:</td><td><font class=normal>$apellidos</td></tr>
  <tr><td align=right><font class=normal color=#878787>Cédula:</td><td><font class=normal>$cedula_alumno</td></tr>
  <tr><td align=right><font class=normal color=#878787>Coord. Sede UBV:</td><td valign=bottom><font class=normal>$pfg</td></tr> 
  <tr><td colspan=2 height=12 align=center>
  <table>
  <tr><td><input type=submit class=boton4 style='color:#990000' value=Ingresar></td></form><td width=3></td><form action=$page method=post><td>
  <input type=hidden name=cancelar value=1>
  <input type=submit class=boton4 style='color:#990000' value=Cancelar></td></tr></table>
  </td></tr>
  </table></form>
  
  </td></tr>
 </table>";
 }

}
?>