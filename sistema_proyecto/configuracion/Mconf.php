<?php

include("../control/valida.php"); 

include("../config.php");

include("../css.php");
include("../barra.php");
//include("../utils.php");



$queryw="select *

from autorizado";

$resultw=pg_query($con,$queryw);

$roww=pg_fetch_array($resultw);

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



 



<table width="750" border="0" align="center" bgcolor="#FFFFFF">

    <td colspan="2"><strong>Modificar Configuraci&oacute;n</strong></td>

    <td width="73">&nbsp;</td>

  </tr>

  <tr> 

    <td width="60">&nbsp;</td>

    <td width="709"><em>Modifique la configuraci&oacute;n del Sistema:</em></td>

    <td>&nbsp;</td>

  </tr>

  <tr> 

    <td>&nbsp;</td>

    <td>&nbsp;</td>

    <td>&nbsp;</td>

  </tr>

  <tr> 

    <td>&nbsp;</td>

    <td><form id="form1" name="form1" method="post" action="edit_conf.php">

        <table width="98%" height="200" border="0" cellpadding="2" cellspacing="0">

          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 

            <td width="31%" height="23"> <div align="left"><strong>Firma Autorizada:</strong></div></td>

            <td width="69%"><strong>

              <input name="v1" type="text" id="periodo" value="<?php echo $roww['nombre'];?>" size="40"/>

              </strong> </td>

          </tr>
<tr bordercolor="#000000" bgcolor="#FFFFFF"> 

            <td width="31%" height="23"> <div align="left"><strong>Cargo:</strong></div></td>

            <td width="69%"><strong>

              <input name="v2" type="text" id="sede2" value="<?php echo $roww['cargo'];?>" size="60" />

              </strong> </td>

          </tr>

          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 

            <td width="31%" height="28"> <div align="left"><strong>Cargo Completo:</strong></div></td>

            <td><strong> 

              <input name="v3" type="text" id="sede" value="<?php echo $roww['cargo_completo'];?>" size="60" />

              </strong> </td>

          </tr>

          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 

            <td width="31%" height="26"> <div align="left"><strong>Resolucion :</strong></div></td>

            <td><input  name="v4" type="text"  value="<?php echo $roww['resolucion'];?>" /> 

            </td>

          </tr>

          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 

            <td height="29"><strong>Valor Cesta Ticket:</strong></td>

            <td><input name="v5" type="text" id="cuenta" value="<?php echo $roww['cestaticket'];?>" size="10" /> 

            </td>

          </tr>

         
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 

            <td height="23" colspan="2"><div align="center"> 

                <input name="submit" type="submit" value="Modificar " />

              </div></td>

          </tr>

          <tr bordercolor="#000000" bgcolor="#FFFFFF">

            <td height="23" colspan="2">&nbsp;</td>

          </tr>

        </table>

      </form></td>

    <td>&nbsp;</td>
</table>

<? include("../pie.php"); ?>

