<?php
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../barra.php");
$resultado = pg_query($con,"SELECT * FROM usuario order by nombre");
$query2="SELECT * FROM configuracion where id_configuracion='1'";
$result2=pg_query($con,$query2);
$resultado1 = pg_query($con,"SELECT * FROM cargo order by nombre_cargo");
$resultado2 = pg_query($con,"SELECT * FROM departamento order by nombre_departamento");

$row2=pg_fetch_array($result2);
include("cantidad.php");
if ($_GET[id]!=""){
$_POST[cedula]=$_GET[id];
$fecha=date("d-m-Y");
$sql="update solicitud set estado='PROCESADO',fecha_impresion='$fecha' where cedula='$_POST[cedula]'"; 
if (!pg_query($con,$sql)) { die('Error: ' . pg_result_error()); } 

}
$condicion="";
$cedula=$_POST[cedula];
$codigo=$_POST[codigo];

$t1="trabajador.cedula="."'$cedula'";
$t2="trabajador.codigo="."'$codigo'";



////////////////////////////////////////////
if ($_POST[cedula]!="")
{
if ($condicion!="" )
{
   $condicion=$condicion." AND ";
 }  
 $condicion=$condicion.$t1;
  }  
if ($_POST[codigo]!=0)
{
if ($condicion!="" )
{
   $condicion=$condicion." AND ";
 }  
 $condicion=$condicion.$t2;
  }  

if  ($condicion==""){

 }else{
$result = pg_query($con,$query="SELECT *
FROM
TRABAJADOR
where
$condicion");
}
$row = pg_fetch_row($result);
$row[10]= str_replace(".", "", $row[10]);
$row[10] = str_replace(",", ".", $row[10]);
$row[12]= str_replace(".", "", $row[12]);
$row[12] = str_replace(",", ".", $row[12]);
$row[13]= str_replace(".", "", $row[13]);
$row[13] = str_replace(",", ".", $row[13]);
$row[14]= str_replace(".", "", $row[14]);
$row[14] = str_replace(",", ".", $row[14]);
$row[18]= str_replace(".", "", $row[18]);
$row[18] = str_replace(",", ".", $row[18]);
$row[19]= str_replace(".", "", $row[19]);
$row[19] = str_replace(",", ".", $row[19]);
$row[20]= str_replace(".", "", $row[20]);
$row[20] = str_replace(",", ".", $row[20]);
include("numero22.php");
$row[2]=number_format($row[2],0,'.', '.');
$row[14]=number_format($row[14],2,'.', '.');
$row[12]=number_format($row[12],2,'.', '');
$row[13]=number_format($row[13],2,'.', '.');
$row[18]=number_format($row[18],2,',', '.');

$suma=$row[10]+$row[11]+$row[12]+$row[13]+$row[14]+$row[15]+$row[16]+$row[17]+$row[19]+$row[20];
$row[18]=$suma;
?>

 
 
<script language="javascript">
<!--
function alerta(){
if (confirm("Mensaje deconfirmacion.\r¿estas de acuerdo?")){
alert("has pulsado ACEPTAR");
}else{
alert("has pulsadoCANCELAR");
}
}
//-->
</script>
 
  <script language="JavaScript">
function acceptNume(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key <= 13 || (key >= 44 && key <= 57));
}
var nav4 = window.Event ? true : false;
function acceptChar(evt){ var key = nav4 ? evt.which : evt.keyCode; return (key < 44 || key > 57);
}
function textCounter(field, countfield, maxlimit) {
if (field.value.length > maxlimit)
field.value = field.value.substring(0, maxlimit);
else 
countfield.value = maxlimit - field.value.length;
}
function asignar(field1,field2,field3,field4,field5,field6,field7,field8,field9,field10,field11,field12) {
integral=parseFloat(field1.value,10,2);
hijo=parseFloat(field2.value,10,2);
jerarquia=parseFloat(field3.value,10,2);
profesionalizacion=parseFloat(field4.value,10,2);
antiguedad=parseFloat(field5.value,10,2);
hogar=parseFloat(field6.value,10,2);
chofer=parseFloat(field7.value,10,2);
moto=parseFloat(field8.value,10,2);
sueldo=parseFloat(field9.value,10,2);
hijoe=parseFloat(field10.value,10,2);
estudio=parseFloat(field11.value,10,2);
bononocturno=parseFloat(field12.value,10,2);
var mi_numero=(sueldo+hijo+jerarquia+profesionalizacion+antiguedad+hogar+chofer+moto+hijoe+estudio+bononocturno);
field1.value=mi_numero.toFixed(2);
}

function comparar(field1,field2,field3,countfield) {
if (field1.value >= countfield.value)
field1.value = "";

}
  </script>

<table width="750" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2"><strong>Modificar Datos del Trabajador</strong></td>
  
  </tr>
  <tr>
    <td width="149">&nbsp;</td>
    <td width="300"><em>Modifique los datos de trabajador:</em></td>
 
  </tr>
  <tr>

    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="88"><p align="right">&nbsp;</p>
        <p align="right">&nbsp;</p></td>
    <td><form style="width: 700px; height: 600px;" action="edit_primas.php"  method="post">
      <p>
      
        <table width="81%" border="0">
          <tr> 
            <td width="30%"><div align="left">ID:</div></td>
            <td width="70%"><input readonly="readonly" name="id" type="text" id="id"  size="15" value="<? echo $row[0]?>"></td>
          </tr>
          <tr> 
            <td width="30%"><div align="left">CODIGO:</div></td>
            <td width="70%"><input readonly="readonly" name="codigo" type="text" id="id"  size="15" value="<? echo $row[1]?>"></td>
          </tr>
 <tr> 
            <td width="30%"><div align="left">CEDULA:</div></td>
            <td width="70%"><input readonly="readonly" name="cedula" type="text" id="id"  size="15" value="<? echo $row[2]?>"></td>
          </tr>
 <tr> 
            <td width="30%"><div align="left">NOMBRE:</div></td>
            <td width="70%"><input  name="nombre" type="text" id="nombre"  size="25" value="<? echo $row[3]?>"></td>
          </tr>
         <tr> 
            <td>CARGO:</td>
            <td> <select name="cargo" id="cargo" >
                <option value="<? echo $row[6]?>" selected><? echo $row[6]?></option>
                <?php while($obj=pg_fetch_object($resultado1)){?>
                <option value="<? echo $obj->nombre_cargo ?>"> <? echo $obj->nombre_cargo?> 
                </option>
                <? }//Fin while ?>
              </select>
              </td>
          </tr>
<tr> 
            <td>DEPARTAMENTO:</td>
            <td> <select name="departamento" id="departamento" >
                <option value="<? echo $row[7]?>" selected><? echo $row[7]?></option>
                <?php while($obj=pg_fetch_object($resultado2)){?>
                <option value="<? echo $obj->nombre_departamento ?>"> <? echo $obj->nombre_departamento?> 
                </option>
                <? }//Fin while ?>
              </select>
              </td>
          </tr>

 <tr> 
            <td width="30%"><div align="left">Sueldo Basico:</div></td>
            <td width="70%"><input  name="sueldo" type="text" id="id"  size="15" value="<? echo $row[10]?>"></td>
          </tr>
<tr> 
            <td width="30%"><div align="left">P. Incentivo Estudio:</div></td>
            <td width="70%"><input name="estudio" onKeyPress="return acceptNum(event)" onKeyUp="asignar(this.form.integral,this.form.hijo,this.form.jerarquia,this.form.profesionalizacion,this.form.antiguedad,this.form.hogar,this.form.chofer,this.form.moto,this.form.sueldo,this.form.hijoe,this.form.estudio,this.form.bononocturno);"   type="text" id="id"  size="15" value="<? echo $row[20]?>"></td>
          </tr>
<tr> 
            <td width="30%"><div align="left">P. Hijo:</div></td>
            <td width="70%"><input name="hijo" onKeyPress="return acceptNum(event)" onKeyUp="asignar(this.form.integral,this.form.hijo,this.form.jerarquia,this.form.profesionalizacion,this.form.antiguedad,this.form.hogar,this.form.chofer,this.form.moto,this.form.sueldo,this.form.hijoe,this.form.estudio,this.form.bononocturno);"   type="text" id="id"  size="15" value="<? echo $row[11]?>"></td>
          </tr>
<tr> 
<tr> 
            <td width="30%"><div align="left">P. Hijo Excepcional:</div></td>
            <td width="70%"><input name="hijoe" onKeyPress="return acceptNum(event)" onKeyUp="asignar(this.form.integral,this.form.hijo,this.form.jerarquia,this.form.profesionalizacion,this.form.antiguedad,this.form.hogar,this.form.chofer,this.form.moto,this.form.sueldo,this.form.hijoe,this.form.estudio,this.form.bononocturno);"   type="text" id="id"  size="15" value="<? echo $row[19]?>"></td>
          </tr>
<tr> 
            <td width="30%"><div align="left">P. Jerarquia:</div></td>
            <td width="70%"><input  name="jerarquia" onKeyPress="return acceptNum(event)" onKeyUp="asignar(this.form.integral,this.form.hijo,this.form.jerarquia,this.form.profesionalizacion,this.form.antiguedad,this.form.hogar,this.form.chofer,this.form.moto,this.form.sueldo,this.form.hijoe,this.form.estudio,this.form.bononocturno);"   type="text" id= type="text" id="id"  size="15" value="<? echo $row[12]?>"></td>
          </tr>
<tr> 
            <td width="30%"><div align="left">P. Profesionalizacion:</div></td>
            <td width="70%"><input  name="profesionalizacion" onKeyPress="return acceptNum(event)" onKeyUp="asignar(this.form.integral,this.form.hijo,this.form.jerarquia,this.form.profesionalizacion,this.form.antiguedad,this.form.hogar,this.form.chofer,this.form.moto,this.form.sueldo,this.form.hijoe,this.form.estudio,this.form.bononocturno);"   type="text" id= type="text" id="id"  size="15" value="<? echo $row[13]?>"></td>
          </tr>
<tr> 
            <td width="30%"><div align="left">P. Antiguedad:</div></td>
            <td width="70%"><input  name="antiguedad" onKeyPress="return acceptNum(event)" onKeyUp="asignar(this.form.integral,this.form.hijo,this.form.jerarquia,this.form.profesionalizacion,this.form.antiguedad,this.form.hogar,this.form.chofer,this.form.moto,this.form.sueldo,this.form.hijoe,this.form.estudio,this.form.bononocturno);"   type="text" id= type="text" id="id"  size="15" value="<? echo $row[14]?>"></td>
          </tr>
<tr> 
            <td width="30%"><div align="left">P. Hogar:</div></td>
            <td width="70%"><input  name="hogar" onKeyPress="return acceptNum(event)" onKeyUp="asignar(this.form.integral,this.form.hijo,this.form.jerarquia,this.form.profesionalizacion,this.form.antiguedad,this.form.hogar,this.form.chofer,this.form.moto,this.form.sueldo,this.form.hijoe,this.form.estudio,this.form.bononocturno);"   type="text" id= type="text" id="id"  size="15" value="<? echo $row[15]?>"></td>
          </tr>
<tr> 
            <td width="30%"><div align="left">P. Chofer:</div></td>
            <td width="70%"><input  name="chofer" onKeyPress="return acceptNum(event)" onKeyUp="asignar(this.form.integral,this.form.hijo,this.form.jerarquia,this.form.profesionalizacion,this.form.antiguedad,this.form.hogar,this.form.chofer,this.form.moto,this.form.sueldo,this.form.hijoe,this.form.estudio,this.form.bononocturno);"   type="text" id= type="text" id="id"  size="15" value="<? echo $row[16]?>"></td>
          </tr>
<tr> 
            <td width="30%"><div align="left">P. Moto:</div></td>
            <td width="70%"><input  name="moto" onKeyPress="return acceptNum(event)" onKeyUp="asignar(this.form.integral,this.form.hijo,this.form.jerarquia,this.form.profesionalizacion,this.form.antiguedad,this.form.hogar,this.form.chofer,this.form.moto,this.form.sueldo,this.form.hijoe,this.form.estudio,this.form.bononocturno);"   type="text" id= type="text" id="id"  size="15" value="<? echo $row[17]?>"></td>
          </tr>
<tr> 
            <td width="30%"><div align="left">Bono Nocturno</div></td>
            <td width="70%"><input  name="bononocturno" onKeyPress="return acceptNum(event)" onKeyUp="asignar(this.form.integral,this.form.hijo,this.form.jerarquia,this.form.profesionalizacion,this.form.antiguedad,this.form.hogar,this.form.chofer,this.form.moto,this.form.sueldo,this.form.hijoe,this.form.estudio,this.form.bononocturno);"   type="text" id= type="text" id="id"  size="15" value="<? echo $row[23]?>"></td>
          </tr>
<tr> 
            <td width="30%"><div align="left">Sueldo Integral:</div></td>
            <td width="70%"><input  name="integral" type="text" id="id"  size="15" value="<? echo $row[18]?>"></td>
          </tr>


           
          <tr> 
          <td width="30%"><div align="left"></div></td>
            <td><input value="Modificar" type="submit" name="submit2"></td>
          </tr>
        </table>
      <p>
</p>
      <p>* Campo requerido
      </p>
    </form></td>
    <td>&nbsp;</td>
  </tr>
</table>
   </tr>
 <?php include("../pie.php");?>

  


