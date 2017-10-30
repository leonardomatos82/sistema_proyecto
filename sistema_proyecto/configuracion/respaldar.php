<?php 

$o=$_GET['o']; //carpeta origen 
$d=$_GET['d']; //carpeta destino ha de existir ni no Safe Mode Off



$o="/var/www/sistema_proyecto";
$d="/var/www/respaldo/sistema_proyecto";


function copydir($o, $d){
$o1="$o";
$d1="$d";
if (is_dir("$o/")) { 
if (!is_dir("$d/")) {
mkdir("$d", 0777);	// Descomentar si Safe Mode Off
}
if ($vcarga = opendir("$o/")) 
{ 
echo "<ul>"; 
echo "Directorio: $d<br><br>"; 
while($file = readdir($vcarga)) 
{ 
if (is_dir("$o/$file") && $file!="." && $file!=".."){

copydir("$o/$file", "$d/$file");
}else{
if ($file != "." && $file != "..") 
{ 

if(copy("$o/$file", "$d/$file")) 
{ 
echo "<b>$file</b> se copio con exito al directorio.<br>"; 
}else{
echo "<b>$file</b> No se pudo copiar el Archivo, revise los permisos.<br>"; 

}}}}
echo '</ul>'; 
}}else{
echo 'fallo apoteosico';
}
}

?>

<?php if (($o!='')&&($d!='')){
echo "$o<br>";
echo "$d<br>";

copydir("$o", "$d");
} 

?>
