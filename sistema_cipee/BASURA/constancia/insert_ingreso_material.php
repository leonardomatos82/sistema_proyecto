<?php
session_start();
//include("../control/valida.php"); 
include("../css.php");
include("../config.php");
//include("../utils.php");
$veces=$_GET[id];
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
    <td><form style="width: 615px;" action="menu_suministros.php";" method="post">
      <p align="left"><br />
          <?php
   if($_POST[fecha_fact]=="" ||$_POST[fecha]=="" || $_POST[factura]=="" || $_POST[monto]==""  || $_POST[proveedor]=="")
		{
		echo"<b>Mensaje: </b>".Todos_los_campos_son_obligatorios."<br><br>"; 
       	}
	  else 
	   {
	         $estado="ACTIVO";
	     $fecha=cambiaf_a_postgres($_POST[fecha]);
	     $fecha_fact=cambiaf_a_postgres($_POST[fecha_fact]);
	    $sql1="INSERT INTO ingreso_material(
            fecha, fecha_fact, factura, monto, cedula_rif)
       VALUES ('$fecha','$fecha_fact','$_POST[factura]',$_POST[monto],'$_POST[proveedor]')"; 
     if (!pg_query($con,$sql1)) { die('Error: ' . pg_result_error()); } 

/////////////////////////////////////////////////////
for($x=1; $x<=$veces; $x=$x+1)
{ 
$partida="partida".$x;
$cantidad="cantidad".$x;
$presentacion="presentacion".$x;
//$monto=number_format($monto,2);
//echo $_POST[$partida];

if ($_POST[$partida]== ""  AND  $_POST[$cantidad]== "" AND  $_POST[$presentacion]== "")
{}else{
      
                          $rc2="SELECT MAX(id_ingreso_material)  FROM ingreso_material";
                          $qrc2=pg_query($con,$rc2);
                          $cant_reg2=pg_fetch_array($qrc2);
                          $estado="REGISTRADO";

	  $sql2="INSERT INTO detalle_ingreso_material(
            id_ingreso_material, id_material, presentacion, cantidad, estado) 
       VALUES ('$cant_reg2[0]','$_POST[$partida]',
       '$_POST[$presentacion]','$_POST[$cantidad]','$estado')"; 
    	
    	$sql3="UPDATE MATERIAL SET existencia=existencia+'$_POST[$cantidad]' where id_material='$_POST[$partida]'";
    	
     if (!pg_query($con,$sql2)) { die('Error: ' . pg_result_error()); } 
      if (!pg_query($con,$sql3)) { die('Error: ' . pg_result_error()); }        
                 
             
}
 };

//////////////////////////////////////////////////////	   
	     echo " Registro  Agregado";
 $_POST[fecha_fact]="" ;
 $_POST[factura]="" ;
 $_POST[monto]="";
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
