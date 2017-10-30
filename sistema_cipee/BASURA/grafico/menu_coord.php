<?php
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
     <input type=image src=images/actualizar_datos.jpg title='Actualizar datos' disabled><font class=boton color=#990000><br>Actualizar</font></td>
     <input type=hidden name=login_aux value=$miSesion[login]>
     <input type=hidden name=misdatos_usuario value=1>
     </form>
     
     <td>&nbsp;</td>
     <form action=$page method=post><td width=60 align=center>
     <input type=image src=images/login.jpg title='Cambiar contraseña'><font class=boton color=#990000><br>Contraseña</font></td>
     <input type=hidden name=actualizar_password value=1>
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
    
     <td width=2><img src=images/separador3.jpg></td>
     
     <td>&nbsp;</td>
     <form action=$page method=post><td width=60 align=center>
     <input type=image src=images/actualizar_datos2.jpg title='Actualizar dotos Estudiantes'><font class=boton color=#990000><br>Actualizar</font></td>
     <input type=hidden name=actualizar_datos_alumno value=1>
     </form>
    
     <td>&nbsp;</td>
     <form action=$page method=post><td width=60 align=center>
     <input type=image src=images/logins.jpg title='Cambiar contraseñas a estudientes'><font class=boton color=#990000><br>Contraseñas</font></td>
     <input type=hidden name=actualizar_password_alumno value=1>
     </form>
    
     <td>&nbsp;</td>
     <form action=$page method=post><td width=60 align=center>
     <input type=image src=images/documentos.jpg title='Realizar inscripción'><font class=boton color=#990000><br>Documentos</font></td>
     <input type=hidden name=documentos value=1>
     </form>
    
    
     <td width=600>&nbsp;</td>
     </tr></table>";
?>