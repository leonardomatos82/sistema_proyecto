<?php 
include("../control/valida.php"); 
include("../css.php");
include("../config.php");
//include("../control/check_user.php"); 
//$resultado = pg_query($con,"SELECT * FROM acceso" );
?>
<?php 
$query="select * from direccion where direccion.id_direccion='$_GET[id]'";
$result=pg_query($con,$query);
$row=pg_fetch_array($result);
?>
  <script language="JavaScript">
function acceptNum(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key <= 13 || (key >= 48 && key <= 57));
}
var nav4 = window.Event ? true : false;
function acceptChar(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key < 48 || key > 57);
}

  </script>

     <?php
include("../atras.php"); 
 ?>
<table width="760" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2"><strong>Eliminar Coordinacion</strong></td>
    <td width="77">&nbsp;</td>
  </tr>
  <tr>
    <td width="149">&nbsp;</td>
    <td width="584"><em>Seguro que desea eliminar esta  Coordinacion?</em></td>
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
    <td><form style="width: 100%; height: 70%;" action="elim_direccion.php"  method="post">
      <table width="100%" border="0">
        <tr>
          <td width="30%"><div align="left">Id:</div></td>
          <td width="76%"><input readonly size="5" readonly="readonly" name="id"  onkeypress="return acceptChar(event)" &gt="" type="text" value= "<?php echo $row['id_direccion'];?>" /></td>
          <td></td></td>
        </tr>
        <tr>
         <tr>
          <td width="30%"><div align="left">Coordinacion:</div></td>
          <td width="76%"><input readonly name="nomb_direccion"  onkeypress="return acceptChar(event)" &gt="" type="text" value= "<?php echo $row['nomb_direccion'];?>" />
            *</td>
          <td></td></td>
        </tr>
        
        <tr>
          <td width="24%"><div align="right"></div></td>
          <td width="76%"><input readonly value="Eliminar" type="submit" name="submit" />
          </td>
        </tr>
      </table>
	
	  </form>
	&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  
</table>
 <?php
include("../pie.php"); 
 ?>