<?php 
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../barra.php");
$resultado3 = pg_query($con,"SELECT * FROM trabajador order by nombre");
include("../validar_campos.php");

?>
<table width="750" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2"><strong><font size="1"> </strong></td>
 
  </tr>
  <tr>
   
    <td width><em><font size="1">Escriba el numero de Cedula o codigo de registro, haga directamente clic en <strong>Ver Datos</strong>:</em></td>
  
  </tr>
 
  <tr>
 
    <td><form style="width: 342px; height: 200px;" action="existeteg.php" method="post">
      <table   border="0" width="400">
  <tr><td>&nbsp;</td><td></td></tr>
          
        <tr>
          <td width="25%" height="60"><font size="2"></td>
          <td width="75%" height="30"><p>
              <input name="cedula" type="text" id="cedula" maxlength=9 onkeypress="return acceptNum(event)" size="15" /><select name="documento" id="documento" >
                <option value="CEDULA">CEDULA</option>
              <option value="CODIGO">CODIGO</option>
              
                </option>
              
              </select>
          </p></td>
        </tr>
           
        <tr>
          <td>&nbsp;</td>
          <td><input value="Ver Datos" type="submit" name="submit2" /></td>
        </tr>
      </table>
    </form></td>

  </tr>
</table>
   </tr>

 <?php
include("../pie.php"); 
 ?>
