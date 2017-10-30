<?php
//include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../barra.php");
include("../validar_campos.php");
?>
<table width="750" border="0" align="center" bgcolor="#FFFFFF">
  <tr  align="center"> 
    <td colspan="2"><strong>
    <form action="pag2.php" method="post" enctype="multipart/form-data">
<b>Subir TEG al Sistema: </b>
<input type="hidden" name="MAX_FILE_SIZE" value="50000000">
   <table>
	<tr>
	<td>ID del TEG</td>
	<td> <input maxlength=9 size=2 name="codigo" type="text" onkeypress="return acceptNum(event)"></td>
	</tr>
<tr>
	<td>Buscar</td>
	<td>  <input name="userfile" type="file" size=1  "></td>
	</tr>
<tr>
	<td></td>
	<td>  <input type="submit" value="Enviar"></td>
	</tr>
   </table>
</form> </strong></td>
 </tr>
        </table>
 <?php
include("../pie.php"); 
 ?>
