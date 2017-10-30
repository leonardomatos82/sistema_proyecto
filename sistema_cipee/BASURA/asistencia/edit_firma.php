<?php
 session_start();
//include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../utils.php");
include("../la_ip.php");
$fecha=date("Y-m-d");
//include("../barra.php");
?>
<meta http-equiv="refresh" content="5; url=http://172.17.1.50/constancias/asistencia/firmar.php" >
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

?>
    Final = "</font>" 
    Total = Inicio + Script + Final 
    document.getElementById('Fecha_Reloj').innerHTML = Total 
    Hoy.setSeconds(Hoy.getSeconds() +1)
    setTimeout("Reloj()",1000) 
} 
</script>



<?

if ($_GET[id]!="1"){ ?>
<table width="766" border="0" align="center" bgcolor="#FFFFFF">
<? }else{ $id='1'; ?>
<table width="766" border="0" align="center" bgcolor="#FFFFFF">
<? } ?>
  <tr>
    <td colspan="2">&nbsp;</td>
    <td width="77">&nbsp;</td>
  </tr>
  <tr>
    <td width="149">&nbsp;</td>
    <td width="584">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="88"><p align="right">&nbsp;</p>
        <p align="right">&nbsp;</p></td>

          <?php

$val='firmar.php';
if($_POST[cedula]=="")
		{
		$val='firmar.php?id='.$id;
?>

 <td><form style="width: 615px;" action="<? echo $val; ?>" method="post">
      <p align="left"><br />
  <?       
	echo"<b>Mensaje: </b>".Numero_de_Cedula_Requerido."<br><br>";	
    	}
	  else 
	   {
 ?>
 <td><form style="width: 615px;" action="<? echo $val; ?>" method="post">
      <p align="left"><br />

<?	  


$query="SELECT * FROM trabajador where cedula='$_POST[cedula]'";
$result=pg_query($con,$query);
$row=pg_fetch_array($result);
         


 $query2="SELECT * FROM asistencia where fecha='$fecha' and cedula='$_POST[cedula]'";
       $result2=pg_query($con,$query2);
       $row2=pg_fetch_array($result2);
	   //$cedula=$_POST[cedula];
 if ($row[codigo]!="") {
if ($_POST[cedula]==$row2[cedula]){
   if ($m=='AM'){
       if ($_POST[es]=='ENTRADA'){ 
       if ($row2[entra1]==''){    $sql3="update asistencia set entra1='$time' where fecha='$fecha' and cedula='$row[cedula]'";  
if (!pg_query($con, $sql3)) { die('Error: ' . pg_result_error()); }   echo $row[nombre]." , REGISTRAMOS SU ENTRADA EN LA MAÑANA A LA HORA. ".$time ;  }else{     
echo $row[nombre]." , YA USTED FIRMO SU INGRESO EN LA MAÑANA. " ;  }
        }else{          $sql3="update asistencia set sale1='$time' where fecha='$fecha' and cedula='$row[cedula]'";  
if (!pg_query($con, $sql3)) { die('Error: ' . pg_result_error()); }	
 echo $row[nombre]." , REGISTRAMOS SU SALIDA EN LA MAÑANA A LA HORA. ".$time ; 
}
   }else{
       if ($_POST[es]=='ENTRADA'){ 
		if ($row2[entra2]==''){    $sql3="update asistencia set entra2='$time' where fecha='$fecha' and cedula='$row[cedula]'";  
if (!pg_query($con, $sql3)) { die('Error: ' . pg_result_error()); }   echo $row[nombre]." , REGISTRAMOS SU ENTRADA EN LA TARDE A LA HORA. ".$time ;  }else{     
echo $row[nombre]." , YA USTED FIRMO SU INGRESO EN LA TARDE. " ;  }
        }else{          $sql3="update asistencia set sale2='$time' where fecha='$fecha' and cedula='$row[cedula]'";  
if (!pg_query($con, $sql3)) { die('Error: ' . pg_result_error()); }
 echo $row[nombre]." , REGISTRAMOS SU SALIDA EN LA TARDE A LA HORA. ".$time ; 
	}


   }
		
             
}else{ 
    if ($m=='AM'){
       if ($_POST[es]=='ENTRADA'){ 
$sql3="INSERT INTO asistencia(fecha, codigo, cedula,id_dpto, entra1,tipo,ip) VALUES ('$fecha','$row[codigo]','$row[cedula]','$row[departamento]','$time','$row[tipo]','$ip_real')"; 
          if (!pg_query($con, $sql3)) { die('Error:fd ' . pg_result_error()); }	    
         echo $row[nombre]." , REGISTRAMOS SU INGRESO EN LA MAÑANA A LA HORA. ".$time ; 
        }else{          
 $sql3="INSERT INTO asistencia(fecha, codigo, cedula,id_dpto, sale1,tipo,ip) VALUES ('$fecha','$row[codigo]','$row[cedula]','$row[departamento]','$time','$row[tipo]','$ip_real')"; 
          if (!pg_query($con, $sql3)) { die('Error:fd ' . pg_result_error()); }	    
         echo $row[nombre]." , REGISTRAMOS SU SALIDA EN LA MAÑANA A LA HORA. ".$time ; 
}
   }else{
       if ($_POST[es]=='ENTRADA'){   
$sql3="INSERT INTO asistencia(fecha, codigo, cedula,id_dpto, entra2,tipo,ip) VALUES ('$fecha','$row[codigo]','$row[cedula]','$row[departamento]','$time','$row[tipo]','$ip_real')"; 
          if (!pg_query($con, $sql3)) { die('Error:fd ' . pg_result_error()); }	    
         echo $row[nombre]." , REGISTRAMOS SU INGRESO EN LA TARDE A LA HORA. ".$time ; 
        }else{         
 $sql3="INSERT INTO asistencia(fecha, codigo, cedula,id_dpto, sale2,tipo,ip) VALUES ('$fecha','$row[codigo]','$row[cedula]','$row[departamento]','$time','$row[tipo]','$ip_real')";
          if (!pg_query($con, $sql3)) { die('Error:fd ' . pg_result_error()); }	    
         echo $row[nombre]." , REGISTRAMOS SU SALIDA EN LA TARDE A LA HORA. ".$time ; 
 }


   }
		



}	

}else{
echo "Cedula de Identidad no existe en nuestros registros, favor contactar personal de la Coordinación de Talento Humano.";
}

    
     
////////////////////////////////////////////////////////////////////////
//$valor="-Operacion: Ingresar asistencia -".$_POST[cedula];
// registrarOperacion($con,$_SESSION['login'],$valor);      
////////////////////////////////////////////////////////////////////////
           
        }
 pg_close($con);
?>
      </p>
      <p align="left">
        <input name="submit2" type="submit" value="Volver" />
      </p>
    </form></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>

</table>
<?
if ($_GET[id]!="1"){ ?>
<table width="766" border="0" align="center" bgcolor="#FFFFFF">
<? }else{ $id='1'; ?>
<table width="750" border="0" align="center" bgcolor="#FFFFFF">
<? } ?>
  <?php
include("../pie.php"); 
 ?>
