<?php
//////////////////////////////////////////////////////
//
// MensaHurdes (beta)V. 2007 1.0 
// 
// �ltima Modificaci�n: 12-Diciembre-2006
// www.MensaHurdes.es.mw
// mensahurdes.iespana.es
// Copyright (C) 2006  Hurdes: hurdes@gmail.com
//
////////////////////////////////////////////////////////////////////////////////////////////////////
// Este programa es Software Libre; Usted puede redistribuirlo y/o modificarlo 
//bajo los t�rminos de la GNU Licencia P�blica General (GPL) tal y como ha sido 
//p�blicada por la Free Software Foundation; o bien la versi�n 2 de la Licencia, 
//o (a su opci�n) cualquier versi�n posterior.
// Este programa se distribuye con la esperanza de que sea �til, pero SI NINGUNA GARANT�A.
///////////////////////////////////////////////////////////////////////////////////////////////////

// Cargar Usuarios
 
 include("Online.php");
 $usuarios = file("Usuarios.php");
 $usuarios[0] = "";
 eval(join("",$usuarios));

// Cargar Configuraci�n
 $conf = file("conf.php");
 $conf[0] = "";
 eval(join("",$conf));

if($mensajes_guardados>0)
{
	// Leemos los mensajes
	$archivo = file("Mensajes.txt");
	$lineas = count($archivo);
	if($lineas > $mensajes_guardados*2 )
	{
	  for ($i = $lineas; $i > $mensajes_guardados; $i--) 
	   {
 	  	 $total .= $archivo[$i]; 
 	   }
	 // Insertamos los mensajes en el archivo
        $archivo = fopen("Mensajes.txt","w+");
        fputs($archivo,$total);
        // Cerramos el archivo
        fclose($archivo);
	 }
    		
}
 
	if($HTTP_POST_VARS) 
	{
	 $nick =& $HTTP_POST_VARS['nick'];
	 $mensaje_introducir =& $HTTP_POST_VARS['titulo'];
	 $enviar =& $HTTP_POST_VARS['enviar'];
	 $opciones =& $HTTP_POST_VARS['opciones'];
	 $actualizar =& $HTTP_POST_VARS['actualizar'];
	 $url =& $HTTP_POST_VARS['url'];
	 $pass =& $HTTP_POST_VARS['pass'];
	}
 
 $correcto=true;
 $nick = htmlspecialchars($nick);

 
 function NickInfo($info_string) {
 	global $HTTP_SERVER_VARS;
	$info_string = str_replace("F",date("d-m-Y"),$info_string);
	 $info_string = str_replace("H",date("H:i:s"),$info_string);
	return $info_string;
 }


 function SmileyReplace(&$Mensaje) {

	$Mensaje = str_replace(":0001","<img src=\'smilies/0001.gif\'>", $Mensaje);
$Mensaje = str_replace(":0004","<img src=\'smilies/0004.gif\'>", $Mensaje);
$Mensaje = str_replace(":0005","<img src=\'smilies/0005.gif\'>", $Mensaje);
$Mensaje = str_replace(":0006","<img src=\'smilies/0006.gif\'>", $Mensaje);
$Mensaje = str_replace(":0007","<img src=\'smilies/0007.gif\'>", $Mensaje);
$Mensaje = str_replace(":153","<img src=\'smilies/153.bmp\'>", $Mensaje);
$Mensaje = str_replace(":153","<img src=\'smilies/153.gif\'>", $Mensaje);
$Mensaje = str_replace(":167","<img src=\'smilies/167.gif\'>", $Mensaje);
$Mensaje = str_replace(":17758","<img src=\'smilies/17758.gif\'>", $Mensaje);
$Mensaje = str_replace(":223","<img src=\'smilies/223.GIF\'>", $Mensaje);
$Mensaje = str_replace(":234","<img src=\'smilies/234.bmp\'>", $Mensaje);
$Mensaje = str_replace(":244","<img src=\'smilies/244.GIF\'>", $Mensaje);
$Mensaje = str_replace(":283","<img src=\'smilies/283.GIF\'>", $Mensaje);
$Mensaje = str_replace(":357","<img src=\'smilies/357.GIF\'>", $Mensaje);
$Mensaje = str_replace(":46","<img src=\'smilies/46.GIF\'>", $Mensaje);
$Mensaje = str_replace(":819","<img src=\'smilies/819.gif\'>", $Mensaje);
$Mensaje = str_replace(":aliean","<img src=\'smilies/aliean.gif\'>", $Mensaje);
$Mensaje = str_replace(":alien","<img src=\'smilies/alien.jpg\'>", $Mensaje);
$Mensaje = str_replace(":ardilla","<img src=\'smilies/ardilla.gif\'>", $Mensaje);
$Mensaje = str_replace(":besitodeamor","<img src=\'smilies/besitodeamor.bmp\'>", $Mensaje);
$Mensaje = str_replace(":burger","<img src=\'smilies/burger.bmp\'>", $Mensaje);
$Mensaje = str_replace(":caballo","<img src=\'smilies/caballo.bmp\'>", $Mensaje);
$Mensaje = str_replace(":cerdo","<img src=\'smilies/cerdo.bmp\'>", $Mensaje);
$Mensaje = str_replace(":corazonlatiendo","<img src=\'smilies/corazonlatiendo.gif\'>", $Mensaje);
$Mensaje = str_replace(":corazon","<img src=\'smilies/corazon.bmp\'>", $Mensaje);
$Mensaje = str_replace(":enamorado","<img src=\'smilies/enamorado.gif\'>", $Mensaje);
$Mensaje = str_replace(":enfadado","<img src=\'smilies/enfadado.bmp\'>", $Mensaje);
$Mensaje = str_replace(":fresa","<img src=\'smilies/fresa.gif\'>", $Mensaje);
$Mensaje = str_replace(":fuck5","<img src=\'smilies/fuck5.GIF\'>", $Mensaje);
$Mensaje = str_replace(":fumaor","<img src=\'smilies/fumaor.GIF\'>", $Mensaje);
$Mensaje = str_replace(":guau","<img src=\'smilies/guau.jpg\'>", $Mensaje);
$Mensaje = str_replace(":Hasta_los_huevos","<img src=\'smilies/Hasta_los_huevos.gif\'>", $Mensaje);
$Mensaje = str_replace(":helado","<img src=\'smilies/helado.bmp\'>", $Mensaje);
$Mensaje = str_replace(":hippi","<img src=\'smilies/hippi.GIF\'>", $Mensaje);
$Mensaje = str_replace(":icon_twisted","<img src=\'smilies/icon_twisted.gif\'>", $Mensaje);
$Mensaje = str_replace(":inlove","<img src=\'smilies/inlove.jpg\'>", $Mensaje);
$Mensaje = str_replace(":inlove","<img src=\'smilies/inlove.png\'>", $Mensaje);
$Mensaje = str_replace(":llora","<img src=\'smilies/llora.gif\'>", $Mensaje);
$Mensaje = str_replace(":love","<img src=\'smilies/love.gif\'>", $Mensaje);
$Mensaje = str_replace(":maria","<img src=\'smilies/maria.GIF\'>", $Mensaje);
$Mensaje = str_replace(":mutilado","<img src=\'smilies/mutilado.bmp\'>", $Mensaje);
$Mensaje = str_replace(":nono","<img src=\'smilies/nono.GIF\'>", $Mensaje);
$Mensaje = str_replace(":Nuclear-","<img src=\'smilies/Nuclear-.bmp\'>", $Mensaje);
$Mensaje = str_replace(":Nueva imagen","<img src=\'smilies/Nueva imagen.GIF\'>", $Mensaje);
$Mensaje = str_replace(":paz","<img src=\'smilies/paz.jpg\'>", $Mensaje);
$Mensaje = str_replace(":pelopulpo","<img src=\'smilies/pelopulpo.bmp\'>", $Mensaje);
$Mensaje = str_replace(":PIRATA02","<img src=\'smilies/PIRATA02.bmp\'>", $Mensaje);
$Mensaje = str_replace(":quee","<img src=\'smilies/quee.bmp\'>", $Mensaje);
$Mensaje = str_replace(":ron","<img src=\'smilies/ron.bmp\'>", $Mensaje);
$Mensaje = str_replace(":s10","<img src=\'smilies/s10.gif\'>", $Mensaje);
$Mensaje = str_replace(":sandia","<img src=\'smilies/sandia.bmp\'>", $Mensaje);
$Mensaje = str_replace(":sandwich","<img src=\'smilies/sandwich.gif\'>", $Mensaje);
$Mensaje = str_replace(":TQ","<img src=\'smilies/TQ.jpg\'>", $Mensaje);
$Mensaje = str_replace(":triste","<img src=\'smilies/triste.gif\'>", $Mensaje);
$Mensaje = str_replace(":vaca2","<img src=\'smilies/vaca2.bmp\'>", $Mensaje);
		
  return $Mensaje;
 }

?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//ES">
<html>
<head>
<title>MensaHurdes</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script type="text/javascript">
function Cambiar(cadena1,cadena2) {
  if (cadena1.value==cadena2) {
    cadena1.value='';
  }
}
function Cambiar2(cadena1,cadena2) {
  if (cadena1.value=='') {
    cadena1.value=cadena2;
  }
}
function Mensaje(cadena) {
alert (cadena);
}
</script>
<style type="text/css">
<!--
.Estilo1 {
	color: #FF0000;
	font-size: 12px;
}
-->
</style>
</head>
<body>
<?php

 if(strlen($nick) > $max_char && correcto) { echo "<script>Mensaje('El Nick es demasiado largo, M�ximo $max_char caracteres')</script>"; $correcto=false; }

 if(!eregi("^(http://|mailto:)",$url)) { $url = ''; }
 if(isset($url) && ($url == "http://" || $url == "mailto:")) { $url = ''; }


 if ($nick) { $defecto = $nick; } else { $defecto = $nick_defecto; }
 if ($pass) { $defecto_pass = $pass; } else { $defecto_pass = $pass_defecto; }

 if ($enviar) 
 { 
 // Coprobamos usuario y pasword
    for ($n = 0; $n < sizeof($nicks); $n++) 
	  {
		   if ($nicks[$n][0] == $nick)
		     if ($nicks[$n][1] != md5($pass))
		       {echo "<script>Mensaje('El Nick est� registrado')</script>"; $correcto=false;} 	 
	  }

 // Comprobar campos.

 $nick_test = str_replace(" ","",$nick);
 if ($nick_test == "" OR $nick == $nick_defecto) { echo "<script>Mensaje('El Nick es incorrecto, debes poner un Nick')</script>"; $correcto=false; }
 $mensaje_introducir_test = str_replace(" ","",$mensaje_introducir);
 if($mensaje_introducir_test == "" OR $mensaje_introducir == $mensa_defecto) {echo "<script>Mensaje('El Mensaje es incorrecto, debes poner un Mensaje')</script>"; $correcto=false;  }
 if(strlen($mensaje_introducir_test) > $maxPalabras*2) {echo "<script>Mensaje('El Mensaje es demasiado largo')</script>"; $correcto=false;  }
 
 // Correcci�n del problema de las urls, redirecciones,etc.
 $mensaje_introducir = str_replace("http://","****",$mensaje_introducir); 
 $mensaje_introducir = str_replace("www","***",$mensaje_introducir); 
 $mensaje_introducir = str_replace("<","&lt; ",$mensaje_introducir);
 $mensaje_introducir = str_replace(">"," &gt;",$mensaje_introducir);

  if ($word_limit == "ON") {

	 $mensaje_filtrado = explode(" ",$mensaje_introducir);

	 if ($maxPalabras == -1) $palabras = count($mensaje_filtrado); 

	 else { 
	 
	 	$palabras = count($mensaje_filtrado);
	 
	 	if($palabras > $maxPalabras) { $palabras = $maxPalabras; }
			
		$temp = $mensaje_filtrado;
		$mensaje_filtrado = array();
		for($i=0;$i<$palabras;$i++) { 
			$mensaje_filtrado[] = $temp[$i];
		}
		unset($temp);
			
	 }

      for($i=0;$i<$palabras;$i++) {

		$mensaje_filtrado[$i] = trim($mensaje_filtrado[$i]);

		if($word_limit == "ON") 		
		if(strlen($mensaje_filtrado[$i]) > $word_max) {
		$mensaje_filtrado[$i] = wordwrap($mensaje_filtrado[$i],$word_max,"<br>",1);
		}		
	     	
	   } 

 $mensaje_introducir = implode(" ",$mensaje_filtrado);

 } 

 
 if(isset($url)) {

	 $url = htmlspecialchars(trim(strip_tags($url)));  

	 if(!eregi("^(http://[a-z0-9_./:-]+|mailto:(.+)\.(.+){2,3})",$url)) { $url = ''; }
	 
 } else { 
 
 	$url = '';
	
}

	if(!empty($url)) $cadena_final .= "<a href='$url' target='_blank'>"; 
		
	$cadena_final .= "<font color=#000080><b>$nick&gt;</b></font>"; 
	
 if($url) { $cadena_final .= "</a>"; }
 
  if($smilies == "ON") 	SmileyReplace($mensaje_introducir);
 
 $cadena_final .= trim($mensaje_introducir);
 $cadena_final.="<br>".nickinfo($nick_info)."";
 $cadena_final.="##\n";
 $cadena_final = stripslashes($cadena_final);

if($correcto){
  global $Users_Online;
  //Fetch Time
	$timestamp = time();  
	 $timeout = $timestamp - 300;
	 
	  // Insertamos en usuarios Online
        $total  = "<?php\n \$Users_Online = array (\n";
		array_push($Users_Online, array($nick, $timestamp));
        for ($n = 0; $n < sizeof ($Users_Online); $n++)
		 {
		   if($Users_Online[$n][0]!=$nick || $n == sizeof ($Users_Online)-1)
		   {
             $total = "".$total." array (\"" . addSlashes($Users_Online[$n][0]) . "\",\"" . addSlashes($Users_Online[$n][1]) . "\")";
		   }
			
            if ($n != sizeof ($Users_Online) - 1 && $nick!=$Users_Online[$n][0])
			  $total = "".$total.",\n";
		    else
			  $total = "".$total."\n";
         }
		
        $total = "".$total.");\n?>\n";
        $archivo = fopen("Online.php", "w+");
		fwrite($archivo, $total); 
		fclose($archivo);
	 
	  // Insertamos el mensaje en el archivo
        $archivo = fopen("Mensajes.txt","a");
        // A�adimos el nuevo mensaje a los antiguos 
        fputs($archivo,$cadena_final);
        // Cerramos el archivo
        fclose($archivo);
	}// Fin si correcto
 }

?>
<table cellspacing=0 cellpadding=0 border=1 width="<?=$anchura?> px">
		<form action="MensaHurdes.php" method="post" name="form1" id="form1">
		<tr><td width="200px;" nowrap>
				<iframe src="<? if ($opciones) { echo ("opciones.php"); } else { echo ("MostrarMensajes.php"); } ?>" name="iframe" width="<?=$anchura?> px;" marginwidth="0" height="<?=$altura?> px;" marginheight="0" scrolling="Yes" frameborder="0" id="iframe"><span class="Estilo5"><span class="Estilo6"><span class="Estilo7"><span class="Estilo8"><span class="Estilo9"><span class="Estilo10"><span class="Estilo10"></span></span></span></span></span></span></span></iframe></td>
		</tr>
		<tr><td height="124" colspan="2" nowrap bgcolor="<? echo $fondocampo?>">
				
										<p align="left">
												<input name="nick" type="text" class="Campo" onFocus=" Cambiar(this,'<?php echo $defecto; ?>');" onBlur=" Cambiar2(this,'<?php echo $defecto; ?>');" value="<?php echo $defecto; ?>" size="12" maxlength="<?php echo $max_char; ?>" style="font-family:Arial, Verdana, Helvetica;border:1px solid #cccccc;background-color:<? echo $fondocampo?>;font-size:8pt;color:#000000;width:<?=$anchura/2?>px;"/><input name="pass" type="password" class="Campo" onFocus=" Cambiar(this,'<?php echo $defecto_pass; ?>');" onBlur=" Cambiar2(this,'<?php echo $defecto_pass; ?>');" value="<?php echo $defecto_pass; ?>" size="12" maxlength="<?php echo $max_char; ?>" style="font-family:Arial, Verdana, Helvetica;border:1px solid #cccccc;background-color:<? echo  $fondocampo?>;font-size:8pt;color:#000000;width:<?=$anchura/2?>px;" />
												<br><input name="titulo" type="text" class="Estilo13" onFocus=" Cambiar(this,'<?php echo $mensa_defecto; ?>');" onBlur=" Cambiar2(this,'<?php echo $mensa_defecto; ?>');" value="<?=$mensa_defecto;?>" size="27" style="font-family:Arial, Verdana, Helvetica;border:1px solid #cccccc;background-color:<? echo $fondocampo?>;font-size:8pt;color:#000000;width:<?=$anchura?>px;"/><br>
												<input name="url" type="text" class="Estilo13" onFocus=" Cambiar(this,'http://');" onBlur=" Cambiar2(this,'No link');" value="http://" size="27" style="font-family:Arial, Verdana, Helvetica;border:1px solid #cccccc;background-color:<? echo $fondocampo?>;font-size:8pt;color:#000000;width:<?=$anchura?>px;"/>
										</p>
										<p align="left"><span class="Estilo10">
												<input name="enviar" type="submit" class="Estilo14" value="Enviar" />
										</span><span class="Estilo10">
										<input name="actualizar" type="submit" class="Estilo14" value="Recargar" />
										</span><span class="Estilo10">
										<input name="opciones" type="submit" class="Estilo14" value="Op" />
										</span></p>
										<div align="left"><span class="Estilo11 Estilo1"><strong>USUARIOS_ESCRIBIENDO:								</strong></span>										</div>
										<iframe src="Escribiendo.php" name="iframe" width="100%"  height="18" marginwidth="0" marginheight="0" scrolling="no" frameborder="0" id="iframe"></iframe>
		</tr>
		
		</form>
				<span class="Estilo10">				</span>
</table>
</body>
</html>