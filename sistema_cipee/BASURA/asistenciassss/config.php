<?php
    $host = "localhost"; //Host base de datos
	$user = "leonardo"; // Usuario nase de datos
	$pass = "12345"; // Contrase�a Base de datos
	$db   = "talentohumano"; // Nombre base de datos
/// No tocar -----------------------------------------
     $con = pg_pconnect("host=$host dbname=$db user=$user password=$pass") 
     or die ("No se pudo conectar a PostgreSQL --> " . pg_last_error($con));
/// Script que adapta la web a la resolucion de pantalla
?>