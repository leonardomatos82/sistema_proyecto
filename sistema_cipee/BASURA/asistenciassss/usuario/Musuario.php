<?php 
include("../control/valida.php"); 
include("../css.php");
include("../config.php");
//include("../control/check_user.php"); 
//$resultado = pg_query($con,"SELECT * FROM acceso" );
?><head>
  <script language="JavaScript">
function acceptNum(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key <= 13 || (key >= 48 && key <= 57));
}
var nav4 = window.Event ? true : false;
function acceptChar(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key < 48 || key > 57);
}

  </script>
<?php 
$query="select * from usuario where usuario.id_usuario='$_GET[id]'";
$result=pg_query($con,$query);
$row=pg_fetch_array($result);

?>
  
<table width="824" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2"><strong>Modificar Usuario</strong></td>
    <td width="77">&nbsp;</td>
  </tr>
  <tr>
    <td width="149">&nbsp;</td>
    <td width="584"><em>Edite los datos del Usuario:</em></td>
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
    <td><form style="width: 100%; height: 70%;" action="edit_usuario.php" ;="" method="post">
      <table width="100%" border="0">
        <tr>
          <td width="30%"><div align="left">Id:</div></td>
          <td width="76%"><input size="5" readonly="readonly" name="id"  onkeypress="return acceptChar(event)" &gt="" type="text" value= "<?php echo $row['id_usuario'];?>" /></td>
          <td></td></td>
        </tr>
        <tr>
          <td width="30%"><div align="left">Cedula/Rif:</div></td>
          <td width="76%"><input name="cedula_rif"  type="text" value= "<?php echo $row['cedula_rif'];?>" />
            *</td>
          <td></td></td>
        </tr>
        <tr>
          <td width="30%"><div align="left">Nombre:</div></td>
          <td width="76%"><input name="nomb_usuario"  type="text" value= "<?php echo $row['nombre'];?>" />
            *</td>
          <td></td></td>
        </tr>
        <tr>
          <td width="24%"><div align="left">Direccion:</div></td>
          <td width="76%"><input name="direccion"  type="text" value= "<?php echo $row['direccion'];?>" />
            *</td>
          <td></td></td>
        </tr>
		     <tr>
          <td width="24%"><div align="left">Telefonos:</div></td>
          <td width="76%"><input name="telf"  type="text" value= "<?php echo $row['telf'];?>" />
            *</td>
          <td></td></td>
        </tr>
         <tr> 
            <td>Tipo de Usuario</td>
            <td><select name="tipo" id="select4">
                <option value="<?php echo $row['tipo'];?>" selected><?php echo $row['tipo'];?></option>
                <option value="TRABAJADOR" >TRABAJADOR</option>
                <option value="PROVEEDOR">PROVEEDOR</option>
                     </select></td>
          </tr>
        <tr>
          <td width="24%"><div align="right"></div></td>
          <td width="76%"><input value="Guardar" type="submit" name="submit" />
          </td>
        </tr>
      </table>
	
	  </form>
	&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>* Campo requerido</td>
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