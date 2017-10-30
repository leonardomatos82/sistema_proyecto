<?
if (date("m")=="01") $mes="ENERO";
if (date("m")=="02") $mes="FEBRERO";
if (date("m")=="03") $mes="MARZO";
if (date("m")=="04") $mes="ABRIL";
if (date("m")=="05") $mes="MAYO";
if (date("m")=="06") $mes="JUNIO";
if (date("m")=="07") $mes="JULIO";
if (date("m")=="08") $mes="AGOSTO";
if (date("m")=="09") $mes="SEPTIEMBRE";
if (date("m")=="10") $mes="OCTUBRE";
if (date("m")=="11") $mes="NOVIEMBRE";
if (date("m")=="12") $mes="DICIEMBRE";
include("../config.php");
include("../utils.php");

$query1="SELECT * FROM configuracion where id_configuracion=1";
$result1=pg_query($con,$query1);
$row1 = pg_fetch_array($result1);




$query2="SELECT * FROM cheque where ncheque='$_GET[id]'";
$result2=pg_query($con,$query2);


include('class.ezpdf.php');
$pdf =& new Cezpdf('LETTER');
$pdf->ezSetCmMargins(0,0,2,0);
$pdf->selectFont('fonts/courier.afm');
$datacreator = array (

                          'Title'=>'Sistema SICAF',

                          'Author'=>'Universidad Bolivariana de Venezuela',

                          'Subject'=>'Coordinacion de Informatica-Barinas',
 
                          'Creator'=>'UBV',
 
                          'Producer'=>'UBV'

                          );

$pdf->addInfo($datacreator);
$row2 = pg_fetch_array($result2);
include("numero2.php"); 
$pdf->ezText("                                                                                                   **".$row2['monto_cheque']."**",11);
$pdf->ezText("",10);
$pdf->ezText("                                                                           NO ENDOSABLE",10);
$pdf->ezText("",10);
$pdf->ezText(" ********".$row2[3],12);
//$pdf->ezText("",10);
$pdf->ezText(" ***".($x).$muestra,10);
$pdf->ezText(" ********************",16);
//$pdf->ezText("      ",10);
$pdf->ezText("BARINAS, ".date("d")." de ".$mes."               ".date("Y"),12);
$pdf->ezText("\n\n",10);
$pdf->ezText("                                                                                                       CADUCA A LOS 30 DIAS",10);




$pdf->ezStream();

?>

