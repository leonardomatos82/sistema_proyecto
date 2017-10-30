<?php
// Inicio la sesión
include("../config.php");
include("../utils.php");
include("../la_ip.php");
session_start();
header("Cache-control: private"); // Arregla IE 6
  /////////////////////////////
$valor="-Operacion: Salir del sistema";
        registrarOperacion($con,$_SESSION['login'],$valor,$_SESSION['ip']);      
///////////////////////////////////////////////////////////////////  
 // descoloco todas la variables de la sesión
 session_unset();

 // Destruyo la sesión
 session_destroy();
 
 //Y me voy al inicio
 header("Location: ../index.php");
     echo "<html></html>";
   exit;
?> 
