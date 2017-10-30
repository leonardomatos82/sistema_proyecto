<?php
include ("jpgraph.php");
include ("jpgraph_pie.php");
include ("jpgraph_pie3d.php");
include("../config.php");
$total_anual= $_GET['anual'];
$total_acum_ing= $_GET['ingreso'];
$total_acum_cheq= $_GET['pagado'];

$total_registro_estudiante_estado=$total_acum_ing;
$total_inscritos_estudiantes_estado=$total_acum_cheq;

$faltan_por_inscribir=$total_registro_estudiante_estado-$total_inscritos_estudiantes_estado;

// Some data
$data = array($total_inscritos_estudiantes_estado,$faltan_por_inscribir);
//--------

// Create the Pie Graph.
$graph = new PieGraph(500,350,"auto");
//$graph->SetShadow();

// Set A title for the plot
$graph->title->Set("RELACION DE CHEQUES");
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
$p1->SetLegends(array("Anulados","Pagados"));

$graph->Add($p1);
$graph->Stroke();

?>


