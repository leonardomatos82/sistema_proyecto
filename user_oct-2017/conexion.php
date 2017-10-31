<?php
	
	// Con esta línea mostramos los posibles errores:
	ini_set("display_errors", "off");
    // ----------------------------------------------

	function conectar_PostgreSQL( $usuario, $pass, $host )
	{
		$conexion = pg_connect( "user=".$usuario." ".
				  		   "password=".$pass." ".
						   "host=".$host." "
						   
						  ) ;
        return $conexion;
	}
		// ----------------------------------------------
	
	function crear_user( $conexion, $usuario, $pass )
	{
		$sql = "CREATE ROLE ".$usuario." LOGIN
        ENCRYPTED PASSWORD "."md5".$pass."
        SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION;";

		// Ejecutamos la consulta (se devolverá true o false):
		return pg_query( $conexion, $sql );
	}
?>
