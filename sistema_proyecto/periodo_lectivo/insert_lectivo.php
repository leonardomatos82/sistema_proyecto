<?php 
session_start();
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php"); 
include("../barra.php");
$resultpl = pg_query($con, "select * from periodo_lectivo where periodo='".$_POST[periodo]."'"); 
$rowpl=pg_fetch_array($resultpl);


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
    <td><form style="width: 615px;" action="../menu.php";" method="post">
      <p align="left"><br />
          <?php
if($_POST[periodo]=="" || $_POST[inicio]=="" || $_POST[culminacion]=="")
		{
		
		echo"<b>Mensaje: </b>".Los_campos_son_obligatorios."<br><br>";
		
    	}
	  else 
	   {
	   if ($rowpl[periodo]==$_POST[periodo]){
echo "Periodo lectivo ya esta Registrado";
die();
}
	    $sql0="UPDATE periodo_lectivo set estado='CERRADO'"; 
       if (!pg_query($con,$sql0)) { die('Error: ' . pg_result_error()); } 
	   $estado='ACTIVO';
	   $fecha=date("d-m-Y");
       $sql="INSERT INTO periodo_lectivo (fecha,periodo,estado,inicio,culminacion) 
       VALUES ('$fecha','$_POST[periodo]','$estado','$_POST[inicio]','$_POST[culminacion]')"; 
       if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); } 
       
       echo "Periodo Lectivo ".$_POST[periodo]." Activado.";
	   	    /////////////////////////////
$valor="-Operacion: Agregar -periodo lectivo: -Activar periodo Lectivo: ".$_POST[login];
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

