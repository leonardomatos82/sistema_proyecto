<?php
SESSION_START();
?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Crear Usuario</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <!--funcion para combertir minusculas a mayusculas-->
    <script type="text/javascript">
        function upperCase1(){
            var  x=document.getElementById("bd").value
            document.getElementById("bd").value="BD_"+(x.toUpperCase())
        }
          function upperCase2(){
            var  x=document.getElementById("empresa").value
            document.getElementById("empresa").value=(x.toUpperCase())
        }
    </script>
</head>
<body bgcolor=#3a883a>

    <main class="contenedor">

    <form class="formcrearcheque" action="insert_user.php" method="post">
            
            <h1 class="letracabecera">Crear Nuevo usuario al Sistema</h1>
            <?php
                include("conexion.php");
                $sql="SELECT * FROM registro_cheques";
                $consulta=pg_query($sql);
                $nr=pg_num_rows($consulta);
                
      
            ?>
            
            <input class="text" type="text" name="usuario" placeholder="Nombre del Usuario" required autofocus="autofocus"/>
            <input class="text" type="text" name="clave" placeholder="Contraseña del Usuario" required/>
 
             
            <input type="submit"  value="Crear cuenta">
        </form>
    </main>
    
</body>
</html>  
