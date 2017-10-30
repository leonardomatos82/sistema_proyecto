<?php 
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
//include("../utilidades/postit.php");

include("../barra.php");
$resultado3 = pg_query($con,"SELECT * FROM trabajador order by nombre");
?>
 <script language="JavaScript">
function acceptNum(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key <= 13 || (key >= 48 && key <= 57));
}
var nav4 = window.Event ? true : false;
function acceptChar(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key < 48 || key > 57);
}
  </script>

<table width="750" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2"><strong><font size="1">Trabajador </strong></td>
 
  </tr>
  <tr>
   
    <td width><em><font size="1">Escriba o seleccione los campos a buscar, haga directamente clic en <strong>Consultar</strong> :</em></td>
  
  </tr>
 
  <tr>
 
    <td><form style="width: 342px; height: 200px;" action="ver_cumplimiento_horario.php" method="post">
      <table   border="0" >
  <tr><td>&nbsp;</td><td></td></tr>
          
        <tr>
          <td width="15%" height="60"><font size="2">N CEDULA: </td>
          <td width="85%" height="30"><p>
              <input name="cedula" type="text" id="cedula" onkeypress="return acceptchar(event)" size="15" />
          </p></td>
        </tr>
        <tr>
          <td width="15%"><div align="left"><font size="2">TRABAJADOR: </div></td>
          <td width="85%"><select name="codigo" id="codigo" >
              <option value="0">-- Seleccione --</option>
              <?php while($obj=pg_fetch_object($resultado3)){?>
              <option value="<? echo $obj->cedula?>"> <? echo $obj->nombre?> </option>
              <? }//Fin while ?>
          </select></td>
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
                <option value="2012">2012</option>
              
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
                <option value="2012">2012</option>
         
              </select></td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        <tr>
          <td>&nbsp;</td>
          <td><input value="Consultar" type="submit" name="submit2" /></td>
        </tr>
      </table>
    </form></td>

  </tr>
</table>
   </tr>

 <?php
include("../pie.php"); 
 ?>
