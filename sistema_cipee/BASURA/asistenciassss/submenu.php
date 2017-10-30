<ul>
  
							<li><a href="../menu.php">Inicio</a>                        
                      <li><a href="../acceso/menu_acceso.php">Claves</a>  
                      <li><a href="../asistencia/menu_asistencia.php">Asistencias</a> 
                     
                      
                     <li><a href="../usuario/menu_usuario.php">Usuarios</a>
                     
                     <li><a href="../consulta/menu_consulta.php">Consultas</a>
                       <?  if ($_SESSION[tipo]=='A' or $_SESSION[tipo]=='S'){ ?>
                      <li><a href="../direccion/menu_direccion.php">Coordinaciones</a><?}?>
                     <li><a href="../control/desconectar.php">Salir</a>

  
              </ul>