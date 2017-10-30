<?php
include("../control/valida.php"); 
include("../css.php");
include("../config.php");
?>

<tr>
<td bgcolor="#FFFFFF"><b>MENU PRINCIPAL </b><link rel="stylesheet" type="text/css" href="../estilos.css">
   <div id="vertical">
  
              <?php include("../submenu.php");?>
<td bgcolor="#FFFFFF"><b>SUBMENU ASISTENCIAS </b><link rel="stylesheet" type="text/css" href="../estilos.css">
   <div id="vertical">
  
              <ul>
  
                      <li><a href="Aasistencia.php">Agregar Asistencia</a>  
                      <li><a href="ver_asistencia.php">Modificar Asistencia</a> 
                      <li><a href=".php">Eliminar Asistencia</a>  
                      					 
              </ul>
  
    <td><div align="<?echo $alight; ?>"><span class="style2"><img src="../<?echo $imagen_menu11; ?>"  width="<?echo $with_submenu; ?>" height="<?echo $height_submenu; ?>" /></span></div>
    <div align="center"><span class="style3">Software Libre distribuido bajo licencia GNU/GPL. Versi&oacute;n 
        1.0 </span></div>
    </td>
    <td></td></tr>
    <tr><td></td>
    <td></td>
    <td></td>
     
   </tr>  
 
<tr>
 <td>&nbsp;</td>
<td>&nbsp;</td>
 </tr> <tr>
 <td>&nbsp;</td>
<td>&nbsp;</td>
 </tr>  
<? include("../pie.php"); ?>

