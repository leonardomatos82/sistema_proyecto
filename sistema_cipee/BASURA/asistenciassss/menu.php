<?php 
session_start();
include("control/valida.php"); 
include("config.php");
include("utils.php");

include("style.php"); 
include("tabla.php"); 
$query2="SELECT * FROM tareas";
$result2=pg_query($con,$query2);
?>

 <tr>
  <tr><td></td>
    
     <td></td></tr>
 <td bgcolor="#FFFFFF"><b>MENU PRINCIPAL </b><link rel="stylesheet" type="text/css" href="estilos.css">
   <div id="vertical">
  
              <ul>
                      <li><a href="acceso/menu_acceso.php">Claves</a>  
                      <li><a href="asistencia/menu_asistencia.php">Asistencias</a> 
                      
                 
                      <li><a href="usuario/menu_usuario.php">Usuarios</a>
                      <?  if ($_SESSION[tipo]=='A' or $_SESSION[tipo]=='S'){ ?><li><a href="partida/menu_partida.php">Partidas</a><?}?>
                      <li><a href="consulta/menu_consulta.php">Consultas</a>
                     <?  if ($_SESSION[tipo]=='A' or $_SESSION[tipo]=='S'){ ?><li><a href="direccion/menu_direccion.php">Coordinaciones</a><?}?>
       
                      <li><a href="control/desconectar.php">Salir</a>
              </ul>
  
      </div></td>
      <td>
      <strong><div align="left"><font  size="5"></a></font></div> <div align="right"><font color="navy">Bienvenido(a) :<? $cadena=strtoupper($_SESSION[nomb_usuario]);?><? echo $cadena; ?></font></div></strong>
     <div align="left"><font size="2">Nota: Este sistema se encuentra en constantes modificaciones con el fin de mejorar tanto los procesos administrativos como la intefaz grafica. Pedimos disculpas por inconvenientes ocasionados. La Coordinacion de Informatica, Sede Barinas-Portuguesa.</font> </div> 
      <div align="<?echo $alight; ?>"><span class="style2"><img src="<?echo $imagen_menu; ?>"  width="<?echo $with_menu; ?>" height="<?echo $height_menu; ?>" /></span></div></td>

  
</tr>
    <tr><td></td>
    
     <td></td></tr>
    <tr><td></td>
    <td><div align="center"><span class="style3">Software Libre distribuido bajo licencia GNU/GPL. Versi&oacute;n 
        1.0 </span></div>      
        </td>
        </tr> 
     <tr>
     
    <td bgcolor="#FFFFFF"><b>UTILIDADES </b><link rel="stylesheet" type="text/css" href="estilos.css">
   <div id="vertical">
  
              <ul>    <li>  
              
                            
                       <li><a href="configuracion/Atarea.php">Enviar Sugerencia</a>  
                      
                      <li><a href="manual/MANUAL_cheques_def.doc">Ver Manual de Usuario</a> 
                      <li><a href="manual/ayuda.php">Ver archivo de ayuda</a>  
                     
              </ul>
    <td>
 <div align="left">SUGERENCIAS ENVIADAS:
 <? 
 while ($row2 = pg_fetch_row($result2)){
 echo "<div align=left>";  
 echo "<img src=imagenes/tick.png>";
 echo $row2['1'];
 }?>
 </div> 
 </td>
 </tr>
 <td>Actualmente hay:
<? include("usuarios.php");
echo users(); 
?>
usuario(s) Conectado(s). </td>

<? include("pie.php"); ?>