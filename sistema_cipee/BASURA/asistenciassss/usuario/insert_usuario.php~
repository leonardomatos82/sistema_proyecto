<?php
session_start();
//include("../control/valida.php"); 
include("../css.php");
include("../config.php");
//include("../utils.php");
?> 
<table width="767" border="0" align="center" bgcolor="#FFFFFF">
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
    <td><form style="width: 615px;" action="menu_usuario.php";" method="post">
      <p align="left"><br />
          <?php
         
if($_POST[nomb_usuario]=="" || $_POST[cargo]=="" || $_POST[cedula_rif]=="" )
		{
		echo"<b>Mensaje: </b>".Todos_los_campos_son_obligatorios."<br><br>";
		
    	}
	  else 
	   {
$query2="select * from PERSONAL where cedula= '$_POST[cedula_rif]'";
       $result=pg_query($con,$query2);
       $row=pg_fetch_array($result);
	  
       if ($_POST[cedula_rif]==$row[cedula]) {
         echo "imposible guardar, registro existe";
       }
	    else 
		{	   
	   $estado="ACTIVO";
	   $sql="INSERT INTO personal (cedula,nombre,cargo,tipo,id_dpto,estado) 
       VALUES ('$_POST[cedula_rif]','$_POST[nomb_usuario]','$_POST[cargo]','$_POST[tipo]','$_POST[departamento]','$estado')"; 
       if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); } 
       
       echo "1 Registro  agregado";
           
        }
        }
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
  