<?php
include("../control/valida.php"); 
include("../css.php");
include("../config.php");
$rc5="select *  from fondo
order by nombre_fondo desc";
$qrc5=pg_query($con,$rc5);
?>
<tr>
 <td>&nbsp;</td>
<td>&nbsp;</td>
 </tr>
 <?php
include("../atras.php"); 
?>
   </tr>
  <tr> 
<table width="760" border="0" align="center" bgcolor="#FFFFFF">

  <tr> 
    <td width="60">&nbsp;</td>
    <td width="709"><em>Lista de reportes que emite el Sistema SICAF:</em></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="22">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="26">&nbsp;</td>
    <td><strong>REPORTES EMITIDOS POR EL SISTEMA SICAF.</strong></td>
	
	  </tr>
	    <tr>
		<td height="26">&nbsp;</td>
       <td><a href="../cheque/ver_impcheque.php?>"><img
 style="border: 0px solid ; width: 16px; height: 16px;" alt="d"
 src="../imagenes/b_print.png">IMPRESIÓN DE CHEQUE</a></td>
      </tr>
  	    <tr>
		<td height="26">&nbsp;</td>
       <td><a href="../cheque/ver_impcheque.php?>"><img
 style="border: 0px solid ; width: 16px; height: 16px;" alt="d"
 src="../imagenes/b_print.png">VOUCHER DEL CHEQUE</a></td>
      </tr>
   	    <tr>
		<td height="26">&nbsp;</td>
       <td><a href="../cheque/ver_historico_cheque.php?>"><img
 style="border: 0px solid ; width: 16px; height: 16px;" alt="d"
 src="../imagenes/b_print.png">HISTORICO DE PAGOS EN CHEQUES</a></td>
      </tr>
	    	    <tr>
		<td height="26">&nbsp;</td>
       <td><a href="../chica/ver_impchica.php?>"><img
 style="border: 0px solid ; width: 16px; height: 16px;" alt="d"
 src="../imagenes/b_print.png">COMPROBANTE DE CAJA CHICA</a></td>
      </tr>
	    	    <tr>
		<td height="26">&nbsp;</td>
       <td><a href="../viaticos/calculos/ver_imp.php?>"><img
 style="border: 0px solid ; width: 16px; height: 16px;" alt="d"
 src="../imagenes/b_print.png">RECIBO DE VIATICOS</a></td>
      </tr>
	    	    <tr>
		<td height="26">&nbsp;</td>
       <td><a href="../suministros/ver_impdespacho.php?>"><img
 style="border: 0px solid ; width: 16px; height: 16px;" alt="d"
 src="../imagenes/b_print.png">NOTA DE ENTREGA DE MATERIALES Y SUMINISTROS</a></td>
      </tr>
	    	    <tr>
		<td height="26">&nbsp;</td>
       <td><a href="../suministros/act_inventario.php?>"><img
 style="border: 0px solid ; width: 16px; height: 16px;" alt="d"
 src="../imagenes/b_print.png">INVENTARIO DE MATERIALES Y SUMINISTROS</a></td>
      </tr>
	    	    <tr>
		<td height="26">&nbsp;</td>
       <td><a href="../iva/ver_impiva.php?>"><img
 style="border: 0px solid ; width: 16px; height: 16px;" alt="d"
 src="../imagenes/b_print.png">COMPROBANTE DE RETENCION DEL I.V.A</a></td>
      </tr>
	    	    <tr>
		<td height="26">&nbsp;</td>
       <td><a href="../isrl/ver_impisrl.php?>"><img
 style="border: 0px solid ; width: 16px; height: 16px;" alt="d"
 src="../imagenes/b_print.png">COMPROBANTE DE RETENCION DEL ISRL</a></td>
      </tr>
	    	    <tr>
		<td height="26">&nbsp;</td>
       <td><a href="../samat/ver_impsamat.php?>"><img
 style="border: 0px solid ; width: 16px; height: 16px;" alt="d"
 src="../imagenes/b_print.png">COMPROBANTE DE RETENCION DEL SAMAT</a></td>
      </tr>
     	    <tr>
		<td height="26">&nbsp;</td>
       <td><a href="../samat/ver_porpartida.php?>"><img
 style="border: 0px solid ; width: 16px; height: 16px;" alt="d"
 src="../imagenes/b_print.png">IMPUESTOS MUNICIPALES SOBRE ACTIVIDADES ECONÓMICAS</a></td>
      </tr>
	    	    <tr>
		<td height="26">&nbsp;</td>
       <td><a href="../usuario/registro_proveedores.php?>"><img
 style="border: 0px solid ; width: 16px; height: 16px;" alt="d"
 src="../imagenes/b_print.png">REGISTRO DE PROVEEDORES</a></td>
      </tr>
	    	    <tr>
		<td height="26">&nbsp;</td>
       <td><a href="../partida/ver_imppartida.php?>"><img
 style="border: 0px solid ; width: 16px; height: 16px;" alt="d"
 src="../imagenes/b_print.png">PARTIDAS PRESUPUESTARIAS</a></td>
      </tr>
     <tr> 
	 <tr> 
    <td height="26">&nbsp;</td>
    <td><strong>REPORTES EMITIDOS POR EL SISTEMA SICAF.</strong></td>
	
	  </tr>
	 
    <td height="26">&nbsp;</td>
    <td><a href="../consulta/menu_consulta.php?>"><img
 style="border: 0px solid ; width: 16px; height: 16px;" alt="d"
 src="../imagenes/b_print.png"><strong> VER REPORTES.</strong></td>
	</tr>
	<tr> 
    <td height="26">&nbsp;</td>
    <td><strong>--RELACION DE CHEQUES EMITIDOS.</strong></td>
	</tr>
		<tr> 
    <td height="26">&nbsp;</td>
    <td><strong>--RELACION DE CHEQUES ANULADOS.</strong></td>
	</tr>
		<tr> 
    <td height="26">&nbsp;</td>
    <td><strong>--LIBRO DE BANCOS.</strong></td>
	</tr>
		<tr> 
    <td height="26">&nbsp;</td>
    <td><strong>--RELACION DE GASTOS.</strong></td>
	</tr>
		<tr> 
    <td height="26">&nbsp;</td>
    <td><strong>--LIBRO DE COMPRAS.</strong></td>
	</tr>
		<tr> 
    <td height="26">&nbsp;</td>
    <td><strong>--RELACION DE RETENCIONES IVA.</strong></td>
	</tr>
		<tr> 
    <td height="26">&nbsp;</td>
    <td><strong>--RELACION DE RETENCIONES IVA – (EXCEL – XLS).</strong></td>
	</tr>
		<tr> 
    <td height="26">&nbsp;</td>
    <td><strong>--RELACION DE RETENCIONES ISRL.</strong></td>
	</tr>
		<tr> 
    <td height="26">&nbsp;</td>
    <td><strong>--RELACION DE RETENCIONES SAMAT.</strong></td>
	</tr>
		<tr> 
    <td height="26">&nbsp;</td>
    <td><strong>--DISTRIBUCION PRESUPUESTARIA GENERAL.</strong></td>
	</tr>
		<tr> 
    <td height="26">&nbsp;</td>
    <td><strong>--DISTRIBUCION PRESUPUESTARIA POR CHEQUES.</strong></td>
	</tr>
		<tr> 
    <td height="26">&nbsp;</td>
    <td><strong>--GRAFICO DISTRIBUCION PRESUPUESTARIA.</strong></td>
	</tr>
		<tr> 
    <td height="26">&nbsp;</td>
    <td><strong>--GRAFICO CANTIDAD DE CHEQUES.</strong></td>
	</tr>
		<tr> 
    <td height="26">&nbsp;</td>
    <td><strong>--RELACION DE CAJA CHICA.</strong></td>
	</tr>
		<tr> 
    <td height="26">&nbsp;</td>
    <td><strong>--RENDICION DE CAJA CHICA.</strong></td>
	</tr>
		<tr> 
    <td height="26">&nbsp;</td>
    <td><strong>--RELACION DE VIATICOS.</strong></td>
	</tr>
	

	
<?php
include("../pie.php"); 
 ?>