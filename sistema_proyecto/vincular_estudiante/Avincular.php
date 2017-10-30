<?php 
session_start();
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php"); 
include("../barra.php");
include("../validar_campos.php");
?><head>

  
</form>

<table width="750" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2"><strong>Escriba los datos del estudiante</strong></td>
    <td width="77">&nbsp;</td>
  </tr>
  <tr>
    <td width="149">&nbsp;</td>
    <td width="584"><em></em></td>
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
    <td><form id="form1" name="form1" method="post" action="insert_vinculacion.php">
      <table width="70%" height="146" border="0">
        <tr>
          <td width="40%"><div align="left">Cedula</div></td>
          <td width="60%"> <input name="cedula" size=12  type="text" value="" maxlength=9 onkeyup="return acceptNum(event)" onkeypress="return acceptNum(event)">*&nbsp;</td>
        </tr>
              <tr>
          <td width="40%"><div align="left">Nombres y Apellidos:</div></td>
          <td width="60%"> <input name="nombre"  size=20 type="text" maxlength=100 value="" onkeyup="return acceptChar(event)" onkeypress="return acceptChar(event)">*&nbsp;</td>
        </tr>
              <tr>
          <td width="40%"><div align="left">Telefono:</div></td>
          <td width="60%"> <input name="telefono"  size=18 type="text" maxlength=12 value="" onkeyup="return acceptNum(event)" onkeypress="return acceptNum(event)">*&nbsp;</td>
        </tr>
              <tr>
          <td width="40%"><div align="left">Codigo del TEG:</div></td>
          <td width="60%"> <input name="id_teg"  size=5 type="text" value="" maxlength=9 onkeyup="return acceptNum(event)" onkeypress="return acceptNum(event)">* Indispensable&nbsp;</td>
        </tr>

        <tr>
          <td></td>
          <td><input value="Vincular estudiante a TEG" type="submit" name="submit">&nbsp;</td>
        </tr>
        <tr>
          <td></td>
          <td>&nbsp;</td>
        </tr>
      </table>
    </form></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>* Campo requerido</td>
    <td>&nbsp;</td>
  </tr>
</table>
  <?php
include("../pie.php"); 
 ?>
