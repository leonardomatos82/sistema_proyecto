<?php
session_start();
$login=$Sesion[login];
$password=$Sesion[password];
$cedula_alumno=$Sesion[cedula_alumno];

$fecha=date("d-m-Y");  
$hora=date("H:i:s");
$codigo=$_POST[codigo];

if($login && $password) 
{
$result=pg_exec($conn,"select e.id_alumno,p.denominacion_pfg,a.nombres,a.apellidos,m.municipio,es.estado,parr.parroquia,e.nombre_aldea from estado_academico e, alumno a, programaformaciongrado p,municipio_vzla m, estado_vzla es, parroquia_vzla parr where e.id_alumno=a.id_alumno and e.id_pfg=p.id_pfg and e.id_municipio=m.id_municipio and m.id_estado=es.id_estado and e.id_municipio=parr.id_municipio  and e.id_alumno='$cedula_alumno'");
$arr=pg_fetch_array($result);
$pfg=$arr[1];
$nombres=$arr[2];
$apellidos=$arr[3];
$municipio_vzla=$arr[4];
$estado_vzla=$arr[5];
$parroquia_vzla=$arr[6];
$nombre_aldea=$arr[7];

$result2=pg_exec($conn,"select i.tramo,m.nombre_modalidad from inscripcion i, modalidad m where i.id_modalidad=m.id_modalidad and id_alumno='$cedula_alumno'");
$arr2=pg_fetch_array($result2);
$tramo=$arr2[0];
$modalidad=$arr2[1];


echo"<html><head><title>Sistema Unico de Registro Acádemico - UBV</title>
<link href=includes/default.css  type= text/css  rel=stylesheet>
<link rel='shortcut icon' href='images/favicon.ico'>
<body leftmargin=0  topmargin=0  marginwidth=0  marginheight=0 onload='window.print();'>

<table cellpadding=0 cellspacing=0 border=0 width=650 align=center>
<tr><td align=center><font class=normal>REPUBLICA BOLIVARIANA DE VENEZUELA<br>UNIVERSIDAD BOLIVARIANA DE VENEZUELA<br>SISTEMA UNICO DE REGISTRO ACADEMICO UBV</td></tr>
<tr><td height=15></td></tr>
<tr><td align=center><img width=60 src=images/logo_ubv.gif></td></tr>
<tr><td height=15></td></tr>
<tr><td align=center><font class=titulo2>REGISTRO DE INSCRIPCION</td><tr>
<tr><td align=right><font class=boton>Fecha:&nbsp;$fecha</td><tr>
<tr><td><hr></td><tr>
<tr><td>

<table cellpadding=1 cellspacing=1 border=0>
<tr><td width=130 align=right><font class=normal color=#878787>Cédula:</td><td width=400><font class=normal>$cedula_alumno</td></tr>
<tr><td align=right><font class=normal color=#878787>Nombres:</td><td><font class=normal>$arr[2]</td></tr>
<tr><td align=right><font class=normal color=#878787>Apellidos:</td><td><font class=normal>$arr[3]</td></tr>
<tr><td align=right><font class=normal color=#878787>Programa de <br>Formación de Grado:</td><td valign=bottom><font class=normal>$arr[1]</td></tr>
<tr><td align=right><font class=normal color=#878787>Sección:</td><td valign=bottom><font class=normal>UNICA</td></tr>
<tr><td align=right><font class=normal color=#878787>Modalidad:</td><td valign=bottom><font class=normal>$modalidad</td></tr>
<tr><td align=right><font class=normal color=#878787>Estado:</td><td valign=bottom><font class=normal>$arr[5]</td></tr> 
<tr><td align=right><font class=normal color=#878787>Municipio:</td><td valign=bottom><font class=normal>$arr[4]</td></tr> 
<tr><td align=right><font class=normal color=#878787>Aldea:</td><td valign=bottom><font class=normal>$arr[7]</td></tr> 
</table>

</td></tr>
<tr><td><hr></td><tr>
<tr><td align=center>

<table cellpadding=1 cellspacing=1 border=0 width=650>
<tr><td align=center colspan=2><font class=normal><b>UNIDADES CURRICULARES INSCRITAS</td></tr>
<tr><td align=right width=130><font class=normal color=#878787>Periodo:</td><td width=520><font class=normal>2007-II</td></tr>
<tr><td align=right width=130><font class=normal color=#878787>Tramo o Semestre:</td><td><font class=normal>$tramo</td></tr>
<tr><td align=center colspan=2>";

echo"<table width=600><tr><td align=center colspan=2><font class=normal><b>DESCRIPCION:</b></td></tr>";
$nro=1;
$result2=pg_exec($conn,"select o.uc from oferta_academica o, programaformaciongrado p, estado_vzla e where o.tramo=$tramo and o.id_pfg=p.id_pfg and p.denominacion_pfg='$pfg' and o.id_estado_vzla=e.id_estado and e.estado='$estado_vzla' order by o.uc");
 while($arr2=pg_fetch_array($result2))
 {
  echo"<tr><td align=center width=15><font class=normal>$nro-</td><td><font class=normal>$arr2[0]</td></tr>";
  $nro++;
 }
echo"</td></tr></table>
</td></tr></table>
<tr><td align=right><img src=includes/barcode.php?code=$codigo&scale=1&encoding=128></td></tr>
<tr><td width=10></td><tr>
<tr><td align=center><font class=normal>Sello y Firma <br><br>----------------------------</td><tr>
</td></tr>
<tr><td width=20></td><tr>
<tr><td><font class=boton>No es válido sin el Sello y la Firma.</td><tr>
</table>
</body>
</html>";
}
?>