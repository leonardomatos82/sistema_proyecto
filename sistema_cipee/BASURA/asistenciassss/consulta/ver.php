<?php 
include("../control/valida.php"); 
include("../config.php");

////////////////////////////////////////////
$condicion="";
$cedula=$_POST[cedula];
$tipo=$_POST[tipo];
$cdesde=$_POST[cdesde];
$chasta=$_POST[chasta];
$dfecha=$_POST[dfecha];
$hfecha=$_POST[hfecha];



$t1="viaticos.cedula="."$cedula";
$t2="tabla.id_tabla="."$tipo";
$t3="viaticos.id_viatico >= "."$cdesde";
$t4="viaticos.id_viatico <= "."$chasta";


////////////////////////////////////////////
if ($_POST[cedula]!="")
{
if ($condicion!="" )
{
   $condicion=$condicion." AND ";
 }  
 $condicion=$condicion.$t1;
  }  
 
////////////////////////////////////////////
if ($_POST[tipo]!=0)
{
if ($condicion!="" )
{
   $condicion=$condicion." AND ";
 }  
 $condicion=$condicion.$t2;
  }  

////////////////////////////////////////////// 
if ($_POST[cdesde]!="")
{
if ($condicion!="" )
{
   $condicion=$condicion." AND ";
 }  
 $condicion=$condicion.$t3;
  }  

////////////////////////////////////////////// 
if ($_POST[chasta]!="")
{
if ($condicion!="" )
{
   $condicion=$condicion." AND ";
 }  
 $condicion=$condicion.$t4;
  }  



////////////////////////////////////////////  
  
 if  ($condicion==""){

 $result = pg_query($con,"SELECT tabla.id_tabla,tabla.tipo,viaticos.id_viatico,viaticos.cedula,usuario.nomb_usuario,usuario.cargo,viaticos.motivo,viaticos.fecha_ida,viaticos.fecha_ret,viaticos.total,viaticos.otra1,viaticos.otra2,viaticos.observaciones,viaticos.tiempo1,viaticos.tiempo2,viaticos.des,viaticos.alm,viaticos.cen,viaticos.alo,viaticos.taxi,viaticos.transporte,viaticos.tasa
 FROM viaticos 
  INNER JOIN usuario ON viaticos.cedula= usuario.cedula 
  INNER JOIN tabla ON viaticos.id_tipo= tabla.id_tabla
 ");
 }else{

 $result = pg_query($con,"SELECT tabla.id_tabla,tabla.tipo,viaticos.id_viatico,viaticos.cedula,usuario.nomb_usuario,usuario.cargo,viaticos.motivo,viaticos.fecha_ida,viaticos.fecha_ret,viaticos.total,viaticos.otra1,viaticos.otra2,viaticos.observaciones,viaticos.tiempo1,viaticos.tiempo2,viaticos.des,viaticos.alm,viaticos.cen,viaticos.alo,viaticos.taxi,viaticos.transporte,viaticos.tasa
 FROM viaticos 
  INNER JOIN usuario ON viaticos.cedula= usuario.cedula 
  INNER JOIN tabla ON viaticos.id_tipo= tabla.id_tabla
  
 WHERE  $condicion     
");

}
?>

<?php
  
    $CONT=0;
	$total=0;

    $max = pg_num_rows($result);

  while ($row = pg_fetch_row($result)){
  
   if ($CONT==0) {	
	 ?><style type="text/css">
<!--
h1,h2,h3,h4,h5,h6 {
	font-family: Times New Roman, Times, serif;
}
-->
</style>
  <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
    <tr>
      <?php include("../consulta/encabezado.php"); ?>
    </tr>
    <tr>
      <td bgcolor="#666666"><strong>Num</strong></td>
      <td bgcolor="#666666"><strong>Id</strong></td>
      <td bgcolor="#666666"><strong>Cedula </strong></td>
      <td bgcolor="#666666"><strong>Nombre</strong></td>
      <td bgcolor="#666666"><strong>Cargo</strong></td>
      <td bgcolor="#666666"><strong>Fecha Ida</strong></td>
      <td bgcolor="#666666"><strong>Fecha Ret</strong></td>
      <td bgcolor="#666666"><strong>Total </strong></td>
      <td bgcolor="#666666"><strong>Motivo </strong></td>
    </tr>
    <tr>
      <?PHP
   }
    $res=$total % 2;
	
		$total++; 
      if ($res==1){$color="#CCCCCC" ;}else {$color="#FFFFFF" ;}
	  	
	
    ?>
      <td bgcolor=<?php echo $color; ?>><?php echo $total ?></td>     
      <td bgcolor=<?php echo $color; ?>><?php echo $row[2] ?></td>
      <td bgcolor=<?php echo $color; ?>><?php echo $row[3] ?></td>
      <td bgcolor=<?php echo $color; ?>><?php echo $row[4] ?></td>
      <td bgcolor=<?php echo $color; ?>><?php echo $row[5] ?></td>
      <td bgcolor=<?php echo $color; ?>><?php echo $row[7] ?></td>
      <td bgcolor=<?php echo $color; ?>><?php echo $row[8] ?></td>
      <td bgcolor=<?php echo $color; ?>><?php echo $row[9] ?></td>
      <td bgcolor=<?php echo $color; ?>><?php echo $row[6] ?></td>
    </tr>
    <?PHP
	  $CONT++;	
	   if ($CONT ==30 ) 
	   { 
	   $CONT=0;
	   ?>
  </table>
  </p>
<p>&nbsp;</p>
  <p>&nbsp;  </p>
      <?PHP
	    } 
	  }
?>
</table>
<?php 


//include("../pie.php"); 
?>
<p>&nbsp;</p>
  <p>&nbsp;  </p>
  