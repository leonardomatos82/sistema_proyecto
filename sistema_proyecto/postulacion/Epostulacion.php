<?php 
session_start();
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php"); 
include("../barra.php");
$resultpl = pg_query($con, "select * from periodo_lectivo where estado='ACTIVO'"); 
$rowpl=pg_fetch_array($resultpl);
$resultado1 = pg_query($con,"SELECT * FROM periodo_lectivo");

?><head>
  <script language="JavaScript">
function acceptNum(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key <= 13 || (key >= 48 && key <= 57));
}
var nav4 = window.Event ? true : false;
function acceptChar(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key < 48 || key > 57);
}

  </script>
  
</form>

<table width="750" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2"><strong>Escriba la Descripcion del periodo Lectivo</strong></td>
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
    <td><form id="form1" name="form1" method="post" action="actualizar_lectivo.php">
      <table width="70%" height="146" border="0">
        <tr>
          <td width="40%"><div align="left">Periodo Lectivo:</div></td>
          <td width="60%">
<select name="periodo" id="periodo"  >
<option value="" selected>Seleccione</option>
<?php while($obj=pg_fetch_object($resultado1)){?>
<option value="<? echo $obj->periodo ?>"> <? echo $obj->periodo?> 
 <? }//Fin while ?>
</select>

*&nbsp;</td>
        </tr>
              <tr>
          <td width="40%"><div align="left">Proceso:</div></td>
          <td width="60%"> <select name="proceso" id="proceso" >
                <option value="ACTIVO" >ACTIVO</option>
              <option value="INACTIVO" selected>INACTIVO</option>

              
                </option>
              
              </select></td>
        </tr>
          <tr>
          <td></td>
          <td><input value="Actualizar" type="submit" name="submit">&nbsp;</td>
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
