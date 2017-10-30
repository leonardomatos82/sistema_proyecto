<?php
    $host = "localhost"; //Host base de datos
	$user = "leonardo"; // Usuario base de datos
	$pass = "12345"; // Contrase�a Base de datos
	$db   = "sistema_proyecto"; // Nombre base de datos
/// No tocar -----------------------------------------
     $con = pg_pconnect("host=$host dbname=$db user=$user password=$pass") 
     or die ("No se pudo conectar a la Base de Datos --> " . pg_last_error($con));

?>
