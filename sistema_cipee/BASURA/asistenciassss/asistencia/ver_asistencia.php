<?php 
include("../control/valida.php"); 
include("../css.php");
include("../config.php");
include("../atras.php"); 

$fech= $_POST['fecha'];
$rc2="select distinct(fecha)  from asistencia 
order by fecha desc";
$qrc2=pg_query($con,$rc2);
 ?>
 <script language="JavaScript">
function acceptNum(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key <= 13 || (key >= 48 && key <= 58));
}
var nav4 = window.Event ? true : false;
function acceptChar(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key < 47 || key > 57);
}
  </script>
    
<script language=javascript>
function ventanaSecundaria (URL){
   window.open(URL,"ventana1","width=900,height=600,scrollbars=NO")
}
</script>   
 
<table width="760" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2">MODIFICAR REGISTRO DE ASISTENCIA</td> 
  </tr>
  <tr>
  </tr>
  <tr>
    <td></td>
            
           <form id="form1" name="form2" method="post" action="ver_asistencia.php?">
            <td><select name="fecha" id="select5">
                <option value="Todos">Todos</option>
                <option value="<?$fech2=cambiaf_a_normal($fech); echo $fech?>" selected><? echo $fech2?></option>
                <?php while($obj=pg_fetch_object($qrc2)){$fecha=cambiaf_a_normal($obj->fecha);$fecha2=$obj->fecha?>
                <option value="<? echo $obj->fecha?>"><? echo $fecha?></option>
                <? }//Fin while ?>
              </select> <input value="VER" type="submit" name="submit2" /> 
              </td>
              
              </form>
        <tr colspan="2"><td></td><td align="right">  <a href="javascript:ventanaSecundaria('http://bar30/asistencia/asistencia/Aasistencia.php')"> 
              Agregar </a></td></tr>  
    
  </tr>
  <tr>
    <td height="59"><p align="right">&nbsp;</p>
    <p align="right">&nbsp;</p></td>
    <td><table width="100%" height="48" border="0"  align="center" cellpadding="0" cellspacing="1" >

      <tr>
        <td width="100%" height="42" bordercolor="#000000" bgcolor="#FFFFFF"><?php
        
if ($_POST['fecha']=='Todos' || $_POST['fecha']==''){
$result = pg_query($con,"SELECT ASISTENCIA.fecha,ASISTENCIA.CEDULA, personal.nombre,asistencia.entra1,asistencia.sale1
,asistencia.entra2,asistencia.sale2,asistencia.observacion
 FROM asistencia 
 INNER JOIN PERSONAL ON PERSONAL.CEDULA=ASISTENCIA.CEDULA 
 where asistencia.id_dpto='$_SESSION[dpto]' 
 order by ASISTENCIA.fecha desc, asistencia.cedula asc
");
}else{
$result = pg_query($con,"SELECT ASISTENCIA.fecha,ASISTENCIA.CEDULA, personal.nombre,asistencia.entra1,asistencia.sale1
,asistencia.entra2,asistencia.sale2,asistencia.observacion
 FROM asistencia 
 INNER JOIN PERSONAL ON PERSONAL.CEDULA=ASISTENCIA.CEDULA 
 where fecha='$_POST[fecha]' and asistencia.id_dpto='$_SESSION[dpto]' 
 order by ASISTENCIA.fecha desc, asistencia.cedula asc
");

}

echo "<form id=form1 name=form1 method=post action=edit_asistencia.php?fecha=$fech>";

echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=100% bgcolor=#FFFFFF >";
echo "<tr>";
echo "<td <small style=width: 50px font-weight: bold><b>FECHA</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>CEDULA</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>NOMBRES Y APELLIDOS</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>ENTRA</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>SALE</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>ENTRA</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>SALE</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>OBSERVACIONES</b></td>";

echo "</tr> ";

while ($row = pg_fetch_row($result)){
echo "<tr> ";
$c++;
$row[0]=cambiaf_a_normal($row[0]);
?>
<td <input autocomplete=OFF readonly MAXLENGTH=10 size="7" name="fecha<? echo $c ?>" type="text"   value="<?echo $row[0]?>" /> </td>
<td <input autocomplete=OFF readonly size="6" name="cedula<? echo $c ?>" type="text"   value="<?echo $row[1]?>" /> </td>
<?

echo strtoupper("<td <small style=width: 50px ><font size=1>$row[2]</font></td> ");
?>
<td <input autocomplete=OFF size="3" MAXLENGTH=5 onKeyPress="return acceptNum(event)" name="entra1<? echo $c ?>" type="text"   value="<?echo $row[3]?>" /> </td>
<td <input autocomplete=OFF size="3" MAXLENGTH=5 onKeyPress="return acceptNum(event)" name="sale1<? echo $c ?>" type="text"   value="<?echo $row[4]?>" /> </td>
<td <input autocomplete=OFF size="3" MAXLENGTH=5 onKeyPress="return acceptNum(event)" name="entra2<? echo $c ?>" type="text"   value="<?echo $row[5]?>" /> </td>
<td <input autocomplete=OFF size="3" MAXLENGTH=5 onKeyPress="return acceptNum(event)" name="sale2<? echo $c ?>" type="text"   value="<?echo $row[6]?>" /> </td>
<td <input autocomplete=OFF size="14"  name="observacion<? echo $c ?>" type="text"   value="<?echo $row[7]?>" /> </td>
<?

?>
        </td>
       
        <?PHP
echo "</tr> ";
}
echo "</table>";
  echo "<p align=center><strong>	<input value=Enviar type=submit name=submit1 /> </strong></p>";
echo "</form>";
?>
        <td><div align="center"></td>
          </tr>
    </table></td>
   
  </tr>
 <?php
include("../pie.php"); 
 ?>