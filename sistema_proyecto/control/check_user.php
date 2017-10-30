<?php
session_start();
header("Cache-control: private"); // Arregla IE 6
       if ( $_SESSION['estado_proyecto'] == "logeado" ) {
         if ( $_SESSION['tipo'] == "A" ) 
         {}
          else 
	 {
          include("../config.php");
          include("css2.php"); die();
          }
                                                }
?>
