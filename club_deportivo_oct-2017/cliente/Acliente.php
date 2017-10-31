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
            
            <h1 class="letracabecera_submenu">Nuevo Cliente</h1>
       
            <input class="letracabecera" type="text" name="nombre" placeholder="Nombre y Apellido" required autofocus="autofocus"/>
            <input class="letracabecera" type="text" name="dni" placeholder="DNI" required />
            <input class="letracabecera" type="text" name="fecha_nac" placeholder="Fecha de Nacimiento" required />
            <input class="letracabecera" type="text" name="telefono_cel" placeholder="Telf. Celular" required />
            <input class="letracabecera" type="text" name="telefono_casa" placeholder="Telf. Casa" required />
            <input class="letracabecera" type="text" name="correo" placeholder="Correo_electronico" required />
            <input class="letracabecera" type="text" name="direccion" placeholder="Dirección Hab" required />
          
           
           
           
           
           
             
            <input type="submit"  value="Registrar">
        </form>
    </main>
    <?php 
            //si no hay nadie logeado no permitira realizar ninguna operacion y lo redirigira al formulario de ingreso
            if($_SESSION["k_username"]==''){
                header ("Location: index.php");
            }

            ?>
</body>
</html>  
