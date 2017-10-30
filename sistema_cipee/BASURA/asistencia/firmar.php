<meta http-equiv="refresh" content="600; url=http://172.17.1.50/constancias/asistencia/firmar.php" >
<?php 
//include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
//include("../utilidades/postit.php");


if ($_GET[id]=="1"){
include("../barra.php");
}
$resultado3 = pg_query($con,"SELECT * FROM trabajador order by nombre");
?>

 <script language="JavaScript">
function acceptNum(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key <= 13 || (key >= 48 && key <= 57));
}
var nav4 = window.Event ? true : false;
function acceptChar(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key < 48 || key > 57);
}
  </script>
<script language="JavaScript" type="text/JavaScript">
    var Hoy = new Date("<?php echo date("d M Y  G:i:s");?>");
function Reloj(){ 
    Hora = Hoy.getHours() 
    Minutos = Hoy.getMinutes() 
    Segundos = Hoy.getSeconds() 
    if (Hora>12) Hora=Hora-12 
    if (Hora<=9) Hora = "0" + Hora 
    if (Minutos<=9) Minutos = "0" + Minutos 
    if (Segundos<=9) Segundos = "0" + Segundos 
     
    var Dia = new Array("Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sábado", "Domingo"); 
    var Mes = new Array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"); 
    var Anio = Hoy.getFullYear(); 
    var Fecha = Dia[Hoy.getDay()] + ", " + Hoy.getDate() + " de " + Mes[Hoy.getMonth()] + " de " + Anio + ", - "; 
    var Inicio, Script, Final, Total 
    Inicio = "<font size=4 color=black>" 
    
    Script = Fecha + Hora + ":" + Minutos + ":" + Segundos 
    <?
$hora = getdate(time());

 if ($hora["hours"]>12){ 
 $hora["hours"] = $hora["hours"]-12;
 $m="PM";
 }else{
  $m="AM";
 }


 
  if ($hora["hours"]<=9){ 
     $h="0".$hora["hours"];
 }else{
     $h=$hora["hours"];
 }
 if ($hora["minutes"]<=9){ 
     $min="0".$hora["minutes"];
 }else{
     $min=$hora["minutes"];
 }
  if ($hora["seconds"]<=9){ 
     $seg="0".$hora["seconds"];
 }else{
     $seg=$hora["seconds"];
 }

$time=$h . ":" . $min;

if ((($time >= '01:00') && ($time <= '10:00')) && $m=='AM'){ $sel1='selected';$sel2='';}
if ((($time > '10:00') && ($time <= '12:30')) && $m=='AM'){ $sel1='';$sel2='selected';}
if ((($time >= '12:31') && ($time <= '02:30')) && $m=='PM'){ $sel1='selected';$sel2=''; }
if ((($time > '02:30') && ($time <= '11:59')) && $m=='PM'){ $sel1='';$sel2='selected';}

?>
    Final = "</font>" 
    Total = Inicio + Script + Final 
    document.getElementById('Fecha_Reloj').innerHTML = Total 
    Hoy.setSeconds(Hoy.getSeconds() +1)
    setTimeout("Reloj()",1000) 
} 
</script>

<body  onload="Reloj();document.forms.form2.cedula.focus()" >
<?






if ($_GET[id]!="1"){
$ruta='edit_firma.php?time='.$time;
?>





 
<table width="766" border="0" align="center" bgcolor="#FFFFFF">
<? }else{ $ruta='edit_firma.php?time='.$time; ?>
<table width="750" border="0" align="center" bgcolor="#FFFFFF">
<? } ?>
  <tr>
    <td colspan="2"><strong><font size="3">Sistema en Linea </strong></td>
 
  </tr><tr>
    <td colspan="2"><strong>
<p> <FONT Size=2> <a href="http://172.17.1.50/intranet2/index.php"> <font size="5"> ||Volver al Inicio|| </font></a> </p> </strong></td></tr>
  <tr>
   <?

if ($_GET[id]!="1"){
$fech=date("d-m-Y");
 $dias = array(Domingo,Lunes,Martes,Miercoles,Jueves,Viernes,Sabado);
$fechae = $dias[date(N, strtotime($fech))]; 
     if ($fechae=="Lunes" || $fechae=="Martes" || $fechae=="Miercoles"|| $fechae=="Jueves" || $fechae=="Viernes"){}else{
 echo "<td width><em><font size=2><strong>LOS DIAS PARA FIRMAR ASISTENCIA SON: DE LUNES A VIERNES</strong> :</em></td>";
include("../pie.php"); 
die();
}
}
?>
    <td width><em><font size="2"><strong>FIRMAR ASISTENCIA</strong> :</em></td>
  
  </tr>
 <tr>
<td> </td> <td> <h1 align="left" class="style28">
      <div id="Fecha_Reloj"></div></td>
</tr>
  <tr>
 
    <td><form name="form2" style="width: 342px; height: 150px;" action="<? echo $ruta ?>" method="post">
      <table   border="0" width="500" >
  <tr><td>&nbsp;</td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CEDULA</td></tr>
          


        <tr>
          <td width="20%" height="30"><font size="2">&nbsp;&nbsp; </td>
          <td width="85%" height="30">
              <select name="es" style="font-size:16pt;">            
 		<option value="ENTRADA" <?echo $sel1; ?>>ENTRADA</option>
              <option value="SALIDA" <?echo $sel2; ?>>SALIDA</option>
            </select><input style="font-size:18pt;" autocomplete=OFF name="cedula" type="text" id="cedula" onkeypress="return acceptNum(event)" size="9" maxlength="9"/>
          <font size="1">* Ej: 15123123</td>
        </tr>
            
        <tr>
          <td>&nbsp;</td>
          <td><input style="font-size:16pt;" value="REGISTRAR ASISTENCIA" type="submit" name="submit2" /></td>
        </tr>
      </table>
    </form></td>

  </tr>
</table>
   </tr>
<?
if ($_GET[id]!="1"){ ?>
<table width="766" border="0" align="center" bgcolor="#FFFFFF">
<? }else{ ?>

<? } ?>
 <?php
include("../pie.php"); 
 ?>
