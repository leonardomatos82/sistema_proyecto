<?php
	
	// Con esta línea mostramos los posibles errores:
	ini_set("display_errors", "off");
    // ----------------------------------------------

    $localhost='localhost';
    $bd='club_deportivo';
    $user='postgres';
    $password='12345';
   
   
    $dbconn = pg_connect("
						  host=".$localhost." 	
						  dbname=".$bd." 
						  user=".$user." 
						  password=".$password."")
    or die('No se ha podido conectar: ' . pg_last_error());





?>
