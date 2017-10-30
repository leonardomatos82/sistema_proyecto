<?php 
include("../config.php");



echo "<font size=1>/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////</font><br>";  
echo "<font size=1>//		CODIGO PARA GENERAR RESPALDO DE LA ESTRUCTURA DE LA BASE DE DATOS Y LA INFORMACION ///</font><br>"; 
echo "<font size=1>//		ARCHIVO COMPATIBLE CON POSTGRESQL 8.4															 ////</font><br>"; 
echo "<font size=1>//		COORDINACION DE INFORMATICA - BARINAS 		 														///</font><br>"; 
echo "<font size=1>//		AUTOR: LEONARDO MATOS   																			 ////</font><br>"; 
echo "<font size=1>//		ARCHIVO/GUARDAR COMO/ARCHIVO.TXT (GUARDE CON LA EXTENSION .TXT)						 ////</font><br>"; 

echo "<font size=1>///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////</font><br>"; 

//GENERANDO EL SCRPT DE LA ESTRUCTURA

echo "<font size=1>CREATE TABLE acceso (
    login character varying(30) NOT NULL,
    clave character varying(30) NOT NULL,
    tipo character varying(15) NOT NULL,
    id_acceso integer DEFAULT nextval(('public.acceso_id_acceso_seq'::text)::regclass) NOT NULL,
    nomb_usuario character varying(50),
    estado character varying(10)
);";      
echo "<font size=1>CREATE SEQUENCE acceso_id_acceso_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;</font><br>";  


echo "<font size=1>CREATE TABLE acceso_solicitud (
    login character varying(30) NOT NULL,
    clave character varying(30) NOT NULL,
    cedula character varying(30),
    nombre character varying(150),
    unidad character varying(150) NOT NULL,
    id_acceso_solicitud integer DEFAULT nextval(('public.acceso_id_acceso_solicitud_seq'::text)::regclass) NOT NULL
);";      
echo "<font size=1>CREATE SEQUENCE acceso_id_acceso_solicitud_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;</font><br>"; 
    
    
echo "<font size=1>CREATE TABLE asignacion_caja_chica (
    fecha date,
    ncheque character varying(15) NOT NULL,
    monto character varying(30) NOT NULL,
    descripcion character varying(150) NOT NULL,
    estado character varying(30) NOT NULL,
    id_asignacion_caja_chica integer DEFAULT nextval(('public.asignacion_caja_chica_id_asignacion_caja_chica_seq'::text)::regclass) NOT NULL,
    disponible character varying(30)
);";      
echo "<font size=1>CREATE SEQUENCE asignacion_caja_chica_id_asignacion_caja_chica_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

echo "<font size=1>CREATE TABLE caja_chica (
    beneficiario character varying(80) NOT NULL,
    cedula_rif character varying(30),
    nfactura character varying(30),
    monto_factura character varying(30),
    concepto character varying(1500) NOT NULL,
    programa character varying(150) NOT NULL,
    id_caja_chica integer DEFAULT nextval(('public.caja_chica_id_caja_chica_seq'::text)::regclass) NOT NULL,
    estado character varying(20),
    motivo character varying(1500),
    fecha_a date,
    fecha character varying(15),
    id_asignacion_caja_chica character varying(10)
);
";      
echo "<font size=1>CREATE SEQUENCE caja_chica_id_caja_chica_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

echo "<font size=1>CREATE TABLE cheque (
    fecha date NOT NULL,
    ncheque character varying(15) NOT NULL,
    monto_cheque character varying(30),
    beneficiario character varying(80) NOT NULL,
    concepto character varying(1500) NOT NULL,
    programa character varying(150) NOT NULL,
    cod_contable character varying(20) NOT NULL,
    id_cheque integer DEFAULT nextval(('public.cheque_id_cheque_seq'::text)::regclass) NOT NULL,
    estado character varying(20),
    motivo character varying(1500),
    fecha_a date,
    cedula_rif character varying(30),
    tipo_f character varying(30),
    estado2 character varying(35)
);
";      
echo "<font size=1>CREATE SEQUENCE cheque_id_cheque_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

echo "<font size=1>CREATE TABLE configuracion (
    coordinador_sede character varying(90) NOT NULL,
    coordinador_adm character varying(90) NOT NULL,
    administrador character varying(90) NOT NULL,
    cuenta character varying(90) NOT NULL,
    iva real,
    isrl real,
    id_configuracion integer DEFAULT nextval(('public.configuracion_id_configuracion_seq'::text)::regclass) NOT NULL,
    sede character varying(90),
    rif character varying(15),
    comienzo_anio date,
    custodio_chica character varying(60),
    cargo1 character varying(30),
    cargo2 character varying(30),
    cargo3 character varying(30),
    periodo integer
);
";      
echo "<font size=1>CREATE SEQUENCE configuracion_id_configuracion_seq
    START WITH 2
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

echo "<font size=1>CREATE TABLE departamento (
    nombre_departamento character varying(150) NOT NULL,
    id_departamento integer DEFAULT nextval(('public.departamento_id_departamento_seq'::text)::regclass) NOT NULL,
    responsable character varying(150)
);
";      
echo "<font size=1>CREATE SEQUENCE departamento_id_departamento_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 


echo "<font size=1>CREATE TABLE despacho (
    fecha date NOT NULL,
    nombre_entrega character varying(120) NOT NULL,
    id_departamento integer NOT NULL,
    id_despacho integer DEFAULT nextval(('public.despacho_id_despacho_seq'::text)::regclass) NOT NULL,
    estado character varying(30)
);
";      
echo "<font size=1>CREATE SEQUENCE despacho_id_despacho_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

echo "<font size=1>CREATE TABLE detalle_despacho (
    id_despacho integer NOT NULL,
    id_departamento integer NOT NULL,
    id_material integer NOT NULL,
    presentacion character varying(60) NOT NULL,
    cantidad integer,
    estado character varying(10),
    id_detalle_despacho integer DEFAULT nextval(('public.detalle_id_detalle_despacho_seq'::text)::regclass) NOT NULL
);
";      
echo "<font size=1>CREATE SEQUENCE detalle_id_detalle_despacho_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

echo "<font size=1>CREATE TABLE detalle_ingreso_material (
    id_ingreso_material integer NOT NULL,
    id_material integer NOT NULL,
    presentacion character varying(60) NOT NULL,
    cantidad integer,
    estado character varying(10),
    id_detalle_ingreso_material integer DEFAULT nextval(('public.detalle_ingreso_material_id_detalle_ingreso_material_seq'::text)::regclass) NOT NULL
);
";      
echo "<font size=1>CREATE SEQUENCE detalle_ingreso_material_id_detalle_ingreso_material_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

echo "<font size=1>CREATE TABLE detalle_ordencs (
    id_detalle_ordencs integer DEFAULT nextval(('public.detalle_ordencs_id_detalle_ordencs_seq'::text)::regclass) NOT NULL,
    id_orden integer NOT NULL,
    cod_orden character varying(20),
    cantidad integer,
    preciou character varying(30),
    total character varying(30),
    cod_partida character varying(30) NOT NULL,
    presentacion character varying(30),
    estado character varying(30)
);
";      
echo "<font size=1>CREATE SEQUENCE detalle_ordencs_id_detalle_ordencs
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

echo "<font size=1>CREATE TABLE distribucion_caja_chica (
    nfactura character varying(15) NOT NULL,
    cod_partida character varying(60) NOT NULL,
    monto_factura character varying(30),
    programa character varying(150) NOT NULL,
    id_distribucion_caja_chica integer DEFAULT nextval(('public.distribucion_caja_chica_id_distribucion_caja_chica_seq'::text)::regclass) NOT NULL,
    estado character varying(25),
    fecha date,
    id_asignacion_caja_chica character varying(10),
    id_caja_chica character varying(30)
);
";      
echo "<font size=1>CREATE SEQUENCE distribucion_caja_chica_id_distribucion_caja_chica_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

echo "<font size=1>CREATE TABLE distribucion_cheque (
    fecha date NOT NULL,
    ncheque character varying(15) NOT NULL,
    cod_partida character varying(60) NOT NULL,
    monto character varying(30),
    programa character varying(150) NOT NULL,
    cod_contable character varying(20) NOT NULL,
    id_distribucion integer DEFAULT nextval(('public.distribucion_cheque_id_distribucion_seq'::text)::regclass) NOT NULL,
    estado character varying(25),
    tipo_f character varying(30),
    estado2 character varying(25)
);
";      
echo "<font size=1>CREATE SEQUENCE distribucion_cheque_id_distribucion_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

echo "<font size=1>CREATE TABLE fondo (
    nombre_fondo character varying(150) NOT NULL,
    id_fondo integer DEFAULT nextval(('public.fondo_id_fondo_seq'::text)::regclass) NOT NULL
);
";      
echo "<font size=1>CREATE SEQUENCE fondo_id_fondo_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 


echo "<font size=1>CREATE TABLE ingreso_material (
    fecha date NOT NULL,
    fecha_fact date NOT NULL,
    factura character varying(60),
    monto character varying(60),
    cedula_rif character varying(20),
    id_ingreso_material integer DEFAULT nextval(('public.ingreso_material_id_ingreso_material_seq'::text)::regclass) NOT NULL
);
";      
echo "<font size=1>CREATE SEQUENCE ingreso_material_id_ingreso_material_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

echo "<font size=1>CREATE TABLE ingresos (
    fecha date NOT NULL,
    codigo character varying(15),
    beneficiario character varying(120) NOT NULL,
    concepto character varying(1500) NOT NULL,
    monto character varying(10),
    id_ingresos integer DEFAULT nextval(('public.ingresos_id_ingresos_seq'::text)::regclass) NOT NULL,
    tipo_f character varying(30)
);
";      
echo "<font size=1>CREATE SEQUENCE ingresos_id_ingresos_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 


echo "<font size=1>CREATE TABLE material (
    cod_partida character varying(60),
    descripcion character varying(120) NOT NULL,
    presentacion character varying(60) NOT NULL,
    existencia integer,
    estado character varying(10),
    id_material integer DEFAULT nextval(('public.material_id_material_seq'::text)::regclass) NOT NULL
);
";      
echo "<font size=1>CREATE SEQUENCE material_id_material_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

    
echo "<font size=1>CREATE SEQUENCE numero_id_numero_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

echo "<font size=1>CREATE TABLE oficio (
    id_oficio integer NOT NULL,
    para character varying(100) NOT NULL,
    dest character varying(100) NOT NULL,
    de character varying(100) NOT NULL,
    rem character varying(100) NOT NULL,
    pie character varying(255) NOT NULL
);
";      

echo "<font size=1>CREATE TABLE ordencs (
    id_ordencs integer DEFAULT nextval(('public.ordencs_id_ordencs_seq'::text)::regclass) NOT NULL,
    fecha date NOT NULL,
    tipo character varying(25) NOT NULL,
    proveedor character varying(90) NOT NULL,
    cedula_rif character varying(30),
    ejecutora character varying(150) NOT NULL,
    programa character varying(150) NOT NULL,
    cod_orden character varying(20),
    subtotal character varying(30),
    iva character varying(30),
    total character varying(30),
    observaciones character varying(1500) NOT NULL,
    estado character varying(30)
);
";      
echo "<font size=1>CREATE SEQUENCE ordencs_id_ordencs_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 


echo "<font size=1>CREATE TABLE p_principal (
    codigo character varying(30) NOT NULL,
    descripcion character varying(150) NOT NULL,
    monto_asig real,
    monto_ejec real,
    id_p_principal integer DEFAULT nextval(('public.p_principal_id_p_principal_seq'::text)::regclass) NOT NULL
);
";      
echo "<font size=1>CREATE SEQUENCE p_principal_id_p_principal_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 


echo "<font size=1>CREATE TABLE p_secundaria (
    codigo_s character varying(30) NOT NULL,
    codigo_p character varying(30) NOT NULL,
    descripcion character varying(150) NOT NULL,
    monto_asig real,
    monto_ejec real,
    id_p_secundaria integer DEFAULT nextval(('public.p_secundaria_id_p_secundaria_seq'::text)::regclass) NOT NULL
);
";      
echo "<font size=1>CREATE SEQUENCE p_secundaria_id_p_secundaria_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 


echo "<font size=1>CREATE TABLE p_terciaria (
    codigo_t character varying(30) NOT NULL,
    descripcion character varying(150) NOT NULL,
    asig_anual character varying(30),
    asig_mensual character varying(30),
    id_p_terciaria integer DEFAULT nextval(('public.p_terciaria_id_p_terciaria_seq'::text)::regclass) NOT NULL,
    periodo integer,
    estado character varying(25),
    p_samat character varying(25)
);
";      
echo "<font size=1>CREATE SEQUENCE p_terciaria_id_p_terciaria_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

echo "<font size=1>CREATE TABLE retencion_isrl (
    fecha date NOT NULL,
    sujeto character varying(80) NOT NULL,
    cedula_rif character varying(30) NOT NULL,
    comprobante character varying(15) NOT NULL,
    ncheque character varying(20),
    tipo_transaccion character varying(500),
    monto_total character varying(30),
    pret character varying(10),
    monto_retenido character varying(30),
    estado character varying(20),
    id_retencion_isrl integer DEFAULT nextval(('public.retencion_isrl_id_retencion_isrl_seq'::text)::regclass) NOT NULL
);
";      
echo "<font size=1>CREATE SEQUENCE retencion_isrl_id_retencion_isrl_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

echo "<font size=1>CREATE TABLE retencion_iva (
    fecha date NOT NULL,
    sujeto character varying(80) NOT NULL,
    cedula_rif character varying(30) NOT NULL,
    comprobante character varying(15) NOT NULL,
    fecha_fact character varying(20) NOT NULL,
    nfactura character varying(20),
    ncontrol character varying(20),
    ncheque character varying(20),
    tipo_transaccion character varying(500),
    monto_total character varying(30),
    monto_scf character varying(30),
    monto_base character varying(30),
    iva character varying(30),
    monto_retenido character varying(30),
    estado character varying(20),
    id_retencion_iva integer DEFAULT nextval(('public.retencion_iva_id_retencion_iva_seq'::text)::regclass) NOT NULL,
    piva character varying(10),
    pret character varying(10)
);
";      
echo "<font size=1>CREATE SEQUENCE retencion_iva_id_retencion_iva_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

echo "<font size=1>CREATE TABLE retencion_samat (
    fecha date NOT NULL,
    sujeto character varying(80) NOT NULL,
    cedula_rif character varying(30) NOT NULL,
    comprobante character varying(15) NOT NULL,
    fecha_fact character varying(20) NOT NULL,
    nfactura character varying(20),
    ncheque character varying(20),
    tipo_transaccion character varying(500),
    monto_total character varying(30),
    monto_scf character varying(30),
    monto_base character varying(30),
    iva character varying(30),
    monto_retenido character varying(30),
    estado character varying(20),
    piva character varying(10),
    id_retencion_samat integer DEFAULT nextval(('public.retencion_samat_id_retencion_samat_seq'::text)::regclass) NOT NULL
);

";      
echo "<font size=1>CREATE SEQUENCE retencion_samat_id_retencion_samat_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

echo "<font size=1>CREATE TABLE tabla (
    tipo character varying(30) NOT NULL,
    desayuno numeric NOT NULL,
    almuerzo numeric NOT NULL,
    cena numeric NOT NULL,
    alojamiento numeric NOT NULL,
    taxi numeric(11,0) NOT NULL,
    transporte numeric(11,0) NOT NULL,
    tasa numeric(11,0) NOT NULL,
    autobus numeric(11,0) NOT NULL,
    vehiculo numeric(11,0) NOT NULL,
    id_tabla integer DEFAULT nextval(('public.tabla_id_tabla_seq'::text)::regclass) NOT NULL
);
";      
echo "<font size=1>CREATE SEQUENCE tabla_id_tabla_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

echo "<font size=1>CREATE TABLE tareas (
    fecha date,
    operacion text,
    usuario text
);
";      
echo "<font size=1>CREATE TABLE transaccion (
    fecha date,
    hora time with time zone,
    operacion text,
    login text
);
";      
echo "<font size=1>CREATE TABLE usuario (
    cedula_rif character varying(30),
    nombre character varying(150),
    direccion character varying(500),
    telf character varying(15),
    id_usuario integer DEFAULT nextval(('public.usuario_id_usuario_seq'::text)::regclass) NOT NULL,
    tipo character varying(30)
);
";      
echo "<font size=1>CREATE SEQUENCE usuario_id_usuario_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

echo "<font size=1>CREATE TABLE viaticos (
    id_tipo integer NOT NULL,
    cedula character varying(10) NOT NULL,
    motivo character varying(500) NOT NULL,
    fecha_ida character varying(15) NOT NULL,
    fecha_ret character varying(15) NOT NULL,
    dias integer NOT NULL,
    subtotal numeric NOT NULL,
    taxi numeric NOT NULL,
    transporte numeric NOT NULL,
    tasa numeric NOT NULL,
    otra1 numeric NOT NULL,
    otra2 numeric NOT NULL,
    observaciones character varying(1500) NOT NULL,
    total numeric NOT NULL,
    tiempo1 character varying(15) NOT NULL,
    tiempo2 character varying(15) NOT NULL,
    des character varying(15) NOT NULL,
    alm character varying(15) NOT NULL,
    cen character varying(15) NOT NULL,
    alo character varying(15) NOT NULL,
    id_viatico integer DEFAULT nextval(('public.viaticos_id_viatico_seq'::text)::regclass) NOT NULL,
    departamento character varying(80),
    estado character varying(30)
);
";      
echo "<font size=1>CREATE SEQUENCE viaticos_id_viatico_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
</font><br>"; 

$tabla[1]="acceso";
$tabla[2]="acceso_solicitud";
$tabla[3]="asignacion_caja_chica";
$tabla[4]="caja_chica";
$tabla[5]="cheque";
$tabla[6]="configuracion";
$tabla[7]="departamento";
$tabla[8]="despacho";
$tabla[9]="detalle_despacho";
$tabla[10]="distribucion_caja_chica";
$tabla[11]="distribucion_cheque";
$tabla[12]="fondo";
$tabla[13]="ingreso_material";
$tabla[14]="ingresos";
$tabla[15]="material";
$tabla[16]="oficio";
$tabla[17]="ordencs";
$tabla[18]="p_principal";
$tabla[19]="p_secundaria";
$tabla[20]="p_terciaria";
$tabla[21]="retencion_isrl";
$tabla[22]="retencion_iva";
$tabla[23]="retencion_samat";
$tabla[24]="tabla";
$tabla[25]="tareas";
$tabla[26]="detalle_ingreso_material";
$tabla[27]="usuario";
$tabla[28]="viaticos";
$tabla[29]="detalle_despacho";
//$tabla[30]="transaccion";



for($x=1; $x<=30; $x=$x+1)
{
$resulta[$x]=pg_query($con,"SELECT * 
 FROM $tabla[$x]");

////////////////////////////////////////////////////////////////////////////////////////////////////////
//GENERANDO EL SCRIPT DE LOS INSERT

 while ($row = pg_fetch_row($resulta[$x])){  
 $resultb[$x]=pg_query($con,"SELECT * FROM information_schema.columns WHERE table_name =  '$tabla[$x]'");
 $c=0;
 $d=0;
  $campos="";
 $valor="";
 
 while ($arr = pg_fetch_row($resultb[$x])){  
 $c++;
 $d=$c-1;

 if($arr[7]=="integer")
$ap="";
else
$ap="'";

if ($c>1){
$campos=$campos.",".$arr[3];
$valor=$valor.",".$ap.$row[$d].$ap;
 }else{
 $campos=$arr[3];
 $valor=$ap.$row[$d].$ap;
 }
 } 
//echo $valor;

echo "<font size=1>INSERT INTO ";
echo $tabla[$x];

 echo " (".$campos.")";
echo " VALUES";
  echo " (".$valor.");";
echo "</font><br>";         
    }
      
            }
            


?>



 
