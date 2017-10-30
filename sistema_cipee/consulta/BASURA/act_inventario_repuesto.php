<?php
session_start();
include("../control/valida.php"); 
include("../config.php");
include("../tabla.php");
include("../utils.php");
include("../barra.php");
$query2="SELECT * FROM configuracion where id_configuracion='1'";
$result2=pg_query($con,$query2);
$row2=pg_fetch_array($result2);


?>
<script language="JavaScript">
function acceptNum(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key <= 13 || (key >= 47 && key <= 57));
}
var nav4 = window.Event ? true : false;
function acceptChar(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key < 48 || key > 57);
}
function textCounter(field, countfield, maxlimit) {
if (field.value.length > maxlimit)
field.value = field.value.substring(0, maxlimit);
else 
countfield.value = maxlimit - field.value.length;
}

  </script>
   
<table align="center" width="750" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>  <td width="144" rowspan="5"><div align="center">


             
 <p align="center"><strong>	INVENTARIO GENERAL DE REPUESTOS</strong></p>

 
  <?php
$result4 = pg_query($con,"SELECT *
 FROM repuesto 
 order by descripcion
");
echo "<form id=form1 name=form1 method=post action=../consulta/imprimir_inventario_repuesto.php>";
echo "<p align=center><strong>	<input value=Imprimir type=submit name=submit1 /> </strong></p>";
echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=640 bgcolor=#FFFFFF >";
echo "<tr>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=1>N.</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=1>N. PARTE</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=1>REPUESTO</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=1>CANTIDAD</b></td>";

echo "</tr> ";
while ($row4 = pg_fetch_row($result4)){$c++;
echo "<tr> ";
echo "<td <small style=width: 50px ><font size=1>$c</td> ";
echo "<td <small style=width: 50px ><font size=1>$row4[1]</td> ";
echo "<td <small style=width: 50px ><font size=1>$row4[2]</td> ";
echo "<td <small style=width: 50px ><font size=1>$row4[5]</td> ";
?>
</p>
<?PHP
echo "</tr> ";
}
echo "</table>";
 

echo "</form>";
?>   
</tr>
</table>
<tr>
 <?php
include("../pie.php"); 
 ?>
