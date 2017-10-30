<?php
if($contactos==1)
{
include('includes/contactos.php');
}
elseif($resumen_inscripcion==1)
{
include('resumen_inscripcion.php');
}
else
{
echo"<table cellpadding=0 cellspacing=0 width=450 border=0>
<tr><td style='padding:4px'><font class=normal color=#990000>Bienvenido, sur@ubv es el sistema que permitirá controlar el ingreso, prosecusión y egreso de los estudientes de la Universidad Bolivariana de Venezuela.</td></tr>
<tr><td height=10></td></td>
<tr><td>

<table cellpadding=0 cellspacing=0 width=450 border=0>
<tr><td width=15 height=15 style='border-bottom:1px solid #990000' ><img src=images/conner7.jpg></td><td bgcolor=#990000 width=80 style='border-bottom:1px solid #990000'><font class=boton color=#ffffff>Información</td><td style='border-bottom:1px solid #990000' width=355><font class=boton>&nbsp;</td></tr>
<tr><td height=1 bgcolor=#878787 colspan=3></td></tr>

</table>

</td></tr>
<tr><td>

<table cellpadding=0 cellspacing=0><form action=$page method=post>
<tr><td style='padding:4px' width=400><font class=normal color=#990000>Estan abiertas las inscripciones para los estudientes de los estados Barinas y Portugusa, desde 16/10/2007 Hasta 20/10/2007.</td>
<td align=center width=50><input type=image src=images/resultados.jpg title='ver resultados'><input type=hidden name=resumen_inscripcion value=1></td></tr></form>
</table>

</td></tr>

<tr><td><p align=center><font class=normal color=#990000><b>Cerradas las inscripciones para el estado Barinas.</b></font></p></td></tr>
<tr><td height=10></td></td>
<tr><td align=center valign=top><img src=images/mapa.jpg></td></tr>

</table>";
}
?>