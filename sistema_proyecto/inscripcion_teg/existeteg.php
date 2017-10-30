<?

$cedula=$_POST[cedula];
$doc=$_POST[documento];
include("../config.php");
include("../utils.php");
include("../la_ip.php");
if ($cedula==''){
 header("Location: buscarteg.php");
}else{

if ($_POST[documento]=='CEDULA'){
$result = pg_query($con, "select * from estudiante_teg where cedula='".$cedula."'"); 
$row=pg_fetch_array($result);
header("Location: Mteg.php?id=$row[cedula]&doc=$doc");

}else{
$result = pg_query($con, "select * from teg where id_teg='".$cedula."'"); 
$row=pg_fetch_array($result);
header("Location: Mteg.php?id=$row[id_teg]&doc=$doc");
}


if ($row['cedula']!=$cedula && $row['id_teg']!=$cedula){
    header("Location: buscarteg.php");

}
	

}

?>