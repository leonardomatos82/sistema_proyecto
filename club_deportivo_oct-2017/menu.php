<!-- css que genstiona el hoover -->
<link href="css/default.css" media="screen" rel="stylesheet" type="text/css">
<!-- css que genstiona el menu horizontal con la clase dropdown-horizontal -->
<link href="css/dropdown.css" media="all" rel="stylesheet" type="text/css" />

<link href="css/tema.css" media="all" rel="stylesheet" type="text/css" />
<!-- Beginning of compulsory code below -->



<ul id="nav" class="dropdown dropdown-horizontal" ><table border=0  width="128%">
	<tr><td width="20%"></td><td>
 <?php
 
$menu[] = array('Pagos' => array('Rojo', 'Verde', 'Azul') );
$menu[] = array('Ingreso' => array('Perro', 'Gato', 'Conejo') );
$menu[] = array('Actividades' => array('Perro', 'Gato', 'Conejo') );
$menu[] = array('Registro' => array('Perro', 'Gato', 'Conejo') );
$menu[] = array('Clientes' => array('Perro', 'Gato', 'Conejo') );
$menu[] = array('Busqueda' => array('Perro', 'Gato', 'Conejo') );
$menu[] = array('Carnet' => array('Perro', 'Gato', 'Conejo') );
$menu[] = array('Reportes' => array('Perro', 'Gato', 'Conejo') );
 
foreach ($menu as $menu_key => $menu_item){
	foreach($menu_item as $menu_name => $sub_menu){
		echo "<li><a href='cliente/Acliente.php' target='centro' class='dir'>".$menu_name."</a>";
		if (isset($sub_menu)){
			echo "<ul>";
			foreach($sub_menu as $items){
				echo "<li><a href='#' class='dir2'>".$items."</a>";
			}
			echo "</ul>";
		}
		echo "</li>";
	}
}
 
?>
</td></tr>
</table>
</ul>

