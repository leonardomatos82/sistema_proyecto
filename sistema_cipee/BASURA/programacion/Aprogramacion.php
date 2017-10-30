<?php
include("../control/valida.php"); 
include("../config.php");
include("../tabla.php");


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
    <td colspan="2"><strong>Agregar Programacion Al Sistema</strong></td>
   
  </tr>
  <tr>
    <td width="149">&nbsp;</td>
    <td width="580"><em>Agregar los datos de la Programacion:</em></td>
   
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
   
  </tr>
  <tr>
    <td height="88"><p align="right">&nbsp;</p>
        <p align="right">&nbsp;</p></td>
    <td><form id="form1" name="form1" method="post" action="insert_programacion.php">
      <table width="70%" height="128" border="0">
        <tr>
          <td width="43%"><div align="left">Programacion:</div></td>
          <td width="87%"><input name="descripcion_Programacion"  type="text" size="25">
            </td>
        </tr>
        <tr>
          <td width="43%"><div align="left">Prog:</div></td>
          <td width="87%"><input name="prog"  type="text" size="5">
            </td>
        </tr>
        <tr>
          <td width="13%"><div align="right"></div></td>
          <td width="87%">&nbsp;</td>
        </tr>
        <tr>
          <td></td>
          <td><input value="Guardar" type="submit" name="submit"></td>
        </tr>
      </table>
    </form></td>
    
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>* Campo requerido</td>
   
  </tr>
   </table>
  <?php
include("../pie.php"); 
 ?>
 
