<?php
//////////////////////////////////////////////////////
//
// MensaHurdes (beta)V. 2007 1.0 
// 
// �ltima Modificaci�n: 12-Diciembre-2006
// www.MensaHurdes.es.mw
// mensahurdes.iespana.es
//Copyright (C) 2006  Hurdes: hurdes@gmail.com
//
////////////////////////////////////////////////////////////////////////////////////////////////////
// Este programa es Software Libre; Usted puede redistribuirlo y/o modificarlo 
//bajo los t�rminos de la GNU Licencia P�blica General (GPL) tal y como ha sido 
//p�blicada por la Free Software Foundation; o bien la versi�n 2 de la Licencia, 
//o (a su opci�n) cualquier versi�n posterior.
// Este programa se distribuye con la esperanza de que sea �til, pero SI NINGUNA GARANT�A.
///////////////////////////////////////////////////////////////////////////////////////////////////
?>
<? 
//Cargar configuraci�n
 $conf = file("conf.php");
 $conf[0] = "";
 eval(join("",$conf));
?>
<html> 
<head> 
   <title>MensaHurdes</title> 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"><style type="text/css">
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
<body>
<table width="100%" height="100%" style="border: 1px solid <? echo $bordetabla; ?>" bgcolor="#cccccc">
<tr><td align="center">
<table border=0>
<tr><td align="left"><a href="registro.php" class="EnlaceMenu"><?=REGISTRATE; ?></a></td></tr>
<tr><td align="left"><a href="verusuarios.php" class="EnlaceMenu"><?=MOSTRAR_USUARIOS; ?></a></td></tr>
<tr><td align="left"><a href="smilies.php" class="EnlaceMenu"><?=ICONOS; ?></a></td></tr>
<tr><td align="left"><a href="MostrarMensajes.php" class="EnlaceMenu"><?=VOLVER; ?></a></td></tr></table></td></tr></table>
</body>
</html>