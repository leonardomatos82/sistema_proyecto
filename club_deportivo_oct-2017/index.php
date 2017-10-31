<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ingreso al Sistema</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link href='css/fonts.css?family=Source+Sans+Pro:600italic' rel='stylesheet' type='text/css'>
</head>
<body>
   <div id="contenido">
        <form action="validar_usuario.php" method="post">
           
          
             <h1 class="letracabecera"><img src="img/logoppal.png" width="50%" height="50%"></h1>
              <h1 class="letracabecera">Ingresar al Sistema</h1>
            <input type="text" name="usuario" id="usuario" size="15" maxlength="50" placeholder="Usuario" required />
                    <input name="clave" type="password" id="clave" size="10" maxlength="50" placeholder="Contraseña" required />
             
            <input type="submit"  value="ingresar">
        </form>
    </div>
    
</body>
</html>
