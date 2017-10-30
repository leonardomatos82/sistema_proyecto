<?php
include("../config.php");
include("../cheque/numero2.php"); 
include("../control/valida.php"); 
$queryg="select *
from cheque 
where estado='PAGADO'";
$resultg=pg_query($con,$queryg);
$rowg=pg_fetch_array($resultg);

while ($rowg = pg_fetch_row($resultg)){
if ($_POST[bolivares]<>0){}
$query2="SELECT * FROM configuracion where id_configuracion='1'";
$result2=pg_query($con,$query2);
$row2=pg_fetch_array($result2);

$query="select *
from cheque 
where ncheque='$rowg[1]'";
$result=pg_query($con,$query);
$row=pg_fetch_array($result);
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
<table width="771" border="0" cellpadding="1" cellspacing="0">
  <tr> 
    <td width="769" height="220"> <div align="left"> 
        <table width="98%" height="115" border="0" cellpadding="2" cellspacing="0">
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td width="23%">&nbsp;</td>
            <td width="10%"> <div align="right"></div></td>
            <td width="22%"><?php echo $row['ncheque'];?></td>
            <td align="center" width="36%"><div align="left"> **<?php echo number_format($row['monto_cheque'],2);?>**&nbsp; 
              </div></td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td height="23">&nbsp;</td>
            <td> <div align="right"></div></td>
            <td><div align="left"><font size="2">NO ENDOSABLE </font></div></td>
            <td>&nbsp;</td>
            <td>&nbsp; </td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td height="19" colspan="5"> <div align="left"></div></td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td height="23" colspan="5"> <div align="left">******** <?php echo $row['beneficiario'];?>&nbsp; 
              </div></td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td colspan="5"> <div align="left"><?php echo ($x).$muestra;?>&nbsp; 
              </div></td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td colspan="5"><font size="2">********************</font></td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td colspan="4"><div align="left"><font size="2"><?php echo $row2['sede'];?>, 
                <script>
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
document.write (dia_mes + " de " + nombres_meses[mes - 1] + "___________" + anio)
 
                </script>
                </font></div></td>
            <td>&nbsp;</td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td colspan="3" rowspan="2"><div align="left"><img src="../imagenes/logo_biv.gif" width="189" height="35"></div></td>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr bordercolor="#000000" bgcolor="#FFFFFF"> 
            <td colspan="3">&nbsp;</td>
            <td colspan="2"><font size="2">CADUCA A LOS 30 DIAS</font></td>
          </tr>
        </table>
      </div>
      <p align="left">&nbsp;</p></td>
  </tr>
</table>
<p>______________________________________________________________________________________________</p>
<table width="617" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td height="0" colspan="3"> <div align="center"></div></td>
  </tr>
  <tr> 
    <td height="0"><strong><font size="4" face="Times New Roman, Times, serif"><img src="../imagenes/ubv.jpg" width="70" height="62" /></font></strong></td>
    <td height="0" colspan="2"><p align="center"><strong><font size="4" face="Times New Roman, Times, serif">UNIVERSIDAD 
        BOLIVARIANA DE VENEZUELA</font></strong></p>
      <p align="center"><strong><font size="4" face="Times New Roman, Times, serif">SEDE 
        <?php echo $row2['sede'];?> -PORTUGUESA</font></strong></p></td>
  </tr>
  <tr> 
    <td height="0">&nbsp;</td>
    <td height="0" colspan="2"> <div align="center"><strong> 
        <script>
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
document.write (nombres_dias[dia_semana] + ", " + dia_mes + " de " + nombres_meses[mes - 1] + " de " + anio)
 
                    </script>
        </strong>&nbsp;</div></td>
  </tr>
  <tr> 
    <td width="144" height="0">&nbsp;</td>
    <td width="345" height="0"> <div align="center"></div></td>
    <td width="128" height="0">&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td colspan="2"><div align="right"> &nbsp;</div></td>
  </tr>
  <tr> 
    <td><div align="right"><strong>CONCEPTO : </strong></div></td>
    <td colspan="2" rowspan="2" font size="2"> <?php echo "<small style=width: 50px >$row[concepto]";?></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="23">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<p> 
  <?php
$result4 = pg_query($con,"SELECT p_terciaria.codigo_t,p_terciaria.descripcion,distribucion_cheque.cod_partida, p_terciaria.id_p_terciaria,distribucion_cheque.monto
 FROM distribucion_cheque 
  INNER JOIN p_terciaria ON distribucion_cheque.cod_partida= p_terciaria.id_p_terciaria 
where ncheque='$rowg[1]'");

 echo "<table align=left cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=640 bgcolor=#FFFFFF >";

echo "<tr>";
echo "<td <small style=width: 50px font-weight: bold><b>PARTIDA PRESUPUESTARIA</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>DESCRIPCION</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>MONTO</b></td>";

echo "</tr> ";
while ($row4 = pg_fetch_row($result4)){
echo "<tr> ";
$row4[4]=number_format($row4[4],2);
echo "<td <small style=width: 50px >$row4[0]</td> ";
echo "<td <small style=width: 50px >$row4[1]</td> ";
echo "<td <small style=width: 50px >$row4[4]</td> ";
?>
</p>
<?PHP
echo "</tr> ";
}
echo "</table>";
?>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="709" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr bordercolor="#CCCCCC"> 
    <td width="149">&nbsp;</td>
    <td width="353"><div align="right"><strong>TOTAL:</strong></div></td>
    <td width="123"><div align="left"><strong><?php echo number_format($row['monto_cheque'],2);?></strong></div></td>
  </tr>
  <tr> 
    <td height="25"> <div align="center"><strong>BANCO :</strong></div></td>
    <td><img src="../imagenes/BIV.jpg" width="113" height="26"> </td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td><div align="center"><strong>CUENTA :</strong></div></td>
    <td><?php echo $row2['cuenta'];?></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td><div align="center"><strong>CHEQUE :</strong></div></td>
    <td><?php echo $row['ncheque'];?></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td><div align="center"><strong>PROGRAMA :</strong></div></td>
    <td><?php echo $row['programa'];?></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td><div align="center"><strong>COD. CONTABLE : </strong></div></td>
    <td><?php echo $row['cod_contable'];?></td>
    <td>&nbsp;</td>
  </tr>
</table>
<p>&nbsp;</p>
<table width="709" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr bordercolor="#CCCCCC"> 
    <td width="154"><strong><font size="2">ELABORADO POR</font></strong></td>
    <td width="181"><strong><font size="2">REVISADO POR</font></strong></td>
    <td width="185"><strong><font size="2">AUTORIZADO POR</font></strong></td>
    <td width="189"><strong><font size="2">RECIB&Iacute; CONFORME</font></strong></td>
  </tr>
  <tr> 
    <td><font size="2"><?php echo $row2['administrador'];?></font></td>
    <td><font size="2"><?php echo $row2['coordinador_adm'];?></font></td>
    <td><font size="2"><?php echo $row2['coordinador_sede'];?></font></td>
    <td><font size="2"><?php echo $row['beneficiario'];?></font></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>RIF y/o C.I .<?php echo $row['cedula_rif'];?></td>
    <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>fecha de Recibido</td>
    </tr>

  </tr>
</table>

<table width="93%" border="0" align="left" cellpadding="0" cellspacing="0">
  <tr> 
    <td><div align="left"><font face="CodabarMedium"><?php echo $row['ncheque'].$row['beneficiario'].$row['monto_cheque'];?> 
       
        </strong></font></div></td>
  </tr>
</table>
<p> <a href="../cheque/ver_impcheque.php?>">Atras</a> </p>
<?
}
?>

