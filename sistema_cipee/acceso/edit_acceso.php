<?php
 session_start();
include("../control/valida.php"); 
include("../css.php");
include("../config.php");
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
   
if($_POST[clave]=="" || $_POST[login]=="" )
		{
		echo"<b>Mensaje: </b>".Todos_los_campos_son_obligatorios."<br><br>"; 
       	}
	  else 
	   {
	 
 $sql = "UPDATE acceso SET login='$_POST[login]',clave='$_POST[clave]',tipo='$_POST[tipo]' WHERE id_acceso='$_POST[id]'";
            
       if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); } 
       
       echo "Clave modificada con exito";
	    /////////////////////////////
$valor="-Operacion: Modificar -Acceso:  -Registro ID: ".$_POST[id];
  registrarOperacion($con,$_SESSION['login'],$valor);      
///////////////////////////////////////////////////////////////////  
        }
 pg_close($con);
?>
      </p>
      <p align="left">
        <input name="submit" type="submit" value="Volver" />
      </p>
    </form></td>
    <td>&nbsp;</td>
  </tr>
    </tr>
</table>
<? include("../pie.php"); ?>