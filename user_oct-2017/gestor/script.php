<?php
	
// Con esta línea mostramos los posibles errores:
	ini_set("display_errors", "on");

	// ----------------------------------------------

	function conectar_PostgreSQL( $usuario, $pass, $host, $bd )
	{
		$conexion = pg_connect( "user=".$usuario." ".
				  		   "password=".$pass." ".
						   "host=".$host." ".
						   "dbname=".$bd
						  ) or die( "Error al conectar: ".pg_last_error() );

		return $conexion;
	}
	
	
	
	
	
	// ----------------------------------------------
	
	function crear_user( $conexion, $usuario, $pass )
	{
		$sql = "CREATE USER ".$usuario." WITH PASSWORD ".$pass." VALID UNTIL '2005-01-01';";

		// Ejecutamos la consulta (se devolverá true o false):
		return pg_query( $conexion, $sql );
	}

	// ----------------------------------------------
	
	function crear_bd( $conexion, $usuario, $pass, $nombd )
	{
		$sql = "CREATE DATABASE prueba2  WITH OWNER = postgres ENCODING = 'UTF8'
		TABLESPACE = pg_default LC_COLLATE = 'es_ES.UTF-8' LC_CTYPE = 'es_ES.UTF-8'
		CONNECTION LIMIT = -1;";

		// Ejecutamos la consulta (se devolverá true o false):
		return pg_query( $conexion, $sql );
	}

	// ----------------------------------------------

	
	
	
	
	
	

// Conectar (se detendrá la ejecución si se produce un error) - * RELLENA LOS DATOS QUE FALTAN *:
	$conexion = conectar_PostgreSQL( "postgres", "12345", "localhost", "prueba" );


// Crea la base de datos:
	$ok = crear_bd( $conexion, 'postgres', '12345', 'prueba2' );
if( $ok == false )
		echo "Error al crear la base datos.<br/>";
	else
		echo "Base de Datos creada correctamente.<br/>";

?>
