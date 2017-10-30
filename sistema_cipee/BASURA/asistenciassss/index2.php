<?php 
include("config.php");
include("utils.php");
include("style.php"); 
include("tabla.php"); 
$query2="SELECT * FROM horario where id_horario='1'";
$result2=pg_query($con,$query2);
$row2=pg_fetch_array($result2);
?>
<meta http-equiv="refresh" content="20" />
<script>setTimeout('document.location.reload()',20*1000); </script>


<body  onload="Reloj();document.forms.form2.password.focus()" >
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
<font size="6"><strong>
              </strong></td>
<?
//echo $time;
 

?>

<!--? Main -->
<table width="767" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
  <tr>
    <th width="210" scope="col"><div id="col" class="noprint">
 <hr class="noscreen" />    
    <IMG SRC="clock.php?size=120 BORDER="0">
     
        <hr class="noscreen" />
        <!-- Category -->
         <h3 align="center" class="style10" >FIRMAR ASISTENCIA</h3>
<?
 
 if ( ($time>=$row2[entra1] && $time<=$row2[sale1]) || 
     ($time>=$row2[entra2] && $time<=$row2[sale2])  ||
     ($time>=$row2[entra3] && $time<=$row2[sale3])  ||
     ($time>=$row2[entra4] && $time<=$row2[sale4])    )  
     
     
       {
     
       
       
       ?>         
         <p align="center"> <FONT Size=1> <a href="usuario/Ausuario.php"> <font size="2">Registrarme</font></a> </p>
 <form name="form2" method="post" action="control/login.php?time=<?=$time ?>">
          <div align="justify">
 
              &nbsp;&nbsp;&nbsp;&nbsp;Cedula <strong>
                <input name="password" type="password" size="10" maxlength="30" autocomplete="OFF" />
              </strong></p>
            <p align="center">
            
              <input name="Enter" type="submit" id="Enter" value="Registrar" />
            </p>
            
          <p align="center"><img src="imagenes/lector.jpg" alt="" width="70" height="50" /> </p>
          </div>
        </form>    <? }else{?>
        
        &nbsp;&nbsp;&nbsp;&nbsp;PROCESO CERRADO
        
       <? } ?>     
         
           <hr class="noscreen" />
        <h3 align="center" class="style10" >SESION DE COORDINADOR</h3>
          <?php
		  if ($_SESSION["login"]=='') {
		  ?>
		
        <form name="form1" method="post" action="control/login2.php">
          <div align="justify">
            <p>&nbsp;&nbsp;Usuario
                      <input name="login" type="text" size="10" maxlength="30" autocomplete="OFF"/>
                      <br/>
                      <br/>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Clave <strong>
                <input name="password" type="password" size="10" maxlength="30" autocomplete="OFF" />
                
              </strong></p>
            <p align="center">
              <input name="Enter" type="submit" id="Enter" value="Entrar" />
            </p>
            <p align="center"><img src="imagenes/security.png" alt="" width="70" height="50" /> </p>
              
            </FONT>
             <hr class="noscreen" />
          </div>
        </form>
        <div align="center"> <span class="style4"> </span>
              <?php
		} else {
		//echo $_SESSION["login"] . " logout";
		?>
              <form name="form3"action="control/desconectar.php" method="post">
                <input name="SALIR" type="submit" value="SALIR"/>
              </form>
               
     <h3 align="center" class="style10"><marquee>Sistema Asistencia</marquee></h3>
          <?php
			}
			?>
       
      <!-- /col-in -->
    </div></th>
    
    <th width="566" bgcolor="#FFFFFF" scope="col"><div align="left"><!-- InstanceBeginEditable name="Cuerpo" -->
      <h1 align="left" class="style28">
      <div id="Fecha_Reloj"></div>
        <?php
		  if ($_SESSION["login"]=='') {
		  ?>
		  
      </h1>
      
      <p align="left" class="style28">&nbsp;</p>
      <p align="center" class="style28"><img src="imagenes/heading.jpg" alt="" width="340" height="270" />
        <?php
		} else {
		?>
        <table width="550" border="0" cellspacing="0" cellpadding="0">
         <tr>
         
          <td><div align="center"><span class="style1"><span class="style37">Bienvenido(a) al sistema</span></span></div></td>
        </tr>
        <tr>
          <td><div align="center"><span class="style1"><span class="style37">Men&uacute; de Inicio </span></span></div></td>
        </tr>
        <tr>
        
          <td><div align="center">
            <p class="style37"><span class="style28"><img src="imagenes/heading.jpg" alt="" width="340" height="270" /></span></p>
            <p class="style37">&nbsp;</p>
            <p class="style38"><font size="2"><a href="">&quot;Manual de Usuario&quot; </a></font></p>
          </div></td>
        </tr>
      </table>
      <p align="center" class="style1">
        <?php
			}
			?>
        &nbsp;</p>
      <!-- InstanceEndEditable --></div></th>
  </tr>

<!-- InstanceEnd -->
<tr> 
    <td>&nbsp;</td>
    <td> <marquee direction="left" onmouseout="this.start()" onmouseover="this.stop()">
      Universidad Bolivariana de Venezuela|Ministerio del Poder Popular para la Educacion Superior </marquee></td>
    </tr>
      <? include("pie.php"); ?>
</table>
