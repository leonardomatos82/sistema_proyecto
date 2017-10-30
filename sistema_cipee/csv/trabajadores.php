<?php

/* Código que lee un archivo .csv con datos, para luego insertarse en una base de datos, vía MySQL
*  Gracias a JoG
*  http://gualinx.wordpress.com
*/   



function Conectarse() //Función para conectarse a la BD
{
   $host = "localhost"; //Host base de datos
	$user = "leonardo"; // Usuario base de datos
	$pass = "12345"; // Contrase�a Base de datos
	$db   = "cipee"; // Nombre base de datos
   
   $con = pg_pconnect("host=$host dbname=$db user=$user password=$pass") 
   or die ("No se pudo conectar a PostgreSQL --> " . pg_last_error($con));
}

$row = 1;
$handle = fopen("datos2.csv", "r"); //Coloca el nombre de tu archivo .csv que contiene los datos
 
while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) { //Lee toda una linea completa, e ingresa los datos en el array 'data'
 
 $num = count($data); //Cuenta cuantos campos contiene la linea (el array 'data')
    $row++;
    $cadena = "INSERT INTO datos(
            cedula, nombre, titulo,periodo,ciudad_r, estado_r) Values ("; //Cambia los valores 'CampoX' por el nombre de tus campos de tu tabla y colócales los necesarios
$cont=1;    
for ($c=0; $c < $num; $c++) { //Aquí va colocando los campos en la cadena, si aun no es el último campo, le agrega la coma (,) para separar los datos
 


              
        if ($c==($num-1)){
           if (is_numeric($data[$c]))
			if ($c==6){
                           $cadena = $cadena."'".$data[$c] ."'"; }else{
  
                   $cadena = $cadena."'".$data[$c] . "'";}
                   else  
                   $cadena = $cadena."'".$data[$c] . "'"; 
           
              }
        else
        {
        
         if (is_numeric($data[$c]))
             if ($c==6){
                   $cadena = $cadena."'".$data[$c] . "',";  }else{

               $cadena = $cadena."'".$data[$c] . "',";}
                   else  
                   $cadena = $cadena."'".$data[$c] . "',"; 
        }
    }


    $cadena = $cadena.");"; //Termina de armar la cadena para poder ser ejecutada

  echo $cadena."<br>";  //Muestra la cadena para ejecutarse
  
     $enlace=Conectarse();
     //$result=pgsql_query($enlace,$cadena); //Aquí está la clave, se ejecuta con MySQL la cadena del insert formada
    // pgsql_close($enlace);
}

fclose($handle);

?>

