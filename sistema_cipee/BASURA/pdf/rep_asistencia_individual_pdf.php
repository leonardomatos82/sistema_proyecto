<?
include("../config.php");
include("../utils.php");

if ($_POST['cedula']==''){
$_POST['cedula']=$_POST['codigo'];
}

$tipo=$_GET['tipo'];

$desde2= $_POST['desde_year']."-".$_POST['desde_mes']."-".$_POST['desde_dia'];
$hasta2= $_POST['hasta_year']."-".$_POST['hasta_mes']."-".$_POST['hasta_dia'];
 $desde= $_POST['desde_dia']."-".$_POST['desde_mes']."-".$_POST['desde_year'];
$hasta= $_POST['hasta_dia']."-".$_POST['hasta_mes']."-".$_POST['hasta_year'];
$fech=$desde2;
 $dias = array(DOMINGO,LUNES,MARTES,MIERCOLES,JUEVES,VIERNES,SABADO);
$fechae = $dias[date(N, strtotime($fech))]; 
//$desde= $_GET['desde_year']."-".$_GET['desde_mes']."-".$_GET['desde_dia'];
//$hasta= $_GET['hasta_year']."-".$_GET['hasta_mes']."-".$_GET['hasta_dia'];




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
         
 $query1="SELECT * FROM asistencia where 
cedula='$_POST[cedula]' AND
(fecha >=  '$desde2' AND fecha <=  '$hasta2') 

ORDER BY id_asistencia ASC";
$result1=pg_query($con,$query1);       
$row1 = pg_fetch_array($result1);
if ($row1[0]==''){
echo "No hay Registro de Asistencia en esta fecha";
die();
}


$query2="SELECT * FROM asistencia 
inner join trabajador
on asistencia.cedula=trabajador.cedula
where asistencia.cedula='$_POST[cedula]' and
(asistencia.fecha >=  '$desde2' AND asistencia.fecha <=  '$hasta2') 
ORDER BY asistencia.fecha ASC";


$result2=pg_query($con,$query2);






include('class.ezpdf.php');

$pdf =& new Cezpdf('LETTER','');
$pdf->selectFont('fonts/courier.afm');
$pdf->ezSetCmMargins(1,1,1.5,1.5);
$datacreator = array (

                          'Title'=>'Sistema CONTROL DE ASISTENCIAS',

                          'Author'=>'Universidad Bolivariana de Venezuela',

                          'Subject'=>'Coordinacion de Informatica-Barinas',
 
                          'Creator'=>'UBV',
 
                          'Producer'=>'UBV'

                          );

$pdf->addInfo($datacreator);
while ($row2 = pg_fetch_array($result2)){  
$c++; 
$row2[nombre]= utf8_decode($row2[nombre]);
$row2[cargo]= utf8_decode($row2[cargo]);
$nombre=$row2[nombre];
$cedula=$row2[cedula];
$cargo=$row2[cargo];
$departamento=$row2[departamento];
$row2[fecha]=cambiaf_a_normal($row2[fecha]);
$data[] = array('N'=>$c,
                 'FECHA'=>$row2[fecha],
                 'ENTRA '=>$row2[entra1],
 		 'SALE '=>$row2[sale1],
                 'ENTRA'=>$row2[entra2],
                 'SALE'=>$row2[sale2]
                 );

}
 //$titles = array('num'=>'<b>Numero</b>', 'mes'=>'<b>Mes</b>');

//cargar una imagen al archivo pdf
$pdf->ezImage("../imagenes/logoubv.jpg",30,180,"","left");



$pdf->ezText("<b>                                    ASISTENCIA DIARIA DEL TRABAJADOR </b><b> UBV BARINAS</b>",10);
$pdf->ezText("<b>                                                         DESDE: </b>$desde<b>      HASTA: </b>$hasta",7);  
$pdf->ezText("\n",4);
$pdf->ezText("<b>                               TRABAJADOR: </b>$nombre",7);  
$pdf->ezText("<b>                                         CEDULA: </b>$cedula",7);      
$pdf->ezText("<b>                                          CARGO: </b>$cargo",7);    
$pdf->ezText("<b>                          DEPARTAMENTO: </b>$departamento",7);                                                                  
$ti= "                                 MANANA                                                                    TARDE ";


$pdf->ezText($ti,6,array('justification'=>'center'));

//$pdf->ezText("\n",10);

                                                               
$pdf->ezTable($data,$cols,'',
        array('shaded'=>0,'showLines'=>2,'fontSize' => 6,'xPos'=>120,'xOrientation'=>'right','width'=>400
             ,'cols'=>array(
                  'ENTRA '=>array('justification'=>'right'),
'SALE '=>array('justification'=>'right'),
'ENTRA'=>array('justification'=>'right'),
'SALE'=>array('justification'=>'right')
                 ,'name'=>array('width'=>100))
             ));


$pdf->ezText("\n",10);
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

