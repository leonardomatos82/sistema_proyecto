<?php

//include("../control/valida.php"); 
include("../config.php");
include("../css.php");
$resultado1 = pg_query($con,"SELECT * FROM departamento order by nombre_departamento");
$cont=1;
echo $_POST['recibe'];
echo $_GET[monto1];
if ($_GET[id]<$cont){
$cont2=$cont;

}else{
$cont2=$_GET[id];

}


?>
<script language="JavaScript">
function acceptNum(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key <= 13 || (key >= 44 && key <= 57));
}
var nav4 = window.Event ? true : false;
function acceptChar(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key < 44 || key > 57);
}
function textCounter(field, countfield, maxlimit) {
if (field.value.length > maxlimit)
field.value = field.value.substring(0, maxlimit);
else 
countfield.value = maxlimit - field.value.length;
}
function asignar(field, countfield) {
countfield.value = field.value;
}

function comparar(field1,field2,field3,countfield) {
if (field1.value >= countfield.value)
field1.value = "";

}
  </script>
 
 <?php
include("../atras.php"); 
 ?>
<table width="760" border="0" align="center" bgcolor="#FFFFFF">
  <tr> 
    <td colspan="2"><strong>Agregar Material o suministro</strong></td>
    <td width="73">&nbsp;</td>
  </tr>
  <tr> 
    <td width="60">&nbsp;</td>
    <td width="709"><em>Escriba las caracter&iacute;sticas del Material o suministro:</em></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td><form id="form1" name="form1" method="post" action="Adespacho2.php?id=0">
        <table width="98%" height="150" border="0" cellpadding="2" cellspacing="0">
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td width="21%" height="23"> <div align="right"></div></td>
            
          </tr>
           <tr> 
             <td width="21%" height="28"> <div align="left"><strong>Fecha:</strong> 
            <td width="70%"><input autocomplete=OFF name="fecha_fact" type="text" id="cedula_rif3" value="<? echo date("d-m-Y"); ?>"  size="15" >
              *</td>
          </tr>
             <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td width="21%" height="26"> <div align="left"><strong>Recibe :</strong></div></td>
            <td><input  size="50" name="recibe" type="text"   value=""  /> 
            </td>
          </tr>
                         
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td width="21%" height="28"> <div align="left"><strong>Unidad o Departamento:</strong> 
              </div></td>
            <td><strong> 
           
           <select name="departamento" id="departamento" >
                <option value="" selected>-- Seleccione --</option>
                <?php while($obj=pg_fetch_object($resultado1)){?>
                <option value="<? echo $obj->id_departamento?>"> <? echo $obj->nombre_departamento?> 
                </option>
                <? }//Fin while ?>
              </select>
                                </strong> </td>
          </tr>
    </table>
        </table>
    
 
          
          
           <td>&nbsp;</td>          
           <td>&nbsp;</td>
          <tr> 
          <td ></td>
            <td width="10%"><div align="center"><strong> 
                <input value="GUARDAR MATERIAL" type="submit" name="submit2" />
                </strong></div></td>
          </tr>
      
        </form></td>
          
    <td>&nbsp;</td>
  </tr>
 <?php
include("../pie.php"); 
 ?>
