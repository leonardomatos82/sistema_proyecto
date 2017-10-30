<?php
include("../control/valida.php"); 
include("../css.php");
include("../config.php");
?>
<tr>
 <td>&nbsp;</td>
<td>&nbsp;</td>
 </tr>
 <?php
include("../atras.php"); 
?>
   </tr>
  <tr> 
<table width="760" border="0" align="center" bgcolor="#FFFFFF">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="73">&nbsp;</td>
  </tr>
  <tr> 
    <td width="60">&nbsp;</td>
    <td width="709"><em>Para Informe mensual:</em></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="22">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="26">&nbsp;</td>
    <td><strong>SELECCIONE EL TIPO DE REPORTE</strong></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td><form name="form1" method="post" action="tipo_reporte.php">
        <table width="693" border="0" cellpadding="0" cellspacing="o">
          <tr> 
            <td width="100">&nbsp;</td>
            <td width="217">&nbsp;</td>
            <td width="51">&nbsp;</td>
            <td width="239">&nbsp;</td>
            <td width="86">&nbsp;</td>
          </tr>
          <tr> 
            <td height="33"><div align="right"><strong>REPORTE : </strong></div></td>
            <td> <div align="left"> 
                <select name="tipo_reporte">
                  <option value="00">SELECCIONE.....</option>
                  <option value="01">RELACION DE CHEQUES EMITIDOS</option>
                  <option value="02">RELACION DE CHEQUES ANULADOS</option>
                  <option value="03">LIBRO DE BANCOS</option>
                  <option value="04">RELACION DE GASTOS</option>
                  <option value="05">LIBRO DE COMPRAS</option>
                  <option value="06">RELACION DE RETENCIONES IVA</option>
                   <option value="07">RELACION DE RETENCIONES ISRL</option>
				  <option value="08">DISTRIBUCION PRESUPUESTARIA GENERAL</option>
				  <option value="13">DISTRIBUCION PRESUPUESTARIA CHEQUES</option>
				   <option value="09">GRAFICO DISTRIBUCION PRESUPUESTARIA</option>
				   <option value="10">GRAFICO CANTIDAD DE CHEQUES</option>
				     <option value="11">RELACION DE CAJA CHICA</option>
				      <option value="12">RENDICION DE CAJA CHICA</option>
				        <option value="14">TODOS LOS REPORTES MENSUALES</option>
				                </select>
              </div></td>
            <td>&nbsp;</td>
            <td rowspan="3"><div align="left"><img src="../imagenes/cheque.jpg" width="91" height="66"></div></td>
            <td>&nbsp;</td>
          </tr>
           </tr>
           <tr> 
            <td><div align="right"><strong>FONDO :</strong></div></td>
            <td> <select name="tipo">
                <option value="0" SELECTED>TODO.....</option>
                <option value="FONDO MENSUAL">FONDO MENSUAL</option>
                <option value="FONDO ESPECIAL">FONDO ESPECIAL</option>
              </select>
              </td>
          </tr>
           <tr> 
            <td><div align="right"><strong>EXPORTAR:</strong></div></td>
            <td> <select name="exportar">
                <option value="0" SELECTED>NO.....</option>
                <option value="01">HOJA DE CALCULO</option>
				</select>
              </td>
          </tr>
 
          <tr> 
            <td><div align="right"><strong>DESDE :</strong></div></td>
            <td><select name="desde_dia">
                <option value="01">01</option>
                <option value="02">02</option>
                <option value="03">03</option>
                <option value="04">04</option>
                <option value="05">05</option>
                <option value="06">06</option>
                <option value="07">07</option>
                <option value="08">08</option>
                <option value="09">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
                <option value="24">24</option>
                <option value="25">25</option>
                <option value="26">26</option>
                <option value="27">27</option>
                <option value="28">28</option>
                <option value="29">29</option>
                <option value="30">30</option>
                <option value="31">31</option>
              </select> <select name="desde_mes">
                <option value="01">Enero</option>
                <option value="02">Febrero</option>
                <option value="03">Marzo</option>
                <option value="04">Abril</option>
                <option value="05">Mayo</option>
                <option value="06">Junio</option>
                <option value="07">Julio</option>
                <option value="08">Agosto</option>
                <option value="09">Septiembre</option>
                <option value="10">Octubre</option>
                <option value="11">Noviembre</option>
                <option value="12">Diciembre</option>
              </select> <select name="desde_year">
                <option value="2009">2009</option>
                <option value="2008">2008</option>
              </select></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td><div align="right"><strong>HASTA :</strong></div></td>
            <td><select name="hasta_dia">
                <option value="01">01</option>
                <option value="02">02</option>
                <option value="03">03</option>
                <option value="04">04</option>
                <option value="05">05</option>
                <option value="06">06</option>
                <option value="07">07</option>
                <option value="08">08</option>
                <option value="09">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
                <option value="24">24</option>
                <option value="25">25</option>
                <option value="26">26</option>
                <option value="27">27</option>
                <option value="28">28</option>
                <option value="29">29</option>
                <option value="30">30</option>
                <option value="31">31</option>
              </select> <select name="hasta_mes">
                <option value="01">Enero</option>
                <option value="02">Febrero</option>
                <option value="03">Marzo</option>
                <option value="04">Abril</option>
                <option value="05">Mayo</option>
                <option value="06">Junio</option>
                <option value="07">Julio</option>
                <option value="08">Agosto</option>
                <option value="09">Septiembre</option>
                <option value="10">Octubre</option>
                <option value="11">Noviembre</option>
                <option value="12">Diciembre</option>
              </select> <select name="hasta_year">
                <option value="2009">2009</option>
                <option value="2008">2008</option>
              </select></td>
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
            <td>&nbsp;</td>
            <td><input type="submit" name="Submit" value="Consultar"></td>
            <td>&nbsp;</td>
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
        </table>
      </form></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
   
     <td bgcolor="#FFFFFF"><b>OTROS REPORTES </b><link rel="stylesheet" type="text/css" href="../estilos.css">
   <div id="vertical">
  
              <ul>
  
                      <li><a href="ver_recibo_voucher.php">Todos los Vouchers</a>  
                      <li><a href="transaccion.php">Registro de Transacciones</a> 
                     
  
              </ul>
  
      </div></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   
     
<?php
include("../pie.php"); 
 ?>