<?php
session_start();
include("../config.php");
//include("../control/valida.php"); 

$query2="SELECT * FROM configuracion where id_configuracion='1'";
$result2=pg_query($con,$query2);
$row2=pg_fetch_array($result2);


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

<p align="right"><strong>Barinas, 
              <script>
<!--
   nombres_dias = new Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado")
   nombres_meses = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre")
   fecha_actual = new Date()
   dia_mes = fecha_actual.getDate()		//dia del mes
   strdia_mes = (dia_mes <= 9) ? "0" + dia_mes : dia_mes
   dia_semana = fecha_actual.getDay()		//dia de la semana
   mes = fecha_actual.getMonth() + 1
   strmes = (mes <= 9) ? "0" + mes : mes
   anio = fecha_actual.getYear()
   if (anio < 100) anio = "19" + anio			//pasa el año a 4 digitos
   else if ( ( anio > 100 ) && ( anio < 999 ) ) {	//efecto 2000
      var cadena_anio = new String(anio)
      anio = "20" + cadena_anio.substring(1,3)
   }
<!-- document.write
document.write (dia_mes + " de " + nombres_meses[mes - 1] + " de " + anio)
 
</script>
              </strong></p>
             
 <p align="center"><strong>	INVENTARIO DE MATERIALES Y SUMINISTROS </strong></p>

   <p>&nbsp;</p>
  <?php
$result4 = pg_query($con,"SELECT *
 FROM MATERIAL order by descripcion
");
echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=640 bgcolor=#FFFFFF >";
echo "<tr>";
echo "<td <small style=width: 50px font-weight: bold><b>Nº</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>MATERIAL O SUMINISTRO</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>PRESENTACION</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>CANTIDAD</b></td>";

echo "</tr> ";
while ($row4 = pg_fetch_row($result4)){$c++;
echo "<tr> ";
//$row4[4]=number_format($row4[4],2);
echo "<td <small style=width: 50px >$c</td> ";
echo "<td <small style=width: 50px >$row4[1]</td> ";
echo "<td <small style=width: 50px >$row4[2]</td> ";
echo "<td <small style=width: 50px >$row4[3]</td> ";
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