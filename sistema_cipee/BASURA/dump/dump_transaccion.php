<?php 
include("../config.php");



echo "<font size=1>/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////</font><br>";  
echo "<font size=1>//		CODIGO PARA GENERAR RESPALDO DE LA ESTRUCTURA DE LA BASE DE DATOS Y LA INFORMACION ///</font><br>"; 
echo "<font size=1>//		ARCHIVO COMPATIBLE CON POSTGRESQL 8.4															 ////</font><br>"; 
echo "<font size=1>//		COORDINACION DE INFORMATICA - BARINAS 		 														///</font><br>"; 
echo "<font size=1>//		AUTOR: LEONARDO MATOS   																			 ////</font><br>"; 
echo "<font size=1>//		ARCHIVO/GUARDAR COMO/ARCHIVO.TXT (GUARDE CON LA EXTENSION .TXT)						 ////</font><br>"; 

echo "<font size=1>///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////</font><br>"; 

//GENERANDO EL SCRPT DE LA ESTRUCTURA

$tabla[1]="transaccion";



for($x=1; $x<=1; $x=$x+1)
{
$resulta[$x]=pg_query($con,"SELECT * 
 FROM $tabla[$x]");

////////////////////////////////////////////////////////////////////////////////////////////////////////
//GENERANDO EL SCRIPT DE LOS INSERT

 while ($row = pg_fetch_row($resulta[$x])){  
 $resultb[$x]=pg_query($con,"SELECT * FROM information_schema.columns WHERE table_name =  '$tabla[$x]'");
 $c=0;
 $d=0;
  $campos="";
 $valor="";
 
 while ($arr = pg_fetch_row($resultb[$x])){  
 $c++;
 $d=$c-1;

 if($arr[7]=="integer")
$ap="";
else
$ap="'";

if ($c>1){
$campos=$campos.",".$arr[3];
$valor=$valor.",".$ap.$row[$d].$ap;
 }else{
 $campos=$arr[3];
 $valor=$ap.$row[$d].$ap;
 }
 } 
//echo $valor;

echo "<font size=1>INSERT INTO ";
echo $tabla[$x];

 echo " (".$campos.")";
echo " VALUES";
  echo " (".$valor.");";
echo "</font><br>";         
    }
      
            }
            


?>



 
