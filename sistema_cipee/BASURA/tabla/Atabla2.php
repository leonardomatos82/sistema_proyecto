<?
$capital=$_POST[pv];
$int_banc=$_POST[r];
$cuotas=$_POST[period];
$gracia=$_POST[gracia];
$tipo_pago=$_POST[tipo_pago];
$cuota_fija=$_POST[pmt];
?>
<script type="text/javascript" language="JavaScript" src="./js/annuityCalc.js"></script>
<form action="" method="POST" name="5">
<table border="0" cellspacing="3">

  <tbody>
	
	<tr><td colspan="2"><hr class="pop"></td></tr>
	<tr>
	  <td align="right" valign="top">Tipo de pago</td>
	  <td valign="top">

	  <input type="radio" id="p0" name="ptype"  onclick="annuityCalc()" /><label for="p0">Inicio del período (anualidad anticipada)</label><br/>
	  <input type="radio" id="p1" name="ptype" checked onclick="annuityCalc()" /><label for="p1">Final del período (anualidad ordinaria)</label>
	  </td>
	</tr>
	<tr><td colspan="2"><hr class="pop"></td></tr>
	<tr>
	  <td width="50%" align="right" valign="top">Capital</td>

	  <td width="50%" valign="top"><input class="vis input W120" type="text" id="pv" name="pv" value="<? echo $_POST[pv];?>" maxlength="10" onkeyup="annuityCalc()" /></td>
	</tr>
	<tr>
	  <td align="right" valign="top">Interés anual<br></td>
	  <td valign="top"><input class="vis input W60" type="text" id="r" name="r" value="7.58" maxlength="5" onkeyup="annuityCalc()" /> %</td>
	</tr>
	<tr>
	  <td align="right" valign="top">Numero de Cuotas<br></td>
	  <td valign="top"><input class="vis input W60" type="text" id="period" name="period" value="<? echo $_POST[period]; ?>" maxlength="5" onkeyup="annuityCalc()" /></td>
	</tr>
	<tr>

	  <td align="right" valign="top">Cuotas de Gracia<br></td>
	  <td valign="top">
		<table cellpadding="0" cellspacing="0" marginheight="0" marginwidth="0">
			<tr>
			  <td align="right" valign="top"><input class="vis input W60" type="text" id="gracia" name="gracia" value="<? echo $_POST[gracia]; ?>" maxlength="3" onkeyup="annuityCalc()" /></td>
	</tr>
	<tr>			 
			  <td valign="top"><input type="radio" id="t1" name="PERtype"   onclick="annuityCalc()" /><label for="t1">Año(s)</label><br/>
                         <input type="radio" id="t4" name="PERtype"  onclick="annuityCalc()" /><label for="t4">Semestre</label><br/>							  
							   <input type="radio" id="t2" name="PERtype"  onclick="annuityCalc()" /><label for="t2">Trimestre</label><br/>

							   <input type="radio" id="t3" name="PERtype" checked onclick="annuityCalc()" /><label for="t3">Meses</label><br/>
            </tr>            			 
			  </td>
			</tr>
		</table>
	</tr>
	<td align="right">tipo pago</td><td vAlign="top"><input class="hidden input W120" id="tipo_pago" name="tipo_pago" readonly="readonly" value="<? echo $_POST[tipo_pago];?>" /></td>
   </tr><tr>   <td align="right">Anualidad</td><td vAlign="top"><input class="hidden input W120" id="pmt" name="pmt" readonly="readonly" value="<? echo $_POST[pmt];?>" /></td>
    </tr>
	<tr>
	   <td align="right"></td><td><input value="Generar tabla fija" type="submit" name="submit"></td>
    </tr>
  </tbody>

</table>
</form>
<?
echo "ANos: ".$tipo_pago;
echo "Cuotas: ".$cuotas;
echo "gracia: ".$gracia;
echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=100% bgcolor=#FFFFFF >";

 
echo "<tr>";
echo "<td <small style=width: 50px font-weight: bold><b>-</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>AMORT DE CAPITAL</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>INTERES </b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>CUOTA</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>INT DIFERIDOS</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>TOTAL CUOTA</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>SALDO DEUDOR</b></td>";

echo "</tr> ";


if ($tipo_pago==30){$interes_o=(($capital*$int_banc)/100)*30/360;}
if ($tipo_pago==90){$interes_o=(($capital*$int_banc)/100)*90/360;}
if ($tipo_pago==180){$interes_o=(($capital*$int_banc)/100)*180/360;}
if ($tipo_pago==360){$interes_o=(($capital*$int_banc)/100)*360/360;}

$dif_cuotas=$cuotas-$gracia;
$int_dif=$interes_o*$gracia/$dif_cuotas;
$cuota_capital=$cuota_fija+$int_dif;


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
echo "<td <small style=width: 100px >-</td> ";
echo "<td <small style=width: 50px >$capital</td> ";
echo "</tr> ";
}else{
$amort=$cuota_fija-$interes_o;
$capital=$capital-$amort;
If ($capital<1){$capital='0.00';}


echo "<tr> ";
echo "<td <small style=width: 50px >$i</td> ";
echo "<td <small style=width: 100px >$amort</td> ";
echo "<td <small style=width: 100px >$interes_o</td> ";
echo "<td <small style=width: 100px >$cuota_fija</td> ";
echo "<td <small style=width: 50px >$int_dif</td> ";
echo "<td <small style=width: 50px >$cuota_capital</td> ";

echo "<td <small style=width: 50px >$capital</td> ";
echo "</tr> ";


///////////////////////////////////////////
$t_amort=$t_amort+$amort;
$t_cuota_fija=$t_cuota_fija+$cuota_fija;
$t_cuota_capital=$t_cuota_capital+$cuota_capital;
$t_int_dif=$t_int_dif+$int_dif;

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
echo "<td <small style=width: 100px font-weight: bold><b>$t_amort</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>$t_interes_o</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>$t_cuota_fija</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>$t_int_dif</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>$t_cuota_capital</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>$tcapital</b></td>";
echo "</tr> ";
?>





