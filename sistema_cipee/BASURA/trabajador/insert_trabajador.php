<?php
 session_start();
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../utils.php");

include("../barra.php");

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
    <td>


 <?php
$val='../menu.php';
if($_POST[sueldo]=="" || $_POST[hijo]=="" || $_POST[jerarquia]=="" || $_POST[profesionalizacion]==""|| $_POST[antiguedad]==""|| $_POST[hogar]==""|| $_POST[chofer]==""|| $_POST[moto]=="")
		{
		$val='Atrabajador.php';
?>




 <td><form style="width: 615px;" action="<? echo $val; ?>" method="post">
      <p align="left"><br />
  <?       
	echo"<b>Mensaje: </b>".Todos_los_campos_son_obligatorios."<br><br>";	
    	}
	  else 
	   {
 ?>
 <td><form style="width: 615px;" action="<? echo $val; ?>" method="post">
      <p align="left"><br />

<?

$_POST[sueldo]=number_format($_POST[sueldo],2,',', '.');
$_POST[hijo]=number_format($_POST[hijo],2,',', '.');
$_POST[jerarquia]=number_format($_POST[jerarquia],2,',', '.');
$_POST[profesionalizacion]=number_format($_POST[profesionalizacion],2,',', '.');
$_POST[antiguedad]=number_format($_POST[antiguedad],2,',', '.');
$_POST[hogar]=number_format($_POST[hogar],2,',', '.');
$_POST[chofer]=number_format($_POST[chofer],2,',', '.');
$_POST[moto]=number_format($_POST[moto],2,',', '.');
$_POST[integral]=number_format($_POST[integral],2,',', '.');
$_POST[hijoe]=number_format($_POST[hijoe],2,',', '.');
$_POST[bononocturno]=number_format($_POST[bononocturno],2,',', '.');
$estado='ACTIVO';
$sede='BARINAS';

 $sql = "INSERT INTO trabajador(codigo, cedula, nombre, fecha_n, fecha_i, cargo, 
            departamento, sexo, tipo, sueldo, hijo, jerarquia, profesionalizacion, 
            antiguedad, hogar, chofer, moto, integral, hijoe, estudio,estado,sede,bono_nocturno)
    VALUES ('$_POST[codigo]', '$_POST[cedula]','$_POST[nombre]', '$_POST[fecha_n]', '$_POST[fecha_i]','$_POST[cargo]', '$_POST[departamento]','$_POST[sexo]', '$_POST[tipo]', '$_POST[sueldo]', '$_POST[hijo]', '$_POST[jerarquia]', '$_POST[profesionalizacion]', '$_POST[antiguedad]','$_POST[hogar]', '$_POST[chofer]', '$_POST[moto]', '$_POST[integral]', '$_POST[hijoe]', '$_POST[estudio]','$estado','$sede','$_POST[bononocturno]');";
            
      if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); } 
       
       echo"<b>Mensaje: </b>".Registro_Agregado_con_exito."<br><br>";
	  /////////////////////////////
$valor="-Operacion: Agregar Datos Personales -".$_POST[cedula];
 registrarOperacion($con,$_SESSION['login'],$valor);      
///////////////////////////////////////////////////////////////////  
           
        }
 pg_close($con);
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

