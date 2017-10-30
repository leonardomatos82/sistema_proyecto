<?php
include("../config.php");
include("../utils.php");
include("../cheque/estilo_cheque.php"); 
if ($_POST[bolivares]<>0){}
$query2="SELECT * FROM configuracion where id_configuracion='1'";
$result2=pg_query($con,$query2);
$row2=pg_fetch_array($result2);

$query="select *
from cheque 
where ncheque='$_GET[id]'";
$result=pg_query($con,$query);
$row=pg_fetch_array($result);

include("../cheque/numero2.php"); 
$result = pg_query($con,"SELECT *
 FROM retencion_isrl 
where comprobante='$_GET[id]'
 
 ");
 $resultaa = pg_query($con,"SELECT *
 FROM retencion_isrl 
 where comprobante='$_GET[id]' 
 ");
$sujeto=pg_fetch_array($resultaa);
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
<table width="617" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td width="144" rowspan="5"><div align="center"><strong><font size="4" face="Times New Roman, Times, serif"><img src="../imagenes/ubv.jpg" width="70" height="62" /></font></strong></div></td>
    <td height="0"><p align="left"><strong><font size="2">REPUBLICA BOLIVARIANA 
        DE VENEZUELA</font></strong></p></td>
  </tr>
  <tr> 
    <td height="0"> <div align="left"><font size="2"><strong>MINISTERIO DEL PODER 
        POPULAR PARA LA</strong></font></div></td>
  </tr>
  <tr> 
    <td height="15"> 
      <div align="left"><font size="2"><strong><font face="Times New Roman, Times, serif">EDUCACION 
        SUPERIOR</font></strong></font></div></td>
  </tr>
  <tr> 
    <td height="0"><font size="2"><strong><font face="Times New Roman, Times, serif">UNIVERSIDAD 
      BOLIVARIANA DE VENEZUELA</font> </strong></font></td>
  </tr>
  <tr> 
    <td height="0"><strong><font size="2" face="Times New Roman, Times, serif">SEDE 
      <?php echo $row2['sede'];?> -PORTUGUESA</font></strong></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td height="0"><strong> </strong></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="0">&nbsp;</td>
  </tr>
</table>
<table width="824" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td height="0" colspan="3"> <div align="center"></div></td>
  </tr>
  <tr> 
    <td width="203" rowspan="3"><div align="center"><strong></strong></div></td>
    <td height="0" colspan="2"><p align="left"><strong><font size="4" face="Times New Roman, Times, serif">COMPROBANTE 
        DE RETENCION DEL ISRL</font></strong></p></td>
  </tr>
  <tr> 
    <td height="0" colspan="2"> <div align="center"><strong> </strong>&nbsp;<strong> 
        </strong></div></td>
  </tr>
  <tr> 
    <td width="311" height="0"> <div align="center"><strong> </strong></div></td>
    <td width="310" height="0">&nbsp;</td>
  </tr>
  <tr> 
    <td><div align="right"><font size="2"><strong>FECHA :</strong></font></div></td>
    <td colspan="2"> <script>
<!--
   nombres_dias = new Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado")
   nombres_meses = new Array("ENERO", "FEBRERO", "MARZO", "ABRIL", "MAYO", "JUNIO", "JULIO", "AGOSTO", "SEPTIEMBRE", "OCTUBRE", "NOVIEMBRE", "DICIEMBRE")
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
document.write (dia_mes + "/" + strmes + "/" + anio)
 
                    </script> </td>
  </tr>
  <tr> 
    <td><div align="right"><font size="2"><strong>PERIODO FISCAL :</strong></font></div></td>
    <td colspan="2"><script>
<!--
   nombres_dias = new Array("Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado")
   nombres_meses = new Array("ENERO", "FEBRERO", "MARZO", "ABRIL", "MAYO", "JUNIO", "JULIO", "AGOSTO", "SEPTIEMBRE", "OCTUBRE", "NOVIEMBRE", "DICIEMBRE")
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
document.write (" ANO: "+ anio + " / MES: " + strmes)
 
                    </script></td>
  </tr>
  <tr> 
    <td><div align="right"><font size="2"><strong>COMPROBANTE N :</strong></font></div></td>
    <td colspan="2"><?php echo $sujeto['comprobante'];?></td>
  </tr>
  <tr> 
    <td><div align="right"><font size="2"><strong>AGENTE DE RETENCI&Oacute;N :</strong></font></div></td>
    <td colspan="2">UNIVERSIDAD BOLIVARIANA DE VENEZUELA-SEDE BARINAS-PORTUGUESA</td>
  </tr>
  <tr> 
    <td><div align="right"><font size="2"><strong>RIF :</strong></font></div></td>
    <td colspan="2"><?php echo $row2['rif'];?></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr> 
    <td><div align="right"><font size="2"><strong>SUJETO RETENIDO :</strong></font></div></td>
    <td colspan="2"><strong><font size="2" face="Times New Roman, Times, serif"><?php echo $sujeto['sujeto'];?></font></strong></td>
  </tr>
  <tr> 
    <td><div align="right"><font size="2"><strong>RIF :</strong></font></div></td>
    <td colspan="2"><strong><font size="2" face="Times New Roman, Times, serif"><?php echo $sujeto['cedula_rif'];?></font></strong></td>
  </tr>
</table>
<p align="left"> 
  <?php
echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=650px bgcolor=#FFFFFF >";
echo "<tr>";
echo "<td <font size=1 align=left><small style=width: 50px><b>CONCEPTO----------</b></font></td>";
echo "<td <font size=1 align=left><small style=width: 50px><b>MONTO SUJETO</b></font></td>";
echo "<td <font size=1 align=center><small style=width: 50px><b>-%-</b></font></td>";
echo "<td <font size=1 align=left><small style=width: 50px><b>IMPUESTO</b></font></td>";
echo "</tr> ";
while ($row = pg_fetch_row($result)){
$resultx = pg_query($con,"SELECT p_terciaria.descripcion,p_terciaria.codigo_t,p_terciaria.id_p_terciaria
 FROM p_terciaria
 INNER JOIN distribucion_cheque ON distribucion_cheque.cod_partida= p_terciaria.id_p_terciaria
where distribucion_cheque.ncheque='$row[1]'
 ");
$monto_sujeto=$monto_sujeto+$row[6];
$total=$total+$row[8];
$row[6]= number_format($row[6],2);
$row[8]=number_format($row[8],2);
echo "<tr>";
echo "<td <font size=2><small style=width: 50px>$row[5]</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row[6]</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row[7]</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row[8]</font></td>";
?>
</p>
<p></p>

<?PHP

echo "</tr> ";
}
$m_monto_sujeto=number_format($monto_sujeto,2);
$mtotal=number_format($total,2);
echo "<tr>";
echo "<td <font size=1 align=right><small style=width: 50px><b>TOTAL:</b></font></td>";
echo "<td <font size=1 align=right><small style=width: 50px><b>$m_monto_sujeto</b></font></td>";
echo "<td <font size=1 align=center><small style=width: 50px><b>...</b></font></td>";
echo "<td <font size=1 align=right><small style=width: 50px><b>$mtotal</b></font></td>";
echo "</tr> ";
echo "</table>";

?>
<p>&nbsp;</p>
<table width="918" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr bordercolor="#CCCCCC"> 
    <td width="192"><strong><font size="2">ELABORADO POR</font></strong></td>
    <td width="201"><strong><font size="2">REVISADO POR</font></strong></td>
    <td width="273"><strong><font size="2">AUTORIZADO POR</font></strong></td>
    <td width="252"><div align="center"><strong><font size="2">SUJETO RETENIDO</font></strong></div></td>
  </tr>
  <tr> 
    <td><font size="2"><?php echo $row2['administrador'];?></font></td>
    <td><font size="2"><?php echo $row2['coordinador_adm'];?></font></td>
    <td><font size="2"><?php echo $row2['coordinador_sede'];?></font></td>
    <td><div align="center">
        <p><strong><font size="2">FIRMA Y SELLO</font></strong></p>
        <p>&nbsp;</p>
      </div></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><strong><font size="2">FIRMA Y SELLO AGENTE DE RETENCION</font></strong></td>
    <td>&nbsp;</td>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr></tr>
</table>

<table width="93%" border="0" align="left" cellpadding="0" cellspacing="0">
  <tr> 
    <td><div align="left"><font face="CodabarMedium"><?php echo $sujeto['comprobante'].$sujeto['sujeto'];?></font></div></td>
  </tr>
</table>
<p>&nbsp;</p>
 <p> <a href="../isrl/menu_isrl.php?>">Atras</a>&nbsp; </p>
