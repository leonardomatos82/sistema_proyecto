<?php
session_start();
$cedula_alumno=$Sesion[cedula_alumno];
//$result=pg_exec($conn,"select nombres,apellidos from alumno where id_alumno='$cedula_alumno'");
//$arr=pg_fetch_array($result);
//$nombres=$arr[0];
//$apellidos=$arr[1];

echo "<html><head><title>Sistema Unico de Registro Acádemico - UBV</title>
<meta http-equiv='expires' content='-1'>
<link href=includes/default.css  type= text/css  rel=stylesheet>
<link rel='shortcut icon' href='images/favicon.ico'>
<script type=text/javascript src=includes/datepickercontrol.js></script>
<link type=text/css rel=stylesheet href=includes/datepickercontrol_darkred.css></head>
<body leftmargin=0  topmargin=0  marginwidth=0  marginheight=0 bgcolor=#9a9a9a  onload='this.document.form_login.login.focus();'>
<table align=center style='border:1px solid #9a9a9a'  bgcolor=#ffffff cellpadding=0 cellspacing=0  width=770 height=100%>
<tr><td height=60><img src=images/banner_alumno.jpg></td></tr>
<tr><td height=15>";
include('barra_sesion_alumno.php');
include('menu_coord.php');
echo"</td></tr>
<tr><td valign=top>";