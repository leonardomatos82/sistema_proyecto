<?php
session_start();
$login=$Sesion[login];
$password=$Sesion[password];

if($login && $password) 
{
echo"<table cellpadding=1 cellspacing=1 border=0 width=300 align=center><form actio=$page method=post autocomplete=off>
<tr><td colspan=2 height=10></td></tr>
<tr><td align=right><font class=normal color=#990000>Cédula</td><td width=80><input class=normal name=cedula_alumno onKeyPress='return acceptNum(event)' maxlength=10 size=10></td>
<td>
<input type=hidden name=imprimir_documento value=1>
<input type=hidden name=imprimir_constancia_estudio value=1>
<input class=normal style='color:#990000' type=submit value=Imprimir></td></tr></form>
</table>";
}

?>