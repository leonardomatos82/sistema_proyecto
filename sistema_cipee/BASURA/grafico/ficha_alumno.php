<?php
//$conn=verifica_usuario($login,$password);

//if($cedula_alumno)
//{
# USUARIO GENERICO SOLO PUEDE CONSULTAR ALGUNAS TABLAS
$login=$Sesion[login];
$password=$Sesion[password];
//$conn=verifica_usuario($login,$password); 
//$result=pg_exec($conn,"select e.id_alumno,p.denominacion_pfg,a.nombres,a.apellidos,m.municipio,es.estado,a.fecha_nacimiento,a.sexo,a.anno_ingreso,et.nombre_etnia,a.telf_hab,a.telf_cel,a.correo_electronico,a.anno_egreso_bachiller,ec.nombre_estado_civil,pa.nombre_pais,a.nro_hijos,est.nombre_estatus,disc.nombre_discapacidad,enf.nombre_enfermedad,parr.parroquia,ald.nombre_aldea,aldt.nombre_tipo_aldea from estado_academico e, alumno a, programaformaciongrado p,municipio_vzla m, estado_vzla es, etnia et, pais_nac pa, estado_civil ec, estatus est, discapacidad disc, enfermedad enf, parroquia_vzla parr, aldea ald, tipo_aldea aldt where e.id_alumno=a.id_alumno and e.id_pfg=p.id_pfg and e.id_municipio=m.id_municipio and m.id_estado=es.id_estado and a.id_etnia=et.id_etnia and a.id_pais_nac=pa.id_pais and a.id_estado_civil=ec.id_estado_civil and a.id_estatus=est.id_estatus and a.id_discapacidad=disc.id_discapacidad and a.id_enfermedad=enf.id_enfermedad and m.id_municipio=parr.id_municipio and ald.id_tipo_aldea=aldt.id_tipo_aldea and e.id_alumno='$cedula_alumno'");
//$arr=pg_fetch_array($result);

//$cedula_alumno=$arr[0];
$pfg=$arr[1];
$nombres=$arr[2];
$apellidos=$arr[3];
$municipio_vzla=$arr[4];
$estado_vzla=$arr[5];
$fecha_nacimiento=$arr[6];
$sexo=$arr[7];
$anno_ingreso=$arr[8];
$nombre_etnia=$arr[9];
$telf_hab=$arr[10];
$telf_cel=$arr[11];
$correo_electronico=$arr[12];
$anno_egreso_bachiller=$arr[13];
$nombre_estado_civil=$arr[14];
$nombre_pais=$arr[15];
$nro_hijos=$arr[16];
$nombre_estatus=$arr[17];
$nombre_discapacidad=$arr[18];
$nombre_enfermedad=$arr[19];
$parroquia_vzla=$arr[20];
$nombre_aldea=$arr[21];
$nombre_tipo_aldea=$arr[22];

if($nombre_estatus=='ACTIVO')
 $color_estatus='#aad6ad';
else 
 $color_estatus='#e86e68';

list($ano,$mes,$dia)=split('[/-]',$fecha_nacimiento);
$fecha_nacimiento=sprintf("%s-%s-%s",$dia,$mes,$ano);

if($sexo=='M')
 $masculino='CHECKED';
else
 $femenino='CHECKED';

$estado_campo='disabled';

echo"<table cellpadding=0 cellspacing=3 align=center width=770 border=0 bgcolor=#fafafa>
<tr><td colspan=5>

<table  cellpadding=0 cellspacing=0>
<tr><td width=15 height=15><img src=images/conner7.jpg></td><td bgcolor=#990000 align=center style='border-bottom:1px solid #990000' width=755><font class=normal color=#ffffff><b>Datos Personales</b></td></tr>
<tr><td height=1 bgcolor=#878787 colspan=2></td></tr>
</table>

</td></tr>
<tr><td colspan=5 align=center height=5><font class=normal color=#ffffff></font></td></tr>
<tr><td width=150 align=right><font class=normal color=#878787>Cédula</td><td><input style='border:1px solid #C0C0C0;color:#c0c0c0' class=boton  name=cedula_alumno size=8 value='$cedula_alumno' readonly></td><td align=right width=300><font class=normal color=#878787>Estado</td><td width=190><input style='border:1px solid #C0C0C0' class=boton size=30 name=estado_vzla value='$estado_vzla' $estado_campo></td><td rowspan=12 width=110 valign=top align=center><img width=110 height=100 style='border:1px solid #990000' src='images/fotos/$estado_vzla/$cedula_alumno.jpg'><br><font class=boton0 color=#878787>Foto</font><br><br><img src=images/logo_ubv.gif></td></tr>
<tr><td width=150 align=right><font class=normal color=#878787>Pasaporte</td><td><input style='border:1px solid #C0C0C0;color:#c0c0c0' class=boton  name=cedula_alumno size=15 value='$cedula_alumno' readonly></td></tr>
<tr><td align=right><font class=normal color=#878787>Nombres</td><td><input style='border:1px solid #C0C0C0' class=boton size=30 name=nombres tabindex=1 value='$nombres' $estado_campo></td>
<td align=right><font class=normal color=#878787>Municipo</td><td><input style='border:1px solid #C0C0C0' class=boton size=30 name=muicipio_vzla value='$municipio_vzla' $estado_campo></td></tr>
<tr><td align=right><font class=normal color=#878787>Apellidos</td><td><input style='border:1px solid #C0C0C0' class=boton size=30 name=apellidos tabindex=2 value='$apellidos' $estado_campo></td>
<td align=right><font class=normal color=#878787>Parroquia</td><td><input style='border:1px solid #C0C0C0' class=boton size=30 name=parroquia_vzla value='$parroquia_vzla' $estado_campo></td></tr>
<tr><td align=right><font class=normal color=#878787>Pais de nacimiento</td><td><select style='border:1px solid #C0C0C0' class=boton name=pais_nac value='$pais' $estado_campo>";

$result2=pg_exec($conn,"SELECT id_pais,nombre_pais FROM pais_nac order by nombre_pais");  
while($arr2=pg_fetch_array($result2))
 {
  if($nombre_pais==$arr2[1])
   {
   echo"<option selected>$arr2[1]</option>";
   $id_etnia=$arr2[0];
   }
  else
   echo"<option>$arr2[1]</option>";
 }
 
echo"</select></td><td align=right valign=middle><font class=normal color=#878787>Urb./Barrio</td><td><input size=30 style='border:1px solid #C0C0C0' class=boton name=urb_barrio value='$urb_barrio'></td></tr>

<tr><td align=right><font class=normal color=#878787>Fecha de nacimiento.</td><td><input style='border:1px solid #C0C0C0' class=boton size=11 name=fecha_nacimiento readonly id=edit1 datepicker=true datepicker_format='DD-MM-YYYY' tabindex=9 value='$fecha_nacimiento' $estado_campo></td>
<td align=right valign=middle><font class=normal color=#878787>Calle/Avenida</td><td><input size=30 style='border:1px solid #C0C0C0' class=boton name=calle_av value='$calle_av'></td></tr>

<tr><td align=right><font class=normal color=#878787>Estado civil</td><td><select style='border:1px solid #C0C0C0' class=boton name=estado_civil $estado_campo>";

$result2=pg_exec($conn,"SELECT id_estado_civil,nombre_estado_civil FROM estado_civil order by nombre_estado_civil");  
while($arr2=pg_fetch_array($result2))
 {
  if($nombre_estado_civil==$arr2[1])
   {
   echo"<option selected>$arr2[1]</option>";
   $id_estado_civil=$arr2[0];
   }
  else
   echo"<option>$arr2[1]</option>";
 }

echo"</select></td><td align=right valign=middle><font class=normal color=#878787>Edif./Casa</td><td><input size=30 style='border:1px solid #C0C0C0' class=boton name=edf_casa value='$edf_casa'></td></tr>

<tr><td align=right><font class=normal color=#878787>Sexo:</font></td><td><font class=normal color=#878787><INPUT type=radio name=sexo $masculino value=M>Masculino&nbsp;<INPUT type=radio name=sexo $femenino value=F>Femenino</font></td>
<td align=right valign=middle><font class=normal color=#878787>Nombre Casa</td><td><input size=30 style='border:1px solid #C0C0C0' class=boton name=nom_casa  value='$nom_casa'></td></tr>

<tr><td align=right valign=middle><font class=normal color=#878787>Referencia</td><td><input size=35 style='border:1px solid #C0C0C0' class=boton name=referencia_dir  value='$referencia_dir'></td></tr>

<tr><td align=right><font class=normal color=#878787>Teléf. Hab</td><td><input style='border:1px solid #C0C0C0' class=boton size=20 name=telf_hab  tabindex=5 value='$telf_hab' onKeyPress='return acceptNumTelf(event)' maxlength='20'></td></tr>
</tr><tr><td align=right><font class=normal color=#878787>Teléf. Cel</td><td><input style='border:1px solid #C0C0C0' class=boton size=20 name=telf_cel value='$telf_cel' onKeyPress='return acceptNumTelf(event)' maxlength=20></td></tr>
<tr><td align=right><font class=normal color=#878787>Correo electrónico</td><td><input style='border:1px solid #C0C0C0' class=boton size=30 name=correo_electronico value='$correo_electronico'></td></tr>

<tr><td colspan=5><img src=images/menu_datos_academicos.jpg></td></tr>
<tr><td colspan=5 align=center height=10><font class=normal color=#ffffff></font></td></tr>

<tr><td align=right><font class=normal color=#878787>Programa P.F.G.</td><td colspan=3><input size=60 style='border:1px solid #C0C0C0' class=boton name=pfg value='$pfg' $estado_campo ></td></tr>

<tr><td align=right><font class=normal color=#878787>Aldea</td><td colspan=3><input size=90 style='border:1px solid #C0C0C0' class=boton name=aldea tabindex=8 value='$nombre_aldea' $estado_campo></td></tr

<tr><td align=right><font class=normal color=#878787>Tipo aldea</td><td><input size=20 style='border:1px solid #C0C0C0' class=boton name=tipo_aldea value='$nombre_tipo_aldea' $estado_campo></td>

<tr><td align=right><font class=normal color=#878787>Estatus en UBV</td><td><input size=20 style='border:1px solid #C0C0C0;background:$color_estatus' class=boton name=nombre_estatus  value='$nombre_estatus' readonly></td>

<td align=right valign=middle><font class=normal color=#878787>Año egreso Br.</td><td valign=top><input style='border:1px solid #C0C0C0' class=boton size=3 maxlength=4 name=anno_egreso_bachiller tabindex=12 value='$anno_egreso_bachiller' onKeyPress='return acceptNum(event)' $estado_campo>&nbsp;<font class=boton color=#878787>Ej. 1985</td></tr>

<tr><td align=right><font class=normal color=#878787>Tipo de Titulo</td><td>
<select style='border:1px solid #C0C0C0' class=boton name=tipo_titulo><option>-- SELECCIONE</option>";

$result2=pg_exec($conn,"SELECT id_tipo_titulo,tipo_titulo FROM tipo_titulo order by tipo_titulo");  
while($arr2=pg_fetch_array($result2))
 {
  if($tipo_titulo==$arr2[1])
   {
   echo"<option selected>$arr2[1]</option>";
   $id_tipo_titulo=$arr2[0];
   }
  else
   echo"<option>$arr2[1]</option>";
 }
 
echo"</select></td>
<td align=right valign=middle><font class=normal color=#878787>Año ingreso UBV</td><td><input size=3 maxlength=4 style='border:1px solid #C0C0C0' class=boton name=anno_ingreso  value='$anno_ingreso' onKeyPress='return acceptNum(event)' $estado_campo>&nbsp;<font class=boton color=#878787>Ej. 2000</td></tr>
<tr><td align=right><font class=normal color=#878787>Estado</td><td width=190><input style='border:1px solid #C0C0C0' class=boton size=30 name=estado_vzla value='$estado_vzla' $estado_campo></td><tr>
<tr><td align=right><font class=normal color=#878787>Municipo</td><td><input style='border:1px solid #C0C0C0' class=boton size=30 name=muicipio_vzla value='$municipio_vzla' $estado_campo></td></tr>
<tr><td align=right><font class=normal color=#878787>Parroquia</td><td><input style='border:1px solid #C0C0C0' class=boton size=30 name=parroquia_vzla value='$parroquia_vzla' $estado_campo></td></tr>

<tr><td colspan=5><img src=images/menu_datos_otros.jpg></td></tr>
<tr><td colspan=5 align=center height=10><font class=normal color=#ffffff></font></td></tr>
<tr><td align=right><font class=normal color=#878787>Discapacidad</td>
<td><select style='border:1px solid #C0C0C0' class=boton name=discapacidad value='$discapacidad'>";

$result2=pg_exec($conn,"SELECT id_discapacidad,nombre_discapacidad FROM discapacidad order by nombre_discapacidad");  
while($arr2=pg_fetch_array($result2))
 {
  if($nombre_discapacidad==$arr2[1])
   {
   echo"<option selected>$arr2[1]</option>";
   $id_discapacidad=$arr2[0];
   }
  else
   echo"<option>$arr2[1]</option>";
 }

echo"</select></td>
<td align=right><font class=normal color=#878787>Enfermedad</td><td><select style='border:1px solid #C0C0C0' class=boton name=enfermedad>";
$result2=pg_exec($conn,"SELECT id_enfermedad,nombre_enfermedad FROM enfermedad order by nombre_enfermedad");  
while($arr2=pg_fetch_array($result2))
 {
  if($nombre_enfermedad==$arr2[1])
   {
   echo"<option selected>$arr2[1]</option>";
   $id_enfermedad=$arr2[0];
   }
  else
   echo"<option>$arr2[1]</option>";
 }
echo"</select></td>
</tr>
<tr><td align=right><font class=normal color=#878787>Etnia</td><td><select style='border:1px solid #C0C0C0' class=boton name=nombre_etnia>";
$result2=pg_exec($conn,"SELECT id_etnia,nombre_etnia FROM etnia order by nombre_etnia");  
while($arr2=pg_fetch_array($result2))
 {
  if($nombre_etnia==$arr2[1])
   {
   echo"<option selected>$arr2[1]</option>";
   $id_etnia=$arr2[0];
   }
  else
   echo"<option>$arr2[1]</option>";
 }
echo"</td><td align=right><font class=normal color=#878787>Nro. hijos</td>
<td><input style='border:1px solid #C0C0C0' size=2 maxlength=2  class=boton name=nro_hijos tabindex=11>
</td></tr>";

echo"<tr><td height=12></td></tr>
<tr><td colspan=5 align=center style='border-top:1px solid #990000;padding:4px'>

<table><form action=$PHP_SELF method=get>
<tr><td>
<input type=hidden name=mopc value=sa>
<input type=submit style='color:#990000' class=boton6 value='Cancelar' disabled></td></form><td><input type=submit style='color:#990000' class=boton6 value='Actualizar' disabled></td></tr>
</table>

</td></tr>
</table>";

//}
?>
