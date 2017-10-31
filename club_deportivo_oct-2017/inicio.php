<?php
SESSION_START();

?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Inicio</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<body>
    
    <header>
       
        <div class="caja21">

               




            </div>
        <nav class="menu">
            <ul>
                <li><a href="inicio.php">Inicio</a></li>
                <li><a href="cliente/Acliente.php" target="centro">Crear</a></li>
                <li><a href="actividad/Aactividad.php" target="centro">Buscar</a></li>
                <li><a href="inscripcion/Ainscripcion.php" target="centro">Todos</a></li>
                <li><a href="estatus2.php" target="centro">Estatus</a></li>
                <li><a href="salir.php">Salir</a></li>
                <a href="salir.php"><?php echo $_SESSION['k_username'];?><img src="img/user.png" width="5%" height="5%"></a>
            </ul>


        </nav>

<?php include("menu.php"); ?>
    </header>

        <iframe   scrolling="yes" frameborder="0" name="centro" src="centro.html" width="100%" height="680px"></iframe>


    <footer>
	</footer>
       


</body>
</html>  
