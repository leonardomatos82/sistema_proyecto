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
            
            <h1 class="letracabecera_submenu">Nuevo Registro: Inscripción</h1>
       
            <input class="letracabecera" type="text" name="fecha" placeholder="Fecha de Registro" required autofocus="autofocus" value="<?php echo date('d/m/Y');?>"/>
             <select class="letracabecera" name="Cliente"  required />
                    <option>Elegir Cliente</option>
                    <option>Pedro Perez</option><option>2</option><option>3</option>
                    <option>4</option><option>5</option><option>6</option>

                    
                </select>
             <select class="letracabecera" name="Actividad"  required />
                    <option>Elegir Actividad</option>
                    <option>Futbol</option><option>2</option><option>3</option>
                    <option>4</option><option>5</option><option>6</option>

                    
                </select>
            
                     
     
             
            <input type="submit"  value="Registrar">
        </form>
    </main>

</body>
</html>  
