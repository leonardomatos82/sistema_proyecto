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
   nombres_dias = new Array("Domingo", "Lunes", "Martes", "MiÃ©rcoles", "Jueves", "Viernes", "SÃ¡bado")
   nombres_meses = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre")
   fecha_actual = new Date()
   dia_mes = '<?echo $dia;?>'		//dia del mes
   strdia_mes = (dia_mes <= 9) ? "0" + dia_mes : dia_mes
   dia_semana = fecha_actual.getDay()		//dia de la semana
   mes = '<?echo $mes;?>'
   strmes = (mes <= 9) ? "0" + mes : mes
   anio = '<?echo $yea;?>'
   if (anio < 100) anio = "19" + anio			//pasa el aÃ±o a 4 digitos
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
  
     <td height="23"><strong>Numero: <?php echo $asig.$row['id_despacho'];?></strong></td>
    <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="23">YO: <?php echo $row['nombre_entrega'];?></td>
  </tr>  
   <tr> 
    <td height="23">UNIDAD : <?php echo $row['nombre_departamento'];?></td>
  </tr>
  </table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">     
     
     <tr>      
    <td height="23">He recibido de parte de la CoordinaciÃ³n de AdministraciÃ³n de la Universidad Bolivariana de Venezuela,sede <?php echo $row2['sede'];?> -PORTUGUESA, el (los) material(es) detallados a continuaciÃ³n:</td>
     </tr>
   </table> 
   <p>&nbsp;</p>
  <?php
$result4 = pg_query($con,"SELECT material.descripcion,detalle_despacho.presentacion,detalle_despacho.cantidad
 FROM detalle_despacho
INNER JOIN material ON material.id_material=detalle_despacho.id_material
where detalle_despacho.id_despacho ='$_GET[id]'");
echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=640 bgcolor=#FFFFFF >";
echo "<tr>";
echo "<td <small style=width: 50px font-weight: bold><b>NÂº</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>MATERIAL O SUMINISTRO</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>PRESENTACION</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>CANTIDAD</b></td>";

echo "</tr> ";
while ($row4 = pg_fetch_row($result4)){$c++;
echo "<tr> ";
//$row4[4]=number_format($row4[4],2);
echo "<td <small style=width: 50px >$c</td> ";
echo "<td <small style=width: 50px >$row4[0]</td> ";
echo "<td <small style=width: 50px >$row4[1]</td> ";
echo "<td <small style=width: 50px >$row4[2]</td> ";
?>
</p>
<?PHP
echo "</tr> ";
}
echo "</table>";
?>   
   
   <table width="709" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<td>&nbsp;</td>
<td>&nbsp;</td>
<p>&nbsp;</p>
</table> 
   
  <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p> 
   
<p>&nbsp;</p>
<table align="center" width="709" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr bordercolor="#CCCCCC"> 
    <td width="154"><strong><font size="2">ENTREGADO POR</font></strong></td>
    <td width="181"><strong><font size="2">REVISADO POR</font></strong></td>
    <td width="185"><strong><font size="2"></font></strong></td>
    <td width="189"><strong><font size="2">RECIB&Iacute; CONFORME</font></strong></td>
  </tr>
  <tr> 
    <td><font size="2"><?php echo $_SESSION[nomb_usuario];?></font></td>
    <td><font size="2"><?php echo $row2['coordinador_adm'];?></font></td>
    <td><font size="2">    </font></td>
    <td><font size="2"><?php echo $row['nombre_entrega'];?></font></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>C.I .<?php echo $row['cedula_rif'];?></td>
    <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>fecha de Recibido</td>
    </tr>

  </tr>
</table>
<tr> 
    <td>&nbsp;</td>
    
   </tr>

<td>&nbsp;</td>
<td>&nbsp;</td>
<p>&nbsp;</p>
<td>&nbsp;</td>
<td>&nbsp;</td>
<p>&nbsp;</p>
<table width="709" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<td>&nbsp;</td>
<td>&nbsp;</td>
<p>&nbsp;</p>
</table>
<table align="left" width="93%" border="0" align="left" cellpadding="0" cellspacing="0">
  <tr> 
    <td><div align="left"><font face="CodabarMedium"><?php echo $row['id_despacho'].$row['nombre_entrega'].$row['nombre_departamento'];?> 
       
        </strong></font></div></td>
  </tr>
</table>