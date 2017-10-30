<?
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
<?
// Valor de los campos por defecto
$campo0_defecto="www.tusitio.com";
$campo1_defecto=20;
$campo2_defecto=30;
$campo3_defecto=60;
$campo4_defecto=50;
$campo5_defecto=300;
$campo6_defecto=200;
$campo7_defecto="/MensaHurdes";

$instalado=false;
// Lectura de las variables
if($HTTP_POST_VARS) 
	{
	 $campo0 =& $HTTP_POST_VARS['campo0'];
	 $campo1 =& $HTTP_POST_VARS['campo1'];
	 $campo2 =& $HTTP_POST_VARS['campo2'];
 	 $campo3 =& $HTTP_POST_VARS['campo3'];
 	 $campo4 =& $HTTP_POST_VARS['campo4'];
 	 $campo5 =& $HTTP_POST_VARS['campo5'];
	 $campo6 =& $HTTP_POST_VARS['campo6'];
	 $campo7 =& $HTTP_POST_VARS['campo7'];
	 $instalar =& $HTTP_POST_VARS['instalar'];
	}

if($instalar)
{
if($campo0=="" || $campo1=="" || $campo2=="" || $campo3=="" || $campo4=="" || $campo5==""|| $campo6==""|| $campo7==""){echo "<script>Mensaje('Hay Campos Vacíos, no deje ningún campo en blanco.')</script>";  exit;}

   //1. Guardamos los datos en el archivo de configuracion.
    if(file_exists("conf.php"))
	  {	
	    $fp=fopen("conf.php","w+");
	    if($fp)
		  {
		  $v="<?php exit; ?>\n";
		  $v .='$pagina_web="'.$campo0.'";'.chr(13);
		  $v .="\$max_char = 9;\n";
		  $v .='$tiempo='.$campo1.';'.chr(13);
		  $v .="\$cimpar = \"#E6F5FA\";\n";
		  $v .="\$cpar = \"#D5E4E9\";\n";
		  $v .="\$fondotabla = \"#D5E4E9\";\n";
		  $v .="\$bordetabla = \"#C4D3D8\";\n";
		  $v .="\$bordecampo = \"#CCCCCC\";\n";
		  $v .="\$fondocampo = \"#DDDDDD\";\n";
		  $v .="\$smilies = \"ON\";\n";
		  $v .="\$nick_defecto = \"Tu Nick\";\n";
		  $v .="\$pass_defecto = \"PASWORD\";\n";
		  $v .="\$mensa_defecto = \"Tu mensaje\";\n";
		  $v .="\$nick_info = \"<font color=#FF0000>F  H</font>\";\n";
		  $v .="\$word_limit = \"ON\";\n";
		  $v .="\$word_max = 20;\n";
          $v .='$cantidad_mensajes='.$campo2.';'.chr(13);
	      $v .='$mensajes_guardados='.$campo3.';'.chr(13);
	      $v .='$maxPalabras='.$campo4.';'.chr(13);
	      $v .="\$nick_urls = \"ON\";\n";	
		  $v .='$altura='.$campo5.';'.chr(13);
		  $v .='$anchura='.$campo6.';'.chr(13);		 	 
		  
		  fwrite($fp,$v);
		  fclose($fp);
		  $instalado=true;
		  echo "<tr><td><br><center><font class='normal'>El MensaHurdes ha sido Instalado con éxito.<br>
		  Ahora puedes borrar este archivo para mayor seguridad<br><br></td></tr>";
		  }
		  else
		     echo "<tr><td><br><center><font class='normal'>Error el archivo conf.php no se puede escribir, asegurese que el archivo tiene los permisos CHMOD 777 <br><br></td></tr>";
	  }
	  else
	    echo "<tr><td><br><center><font class='normal'>El archivo conf.php no existe<br><br></td></tr>";

   //3. Mostramos el cuadro de lo que tiene que bacer para ponerlo en su web
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Documento sin t&iacute;tulo</title>
<style type="text/css">
<!--
.Estilo1 {color: #000066}
body {
	background-color: #33FF00;
}
.Estilo2 {
	color: #3399CC;
	font-weight: bold;
}
-->
</style>
</head>

<body>
<?
if(!$instalado){
?>
<table width="748" border="1" align="center">
		<form action="Instalar.php" method="post" name="form1" id="form1">
		<tr>
				<td colspan="3"><div align="center">
						<h2 class="Estilo1">Bienvenido al Instalador de MensaHurdes </h2>
						<p class="Estilo1">Versi&oacute;n. 2007 1.0 beta </p>
				</div></td>
		</tr>
		<tr>
				<td colspan="3"><div align="center" class="Estilo2">Instalaci&oacute;n sin BD. Puedes dejar los campos que vienen por defecto excepto el de direcci&oacute;n de tu web y el de el path donde has instalado MensaHurdes. </div></td>
				</tr>
		<tr>
				<td>Direccion de tu sitio web </td>
				<td><input name="campo0" type="text" value="<?=$campo0_defecto;?>" size="25" onFocus=" Cambiar(this,'<?php echo $campo0_defecto; ?>');" onBlur=" Cambiar2(this,'<?php echo $campo0_defecto; ?>');" /></td>
				<td>&nbsp;</td>
		</tr>
		<tr>
				<td width="335" rowspan="2">Tiempo para refrescar la pantalla en Segundos </td>
				<td width="150" rowspan="2"><input name="campo1" type="text" value="<?=$campo1_defecto;?>" size="25" onFocus=" Cambiar(this,'<?php echo $campo1_defecto; ?>');" onBlur=" Cambiar2(this,'<?php echo $campo1_defecto; ?>');"/></td>
				<td width="241"><div align="center">MensaHurdes </div></td>
		</tr>
		<tr>
				<td rowspan="8"><img src="MensaHurdes.JPG" alt="MensaHurdes" width="215" height="476" longdesc="Imagen del mensaHurdes" /></td>
		</tr>
		
		<tr>
				<td>N&uacute;mero de Mensajes a Mostrar				</td>
				<td><input name="campo2" type="text" value="<?=$campo2_defecto;?>" size="25"onFocus=" Cambiar(this,'<?php echo $campo2_defecto; ?>');" onBlur=" Cambiar2(this,'<?php echo $campo2_defecto; ?>');" /></td>
		</tr>
		
		<tr>
				<td bordercolor="#003300">N&uacute;mero de Mensajes a guardar en la BD </td>
				<td><input name="campo3" type="text" value="<?=$campo3_defecto;?>" size="25" onFocus=" Cambiar(this,'<?php echo $campo3_defecto; ?>');" onBlur=" Cambiar2(this,'<?php echo $campo3_defecto; ?>');"/></td>
		</tr>
		<tr>
				<td>M&aacute;ximo de Palabras por Mensaje </td>
				<td><input name="campo4" type="text" value="<?=$campo4_defecto;?>" size="25" onFocus=" Cambiar(this,'<?php echo $campo5_defecto; ?>');" onBlur=" Cambiar2(this,'<?php echo $campo4_defecto; ?>');" /></td>
		</tr>
		<tr>
				<td>Altura del MensaHurdes </td>
				<td><input name="campo5" type="text" value="<?=$campo5_defecto;?>" size="25" onFocus=" Cambiar(this,'<?php echo $campo5_defecto; ?>');" onBlur=" Cambiar2(this,'<?php echo $campo5_defecto; ?>');"/></td>
		</tr>
		<tr>
				<td>Anchura del MensaHurdes </td>
				<td><input name="campo6" type="text" value="<?=$campo6_defecto;?>" size="25" onFocus=" Cambiar(this,'<?php echo $campo6_defecto; ?>');" onBlur=" Cambiar2(this,'<?php echo $campo6_defecto; ?>');"/></td>
		</tr>
		<tr>
				<td>Path y nombre de la carpeta donde est&aacute;n los archivos </td>
				<td><input name="campo7" type="text" value="<?=$campo7_defecto;?>" size="25" onFocus=" Cambiar(this,'<?php echo $campo7_defecto; ?>');" onBlur=" Cambiar2(this,'<?php echo $campo7_defecto; ?>');"/></td>
		</tr>
		<tr>
				<td colspan="2"><p>MensaHurdes es c&oacute;digo libre, ha sido implementado por varios colaboradores, todas las aplicaciones utilizadas en &eacute;l son Software Libre, le recordamos que el autor/es no se responsabilizan de este script por lo que tampoco se oferta ninguna garant&iacute;a, usted decide si lo utiliza &oacute; no.<br />
						<br />
						Este programa es Software Libre; Usted puede redistribuirlo y/o modificarlo <br />
						bajo los t&eacute;rminos de la GNU Licencia P&uacute;blica General (GPL) tal y como ha sido <br />
						p&uacute;blicada por la Free Software Foundation; o bien la versi&oacute;n 2 de la Licencia, <br />
						o (a su opci&oacute;n) cualquier versi&oacute;n posterior.<br />
						 Este programa se distribuye con la esperanza de que sea &uacute;til, pero SIN NINGUNA GARANT&Iacute;A.</p>
						<p>Para m&aacute;s informaci&oacute;n Lea el archivo Licencia.txt que deber&iacute;a haber recibido con este Script. </p>
						<p>Comunicar problemas a hurdes@gmail.com <br />
				</p></td>
		</tr>
		<tr>
				<td colspan="2"><div align="right"><span class="Estilo10">
						<input name="restaurar" type="reset" class="Estilo14" value="Restaurar" />
						<input name="instalar" type="submit" class="Estilo14" value="Instalar" />
				</span></div></td>
				<td>&nbsp;</td></tr></form>
		</tr>
</table>
<?
}
else
  {
     echo "<tr><td><br><center><font class='normal'>Ahora ya solo le queda insertar el MensaHurdes en las páginas que desee de su web, para ello sólo tiene que copiar el siguiente código: <br><br></td></tr>";

?>
<table width="600" border="1" align="center">
		<tr>
				<td height="23">Copie el c&oacute;digo e insertelo en el sitio que quiera que aparezca el TagBorad. </td>
		</tr>
		<tr>
				<td height="100" bgcolor="#FFFFFF"><p>&lt;!-- INICIO codigo tagboard MensaHurdes--&gt;<br />
				&lt;iframe marginwidth=&quot;0&quot; marginheight=&quot;0&quot; src=&quot;<? echo $campo7 ?>/MensaHurdes.php&quot; frameborder=&quot;0&quot; width=&quot;<? echo $campo6 ?>&quot; height=&quot;<? echo $campo5+200 ?>&quot; scrolling=&quot;no&quot;&gt;&lt;/iframe&gt;<br />
				&lt;!-- FIN codigo MensaHurdes --&gt;</p>
				</td>
		</tr>
		<tr>
				<td>Puede ver un ejemplo en la p&aacute;gina Index.html que se le adjunta con el resto de archivos. </td>
		</tr>
</table>
<?
  }
?>
<p>&nbsp;</p>
</body>

</html>
