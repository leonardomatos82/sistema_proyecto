<?php
 session_start();
include("../control/valida.php"); 
include("../css.php");
include("../config.php");
//include("../utils.php");

?> 
<table width="824" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2">&nbsp;</td>
    <td width="77">&nbsp;</td>
  </tr>
  <tr>
    <td width="149">&nbsp;</td>
    <td width="584">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="88"><p align="right">&nbsp;</p>
        <p align="right">&nbsp;</p></td>
    <td><form style="width: 615px;" action="menu_direccion.php";" method="post">
      <p align="left"><br />
          <?php
		  if($_POST[nomb_direccion]=="")
		{
		echo"<b>Mensaje: </b>".Todos_los_campos_son_obligatorios."<br><br>";
		
    	}
	  else 
	   {
       $sql="INSERT INTO departamento (nombre_departamento) 
       VALUES ('$_POST[nomb_direccion]')"; 
       if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); } 
       
       echo "1 Registro  agregado";
	   	    /////////////////////////////
$valor="-Operacion: Agregar -Acceso: departamento -Registro Usuario: ";
        registrarOperacion($con,$_SESSION['login'],$valor);      
///////////////////////////////////////////////////////////////////  
           
        }
 pg_close($con)
?>
      </p>
      <p align="left">
        <input name="submit2" type="submit" value="Volver" />
      </p>
    </form></td>
    <td>&nbsp;</td>
  </tr>

</table>
 <?php
include("../pie.php"); 
 ?>

