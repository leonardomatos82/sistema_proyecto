<? 
// CRIADO POR ANGELO DA SILVA
// http://www.angelo.com.br

	if (isset($ano)=="") $ano= date("Y");
	if (isset($mes)=="") $mes= date("m");
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>Calendário  - by Angelo S.</title>
	<script language='javascript'>
function mOvr(src,clrOver) 
{
	if (!src.contains(event.fromElement)) {
		src.style.cursor = 'hand';
		src.bgColor = clrOver; 				
		}
} 
function mOut(src,clrIn) 
{
	if (!src.contains(event.toElement)) {
		src.style.cursor = 'default';
		src.bgColor = clrIn; 
		
		}
}
function mclick(src)
{
 if(event.srcElement.tagName=='TD')
 {
  src.children.tags('a')[0].click();
 }
}
function get_data(dia, mes, ano)
{
	opener.<?=$campo?>.value = "" + dia + "/" + mes + "/" + ano + "";
	self.close();
}
</script>
<style type="text/css">
	A:link, A:hover {
		font-family : Arial, Helvetica, sans-serif;
		font-size : 15px;
		font-style : normal;
		text-decoration : none;
	}

	A {
		font-family : Arial, Helvetica, sans-serif;
		font-size : 15px;
		font-style : normal;
		text-decoration : none;
	}TD {
		font-family : Arial, Helvetica, sans-serif;
		font-size : 15px;
		font-style : normal;
	}

</style>
</head>
<body leftmargin=0 topmargin=0>
<?
//exit();
$col=1;

	$linha=0;
	
	$domingos = array("", "", "", "", "", "");
	$segundas = array("", "", "", "", "", "");
	$tercas = array("", "", "", "", "", "");
	$quartas = array("", "", "", "", "", "");
	$quintas = array("", "", "", "", "", "");
	$sextas = array("", "", "", "", "", "");
	$sabados = array("", "", "", "", "", "");
	
	for ($dias=1;$dias<=31;$dias++)
	{
		if ( checkdate($mes, $dias, $ano) )
		{
			$data = mktime(0, 0, 0, $mes, $dias, $ano);
			$today = getdate($data); 
			$dia_semana = $today["wday"];
			switch ($dia_semana)
			{
				case 0:
					$domingos[$linha]=$today["mday"];
					break;
				case 1:
					 $segundas[$linha]=$today["mday"];break;
			    case 2:
					 $tercas[$linha]=$today["mday"];break;
				case 3:
					 $quartas[$linha]=$today["mday"];break;
				case 4:
					 $quintas[$linha]=$today["mday"];break;
				case 5:
					 $sextas[$linha]=$today["mday"];break;
				case 6:
					 $sabados[$linha]=$today["mday"];$linha++;break;
			}
			
		}
		else
		{	
			break;
		}
	}

	$data = mktime(0, 0, 0, $mes, 01, $ano);
	$today = getdate($data); 
	$mes_texto= nome_mes($today["month"]);
	
	$proximo_mes = $mes +1;
	$proximo_ano=$ano;

	$anterior_mes=$mes-1;
	$anterior_ano=$ano;
	
	if ($proximo_mes==13){$proximo_mes=1;$proximo_ano=$ano+1;}
	
	if ($anterior_mes==0){$anterior_mes=12;$anterior_ano=$ano-1;}
?>	
	<table width="300" border="0" cellspacing="0" cellpadding="0" align="center" bordercolor="#C0C0C0">
	<tr>
		<td align="center"><a href="?ano=<?=$anterior_ano?>&mes=<?=$anterior_mes?>&campo=<?=$campo?>"><b>&laquo;</b></a></td>
		<td colspan=5 align="center"><b><?=$mes_texto?>/<?=$ano?></b></td>
		<td align="center"><a href="?ano=<?=$proximo_ano?>&mes=<?=$proximo_mes?>&campo=<?=$campo?>"><b>&raquo;</b></a></td>
	</tr>
	<tr bgcolor="#008080">
		<td align="center" width="43">Dom</td>
		<td align="center" width="43">Seg</td>
		<td align="center" width="43">Ter</td>
		<td align="center" width="43">Qua</td>
		<td align="center" width="43">Qui</td>
		<td align="center" width="43">Sex</td>
		<td align="center" width="43">Sab</td>
	</tr>
	<?for ($lin=0;$lin<=$linha;$lin++){ ?>
	<tr>
		<td align="center" <?if (trim($domingos[$lin])!=""){ ?>bgcolor="#C0C0C0" onMouseOver="mOvr(this,'#919FB0')" onMouseOut="mOut(this,'#C0C0C0')"  onclick="mclick(this);get_data('<?=$domingos[$lin]?>','<?=$mes?>','<?=$ano?>')"<?}?>><a href="#"><?=$domingos[$lin]?></a></td>
		<td align="center" <?if (trim($segundas[$lin])!="") { ?>bgcolor="#ffffff" onMouseOver="mOvr(this,'#919FB0')" onMouseOut="mOut(this,'#ffffff')"  onclick="mclick(this);get_data('<?=$segundas[$lin]?>','<?=$mes?>','<?=$ano?>')"<?}?>><a href="#"><?=$segundas[$lin]?></a></td>
		<td align="center" <?if (trim($tercas[$lin])!="") { ?>bgcolor="#ffffff" onMouseOver="mOvr(this,'#919FB0')" onMouseOut="mOut(this,'#ffffff')"  onclick="mclick(this);get_data('<?=$tercas[$lin]?>','<?=$mes?>','<?=$ano?>')"<?}?>><a href="#"><?=$tercas[$lin]?></a></td>
		<td align="center" <?if (trim($quartas[$lin])!="") { ?>bgcolor="#ffffff" onMouseOver="mOvr(this,'#919FB0')" onMouseOut="mOut(this,'#ffffff')"  onclick="mclick(this);get_data('<?=$quartas[$lin]?>','<?=$mes?>','<?=$ano?>')"<?}?>><a href="#"><?=$quartas[$lin]?></a></td>
		<td align="center" <?if (trim($quintas[$lin])!="") { ?>bgcolor="#ffffff" onMouseOver="mOvr(this,'#919FB0')" onMouseOut="mOut(this,'#ffffff')"  onclick="mclick(this);get_data('<?=$quintas[$lin]?>','<?=$mes?>','<?=$ano?>')"<?}?>><a href="#"><?=$quintas[$lin]?></a></td>
		<td align="center" <?if (trim($sextas[$lin])!="") { ?>bgcolor="#ffffff" onMouseOver="mOvr(this,'#919FB0')" onMouseOut="mOut(this,'#ffffff')"  onclick="mclick(this);get_data('<?=$sextas[$lin]?>','<?=$mes?>','<?=$ano?>')"<?}?>><a href="#"><?=$sextas[$lin]?></a></td>
		<td align="center" <?if (trim($sabados[$lin])!="") { ?>bgcolor="#ffffff" onMouseOver="mOvr(this,'#919FB0')" onMouseOut="mOut(this,'#ffffff')"  onclick="mclick(this);get_data('<?=$sabados[$lin]?>','<?=$mes?>','<?=$ano?>')"<?}?>><a href="#"><?=$sabados[$lin]?></a></td>
	</tr>
	<?}?>
	<tr>
		<td colspan=7 align="center"><a href="#" onclick="get_data('<?=date("d")?>','<?=date("m")?>','<?=date("Y")?>')">hoje</a></td>
	</tr>
	</table>

</body>
</html>
<?
function nome_mes($nome)
{ 
		switch ($nome)
		{	
		case "January": return "Janeiro";Break;
		case "February": return "Fevereiro";Break; 
		case "March": return "Março";Break;  
		case "April": return "Abril";Break;
		case "May": return "Maio";Break;
		case "June": return "Junho";Break;
		case "July": return "Julho";Break;
		case "August": return "Agosto";Break;
		case "September": return "Setembro";Break;
		case "October": return "Outubro";Break;
		case "November": return "Novembro";Break;
		case "December": return "Dezembro";Break;
		}
}?>
<!--
// CRIADO POR ANGELO DA SILVA
// http://www.angelo.com.br
-->
