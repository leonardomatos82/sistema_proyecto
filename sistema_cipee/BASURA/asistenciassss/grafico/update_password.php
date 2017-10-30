<?php
$clave=$_POST[clave];
$rclave=$_POST[rclave];

$login=$Sesion[login];
$password=$Sesion[password];

if($login && $password) 
{

if($update_password==1)
{
 if($clave==$rclave)
 { 
  if(update_password($login,$password,$clave))
  echo "<script language=JavaScript>alert('La contraseña se actualizó correctamente.')</script>";
 }
 else
  echo "<script language=JavaScript>alert('las contraseñas ingresadas no son iguales, intentelo nuevamente')</script>";
}

echo"<table cellpadding=0 cellspacing=0 width=770>
<tr><td background=images/bg_barra1.jpg align=center><font class=normal color=#ffffff><b>CAMBIO DE CONTRASEÑA</b></td></tr>
<tr><td height=1 bgcolor=#878787></td></tr>
<tr><td valign=top>

<table cellpadding=1 cellspacing=1 border=0><form action=$page method=post name=form_update_password onSubmit='return(validar_form_update_password(this))'>
<tr><td height=10 colspan=2></td></tr>
<tr><td align=right width=385><font class=normal color=#878787><b>Usuario</b></td><td width=385><input style='border:1px solid #C0C0C0;color:#878787' class=boton size=10 maxlength=15 name=login_alumno value='$login' readonly></td></tr>
<tr><td align=right><font class=normal color=#878787><b>Contraseña</b></td><td><input type=password style='border:1px solid #C0C0C0' class=boton size=10 maxlength=15 name=clave onKeyPress='return acceptClave(event)'>&nbsp;<font class=boton color=red>sólo letras o números</td></tr>
<tr><td align=right><font class=normal color=#878787><b>Reingrese Contraseña</b></td><td><input type=password style='border:1px solid #C0C0C0' class=boton size=10 maxlength=15 name=rclave onKeyPress='return acceptClave(event)'></td></tr>
<tr><td align=center colspan=3>

<table cellpadding=1 cellspacing=1 border=0>
<tr><td>
<input type=hidden name=actualizar_password value=1>
<input type=hidden name=update_password value=1>
<input type=submit class=boton6 style='color:#990000' value='Aceptar'></form></td><td></td><form action=$page method=post><td>

<input type=hidden name=cancelar value=1>
<input type=submit class=boton6 style='color:#990000' value='Cancelar'></form>
</td></tr>
</table>

</td></tr>
</table>

</td></tr>
</table>"; 
}
?>