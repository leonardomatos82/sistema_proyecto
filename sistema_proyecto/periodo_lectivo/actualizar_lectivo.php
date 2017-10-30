<?php 
session_start();
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php"); 
include("../barra.php");
include("../utils.php");
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
if($_POST[periodo]=="")
		{
		
		echo"<b>Mensaje: </b>".Los_campos_son_obligatorios."<br><br>";
		
    	}
	  else 
	   {
	
	    $sql0="UPDATE periodo_lectivo set estado='$_POST[proceso]',proceso='$_POST[proceso]' where periodo='$_POST[periodo]'"; 
       if (!pg_query($con,$sql0)) { die('Error: ' . pg_result_error()); } 


	  
       
       echo "Periodo Lectivo ".$_POST[periodo]." actualizado.";
	   	    /////////////////////////////
$valor="Operacion: actualizar -periodo lectivo".$_POST[login];
       registrarOperacion($con,$_SESSION['login'],$valor,$ip_real);      
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

