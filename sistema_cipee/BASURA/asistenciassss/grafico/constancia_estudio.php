<?php
$fecha_registro=date("Y-m-d");
$hora_registro=date("h:i:s");
$cedula_alumno=$_POST[cedula_alumno];

$result=pg_exec($conn,"select e.id_alumno,p.denominacion_pfg,a.nombres,a.apellidos,m.municipio,es.estado,parr.parroquia,e.nombre_aldea from estado_academico e, alumno a, programaformaciongrado p,municipio_vzla m, estado_vzla es, parroquia_vzla parr where e.id_alumno=a.id_alumno and e.id_pfg=p.id_pfg and e.id_municipio=m.id_municipio and m.id_estado=es.id_estado and e.id_municipio=parr.id_municipio  and e.id_alumno='$cedula_alumno'");
$arr=pg_fetch_array($result);
$pfg=$arr[1];
$nombres=$arr[2];
$apellidos=$arr[3];
$municipio_vzla=$arr[4];
$estado_vzla=$arr[5];
$parroquia_vzla=$arr[6];
$nombre_aldea=$arr[7];

$result=pg_exec($conn,"SELECT periodo FROM inscripcion WHERE id_alumno='$cedula_alumno'");  
$arr=pg_fetch_array($result);  
$periodo=$arr[0];

list($ano,$mes,$dia)=split('[/-]',$fecha_registro);

if($mes==1)
 $mes='Enero';
elseif($mes==2)
 $mes='Febrero';
elseif($mes==3)
 $mes='Marzo';  
elseif($mes==4)
 $mes='Abril'; 
elseif($mes==5)
 $mes='Mayo';
elseif($mes==6)
 $mes='Junio';
elseif($mes==7)
 $mes='Julio';
elseif($mes==8)
 $mes='Agosto';
elseif($mes==9)
 $mes='Septiembre';
elseif($mes==10)
 $mes='Octubre';
elseif($mes==11)
 $mes='Noviembre';
elseif($mes==12)
 $mes='Diciembre'; 

$id_documento=1;
$codigo=$cedula_alumno.'-'.$periodo.'-'.$fecha_registro.'-'.$id_documento;

//pg_exec($conn,"INSERT INTO record_documento(id_alumno,id_documento,fecha_registro,hora_registro,codigo) values('$cedula_alumno','$id_documento','$fecha_registro','$hora_registro','$codigo')");  


echo"<html><head><title>Sistema de Ingreso Prosecución y Egreso Estudiantil - UBV Bolívar</title>
<meta http-equiv='expires' content='-1'>
<link href=includes/default.css  type= text/css  rel= stylesheet></head>
<body leftmargin=0  topmargin=0  marginwidth=0  marginheight=0 onload='window.print()'>
<table width=700 align=center border=0><tr><td align=center colspan=3><font class=normal>REPÚBLICA BOLIVARIANA DE VENEZUELA<br>UNIVERSIDAD BOLIVARIANA DE VENEZUELA<br>COORDINACIÓN REGIONAL ESTADO BARINAS- PORTUGUESA<br>COORDINACIÓN DE CONTROL DE ESTUDIOS</font><br><br><img width=70 src=/surubv/images/logo_ubv.gif><br><br><b><font class=titulo2>CONSTANCIA DE ESTUDIOS</font></b><br></td></tr>
<tr><td><p align=justify style='line-height:200%'><br>&nbsp;&nbsp;&nbsp;<font class=normal2>Quien suscribe, Ing. Yoel Castillo, coordinador de Contro de Estudios, de la Universidad Bolivariana de Venezuela, por medio de la presente, hace constar que el ciudadano (a):<b>&nbsp;$nombres,&nbsp;$apellidos</b>,&nbsp;
Titular de la cédula de identidad  Nº&nbsp;<b>$cedula_alumno</b>, es estudiante activo de esta universidad. Actualmente cursa el período académico <b>$periodo</b>, del Programa de Formación de grado <b>$pfg</b>, en el estado <b>$estado_vzla</b>, municipio <b>$municipio_vzla</b>.<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Constancia que se expide a petición de la parte interesada, a los $dia días del mes de $mes de Dos mil Siete.</p>
<p align=center><br>Atentamente,<br>

<table border=0><tr><td align=center><img width=150 src=/surubv/images/firma0618.jpg></td></tr>
<tr><td align=center><font class=normal><b>Ing. Yoel Castillo</b><br>Coordinación Control de Estudios</font></td></tr></table>
</p>

</td></tr>
<tr><td align=right><br><img src=/surubv/includes/barcode.php?code=$codigo&scale=1&encoding=128></td></tr>
<tr><td align=center><br><br><hr><font class=boton>Sector los pozones urb. Pedro Briceño Mendez, edif. almaguarn, detras del destacamento 14 de la guardia nacional.<br>Teléfonos: 02735460129 / 04245209969</font></td></tr>
</table>
</body>
</html>";
?>
