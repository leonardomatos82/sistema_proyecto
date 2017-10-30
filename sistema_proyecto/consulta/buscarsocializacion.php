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
    <td colspan="2"><strong><font size="1">Generar Planilla de Socializacion </strong></td>
 
  </tr>
  <tr>
   
    <td width><em><font size="1">Escriba el numero de Cedula, haga directamente clic en <strong>Generar Documento</strong> :</em></td>
  
  </tr>
 
  <tr>
 
    <td><form style="width: 342px; height: 200px;" action="existe3.php" method="post">
      <table   border="0" width="700">
  <tr><td>&nbsp;</td><td></td></tr>
          
        <tr>
          <td width="15%" height="60"><font size="2">N CEDULA: </td>
          <td width="85%" height="30"><p>
              <input name="cedula" type="text" id="cedula" onkeypress="return acceptNum(event)" maxlength=9 size="15" /><select name="documento" id="documento" >
                <option value="SOCIALIZACION DE TEG" <? echo $selected ?>>SOCIALIZACION DE TEG</option>
              <option value="SERVICIO COMUNITARIO" <? echo $selected ?>>SERVICIO COMUNITARIO</option>

              
                </option>
              
              </select><? if ($_GET[mensaje]!=""){echo $_GET[mensaje]; }?>
          </p></td>
        </tr>
           
        <tr>
          <td>&nbsp;</td>
          <td><input value="Generar Documento" type="submit" name="submit2" /></td>
        </tr>
      </table>
    </form></td>

  </tr>
</table>
   </tr>

 <?php
include("../pie.php"); 
 ?>