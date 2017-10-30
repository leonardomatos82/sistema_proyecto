<?php
session_register('Sesion');
// Antispam example using a random string
require_once "jpgraph_antispam.php";

// Create new anti-spam challenge creator
// Note: Neither '0' (digit) or 'O' (letter) can be used to avoid confusion
$spam = new AntiSpam();

// Create a random 5 char challenge and return the string generated
$codigo = $spam->Rand(6);

$Sesion['codigo']=$codigo;

$spam->Stroke();
// Stroke random cahllenge
if( $spam->Stroke() === false ) {
    die('Illegal or no data to plot');
}

?>