<?php
$login='generico';
$password='generico';
$total_inscritos=0;
$total_general_estado=0;
$total_general_por_inscribirse=0;

$id_estado_vzla=$_POST[id_estado_vzla];
$nombre_estado_vzla=$_POST[nombre_estado_vzla];


$detalle=$_POST[detalle];
$grafico=$_POST[grafico];

$conn=verifica_usuario($login,$password);

if($detalle==1)
{
echo"<table cellpadding=1 cellspacing=1 width=450 border=0>
<tr><td align=center colspan=3 bgcolor=#ffffff height=20><font class=boton>DETALLE DE INSCRIPCIONES DEL ESTADO:<b> $nombre_estado_vzla</b></font></td></tr>
<tr><td bgcolor=#990000 width=300 class=celda_menu><font class=boton color=#ffffff>PROGRAMA DE FORMACION DE GRADO</td><td bgcolor=#990000 width=150 class=celda_menu><font class=boton color=#ffffff>ESTUDIANTES INSCRITOS</td></tr>";
$login='generico';
$password='generico';
$conn=verifica_usuario($login,$password);

$total_general=0;
$result=pg_exec($conn,"select id_municipio,municipio from municipio_vzla where id_estado='$id_estado_vzla' order by municipio");
while($arr=pg_fetch_array($result))
{
  $total=0;
  echo"<tr><td bgcolor=#c0c0c0><font class=boton>MUNICIPIO: <b>$arr[1]</b></td><td bgcolor=c0c0c0><input type=submit style='color:#990000' class=boton2 value=Aldeas></td></tr>";
  $result2=pg_exec($conn,"select m.denominacion_pfg,count(i.id_alumno) from inscripcion i, estado_academico e, programaformaciongrado m where i.id_alumno=e.id_alumno and i.id_pfg=m.id_pfg  and e.id_municipio='$arr[0]' group by m.denominacion_pfg");
  while($arr2=pg_fetch_array($result2))
  {
   echo"<tr><td><font class=boton>$arr2[0]</td><td class=celda_menu align=right><font class=boton>$arr2[1]</td></tr>";
   $total=$total+$arr2[1];
  }
  echo"<tr><td align=right style='border-top:1px solid #990000'><font class=boton color=#878787>Total Inscritos</td><td align=right style='border-top:1px solid #990000'><font class=boton><b>$total</b></td></tr>";
  $total_general=$total_general+$total;
}
echo"<tr><td colspan=2 align=right><font class=boton>TOTAL GENERAL: <b>$total_general</b></td></tr>
</table>";
}
elseif($grafico==1)
{
$Sesion['nombre_estado_vzla']=$nombre_estado_vzla;
echo"<table width=450><tr><td align=center><font class=boton>DETALLE DE INSCRIPCIONES 2007-II ESTADO: $Sesion[nombre_estado_vzla]</td></tr>
<tr><td><p align=center valign=center><img src='includes/grafico_inscripcion.php'></p></td</tr><form action=$page method=post>
<tr><td align=center>
<input type=hidden name=resumen_inscripcion value=1>
<input type=submit class=boton style='color:#990000' value=Regresar></td></tr></form>
</table>";

}
else
{
echo"<table cellpadding=1 cellspacing=1 width=450 border=0 align=center>
<tr><td align=center colspan=6><font class=boton color=#990000>RESUMEN DE INSCRIPCIONES POR ESTADO, PERIODO 2007-II</td></tr>
<tr><td bgcolor=#990000 width=190 class=celda_menu><font class=boton color=#ffffff>Estado de Venezuela</td>
<td bgcolor=#990000 width=60 class=celda_menu align=center><font class=boton color=#ffffff>Estudiantes</td>
<td bgcolor=#990000 width=60 class=celda_menu align=center><font class=boton color=#ffffff>Inscritos</td>
<td bgcolor=#990000 width=80 class=celda_menu align=center><font class=boton color=#ffffff>Por Inscribirse</td>
<td bgcolor=#990000 width=40 class=celda_menu align=center><font class=boton color=#ffffff>Acción</td>
<td bgcolor=#990000 width=40 class=celda_menu align=center><font class=boton color=#ffffff>Acción</td></tr>";

$result=pg_exec($conn,"SELECT i.id_estado_vzla,e.estado,count(i.id_alumno) FROM inscripcion i, estado_vzla e where i.id_estado_vzla=e.id_estado group by e.estado,i.id_estado_vzla order by e.estado");
while($arr=pg_fetch_array($result))
{
 $result2=pg_exec($conn,"select count(e.id_alumno) from estado_academico e, municipio_vzla m, estado_vzla es where e.id_municipio=m.id_municipio and m.id_estado=es.id_estado and estado='$arr[1]' group by es.estado");
 $arr2=pg_fetch_array($result2);
 $total_estudiantes_estado=$arr2[0];
 $por_inscribirse=$total_estudiantes_estado-$arr[2];
 echo"<form action=$page method=post>
 <tr><td bgcolor=#f5f5f5><font class=boton>$arr[1]</td>
 <td class=celda_menu bgcolor=#f5f5f5 align=right><font class=boton>$total_estudiantes_estado</td>
 <td class=celda_menu bgcolor=#f5f5f5 align=right><font class=boton>$arr[2]</td>
 <td class=celda_menu bgcolor=#f5f5f5 align=right><font class=boton>$por_inscribirse</td>
 <td align=center bgcolor=#f5f5f5 title='Ver gáfico'>
 <input type=hidden name=resumen_inscripcion value=1>
 <input type=hidden name=grafico value=1>
 <input type=hidden name=nombre_estado_vzla value='$arr[1]'>
 <input type=image src=images/kchart.jpg></td></form>
 <form action=$page method=post>
 <td align=center bgcolor=#f5f5f5 title='Ver detalle'>
 <input type=hidden name=resumen_inscripcion value=1>
 <input type=hidden name=id_estado_vzla value='$arr[0]'>
 <input type=hidden name=detalle value=1>
 <input type=hidden name=nombre_estado_vzla value='$arr[1]'>
 <input type=image src=images/search.jpg></td></tr></form>";
 $total_inscritos=$total_inscritos+$arr[2];
 $total_general_estado=$total_general_estado+$total_estudiantes_estado;
 $total_general_por_inscribirse=$total_general_por_inscribirse+$por_inscribirse;
}
echo"<tr><td align=center style='border-top:1px solid #990000'><font class=boton>TOTAL</td>
<td align=right style='border-top:1px solid #990000'><font class=boton><b>$total_general_estado</b></td>
<td align=right style='border-top:1px solid #990000'><font class=boton><b>$total_inscritos</b></td>
<td style='border-top:1px solid #990000' align=right><font class=boton><b>$total_general_por_inscribirse</b></td>
<td style='border-top:1px solid #990000'>&nbsp;</td></td>
<td style='border-top:1px solid #990000'>&nbsp;</td></tr>
</table>";
}

?>