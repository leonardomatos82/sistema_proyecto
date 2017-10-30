<style type="text/css">
<!--
#menu {
	border: 1px solid black;
	/* Pintamos las lineas de todos los lados, excepto el inferior, ya que cada
	   'li' ya trae el borde inferior */
	border-width: 1px 1px 0 1px;
	/* Determina la anchura del menu */
	width: 150px;
	font-family: Arial;
	font-size: 0.8em;
}

/* Por defecto ul genera una separación hacia la derecha. con margin:0 queda anulada */
#menu ul {
	margin: 0;
	padding: 0;
}

#menu li {
	/* Eliminamos las marcas que genera el li como pueden ser las redonadas o recuadros */
	list-style-type: none;
	/* En cada li, pintamos la linea inferior */
	border-bottom: 0px solid #6643ff;
}

#menu a {
	display: block;
	text-decoration: none;
	color: #6643ff;
	background: #f0edff;
	padding: 3px 6px 3px 6px;
}

#menu a:hover {
	background: #d6ccff;
}
-->
</style>


<?php 
session_start();
include("control/valida.php"); 
include("config.php");
include("utils.php");
include("tabla.php"); 
include("barra2.php");
$colorf='green';
$ano=date("Y");
$query="SELECT * FROM periodo_lectivo where estado='ACTIVO'";
$result=pg_query($con,$query);
$row = pg_fetch_array($result);
if ($row[0]=='0'){$row[0]=0; 
$colorf='black';
$sol='';
$row[0]='';

}
?>


<script type="text/javascript">
numImg = 0;
imgs = ['imagenes/fotos/foto1.jpg','imagenes/fotos/foto2.jpg','imagenes/fotos/foto3.jpg','imagenes/fotos/foto4.jpg','imagenes/fotos/foto5.jpg','imagenes/fotos/foto6.jpg','imagenes/fotos/foto7.jpg','imagenes/fotos/foto8.jpg'];
function cambiar() {
  numImg++;
  if (numImg==imgs.length) numImg=0;
  document.getElementById('imagen').src = imgs[numImg];
}


</script> 

<body onload="setInterval('cambiar()',28000)"> 
<table width=100%  height="100px" border="0" align="<?echo $alight; ?>" bgcolor="<?echo $bgcolor; ?>">
<tr>
	<td width="200px"></td>
        <td width="600px"></td>
        <td width="200px"></td>
</tr>
<tr>
	<td width="200px" height="20px"><font  size="2"><a href="menu.php"><img id="imagen2" align="center"  src="imagenes/home.png" width="20" height="20"  border="0"></a> Bienvenido: </font></td>
<td width="600px"><strong><font size="4" face="Times New Roman, Times, serif"><marquee behavior="scroll" direction="left">SISTEMA DE APOYO A PROYECTO Y PASANTIAS</marquee>

</font></strong></td>
<td width="350px"><font  size="1">Usuario: <? echo $_SESSION['nomb_usuario']; ?><a href="control/desconectar.php"><img id="imagen2" align="center"  src="imagenes/iconos/salir.png" width="20" height="20"  border="0" TITLE="Salir del Sistema"></a></td>
</tr>
<tr>
	<td width="300px"  height="300px"><div align="center">

<table width=95px height=200px border="2" align="<?echo $alight; ?>" bgcolor="#BDBDBD">


<tr>
<td align="left">

<font  size="1">Periodo Activo:<? echo $row[periodo]?> </font>
<div id="menu" align="left">
<li ><h1 style="font-size:1em" >CENSO</h1></li>
	<ul >
		<? if ($row[proceso]=='ACTIVO'){?>   <li><a href="censo_proyecto/censo.php"> Censo de Estudiante</a></li><?}?>
	

	</ul>
</div>
<div id="menu" align="left">
<li ><h1 style="font-size:1em" >PASANTIAS</h1></li>
	<ul >
		<? if ($row[proceso]=='ACTIVO'){?>   <li><a href="inscripcion_pasantia/Mdatos.php"> Inscribir Pasante</a></li><?}?>
<? if ($row[proceso]=='ACTIVO'){?>   <li><a href="inscripcion_pasantia/buscarpasantia.php"> Modificar Pasante</a></li><?}?>
		<li><a href="consulta/buscar.php">Planillas del Pasante</a></li>

             <? if ($_SESSION['tipo']=='A'){?>    <li><a href="reportes_pdf/buscar_inscripcion_pasantia_pfg.php">Reportes de Pasante</a></li><?}?>
	</ul>
</div>

<div id="menu" align="left">
<li><h1 style="font-size:1em">TEG</h1></li>
	<ul>
		<? if ($row[proceso]=='ACTIVO'){?>  <li><a href="inscripcion_teg/cantidad.php">Inscribir TEG</a></li><?}?>
                <li><a href="inscripcion_teg/buscarteg.php">Modificar TEG</a></li>
		<li><a href="consulta/buscar2.php">Planillas de TEG</a></li>

             <? if ($_SESSION['tipo']=='A'){?> <li><a href="reportes_pdf/buscar_inscripcion_teg_pfg.php">Reportes de TEG</a></li><?}?>
	</ul>
</div>
<div id="menu" align="left">
<li><h1 style="font-size:1em">SOCIALIZACION</h1></li>
	<ul>
                <li><a href="socializacion_teg/buscarteg.php">Actualizar TEG</a></li>
	</ul>
</div>

<div id="menu" align="left">
<li><h1 style="font-size:1em">ESTUDIANTE</h1></li>
	<ul>
		<li><a href="vincular_estudiante/Avincular.php">Vincular a TEG</a></li>
	</ul>
</div>

</td>
</tr>
</table>
</td>
	
	<td rowspan="9" ><div align="center"><img id="imagen" align="center"  src="imagenes/fotos/foto1.jpg" width="200" height="200"  border="0"> </td>

<td align="center">

<table width=95px height=200px border="2" align="<?echo $alight; ?>" bgcolor="#BDBDBD"">


<tr>
<td align="center">

<div id="menu" align="left">
<li><h1 style="font-size:1em">REPORTES</h1></li>
	<ul >
		<li><a href="consulta/buscarsocializacion.php"> Planilla de Socializacion de TEG</a></li>
              
		
	</ul>
</div>

<div id="menu" align="left">
<li><h1 style="font-size:1em">TEG en Pdf</h1></li>
	<ul >
		 <li><a href="carga_teg/pag1.php">Subir TEG pdf</a></li>
                 <li><a href="carga_teg/TEG">Ver TEG pdf</a></li>
              
		
	</ul>
</div>



<div id="menu" align="left">
<li><h1 style="font-size:1em">ESTADISTICAS</h1></li>
	<ul >
		 <? if ($_SESSION['tipo']=='A'){?>  <li><a href="consulta/buscar_inscripcion_pasantia_pfg.php"> Estadisticas de Pasantias</a></li><?}?>
                 <? if ($_SESSION['tipo']=='A'){?>  <li><a href="consulta/buscar_inscripcion_teg_pfg.php"> Estadisticas de TEG</a></li><?}?>
		
	</ul>
</div>

<div id="menu" align="left">
<li><h1 style="font-size:1em">CONFIGURACION</h1></li>
	<ul>
		 <? if ($_SESSION['tipo']=='A'){?>  <li><a href="periodo_lectivo/lectivo.php">Apertura Periodo Lectivo</a></li><?}?>
                 <? if ($_SESSION['tipo']=='A'){?>  <li><a href="periodo_lectivo/cerrar_lectivo.php">Cerrar Periodo Lectivo</a></li><?}?>
                 <? if ($_SESSION['tipo']=='A'){?>  <li><a href="acceso/Aacceso.php">Nuevo Usuario</a></li><?}?>
                <li><a href="acceso/Macceso.php">Cambio de Clave</a></li>
                <? if ($_SESSION['tipo']=='A'){?>    <li><a href="acceso/ver_anularacceso.php">Invalidar Usuario</a></li><?}?>
		 <? if ($_SESSION['tipo']=='A'){?>  <li><a href="utilidades/cfondo.php">Fondo de Pantalla</a></li><?}?>

	</ul>
</div>

</td>
</tr>
</table>

</TABLE> 


<? include("pie2.php"); ?>