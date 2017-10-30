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

                 


$query2="select * from teg
 where pfg='$valor' and periodo='$_POST[periodo]'
order by municipio,aldea,seccion, turno";
$result2=pg_query($con,$query2);


include('class.ezpdf.php');

$pdf =& new Cezpdf('A4','landscape');
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

$query3="select * from estudiante_teg
 where id_teg='$row2[id_teg]'
order by id_estudiante_teg";

$result3=pg_query($con,$query3);
$row3 = pg_fetch_array($result3);
$c++;
$row3[nombre]=strtoupper($row3[nombre]);

if($row2[tramo]=='IX'){
if($row2[pfg]=='ESTUDIOS JURIDICOS'){
   $trayecto="ABOGADO";
}else{
   $trayecto="LICENCIATURA";
}
}else{
$trayecto="TSU";
if($row2[tramo]=='X' && $row2[pfg]=='ESTUDIOS JURIDICOS'){
   $trayecto="ABOGADO";
}else{
if($row2[pfg]=='ESTUDIOS JURIDICOS'){ $trayecto=$row2[tramo];}

}

}



$data[] = array('N'=>$c,
                'Reg'=>$row2[id_teg],
                 'Estudiante'=>$row3[nombre],
		'Cedula'=>$row3[cedula],
		 'Telefono'=>$row3[telefono_estudiante],
                 'Municipio'=>$row2[municipio],
                 'Aldea'=>$row2[aldea],
                 'Turno'=>$row2[turno],
//'Trayectos'=>$row2[trayecto],
                 'Trayecto'=>$trayecto,
	'TEG'=>$row2[teg],	
'Comunidad'=>$row2[comunidad],
'Instituciones Involucradas'=>$row2[instituciones],

			
                 
                 );


}
 //$titles = array('num'=>'<b>Numero</b>', 'mes'=>'<b>Mes</b>');

//cargar una imagen al archivo pdf
$pdf->ezImage("logo.jpg",20,1, "full","left");


$pdf->ezText("<b>                                    RELACION DE TEG INSCRITOS                                 </b>" ,14);
$pdf->ezText("<b>                                          Periodo Academico:   </b>".$_POST[periodo],10);

$pdf->ezText("<b>                    PFG:  </b>".$valor,10);
$pdf->ezText("\n",8);

$cols = array('N'=>"N"
,'Reg'=>'Reg','Estudiante'=>'Estudiante'
,'Cedula'=>'Cedula'
,'Telefono'=>'Telefono'
,'Municipio'=>'Municipio'
,'Aldea'=>'Aldea'
,'Turno'=>'Turno'
,'Trayecto'=>'Trayecto'
//,'Trayectos'=>'Trayectos'
,'TEG'=>'TEG'
,'Comunidad'=>'Comunidad'
,'Instituciones Involucradas'=>'Instituciones Involucradas'

);


$pdf->ezTable($data,$cols,'',
        array('xPos'=>45,'xOrientation'=>'right','width'=>750,'fontSize' => 6
             ,'cols'=>array(
                  'num'=>array('justification'=>'right')
                 ,'TEG'=>array('width'=>200) ,'Estudiante'=>array('width'=>100))
             ));


$pdf->ezText("\n\n\n",10);
//$pdf->ezText("<b>Fecha:</b> ".date("d/m/Y"),10);
//$pdf->ezText("<b>Hora:</b> ".date("H:i:s")."\n\n",10);

$pdf->ezTable($data2,$cols,'',
        array('showHeadings'=>0,'shaded'=>0,'showLines'=>0,'xPos'=>90,'xOrientation'=>'right','width'=>460
             ,'cols'=>array(
                 'teg'=>array('width'=>100)

),
             ));


$pdf->ezStream();

?>

