<?php
setlocale("LC_TIME","es_VE");
$dia_semana=date(l);
$dia=date(d);
$mes=date(m);
$ano=date(Y);
$fecha_completa=strftime("Caracas, %A %d de %B de $ano", mktime(0,0,0,$mes,$dia,$ano));
$hora=date("h:i a");
echo"<table cellpadding=0 cellspacing=0 border=0 width=770
><form action=index.php method=post>
<tr><td width=70 height=30><input type=image src=images/boton_home.jpg></td></form><td width=1><form action=index.php method=post></td><td width=70><input type=hidden name=contactos value=1><input type=image src=images/boton_contacto.jpg></td></form><td width=1></td><td width=70><input type=image src=images/boton_calendario.jpg disabled></td><td class=celda_menu align=right><font class=normal><b>$fecha_completa</b></font><br><font class=boton>Hora:&nbsp;$hora</font></td></tr>
</table>";
?>