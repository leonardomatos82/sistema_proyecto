<?php 
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../barra.php");
?>
 <script language="JavaScript">
function acceptNum(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key <= 13 || (key >= 48 && key <= 57));
}
var nav4 = window.Event ? true : false;
function acceptChar(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key < 48 || key > 57);
}
  </script>

<table width="750" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2"><strong><font size="1">Actualizar Datos del Egresado</strong></td>
 
  </tr>
  <tr>
   
    <td width><em><font size="1">Escriba el numero de Cedula del Egresado, haga directamente clic en <strong>Ver Datos</strong> :</em></td>
  
  </tr>
 
  <tr>
 
    <td><form style="width: 342px; height: 200px;" action="Mdatos" method="post">
      <table   border="0" >
  <tr><td>&nbsp;</td><td></td></tr>
          
        <tr>
          <td width="25%" height="60"><font size="2">N CEDULA: </td>
          <td width="75%" height="30"><p>
              <input name="cedula" type="text" id="cedula" onkeypress="return acceptchar(event)" size="15" />
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
