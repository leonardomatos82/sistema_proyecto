<?php 
include("../control/valida.php"); 
include("../css.php");
include("../config.php");
$resultado3 = pg_query($con,"SELECT * FROM tabla");
?>
 <script language="JavaScript">
function acceptNum(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key <= 13 || (key >= 48 && key <= 57));
}
var nav4 = window.Event ? true : false;
function acceptChar(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key < 48 || key > 57);
}
  </script>
<table width="824" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2"><strong>Consulta de Viaticos </strong></td>
    <td width="77">&nbsp;</td>
  </tr>
  <tr>
    <td width="149">&nbsp;</td>
    <td width="584"><em>Escriba o seleccione los campos a buscar, si desea un listado de todos los viaticos registrados, haga directamente clic en <strong>Consultar</strong> :</em></td>
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
    <td><form style="width: 742px; height: 300px;" action="ver.php" method="post">
      <table width="75%" border="0" >
        <tr>
          <td width="15%" height="30"><div align="left">Cedula:</div></td>
          <td width="85%" height="30"><p>
              <input name="cedula" type="text" id="cedula" onkeypress="return acceptchar(event)" size="15" />
          </p></td>
        </tr>
        <tr>
          <td width="15%"><div align="left">Tipo</div></td>
          <td width="85%"><select name="tipo" id="tipo" >
              <option value="0">-- Seleccione --</option>
              <?php while($obj=pg_fetch_object($resultado3)){?>
              <option value="<? echo $obj->id_tabla?>"> <? echo $obj->tipo?> </option>
              <? }//Fin while ?>
          </select></td>
        </tr>
        <tr>
          <td width="15%"><div align="left">Codigo:</div></td>
          <td width="85%">Desde
            <input name="cdesde" type="text" id="cdesde" onkeypress="return acceptchar(event)" size="5" />
            Hasta
            <input name="chasta" type="text" id="chasta" onkeypress="return acceptchar(event)" size="5" /></td>
        </tr>
        <tr>
          <td width="15%">&nbsp;</td>
          <td width="85%">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><input value="Consultar" type="submit" name="submit2" /></td>
        </tr>
      </table>
    </form></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3"><div align="center"><img src="../imagenes/mural1.png" alt="d" width="850" height="13" /></div></td>
  </tr>
</table>
  