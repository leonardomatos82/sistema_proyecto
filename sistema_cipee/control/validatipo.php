<?php
// Inicio la sesión
session_start();
header("Cache-control: private"); // Arregla IE 6

       if ( $_SESSION['estado'] == "logeado" ) {
         if ( $_SESSION['tipo'] == "U" ) 
         {  
         header("Location: index.php");   
          
          echo "<html></html>";
        }
     
          // echo "<p>Usted está autorizado</p>";  //todo esta bien
     
        } else {
  // echo "index.php";
         header("Location: ../index.php");   
          
          echo "<html></html>";
        }
   
?> 