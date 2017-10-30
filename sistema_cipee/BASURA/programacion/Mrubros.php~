<?php 
include("../control/valida.php"); 
include("../config.php");
include("../tabla.php");


include("../barra.php");
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
$query="select * from rubros where rubros.id_rubro=$id";
$result=pg_query($con,$query);
$row=pg_fetch_array($result);
$mlist=$row['id_rubro'];

$queryw="select *
from creditos where
id_creditos=$row[id_credito]
";
$resultw=pg_query($con,$queryw);
$roww=pg_fetch_array($resultw);


$rc5="select *
from creditos
order by descripcion_credito desc";
$qrc5=pg_query($con,$rc5);

?>
  
</form>

<table width="750" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2"><strong>Modificar Rubro</strong></td>
    <td width="77">&nbsp;</td>
  </tr>
  <tr>
    <td width="149">&nbsp;</td>
    <td width="584"><em>Edite los datos del Rubro:</em></td>
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
    <td><form id="form1" name="form1" method="post" action="edit_rubros.php">
      <table width="70%" height="146" border="0">
        <tr>
          <td width="13%">Id:</td>
          <td width="87%"> <input size="5" readonly name="id"  onkeypress="return acceptChar(event)" &gt="" type="text" value= <?php echo $row['id_rubro'];?>>&nbsp;</td>
        </tr>
        <tr>
          <td width="33%"><div align="left">Rubro:</div></td>
          <td width="77%"> <input name="descripcion_rubro"   type="text" value= "<?php echo $row[descripcion_rubro]; ?>">*&nbsp;</td>
        </tr>
       <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td height="23">Tipo Credito:</td>
            <td><select name="id_creditos" id="id_creditos">
                  <option value="<?php echo $roww['id_creditos'];?>"><?php echo $roww['descripcion_credito'];?></option>
                <?php while($obj=pg_fetch_object($qrc5)){?>
                <option value="<? echo $obj->id_creditos?>"><? echo $obj->descripcion_credito?></option>
                <? }//Fin while ?>
              </select>*</td>
          </tr>  
        <tr>
          <td></td>
          <td><input value="Modificar" type="submit" name="submit">&nbsp;</td>
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
</table>  <?php
include("../pie.php"); 
 ?>
