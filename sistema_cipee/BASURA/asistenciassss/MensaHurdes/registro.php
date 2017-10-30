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
include ("Usuarios.php");
  // Cargando Configuración
 $conf = file("conf.php");
 $conf[0] = "";
 eval(join("",$conf));
  
 if($HTTP_POST_VARS) {
	 $nick =& $HTTP_POST_VARS['nick'];
	 $clave =& $HTTP_POST_VARS['clave'];
	 $clave2 =& $HTTP_POST_VARS['clave2'];
	 $enviar =& $HTTP_POST_VARS['enviar'];
	}
 
?>
<html>
<head>
   <title>MensaHurdes</title> 
<link REL="STYLESHEET" HREF="style.css" TYPE="text/css">
</head>
<body bgcolor="#cccccc">
<table border = 0 cellpadding=2 cellspacing=2 width="100%" bgcolor="#cccccc" height="100%" style="border: 1px solid <? echo $bordetabla; ?>"><tr><td align="center" valign="middle"><table border ="0" cellpadding="2" cellspacing="2">
<tr><td colspan="2" align="center">
<? 

function Existe($login) {

	 for ($n = 0; $n < sizeof($nicks); $n++)
	 {
	   if ($nicks[$n][0] == $login) return true;
     }					
   return false;
}	   

function guardar($user, $pass) {
	global $nicks;
	 array_push($nicks, array($user, $pass));
        $total  = "<?php\n \$nicks = array (\n";
        for ($n = 0; $n < sizeof ($nicks); $n++)
		 {
            $total = "".$total." array (\"" . addSlashes($nicks[$n][0]) . "\",\"" . addSlashes($nicks[$n][1]) . "\")";
            if ($n != sizeof ($nicks) - 1)
			  $total = "".$total.",\n";
		    else
			  $total = "".$total."\n";
         }
		
        $total = "".$total.");\n?>\n";
        $archivo = fopen("Usuarios.php", "w+");
		fwrite($archivo, $total); 
		fclose($archivo);
    } 

if ($enviar) {
  $nick = trim(stripSlashes($nick));
  $nick = str_replace(" ","",$nick);
  $clave = trim(stripSlashes($clave));
  $clave = str_replace(" ","",$clave);
  $contrasenia = md5($clave);
  if ($nick != "" && $clave != "" && $clave==$clave2) {
    if (!Existe($nick)) {
      guardar($nick, $contrasenia);
      echo "<tr><td><font class=\"Texto\">REGISTRO COMPLETADO</font></td></tr>";
      echo "<tr><td><font class=\"Texto\"><b>&#187;</b>NICK <font color=\"cc0000\">$nick</font></font></td></tr>";
      echo "<tr><td><font class=\"Texto\"><b>&#187;</b>PASSWORD <font color=\"cc0000\">$clave<br></font></font></td></tr>";
    } else {
        echo "<tr><td align=\"center\"><font class=\"Texto\" color=#ff0000>ERROR EL NICK EXISTE</td></tr><tr><td align=\"center\"><font class=\"Texto\"><a href=\"javascript:history.back(1)\" class=\"EnlaceMenu\">VOLVER</a></font></td></tr>";
      }   
  } else {
      if ($nick == "")
        echo "<div align=\"center\"><font class=\"Texto\" color=#ff0000>NICK VACIO<br></font></div>";
      if ($clave == "")
        echo "<div align=\"center\"><font class=\"Texto\" color=#ff0000>PASSWORD VACÍA<br></font></div>";  
	  if ($clave != $clave2)
	   echo "<div align=\"center\"><font class=\"Texto\" color=#ff0000>ERROR PASSWORD<br></font></div>";  
      echo "<div align=\"center\"><font class=\"Texto\"><a href=\"javascript:history.back(1)\" class=\"EnlaceMenu\">VOLVER</a></font></div>";
    }
} else {
?>

<form method="post" action="registro.php">
   <font class="Texto" style="color:#000099;font-size: 10px; font-style: normal; font-family: verdana; "><?=REGISTRO; ?></font></td></tr>
    <tr>
      <td><font class="Texto" style="color:#000099;font-size: 10px; font-style: normal; font-family: verdana; "><?=NICK; ?></font></td>
      <td><input type="text" name="nick" value="" size="8" class="Boton" maxlength="<?php echo $maxNick; ?>"> </td>
    </tr>
    <tr>
      <td><font class="Texto" style="color:#000099;font-size: 10px; font-style: normal; font-family: verdana; "><?=CONTRASEÑA; ?></font></td>
      <td><input type="password" name="clave" value="" size="8" maxlength="8" class="Boton"></td>
	  </tr>
      <tr>
	  <td><font class="Texto" style="color:#000099;font-size: 10px; font-style: normal; font-family: verdana; "><?=CONTRASEÑA; ?></font></td>
	  <td><input type="password" name="clave2" value="" size="8" maxlength="8" class="Boton"></td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input type="submit" name="enviar" value="<?=ACEPTAR; ?>" class="Boton"></td>
</form>
<? 
} 
?>
</tr></table></td></tr></table>
</body>
</html>