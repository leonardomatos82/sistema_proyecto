<?php
include("../config.php");
include("../utils.php");
$query2="SELECT * FROM configuracion where id_configuracion='1'";
$result2=pg_query($con,$query2);
$row2=pg_fetch_array($result2);
 if ($c==1){
$result = pg_query($con,$query="SELECT * from cheque where
tipo_f='$condicion' AND
ESTADO='ANULADO' AND
(fecha >= '$desde' AND fecha <= '$hasta')
ORDER BY id_cheque ASC
");
}else{
$cedula=$_GET[id];
$result = pg_query($con, "select * from pasantia"); 
$row=pg_fetch_array($result);
$row[fecha_inscripcion]=cambiaf_a_normal($row[fecha_inscripcion]);
$ano=date("Y");
$fecha=date("d-m-Y");
$resultpl = pg_query($con, "select * from periodo_lectivo where estado='ACTIVO'"); 
$rowpl=pg_fetch_array($resultpl);


////////////para contar autenticaciones
$rc="select id_pasantia from pasantia where cedula='".$cedula."'";
$qrc=pg_query($con,$rc);
$cant_reg=pg_fetch_array($qrc);
$num=$cant_reg[0];
$numerosig=$num;
if ($num<10)
{
$numerosig="0".$num;
}


}


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
    <td width="144" rowspan="5"><div align="center"><strong><font size="1" face="Times New Roman, Times, serif"><img src="../imagenes/ubv.jpg" width="70" height="62" /></font></strong></div></td>
    <td height="0"><p align="left"><strong><font size="1">REPUBLICA BOLIVARIANA 
        DE VENEZUELA</font></strong></p></td>
  </tr>
  <tr> 
    <td height="0"> <div align="left"><font size="1"><strong>MINISTERIO DEL PODER 
        POPULAR PARA LA</strong></font></div></td>
  </tr>
  <tr> 
    <td height="21"> <div align="left"><font size="1"><strong><font face="Times New Roman, Times, serif">EDUCACION 
        SUPERIOR</font></strong></font></div></td>
  </tr>
  <tr> 
    <td height="0"><font size="1"><strong><font face="Times New Roman, Times, serif">UNIVERSIDAD 
      BOLIVARIANA DE VENEZUELA</font> </strong></font></td>
  </tr>
  <tr> 
    <td height="0"><strong><font size="1" face="Times New Roman, Times, serif">SEDE 
      <?php echo $row2['sede'];?> -PORTUGUESA</font></strong></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td height="0"><strong> </strong></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td height="0"><div align="right"><strong> </strong></div></td>
  </tr>
</table>
<table width="617" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr> 
    <td height="0" colspan="3"> <div align="center"></div></td>
  </tr>
  <tr> 
    <td width="144" rowspan="3"><div align="center"><strong></strong></div></td>
    <td height="0" colspan="2"><p align="center"><strong><font size="3" face="Times New Roman, Times, serif">RELACI&Oacute;N 
        DE INSCRITOS EN PASANTIAS (<?php echo $_GET['tipo'];?>)</font></strong></p></td>
  </tr>
  <tr> 
    <td height="0" colspan="2"> <div align="center"><strong> </strong>Desde: <strong><font size="1" face="Times New Roman, Times, serif"><?php echo $_GET['desde_dia']."/".$_GET['desde_mes']."/".$_GET['desde_year'];?></font></strong>, 
        Hasta:<strong><font size="1" face="Times New Roman, Times, serif"> <?php echo $_GET['hasta_dia']."/".$_GET['hasta_mes']."/".$_GET['hasta_year'];?></font></strong> 
        <strong></strong>&nbsp;<strong> </strong></div></td>
  </tr>
  <tr> 
    <td width="345" height="0"> <div align="center"><strong> </strong></div></td>
    <td width="128" height="0">&nbsp;</td>
  </tr>
  <tr>
    <td><div align="right"><font size="2"><strong>CUENTA :</strong></font></div></td>
    <td colspan="2"><?php echo $row2['cuenta'];?></td>
  </tr>
</table>
<p>
  <?php
   

echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=100% bgcolor=#FFFFFF >";

 
echo "<tr>";
echo "<td <font size=5 align=left><b>N</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>ESTUDIANTE</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>FECHA EMISION</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>FECHA ANULADO</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>MOTIVO ANULACION</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>MONTO BS</b></font></td>";
echo "</tr> ";
while ($row = pg_fetch_array($result)){
$c++;
echo "<tr> ";
echo "<td <font size=-1 align=center><small style=width: 50px>$c</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$row[cedula]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$row[nombre]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$row[10]</font></td>";
echo "<td <font size=2 align=left><small style=width: 50px>$row[9]</font></td>";
echo "<td <font size=2 align=right><small style=width: 50px>$row[2]</font></td>";
?>
</p>
<p></p>

<?PHP

echo "</tr> ";
}
$mtotal=number_format($total,2);
echo "<tr>";
echo "<td <font size=2 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>-</b></font></td>";
echo "<td <font size=2 align=left><small style=width: 50px><b>TOTAL:</b></font></td>";
echo "<td <font size=2 align=right><small style=width: 50px><b>$mtotal</b></font></td>";
echo "</tr> ";
echo "</table>";
?>
<p>&nbsp;</p>
<table width="830" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr bordercolor="#CCCCCC"> 
    <td width="192"><strong><font size="2">ELABORADO POR</font></strong></td>
    <td width="201"><strong><font size="2">REVISADO POR</font></strong></td>
    <td width="273"><strong><font size="2">AUTORIZADO POR</font></strong></td>
    <td width="164">&nbsp;</td>
  </tr>
  <tr> 
    <td><font size="2"><?php echo $row2['administrador'];?></font></td>
    <td><font size="2"><?php echo $row2['coordinador_adm'];?></font></td>
    <td><font size="2"><?php echo $row2['coordinador_sede'];?></font></td>
    <td><strong>SELLO</strong></td>
  </tr>
      <tr> 
       <td><font size="2"><?php echo $row2['cargo3'];?></font></td>
    <td><font size="2"><?php echo $row2['cargo2'];?></font></td>
    <td><font size="2"><?php echo $row2['cargo1'];?></font></td>  
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
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
    <td><div align="left"><font face="CodabarMedium"> </strong><font size="2" face=CodabarMedium"><?php echo $_GET['desde_dia']."/".$_GET['desde_mes']."/".$_GET['desde_year'];?><?php echo $_GET['hasta_dia']."/".$_GET['hasta_mes']."/".$_GET['hasta_year'];?></font></font></div></td>
  </tr>
</table>
<p>&nbsp;</p>
 <p> <a href="../consulta/menu_consulta.php?>">Atras</a>&nbsp; </p>