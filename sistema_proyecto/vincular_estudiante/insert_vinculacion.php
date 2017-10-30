<?php 
session_start();
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php"); 
include("../barra.php");
$resultpl = pg_query($con, "select * from estudiante_teg where cedula='$_POST[cedula]' and id_teg='".$_POST[id_teg]."'"); 
$rowpl=pg_fetch_array($resultpl);
$resultpfg = pg_query($con, "select * from estudiante_teg where id_teg='".$_POST[id_teg]."'"); 
$rowpfg=pg_fetch_array($resultpfg);

?>
<table width="750" border="0" align="center" bgcolor="#FFFFFF">
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
    <td><form style="width: 615px;" action="menu_acceso.php";" method="post">
      <p align="left"><br />
          <?php
if($_POST[cedula]=="" || $_POST[nombre]=="" || $_POST[id_teg]=="")
		{
		
		echo"<b>Mensaje: </b>".Los_campos_son_obligatorios."<br><br>";
		
    	}
	  else 
	   {
	   if ($rowpl[cedula]==$_POST[cedula]){
echo "Estudiante ya esta Vinculado al TEG";
die();
}
	   
       $nacionalidad="V";
     echo  $sql="INSERT INTO estudiante_teg(
            nacionalidad, cedula, nombre, telefono_estudiante, pfg, 
             id_teg) VALUES('$nacionalidad','$_POST[cedula]','$_POST[nombre]','$_POST[telefono]','$rowpfg[pfg]','$rowpfg[id_teg]')"; 
       if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); } 
       
       echo "Estudiante Vinculado";
	   	    /////////////////////////////
$valor="-Operacion: Agregar -Estudiante a TEG: -".$_POST[login];
        registrarOperacion($con,$_SESSION['login'],$valor);      
///////////////////////////////////////////////////////////////////  
           
        }
 pg_close($con)
?>
      </p>
      <p align="left">
        <input name="submit2" type="submit" value="Volver" />
      </p>
    </form></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>

</table>

  <?php
include("../pie.php"); 
 ?>

