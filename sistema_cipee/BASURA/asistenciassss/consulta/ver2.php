<?php 
include("../control/valida.php"); 
include("../config.php");
$total=0;
$result = pg_query($con,"SELECT * FROM oficio");
$row=pg_fetch_array($result);
?>
<style type="text/css">
<!--
.style3 {font-size: 16px}
-->
</style>
<body style="background-color: rgb(255,255, 255);">
<tbody>
  <tr align="center">
      <td style="width: 750px; background-color: rgb(255, 255, 255);"><p><img src="../imagenes/bannertop22.png" alt="" width="77%" style="width: 100%; height: 90px;"></p>
        <p align="right">DA:____________</p>
        <p align="center"><strong>MEMORANDUM</strong></p>
        <table width="814" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="59" height="22"><strong>Para:</strong></td>
            <td width="755"><strong><?php echo $row[para]; ?>. -
                <?php echo $row[dest]; ?></strong></td>
          </tr>
          <tr>
            <td height="25"><strong>De:</strong></td>
            <td><p><strong><?php echo $row[de]; ?></strong>.-<strong><?php echo $row[rem]; ?></strong></p>
            </td>
          </tr>
          <tr>
            <td height="33"><strong>Asunto:</strong></td>
            <td><strong>Solicitud de Autorizaci&oacute;n Presupuestaria </strong></td>
          </tr>
          <tr>
            <td height="24"><strong>Fecha:</strong></td>
            <td><strong>
              <script language="javascript">
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
document.write(nombres_dias[dia_semana] + ", " + dia_mes + " de " + nombres_meses[mes - 1] + " de " + anio)

//-->
              </script>
            &nbsp;</strong></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
        <p align="justify">&nbsp;</p>
        <p align="justify"><span class="style3">Me es grato dirigirme a usted en la oportunidad de remitirle solicitudes de vi&aacute;ticos en tabla anexa, con sus respectivos soportes, para proceder al aval de esa Direcci&oacute;n a su cargo y solicitar Disponibilidad Presupuestaria.</span></p>
        <p>&nbsp;</p>
        <p align="right">&nbsp;</p></td>
</tr>
<tbody>
<p>Sin m&aacute;s a que hacer referencia. </p>
<p align="justify" class="style3">&nbsp;</p>
<p align="justify" class="style3">&nbsp;</p>
<p align="justify" class="style3">&nbsp;</p>
<p align="center"><strong>Atentamente,</strong></p>
<p align="center"><strong>___________________</strong></p>
<table width="320" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><div align="center"><strong><?php echo $row[rem]; ?></strong></div></td>
  </tr>
  <tr>
    <td><div align="center"><strong><?php echo $row[de]; ?></strong></div></td>
  </tr>
</table>
<p align="center">&nbsp;</p>
<p align="center"><strong><?php echo $row[pie]; ?></strong></p>
<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
<p align="center">&nbsp;</p>
<p align="center"><img src="../imagenes/bannertop22.png" alt="" width="77%" style="width: 100%; height: 90px;"></p>
<p align="center"><strong>TABLA DE VIATICOS </strong></p>
<table width="77%" height="48" border="0"  align="center" cellpadding="0" cellspacing="0"   style="background-color: rgb(255, 255, 255); text-align: center; width: 100%; height: 60px;" >
  <tbody>
  </tbody>
  <tr>
    <td width="100%" height="42" bordercolor="#000000" bgcolor="#FFFFFF"><div align="center">
      <?php
	  $d=$_POST[desde];
	  $h=$_POST[hasta];

$result = pg_query($con,"SELECT viaticos.id_viatico,viaticos.cedula,usuario.nomb_usuario,viaticos.motivo,viaticos.fecha_ida,viaticos.fecha_ret,viaticos.total
 FROM viaticos 
  INNER JOIN usuario ON viaticos.cedula= usuario.cedula 
  where id_viatico>='$d' and id_viatico<='$h'  
 ");

echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=100% bgcolor=#FFFFFF >";

 
echo "<tr>";
echo "<td <small style=width: 100px font-weight: bold><b>ID</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>CEDULA</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>NOMBRE Y APELLIDO</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>FECHA IDA</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>FECHA RET</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>TOTAL</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>MOTIVO</b></td>";



echo "</tr> ";
while ($row = pg_fetch_row($result)){
echo "<tr> ";
echo "<td <small style=width: 50px >$row[0]</td> ";
echo "<td <small style=width: 50px >$row[1]</td> ";
echo "<td <small style=width: 50px >$row[2]</td> ";
echo "<td <small style=width: 50px >$row[4]</td> ";
echo "<td <small style=width: 50px >$row[5]</td> ";
echo "<td <small style=width: 50px >$row[6]</td> ";
echo "<td <small style=width: 50px >$row[3]</td> ";
$total=$total+$row[6];
?>
      </p>
    </div>
        <?PHP
echo "</tr> ";
}

echo "</table>";
?>
      &nbsp;
  </tr>
</table>
<p align="right"><strong>Total Bs.
    <?PHP
echo $total;
?>
</strong></p>
