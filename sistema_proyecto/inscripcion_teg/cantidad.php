<?php 
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
//include("../utilidades/postit.php");

include("../barra.php");
$resultado3 = pg_query($con,"SELECT * FROM trabajador order by nombre");
include("../validar_campos.php");

?>


<table width="750" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2"><strong><font size="1"> </strong></td>
 
  </tr>
  <tr>
   
    <td width><em><font size="1">Escriba el numero de Estudiantes que integran el TEG:</em></td>
  
  </tr>
 
  <tr>
 
    <td><form style="width: 342px; height: 200px;" action="Mdatos2.php" method="post">
      <table   border="0" width="400">
  <tr><td>&nbsp;</td><td></td></tr>
          
        <tr>
          <td width="45%" height="60"><font size="2">Cantidad de Estudiantes</td>
          <td width="75%" height="20"><p>
              <input name="cantidad" type="text" id="cantidad"  size="5"  maxlength=2 value="1" onkeypress="return acceptNum(event)"/><input value="Ver Formato" type="submit" name="submit2" />
          </p></td>
        </tr>
           
        <tr>
          <td>&nbsp;</td>
          
        </tr>
      </table>
    </form></td>

  </tr>
</table>
   </tr>

 <?php
include("../pie.php"); 
 ?>