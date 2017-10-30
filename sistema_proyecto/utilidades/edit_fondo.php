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
   
if($_POST[fondo]=="")
		{
		echo"<b>Mensaje: </b>".Todos_los_campos_son_obligatorios."<br><br>"; 
       	}
	  else 
	   {
	   $sql = "UPDATE autorizado SET
 fondo='$_POST[fondo]'";
   
	   if (!pg_query($con,$sql)) { die('Error:hhtt ' . pg_result_error()); } 

 echo " Fondo  Modificado";
            /////////////////////////////
$valor="-Operacion: Cambiar Fondo de sistema -".$_POST[fondo];
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
