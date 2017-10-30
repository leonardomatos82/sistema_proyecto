<?php
// Inicio la sesión
session_start();
header("Cache-control: private"); // Arregla IE 6

       if ( $_SESSION['estado'] == "logeado" ) {
             
          header("Location: ../menu.php"); 
     
        } else {
  // echo "index.php";
         header("Location: ../index.php");   
          
          echo "<html></html>";
        }
   
?>