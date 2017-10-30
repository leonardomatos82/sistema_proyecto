<?php
include("../control/valida.php"); 
include("../config.php");
include("../tabla2.php");
include("../barra.php");
$doc=$_GET[documento];
$result = pg_query($con, "select * from datos where cedula='".$_GET[id]."'"); 
$row=pg_fetch_array($result);
?>



<table width="750" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="2"><strong>Agregar Datos para del Egresado</strong></td>
  
  </tr>
 
  <tr>
    
    <td><form style="width: 700px; height: 300px;" action="agregar_r.php?documento=<?echo $doc;?>"  method="post">
      <p>
      
        <table width="80%" border="0"> <tr>
  <td height="88"><p align="right">&nbsp;</p>
      
    <td width="300"><em>Ingrese los Datos para la Generar Documento:</em></td>
 
  </tr>
<tr> 
            <td width="30%"><div align="left">TRAMO:</div></td>
            <td width="70%"><input  name="tramo" type="text" id="tramo"  size="5" value="<? echo $row['tramo'];?>"></td>
          </tr>
<tr> 
            <td width="30%"><div align="left">PERIODO:</div></td>
            <td width="70%"><input  name="periodo" type="text" id="periodo"  size="5" value="<? echo $row['periodo'];?>"></td>
          </tr>
                  <tr> 
            <td>TITULO:</td>
            <td> <select name="titulo" id="titulo" style="font-size:8pt" >
               <option value="<? echo $row['titulo'];?>" selected ><? echo $row['titulo'];?></option>
<option value="ESPECIALIZACION DE GESTION JUDICIAL">ESPECIALIZACION DE GESTION JUDICIAL</option>
 		<option value="ABOGADO">ABOGADO</option>
               <option value="LICENCIADO EN AGROECOLOGIA">LICENCIADO EN AGROECOLOGIA</option>
	      <option value="LICENCIADO EN COMUNICACION SOCIAL" >LICENCIADO EN COMUNICACION SOCIAL</option>
		<option value="LICENCIADO EN ESTUDIOS POLITICOS Y GOBIERNO" >LICENCIADO EN ESTUDIOS POLITICOS Y GOBIERNO</option>
		<option value="LICENCIADO EN GESTION AMBIENTAL" >LICENCIADO EN GESTION AMBIENTAL</option>
		<option value="LICENCIADO EN GESTION SOCIAL DEL DESARROLLO LOCAL" >LICENCIADO EN GESTION SOCIAL DEL DESARROLLO LOCAL</option>
		<option value="LICENCIADO EN INFORMATICA PARA LA GESTION SOCIAL" >LICENCIADO EN INFORMATICA PARA LA GESTION SOCIAL</option>
		<option value="LICENCIADO EN EDUCACION" >LICENCIADO EN EDUCACION</option>
		<option value="LICENCIADO EN EDUCACION MENCION EDUCACION INICIAL" >LICENCIADO EN EDUCACION MENCION EDUCACION INICIAL</option>
		<option value="LICENCIADO EN EDUCACION MENCION EDUCACION ESPECIAL" >LICENCIADO EN EDUCACION MENCION EDUCACION ESPECIAL</option>
		<option value="LICENCIADO EN EDUCACION MENCION EDUCACION FISICA" >LICENCIADO EN EDUCACION MENCION EDUCACION FISICA</option>
		<option value="TECNICO SUPERIOR UNIVERSITARIO EN PRODUCCION AGROALIMENTARIA" >TECNICO SUPERIOR UNIVERSITARIO EN PRODUCCION AGROALIMENTARIA</option>
 <option value="TECNICO SUPERIOR UNIVERSITARIO EN ENFERMERIA">TECNICO SUPERIOR UNIVERSITARIO EN ENFERMERIA</option>
		<option value="TECNICO SUPERIOR UNIVERSITARIO EN PRODUCCION MEDIOS DE COMUNICACION" >TECNICO SUPERIOR UNIVERSITARIO EN PRODUCCION MEDIOS DE COMUNICACION</option>
		<option value="TECNICO SUPERIOR UNIVERSITARIO EN PROYECTOS DE PARTICIPACION Y GESTION" >TECNICO SUPERIOR UNIVERSITARIO EN PROYECTOS DE PARTICIPACION Y GESTION</option>
		<option value="TECNICO SUPERIOR UNIVERSITARIO EN EVALUACION AMBIENTAL" >TECNICO SUPERIOR UNIVERSITARIO EN EVALUACION AMBIENTAL</option>
                <option value="TECNICO SUPERIOR UNIVERSITARIO EN PLANIFICACION DE PROGRAMAS SOCIOCOMUNITARIOS" >TECNICO SUPERIOR UNIVERSITARIO EN PLANIFICACION DE PROGRAMAS SOCIOCOMUNITARIOS</option>
		<option value="TECNICO SUPERIOR UNIVERSITARIO EN INFORMATICA PARA LA GESTION SOCIAL" >TECNICO SUPERIOR UNIVERSITARIO EN INFORMATICA PARA LA GESTION SOCIAL</option>

                </option>
              
              </select>
              </td>
          </tr>
          <tr> 
            <td width="30%"><div align="left">CIUDADANO:</div></td>
            <td width="70%"><input  name="nombre" type="text" id="id"  size="60" value=""></td>
          </tr>

 <tr> 
            <td width="30%"><div align="left">CEDULA:</div></td>
            <td width="70%"><select name="nacionalidad" id="nacionalidad" >
                <option value="SELECCIONE" ></option>
                <option value="V" selected>V</option>
              <option value="E">E</option>
		</option>
              
              </select><input name="cedula" type="text" id="cedula"  value="<? echo $_GET[id]; ?>"size="15" value=""></td>
          </tr>
 <tr> 
            <td width="30%"><div align="left">CODIGO N:</div></td>
            <td width="70%"><input  name="codigo" type="text" id="codigo"  size="5" value="">Tomo<input  name="tomo" type="text" id="tomo"  size="5" value="">Folio<input  name="folio" type="text" id="folio"  size="5" value=""></td>
          </tr>

      <tr> 
            <td>CIUDAD:</td>
            <td> <select name="ciudad" id="ciudad" >
                <option value="SELECCIONE" selected>SELECCIONE</option>
<option value="PUERTO AYACUCHO" >PUERTO AYACUCHO</option>
<option value="BARCELONA" >BARCELONA</option>
<option value="SAN FERNANDO DE APURE" >SAN FERNANDO DE APURE</option>
<option value="MARACAY" >MARACAY</option>
<option value="BARINAS" >BARINAS</option>
<option value="CIUDAD BOLIVAR" >CIUDAD BOLIVAR</option>
<option value="VALENCIA" >VALENCIA</option>
<option value="SAN CARLOS" >SAN CARLOS</option>
<option value="TUCUPITA" >TUCUPITA</option>
<option value="CARACAS" >CARACAS</option>
<option value="CORO" >CORO</option>
<option value="SAN JUAN DE LOS MORROS" >SAN JUAN DE LOS MORROS</option>
<option value="BARQUISIMETO" >BARQUISIMETO</option>
<option value="MERIDA" >MERIDA</option>
<option value="LOS TEQUES" >LOS TEQUES</option>
<option value="MATURIN" >MATURIN</option>
<option value="LA ASUNCION" >LA ASUNCION</option>
<option value="GUANARE" >GUANARE</option>
<option value="CUMANA" >CUMANA</option>
<option value="SAN CRISTOBAL" >SAN CRISTOBAL</option>
<option value="TRUJILLO" >TRUJILLO</option>
<option value="LA GUAIRA" >LA GUAIRA</option>
<option value="SAN FELIPE" >SAN FELIPE</option>
<option value="MARACAIBO" >MARACAIBO</option>
<option value="GRAN ROQUE" >GRAN ROQUE</option>
                </option>
              
              </select>
              </td>
          </tr>

     <tr> 
            <td>ESTADO:</td>
            <td> <select name="estado" id="estado" >
                <option value="SELECCIONE" selected>SELECCIONE</option>
<option value="AMAZONAS" >AMAZONAS</option>
<option value="ANZOATEGUI" >ANZOATEGUI</option>
<option value="APURE" >APURE</option>
<option value="ARAGUA" >ARAGUA</option>
<option value="BARINAS" >BARINAS</option>
<option value="BOLIVAR" >BOLIVAR</option>
<option value="CARABOBO" >CARABOBO</option>
<option value="COJEDES" >COJEDES</option>
<option value="DELTA AMACURO" >DELTA AMACURO</option>
<option value="DISTRITO CAPITAL" >DISTRITO CAPITAL</option>
<option value="FALCON" >FALCON</option>
<option value="GUARICO" >GUARICO</option>
<option value="LARA" >LARA</option>
<option value="MERIDA" >MERIDA</option>
<option value="MIRANDA" >MIRANDA</option>
<option value="MONAGAS" >MONAGAS</option>
<option value="NUEVA ESPARTA" >NUEVA ESPARTA</option>
<option value="PORTUGUESA" >PORTUGUESA</option>
<option value="SUCRE" >SUCRE</option>
<option value="TACHIRA" >TACHIRA</option>
<option value="TRUJILLO" >TRUJILLO</option>
<option value="VARGAS" >VARGAS</option>
<option value="YARACUY" >YARACUY</option>
<option value="ZULIA" >ZULIA</option>
<option value="DEPENDENCIAS FEDERALES 1" >DEPENDENCIAS FEDERALES 1</option>

                </option>
              
              </select>
              </td>
          </tr>

           
          <tr> 
          <td width="30%"><div align="left"></div></td>
            <td><input value="Agregar Registro" type="submit" name="submit2"></td>
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