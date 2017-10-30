<?php
//////////////////////////////////////////////////////
//
// MensaHurdes (beta)V. 2007 1.0 
// 
// Última Modificación: 12-Diciembre-2006
// www.MensaHurdes.es.mw
// mensahurdes.iespana.es
//Copyright (C) 2006  Hurdes: hurdes@gmail.com
//
////////////////////////////////////////////////////////////////////////////////////////////////////
// Este programa es Software Libre; Usted puede redistribuirlo y/o modificarlo 
//bajo los términos de la GNU Licencia Pública General (GPL) tal y como ha sido 
//públicada por la Free Software Foundation; o bien la versión 2 de la Licencia, 
//o (a su opción) cualquier versión posterior.
// Este programa se distribuye con la esperanza de que sea útil, pero SI NINGUNA GARANTÍA.
///////////////////////////////////////////////////////////////////////////////////////////////////
?>
<? 
// Cargar Usuarios
 $usuarios = file("Usuarios.php");
 $usuarios[0] = "";
 eval(join("",$usuarios));

 // Cargando Configuración
 $conf = file("conf.php");
 $conf[0] = "";
 eval(join("",$conf));
?>
<html>
<head>
   <title>MensaHurdes</title> 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
-->
</style></head>
<body bgcolor="#cccccc"><table border="0" cellpadding="2" cellspacing="2" width="100%" bgcolor="#cccccc" height="100%" style="border: 1px solid <? echo $bordetabla; ?>"><tr><td class="Texto" align="center" valign="top"><table border="0" cellpadding="0" cellspacing="0"><tr><td class="Texto"><font color="#cc0000"><?=USUARIOS; ?></font></td></tr></table></td></tr><tr><td valign="top" height="100%"><table border="0" cellpadding="2" cellspacing="2">
<?


// Coprobamos usuario y pasword
    $i=0;
    for ($n = 0; $n < sizeof($nicks); $n++) 
	  {    $i=$i+1;   $usuario=$nicks[$n][0];
		   echo "<tr><td class=\"Texto\">$i. $usuario</td></tr>";
	  }
  
?>
<tr>
		<td align="center"><a href="MostrarMensajes.php">Volver</a></td>
</tr></table></td></tr></table>

</body>
</html>