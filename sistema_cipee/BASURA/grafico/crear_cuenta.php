<?php
$clave=$_POST[clave];
$rclave=$_POST[rclave];
$chars=$_POST[chars];
$crear_cuenta=$_POST[crear_cuenta];

$chars=strtolower($chars);

#SACA DATOS DE LA SESION
$cedula_alumno=$Sesion[cedula_alumno];

if($cedula_alumno!='')
{
$id_sede='ubv';
$login_alumno=$id_sede.$cedula_alumno;

if($clave!='' && $rclave!='' && $chars!='')
{
 if($clave==$rclave && $chars==$Sesion[codigo])
 { 
  $login='surubv';
  $password='surubv';   
  if(crear_cuenta($login,$password,$login_alumno,$clave,$cedula_alumno))
   {
   echo "<script language=JavaScript>alert('El registro de su Cuenta fue exitoso.')</script>";
   $cuenta_creada=1;
   session_start();
   session_unset();
   session_destroy();
   }
  else
   echo "<script language=JavaScript>alert('Ocurrio un error. no es posible realizar la operación.')</script>";
 }
 elseif($clave!=$rclave)
 {
  echo "<script language=JavaScript>alert('Los valores de la contraseña no son iguales.')</script>";
 }
 else
 {
  echo "<script language=JavaScript>alert('El código de seguridad es incorrecto.')</script>";
 }
}

if($cuenta_creada==1)
{
echo"<table cellpadding=1 cellspacing=1 border=0 width=770 align=center><form action=$page method=post>
<tr><td bgcolor=#990000 align=center><font class=normal color=#ffffff>Información al usuario</td></tr>
<tr><td align=center><br><font class=normal>Ahora, ud pordrá ingresar a sur@ubv con el usuario: <b>$login_alumno</b>, y con la contraseña registrada anteriormente<br>(No la olvides, ni la suministres a terceros)</font></td></tr>
<tr><td align=center><input type=hidden name=cancelar value=1>
<input type=submit class=boton6 style='color:#990000' value='Aceptar'></td></tr>
</table>";
}
else
{
echo"<table cellpadding=0 cellspacing=0 border=0 width=770 align=center><form action=$page name=form_crear_cuente method=post onSubmit='return(validar_form_crear_cuenta(this))'>
<tr><td align=center colspan=2>

<table cellpadding=1 cellspacing=1 border=0>
<tr><td colspan=2 height=20 style='border-bottom:1px solid #990000' align=center><font class=normal color=#990000><b>CREAR CUENTA ESTUDIANTE</b></td></tr>
<tr><td align=right width=385><font class=normal color=#878787><b>Usuario</b></td><td width=385><input style='border:1px solid #C0C0C0;color:#878787' class=boton size=10 maxlength=15 name=login_alumno value=$login_alumno readonly></td></tr>
<tr><td align=right><font class=normal color=#878787><b>Contraseña</b></td><td><input type=password style='border:1px solid #C0C0C0' class=boton size=10 maxlength=15 name=clave onKeyPress='return acceptClave(event)'>&nbsp;<font class=boton color=red>sólo letras o números</td></tr>
<tr><td align=right><font class=normal color=#878787><b>Reingrese Contraseña</b></td><td><input type=password style='border:1px solid #C0C0C0' class=boton size=10 maxlength=15 name=rclave onKeyPress='return acceptClave(event)'></td></tr>
<tr><td align=center colspan=2><font class=boton color=red>Ingrese el código de seguridad que esta en la imagen.<br></font><image src='includes/antispam.php'></td></tr>
<tr><td align=right><font class=normal color=#878787><b>Código</b></td><td><input style='border:1px solid #C0C0C0' class=boton size=10 maxlength=6 name=chars onKeyPress='return acceptClave(event)'></td></tr>
<tr><td colspan=3 height=10></td></tr>
<tr><td align=center colspan=3 style='border-top:1px solid #990000'>

<table cellpadding=1 cellspacing=1 border=0>
<tr><td>
<input type=hidden name=crear_cuenta value=1>
<input type=submit class=boton6 style='color:#990000' value='Crear cuenta'></form></td><td></td><form action=$page method=post><td>

<input type=hidden name=cancelar value=1>
<input type=submit class=boton6 style='color:#990000' value='Cancelar'></form>
</td></tr>
</table>

</td></tr>
</table>

</td></tr>
</table>";
}

}
?>
  