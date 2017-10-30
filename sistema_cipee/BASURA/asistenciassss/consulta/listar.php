<?php 
include("../control/valida.php"); 
include("../css.php");
include("../config.php");
?>
<table width="824" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2">SELECCIONE LOS REGISTROS A INCLUIR EN EL OFICIO</td>
    <td width="77">&nbsp;</td>
  </tr>
  <tr>
    <td width="149">&nbsp;</td>
    <td width="584">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><form id="form1" name="form1" method="post" action="ver2.php">
      <p>Desde
        <input name="desde" type="text" id="desde" onkeypress="return acceptchar(event)" size="8" />
        Hasta
        <input name="hasta" type="text" id="hasta" onkeypress="return acceptchar(event)" size="8" />
        <input value="Emitir" type="submit" name="submit" />
      </p>
    </form></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="59">&nbsp;</td>
    <td><em>Haga clic en &quot;Configurar Oficio&quot; para editar los datos del Oficio:</em></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><div align="left"><a href="../control/Moficio.php?titulo=<?="MODIFICAR OFICIO"?>">Configurar Oficio</a></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><table width="100%" height="48" border="0"  align="center" cellpadding="0" cellspacing="1" >
      <tbody>
      </tbody>
      <tr>
        <td width="100%" height="42" bordercolor="#000000" bgcolor="#FFFFFF"><div align="center">
            <?php
$result = pg_query($con,"SELECT viaticos.id_viatico,viaticos.cedula,usuario.nomb_usuario,viaticos.motivo,viaticos.fecha_ida,viaticos.fecha_ret,viaticos.total
 FROM viaticos 
  INNER JOIN usuario ON viaticos.cedula= usuario.cedula 
  ORDER BY viaticos.id_viatico DESC
 ");

echo "<table align=center cellpadding=1 cellspacing=0 background-color: rgb(255, 255, 255); border =2; WIDTH=100% bgcolor=#FFFFFF >";

 
echo "<tr>";
echo "<td <small style=width: 50px font-weight: bold><b>ID</b></td>";
echo "<td <small style=width: 100px font-weight: bold><b>CEDULA</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>NOMBRE Y APELLIDO</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>MOTIVO</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>FECHA IDA</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>FECHA RET</b></td>";
echo "<td <small style=width: 50px font-weight: bold><b>TOTAL</b></td>";


echo "</tr> ";
while ($row = pg_fetch_row($result)){
echo "<tr> ";
echo "<td <small style=width: 50px >$row[0]</td> ";
echo "<td <small style=width: 50px >$row[1]</td> ";
echo "<td <small style=width: 50px >$row[2]</td> ";
echo "<td <small style=width: 50px >$row[3]</td> ";
echo "<td <small style=width: 50px >$row[4]</td> ";
echo "<td <small style=width: 50px >$row[5]</td> ";
echo "<td <small style=width: 50px >$row[6]</td> ";
?>
            </p>
          </div>
            <?PHP
echo "</tr> ";
}
echo "</table>";
?>
          &nbsp;</td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3"><div align="center"><img src="../imagenes/mural1.png" alt="d" width="850" height="13" /></div></td>
  </tr>
</table>