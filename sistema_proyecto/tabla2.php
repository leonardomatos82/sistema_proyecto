<?
include("variables.php");

?>
 <title><?echo $title; ?></title>
 <body img background=../<? echo $fondo; ?>>
<table width="<?echo $with; ?>" border="<?echo $border; ?>" align="<?echo $alight; ?>" bgcolor="<?echo $bgcolor; ?>">
  <tr> 
  
    <td colspan="<?echo $colspan; ?>"><div align="<?echo $aligth; ?>"> 
      <p><img src=../<?echo $banner; ?>  width="<?echo $with; ?>" height="<?echo $height_banner1; ?>"></p>

 <img src=../<?echo $banner2; ?>  width="<?echo $with; ?>" height="<?echo $height_banner2; ?>">

            </div></td>
  </tr>
  <tr> 
  </tr>
  <tr> 
  <tr> 
    <td>&nbsp;</td>
    <td><div align="<? echo $alight; ?>"><font size="<? //echo $size_title; ?>"><strong><? //echo $titulo; ?></strong></font></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="<?echo $colspan; ?>"><div align="<? echo $alight; ?>"><img src=../<?echo $imagen_barra; ?> width="<?echo $with; ?>" height="<?echo $height_barra; ?>" /></div></td>
  </tr>
</table>  
<table width="<?echo $with; ?>" border="<?echo $border; ?>" align="<?echo $alight; ?>" bgcolor="<?echo $bgcolor; ?>">
