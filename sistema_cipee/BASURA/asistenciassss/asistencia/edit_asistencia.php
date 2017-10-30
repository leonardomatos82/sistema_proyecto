<?php
session_start();
//include("../control/valida.php"); 
include("../css.php");
include("../config.php");
//include("../utils.php");
$fech=$_GET[fecha];
?> 
<table width="824" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2">&nbsp;</td>
    <td width="77">&nbsp;</td>
  </tr>
  <tr>
    <td width="149">&nbsp;</td>
    <td width="584">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="88"><p align="right">&nbsp;</p>
        <p align="right">&nbsp;</p></td>
    <td><form style="width: 615px;" action="menu_asistencia.php";" method="post">
      <p align="left"><br />
          <?php
         

if ($fech=='Todos' ||$fech=='' ){
$rc="select count(id_asistencia) from asistencia where asistencia.id_dpto='$_SESSION[dpto]' ";
}else{
$rc="select count(id_asistencia) from asistencia where fecha='$fech' and asistencia.id_dpto='$_SESSION[dpto]' ";
}

$qrc=pg_query($con,$rc);
$cant_reg=pg_fetch_array($qrc);	
$num=$cant_reg[0]	;
//echo $num; die();
for($x=1; $x<=$num; $x=$x+1)
{ 
$fecha="fecha".$x;
$cedula="cedula".$x;
$entra1="entra1".$x;
$sale1="sale1".$x;
$entra2="entra2".$x;
$sale2="sale2".$x;
$observacion="observacion".$x;

$_POST[$fecha]=cambiaf_a_postgres($_POST[$fecha]);


 	   $sql1 = "UPDATE asistencia SET 
	 entra1='$_POST[$entra1]', sale1='$_POST[$sale1]', entra2='$_POST[$entra2]', sale2='$_POST[$sale2]', 
	 observacion='$_POST[$observacion]'
	 WHERE fecha='$_POST[$fecha]' and cedula='$_POST[$cedula]'";
      if (!pg_query($con,$sql1)) { die('Error: ' . pg_result_error()); } 

//echo $_POST[$cant];		
//echo $_POST[$cod];			
	
	

	

 };
 	 echo " REGISTROS ACTUALIZADOS ";

 pg_close($con);
?>
      </p>
      <p align="left">
        <input name="submit" type="submit" value="Volver" />
      </p>
    </form></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="40">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3"><div align="center"><img src="../imagenes/mural1.png" alt="d" width="850" height="13" /></div></td>
  </tr>
</table>
