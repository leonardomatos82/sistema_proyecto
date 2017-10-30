<?php
$cedula_alumno=$Sesion[cedula_alumno];

if($cedula_alumno=='12345678')
 $estado='enable';
else
 $estado='disabled'; 

 echo"<SCRIPT LANGUAGE='JavaScript'>
 function confirmar()
 {
  return(confirm('Desea salir de la Sesión'))
 }
 </SCRIPT>"; 
# Barra herramientas
echo"<table border=0 style='border-bottom:1px solid #990000' cellpadding=0 cellspacing=0 bgcolor=#e1e3eb width=770 height=12>
     <tr>
     
     <tr><td>&nbsp;</td>
     <form action=$page method=post><td width=60 align=center>
     <input type=image src=images/actualizar_datos.jpg title='Actualizar datos' $estado><font class=boton color=#990000><br>Actualizar</font></td>
     <input type=hidden name=login_aux value=$miSesion[login]>
     <input type=hidden name=misdatos_usuario value=1>
     </form>
     
     <td>&nbsp;</td>
     <form action=$page method=post><td width=60 align=center>
     <input type=image src=images/login.jpg title='Cambiar tú contraseña'><font class=boton color=#990000><br>Contraseña</font></td>
     <input type=hidden name=actualizar_password value=1>
     </form>
    
     <td>&nbsp;</td>
     <form action=$page method=post><td width=60 align=center>
     <input type=image src=images/inscribir.jpg title='Realizar inscripción'><font class=boton color=#990000><br>Inscripción</font></td>
     <input type=hidden name=inscripcion value=1>
     </form>
     
     <td>&nbsp;</td>
     <form action=$page method=post><td width=60 align=center>
     <input type=image src=images/contactos.jpg title='Contactos'><font class=boton color=#990000><br>Contactos</font></td>
     <input type=hidden name=contactos value=1>
     </form>
     
     <td>&nbsp;</td>
     <form action=$page method=post><td width=60 align=center>
     <input type=image src=images/home.jpg title='Ir a inicio'><font class=boton color=#990000><br>Inicio</font></td>
     </form>
     
     <td>&nbsp;</td>
     <form action=index.php method=post onSubmit='return(confirmar())'><td width=60 align=center>
     <input type=image src=images/exit.jpg title='Cerar la sesión'><font class=boton color=#990000><br>Cerrar</font></td>
     <input type=hidden name=cancelar value=1>
     </form>
    
     <td width=600>&nbsp;</td>
     </tr></table>";
?>