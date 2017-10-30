<?php 
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
//include("../utilidades/postit.php");

include("../barra.php");
$resultado3 = pg_query($con,"SELECT * FROM trabajador order by nombre");
if ($_SESSION['login']=='nabreu' || $_SESSION['login']=='leonardo'){
$selected1='selected';
$selected2='';
$selected3='';
}else{
if($_SESSION['login']=='constancia'){
$selected3='selected';
$selected2='';
$selected1='';

}else{
$selected1='';
$selected2='selected';
$selected3='';
}}

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
    <td colspan="2"><strong><font size="1">Generar Documento a Egresado </strong></td>
 
  </tr>
  <tr>
   
    <td width><em><font size="1">Escriba el numero de Cedula del Egresado, haga directamente clic en <strong>Generar Documento</strong> :</em></td>
  
  </tr>
 
  <tr>
 
    <td><form style="width: 342px; height: 200px;" action="existe.php" method="post">
      <table   border="0" width="400">
  <tr><td>&nbsp;</td><td></td></tr>
          
        <tr>
          <td width="25%" height="60"><font size="2">N CEDULA: </td>
          <td width="75%" height="30"><p>
              <input name="cedula" type="text" id="cedula" onkeypress="return acceptchar(event)" size="15" /><select name="documento" id="documento" >
                <option value="AUTENTICACION" <?echo $selected1;?>>AUTENTICACION</option>
                <option value="COPIA CERTIFICADA" <?echo $selected4;?>>COPIA CERTIFICADA</option>
              <option value="CULMINACION" <?echo $selected2;?>>CULMINACION</option>
               <option value="CONSTANCIA" <?echo $selected3;?>>CONSTANCIA</option>
               <option value="CERTIFICACION NOTAS" <?echo $selected3;?>>CERTIFICACION NOTAS</option>
                </option>
              
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