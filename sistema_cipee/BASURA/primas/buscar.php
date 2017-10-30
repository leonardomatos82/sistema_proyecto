<?php 
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
//include("../utilidades/postit.php");

include("../barra.php");
$resultado3 = pg_query($con,"SELECT * FROM trabajador order by nombre");
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
    <td colspan="2"><strong><font size="1">Modificar Datos de Trabajador </strong></td>
 
  </tr>
  <tr>
   
    <td width><em><font size="1">Escriba o seleccione los campos para buscar, haga directamente clic en <strong>Ver Datos</strong> :</em></td>
  
  </tr>
 
  <tr>
 
    <td><form style="width: 342px; height: 200px;" action="Mprimas.php" method="post">
      <table   border="0" >
  <tr><td>&nbsp;</td><td></td></tr>
          
        <tr>
          <td width="15%" height="60"><font size="2">N CEDULA: </td>
          <td width="85%" height="30"><p>
              <input name="cedula" type="text" id="cedula" onkeypress="return acceptchar(event)" size="15" />
          </p></td>
        </tr>
        <tr>
          <td width="15%"><div align="left"><font size="2">TRABAJADOR: </div></td>
          <td width="85%"><select name="codigo" id="codigo" >
              <option value="0">-- Seleccione --</option>
              <?php while($obj=pg_fetch_object($resultado3)){?>
              <option value="<? echo $obj->codigo?>"> <? echo $obj->nombre?> </option>
              <? }//Fin while ?>
          </select></td>
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
