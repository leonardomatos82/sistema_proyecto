<?php
include("../control/valida.php"); 
include("../css.php");
include("../config.php");
 ?>
  <script language="JavaScript">
function acceptNum(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key <= 13 || (key >= 48 && key <= 57));
}
var nav4 = window.Event ? true : false;
function acceptChar(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key < 48 || key > 57);
}
  </script>
  
 <?php
include("../atras.php"); 
 ?>
<table width="760" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2"><strong>Agregar Direccion o Coordinacion</strong></td>
    <td width="77">&nbsp;</td>
  </tr>
  <tr>
    <td width="149">&nbsp;</td>
    <td width="584"><em>Escriba los datos de la Direccion o Coordinacion:</em></td>
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
    <td><form style="width: 742px; height: 260px;" action="insert_direccion.php"  method="post">
      <p>
      
      <table width="70%" border="0">
        <tr>
          <td width="36%"><div align="left">Coordinacion</div></td>
          <td width="60%"><input name="nomb_direccion" onKeyPress="return acceptChar(event)" &gt="" type="text" size="45">
            *</td>
        </tr>
        <tr>
          <td width="36%"><div align="right"></div></td>
          <td width="64%">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><input value="Guardar" type="submit" name="submit2"></td>
        </tr>
      </table>
      <p>&nbsp;</p>
      <p>* Campo requerido
      </p>
    </form></td>
    <td>&nbsp;</td>
  </tr>
 

</table>

   <?php
include("../pie.php"); 
 ?>


