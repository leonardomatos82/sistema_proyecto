<?php
include("../control/valida.php"); 
include("../css.php");
include("../config.php");
//include("../utils.php");
 session_start();
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
       $sql = "DELETE FROM departamento WHERE departamento.id_departamento='$_POST[id]'";
       if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); } 
       echo "1 Registro  Eliminado";
	     /////////////////////////////
$valor="-Operacion: Eliminar -Tabla: departamento -Registro ID: ".$_POST[id];
        registrarOperacion($con,$_SESSION['login'],$valor);      
///////////////////////////////////////////////////////////////////  
  pg_close($con);
?>
      </p>
      <p align="left">
        <input name="submit" type="submit" value="Volver" />
      </p>
    </form></td>
    <td>&nbsp;</td>
  </tr>

</table>
 <?php
include("../pie.php"); 
 ?>