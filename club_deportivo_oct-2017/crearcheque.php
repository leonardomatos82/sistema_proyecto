<?php
SESSION_START();
?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Crear Cheque</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
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

    <form class="formcrearcheque" action="validar_registro_cheque.php" method="post">
            
            <h1 class="letracabecera">Crear Cheque Nuevo</h1>
       
            <input class="num_cheque" type="text" name="numero_cheque" placeholder="N° de Cheque" required autofocus="autofocus"/>
            <input class="monto" type="text" name="monto" placeholder="Monto en Numeros" required/>
            <input type="text" name="nombre" id="nombre" onblur="upperCase()" placeholder="Paguese a la orden de:" required />
            <input class="cantidad" type="text" name="cantidad" placeholder="monto en letras" required value="Bolivares con /100 Centimos"/>
                <input class="fecha" type="date" name="fecha" step="3" min="2016-01-01" max="2017-12-31" value="<?php echo date("Y-m-d");?>" readonly="readonly"/>
                <select name="mes"  required />
                    <option>Elegir Mes</option>
                    <option>Enero</option>
                    <option>Febrero</option>
                    <option>Marzo</option>
                    <option>Abril</option>
                    <option>Mayo</option>
                    <option>Junio</option>
                    <option>Julio</option>
                    <option>Agosto</option>
                    <option>Septiembre</option>
                    <option>Otubre</option>
                    <option>Noviembre</option>
                    <option>Diciembre</option>
                </select>
                <select name="dia"  required />
                    <option>Elegir dia</option>
                    <option>1</option><option>2</option><option>3</option>
                    <option>4</option><option>5</option><option>6</option>
                    <option>7</option><option>8</option><option>9</option>
                    <option>10</option><option>11</option><option>12</option>
                    <option>13</option><option>14</option><option>15</option>
                    <option>16</option><option>17</option><option>18</option>
                    <option>19</option><option>20</option><option>21</option>
                    <option>22</option><option>23</option><option>24</option>
                    <option>25</option><option>26</option><option>27</option>
                    <option>28</option><option>29</option><option>30</option><option>31</option>
                    
                </select>
                <select name="ano"  required /><option>Elegir tipo de año</option><option>16</option><option>2016</option></select>
                <select class="endoso" name="endoso" /><option>Elegir tipo de Endoso</option><option>** ENDOSABLE **</option><option>** NO ENDOSABLE **</option></select>
                <input type="text" name="usuarioregistro"  value="<? echo $_SESSION["k_username"] ?>" required readonly="readonly"/>
            
            
             
            <input type="submit"  value="Enviar">
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
