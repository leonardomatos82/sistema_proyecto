<?php	
include("../control/valida.php"); 
include("../config.php");
include("../tabla.php");
include("../utils.php");
//include("../utilidades/postit.php");



if ($_GET[ids]==''){
$ids=$_POST[ids];
}else{
$ids=$_GET[ids];
}

include("../barra.php");
$guardar="TERMINAR";


if ($_GET[id]==''){
$resultadociclo = pg_query($con,"SELECT count(id_pedido)  FROM detalle_pedido where id_pedido='$ids'");
 $cant_regciclo=pg_fetch_array($resultadociclo);
$n=$cant_regciclo[0];
$_GET[id]=$n;
$ruta="Mdespacho.php?id=$_GET[id]";
$resultado1 = pg_query($con,"SELECT * FROM orden_pedido where id_pedido='$ids'");
 $cant_reg1=pg_fetch_array($resultado1);
 $cant_reg1[1]=cambiaf_a_normal($cant_reg1[1]);

$_POST[ids]= $cant_reg1[0];
$_POST[fecha]=$cant_reg1[1];
$_POST[v1]=$cant_reg1[2];
$_POST[v2]=$cant_reg1[3];
$_POST[v3]=$cant_reg1[4];
$_POST[v4]=$cant_reg1[5];
}

if($_POST[submit1]){
$cont=$_GET[id];
$cont--;
$_GET[id]=$cont;
//echo "eliminar :".$cont;
$ruta="Mdespacho.php?id=$cont";
}
if($_POST[submit2]){
$cont=$_GET[id];
$cont++;
$_GET[id]=$cont;
//echo "agregar :".$cont;
$ruta="Mdespacho.php?id=$cont";
}
if($_POST[submit3]){
$cont=$_POST[ids];
echo $_POST[ids];
//echo "Guardar :".$cont;
$guardar="MODIFICAR";
$ruta="edit_despacho.php?id=$cont";
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
function asignar(field1,field2) {
diferencia=field1.value;
var mi_numero=diferencia;

field2.value=mi_numero;


}

function comparar(field1,field2,field3,countfield) {
if (field1.value >= countfield.value)
field1.value = "";

}
  </script>
 
 <?php
//include("../atras.php"); 
 ?>
<table width="640" border="0" align="center" bgcolor="#FFFFFF">
  <tr> 
    <td colspan="2"><strong>Modificar Orden de Pedido</strong></td>
    <td width="73">&nbsp;</td>
  </tr>
  <tr> 
    <td width="60">&nbsp;</td>
    <td width="709"><em>Escriba las caracter&iacute;sticas de la Orden de Pedido:</em></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
        <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td><form id="form1" name="form1" method="post" action="<? echo $ruta; ?>">
        <table width="98%" height="150" border="0" cellpadding="2" cellspacing="0">
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td width="21%" height="23"> <div align="right"></div></td>
            
          </tr>
         <tr> 
             <td width="21%" height="28"> <div align="left"><font size="1"><strong>Id:</strong> 
            <td width="70%"><input autocomplete=OFF name="ids" type="text" id="ids" value="<?php echo $_POST[ids];?>"  size="15" >
              <font size="1"></td>
          </tr>
           <tr> 
             <td width="21%" height="28"> <div align="left"><font size="1"><strong>Fecha:</strong> 
            <td width="70%"><input autocomplete=OFF name="fecha" type="text" id="fecha" value="<?php echo $_POST[fecha];?>"  size="15" >
              <font size="1">* (dd-mm-yyyy)</td>
          </tr>
             <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td width="21%" height="26"> <div align="left"><font size="1"><strong>Nombre y Apellido o Razon Social :</strong></div></td>
            <td><input  size="50" name="v1" type="text"   value="<?php echo $_POST[v1];?>"  /> 
            </td>
          </tr>
            <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td width="21%" height="26"> <div align="left"><font size="1"><strong>Direccion:</strong></div></td>
            <td><input  size="50" name="v2" type="text"   value="<?php echo $_POST[v2];?>"  /> 
            </td>
          </tr>
 <tr> 
             <td width="21%" height="28"> <div align="left"><font size="1"><strong>Rif/CI:</strong> 
            <td width="70%"><input  name="v3" type="text" id="v3" value="<?php echo $_POST[v3];?>"  size="15" ></td>
          </tr>
                 </tr>          
             <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td width="21%" height="26"> <div align="left"><font size="1"><strong>Forma de Pago :</strong></div></td>
                 <td>
                <select name="v4" id="pago">
                <option  value="<? echo $_POST[v4]?>" selected><? echo $_POST[v4];?></option>
                <option value="EFECTIVO"> EFECTIVO</option>
                <option value="TD"> TD</option>
		<option value="TC"> TC</option>
		<option value="CHEQUE"> CHEQUE</option>
             
              </select>            </td>
          </tr>           
    </table>
        </table>
<?
$result4 = pg_query($con,"SELECT detalle_pedido.id_pedido,repuesto.codigo,repuesto.descripcion,detalle_pedido.costo,detalle_pedido.cantidad
FROM detalle_pedido 
Inner join repuesto on repuesto.id_repuesto=detalle_pedido.id_repuesto
where id_pedido=$ids");


 echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=350 bgcolor=#FFFFFF >";

echo "<tr>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=1>N. PARTE</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b><font size=1>DESCRIPCION</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=1>CANTIDAD</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b><font size=1>MONTO</b></td>";

echo "</tr> ";
while ($row4 = pg_fetch_row($result4)){
echo "<tr> ";
echo "<td <small style=width: 50px ><font size=1>$row4[1]</td> ";
echo "<td <small style=width: 50px ><font size=1>$row4[2]</td> ";
echo "<td <small style=width: 50px ><font size=1>$row4[4]</td> ";
echo "<td <small style=width: 50px ><font size=1>$row4[3]</td> ";

?>
        </p>
        <?PHP
echo "</tr> ";
}
echo "</table>";
?>


    
 <table width="60%" border="0" align="center" bgcolor=SILVER>
<tr>
<td><font size="1"> N. PARTE</td>
<td><font size="1"> DESCRIPCION</td>
<td><font size="1"> CANTIDAD</td>
<td><font size="1"> P.UNITARIO</td>
<td><font size="1"> MONTO BSF</td>

</tr>
<?php
for($x=1; $x<=$_GET[id]; $x++)
{ 
$resultado2 = pg_query($con,"SELECT * FROM repuesto where cantidad>0 order by descripcion");
$cont++;
$parte="parte".$x;
$descripcion="descripcion".$x;
$cantidad="cantidad".$x;
$monto="monto".$x;
$montot="montot".$x;

$presentacion="presentacion".$x;
if($_POST[$descripcion]!=""){

$resultado3 = pg_query($con,"SELECT * FROM repuesto where id_repuesto=$_POST[$descripcion]");
 $cant_reg2=pg_fetch_array($resultado3);
}else{

//$resultado3 = pg_query($con,"SELECT detalle_pedido.id_pedido,repuesto.codigo,repuesto.descripcion,detalle_pedido.costo,detalle_pedido.cantidad
//FROM detalle_pedido 
//Inner join repuesto on repuesto.id_repuesto=detalle_pedido.id_repuesto

//where id_pedido=$ids");

 //	$cant_reg2=pg_fetch_array($resultado3);

$cant_reg2[0]="";
$cant_reg2[2]="";
}
//echo $_POST[$descripcion];

$totalg=$cant_reg2[4]*$_POST[$cantidad];
$totalgg=$totalgg+$totalg;
if ($totalg==0){$totalg="";}
echo "<tr>"; 
echo "<td><div align=right><input name=$parte type=text readonly id=$parte size=9 value=$cant_reg2[1] >";
echo "<td><select name=$descripcion id=$descripcion>";

?>

<option value="<? echo $cant_reg2[0]?>" selected><? echo $cant_reg2[2]?></option>
<?
while($obj=pg_fetch_object($resultado2)){
?>
<option value="<? echo $obj->id_repuesto;?>"><? echo $obj->descripcion; ?></option>
<?
echo "</option>";
}//Fin while 
echo "</select></td>";
echo "</div></td>";

echo "<td><div align=center><input name=$cantidad type=text  onKeyPress='return acceptNum(event)' id=$cantidad size=5 value=$_POST[$cantidad] >";

echo "<td><div align=center><input name=$monto type=text readonly id=$monto size=5 value=$cant_reg2[4] >";
echo "<td><div align=center><input name=$montot type=text readonly id=$montot size=7 value=$totalg >";
echo "<td>";
//echo "<td>";
//  echo "<input value=X type=submit name=submit4 />";
//  echo "</td>";
echo "</tr>";
$cant_reg2[1]="";
$cant_reg2[4]="";
$montot="";
}
echo "<tr>";
echo "<td></td>";
echo "<td>";
  echo "<input value=ELIMINAR type=submit name=submit1 />";
  echo "</td>";
echo "<td>";
  echo "<input value=AGREGAR type=submit name=submit2 />";
  echo "</td>";  
  echo "</tr>";
?> 
          
          <tr>
  <td>&nbsp;</td>   
             <td width="21%" height="28"> <div align="right"><font size="1"><strong>Monto total de la Venta:</strong> 
 <td>&nbsp;</td>   

       <td>&nbsp;</td> 
              </td>
      <td width="70%"><input autocomplete=OFF name="total" type="text" id="total" value="<?php echo $totalgg;?>"  size="7" >
              </td>
          </tr>   
           <td>&nbsp;</td>          
           <td>&nbsp;</td>
          <tr> 
          <td ></td>
            <td width="10%"><div align="center"><strong> 
               
                <input value="<? echo $guardar; ?>" type="submit" name="submit3" />
                </strong></div></td>
            
          </tr>
             </form></td>
       </table>   
    <td>&nbsp;</td>
  </tr>

 <?php
include("../pie.php"); 
 ?>
