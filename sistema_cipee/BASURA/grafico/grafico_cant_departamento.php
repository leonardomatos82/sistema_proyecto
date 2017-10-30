<?php
include("../config.php");
$query1="select count(solicitud.id_solicitud) from solicitud
inner join trabajador on
trabajador.cedula=solicitud.cedula";
$result1=pg_query($con,$query1);
$row1 = pg_fetch_row($result1);


 $query2="select count(solicitud.id_solicitud) from solicitud
inner join trabajador on
trabajador.cedula=solicitud.cedula
where trabajador.departamento='$_GET[dpto]'";

$result2=pg_query($con,$query2);
$row2= pg_fetch_row($result2);
include ("jpgraph.php");
include ("jpgraph_pie.php");
include ("jpgraph_pie3d.php");


$total_acum_ing= $row1[0];
$total_acum_cheq= $row2[0];



 $total_registro_estudiante_estado=$total_acum_ing;
$total_inscritos_estudiantes_estado=$total_acum_cheq;

$faltan_por_inscribir=$total_registro_estudiante_estado-$total_inscritos_estudiantes_estado;

// Some data
$data = array($faltan_por_inscribir,$total_inscritos_estudiantes_estado);
//--------

// Create the Pie Graph.
$graph = new PieGraph(500,350,"auto");
//$graph->SetShadow();

// Set A title for the plot
$graph->title->Set("GRAFICO COMPARATIVO DE LA COORDINACION");
//$graph->title->SetFont(FF_VERDANA,FS_BOLD,10); 
$graph->title->SetColor("darkblue");
$graph->legend->Pos(0.03,0.15);

// Create 3D pie plot
$p1 = new PiePlot3d($data);

$p1->SetTheme("sand");
$p1->SetCenter(0.45);
$p1->SetSize(90);
$p1->ExplodeSlice(1); 

// Adjust projection angle
$p1->SetAngle(45);

// Adjsut angle for first slice
$p1->SetStartAngle(45);

//$p1->SetFormt('$01.2f');
// Display the slice values
//$p1->value->SetFont(FF_ARIAL,FS_BOLD,9);
$p1->value->SetColor("navy");

// Add colored edges to the 3D pie
// NOTE: You can't have exploded slices with edges!
$p1->SetEdge("navy");

//$p1->SetLegends(array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct"));
$p1->SetLegends(array($_GET[dpto],"DEMAS COORDINACIONES"));

$graph->Add($p1);
$graph->Stroke();

?>


