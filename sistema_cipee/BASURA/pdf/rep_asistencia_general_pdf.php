<?
include("../config.php");
include("../utils.php");


$tipo=$_GET['tipo'];

$desde2= $_GET['desde_dia']."-".$_GET['desde_mes']."-".$_GET['desde_year'];
$hasta2= $_GET['hasta_dia']."-".$_GET['hasta_mes']."-".$_GET['hasta_year'];
 
$fech=$desde2;
 $dias = array(DOMINGO,LUNES,MARTES,MIERCOLES,JUEVES,VIERNES,SABADO);
$fechae = $dias[date(N, strtotime($fech))]; 
$desde= $_GET['desde_year']."-".$_GET['desde_mes']."-".$_GET['desde_dia'];
$hasta= $_GET['hasta_year']."-".$_GET['hasta_mes']."-".$_GET['hasta_dia'];




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
(fecha =  '$desde') 
ORDER BY id_asistencia ASC";
$result1=pg_query($con,$query1);       
$row1 = pg_fetch_array($result1);
if ($row1[0]==''){
echo "No hay Registro de Asistencia en esta fecha";
die();
}
if ($tipo=='COMISION SERVICIOS PROCURADURIA'){
$query2="SELECT * FROM trabajador 
where tipo='$tipo' AND ESTADO='ACTIVO' AND SEDE='BARINAS'
ORDER BY cedula::int ASC";
}else{
if ($tipo=='COMISION SERVICIOS ZONA EDUCATIVA'){
$query2="SELECT * FROM trabajador 
where tipo='$tipo' AND ESTADO='ACTIVO' AND SEDE='BARINAS'
ORDER BY cedula::int ASC";
}else{
if ($tipo=='COMISION SERVICIOS SECRETARIA EJECUTIVA'){
$query2="SELECT * FROM trabajador 
where tipo='$tipo' AND ESTADO='ACTIVO' AND SEDE='BARINAS'
ORDER BY cedula::int ASC";
}else{
if ($tipo=='COMISION SERVICIOS GOBERNACION'){
$query2="SELECT * FROM trabajador 
where tipo='$tipo' AND ESTADO='ACTIVO' AND SEDE='BARINAS'
ORDER BY cedula::int ASC";
}else{
if ($tipo=='ADMINISTRATIVO'){
$query2="SELECT * FROM trabajador 
where tipo='$tipo' AND ESTADO='ACTIVO' AND SEDE='BARINAS'
ORDER BY cedula::int ASC";
}else{
if ($tipo=='OBREROS'){
$query2="SELECT * FROM trabajador 
where tipo='$tipo' AND (cargo!='VIGILANTE' and cargo!='SUPERVISOR DE VIGILANCIA' and cargo!='CHOFER' )
AND ESTADO='ACTIVO' AND SEDE='BARINAS'
ORDER BY cedula::int ASC";
}else{
if ($tipo=='SEGURIDAD'){
$query2="SELECT * FROM trabajador 
where cargo='VIGILANTE' or cargo='SUPERVISOR DE VIGILANCIA' 
AND ESTADO='ACTIVO' AND SEDE='BARINAS'
ORDER BY cedula::int ASC";
}else{
if ($tipo=='CHOFERES'){
$query2="SELECT * FROM trabajador 
where cargo='CHOFER'
AND ESTADO='ACTIVO' AND SEDE='BARINAS'
ORDER BY cedula::int ASC";
}else{
$query2="SELECT * FROM trabajador 
where (tipo!='ADMINISTRATIVO' AND tipo!='OBREROS') AND ESTADO='ACTIVO' AND SEDE='BARINAS'
ORDER BY cedula::int ASC";
}}}}}}}}

$result2=pg_query($con,$query2);

//$query3="SELECT * FROM asistencia where 
//(fecha=  '$desde') AND (fecha <= '$hasta') 
//ORDER BY id_asistencia ASC";
//$result3=pg_query($con,$query3);
//$row1 = pg_fetch_array($result1);


include('class.ezpdf.php');

$pdf =& new Cezpdf('LETTER','landscape');
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
$query3="SELECT * FROM asistencia where 
cedula='$row2[cedula]' AND
(fecha=  '$desde')
ORDER BY id_asistencia ASC";
$result3=pg_query($con,$query3);
$row3 = pg_fetch_array($result3);
  
$c++; 
$row2[nombre]= utf8_decode($row2[nombre]);
$row2[cargo]= utf8_decode($row2[cargo]);
$data[] = array('N'=>$c,
                 'APELLIDOS Y NOMBRES'=>$row2[nombre],
                 'CEDULA'=>$row2[cedula],
                 'CARGO'=>$row2[cargo],
                 'ENTRA '=>$row3[entra1],
 		 'SALE '=>$row3[sale1],
                 'ENTRA'=>$row3[entra2],
                 'SALE'=>$row3[sale2]
                 );

}
 //$titles = array('num'=>'<b>Numero</b>', 'mes'=>'<b>Mes</b>');

//cargar una imagen al archivo pdf
$pdf->ezImage("../imagenes/logoubv.jpg",30,180,"","left");



$pdf->ezText("<b>                                    ASISTENCIA DIARIA DEL PERSONAL </b>($tipo)<b> UBV BARINAS</b>",10);
$pdf->ezText("<b>                                                        DIA: </b>$fechae<b>                           FECHA: </b>$desde2<b>       </b>\n",7);                                                                
$ti= "MANANA                                    TARDE                                            ";


$pdf->ezText($ti,6,array('justification'=>'right'));

//$pdf->ezText("\n",10);

                                                               
$pdf->ezTable($data,$cols,'',
        array('shaded'=>0,'showLines'=>2,'fontSize' => 6,'xPos'=>90,'xOrientation'=>'right','width'=>660
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

