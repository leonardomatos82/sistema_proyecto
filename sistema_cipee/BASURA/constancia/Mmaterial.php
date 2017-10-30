<?php
//include("../control/valida.php"); 
include("../config.php");
include("../css.php");
$resultado1 = pg_query($con,"SELECT * FROM p_terciaria order by descripcion");

 $result = pg_query($con,"SELECT *
 from material
 where
 id_material=$_GET[cod]
 
  order by DESCRIPCION
  ASC");
  
  $row = pg_fetch_array($result);
$resultado2 = pg_query($con,"SELECT * FROM p_terciaria where id_p_terciaria=$row[cod_partida]");
$row2 = pg_fetch_array($resultado2);

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
    <td colspan="2"><strong>Modificar el Material o suministro</strong></td>
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
    <td><form id="form1" name="form1" method="post" action="edit_material.php">
        <table width="98%" height="150" border="0" cellpadding="2" cellspacing="0">
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td width="21%" height="23"> <div align="right"></div></td>
            
          </tr>
          
            <tr>
          <td height="23"><strong>ID:</strong></td>
 					<td><div align="left"> 
                <input name="id" type="text" id="monto2" Readonly size="10"  value="<?php echo $row['id_material'];?>">
              </div></td>          
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td width="21%" height="28"> <div align="left"><strong>Partida presupuestaria:</strong> 
              </div></td>
            <td><strong> 
           
           <select name="partida1" id="partida1" >
                <option value="<? echo $row2['id_p_terciaria']?>"> <? echo $row2['descripcion']?>
                <?php while($obj=pg_fetch_object($resultado1)){?>
				
                <option value="<? echo $obj->id_p_terciaria?>"> <? echo $obj->descripcion?> 
                </option>
                <? }//Fin while ?>
              </select>
                                </strong> </td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td width="21%" height="26"> <div align="left"><strong>Descripcion:</strong></div></td>
            <td><input  size="50" name="descripcion" type="text"   value="<?php echo $row['descripcion'];?>" /> 
            </td>
          </tr>
                    <tr> 
            <td height="23"><strong>Presentacion:</strong></td>
            <td> <select name="presentacion">
			<option value="<?php echo $row['presentacion'];?>"><?php echo $row['presentacion'];?></option>
                <option value="UNIDAD">UNIDAD</option>
                <option value="CAJA">CAJA</option>
                 <option value="RESMA">RESMA</option>
                  <option value="PAQUETE">PAQUETE</option>
              </select>
              *</td>
          </tr>
                        <tr> 
            <td height="23"><strong>Estado:</strong></td>
            <td> <select name="estado">
			<option value="<?php echo $row['estado'];?>"><?php echo $row['estado'];?></option>
                <option value="ACTIVO">ACTIVO</option>
                <option value="INACTIVO">INACTIVO</option>
              </select>
              *</td>
          </tr>
          <tr>
          <td height="23"><strong>Existencia:</strong></td>
 					<td><div align="left"> 
                <input name="existencia" type="text" id="monto2" Readonly size="10"  value="<?php echo $row['existencia'];?>">
              </div></td>          
          </tr>
             
          <tr> 
          <td ></td>
            <td width="10%"><div align="left"><strong> 
                <input value="EDITAR MATERIAL" type="submit" name="submit2" />
                </strong></div></td>
          </tr>
        </table>
        </form></td>
             </table>
    <td>&nbsp;</td>
  </tr>
 <?php
include("../pie.php"); 
 ?>
