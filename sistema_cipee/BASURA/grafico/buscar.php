<?php 
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
//include("../utilidades/postit.php");

include("../barra.php");
$resultado3 = pg_query($con,"SELECT * FROM departamento order by nombre_departamento");
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
    <td colspan="2"><strong><font size="1">Generar graficos por Departamento </strong></td>
 
  </tr>
  <tr>
   
    <td width><em><font size="1">Seleccione el Departamento y haga clic en <strong>Consultar</strong> :</em></td>
  
  </tr>
 
  <tr>
 
    <td><form style="width: 342px; height: 200px;" action="ver_resumen.php" method="post">
      <table   border="0" >
  <tr><td>&nbsp;</td><td></td></tr>

        <tr>
          <td width="15%"><div align="left"><font size="2">DEPARTAMENTO: </div></td>
          <td width="85%"><select name="dpto" id="dpto" >
              <option value="0">-- Seleccione --</option>
              <?php while($obj=pg_fetch_object($resultado3)){?>
              <option value="<? echo $obj->nombre_departamento?>"> <? echo $obj->nombre_departamento?> </option>
              <? }//Fin while ?>
          </select></td>
        </tr>
        
        <tr>
          <td>&nbsp;</td>
          <td><input value="Consultar" type="submit" name="submit2" /></td>
        </tr>
      </table>
    </form></td>

  </tr>
</table>
   </tr>

 <?php
include("../pie.php"); 
 ?>