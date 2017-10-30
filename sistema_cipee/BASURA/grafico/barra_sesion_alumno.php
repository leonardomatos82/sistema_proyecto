<?php
setlocale("LC_TIME","es_VE");
$dia_semana=date(l);
$dia=date(d);
$mes=date(m);
$ano=date(Y);
$fecha_completa=strftime("Caracas, %A %d de %B de $ano", mktime(0,0,0,$mes,$dia,$ano));

echo"<table cellpadding=0 cellspacing=0 height=20 bgcolor=#e1e3eb style='border-bottom:1px solid #990000'>
<tr><td width=370 class=celda_menu><font class=boton><b>USUARIO</b>:&nbsp;$nombres, $apellidos&nbsp;<b>CEDULA</b>:&nbsp;$cedula_alumno</td><td width=400 class=celda_menu align=right><font class=boton><b>$fecha_completa</b></td></tr>
</table>";
?>