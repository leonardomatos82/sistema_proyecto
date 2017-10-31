<?php
SESSION_START();
?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Crear Cheque</title>
    <link rel="stylesheet" type="text/css" href="../css/form_submenu.css">
    <!--funcion para combertir minusculas a mayusculas-->
    <script type="text/javascript">
        function upperCase(){
            var  x=document.getElementById("nombre").value
            document.getElementById("nombre").value=x.toUpperCase()
        }
    </script>
</head>
<body bgcolor=#3a883a>

    <main class="contenedor">

    <form class="formulario" action="validar_registro_cheque.php" method="post">
            
            <h1 class="letracabecera_submenu">Nuevo Registro: Actividad</h1>
       
            <input class="letracabecera" type="text" name="descripcion" placeholder="Descripción de Actividad" required autofocus="autofocus"/>
            <input class="letracabecera" type="text" name="horario" placeholder="Horario" required />
            <input class="letracabecera" type="text" name="costo" placeholder="Costo de la Actividad" required />
            <input class="letracabecera" type="text" name="fecha_inicio" placeholder="Fecha de Inicio" required />
            <input class="letracabecera" type="text" name="fecha_fin" placeholder="Fecha de Finalización" required />

          
           
           
     
             
            <input type="submit"  value="Registrar">
        </form>
    </main>

</body>
</html>  
