<?php
 session_start();
//include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../utils.php");
$doc=$_GET[documento];

include("../barra.php");
$result = pg_query($con, "select * from teg where id_teg='".$_POST[codigo]."'"); 
$resultpl = pg_query($con, "select * from periodo_lectivo where estado='ACTIVO'"); 
$rowpl=pg_fetch_array($resultpl);

$row=pg_fetch_array($result);
$val='../menu.php';


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


if ($_POST[teg]==""

)
		{
		$val='Mdatos.php?documento=$documento';
?>




 <td><form style="width: 615px;" action="<? echo $val; ?>" method="post">
      <p align="left"><br />
  <?       
	echo"<b>Mensaje: </b>".Todos_los_campos_son_obligatorios."<br><br>";	
	   ?>
	<a href="javascript:window.history.back()"><img style="border: 0px solid ; width: 25px; height: 25px;" alt="Atras"
 src="../imagenes/atras.png"></a>
     <? 
     die();   
    	}
	  else 
	   {
 ?>
 <td><form style="width: 615px;" action="<? echo $val; ?>" method="post">
      <p align="left"><br />

<?


if (($row['id_teg']==$_POST[codigo])){
$fecha=date("d-m-Y");


//$estado_teg="INSCRITO";



$sql = "UPDATE teg
   SET teg='$_POST[teg]', objetivo='$_POST[objetivo]', fecha_socializacion='$_POST[fecha_socializacion]',observaciones_generales='$_POST[observaciones_generales]',estado_teg='$_POST[considera]'
 WHERE id_teg=$_POST[codigo];";

      if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); }else{

$result = pg_query($con, "select * from teg where id_teg='".$_POST[codigo]."'"); 
$row=pg_fetch_array($result);
for($i=1;$i<=$_GET['cantidad'];$i++){
$nacionalidad='nacionalidad'.$i;
$cedula='cedula'.$i;
$nombre='nombre'.$i;
$estado='estado'.$i;
$id_estudiante_teg='id_estudiante_teg'.$i;

$sql2 ="update estudiante_teg set
            nacionalidad='$_POST[$nacionalidad]', cedula='$_POST[$cedula]', nombre='$_POST[$nombre]', estado='$_POST[$estado]' where id_estudiante_teg='$_POST[$id_estudiante_teg]';";
if (!pg_query($con,$sql2)) { die('Error : ' . pg_result_error()); }
}


} 
       
       echo"<b>Mensaje: </b>".Registro_Actualizado."<br><br>";
	  /////////////////////////////
$valor="-Operacion: REGISTRO DE SOCIALIZACION DE TEG -".$_POST[teg];
 registrarOperacion($con,$_SESSION['login'],$valor);      
///////////////////////////////////////////////////////////////////  
      }     
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

