<?php
//include("../control/valida.php"); 
include("../config.php");
//include("../tabla.php");
$resultado = pg_query($con, "SELECT * FROM periodo_pago");
$resultado2 = pg_query($con, "SELECT * FROM periodo_pago where dias=$_POST[periodo_pago]");
$row=pg_fetch_array($resultado2);
//include("../barra.php");
$cuotas=$_POST[cuotas];
$gracia=$_POST[gracia];
$capital=$_POST[capital];
$periodo_pago=$_POST[periodo_pago];
$int_banc=$_POST[int_banc];
$tipo_interes=$_POST[tipo_interes];
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
    <td colspan="2"><strong>Agregar Usuario de Sistema</strong></td>
   
  </tr>
  <tr>
    <td width="149">&nbsp;</td>
    <td width="580"><em>Agregar los datos del Usuario:</em></td>
   
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
   
  </tr>
  <tr>
    <td height="88"><p align="right">&nbsp;</p>
        <p align="right">&nbsp;</p></td>
    <td><form id="form1" name="form1" method="post" action="Atabla.php">
      <table width="70%" height="128" border="0">
<tr>
          <td width="13%"><div align="left">Tipo Credito:</div></td>  
 <td><select name="periodo_pago" id="select">
                <option value="<? echo $row['dias']?>" selected><? echo $row['descripcion_periodo']?></option>
                <?php while($obj=pg_fetch_object($resultado)){?>
                <option value="<? echo $obj->dias?>"><? echo $obj->descripcion_periodo?></option>
                <? }//Fin while ?>
              </select>
            </td>
      </td>
</tr>

       
<tr>
          <td width="13%"><div align="left">Tipo de Interes:</div></td>
          <td width="87%"><select name="tipo_interes">
                   <option value="0">SELECCIONE...</option>
                  <option value="1">FIJO...</option>
                  <option value="2">VARIABLE...</option>
       </select>
             </td>
        </tr>

        
        <tr>
          <td width="13%"><div align="left">cuotas:</div></td>
          <td width="87%"><input name="cuotas"  type="text" size="5" value="<? echo $_POST[cuotas]   ?>">
             </td>
        </tr>
   
           <tr>
          <td width="13%"><div align="left">Tasa Int:</div></td>
          <td width="87%"><input name="int_banc"  type="text" size="5" value=7.53 >
            </td>
        </tr>
           <tr>
          <td width="13%"><div align="left">Gracia:</div></td>
          <td width="87%"><input name="gracia"  type="text" size="5" value="<? echo $_POST[gracia]   ?>">
             </td>
        </tr>
          <tr>
          <td width="13%"><div align="left">capital:</div></td>
          <td width="87%"><input name="capital"  type="text" size="5" value="<? echo $_POST[capital]   ?>">
             </td>
        </tr>
        <tr>
          <td width="13%"><div align="right"></div></td>
          <td width="87%">&nbsp;</td>
        </tr>
        <tr>
          <td></td>
          <td><input value="Generar tabla variable" type="submit" name="submit"></td>
        </tr>
      </table>
    </form></td>
    
  </tr>
  <tr>
    <td>&nbsp;</td>
  
   
  </tr>
   </table>
<td width="100%" height="42" bordercolor="#000000" bgcolor="#FFFFFF">
<?php


echo "ANos: ".$tiempo;
echo "Cuotas: ".$cuotas;
echo "gracia: ".$gracia;
echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=100% bgcolor=#FFFFFF >";

 
echo "<tr>";
echo "<td <small style=width: 50px font-weight: bold><b>MES</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>INT ORDINARIOS</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>INT DIFERIDOS</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>CUOTA CAPITAL</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>TOTAL CUOTA</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>SALDO CAPITAL</b></td>";

echo "</tr> ";


if ($periodo_pago==30){$interes_o=(($capital*$int_banc)/100)*30/360;}
if ($periodo_pago==90){$interes_o=(($capital*$int_banc)/100)*90/360;}
if ($periodo_pago==180){$interes_o=(($capital*$int_banc)/100)*180/360;}
if ($periodo_pago==360){$interes_o=(($capital*$int_banc)/100)*360/360;}

$dif_cuotas=$cuotas-$gracia;
$int_dif=$interes_o*$gracia/$dif_cuotas;
$cuota_capital=$capital/$dif_cuotas;


//////////////////////////////////////////////
$t_interes_o=$t_interes_o+$interes_o;

//////////////////////////////////////////////


$int_dif=round($int_dif * 100) / 100;
$interes_o=round($interes_o * 100) / 100;
$cuota_capital=round($cuota_capital * 100) / 100;
$t_cuota=($interes_o+$int_dif)+$cuota_capital;


//$t_cuota=number_format($t_cuota,2,',','.');
for ($i=1;$i<=$cuotas;$i++){
if ($i<=$gracia){
echo "<tr> ";
echo "<td <small style=width: 50px >$i</td> ";
echo "<td <small style=width: 100px >-</td> ";
echo "<td <small style=width: 50px >-</td> ";
echo "<td <small style=width: 50px >-</td> ";
echo "<td <small style=width: 100px >-</td> ";
echo "<td <small style=width: 50px >$capital</td> ";
echo "</tr> ";
}else{
$capital=$capital-$cuota_capital;
If ($capital<1){$capital='0.00';}


echo "<tr> ";
echo "<td <small style=width: 50px >$i</td> ";
echo "<td <small style=width: 100px >$interes_o</td> ";
echo "<td <small style=width: 50px >$int_dif</td> ";
echo "<td <small style=width: 50px >$cuota_capital</td> ";
echo "<td <small style=width: 100px >$t_cuota</td> ";
echo "<td <small style=width: 50px >$capital</td> ";
echo "</tr> ";


///////////////////////////////////////////

$t_int_dif=$t_int_dif+$int_dif;
$t_cuota_capital=$t_cuota_capital+$cuota_capital;
$tt_cuota=$tt_cuota+$t_cuota;
$tcapital='0.00';

$interes_o=(($capital*7.58)/100)*30/360;
$interes_o=round($interes_o * 100) / 100;
$t_cuota=($interes_o+$int_dif)+$cuota_capital;
$t_cuota=round($t_cuota * 100) / 100;


///////////////////////////////////////
$t_interes_o=$t_interes_o+$interes_o;
$t_interes_o=round($t_interes_o * 100) / 100;
}
}
echo "<tr> ";
echo "<td <small style=width: 50px >-</td> ";
echo "<td <small style=width: 100px font-weight: bold><b>$t_interes_o</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>$t_int_dif</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>$t_cuota_capital</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>$tt_cuota</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>$tcapital</b></td>";
echo "</tr> ";
echo "</table> ";





?>

  <?php
//include("../pie.php"); 
 ?>
 