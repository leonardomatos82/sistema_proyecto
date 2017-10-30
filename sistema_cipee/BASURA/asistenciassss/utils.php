<?php
//echo $COD_D_HE;
///////////////////////////////////////////////////////////////////////////////////////7
//Javier Prato / Rhona Aponte UBV2005
//Inserta un registro en la tabla transacci�n de la base de datos actual
//$conexion : una conexi�n a la base de datos
//$usuario : nombre del usuario del sistema(aplicaci�n) que realiza la operaci�n
//$descripci�n : breve narraci�n de la operaci�n realizada
//$cedula : c�dula de identidad del registro afectado
//V1.0b adaptaci�n al sistema acceso?
//regresa : nada
function registrarOperacion($con,$usuario,$descripcion) {
$hora=date("H:i:s");
  pg_query($con,"INSERT INTO transaccion (fecha,hora,operacion,login) VALUES ('".date("Y-m-d")."', '$hora','".$descripcion."','".$usuario."')");
}

function formato_numero($tt) {
$entero=Intval($tt);
$Decimales = $tt - Intval($tt);
$Decimales= $Decimales*100;
$Decimales= Intval($Decimales);
$valor=$entero.".".$Decimales;
if ($Decimales==0)
$valor=$entero."."."00";
echo $valor;
return $valor;
}


function buscarCedula($conexion,$cedula) {
  if ($result=pg_query($conexion,"Select * from usuario where cedula=$cedula"))
  {
  $row =pg_fetch_row($result);
  $_SESSION['cedula'] = $row[cedula];
  $_SESSION['nombre'] = $row[nombre];	
  $_SESSION['cargo'] = $row[cargo];	
  } else {
  echo "no existe";}
  
  
}
// Funci�n que pasadas como par�metro dos fechas, devuelve el n�mero de d�as transcurridos.
// Trabaja con fechas en espa�ol (dd-mm-aaaa).
function dias_entre_fechas($fecha1, $fecha2)
{
$dia1 = strtok($fecha1, "-");
$mes1 = strtok("-");
$anyo1 = strtok("-");

$dia2 = strtok($fecha2, "-");
$mes2 = strtok("-");
$anyo2 = strtok("-");

$num_dias = 0;

if ($anyo1 < $anyo2)
{
$dias_anyo1 = date("z", mktime(0,0,0,12,31,$anyo1)) - date("z", mktime(0,0,0,$mes1,$dia1,$anyo1));
$dias_anyo2 = date("z", mktime(0,0,0,$mes2,$dia2,$anyo2));
$num_dias = $dias_anyo1 + $dias_anyo2;
}
else
$num_dias = date("z", mktime(0,0,0,$mes2,$dia2,$anyo2)) - date("z", mktime(0,0,0,$mes1,$dia1,$anyo1));

return $num_dias;
}



function logincheckS($seccion){
  if($_SESSION["login"]=="") {
		 header("Location: /rcr/index.php"); 
  } else {
    if(!strstr($_SESSION["acceso"],$seccion)) {
		 header("Location: /rcr/index.php"); 
    }
  }
}
//=======================================================================================
// Javier E. Prato UBV2005
//Construye una lista apartir de un conjunto de valores de extraidos de una base de datos
//Par�metros de entrada:
//$nombre : nombre de la base del select
//$result : conjunto de datos extraidos de la base de datos
//$desc   : nombre del campo que se mostrar� en la lista
//$valor  : nombre del campo que tiene los valores de la lista
//$predeterminado: valor predeterminado o lista de valores marcados como seleccionados
//$adds   : parametros adicionales del tag select   
//V1.5
//Modificaciones: 
//24/04/2006 : Soporte a listas de selecci�n multiple
//regresa : cadena con el htm del tag select correspondiente
function construirLista($nombre,$result,$desc,$valor,$predeterminado,$adds) {
  if(!strpos($adds,"multiple")) {
    $option='<option value="">(Seleccione)</option>';
  } else {
    $option ="";
  }	
  $select='<select name="'.$nombre.'" id="'.$nombre.'" '.$adds.'>';
  $num = pg_num_rows($result);
  for ($i = 0; $i < $num; $i++){
    $selected="";
    $row=pg_fetch_assoc($result);
	if(is_array($predeterminado)){
	  foreach($predeterminado as $p) {
        if($row[$valor]==$p) {
	      $selected="selected"; 
	    }
	  }
	} else {
      if($row[$valor]==$predeterminado) {
	    $selected="selected"; 
	  }
	}  
    $option=$option.'<option '.$selected.' value="'.$row[$valor].'">'.$row[$desc].'</option>';
  }
  $select=$select.$option.$option2."</select>";
  return $select;
}
//////////////////////////////////////////////////////////////////////////////////////////////////
// Javier E. Prato UBV2005
//Par�metros de entrada:
//$nombre : nombre de la base del select
//$result : conjunto de datos extraidos de la base de datos
//$desc   : nombre del campo que se mostrar� en la lista
//$valor  : nombre del campo que tiene los valores de la lista
//$predeterminado: valor predeterminado o lista de valores marcados como seleccionados
//$adds   : parametros adicionales del tag select   
//V1.0
//EFECTO:
// Construye un select apartir de una consulta SQL
function construirListaQ($nombre,$conexion,$query,$desc,$valor,$predeterminado,$adds) {
  $result=pg_query($conexion,$query);
  if(!$result) return NULL;
  return construirLista($nombre,$result,$desc,$valor,$predeterminado,$adds);
}
//**********************************************************************************************
// Javier E. Prato UBV2005
//Construye una lista apartir de un conjunto de valores de extraidos de una base de datos
//Par�metros de entrada:
//$nombre : nombre de la base del select
//$result : conjunto de datos extraidos de la base de datos
//$desc   : nombre del campo que se mostrar� en la lista
//$valor  : nombre del campo que tiene los valores de la lista
//$predeterminado: valor predeterminado o lista de valores marcados como seleccionados
//$adds   : parametros adicionales del tag select   
//$selValor es el valor por defecto de la opci�n "(seleccione)"
//$maxSize es el ancho m�ximoa mostrar en la lista
//V1.0
//EFECTO:
//*** Es una version mejorada de construirListaQ que pemite indicar el ancho m�ximo del campo
//*** asi como el query es incorporado en la funci�n
function construirListaExA($nombre,$conexion,$query,$desc,$valor,$predeterminado,$adds,$selValor,$maxsize) {
 $result=pg_query($conexion,$query);
 if(!$result) return NULL;
  $option='<option value="'.$selValor.'">Seleccione</option>';
  $select='<select name="'.$nombre.'" id="'.$nombre.'" $adds >';
  $num = pg_num_rows($result);
  for ($i = 0; $i < $num; $i++){
    $row=pg_fetch_assoc($result);
    if($row[$valor]==$predeterminado) {
	  $selected="selected"; 
	} else {
	  $selected="";
	}
    $option=$option.'<option '.$selected.' value="'.$row[$valor].'">'.substr($row[$desc],0,$maxsize).'</option>';
  }
  $select=$select.$option."</select>";
 return $select;
}




function getDateDifference1($dateFrom, $dateTo, $unit = 'm')
{
   $difference = null;

   $dateFromElements = split(' ', $dateFrom);
   $dateToElements = split(' ', $dateTo);

   $dateFromDateElements = split('-', $dateFromElements[0]);
   $dateFromTimeElements = split(':', $dateFromElements[1]);
   $dateToDateElements = split('-', $dateToElements[0]);
   $dateToTimeElements = split(':', $dateToElements[1]);

   // Get unix timestamp for both dates

   $date1 = mktime($dateFromTimeElements[0], $dateFromTimeElements[1], $dateFromTimeElements[2], $dateFromDateElements[1], $dateFromDateElements[0], $dateFromDateElements[2]);
   $date2 = mktime($dateToTimeElements[0], $dateToTimeElements[1], $dateToTimeElements[2], $dateToDateElements[1], $dateToDateElements[0], $dateToDateElements[2]);

   if( $date1 > $date2 )
   {
       return null;
   }

   $diff = $date2 - $date1;

   $days = 0;
   $hours = 0;
   $minutes = 0;
   $seconds = 0;

   if ($diff % 86400 <= 0)  // there are 86,400 seconds in a day
   {
       $days = $diff / 86400;
   }

   if($diff % 86400 > 0)
   {
       $rest = ($diff % 86400);
       $days = ($diff - $rest) / 86400;

       if( $rest % 3600 > 0 )
       {
           $rest1 = ($rest % 3600);
           $hours = ($rest - $rest1) / 3600;

           if( $rest1 % 60 > 0 )
           {
               $rest2 = ($rest1 % 60);
               $minutes = ($rest1 - $rest2) / 60;
               $seconds = $rest2;
           }
           else
           {
               $minutes = $rest1 / 60;
           }
       }
       else
       {
           $hours = $rest / 3600;
       }
   }

   switch($unit)
   {
       case 'd':
       case 'D':

           $partialDays = 0;

           $partialDays += ($seconds / 86400);
           $partialDays += ($minutes / 1440);
           $partialDays += ($hours / 24);

           $difference = $days + $partialDays;

           break;

       case 'h':
       case 'H':

           $partialHours = 0;

           $partialHours += ($seconds / 3600);
           $partialHours += ($minutes / 60);

           $difference = $hours + ($days * 24) + $partialHours;

           break;

       case 'm':
       case 'M':

           $partialMinutes = 0;

           $partialMinutes += ($seconds / 60);

           $difference = $minutes + ($days * 1440) + ($hours * 60) + $partialMinutes;

           break;

       case 's':
       case 'S':

           $difference = $seconds + ($days * 86400) + ($hours * 3600) + ($minutes * 60);

           break;

       case 'a':
       case 'A':

           $difference = array (
               "days" => $days,
               "hours" => $hours,
               "minutes" => $minutes,
               "seconds" => $seconds
           );

           break;
   }

   return $difference;
}
// funci�n para cambiar la fecha a formato periodo  aaaamm
	function cambiaf_a_periodo($fecha){ 
	ereg( "([0-9]{2,4})-([0-9]{1,2})-([0-9]{1,2})", $fecha, $mifecha); 
	$lafecha=$mifecha[1]."".$mifecha[2]; 
	return $lafecha; 
	} 
//////////////////////////////////////////////////////////////////////////////////////////7
// funci�n para cambiar la fecha a formato Postgres  aaaa/mm/dd
	function cambiaf_a_postgres($fecha){ 
	ereg( "([0-9]{2,2})-([0-9]{1,2})-([0-9]{1,4})", $fecha, $mifecha); 
	$lafecha=$mifecha[1]."-".$mifecha[2]."-".$mifecha[3];  
	return $lafecha; 
	
	} 
//////////////////////////////////////////////////////////////////////////////////////////7
// funci�n para cambiar la fecha a formato espa�ol  dd/mm/aaaa
	function cambiaf_a_normal($fecha){ 
	ereg( "([0-9]{2,4})-([0-9]{1,2})-([0-9]{1,2})", $fecha, $mifecha); 
	$lafecha=$mifecha[3]."-".$mifecha[2]."-".$mifecha[1]; 
	return $lafecha; 
	} 
//////////////////////////////////////////////////////////////////////////////////////////7
// Autor: Javier Prato
// Universidad Bolivariana de Venezuela
// Ejecuta un proceso nuevo, sin poner en pausa el script actual 
// $path, directorio donde se encuentra la imagen ejecutable del proceso.
// $file, nombre del archvo magen ejecutable del proceso.
// regresa: nada
// w_* es para ser usada en windows
// x_* es para ser usada en sitemas unix/linux

function w_ejecutar($path,$file) {
   chdir($path); $call = $path.$file;
   $f=popen('start /b '.$call.'', 'r');
   $read = fread($f, 2096);
   pclose($f);
   return $read;
}

function x_ejecutar($path,$file)
{
   chdir($path); $call = $path.$file;
   $f=popen('start /b '.$call.'', 'r');
   $read = fread($f, 2096);
   pclose($f);
   return $read;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
/* 
Author: Peter Mugane Kionga-Kamau
http://www.pmkmedia.com

Description: string str_makerand(int $minlength, int $maxlength, bool $useupper, bool $usespecial, bool $usenumbers) 
returns a randomly generated string of length between $minlength and $maxlength inclusively.

Notes: 
- If $useupper is true uppercase characters will be used; if false they will be excluded.
- If $usespecial is true special characters will be used; if false they will be excluded.
- If $usenumbers is true numerical characters will be used; if false they will be excluded.
- If $minlength is equal to $maxlength a string of length $maxlength will be returned.
- Not all special characters are included since they could cause parse errors with queries. 

*/
function str_makerand ($minlength, $maxlength, $useupper, $usespecial, $usenumbers)
{

    $charset = "abcdefghijklmnopqrstuvwxyz";
    if ($useupper)   $charset .= "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    if ($usenumbers) $charset .= "0123456789";
    if ($usespecial) $charset .= "~@#$%^()_+-={}][";   // Note: using all special characters this reads: "~!@#$%^&*()_+`-={}|\\]?[\":;'><,./";
    if ($minlength > $maxlength) $length = mt_rand ($maxlength, $minlength);
    else                         $length = mt_rand ($minlength, $maxlength);
    for ($i=0; $i<$length; $i++) $key .= $charset[(mt_rand(0,(strlen($charset)-1)))];
    return $key;
}

/* Calculates the difference for two given dates, and returns the result
 * in specified unit.
 *
 * @param string    Initial date (format: [dd-mm-YYYY hh:mm:ss], hh is in 24hrs format)
 * @param string    Last date (format: [dd-mm-YYYY hh:mm:ss], hh is in 24hrs format)
 * @param char    'd' to obtain results as days, 'h' for hours, 'm' for minutes, 's' for seconds, and 'a' to get an indexed array of days, hours, minutes, and seconds
 *
 * @return mixed    The result in the unit specified (float for all cases, except when unit='a', in which case an indexed array), or null if it could not be obtained
 */
function getDateDifference($dateFrom, $dateTo, $unit = 'd')
{
   $difference = null;
   $dateFromElements = split(' ', $dateFrom);
   $dateToElements = split(' ', $dateTo);
   $dateFromDateElements = split('/', $dateFromElements[0]);
   $dateFromTimeElements = split(':', $dateFromElements[1]);
   $dateToDateElements = split('/', $dateToElements[0]);
   $dateToTimeElements = split(':', $dateToElements[1]);

$dateFromTimeElements[0]= trim($dateFromTimeElements[0])==''?0:$dateFromTimeElements[0];
$dateFromTimeElements[1]= trim($dateFromTimeElements[1])==''?0:$dateFromTimeElements[1];
$dateFromTimeElements[2]= trim($dateFromTimeElements[2])==''?0:$dateFromTimeElements[2];

$dateToTimeElements[0]= trim($dateToTimeElements[0])==''?0:$dateToTimeElements[0];
$dateToTimeElements[1]= trim($dateToTimeElements[1])==''?0:$dateToTimeElements[1];
$dateToTimeElements[2]= trim($dateToTimeElements[2])==''?0:$dateToTimeElements[2];

   $date1 = mktime($dateFromTimeElements[0], $dateFromTimeElements[1], $dateFromTimeElements[2], $dateFromDateElements[1], $dateFromDateElements[0], $dateFromDateElements[2]);
   $date2 = mktime($dateToTimeElements[0], $dateToTimeElements[1], $dateToTimeElements[2], $dateToDateElements[1], $dateToDateElements[0], $dateToDateElements[2]);


   if( $date1 > $date2 )
   {
       return null;
   }

   $diff = $date2 - $date1;

   $days = 0;
   $hours = 0;
   $minutes = 0;
   $seconds = 0;

   if ($diff % 86400 <= 0)  // there are 86,400 seconds in a day
   {
       $days = $diff / 86400;
   }

   if($diff % 86400 > 0)
   {
       $rest = ($diff % 86400);
       $days = ($diff - $rest) / 86400;

       if( $rest % 3600 > 0 )
       {
           $rest1 = ($rest % 3600);
           $hours = ($rest - $rest1) / 3600;

           if( $rest1 % 60 > 0 )
           {
               $rest2 = ($rest1 % 60);
               $minutes = ($rest1 - $rest2) / 60;
               $seconds = $rest2;
           }
           else
           {
               $minutes = $rest1 / 60;
           }
       }
       else
       {
           $hours = $rest / 3600;
       }
   }

   switch($unit)
   {
       case 'd':
       case 'D':

           $partialDays = 0;

           $partialDays += ($seconds / 86400);
           $partialDays += ($minutes / 1440);
           $partialDays += ($hours / 24);

           $difference = $days + $partialDays;

           break;

       case 'h':
       case 'H':

           $partialHours = 0;

           $partialHours += ($seconds / 3600);
           $partialHours += ($minutes / 60);

           $difference = $hours + ($days * 24) + $partialHours;

           break;

       case 'm':
       case 'M':

           $partialMinutes = 0;

           $partialMinutes += ($seconds / 60);

           $difference = $minutes + ($days * 1440) + ($hours * 60) + $partialMinutes;

           break;

       case 's':
       case 'S':

           $difference = $seconds + ($days * 86400) + ($hours * 3600) + ($minutes * 60);

           break;

       case 'a':
       case 'A':

           $difference = array (
               "days" => $days,
               "hours" => $hours,
               "minutes" => $minutes,
               "seconds" => $seconds
           );

           break;
   }

   return $difference;
}

function construir_acceso($ruta,$titulo,$alineacion){
$valor='<tr><td bgcolor=#E6E8FA><div  align="'.$alineacion.'"><a href="'.$ruta.'">'.$titulo.'</a></div></td><td></td><td></td></tr>';
return $valor;
}

function construir_acceso_menu($ruta,$titulo){
$valor='|| <a href="'.$ruta.'">'.$titulo."".'</a>';
return $valor;
}

?>