<?php 
//include("control/valida.php"); 
include("config.php");
include("utils.php");

include("style.php"); 
include("tabla.php"); 
?>
<script language="javascript">
var foco = {
	ini : function()
	{
		if (0 in document.form1) {
			var f=document.form1[0];
			f.login.focus();
		}
	
	}
}
</script>
  
     


<body onload="document.form1.login.focus()"></body>
<table width="760" border="0" align="center" bgcolor="#FFFFFF">
  
  <tr> 
    <td>&nbsp;</td>
    <td colspan="2"><div align="right"> 
        <script language="javascript">
<!--
   nombres_dias = new Array("Domingo", "Lunes", "Martes", "Mi�rcoles", "Jueves", "Viernes", "S�bado")
   nombres_meses = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre")
   fecha_actual = new Date()
   dia_mes = fecha_actual.getDate()		//dia del mes
   strdia_mes = (dia_mes <= 9) ? "0" + dia_mes : dia_mes
   dia_semana = fecha_actual.getDay()		//dia de la semana
   mes = fecha_actual.getMonth() + 1
   strmes = (mes <= 9) ? "0" + mes : mes
   anio = fecha_actual.getYear()
   if (anio < 100) anio = "19" + anio			//pasa el a�o a 4 digitos
   else if ( ( anio > 100 ) && ( anio < 999 ) ) {	//efecto 2000
      var cadena_anio = new String(anio)
      anio = "20" + cadena_anio.substring(1,3)
   }
document.write(nombres_dias[dia_semana] + ", " + dia_mes + " de " + nombres_meses[mes - 1] + " de " + anio)

//-->
              </script>
      </div></td>
  </tr>
<td><a href="../intranet/index.php"><img style="border: 0px solid ; width: 25px; height: 25px;" alt="Atras"
 src="imagenes/atras.png"></a></td>  
  <tr> 
   <td colspan="2"><em>Escriba El Nombre de Usuario y Clave de acceso </em></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td><form name="form1" method="post" action="control/login.php">
        <table width="693" border="0" cellpadding="0" cellspacing="o">
          <tr> 
            <td width="100">&nbsp;</td>
            <td width="163">&nbsp;</td>
            <td width="14">&nbsp;</td>
            <td width="330">&nbsp;</td>
            <td width="86">&nbsp;</td>
          </tr>
          <tr> 
            <td height="30"> <div align="right"><strong>USUARIO: </strong></div></td>
            <td> <div align="left"> 
                <input name="login"  type="text" size="15" autocomplete=OFF />
                * </div></td>
            <td>&nbsp;</td>
            <td rowspan="3"><div align="left"><img src="imagenes/security.png" width="64" height="64"></div></td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td height="30"> <div align="right"><strong>CLAVE :</strong></div></td>
            <td><input  name="password"  type="password" size="15" autocomplete=off />
              * </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td><div align="right"></div></td>
            <td><input type="submit" name="Submit" value="Entrar"></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="2"><div align="center"><font size="1">* Campo requerido</font></div></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
      </form></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
    <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
    <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td> <marquee direction="left" onmouseout="this.start()" onmouseover="this.stop()">
      Universidad Bolivariana de Venezuela|Ministerio del Poder Popular para la Educacion Superior </marquee></td>
    </tr>

    <? include("pie.php"); ?>
 
  

