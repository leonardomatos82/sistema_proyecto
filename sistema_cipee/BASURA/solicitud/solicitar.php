
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
<?
if ($_GET[id]!="1"){$ruta='edit_solicitar.php';



 ?>
<table width="766" border="0" align="center" bgcolor="#FFFFFF">
<? }else{ $ruta='edit_solicitar.php?id=1'; ?>
<table width="750" border="0" align="center" bgcolor="#FFFFFF">
<? } ?>
  <tr>
    <td colspan="2"><strong><font size="3">Sistema en Linea </strong></td>
 
  </tr>

  <tr>
   <?
if ($_GET[id]!="1"){
$fech=date("d-m-Y");
 $dias = array(Domingo,Lunes,Martes,Miercoles,Jueves,Viernes,Sabado);
$fechae = $dias[date(N, strtotime($fech))]; 
     if ($fechae=="Lunes" || $fechae=="Martes" || $fechae=="Miercoles"){}else{
 echo "<td width><em><font size=2><strong>LOS DIAS PARA SOLICITAR CONSTANCIAS DE TRABAJO SON: LUNES- MARTES Y MIERCOLES</strong> :</em></td>";
include("../pie.php"); 
die();
}
}
?>
    <td width><em><font size="2"><strong>Solicitar Contancia de Trabajo</strong> :</em></td>
  
  </tr>
 
  <tr>
 
    <td><form style="width: 342px; height: 150px;" action="<? echo $ruta ?>" method="post">
      <table   border="0" width="500" >
  <tr><td>&nbsp;</td><td></td></tr>
          
        <tr>
          <td width="20%" height="30"><font size="2">&nbsp;&nbsp;N CEDULA: </td>
          <td width="85%" height="30">
              <input style="font-size:18pt;" autocomplete=OFF name="cedula" type="text" id="cedula" onkeypress="return acceptNum(event)" size="16" maxlength="9"/>
          <font size="1">* Ejemplo: 15123123</td>
        </tr>
            
        <tr>
          <td>&nbsp;</td>
          <td><input style="font-size:16pt;" value="Solicitar Constancia de Trabajo" type="submit" name="submit2" /></td>
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