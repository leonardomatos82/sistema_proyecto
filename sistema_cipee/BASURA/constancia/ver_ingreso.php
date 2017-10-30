<?php
session_start();
include("../config.php");
//include("../control/valida.php"); 

$query2="SELECT * FROM configuracion where id_configuracion='1'";
$result2=pg_query($con,$query2);
$row2=pg_fetch_array($result2);
$query="select despacho.id_despacho,despacho.nombre_entrega,departamento.nombre_departamento
from despacho 
INNER JOIN departamento on departamento.id_departamento=despacho.id_departamento
where id_despacho='$_GET[id]'";
$result=pg_query($con,$query);
$row=pg_fetch_array($result);

include("cantidad.php"); 
if($row['id_caja_chica']<1000)
 {$asig="BNS-0";}
 if($row['id_caja_chica']<100)
 {$asig="BNS-00";}
  if($row['id_caja_chica']<10)
 {$asig="BNS-000";}

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
   
<p align="left"><img src="../imagenes/bannertop22.png" alt="" width="77%" style="width: 100%; height: 90px;"></p>

<p align="right">
               <td width="79%"> <strong>Barinas, 
             <?php
$dia=date("d");
$mes=date("m");
$yea=date("Y");
?>  
 <script>
<!--
  var variableServidor = '<?echo $dia;?>'
   nombres_dias = new Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado")
   nombres_meses = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre")
   fecha_actual = new Date()
   dia_mes = '<?echo $dia;?>'		//dia del mes
   strdia_mes = (dia_mes <= 9) ? "0" + dia_mes : dia_mes
   dia_semana = fecha_actual.getDay()		//dia de la semana
   mes = '<?echo $mes;?>'
   strmes = (mes <= 9) ? "0" + mes : mes
   anio = '<?echo $yea;?>'
   if (anio < 100) anio = "19" + anio			//pasa el año a 4 digitos
   else if ( ( anio > 100 ) && ( anio < 999 ) ) {	//efecto 2000
      var cadena_anio = new String(anio)
      anio = "20" + cadena_anio.substring(1,3)
   }
<!-- document.write
document.write ( dia_mes + " de " + nombres_meses[mes - 1] + " del " + anio)
 
</script>
              </strong></p>
             
 <p align="center"><strong>	NOTA DE ENTREGA DE MATERIALES Y SUMINISTROS </strong></p>
<table width="617" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
   
    <td height="0" colspan="3"> <div align="center"></div></td>
  </tr>
  
  
  <?php	
//include("../control/valida.php"); 

include("../css.php");
$guardar="TERMINAR";
$resultado1 = pg_query($con,"SELECT * FROM usuario order by nombre");



$rc2="SELECT MIN(id_detalle_ingreso_material)  FROM detalle_ingreso_material where id_ingreso_material=$_GET[cod]";
                        $val1=pg_query($con,$rc2);
                          $min=pg_fetch_array($val1);
                          
 $rc3="SELECT MAX(id_detalle_ingreso_material)  FROM detalle_ingreso_material where id_ingreso_material=$_GET[cod]";
                        $val2=pg_query($con,$rc3);
                          $max=pg_fetch_array($val2);
                          
 $rc4="SELECT COUNT(id_detalle_ingreso_material)  FROM detalle_ingreso_material where id_ingreso_material=$_GET[cod]";
                        $val3=pg_query($con,$rc4);
                          $total=pg_fetch_array($val3);


if ($_GET[id]==""){$_GET[id]=$total[0];}

if($_POST[submit1]){
$cont=$_GET[id];
$cont--;
$_GET[id]=$cont;
//echo "eliminar :".$cont;
$ruta="Mingresom.php?cod=$_GET[cod]&id=$cont";
}
if($_POST[submit2]){
$cont=$_GET[id];
$cont++;
$_GET[id]=$cont;
$ruta="Mingresom.php?cod=$_GET[cod]&id=$cont";
}
if($_POST[submit3]){
$cont=$_GET[id];
//echo "Guardar :".$cont;
$guardar="GUARDAR";
$ruta="edit_ingreso_material.php?cod=$_GET[cod]&id=$cont";
}



  $resultado="SELECT ingreso_material.fecha,ingreso_material.fecha_fact,usuario.nombre,ingreso_material.factura,ingreso_material.monto
 ,ingreso_material.id_ingreso_material,ingreso_material.cedula_rif
 FROM ingreso_material
 INNER JOIN detalle_ingreso_material on detalle_ingreso_material.id_detalle_ingreso_material=ingreso_material.id_ingreso_material
INNER JOIN usuario on usuario.cedula_rif=ingreso_material.cedula_rif
where ingreso_material.id_ingreso_material=$_GET[cod]
   ORDER BY ingreso_material.fecha DESC ,ingreso_material.fecha_fact DESC";
 $qrc2=pg_query($con,$resultado);
 $row=pg_fetch_array($qrc2);
$_POST[fecha]=$row[0];
$_POST[fecha_fact]=$row[1];
$_POST[factura]=$row[3];
$_POST[monto]=$row[4];
$_POST[proveedor]=$row['cedula_rif'];

 $resultado4="SELECT * FROM usuario where cedula_rif='$_POST[proveedor]'";
 $qrc2=pg_query($con,$resultado4);
 $row4=pg_fetch_array($qrc2);



$_POST[fecha]=cambiaf_a_normal($_POST[fecha]);
$_POST[fecha_fact]=cambiaf_a_normal($_POST[fecha_fact]);
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
    <td colspan="2"><strong>Ingreso de Materiales al Inventario</strong></td>
    
  </tr>
  <tr> 
    <td width="60">&nbsp;</td>
    <td width="709"><em>Escriba las caracter&iacute;sticas del Ingreso:</em></td>
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
             <td width="21%" height="28"> <div align="left"><strong>Fecha:</strong> 
            <td width="70%"><input autocomplete=OFF name="fecha" type="text" id="fecha" value="<?php echo $_POST[fecha];?>"  size="15" >
              * (dd-mm-yyyy)</td>
          </tr>
           <tr> 
             <td width="21%" height="28"> <div align="left"><strong>Fecha Fact:</strong> 
            <td width="70%"><input autocomplete=OFF name="fecha_fact" type="text" id="fecha_fact" value="<?php echo $_POST[fecha_fact];?>"  size="15" >
              * (dd-mm-yyyy)</td>
          </tr>
             <tr> 
             <td width="21%" height="28"> <div align="left"><strong>Factura:</strong> 
            <td width="70%"><input autocomplete=OFF name="factura" type="text" id="factura" value="<?php echo $_POST[factura];?>"  size="15" >
              *</td>
          </tr>
             <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td width="21%" height="26"> <div align="left"><strong>Monto Fact:</strong></div></td>
            <td><input  size="10" name="monto" type="text"   value="<?php echo $_POST[monto];?>"  /> 
            </td>
          </tr>
                 </tr>          
             <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td width="21%" height="26"> <div align="left"><strong>Proveedor:</strong></div></td>
                 <td>
               <select name="proveedor" id="select">
                <option value="<? echo $row4['cedula_rif']?>" selected><? echo $row4['nombre']?></option>
                <?php while($obj=pg_fetch_object($resultado1)){?>
                <option value="<? echo $obj->cedula_rif?>"><? echo $obj->nombre?></option>
                <? }//Fin while ?>
              </select>            </td>
          </tr>           
          
    </table>
        </table>
    
 <table width="40%" border="0" align="center" bgcolor=SILVER>
<tr>
<td>MATERIALES</td>
<td>PRESENT</td>
<td>CANTIDAD</td>

</tr>
<?php
 
 
                       
 $final=$total[0]; 
  
 $minimo=$min[0];   
 
 
                     
if ($cont>=$final){$final=$cont;}
for($x=1; $x<=$final; $x++)
{ 
$resultado2 = pg_query($con,"SELECT * FROM material where existencia>0 order by descripcion");

//$cont++;
 $l++;
$partida="partida".$l;
$cantidad="cantidad".$l;
$presentacion="presentacion".$l;



  $resb="SELECT * FROM detalle_ingreso_material where id_detalle_ingreso_material= $minimo ";
  $minimo++;
                         $resb2=pg_query($con,$resb);
                         $consulta=pg_fetch_array($resb2);
     
                     
                        

$id_material= $consulta[1];

$_POST[$cantidad]=$consulta[3];
$_POST[$presentacion]=$consulta[2];
//if($_POST[$partida]!=""){
 $resultado3 = pg_query($con,"SELECT * FROM material where id_material=$id_material");
 $cant_reg2=pg_fetch_array($resultado3);


echo "<tr>"; 
echo "<td><select name=$partida id=$partida >";

?>

<option value="<? echo $cant_reg2[5]?>" selected><? echo $cant_reg2[1]?></option>
<?
while($obj=pg_fetch_object($resultado2)){
?>
<option value="<? echo $obj->id_material;?>"><? echo $obj->descripcion; ?></option>
<?
echo "</option>";
}//Fin while 
echo "</select></td>";
echo "</div></td>";
echo "<td> <select name=$presentacion>";
echo "<option value=$_POST[$presentacion]>$_POST[$presentacion]</option>";
echo "<option value=UNIDAD>UNIDAD</option>";
echo "<option value=CAJA>CAJA</option>";
echo "<option value=RESMA>RESMA</option>";
echo "<option value=PAQUETE>PAQUETE</option>";
echo "</select></td>";
echo "<td><div align=right><input name=$cantidad type=text  id=$cantidad size=5 value=$_POST[$cantidad] >";
echo "<td>";
//echo "<td>";
//  echo "<input value=X type=submit name=submit4 />";
//  echo "</td>";
echo "</tr>";

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
          
             </table>
           <td>&nbsp;</td>          
           <td>&nbsp;</td>
          <tr> 
          <td ></td>
            <td width="10%"><div align="center"><strong> 
               
                <input value="<? echo $guardar; ?>" type="submit" name="submit3" />
                </strong></div></td>
            
          </tr>
             </form></td>
          
    <td>&nbsp;</td>
  </tr>
 <?php
include("../pie.php"); 
 ?>

  
  
  
  
  
  
  
  
  
  
