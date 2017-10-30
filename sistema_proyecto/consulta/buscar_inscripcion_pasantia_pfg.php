<?php 
//include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
//include("../utilidades/postit.php");

include("../barra.php");
$resultado1 = pg_query($con,"SELECT * FROM pfg order by nombre_pfg");
$resultado2 = pg_query($con,"SELECT * FROM periodo_lectivo order by id_periodo_lectivo asc");
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
    <td colspan="2"><strong><font size="1">Generar Relacion de Pasantes Inscritos </strong></td>
 
  </tr>
  <tr>
   
    <td width><em><font size="1">Seleccione el PFG, haga directamente clic en <strong>Generar Documento</strong> :</em></td>
  
  </tr>
 
  <tr>
 
    <td><form style="width: 342px; height: 200px;" action="ver_rep_estadisticas_pasantias.php" method="post">
      <table   border="0" width="700">
  <tr><td>&nbsp;</td><td></td></tr>
          
       
            <tr>
          <td width="" height="30"><font size="2">Periodo: </td>
          <td width="" height="30">
<select name="periodo" id="periodo"  >

<?php while($obj=pg_fetch_object($resultado2)){?>
<option selected value="<? echo $obj->periodo ?>"> <? echo $obj->periodo?> 
 <? }//Fin while ?>
</select>
          </p></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><input value="Generar Documento" type="submit" name="submit2" /></td>
        </tr>
      </table>
    </form></td>

  </tr>
</table>
   </tr>

 <?php
include("../pie.php"); 
 ?>
