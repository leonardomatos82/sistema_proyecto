<?php
include("../control/valida.php"); 
include("../config.php");
include("../tabla.php");


include("../barra.php");

$resultado = pg_query($con, "SELECT * FROM vehiculo");
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
    <td colspan="2"><strong>Agregar Repuesto al Sistema</strong></td>
   
  </tr>
  <tr>
    <td width="149">&nbsp;</td>
    <td width="580"><em>Agregar los datos del Repuesto:</em></td>
   
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
   
  </tr>
  <tr>
    <td height="88"><p align="right">&nbsp;</p>
        <p align="right">&nbsp;</p></td>
    <td><form id="form1" name="form1" method="post" action="insert_acceso.php">
      <table width="70%" height="128" border="0">
        <tr>
          <td width="13%"><div align="left">Descripcion:</div></td>
          <td width="87%"><input name="v1"  type="text" size="60">
            * </td>
        </tr>
        <tr>
          <td width="13%"><div align="left">Costo Compra:</div></td>
          <td width="87%"><input name="v2"  type="text" size="30">
            * </td>
        </tr>
           <tr>
          <td width="13%"><div align="left">Costo Venta:</div></td>
          <td width="87%"><input name="v3"  type="text" size="30">
            * </td>
        </tr>
 <tr>

          <td width="13%"><div align="left">Cantidad Disponible:</div></td>
          <td width="87%"><input name="v4"  type="text" size="30">
            * </td>
        </tr>
 <tr>

          <td width="13%"><div align="left">Stock Minimo:</div></td>
          <td width="87%"><input name="v5"  type="text" size="30">
            * </td>
        </tr>
 <tr>

          <td width="13%"><div align="left">Stock Maximo:</div></td>
          <td width="87%"><input name="v6"  type="text" size="30">
            * </td>
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
 
