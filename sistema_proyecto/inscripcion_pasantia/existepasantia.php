<?

$cedula=$_POST[cedula];
$doc=$_POST[documento];
include("../config.php");
include("../utils.php");
include("../la_ip.php");
if ($cedula==''){
 header("Location: buscarpasantia.php");
}else{

if ($_POST[documento]=='CEDULA'){
$result = pg_query($con, "select * from pasantia where cedula='".$cedula."'"); 
$row=pg_fetch_array($result);
header("Location: Mdatos2.php?id=$row[cedula]&doc=$doc");

}else{
$result = pg_query($con, "select * from pasantia where id_pasantia='".$cedula."'"); 
$row=pg_fetch_array($result);
header("Location: Mteg.php?id=$row[id_teg]&doc=$doc");
}


if ($row['cedula']!=$cedula && $row['id_teg']!=$cedula){
    header("Location: buscarpasantia.php");

}
	

}

?>