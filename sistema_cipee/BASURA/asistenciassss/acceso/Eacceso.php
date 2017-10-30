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
$id=$_GET[id];
$query="select * from acceso where acceso.id_acceso=$id";
$result=pg_query($con,$query);
$row=pg_fetch_array($result);
$mlist=$row['id_acceso'];
?>
  
</form>

<table width="824" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2"><strong>Eliminar Acceso</strong></td>
    <td width="77">&nbsp;</td>
  </tr>
  <tr>
    <td width="149">&nbsp;</td>
    <td width="584"><em>&iquest;Seguro que desea Eliminar los datos de Acceso?:</em></td>
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
    <td><form id="form1" name="form1" method="post" action="elim_acceso.php">
      <table width="70%" height="146" border="0">
        <tr>
          <td width="13%">Id:</td>
          <td width="87%"> <input size="5" readonly name="id"  onkeypress="return acceptChar(event)" &gt="" type="text" value= <?php echo $row['id_acceso'];?>>&nbsp;</td>
        </tr>
        <tr>
          <td width="13%"><div align="left">Usuario:</div></td>
          <td width="87%"> <input name="login"  readonly type="text" value= <?php echo $row['login'];?>>*&nbsp;</td>
        </tr>
        <tr>
          <td width="13%" height="21"><div align="left">Clave:</div></td>
          <td width="87%"><label><input name="clave"  readonly type="password" value= <?php echo $row['clave'];?>>
            *</label></td>
        </tr>
        <tr>
          <td width="13%"><div align="right">Tipo:</div></td>
          <td width="87%"><label> <input name="tipo"  readonly type="text" value= <?php echo $row['tipo'];?>>
            *</label></td>
        </tr>
        <tr>
          <td></td>
          <td> <input value="Eliminar" type="submit" name="submit">&nbsp;</td>
        </tr>
        <tr>
          <td></td>
          <td>&nbsp;</td>
        </tr>
      </table>
    </form></td>
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