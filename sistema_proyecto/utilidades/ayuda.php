<?php

include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php"); 
include("../barra.php");
?>

<script type="text/javascript">
numImg = 0;
imgs = ['../imagenes/red.jpg','../imagenes/red2.jpg','../imagenes/red3.jpg','../imagenes/red4.jpg'];
function cambiar() {
  numImg++;
  if (numImg==imgs.length) numImg=0;
  document.getElementById('imagen').src = imgs[numImg];
}


</script> 

<body onload="setInterval('cambiar()',18000)"> 
<table width=100% height=350px border="0" align="<?echo $alight; ?>" bgcolor="<?echo $bgcolor; ?>">
<tr>
<td><div align="center"><font size="8" face="Times New Roman, Times, serif">Coodinación de TIT Barinas - Portuguesa</td>
</tr>
<tr>
<td><div align="center"><font size="4" face="Times New Roman, Times, serif">Analista Programador: Leonardo Matos</td>
</tr>

<tr>
<td rowspan="9" ><div align="center"><img id="imagen" align="center"  src="../imagenes/red.jpg" width="300" height="300"  border="0"> </td>

</tr>
</table>
      <? include("../pie.php"); ?>
