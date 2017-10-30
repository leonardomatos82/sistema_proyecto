<?php
include ("jpgraph.php");
include ("jpgraph_pie.php");
include ("jpgraph_pie3d.php");
//include("../config.php");

// Some data
$data = array(
$_GET['valor1'],
$_GET['valor2'],
$_GET['valor3']


);

//--------

// Create the Pie Graph.
$graph = new PieGraph(1200,900,"auto");
//$graph->SetShadow();

// Set A title for the plot
$graph->title->Set("EJECUCION PRESUPUESTARIA");
//$graph->title->SetFont(FF_VERDANA,FS_BOLD,10); 
$graph->title->SetColor("darkblue");
$graph->legend->Pos(0.03,0.15);


// Create 3D pie plot
$p1 = new PiePlot3d($data);

$p1->SetTheme("sand");
$p1->SetCenter(0.45);
$p1->SetSize(400);
$p1->ExplodeSlice(0); 

// Adjust projection angle
$p1->SetAngle(85);

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



$p1->SetLegends(array(
$_GET['titulo1'],
$_GET['titulo2'],
$_GET['titulo3'],
$_GET['titulo4']


));

$graph->Add($p1);
$graph->Stroke();

?>


