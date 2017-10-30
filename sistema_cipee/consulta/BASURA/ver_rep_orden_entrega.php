<?php
include("../config.php");
include("../utils.php");
include("../variables.php");


$query2="SELECT * FROM configuracion where id_configuracion='1'";
$result2=pg_query($con,$query2);
$row2=pg_fetch_array($result2);

$query1="SELECT * FROM orden_pedido where id_pedido='$_GET[ids]'";
$result1=pg_query($con,$query1);
$row1=pg_fetch_array($result1);
$row1[1]=cambiaf_a_normal($row1[1]);


$result = pg_query($con,"SELECT detalle_pedido.id_pedido,repuesto.codigo,repuesto.descripcion,detalle_pedido.costo,detalle_pedido.cantidad
FROM detalle_pedido 
Inner join repuesto on repuesto.id_repuesto=detalle_pedido.id_repuesto
where id_pedido='$_GET[ids]'");
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
<table align="center" width="780" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td width="144" rowspan="5"><div align="center"><strong><font size="2" face="Times New Roman, Times, serif"><img src="../imagenes/headerimg2.jpg" width="230" height="62" /></font></strong></div></td>
    <td height="0"><p align="center"><strong><font size="5">Orden de Entrega</font></strong></p></td>

           <td height="0"><p align="center"><strong><font size="2">Fecha: <?php echo $row1[1];?></font></strong></p> <p align="center">  <font size="2">Numero: <?php echo $row1[0];?> 	</td>
  </tr>
  
</table>
<table align="center" width="780" border="1" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td height="0">
<p align="left"><strong><font size="1">Nombre y Apellido o Razon Social:  <font size="2"> <?php echo $row1[2];?></font></strong></p><hr class="noscreen" />
<p align="left"><strong><font size="1">Direccion:<font size="2"> <?php echo $row1[3];?></font></strong></p><hr class="noscreen" />
<p align="left"><strong><font size="1">RIF/CI: _ <font size="2"><?php echo $row1[4];?> ________________________   <font size="1">FORMA DE PAGO:________<font size="2"><?php echo $row1[5];?>____________ </font></strong></p>

</td>    
</tr>
</table>
<?php
echo "<table align=center cellpadding=0 cellspacing=0 background-color: rgb(255, 255, 255); border=1; WIDTH=780 bgcolor=#FFFFFF >";
echo "<tr bgcolor=gray>";
echo "<td <font size=1 align=left><small style=width: 50px><b>N. PARTE</b></font></td>";
echo "<td <font size=1 align=left><small style=width: 50px><b>DESCRIPCION</b></font></td>";
echo "<td <font size=1 align=center><small style=width: 50px><b>CANTIDAD</b></font></td>";
echo "<td <font size=1 align=right><small style=width: 50px><b>MONTO BSF</b></font></td>";
echo "</tr> ";
while ($row = pg_fetch_row($result)){
echo "<tr> ";
$contador++;
$total=$total+$row[3];
$row[3]=number_format($row[3],2);


echo "<td <font size=1 align=center><small style=width: 50px>$row[1]</font></td>";
echo "<td <font size=1 align=left><small style=width: 50px>$row[2]</font></td>";
echo "<td <font size=1 align=center><small style=width: 50px>$row[4]</font></td>";
echo "<td <font size=1 align=right><small style=width: 50px>$row[3]</font></td>";


?>
</p>
<p></p>

<?PHP

echo "</tr> ";


}
if ($contador<15){
for ($i=1;$i<=15-$contador;$i++){
echo "<tr>";
echo "<td <font size=1 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=1 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=1 align=right><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=1 align=right><small style=width: 50px><b>-</b></font></td>";
echo "</tr> ";
}
}
$subtotal=($total);
$iva=($total*12)/100;
$total=$total+$iva;
$miva=number_format($iva,2);
$msubtotal=number_format($subtotal,2);
$mtotal=number_format($total,2);

echo "<tr bgcolor=>";
echo "<td <font size=1 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=1 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=1 align=right><small style=width: 50px><b>SubTotal:</b></font></td>";
echo "<td <font size=1 align=right><small style=width: 50px><b>$msubtotal</b></font></td>";
echo "</tr> ";
echo "<tr bgcolor=>";
echo "<td <font size=1 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=1 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=1 align=right><small style=width: 50px><b>IVA:</b></font></td>";
echo "<td <font size=1 align=right><small style=width: 50px><b>$miva</b></font></td>";
echo "</tr> ";
echo "<tr bgcolor=gray>";
echo "<td <font size=1 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=1 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=1 align=right><small style=width: 50px><b>TOTAL:</b></font></td>";
echo "<td <font size=1 align=right><small style=width: 50px><b>$mtotal</b></font></td>";
echo "</tr> ";
echo "</table>";
include("numero2.php");  

?>
<table width="780" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td><div align="left"><font face="arial"><font size="2" face="arial">Monto Total de la Venta: <strong> <?php echo ($x).$muestra; ;?></font></font></div></td>
  </tr>
</table>

<table width="780" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td><div align="right"><font face="arial"> </strong><font size="5" face="Codabarmedium"><?php echo $row1[1]."/".$row1[4]."/".$row1[0];?></font></font></div></td>
  </tr>
</table>
<?
 
if ($contador<10){
echo "<p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>";
}else{
echo "<p>&nbsp;</p>";
}
?>

<table width="780" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr bordercolor="#CCCCCC"> 
    <td width="192"><strong><font size="1">ELABORADO POR</font></strong></td>
    <td width="201"><strong><font size="1">FACTURADO POR</font></strong></td>
    <td width="273"><strong><font size="1">ENTREGADO POR</font></strong></td>
    <td width="164">&nbsp;</td>
  </tr>
  <tr> 
    <td><font size="1"><?php echo $row2['administrador'];?></font></td>
    <td><font size="1"><?php echo $row2['coordinador_adm'];?></font></td>
    <td><font size="1"><?php echo $row2['coordinador_sede'];?></font></td>
    <td width="192"><strong><font size="1"><strong>SELLO</strong></td>
  </tr>
      <tr> 
    <td><font size="2"><?php echo $row2['cargo3'];?></font></td>
    <td><font size="2"><?php echo $row2['cargo2'];?></font></td>
    <td><font size="2"><?php echo $row2['cargo1'];?></font></td>  
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="780" border="0" align="center" cellpadding="0" cellspacing="0">

 <?php
include("../pie.php"); 
 ?>
