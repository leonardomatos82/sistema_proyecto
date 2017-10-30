<?php
session_start();
include("../config.php");
include("../utils.php");
$desde_dia=$_POST['desde_dia'];
$desde_mes=$_POST['desde_mes'];
$desde_year=$_POST['desde_year'];
$hasta_dia=$_POST['hasta_dia'];
$hasta_mes=$_POST['hasta_mes'];
$hasta_year=$_POST['hasta_year'];
$tipo=$_POST['tipo'];
 /////////////////////////////

$detalle="desde :".$_POST['desde_dia']."-".$_POST['desde_mes']."-".$_POST['desde_year']." hasta:".$_POST['hasta_dia']."-".$_POST['hasta_mes']."-".$_POST['hasta_year']." tipo de reporte: ".$_POST['tipo_reporte']." Fondo: ".$_POST['tipo']."exportar: ".$_POST['exportar'];
//echo $detalle;
$valor="-Operacion: Consultar:  ".$detalle;
 registrarOperacion($con,$_SESSION['login'],$valor); 
      
///////////////////////////////////////////////////////////////////   



              header("Location: ../pdf/rep_asistencia_general_pdf.php?desde_dia=$desde_dia&desde_mes=$desde_mes&desde_year=$desde_year&hasta_dia=$hasta_dia&hasta_mes=$hasta_mes&hasta_year=$hasta_year&tipo=$tipo"); 
          // echo "<p>Usted está autorizado</p>";  //todo esta bien
	 
             
?> 
