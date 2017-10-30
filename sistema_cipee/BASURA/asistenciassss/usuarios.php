<?
function users()
{
// este es el tiempo que un usuario figura como activo (por defecto 10 minutos)
$tiempo_activo = 50;
$fichero = "usuarios.txt";
$array = file($fichero);

// captura la ip
if (getenv(HTTP_X_FORWARDED_FOR))
{
$ip=getenv(HTTP_X_FORWARDED_FOR);
}
else
{
$ip=getenv(REMOTE_ADDR);
}

$tiempo = time() + $tiempo_activo;

for($conta = 0, $found = 0; $conta < count($array); $conta++)
{
$datos = explode(":",$array[$conta]);

if( $datos[0] != $ip && $datos[1] > time()) $insert .= $datos[0] . ":" . $datos[1] . "\r\n";
else { if($datos[0] == $ip)$found++; }
}

if($found <= 1) $insert .= $ip . ":" . $tiempo;
$fptr = fopen($fichero,"w+");
fwrite($fptr,$insert);
fclose($fptr);

$array = file($fichero);

return(count($array));
}
?>