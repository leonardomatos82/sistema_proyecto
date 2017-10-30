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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>MensaHurdes</title>
<?
include("Online.php");
  $tiempo=20;
  echo "<meta http-equiv='Refresh' content='".$tiempo."'>";
?>
</head>

<body>
<h6>
		<? //Usuarios Escribiendo
	//Borramos los no activos
	global $Users_Online;
	$timestamp = time();
	$timeout = $timestamp - 300;
	 // Insertamos en usuarios Online
        $total  = "<?php\n \$Users_Online = array (\n";
        for ($n = 0; $n < sizeof ($Users_Online); $n++)
		 {
		    if($Users_Online[$n][1] > $timeout)
              $total = "".$total." array (\"" . addSlashes($Users_Online[$n][0]) . "\",\"" . addSlashes($Users_Online[$n][1]) . "\")";
			else $borrado=true;
			
            if ($n != sizeof ($Users_Online) - 1 && !$borrado)
			  $total = "".$total.",\n";
		    else
			  if(!$borrado)$total = "".$total."\n";
			  $borrado=false;
         }
		
        $total = "".$total.");\n?>\n";
        $archivo = fopen("Online.php", "w+");
		fwrite($archivo, $total); 
		fclose($archivo);
	
	$i=0;
	$cadena_usuarios="";
    for ($n = 0; $n < sizeof ($Users_Online); $n++)
	{  $i=$i+1;
	   $cadena_usuarios=$cadena_usuarios.$i.". ".$Users_Online[$n][0]."   ";
	}
	
	?>
		<MARQUEE>   
		<? echo $cadena_usuarios; ?> 
		</MARQUEE>
</h6>
</body>
</html>
