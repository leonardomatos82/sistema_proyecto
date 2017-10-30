<?
include("../config.php");
include("../utils.php");
$query1="SELECT * FROM configuracion where id_configuracion=1";
$result1=pg_query($con,$query1);
$row1 = pg_fetch_array($result1);

$data2[] = array('Elaborado por:'=>'Elaborado por:',
                 'Revisado por:'=>'Revisado por:',
                 'Autorizado por:'=>'Autorizado por:',
                 'SELLO'=>'',
                 
                 );
$data2[] = array('Elaborado por:'=>$row1[2],
                 'Revisado por:'=>$row1[1],
                 'Autorizado por:'=>$row1[0],
                 'SELLO'=>'SELLO',
                 
                 );                 
$data2[] = array('Elaborado por:'=>$row1[13],
                 'Revisado por:'=>$row1[12],
                 'Autorizado por:'=>$row1[11],
                 'SELLO'=>'',
                 );
                 


$query2="SELECT * FROM cheque where estado='ANULADO'";
$result2=pg_query($con,$query2);


include('class.ezpdf.php');

$pdf =& new Cezpdf('LETTER','landscape');
$pdf->selectFont('fonts/courier.afm');
$datacreator = array (

                          'Title'=>'Sistema SICAF',

                          'Author'=>'Universidad Bolivariana de Venezuela',

                          'Subject'=>'Coordinacion de Informatica-Barinas',
 
                          'Creator'=>'UBV',
 
                          'Producer'=>'UBV'

                          );

 $pdf->addInfo($datacreator);
while ($row2 = pg_fetch_array($result2)){ 
$row22="";
$query22="select p_terciaria.descripcion from distribucion_cheque
 INNER JOIN p_terciaria ON distribucion_cheque.cod_partida= p_terciaria.id_p_terciaria
where distribucion_cheque.ncheque='$row2[1]'";
$result22=pg_query($con,$query22);
while ($resulta222 = pg_fetch_row($result22)){
$row22=$row22."--".$resulta222[0];
}   
      
$data[] = array('Cheque num'=>$row2[1],
                 'Fecha Emision'=>$row2[0],
                 'Monto Bsf'=>$row2[2],
                 'Beneficiario'=>$row2[3],
                 'Cedula-Rif'=>$row2[11],
                 'Concepto'=>$row22
                 );

}
 //$titles = array('num'=>'<b>Numero</b>', 'mes'=>'<b>Mes</b>');

//cargar una imagen al archivo pdf
$pdf->ezImage("../imagenes/bannertop22.png",50,50,"full","left");


$pdf->ezText("<b>                                    RELACION DE CHEQUES ANULADOS                                </b>",14);
$pdf->ezText("<b>                                                                                        Desde:        Hasta:                                          </b>\n",8);

$pdf->ezText("Banco:Industrial de Venezuela",12);
$pdf->ezText("Cuenta:".$row1[3],12);
$pdf->ezText("\n",10);
$pdf->ezTable($data,$cols,'',
        array('xPos'=>90,'xOrientation'=>'right','width'=>660
             ,'cols'=>array(
                  'num'=>array('justification'=>'right')
                 ,'name'=>array('width'=>100))
             ));


$pdf->ezText("\n\n\n",10);
//$pdf->ezText("<b>Fecha:</b> ".date("d/m/Y"),10);
//$pdf->ezText("<b>Hora:</b> ".date("H:i:s")."\n\n",10);

$pdf->ezTable($data2,$cols,'',
        array('showHeadings'=>0,'shaded'=>0,'showLines'=>0,'xPos'=>90,'xOrientation'=>'right','width'=>460
             ,'cols'=>array(
                  'num'=>array('justification'=>'right')
                 ,'name'=>array('width'=>100))
             ));


$pdf->ezStream();

?>

