<?php 
include("../control/valida.php"); 
include("../config.php");
include("../tabla.php");
//include("../utilidades/postit.php");

include("../barra.php");

////////////////////////////////////////////
$condicion="";
$parte=$_POST[parte];
$tipo=$_POST[tipo];
$disponible=$_POST[disponible];

$t1="repuesto.codigo="."'$parte'";
$t2="repuesto.id_repuesto="."$tipo";
if ($disponible=='DISPONIBLE'){$t3="repuesto.cantidad>0";
}else{$t3="repuesto.cantidad<=0";
}

////////////////////////////////////////////
if ($_POST[parte]!="")
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
if ($_POST[disponible]!="")
{
if ($condicion!="" )
{
   $condicion=$condicion." AND ";
 }  
 $condicion=$condicion.$t3;
  } 

////////////////////////////////////////////  
  
 if  ($condicion==""){

 $result = pg_query($con,"SELECT * FROM repuesto order by descripcion asc
 ");
 }else{
 $result = pg_query($con,"SELECT * FROM repuesto 
 WHERE  $condicion  
order by descripcion asc   
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




  <table width="80%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
    <tr>
      <?php include("../consulta/encabezado.php"); ?>
    </tr>
    <tr>

      <td bgcolor="#666666"><strong><font size="1">N. PARTE </strong></td>
      <td bgcolor="#666666"><strong><font size="1">REPUESTO</strong></td>
      <td bgcolor="#666666"><strong><font size="1">COSTO COMPRA</strong></td>
      <td bgcolor="#666666"><strong><font size="1">COSTO VENTA</strong></td>
      <td bgcolor="#666666"><strong><font size="1">EXISTENCIA</strong></td>
<td bgcolor="#666666"><strong><font size="1">ESTADO</strong></td>
    </tr>
    <tr>
      <?PHP
   }
    $res=$total % 2;
	
		$total++; 
      if ($res==1){$color="#CCCCCC" ;}else {$color="#FFFFFF" ;}
	if($row[5]<=0){
		$estado="NO DISPONIBLE";
		$color2='red';
	    }  	else{
                $estado="DISPONIBLE";
		$color2='green';
	    }
	
    ?>

      <td bgcolor=<?php echo $color; ?>><font size="1"><?php echo $row[1] ;?></td>
      <td bgcolor=<?php echo $color; ?>><font size="1"><?php echo $row[2] ;?></td>
      <td bgcolor=<?php echo $color; ?>><font size="1"><?php echo $row[3] ;?></td>
      <td bgcolor=<?php echo $color; ?>><font size="1"><?php echo $row[4]; ?></td>
      <td bgcolor=<?php echo $color; ?>><strong><font size="1"><?php echo $row[5]; ?></td>
      <td bgcolor=<?php echo $color2; ?>><strong><font size="1"><?php echo $estado; ?></td>

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
  
