<?php
$cedula_alumno=$_POST[cedula_alumno];
$cancelar=$_POST[cancelar];
$chars=$_POST[chars];

$registrados='enable';
$no_registrados='enable';

if($cedula_alumno!='' && ($chars==$Sesion[codigo]))
{
# USUARIO GENERICO SOLO PUEDE CONSULTAR ALGUNAS TABLAS
 $login='generico';
 $password='generico';
 $conn=verifica_usuario($login,$password);

 $id_sede='ubv';
 $login_alumno=$id_sede.$cedula_alumno;

 $result2=pg_exec($conn,"select login_alumno from activo where login_alumno='$login_alumno'");
 $arr2=pg_fetch_array($result2); 
 
 $result=pg_exec($conn,"select id_alumno from estado_academico where id_alumno='$cedula_alumno'");
 $arr=pg_fetch_array($result);
 if($arr[0]=='')
 {
  echo"<table cellpadding=1 cellspacing=1  border=0 width=770 align=center style='padding-top:6px'><form action=$page method=post>
  <tr><td><img src=images/menu_informacion.jpg></td></tr>
  <tr><td height=15></td></tr>
  <tr><td align=center bgcolor=#dc0909 height=12><font class=normal color=#ffffff><blink>El número: $cedula_alumno, no esta registrado en sur@ubv.</blink><br>Por favor comuniquese con un responsable en contactos sur@ubv.</td></tr>
  <tr><input type=hidden name=cancelar value=1>
  <td align=center><br><input type=submit style='color:#990000' class=boton4 value=Regresar></td></td></form>
  </table>";
 }
 elseif($arr2[0]!='')
 {
  echo"<table cellpadding=4 cellspacing=2  border=0 width=300 align=center style='padding-top:4px;border'><form action=$page method=post>
  <tr><td height=15></td></tr>
  <tr><td align=center bgcolor=#fafafa height=60 style='border:1px solid #990000'><font class=normal>Usted ya posee una cuenta en el sistema sur@ubv,<br> debe ingresar por la sección \"Usuario Registrado\".</td></tr>
  <tr><input type=hidden name=cancelar value=1>
  <td align=center><input type=submit style='color:#990000' class=boton4 value=Regresar></td></td></form>
  </table>";
 }
 else
 {
  session_register('Sesion');
  $Sesion['cedula_alumno']=$cedula_alumno;
  include('crear_cuenta.php'); 
 }
}
else
{
echo"<table cellpadding=0 cellspacing=0 border=0 align=center valign=top width=770 height=100%>
<tr><td valign=top align=center width=180>
<table cellpadding=0 cellspacing=0 border=0  height=100% bgcolor=#d9d9d9>

<tr><td height=20 valign=top>
<table cellpadding=0 cellspacing=0>
<tr><td width=15><img src=images/conner5.jpg></td><td width=165 bgcolor=#990000 align=center><font class=normal color=#ffffff><b><i>Ingreso al sistema</i></b></td></tr>
</table>
</td></tr>
<tr><td height=1 bgcolor=#878787></td></tr>
<tr><td height=5></td></tr>
<tr><td valign=top height=80 align=center>

<table cellpadding=1 cellspacing=0 border=0 width=180 style='border:1px solid #990000' bgcolor=#f6e7e7><form action=$page name=form_registrados method=post autocomplete=off onSubmit='return(validar_form_registrados(this))'>
<tr><td bgcolor=#990000 colspan=2 align=center background=images/bg_barra1.jpg height=15 style='border-bottom:1px solid #990000'><font class=boton color=#ffffff><b>Usuarios Registrados</b></td></tr>
<tr><td colspan=2 align=center height=10></td></tr>
<tr><td align=right width=80><font class=boton><b>Usuario</b></font></td><td width=120><input name=login size=10 style='border:1px solid #C0C0C0' class=boton onKeyPress='return acceptClave(event)' maxlength=14 $registrados></td></tr>
<tr><td align=right><font class=boton><b>Contraseña</b></font></td><td><input type=password name=password size=10 style='border:1px solid #C0C0C0' class=boton onKeyPress='return acceptClave(event)' maxlength=15 $registrados></td></tr>
<tr><td align=right><font class=boton><b>Código</b></font></td><td><input name=chars size=10 style='border:1px solid #C0C0C0' class=boton onKeyPress='return acceptClave(event)' maxlength=6 $registrados></td></tr>
<tr><td colspan=2 align=center>
<input type=submit class=boton3 style='color:#990000' value=Ingresar></td></tr></form>
</table>

</td></tr>
<tr><td height=5></td></tr>
<tr><td valign=top height=40 align=center>

<table cellpadding=1 cellspacing=0 border=0 width=180 style='border:1px solid #990000' bgcolor=#fafafa><form action=$page name=form_no_registrados method=post autocomplete=off onSubmit='return(validar_form_no_registrados(this))'>
<tr><td bgcolor=#990000 colspan=2 align=center background=images/bg_barra1.jpg height=15 style='border-bottom:1px solid #990000'><font class=boton
 color=#ffffff><b>Usuarios NO Registrados</b></td></tr>
<tr><td colspan=2 align=center height=10></td></tr>
<tr><td align=right width=80><font class=boton><b>Cédula</b></font></td><td width=120><input name=cedula_alumno size=8 style='border:1px solid #C0C0C0' class=boton maxlength=8 onKeyPress='return acceptNum(event)' $no_registrados></td></tr>
<tr><td align=right><font class=boton><b>Código</b></font></td><td>
<input name=chars size=8 style='border:1px solid #C0C0C0' class=boton onKeyPress='return acceptClave(event)' maxlength=6 $registrados></td></tr>
<tr><td colspan=2 align=center><input type=submit class=boton3 style='color:#990000' value=Ingresar></td></tr></form>
</table></form>
</td></tr>
<tr><td height=60 align=center valign=center><font class=normal>Ingrese este Código<br><image src='includes/antispam.php'></td></tr>
<tr><td></td></tr>
</table>

</td><td width=450 valign=top align=center>";

include('centro_pag_login.php');

echo"</td><td width=130 valign=top align=center style='border-left:1px solid #990000'>";
include('menu2.php');
echo"</td></tr>
</table>

</td></tr>";
}
?>