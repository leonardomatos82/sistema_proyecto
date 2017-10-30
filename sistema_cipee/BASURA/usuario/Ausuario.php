<?php
include("../control/valida.php"); 
include("../css.php");
include("../config.php");
$resultado = pg_query($con,"SELECT * FROM usuario");
 ?>
  <script language="JavaScript">
function acceptNum(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key <= 13 || (key >= 48 && key <= 57));
}
var nav4 = window.Event ? true : false;
function acceptChar(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key < 48 || key > 57);
}
  </script>
  
<? include("../atras.php"); ?>
<table width="824" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2"><strong>Agregar Usuario</strong></td>
    <td width="77">&nbsp;</td>
  </tr>
  <tr>
    <td width="149">&nbsp;</td>
    <td width="584"><em>Escriba los datos del Usuario:</em></td>
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
    <td><form style="width: 742px; height: 260px;" action="insert_usuario.php"  method="post">
      <p>
      
        <table width="81%" border="0">
          <tr> 
            <td width="17%"><div align="left">Cedula/Rif:</div></td>
            <td width="83%"><input name="cedula_rif" type="text" id="cedula_rif"  size="15" value="V-">
              *</td>
          </tr>
          <tr> 
            <td width="17%"><div align="left">Nombre</div></td>
            <td width="83%"><input name="nomb_usuario" &gt="" type="text" size="55">
              *</td>
          </tr>
          <tr> 
            <td width="17%" height="30"><div align="left">Direcci&oacute;n:</div></td>
            <td width="83%" height="30"><p> 
                <textarea name="direccion" cols="50" id="textarea";"></textarea>
                * </p></td>
          </tr>
          <tr> 
            <td width="17%"><div align="left">Telefonos:</div></td>
            <td width="83%"><input name="telf"  &gt="" type="text" size="25">
              *</td>
          </tr>
          <tr> 
            <td>Tipo de Usuario</td>
            <td><select name="tipo" id="select4">
                <option value="TRABAJADOR" selected>TRABAJADOR</option>
                <option value="PROVEEDOR">PROVEEDOR</option>
                <option value="OTRO">OTRO</option>
                     </select></td>
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
 <? include("../pie.php"); ?>