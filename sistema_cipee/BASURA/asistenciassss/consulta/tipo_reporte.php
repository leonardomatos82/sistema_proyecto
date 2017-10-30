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
$exportar=$_POST['exportar'];
 /////////////////////////////

$detalle="desde :".$_POST['desde_dia']."-".$_POST['desde_mes']."-".$_POST['desde_year']." hasta:".$_POST['hasta_dia']."-".$_POST['hasta_mes']."-".$_POST['hasta_year']." tipo de reporte: ".$_POST['tipo_reporte']." Fondo: ".$_POST['tipo']."exportar: ".$_POST['exportar'];
//echo $detalle;
$valor="-Operacion: Consultar:  ".$detalle;
 registrarOperacion($con,$_SESSION['login'],$valor); 
      
///////////////////////////////////////////////////////////////////   

if ( $_POST['exportar'] == "0" ) {
if ( $_POST['tipo_reporte'] == "09" ) {
              header("Location: ../grafico/ver_grafico_inscripcion.php?desde_dia=$desde_dia&desde_mes=$desde_mes&desde_year=$desde_year&hasta_dia=$hasta_dia&hasta_mes=$hasta_mes&hasta_year=$hasta_year&tipo=$tipo"); 
          // echo "<p>Usted está autorizado</p>";  //todo esta bien
     
        } else {
if ( $_POST['tipo_reporte'] == "01" ) {
              header("Location: ver_rep_relacion.php?desde_dia=$desde_dia&desde_mes=$desde_mes&desde_year=$desde_year&hasta_dia=$hasta_dia&hasta_mes=$hasta_mes&hasta_year=$hasta_year&tipo=$tipo"); 
          // echo "<p>Usted está autorizado</p>";  //todo esta bien
     
        } else {
			if ( $_POST['tipo_reporte'] == "02" ) {
  header("Location: ver_rep_anulados2.php?desde_dia=$desde_dia&desde_mes=$desde_mes&desde_year=$desde_year&hasta_dia=$hasta_dia&hasta_mes=$hasta_mes&hasta_year=$hasta_year&tipo=$tipo"); 
           // echo "<p>Usted está autorizado</p>";  //todo esta bien
     
        } else {
			if ( $_POST['tipo_reporte'] == "03" ) {
 header("Location: ver_rep_banco.php?desde_dia=$desde_dia&desde_mes=$desde_mes&desde_year=$desde_year&hasta_dia=$hasta_dia&hasta_mes=$hasta_mes&hasta_year=$hasta_year&tipo=$tipo"); 
           // echo "<p>Usted está autorizado</p>";  //todo esta bien
     
        } else {
			if ( $_POST['tipo_reporte'] == "04" ) {
 header("Location: ver_rep_gastos.php?desde_dia=$desde_dia&desde_mes=$desde_mes&desde_year=$desde_year&hasta_dia=$hasta_dia&hasta_mes=$hasta_mes&hasta_year=$hasta_year&tipo=$tipo"); 
           // echo "<p>Usted está autorizado</p>";  //todo esta bien
     } else {
			if ( $_POST['tipo_reporte'] == "05" ) {
 header("Location: ver_rep_compras.php?desde_dia=$desde_dia&desde_mes=$desde_mes&desde_year=$desde_year&hasta_dia=$hasta_dia&hasta_mes=$hasta_mes&hasta_year=$hasta_year&tipo=$tipo"); 
           // echo "<p>Usted está autorizado</p>";  //todo esta bien
         } else {
			if ( $_POST['tipo_reporte'] == "06" ) {
 header("Location: ver_rep_relacion_ret_iva.php?desde_dia=$desde_dia&desde_mes=$desde_mes&desde_year=$desde_year&hasta_dia=$hasta_dia&hasta_mes=$hasta_mes&hasta_year=$hasta_year&tipo=$tipo"); 
           // echo "<p>Usted está autorizado</p>";  //todo esta bien
     
	     } else {
			if ( $_POST['tipo_reporte'] == "07" ) {
 header("Location: ver_rep_relacion_ret_isrl.php?desde_dia=$desde_dia&desde_mes=$desde_mes&desde_year=$desde_year&hasta_dia=$hasta_dia&hasta_mes=$hasta_mes&hasta_year=$hasta_year&tipo=$tipo"); 
           // echo "<p>Usted está autorizado</p>";  //todo esta bien
     
         } else {
			if ( $_POST['tipo_reporte'] == "08" ) {
 header("Location: ver_rep_partidag.php?desde_dia=$desde_dia&desde_mes=$desde_mes&desde_year=$desde_year&hasta_dia=$hasta_dia&hasta_mes=$hasta_mes&hasta_year=$hasta_year&tipo=$tipo"); 
           // echo "<p>Usted está autorizado</p>";  //todo esta bien
     
	 }else{
	 if ( $_POST['tipo_reporte'] == "10" ) {
              header("Location: ../grafico/ver_grafico_cant_cheques.php?desde_dia=$desde_dia&desde_mes=$desde_mes&desde_year=$desde_year&hasta_dia=$hasta_dia&hasta_mes=$hasta_mes&hasta_year=$hasta_year&tipo=$tipo"); 
          // echo "<p>Usted está autorizado</p>";  //todo esta bien
      }else{
	 if ( $_POST['tipo_reporte'] == "11" ) {
              header("Location: ver_rep_relacioncc.php?desde_dia=$desde_dia&desde_mes=$desde_mes&desde_year=$desde_year&hasta_dia=$hasta_dia&hasta_mes=$hasta_mes&hasta_year=$hasta_year&tipo=$tipo"); 
          // echo "<p>Usted está autorizado</p>";  //todo esta bien
          }else{
	 if ( $_POST['tipo_reporte'] == "12" ) {
              header("Location: ver_rep_rendicioncc.php?desde_dia=$desde_dia&desde_mes=$desde_mes&desde_year=$desde_year&hasta_dia=$hasta_dia&hasta_mes=$hasta_mes&hasta_year=$hasta_year&tipo=$tipo"); 
          // echo "<p>Usted está autorizado</p>";  //todo esta bien
          }else{
	 if ( $_POST['tipo_reporte'] == "13" ) {
    header("Location: ver_rep_partidac.php?desde_dia=$desde_dia&desde_mes=$desde_mes&desde_year=$desde_year&hasta_dia=$hasta_dia&hasta_mes=$hasta_mes&hasta_year=$hasta_year&tipo=$tipo"); 
           // echo "<p>Usted está autorizado</p>";  //todo esta bien       
      

       }
          }
        }         
        }
		
          }   
        }
        }
		}
        }
		 
        } 
		}
        }
		}
}

else{
	if ( $_POST['exportar'] == "01" ) {
     	$archivo="XLS";	
       if ( $_POST['tipo_reporte'] == "06" ) {
          header("Location: excel_ret_iva2.php?desde_dia=$desde_dia&desde_mes=$desde_mes&desde_year=$desde_year&hasta_dia=$hasta_dia&hasta_mes=$hasta_mes&hasta_year=$hasta_year&tipo=$tipo&archivo=$archivo"); 
              
	     }else{
          if ( $_POST['tipo_reporte'] == "01" ) {
          header("Location: excel_relacion.php?desde_dia=$desde_dia&desde_mes=$desde_mes&desde_year=$desde_year&hasta_dia=$hasta_dia&hasta_mes=$hasta_mes&hasta_year=$hasta_year&tipo=$tipo&archivo=$archivo"); 
         }
		 else{
          if ( $_POST['tipo_reporte'] == "02" ) {
          header("Location: excel_anulados.php?desde_dia=$desde_dia&desde_mes=$desde_mes&desde_year=$desde_year&hasta_dia=$hasta_dia&hasta_mes=$hasta_mes&hasta_year=$hasta_year&tipo=$tipo&archivo=$archivo"); 
              
	     }else{
	     	 if ( $_POST['tipo_reporte'] == "14" ) {
    header("Location: excel_test.php?desde_dia=$desde_dia&desde_mes=$desde_mes&desde_year=$desde_year&hasta_dia=$hasta_dia&hasta_mes=$hasta_mes&hasta_year=$hasta_year&tipo=$tipo&archivo=$archivo"); 
           // echo "<p>Usted está autorizado</p>";  //todo esta bien}
}    
		 }     
	     }
}	
}	 
              
?> 