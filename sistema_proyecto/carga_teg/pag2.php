<?php
//include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../barra.php");
include("../validar_campos.php");
$resultpl = pg_query($con, "select * from periodo_lectivo where estado='ACTIVO'"); 
$rowpl=pg_fetch_array($resultpl);
?>
<table width="750" height="80px" border="0" align="center" bgcolor="#FFFFFF">
  <tr  align="center"> 
    <td colspan="2"><strong>


<?
if($_POST['codigo']==""){
echo "Archivo debe tener el ID del TEG";
echo "<p align='center'> <FONT Size='2'> <a href='pag1.php'> <font size='5'> ||Atras|| </font></a> </p>";
die();
}


//tomo el valor de un elemento de tipo texto del formulario

//datos del arhivo
 $nombre_archivo = $_FILES['userfile']['name'];
$tipo_archivo = $_FILES['userfile']['type'];

$tamano_archivo = $_FILES['userfile']['size'];

//compruebo si las características del archivo son las que deseo
if (!((
strpos($tipo_archivo, "pdf") && ($tamano_archivo < 50000000)))) {
    echo "La extensión o el tamaño de los archivos no es correcta. <br><br><table><tr><td>
    <li>Se permite archivo .pdf <br>
    <li>se permiten archivos de 5 Mb máximo.</td></tr></table>";
}else{

$nombre_archivo=$_POST['codigo']."-".$rowpl[periodo].".pdf";
$uploaded_dir = "../carga_teg/TEG/";
if( !file_exists( $uploaded_dir ) ) {
      die( "No existe: $uploaded_dir" );
} 
$path = $uploaded_dir . $nombre_archivo; 
    if (move_uploaded_file($_FILES['userfile']['tmp_name'], $path)){
       echo "El archivo ha sido cargado correctamente.";
    }else{
       echo "Ocurrió algún error al subir el fichero. No pudo guardarse.";
    }
}
?> 
 </strong></td>
 </tr>
        </table>
<p align="center"> <FONT Size=2> <a href="../menu.php"> <font size="5"> ||Atras|| </font></a> </p> 
 <?php
include("../pie.php"); 
 ?>
