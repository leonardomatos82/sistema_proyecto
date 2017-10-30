<?
include("../config.php");
include("../utils.php");
$valor=$_POST[pfg];
$query1="SELECT * FROM periodo_lectivo where estado='ACTIVO'";
$result1=pg_query($con,$query1);
$row1 = pg_fetch_array($result1);

$data2[] = array('Coord. Integracion Socioeducativa:'=>'Coord. Integracion Socioeducativa',
                 ''=>'',
                 ''=>'',
                 'SELLO'=>'SELLO',
                 
                 );

                 


$query2="SELECT * FROM pasantia where pfg='$valor' and periodo='$_POST[periodo]'
order by municipio, nombre, turno";
$result2=pg_query($con,$query2);


include('class.ezpdf.php');

$pdf =& new Cezpdf('LETTER','landscape');
$pdf->selectFont('fonts/courier.afm');
$datacreator = array (

                          'Title'=>'Sistema Proyecto y Pasantias',

                          'Author'=>'Universidad Bolivariana de Venezuela',

                          'Subject'=>'Coordinacion de Informatica-Barinas',
 
                          'Creator'=>'UBV',
 
                          'Producer'=>'UBV'

                          );

 $pdf->addInfo($datacreator);
while ($row2 = pg_fetch_array($result2)){ 
  
$c++;
$row2[nombre]=strtoupper($row2[nombre]);

$data[] = array('N'=>$c,
               // 'Reg'=>$row2[id_pasantia],
                 'Estudiante          '=>$row2[nombre],
		'Cedula'=>$row2[cedula],
		 'Telefono'=>$row2[telefono_casa],
                 'Municipio'=>$row2[municipio],
                 'Aldea'=>$row2[aldea],
                 'Turno'=>$row2[turno],
		'Institucion'=>$row2[institucion]
			
                 
                 );

}
 //$titles = array('num'=>'<b>Numero</b>', 'mes'=>'<b>Mes</b>');

//cargar una imagen al archivo pdf
$pdf->ezImage("logo.jpg",20,1, "full","left");


$pdf->ezText("<b>                                    RELACION DE PASANTES INSCRITOS                                 </b>" ,14);
$pdf->ezText("<b>                                          Periodo Academico:   </b>".$_POST[periodo],10);

$pdf->ezText("<b>                    PFG:  </b>".$valor,10);
$pdf->ezText("
",8);
$pdf->ezTable($data,$cols,'',
        array('xPos'=>90,'xOrientation'=>'right','width'=>680,'fontSize' => 7
             ,'cols'=>array(
                  'num'=>array('justification'=>'right')
                 ,'name'=>array('width'=>100))
             ));


$pdf->ezText("


",10);
//$pdf->ezText("<b>Fecha:</b> ".date("d/m/Y"),10);
//$pdf->ezText("<b>Hora:</b> ".date("H:i:s")."

",10);

$pdf->ezTable($data2,$cols,'',
        array('showHeadings'=>0,'shaded'=>0,'showLines'=>0,'xPos'=>90,'xOrientation'=>'right','width'=>460
             ,'cols'=>array(
                  'num'=>array('justification'=>'right')
                 ,'name'=>array('width'=>100))
             ));


$pdf->ezStream();

?>