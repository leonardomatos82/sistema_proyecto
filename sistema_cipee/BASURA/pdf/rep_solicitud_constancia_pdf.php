<?
include("../config.php");
include("../utils.php");


$desde= $_GET['desde_dia']."-".$_GET['desde_mes']."-".$_GET['desde_year'];
$hasta= $_GET['hasta_dia']."-".$_GET['hasta_mes']."-".$_GET['hasta_year'];

$data2[] = array('Elaborado por:'=>'Elaborado por:',
                 'Revisado por:'=>'Revisado por:',
                'SELLO'=>'',
                 
                 );
$data2[] = array('Elaborado por:'=>$row1[2],
                 'Revisado por:'=>$row1[1],
                
                 'SELLO'=>'SELLO',
                 
                 );                 
$data2[] = array('Elaborado por:'=>$row1[13],
                 'Revisado por:'=>$row1[12],
                
                 'SELLO'=>'',
                 );
          $query1="SELECT * FROM solicitud where 
estado='PROCESADO' AND
(fecha_solicitud >=  '$desde') AND (fecha_solicitud <= '$hasta') 
ORDER BY ID_SOLICITUD ASC";
$result1=pg_query($con,$query1);       
$row1 = pg_fetch_array($result1);
if ($row1[0]==''){
echo "No hay Solicitudes dentro del rango";
die();
}

$query2="SELECT * FROM solicitud where 
estado='PROCESADO' AND
(fecha_solicitud >=  '$desde') AND (fecha_solicitud <= '$hasta') 
ORDER BY ID_SOLICITUD ASC";
$result2=pg_query($con,$query2);


include('class.ezpdf.php');

$pdf =& new Cezpdf('LETTER','landscape');
$pdf->selectFont('fonts/courier.afm');
$datacreator = array (

                          'Title'=>'Sistema CONSTANCIAS DE TRABAJO',

                          'Author'=>'Universidad Bolivariana de Venezuela',

                          'Subject'=>'Coordinacion de Informatica-Barinas',
 
                          'Creator'=>'UBV',
 
                          'Producer'=>'UBV'

                          );

 $pdf->addInfo($datacreator);
while ($row2 = pg_fetch_array($result2)){ 

  
     $c++; 
$data[] = array('Num'=>$c,
                 'Id'=>$row2[0],
                 'Codigo'=>$row2[1],
                 'Cedula'=>$row2[2],
                 'Trabajador'=>$row2[3],
                 'Fecha Solicitud'=>$row2[4],
                  'Fecha Procesada'=>$row2[5],
                 );

}
 //$titles = array('num'=>'<b>Numero</b>', 'mes'=>'<b>Mes</b>');

//cargar una imagen al archivo pdf
$pdf->ezImage("../imagenes/bannertopff.png",50,50,"full","left");


$pdf->ezText("<b>                                    RELACION DE CONSTANCIAS DE TRABAJO                                </b>",14);
$pdf->ezText("<b>                                                                    Desde: </b>$desde<b>      Hasta: </b>$hasta\n",8);                                                                


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

