<?php 
session_start();
include("config.php");
include("utils.php");
include("tabla.php"); 
?>
 <td width=100% align="center">



<body onload="setInterval('cambiar()',18000)"> 

<table width=70% border="0" align="<?echo $alight; ?>" bgcolor="<?echo $bgcolor; ?>">

<tr >
	<td width="280px" height="3px" ><font  size="2"></font></td>
</tr>
<tr>
<td></td>
<td>

</td></tr>
<tr>
	<td bgcolor="#EEE7E7"><font  size="2"><hr class="noscreen" /> </font></td>
	
	<td rowspan="20" align="center"><font  size="2">Bienvenido al Sistema de apoyo a PROYECTO Y PASANTIAS</font><div align="center"><img id="imagen" align="center"  src="imagenes/ubv.jpg" width="150" height="150"  border="0"> </td>
</tr>

<tr >
	<td bgcolor="#EEE7E7"> <form name="form1" method="post" action="control/login.php" >
          <div align="justify"><h4 align="center" class="style10" >INICIO DE SESION</h4>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Usuario
                      <input style="font-size:8pt;" name="login" type="text" size="10" maxlength="30" autocomplete="OFF"/>
                      <br/>
                      <br/>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Clave <strong>
                <input style="font-size:8pt;" name="password" type="password" size="10" maxlength="30" autocomplete="OFF" />
              </strong></p>
            <p align="center">
              <input style="font-size:8pt;" name="Enter" type="submit" id="Enter" value="Entrar" />
            </p>
            <p align="center"><img src="imagenes/security.png" alt="" width="50" height="50" /> </p>
         
          </div>
        </form></td>
	<td></td>
</tr>
<tr>
		<td></td>
	<td></td>
</tr>

<tr>
	<td ><hr class="noscreen" /><font  size="1" >Generado por Coordinacion de TIT Barinas- Portuguesa.</h3></font></td>
	<td></td>
</tr>
</TABLE> 





<? include("pie2.php"); ?>



