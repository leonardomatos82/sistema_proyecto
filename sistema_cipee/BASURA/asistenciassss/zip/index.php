<?php
require ("zipfile.php");

$zipfile = new zipfile();
$zipfile->add_file(implode("",file("img01.jpg")), "foto.jpg");

header("Content-type: application/octet-stream");
header("Content-disposition: attachment; filename=zipfile.zip");
echo $zipfile->file();
?>