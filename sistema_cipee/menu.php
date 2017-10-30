<?php 
session_start();
include("control/valida.php"); 

include("config.php");
include("utils.php");
include("tabla.php"); 
include("barra2.php");
$colorf='green';
$ano=date("Y");
$sol='Solicitudes Pendientes:';
$sql="select count(id_solicitud) from solicitud where estado='PENDIENTE'";
$result=pg_query($con,$sql);
$row = pg_fetch_row($result);
if ($row[0]=='0'){$row[0]=0; 
$colorf='black';
$sol='';
$row[0]='';

}
?>


<script type="text/javascript">
numImg = 0;
imgs = ['imagenes/fotos/foto1.jpg','imagenes/fotos/foto2.jpg','imagenes/fotos/foto3.jpg','imagenes/fotos/foto4.jpg'];
function cambiar() {
  numImg++;
  if (numImg==imgs.length) numImg=0;
  document.getElementById('imagen').src = imgs[numImg];
}


</script> 

<body onload="setInterval('cambiar()',28000)"> 
<table width=100%  height="200px" border="0" align="<?echo $alight; ?>" bgcolor="<?echo $bgcolor; ?>">
<tr>
	<td width="200px"></td>
        <td width="600px"></td>
        <td width="200px"></td>
</tr>
<tr>
	<td width="200px" height="20px"><font  size="2"><a href="menu.php"><img id="imagen2" align="center"  src="imagenes/home.png" width="20" height="20"  border="0"></a> Bienvenido: </font></td>
<td width="600px"></td>
<td width="350px"><font  size="1">Usuario: <? echo $_SESSION['nomb_usuario']; ?><a href="control/desconectar.php"><img id="imagen2" align="center"  src="imagenes/iconos/salir.png" width="20" height="20"  border="0" TITLE="Salir del Sistema"></a></td>
</tr>
<tr>
	<td width="300px"  height="350px"><div align="center">

<table width=95px height=350px border="0" align="<?echo $alight; ?>" bgcolor="<?echo $bgcolor; ?>">
<tr>
<td align="center">
<a href="menu.php"><img title="Inicio" id="imagen1" align="center"  src="imagenes/iconos/casa.png" width="60" height="60"  border="0" onmouseover="this.width=63;this.height=63;" onmouseout="this.width=60;this.height=60;"> </a>
<a href="autenticacion/buscar.php"><img title="Generar Documentos" id="imagen2" align="center"  src="imagenes/iconos/icono1.png" width="60" height="60"  border="0" onmouseover="this.width=63;this.height=63;" onmouseout="this.width=60;this.height=60;"> </a>
<a href="actualizar/buscar.php"><img title="Actualizar Datos" id="imagen3" align="center"  src="imagenes/iconos/icono6.png" width="60" height="60"  border="0" onmouseover="this.width=63;this.height=63;" onmouseout="this.width=60;this.height=60;"> </a>
<?

//<a href="solicitud/ver_solicitudes.php"><img title="Procesar Solicitudes" id="imagen3" align="center"  src="imagenes/iconos/icono2.png" width="60" height="60"  border="0" onmouseover="this.width=63;this.height=63;" onmouseout="this.width=60;this.height=60;"> </a>
//<a href="solicitud/ver_procesadas.php"><img title="Solicitudes Procesadas" id="imagen4" align="center"  src="imagenes/iconos/icono3.png" width="60" height="60"  border="0" onmouseover="this.width=63;this.height=63;" onmouseout="this.width=60;this.height=60;"> </a>
?>
</td>
</tr>
</table>
</td>
	
	<td rowspan="9" ><strong><font size="4" face="Times New Roman, Times, serif"><marquee behavior="scroll" direction="left">SISTEMA DE APOYO A CONTROL DE ESTUDIOS CIPEE</marquee>

</font></strong><div align="center"><img id="imagen" align="center"  src="imagenes/fotos/foto1.jpg" width="300" height="300"  border="0"> </td>

<td align="center">



</TABLE> 
<table width=100% height=55px border="0" align="<?echo $alight; ?>" bgcolor="<?echo $bgcolor; ?>">
<tr>
<td align="center">
<?php 
if ($_SESSION['tipo']=='A'){?>
<a href="utilidades/cfondo.php"><img title="Cambiar el Fondo de Pantalla" id="imagen2" align="center"  src="imagenes/iconos/fondo.png" width="40" height="40"  border="0" onmouseover="this.width=43;this.height=43;" onmouseout="this.width=40;this.height=40;"> </a>
<a href="consulta/ver_rep_estadisticas.php?year=<? echo $ano ?>"><img title="Ver Estadisticas" id="imagen2" align="center"  src="imagenes/iconos/icono10.png" width="40" height="40"  border="0" onmouseover="this.width=43;this.height=43;" onmouseout="this.width=40;this.height=40;"> </a>
<a href="configuracion/Mconf.php"><img title="Archivo de Configuracion" id="imagen2" align="center"  src="imagenes/iconos/icono12.png" width="40" height="40"  border="0" onmouseover="this.width=43;this.height=43;" onmouseout="this.width=40;this.height=40;"> </a>
<?} ?>
<a href="configuracion/calendario.php"><img title="Calendario del Mes" id="imagen2" align="center"  src="imagenes/iconos/icono9.png" width="40" height="40"  border="0" onmouseover="this.width=43;this.height=43;" onmouseout="this.width=40;this.height=40;"> </a>
<a href="configuracion/calculadora.php"><img title="Calculadora" id="imagen2" align="center"  src="imagenes/iconos/calc.jpg" width="40" height="40"  border="0"onmouseover="this.width=43;this.height=43;" onmouseout="this.width=40;this.height=40;" > </a>
<a href="acceso/Macceso.php"><img title="Cambiar Contraseña" id="imagen2" align="center"  src="imagenes/iconos/icono13.png" width="40" height="40"  border="0" onmouseover="this.width=43;this.height=43;" onmouseout="this.width=40;this.height=40;"> </a>
<a href="utilidades/ayuda.php"><img title="Ayuda y Soporte Especializado" id="imagen2" align="center"  src="imagenes/iconos/ayuda.png" width="40" height="40"  border="0"onmouseover="this.width=43;this.height=43;" onmouseout="this.width=40;this.height=40;" > </a>
</td>
</tr>
</table>

<? include("pie2.php"); ?>



