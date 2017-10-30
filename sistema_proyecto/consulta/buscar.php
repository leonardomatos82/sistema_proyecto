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
    <td colspan="2"><strong><font size="1">Ver Planilla de inscripcion </strong></td>
 
  </tr>
  <tr>
   
    <td width><em><font size="1">Escriba el numero de Cedula del Estudiante:</em></td>
  
  </tr>
 
  <tr>
 
    <td><form style="width: 342px; height: 200px;" action="existe.php" method="post">
      <table   border="0" width="700">
  <tr><td>&nbsp;</td><td></td></tr>
          
        <tr>
          <td width="15%" height="60"><font size="2">N CEDULA: </td>
          <td width="85%" height="30"><p>
              <input name="cedula" type="text" id="cedula" onkeypress="return acceptNum(event)" size="15" maxlength=9 /><select name="documento" id="documento" >
                <option value="PLANILLA DE INSCRIPCION DE PASANTIAS" <?echo $selected1;?>>PLANILLA DE INSCRIPCION DE PASANTIAS</option>
              <option value="COMPROBANTE DE INSCRIPCION DE PASANTIAS" <?echo $selected2;?>>COMPROBANTE DE INSCRIPCION DE PASANTIAS</option>

              
                </option>
              
              </select>
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
