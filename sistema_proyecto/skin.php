<?
include("config.php");
$result = pg_query($con, "select * from autorizado"); 
$row=pg_fetch_array($result);
$fondo=$row[fondo];      
 //$row[fondo];
$banner='imagenes/baninh.png';
//$row[banner];
$banner2='imagenes/bannertopff.png';
//$row[banner2];
$menu=$row[menu];
?>
