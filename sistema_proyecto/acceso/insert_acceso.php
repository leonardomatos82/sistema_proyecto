<?php
 session_start();
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../utils.php");

include("../barra.php");

?> 
<table width="750" border="0" align="center" bgcolor="#FFFFFF">
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
    <td><form style="width: 615px;" action="../menu.php";" method="post">
      <p align="left"><br />
          <?php
if($_POST[login]=="" || $_POST[clave]=="" || $_POST[tipo]=="" || $_POST[nomb_usuario]=="")
		{
		echo"<b>Mensaje: </b>".Todos_los_campos_son_obligatorios."<br><br>";
		
    	}
	  else 
	   {
	   $estado='ACTIVO';
       $_POST[clave]=sha1($_POST[clave]);
       $sql="INSERT INTO acceso (login,clave,tipo,nomb_usuario,estado) 
       VALUES ('$_POST[login]','$_POST[clave]','$_POST[tipo]','$_POST[nomb_usuario]','$estado')"; 
       if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); } 
       
       echo "1 Registro Agregado";
	   	    /////////////////////////////
$valor="-Operacion: Agregar -Acceso: -Registro Usuario: ".$_POST[login];
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
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>

</table>

  <?php
include("../pie.php"); 
 ?>

