<?php
include("../control/valida.php"); 
include("../config.php");
include("../css.php");
//include("../utils.php");

$queryw="select *
from configuracion 
where id_configuracion='1'";
$resultw=pg_query($con,$queryw);
$roww=pg_fetch_array($resultw);

$roww['comienzo_anio']=cambiaf_a_normal($roww['comienzo_anio']);
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

 

<table width="760" border="0" align="center" bgcolor="#FFFFFF">
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
        <table width="98%" height="340" border="0" cellpadding="2" cellspacing="0">
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td width="31%" height="23"> <div align="left"><strong>Comienzo del 
                A&ntilde;o:</strong></div></td>
            <td width="69%"><strong>
              <input name="comienzo_anio" type="text" id="sede2" value="<?php echo $roww['comienzo_anio'];?>" size="50" maxlength="50"/>
              </strong> </td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td width="31%" height="28"> <div align="left"><strong>Sede UBV:</strong></div></td>
            <td><strong> 
              <input name="sede" type="text" id="sede" value="<?php echo $roww['sede'];?>" size="50" maxlength="50"/>
              </strong> </td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td width="31%" height="26"> <div align="left"><strong>RIF:</strong></div></td>
            <td><input  name="rif" type="text"  value="<?php echo $roww['rif'];?>" /> 
            </td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td height="29"><strong>N cuenta:</strong></td>
            <td><input name="cuenta" type="text" id="cuenta" value="<?php echo $roww['cuenta'];?>" size="30" /> 
            </td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td height="24">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td height="26"><strong>Coordinador Sede :</strong></td>
            <td><input  name="coordinador_sede" type="text"   value="<?php echo $roww['coordinador_sede'];?>" size="50" /></td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td height="23"><strong>Coordinador Administrativo: </strong></td>
            <td><input  name="coordinador_adm" type="text"   value="<?php echo $roww['coordinador_adm'];?>" size="50" /></td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td height="23"><strong>Administrador:</strong></td>
            <td><input  name="administrador" type="text"   value="<?php echo $roww['administrador'];?>" size="50" /></td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td height="23">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td height="23"><strong>Monto IVA:</strong></td>
            <td><input  name="iva" type="text"   value="<?php echo $roww['iva'];?>" size="5" />
              %</td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td height="23"><strong>Monto ISRL:</strong></td>
            <td><input  name="isrl" type="text"   value="<?php echo $roww['isrl'];?>" size="5" />
              %</td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td height="23">&nbsp;</td>
            <td>&nbsp;</td>
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
<td colspan="3"><div align="center"><img src="../imagenes/mural1.png" width="760" height="2" /></div></td>
  </tr>
</table>

