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
                 


$query2="SELECT rubros.id_rubro,rubros.descripcion_rubro,creditos.descripcion_credito
 FROM rubros 
inner join creditos  on creditos.id_creditos=rubros.id_credito
";
$result2=pg_query($con,$query2);


include('class.ezpdf.php');

$pdf =& new Cezpdf('LETTER');
$pdf->ezSetCmMargins(1,1,1,1);
$pdf->selectFont('fonts/courier.afm');
$datacreator = array (

                          'Title'=>'Sistema De Creditos',

                          'Author'=>'Leonardo Matos',

                          'Subject'=>'Coordinacion de Informatica-Barinas',
 
                          'Creator'=>'FONCREB',
 
                          'Producer'=>'FONCREB'

                          );

 $pdf->addInfo($datacreator);
while ($row2 = pg_fetch_array($result2)){ 

$data[] = array('Codigo'=>$row2[0],
                 'Descripcion del Rubro'=>$row2[1],
                 'Tipo de Credito'=>$row2[2],
                 
                 
                 );

}
 //$titles = array('num'=>'<b>Numero</b>', 'mes'=>'<b>Mes</b>');

//cargar una imagen al archivo pdf
$pdf->ezImage("../imagenes/bannertop22.png",50,50,"full","left");


$pdf->ezText("<b>                                    RUBROS                                 </b>",14);
$pdf->ezText("\n",10);
$pdf->ezTable($data,$cols,'',
        array('fontSize' => 7,'xPos'=>90,'xOrientation'=>'right','width'=>450
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

