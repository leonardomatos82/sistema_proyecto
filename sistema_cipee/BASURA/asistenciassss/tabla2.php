<?
include("variables.php");

$imagen_banner1="../imagenes/banin.png";
$imagen_banner2="../imagenes/headerimg.jpg";
$imagen_barra="../imagenes/mural1.png";
?>
 <title><?echo $title; ?></title>
<table width="<?echo $with; ?>" border="<?echo $border; ?>" align="<?echo $alight; ?>" bgcolor="<?echo $bgcolor; ?>">
  <tr> 
  
    <td colspan="<?echo $colspan; ?>"><div align="<?echo $aligth; ?>"> 
      <p><img src="<?echo $imagen_banner2; ?>"  width="<?echo $with; ?>" height="<?echo $height_banner2; ?>"></p>

    
            </div></td>
  </tr>
  <tr> 
  </tr>
  <tr> 
  <tr> 
    <td>&nbsp;</td>
    <td><div align="<? echo $alight; ?>"><font size="<? echo $size_title; ?>"><strong><? echo $titulo; ?></strong></font></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="<?echo $colspan; ?>"><div align="<? echo $alight; ?>"><img src="<?echo $imagen_barra; ?>" width="<?echo $with; ?>" height="<?echo $height_barra; ?>" /></div></td>
  </tr>
</table>  
  <table width="<?echo $with; ?>" border="<?echo $border; ?>" align="<?echo $alight; ?>" bgcolor="<?echo $bgcolor; ?>">
