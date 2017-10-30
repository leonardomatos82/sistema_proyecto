<?php
$login=$Sesion[login];
$password=$Sesion[password];
$cedula_alumno_aux=$_POST[cedula_alumno_aux];
$reset_password=$_POST[reset_password];
$buscar_alumno=$_POST[buscar_alumno];
$login_alumno_aux=$_POST[login_alumno_aux];

if($login && $password) 
{

echo"<table cellpadding=0 cellspacing=0 width=770>
<tr><td background=images/bg_barra1.jpg align=center><font class=normal color=#ffffff><b>REINICIO DE CONTRASEÑA ESTUDIANTE</b></td></tr>
<tr><td height=1 bgcolor=#878787></td></tr>
<tr><td valign=top align=center>";

//$result=pg_exec($conn,"select id_alumno from estado_academico where id_alumno='$cedula_alumno_aux'"); 
//$arr=pg_fetch_array($result);

//  echo "<script language=JavaScript>alert('El registro \"$cedula_alumno_aux\" no existe')</script>";
if($reset_password==1)
{
//echo "$cedula_alumno_aux,$login_alumno_aux";

  if(reset_password($login,$password,$cedula_alumno_aux,$login_alumno_aux))
   echo "<script language=JavaScript>alert('La contraseñas fue reiniciada con exito')</script>";
  else
   echo "<script language=JavaScript>alert('No se pudo realizar la operación')</script>";
}

if($buscar_alumno==1)
{
 $result=pg_exec($conn,"select e.id_alumno,p.denominacion_pfg,a.nombres,a.apellidos,m.municipio,es.estado,parr.parroquia,e.nombre_aldea from estado_academico e, alumno a, programaformaciongrado p,municipio_vzla m, estado_vzla es, parroquia_vzla parr where e.id_alumno=a.id_alumno and e.id_pfg=p.id_pfg and e.id_municipio=m.id_municipio and m.id_estado=es.id_estado and e.id_municipio=parr.id_municipio  and e.id_alumno='$cedula_alumno_aux'");
 $arr=pg_fetch_array($result);
 if($arr[0]=='')
 {
  echo "<script language=JavaScript>alert('El registro \"$cedula_alumno_aux\" no existe')</script>";
  echo"<table cellpadding=0 cellspacing=0><form action=$page method=post>
 <tr><td height=5></td></tr> 
 <tr><td width=100 align=right><font class=normal color=#878787>Ingrese cédula&nbsp;</td><td>
 <input type=hidden name=actualizar_password_alumno value=1>
 <input class=boton style='border:1px solid #C0C0C0'  name=cedula_alumno_aux size=10 maxlength=8 onKeyPress='return acceptNum(event)'></td>
 <td width=60 align=center>
 <input type=hidden name=buscar_alumno value=1>
 <input class=normal style='color:#990000' type=submit value=Buscar></td></tr></form>
 </table>";
 }
 else
 {
 $pfg=$arr[1];
 $nombres=$arr[2];
 $apellidos=$arr[3];
 $municipio_vzla=$arr[4];
 $estado_vzla=$arr[5];
 $parroquia_vzla=$arr[6];
 $nombre_aldea=$arr[7];
 
 $result=pg_exec($conn,"select login_alumno from activo where id_alumno='$cedula_alumno_aux'"); 
 $arr=pg_fetch_array($result);
 $login_alumno_aux=$arr[0];

  echo"
  <table cellpadding=1 cellspacing=0 border=0><form action=sesion_coord.php  name=form_reset_password method=post onSubmit='return(validar_form_reset_password(this))'>
  <tr><td coslspan=2 height=5></td></tr>
  <tr><td align=right width=300><font class=normal color=#878787>Nombres:</td><td width=300><font class=normal>$nombres</td></tr>
  <tr><td align=right><font class=normal color=#878787>Apellidos:</td><td><font class=normal>$apellidos</td></tr>
  <tr><td align=right><font class=normal color=#878787>Cédula:</td><td><font class=normal>$cedula_alumno_aux</td></tr>
  <tr><td align=right><font class=normal color=#878787>Programa de Formación de Grado:</td><td valign=bottom><font class=normal>$pfg</td></tr> 
  <tr><td align=right><font class=normal color=#878787>Estado:</td><td valign=bottom><font class=normal>$estado_vzla</td></tr> 
  <tr><td align=right><font class=normal color=#878787>Municipio:</td><td valign=bottom><font class=normal>$municipio_vzla</td></tr> 
  <tr><td align=right><font class=normal color=#878787>Parroquia:</td><td valign=bottom><font class=normal>$parroquia_vzla</td></tr> 
  <tr><td align=right><font class=normal color=#878787>Nombre de Aldea:</td><td valign=bottom><font class=normal>$nombre_aldea</td></tr> 
  <tr><td align=right><font class=normal color=#878787><b>Usuario</b></td><td><input style='border:1px solid #990000;color:#878787' class=boton size=11 maxlength=15 name=login_alumno_aux value='$login_alumno_aux' readonly></td></tr>
  <tr><td align=center colspan=2>

  <table cellpadding=1 cellspacing=1 border=0>
  <tr><td>
  <input type=hidden name=actualizar_password_alumno value=1>
  <input type=hidden name=reset_password value=1>
  <input type=hidden name=cedula_alumno_aux value='$cedula_alumno_aux'>
  <input type=submit class=boton9 style='color:#990000' value='Reiniciar contraseña'></form></td><td></td><form action=$page method=post><td>
  <input type=hidden name=cancelar value=1>
  <input type=hidden name=actualizar_password value=1>
  <input type=submit class=boton6 style='color:#990000' value='Cancelar'></form>
  </td></tr>
  </table>
  
  </td></tr>
  </table>";
 }
}
else
{
echo"<table cellpadding=0 cellspacing=0><form action=$page method=post>
<tr><td height=5></td></tr>
<tr><td width=100 align=right><font class=normal color=#878787>Ingrese cédula&nbsp;</td><td>
<input type=hidden name=actualizar_password_alumno value=1>
<input class=boton style='border:1px solid #C0C0C0'  name=cedula_alumno_aux size=10 maxlength=8 onKeyPress='return acceptNum(event)'></td>
<td width=60 align=center>
<input type=hidden name=buscar_alumno value=1>
<input class=normal style='color:#990000' type=submit value=Buscar></td></tr></form>
</table>";
}

echo"</td></tr>
</table>"; 
}
?>