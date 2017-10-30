--
-- PostgreSQL database dump
--

-- Started on 2009-04-28 09:10:04 VET

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1761 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1329 (class 1259 OID 16386)
-- Dependencies: 1709 5
-- Name: acceso; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE acceso (
    "login" character varying(30) NOT NULL,
    clave character varying(30) NOT NULL,
    tipo character varying(15) NOT NULL,
    id_acceso integer DEFAULT nextval(('public.acceso_id_acceso_seq'::text)::regclass) NOT NULL,
    nomb_usuario character varying(50)
);


ALTER TABLE public.acceso OWNER TO leonardo;

--
-- TOC entry 1330 (class 1259 OID 16389)
-- Dependencies: 5
-- Name: acceso_id_acceso_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE acceso_id_acceso_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.acceso_id_acceso_seq OWNER TO leonardo;

--
-- TOC entry 1763 (class 0 OID 0)
-- Dependencies: 1330
-- Name: acceso_id_acceso_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('acceso_id_acceso_seq', 9, true);


--
-- TOC entry 1359 (class 1259 OID 16715)
-- Dependencies: 5
-- Name: acceso_id_acceso_solicitud_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE acceso_id_acceso_solicitud_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.acceso_id_acceso_solicitud_seq OWNER TO leonardo;

--
-- TOC entry 1764 (class 0 OID 0)
-- Dependencies: 1359
-- Name: acceso_id_acceso_solicitud_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('acceso_id_acceso_solicitud_seq', 1, false);


--
-- TOC entry 1358 (class 1259 OID 16712)
-- Dependencies: 1722 5
-- Name: acceso_solicitud; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE acceso_solicitud (
    "login" character varying(30) NOT NULL,
    clave character varying(30) NOT NULL,
    cedula character varying(30),
    nombre character varying(150),
    unidad character varying(150) NOT NULL,
    id_acceso_solicitud integer DEFAULT nextval(('public.acceso_id_acceso_solicitud_seq'::text)::regclass) NOT NULL
);


ALTER TABLE public.acceso_solicitud OWNER TO leonardo;

--
-- TOC entry 1361 (class 1259 OID 16730)
-- Dependencies: 1723 5
-- Name: asignacion_caja_chica; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE asignacion_caja_chica (
    fecha date,
    ncheque character varying(15) NOT NULL,
    monto character varying(30) NOT NULL,
    descripcion character varying(150) NOT NULL,
    estado character varying(30) NOT NULL,
    id_asignacion_caja_chica integer DEFAULT nextval(('public.asignacion_caja_chica_id_asignacion_caja_chica_seq'::text)::regclass) NOT NULL,
    disponible character varying(30)
);


ALTER TABLE public.asignacion_caja_chica OWNER TO postgres;

--
-- TOC entry 1360 (class 1259 OID 16728)
-- Dependencies: 5
-- Name: asignacion_caja_chica_id_asignacion_caja_chica_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE asignacion_caja_chica_id_asignacion_caja_chica_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.asignacion_caja_chica_id_asignacion_caja_chica_seq OWNER TO leonardo;

--
-- TOC entry 1765 (class 0 OID 0)
-- Dependencies: 1360
-- Name: asignacion_caja_chica_id_asignacion_caja_chica_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('asignacion_caja_chica_id_asignacion_caja_chica_seq', 2, true);


--
-- TOC entry 1362 (class 1259 OID 24920)
-- Dependencies: 1724 5
-- Name: caja_chica; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE caja_chica (
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


ALTER TABLE public.caja_chica OWNER TO leonardo;

--
-- TOC entry 1364 (class 1259 OID 24929)
-- Dependencies: 5
-- Name: caja_chica_id_caja_chica_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE caja_chica_id_caja_chica_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.caja_chica_id_caja_chica_seq OWNER TO leonardo;

--
-- TOC entry 1766 (class 0 OID 0)
-- Dependencies: 1364
-- Name: caja_chica_id_caja_chica_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('caja_chica_id_caja_chica_seq', 11, true);


--
-- TOC entry 1331 (class 1259 OID 16391)
-- Dependencies: 1710 5
-- Name: cheque; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE cheque (
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


ALTER TABLE public.cheque OWNER TO leonardo;

--
-- TOC entry 1332 (class 1259 OID 16397)
-- Dependencies: 5
-- Name: cheque_id_cheque_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE cheque_id_cheque_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cheque_id_cheque_seq OWNER TO leonardo;

--
-- TOC entry 1767 (class 0 OID 0)
-- Dependencies: 1332
-- Name: cheque_id_cheque_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('cheque_id_cheque_seq', 27, true);


--
-- TOC entry 1333 (class 1259 OID 16399)
-- Dependencies: 1711 5
-- Name: configuracion; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE configuracion (
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
    cargo3 character varying(30)
);


ALTER TABLE public.configuracion OWNER TO leonardo;

--
-- TOC entry 1334 (class 1259 OID 16402)
-- Dependencies: 5
-- Name: configuracion_id_configuracion_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE configuracion_id_configuracion_seq
    START WITH 2
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.configuracion_id_configuracion_seq OWNER TO leonardo;

--
-- TOC entry 1768 (class 0 OID 0)
-- Dependencies: 1334
-- Name: configuracion_id_configuracion_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('configuracion_id_configuracion_seq', 2, false);


--
-- TOC entry 1367 (class 1259 OID 49527)
-- Dependencies: 1726 5
-- Name: departamento; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE departamento (
    nombre_departamento character varying(150) NOT NULL,
    id_departamento integer DEFAULT nextval(('public.departamento_id_departamento_seq'::text)::regclass) NOT NULL,
    responsable character varying(150)
);


ALTER TABLE public.departamento OWNER TO leonardo;

--
-- TOC entry 1372 (class 1259 OID 49541)
-- Dependencies: 5
-- Name: departamento_id_departamento_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE departamento_id_departamento_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.departamento_id_departamento_seq OWNER TO leonardo;

--
-- TOC entry 1769 (class 0 OID 0)
-- Dependencies: 1372
-- Name: departamento_id_departamento_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('departamento_id_departamento_seq', 23, true);


--
-- TOC entry 1369 (class 1259 OID 49533)
-- Dependencies: 1728 5
-- Name: despacho; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE despacho (
    fecha date NOT NULL,
    nombre_entrega character varying(120) NOT NULL,
    id_departamento integer NOT NULL,
    id_despacho integer DEFAULT nextval(('public.despacho_id_despacho_seq'::text)::regclass) NOT NULL,
    estado character varying(30)
);


ALTER TABLE public.despacho OWNER TO leonardo;

--
-- TOC entry 1373 (class 1259 OID 49543)
-- Dependencies: 5
-- Name: despacho_id_despacho_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE despacho_id_despacho_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.despacho_id_despacho_seq OWNER TO leonardo;

--
-- TOC entry 1770 (class 0 OID 0)
-- Dependencies: 1373
-- Name: despacho_id_despacho_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('despacho_id_despacho_seq', 2, true);


--
-- TOC entry 1370 (class 1259 OID 49536)
-- Dependencies: 1729 5
-- Name: detalle_despacho; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE detalle_despacho (
    id_despacho integer NOT NULL,
    id_departamento integer NOT NULL,
    id_material integer NOT NULL,
    presentacion character varying(60) NOT NULL,
    cantidad integer,
    estado character varying(10),
    id_detalle_despacho integer DEFAULT nextval(('public.detalle_id_detalle_despacho_seq'::text)::regclass) NOT NULL
);


ALTER TABLE public.detalle_despacho OWNER TO leonardo;

--
-- TOC entry 1374 (class 1259 OID 49545)
-- Dependencies: 5
-- Name: detalle_id_detalle_despacho_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE detalle_id_detalle_despacho_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.detalle_id_detalle_despacho_seq OWNER TO leonardo;

--
-- TOC entry 1771 (class 0 OID 0)
-- Dependencies: 1374
-- Name: detalle_id_detalle_despacho_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('detalle_id_detalle_despacho_seq', 8, true);


--
-- TOC entry 1377 (class 1259 OID 106945)
-- Dependencies: 1731 5
-- Name: detalle_ordencs; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE detalle_ordencs (
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


ALTER TABLE public.detalle_ordencs OWNER TO leonardo;

--
-- TOC entry 1378 (class 1259 OID 106948)
-- Dependencies: 5
-- Name: detalle_ordencs_id_detalle_ordencs; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE detalle_ordencs_id_detalle_ordencs
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.detalle_ordencs_id_detalle_ordencs OWNER TO leonardo;

--
-- TOC entry 1772 (class 0 OID 0)
-- Dependencies: 1378
-- Name: detalle_ordencs_id_detalle_ordencs; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('detalle_ordencs_id_detalle_ordencs', 1, false);


--
-- TOC entry 1363 (class 1259 OID 24926)
-- Dependencies: 1725 5
-- Name: distribucion_caja_chica; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE distribucion_caja_chica (
    nfactura character varying(15) NOT NULL,
    cod_partida character varying(60) NOT NULL,
    monto_factura character varying(30),
    programa character varying(150) NOT NULL,
    id_distribucion_caja_chica integer DEFAULT nextval(('public.distribucion_caja_chica_id_distribucion_caja_chica_seq'::text)::regclass) NOT NULL,
    estado character varying(25),
    fecha character varying(15),
    id_asignacion_caja_chica character varying(10),
    id_caja_chica character varying(30)
);


ALTER TABLE public.distribucion_caja_chica OWNER TO leonardo;

--
-- TOC entry 1365 (class 1259 OID 24931)
-- Dependencies: 5
-- Name: distribucion_caja_chica_id_distribucion_caja_chica_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE distribucion_caja_chica_id_distribucion_caja_chica_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.distribucion_caja_chica_id_distribucion_caja_chica_seq OWNER TO leonardo;

--
-- TOC entry 1773 (class 0 OID 0)
-- Dependencies: 1365
-- Name: distribucion_caja_chica_id_distribucion_caja_chica_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('distribucion_caja_chica_id_distribucion_caja_chica_seq', 13, true);


--
-- TOC entry 1335 (class 1259 OID 16404)
-- Dependencies: 1712 5
-- Name: distribucion_cheque; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE distribucion_cheque (
    fecha date NOT NULL,
    ncheque character varying(15) NOT NULL,
    cod_partida character varying(60) NOT NULL,
    monto character varying(30),
    programa character varying(150) NOT NULL,
    cod_contable character varying(20) NOT NULL,
    id_distribucion integer DEFAULT nextval(('public.distribucion_cheque_id_distribucion_seq'::text)::regclass) NOT NULL,
    estado character varying(25),
    tipo_f character varying(30)
);


ALTER TABLE public.distribucion_cheque OWNER TO leonardo;

--
-- TOC entry 1336 (class 1259 OID 16407)
-- Dependencies: 5
-- Name: distribucion_cheque_id_distribucion_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE distribucion_cheque_id_distribucion_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.distribucion_cheque_id_distribucion_seq OWNER TO leonardo;

--
-- TOC entry 1774 (class 0 OID 0)
-- Dependencies: 1336
-- Name: distribucion_cheque_id_distribucion_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('distribucion_cheque_id_distribucion_seq', 54, true);


--
-- TOC entry 1337 (class 1259 OID 16409)
-- Dependencies: 1713 5
-- Name: ingresos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ingresos (
    fecha date NOT NULL,
    codigo character varying(15),
    beneficiario character varying(120) NOT NULL,
    concepto character varying(1500) NOT NULL,
    monto character varying(10),
    id_ingresos integer DEFAULT nextval(('public.ingresos_id_ingresos_seq'::text)::regclass) NOT NULL,
    tipo_f character varying(30)
);


ALTER TABLE public.ingresos OWNER TO postgres;

--
-- TOC entry 1338 (class 1259 OID 16415)
-- Dependencies: 5
-- Name: ingresos_id_ingresos_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE ingresos_id_ingresos_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.ingresos_id_ingresos_seq OWNER TO leonardo;

--
-- TOC entry 1775 (class 0 OID 0)
-- Dependencies: 1338
-- Name: ingresos_id_ingresos_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('ingresos_id_ingresos_seq', 2, true);


--
-- TOC entry 1368 (class 1259 OID 49530)
-- Dependencies: 1727 5
-- Name: material; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE material (
    cod_partida character varying(60),
    descripcion character varying(120) NOT NULL,
    presentacion character varying(60) NOT NULL,
    existencia integer,
    estado character varying(10),
    id_material integer DEFAULT nextval(('public.material_id_material_seq'::text)::regclass) NOT NULL
);


ALTER TABLE public.material OWNER TO leonardo;

--
-- TOC entry 1371 (class 1259 OID 49539)
-- Dependencies: 5
-- Name: material_id_material_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE material_id_material_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.material_id_material_seq OWNER TO leonardo;

--
-- TOC entry 1776 (class 0 OID 0)
-- Dependencies: 1371
-- Name: material_id_material_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('material_id_material_seq', 140, true);


--
-- TOC entry 1339 (class 1259 OID 16417)
-- Dependencies: 5
-- Name: numero_id_numero_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE numero_id_numero_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.numero_id_numero_seq OWNER TO leonardo;

--
-- TOC entry 1777 (class 0 OID 0)
-- Dependencies: 1339
-- Name: numero_id_numero_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('numero_id_numero_seq', 1, false);


--
-- TOC entry 1353 (class 1259 OID 16463)
-- Dependencies: 5
-- Name: oficio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oficio (
    id_oficio integer NOT NULL,
    para character varying(100) NOT NULL,
    dest character varying(100) NOT NULL,
    de character varying(100) NOT NULL,
    rem character varying(100) NOT NULL,
    pie character varying(255) NOT NULL
);


ALTER TABLE public.oficio OWNER TO postgres;

--
-- TOC entry 1375 (class 1259 OID 106937)
-- Dependencies: 1730 5
-- Name: ordencs; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE ordencs (
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


ALTER TABLE public.ordencs OWNER TO leonardo;

--
-- TOC entry 1376 (class 1259 OID 106943)
-- Dependencies: 5
-- Name: ordencs_id_ordencs_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE ordencs_id_ordencs_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.ordencs_id_ordencs_seq OWNER TO leonardo;

--
-- TOC entry 1778 (class 0 OID 0)
-- Dependencies: 1376
-- Name: ordencs_id_ordencs_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('ordencs_id_ordencs_seq', 1, false);


--
-- TOC entry 1340 (class 1259 OID 16419)
-- Dependencies: 1714 5
-- Name: p_principal; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE p_principal (
    codigo character varying(30) NOT NULL,
    descripcion character varying(150) NOT NULL,
    monto_asig real,
    monto_ejec real,
    id_p_principal integer DEFAULT nextval(('public.p_principal_id_p_principal_seq'::text)::regclass) NOT NULL
);


ALTER TABLE public.p_principal OWNER TO leonardo;

--
-- TOC entry 1341 (class 1259 OID 16422)
-- Dependencies: 5
-- Name: p_principal_id_p_principal_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE p_principal_id_p_principal_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.p_principal_id_p_principal_seq OWNER TO leonardo;

--
-- TOC entry 1779 (class 0 OID 0)
-- Dependencies: 1341
-- Name: p_principal_id_p_principal_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('p_principal_id_p_principal_seq', 1, false);


--
-- TOC entry 1342 (class 1259 OID 16424)
-- Dependencies: 1715 5
-- Name: p_secundaria; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE p_secundaria (
    codigo_s character varying(30) NOT NULL,
    codigo_p character varying(30) NOT NULL,
    descripcion character varying(150) NOT NULL,
    monto_asig real,
    monto_ejec real,
    id_p_secundaria integer DEFAULT nextval(('public.p_secundaria_id_p_secundaria_seq'::text)::regclass) NOT NULL
);


ALTER TABLE public.p_secundaria OWNER TO leonardo;

--
-- TOC entry 1343 (class 1259 OID 16427)
-- Dependencies: 5
-- Name: p_secundaria_id_p_secundaria_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE p_secundaria_id_p_secundaria_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.p_secundaria_id_p_secundaria_seq OWNER TO leonardo;

--
-- TOC entry 1780 (class 0 OID 0)
-- Dependencies: 1343
-- Name: p_secundaria_id_p_secundaria_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('p_secundaria_id_p_secundaria_seq', 1, false);


--
-- TOC entry 1344 (class 1259 OID 16429)
-- Dependencies: 1716 5
-- Name: p_terciaria; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE p_terciaria (
    codigo_t character varying(30) NOT NULL,
    descripcion character varying(150) NOT NULL,
    asig_anual character varying(30),
    asig_mensual character varying(30),
    id_p_terciaria integer DEFAULT nextval(('public.p_terciaria_id_p_terciaria_seq'::text)::regclass) NOT NULL
);


ALTER TABLE public.p_terciaria OWNER TO leonardo;

--
-- TOC entry 1345 (class 1259 OID 16432)
-- Dependencies: 5
-- Name: p_terciaria_id_p_terciaria_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE p_terciaria_id_p_terciaria_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.p_terciaria_id_p_terciaria_seq OWNER TO leonardo;

--
-- TOC entry 1781 (class 0 OID 0)
-- Dependencies: 1345
-- Name: p_terciaria_id_p_terciaria_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('p_terciaria_id_p_terciaria_seq', 50, true);


--
-- TOC entry 1346 (class 1259 OID 16434)
-- Dependencies: 1717 5
-- Name: retencion_isrl; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE retencion_isrl (
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


ALTER TABLE public.retencion_isrl OWNER TO leonardo;

--
-- TOC entry 1347 (class 1259 OID 16440)
-- Dependencies: 5
-- Name: retencion_isrl_id_retencion_isrl_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE retencion_isrl_id_retencion_isrl_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.retencion_isrl_id_retencion_isrl_seq OWNER TO leonardo;

--
-- TOC entry 1782 (class 0 OID 0)
-- Dependencies: 1347
-- Name: retencion_isrl_id_retencion_isrl_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('retencion_isrl_id_retencion_isrl_seq', 3, true);


--
-- TOC entry 1348 (class 1259 OID 16442)
-- Dependencies: 1718 5
-- Name: retencion_iva; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE retencion_iva (
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


ALTER TABLE public.retencion_iva OWNER TO postgres;

--
-- TOC entry 1349 (class 1259 OID 16448)
-- Dependencies: 5
-- Name: retencion_iva_id_retencion_iva_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE retencion_iva_id_retencion_iva_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.retencion_iva_id_retencion_iva_seq OWNER TO leonardo;

--
-- TOC entry 1783 (class 0 OID 0)
-- Dependencies: 1349
-- Name: retencion_iva_id_retencion_iva_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('retencion_iva_id_retencion_iva_seq', 10, true);


--
-- TOC entry 1354 (class 1259 OID 16468)
-- Dependencies: 1720 5
-- Name: tabla; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tabla (
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


ALTER TABLE public.tabla OWNER TO postgres;

--
-- TOC entry 1355 (class 1259 OID 16474)
-- Dependencies: 5
-- Name: tabla_id_tabla_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tabla_id_tabla_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tabla_id_tabla_seq OWNER TO postgres;

--
-- TOC entry 1784 (class 0 OID 0)
-- Dependencies: 1355
-- Name: tabla_id_tabla_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tabla_id_tabla_seq', 6, true);


--
-- TOC entry 1366 (class 1259 OID 33145)
-- Dependencies: 5
-- Name: tareas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tareas (
    fecha date,
    operacion text,
    usuario text
);


ALTER TABLE public.tareas OWNER TO postgres;

--
-- TOC entry 1350 (class 1259 OID 16450)
-- Dependencies: 5
-- Name: transaccion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE transaccion (
    fecha date,
    hora time with time zone,
    operacion text,
    "login" text
);


ALTER TABLE public.transaccion OWNER TO postgres;

--
-- TOC entry 1351 (class 1259 OID 16455)
-- Dependencies: 1719 5
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    cedula_rif character varying(30),
    nombre character varying(150),
    direccion character varying(500),
    telf character varying(15),
    id_usuario integer DEFAULT nextval(('public.usuario_id_usuario_seq'::text)::regclass) NOT NULL,
    tipo character varying(30)
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 1352 (class 1259 OID 16461)
-- Dependencies: 5
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE usuario_id_usuario_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_usuario_seq OWNER TO leonardo;

--
-- TOC entry 1785 (class 0 OID 0)
-- Dependencies: 1352
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 151, true);


--
-- TOC entry 1357 (class 1259 OID 16491)
-- Dependencies: 1721 5
-- Name: viaticos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE viaticos (
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


ALTER TABLE public.viaticos OWNER TO postgres;

--
-- TOC entry 1356 (class 1259 OID 16487)
-- Dependencies: 5
-- Name: viaticos_id_viatico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE viaticos_id_viatico_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.viaticos_id_viatico_seq OWNER TO postgres;

--
-- TOC entry 1786 (class 0 OID 0)
-- Dependencies: 1356
-- Name: viaticos_id_viatico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('viaticos_id_viatico_seq', 9, true);


--
-- TOC entry 1732 (class 0 OID 16386)
-- Dependencies: 1329
-- Data for Name: acceso; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO acceso ("login", clave, tipo, id_acceso, nomb_usuario) VALUES ('leonardo', '15796044', 'A', 2, 'LEONARDO MATOS');
INSERT INTO acceso ("login", clave, tipo, id_acceso, nomb_usuario) VALUES ('naili', 'ubvsbp2008', 'A', 5, 'NAILI SIMANCAS');
INSERT INTO acceso ("login", clave, tipo, id_acceso, nomb_usuario) VALUES ('administracion', 'administrador', 'U', 1, 'ADMINISTRADOR DE SISTEMA');
INSERT INTO acceso ("login", clave, tipo, id_acceso, nomb_usuario) VALUES ('anato', 'INVALIDADA', 'A', 7, 'DOMINGO ANATO');
INSERT INTO acceso ("login", clave, tipo, id_acceso, nomb_usuario) VALUES ('jenrry', 'jc11021987', 'U', 6, 'JENRRY CACERES');
INSERT INTO acceso ("login", clave, tipo, id_acceso, nomb_usuario) VALUES ('yromi22', '13947741', 'U', 8, 'ROMINA CASTILLO');
INSERT INTO acceso ("login", clave, tipo, id_acceso, nomb_usuario) VALUES ('yelitza', '0205', 'A', 9, 'YELITZA ORTIZ');
INSERT INTO acceso ("login", clave, tipo, id_acceso, nomb_usuario) VALUES ('mariagabriela', '223009', 'A', 4, 'MARIA GABRIELA VIVAS');


--
-- TOC entry 1747 (class 0 OID 16712)
-- Dependencies: 1358
-- Data for Name: acceso_solicitud; Type: TABLE DATA; Schema: public; Owner: leonardo
--



--
-- TOC entry 1748 (class 0 OID 16730)
-- Dependencies: 1361
-- Data for Name: asignacion_caja_chica; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO asignacion_caja_chica (fecha, ncheque, monto, descripcion, estado, id_asignacion_caja_chica, disponible) VALUES ('2009-04-16', '19815220', '3000', '1 REPOSICION DE CAJA CHICA', 'EN EJECUCION', 1, NULL);


--
-- TOC entry 1749 (class 0 OID 24920)
-- Dependencies: 1362
-- Data for Name: caja_chica; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO caja_chica (beneficiario, cedula_rif, nfactura, monto_factura, concepto, programa, id_caja_chica, estado, motivo, fecha_a, fecha, id_asignacion_caja_chica) VALUES ('ASOC. COOP. RICOPY', 'J-29388444-6', '0000909', '90.00', 'RECARGA DE TONER 12A PARA SER UTILIZADO POR LA COORD. DE ADMINISTRACION', 'ADMINISTRACION', 1, 'PAGADO', NULL, NULL, '15-01-09', '1');
INSERT INTO caja_chica (beneficiario, cedula_rif, nfactura, monto_factura, concepto, programa, id_caja_chica, estado, motivo, fecha_a, fecha, id_asignacion_caja_chica) VALUES ('ESTACION DE COMBUSTIBLE LA VILLA REAL C.A', 'J-30163426-8', '09263', '4.00', 'PAGO DE COMBUSTIBLE DEL VEHICULO PLACA A42AB1A, CHOFER MARCOS SANCHEZ, TRASLADO AL MUNICIPIO ANTONIO JOSE DE SUCRE-BARINAS', 'COORD. DE TRANSPORTE', 2, 'PAGADO', NULL, NULL, '06-02-09', '1');
INSERT INTO caja_chica (beneficiario, cedula_rif, nfactura, monto_factura, concepto, programa, id_caja_chica, estado, motivo, fecha_a, fecha, id_asignacion_caja_chica) VALUES ('MULTISERVICIOS LA GRAN PARADA, C.A', 'J-30032583-0', '016592', '2.00', 'PAGO DE COMBUSTIBLE, VEHICULO PLACA A42AB1A, CHOFER MARCOS SANCHEZ, TRASLADO A MUNICIPIO EZEQUIEL ZAMORA-BARINAS', 'COORD. DE TRANSPORTE', 3, 'PAGADO', NULL, NULL, '06-02-09', '1');
INSERT INTO caja_chica (beneficiario, cedula_rif, nfactura, monto_factura, concepto, programa, id_caja_chica, estado, motivo, fecha_a, fecha, id_asignacion_caja_chica) VALUES ('MAKRO COMERCIALIZADORA, S.A', 'J-00319235-0', '130070361191', '72.50', 'COMPRA DE BOLSAS PLASTICAS NEGRAS ARO PARA RECOLECCION DE BASURA 40 KG. 1X40, PARA SER UTILIZADO EN LA SEDE DE BARINAS-PORTUGUESA Y EN LA SEDE DEL PFG AGROECOLOGIA', 'SERVICIOS GENERALES', 4, 'PAGADO', NULL, NULL, '05-02-09', '1');
INSERT INTO caja_chica (beneficiario, cedula_rif, nfactura, monto_factura, concepto, programa, id_caja_chica, estado, motivo, fecha_a, fecha, id_asignacion_caja_chica) VALUES ('FERRE MEGA C.A.', 'J-31291923-0', '00002863', '84.55', 'COMPRA DE MATERIAL DE FERRETERIA PARA ARREGLO DE BAÑO DE DAMAS SEDE BARINAS-PORTUGUESA.', 'SERVICIOS GENERALES', 6, 'PAGADO', NULL, NULL, '11-02-09', '1');
INSERT INTO caja_chica (beneficiario, cedula_rif, nfactura, monto_factura, concepto, programa, id_caja_chica, estado, motivo, fecha_a, fecha, id_asignacion_caja_chica) VALUES ('ASOC. COOP. TURISCAMBA 591', 'J-31381105-0', '0463', '400.00', 'COMPRA DE CORONA(ARO GRANDE) CON MOTIVO DE LA CONMEMORACION DEL 149° ANIVERSARIO DE LA MUERTE DEL GENRAL DEL PUEBLO SOBERANO Y VALIENTE CIUDADANO"EZEQUIEL ZAMORA"', 'ADMINISTRACION', 5, 'PAGADO', NULL, NULL, '10-01-09', '1');
INSERT INTO caja_chica (beneficiario, cedula_rif, nfactura, monto_factura, concepto, programa, id_caja_chica, estado, motivo, fecha_a, fecha, id_asignacion_caja_chica) VALUES ('VIVERES Y QUINCALLERIA DE CASA, C.A', 'J-30894600-1', '00003584', '548.10', 'COMPRA DE MATERIAL E IMPLEMENTOS DE LIMPIEZA: ESCOBILLON,CHUPON, BOLSAS NEGRAS, CLORO, DESINFECTANTE, PRIDE. LIMP. POCETA, MOPAS, PAÑOS AMARILLOS, CEPILLOS, RASTRILLO, PARA SER USADO EN LA SEDE BARINAS-PORTUGUESA Y PFG AGROECOLOGIA', 'SERVICIOS GENERALES', 7, 'PAGADO', NULL, NULL, '11-02-09', '1');
INSERT INTO caja_chica (beneficiario, cedula_rif, nfactura, monto_factura, concepto, programa, id_caja_chica, estado, motivo, fecha_a, fecha, id_asignacion_caja_chica) VALUES ('LA CASA DEL VENTILADOR', 'V-0961690-4', '00000112', '150.00', 'PAGO DE ADAPTACÍON DE ROLINERAS A MOTOR DE VENTILADOR DE AIRE GRIS FASCO MOD D-711', 'SERVICIOS GENERALES', 8, 'PAGADO', NULL, NULL, '18-02-09', '1');
INSERT INTO caja_chica (beneficiario, cedula_rif, nfactura, monto_factura, concepto, programa, id_caja_chica, estado, motivo, fecha_a, fecha, id_asignacion_caja_chica) VALUES ('ASOC. COOP. RICOPY R.L.', 'J-29388444-6', '0001026', '24.00', 'RECARGA DE CARTUCHO HP N°21 Y 22, PARA SER UTILIZADO POR LA COORD. DE ADMINISTRACION', 'ADMINISTRACION', 9, 'PAGADO', NULL, NULL, '18-02-09', '1');
INSERT INTO caja_chica (beneficiario, cedula_rif, nfactura, monto_factura, concepto, programa, id_caja_chica, estado, motivo, fecha_a, fecha, id_asignacion_caja_chica) VALUES ('ESTACION DE COMBUSTIBLE LA VILLA REAL C.A.', 'J-3016342-6', '00001613', '5.00', 'PAGO DE COMBUSTIBLE, TRASLADO AL MUNICIPIO EZEQUIEL ZAMORA, PARA REALIZAR INVENTARIO DE BIENES EN ALDEA UNIVERSITARIA PADRE NOGUERA, CHOFER DUILIO LOZADA', 'COORD. DE TRANSPORTE', 10, 'PAGADO', NULL, NULL, '27-02-09', '1');
INSERT INTO caja_chica (beneficiario, cedula_rif, nfactura, monto_factura, concepto, programa, id_caja_chica, estado, motivo, fecha_a, fecha, id_asignacion_caja_chica) VALUES ('ESTACION DE SERVICIO Y RESTAURANT CANAGUA, S.R.L.', 'J-0900502-5', '006502', '2.30', 'PAGO DE COMBUSTIBLE, TRASLADO AL MUNICIPIO EZEQUIEL ZAMORA PARA REALIZAR INVENTARIO DE BIENES, CHOFER DUILIO LOZADA', 'COORD. DE TRANSPORTE', 11, 'PAGADO', NULL, NULL, '27-02-09', '1');


--
-- TOC entry 1733 (class 0 OID 16391)
-- Dependencies: 1331
-- Data for Name: cheque; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-16', '19815220', '3000', 'FRANCISCO JIMENEZ', 'APERTURA DE CAJA CHICA ABRIL 2009.', 'COORDINACION DE ADMINISTRACION', 'BNS-01', 2, 'PAGADO', NULL, NULL, 'V-6384084', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-16', '83815221', '600', 'FUNDACION TEATRO ORLANDO ARAUJO', 'CANCELACION QUE SE LE HACE A LA FUNDACION TEATRO ORLANDO ARAUJO, POR CONCEPTO DE ALQUILER DE SALA CON ILUMINACION DE SONIDO CON MOTIVO DE ESTAR CELEBRANDO EL 4TO ANIVERSARIO DE LA SEDE BARINAS PORTUGUESA, EL CUAL SE REALIZARA EL DIA LUNES 20 DE ABRIL DEL 2009, EN LA CIUDAD DE BARINAS. CON CARGO AL FONDO MESUAL.', 'COORDINACION DE ADMINISTRACION', 'BNS-02', 3, 'PAGADO', NULL, NULL, '00', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '98815224', '586', 'LINOSKA RODRIGUEZ', 'CANCELACION QUE SE LA HACE A LA T.S.U. LINOSKA RODRIGUEZ, TITULAR DE LA C.I. Nº V-16.634.218, ASISTENTE DE LABORATORIO DE INFORMATICA DE LA UBV SEDE BARINAS, POR ASISTENCIA AL CURSO DE MOODLE PARA PERFIL DE ADIMINISTARDORES Y TECNICOS REALIZADO EN LA UBV SEDE LOS CHAGUARAMOS DEL 27/01 AL 30/01/2009. CON CARGO AL FONDO DE AVANCE. ', 'COORDINACION DE INFORMATICA', 'BNS-05', 6, 'PAGADO', NULL, NULL, 'V-16634218', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '78815223', '586', 'LINOSKA RODRIGUEZ', 'CANCELACION QUE SE LA HACE A LA T.S.U. LINOSKA RODRIGUEZ, TITULAR DE LA C.I. Nº V-16.634.218, ASISTENTE DE LABORATORIO DE INFORMATICA DE LA UBV SEDE BARINAS, POR ASISTENCIA AL CURSO DE MOODLE PARA PERFIL DE ADIMINISTARDORES Y TECNICOS REALIZADO EN LA UBV SEDE LOS CHAGUARAMOS DEL 27/01 AL 30/01/2009. CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE INFORMATICA', 'BNS-04', 5, 'ANULADO', 'POR ERROR DE IMPRESION', '2009-04-24', 'V-16634218', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '62815225', '268', 'NAILI SIMANCAS ', 'CANCELACION QUE SE LE HACE A LA LCDA. NAILI SIMANCAS, C.I. V-9.987.655, ADMINISTRADORA DE LA UBV SEDE BARINAS, POR ASISTENCIA A LA OFICINA DE CAJA DE AHORROS DE LOS TRABAJADORES DE LA UNIVERSIDAD BOLIVARIANA DE VENEZUELA (UBV LOS CHAGUARAMOS) EL DIA 10/02/2009,  PARA REALIZAR ENTREGA DEL LIBRO DE ACTAS DE LA ASAMBLEA PARCIAL EXTRAORDINARIA REALIZADA EL 06/02/2009 EN LA SEDE BARINAS. CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE ADMINISTRACION', 'BNS-06', 7, 'PAGADO', NULL, NULL, 'V-9987655', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '82815226', '224', 'FELIX VITRIAGO', 'CANCELACION QUE SE LE HACE AL T.S.U. FELIX VITRIAGO, TITULAR DE LA C.I. V-8.132.701, ASISTENTE ADMINISTRATIVO DE LA UBV SEDE BARINAS, PARA ASISTIR A LA UBV CARACAS DEL 19/01/2009 AL 21/01/2009 A LA COORDINACION NACIONAL DE SERVICIOS ESTUDIANTILES A UNA REUNION CON LA LCDA. JACQUELINE ROMERO. CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE TRANSPORTE', 'BNS-07', 8, 'PAGADO', NULL, NULL, 'V-8132701', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '57815227', '220', 'MARCOS SANCHEZ', 'CANCELACION QUE SE LE HACE AL SR. MARCOS SANCHEZ, TITULAR DE LA C.I. V-4.383.047, CHOFER DE LA UBV SEDE BARINAS, POR TRASALDO DE PERSONAL ADMINISTRATIVO A LA UBV LOS CHAGUARAMOS DEL 17/02/2009 AL 19/02/2009. CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE TRANSPORTE', 'BNS-08', 9, 'PAGADO', NULL, NULL, 'V-4383047', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '77815228', '220', 'MARCOS SANCHEZ', 'CANCELACION QUE SE LE HACE AL CIUDADANO MARCOS SANCHEZ, TITULAR DE LA C.I.V-4.383.047, CHOFER DE LA UBV SEDE BARINAS, POR TRASLADO DE PERSONAL ADMINISTRATIVO A LA UBV CARACAS DEL 19/01/2009 AL 21/01/2009 A LA COORDINACION NACIONAL DE SERVICIOS ESTUDIANTILES.CON CARGO AL FONDO DE AVANCE. ', 'COORDINACION DE TRANSPORTE', 'BNS-09', 10, 'PAGADO', NULL, NULL, 'V-4383047', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '41815229', '224', 'FRANCISCO LOPEZ', 'CANCELACION QUE SE LE HACE AL ING. FRANCISCO LOPEZ, TITULAR DE LA C.I. V-1.988.874, COORDINADOR GENERAL DE LA UBV SEDE BARINAS, POR ASISTENCIA A LA UBV LOS CHAGUARAMOS DEL 17/02/2009 AL 19/02/2009, A UNA REUNION DE TRABAJOCON LA CIUDADANA RECTORA DRA. MARLENE CORDOVA.CON CARGO AL FONDO DE AVANCE.', 'COORDINACION REGIONAL', 'BNS-010', 11, 'PAGADO', NULL, NULL, 'V-1988874', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '65815230', '586', 'JUAN HERNANDEZ', 'TRASLADO DEL SR. JUAN HERNADEZ TITULAR DE LA CEDULA DE IDENTIDAD V-12.509.151, SUPERVISOR DE PROTECCION DE LA UBV SEDE BARINAS,A LA UBV LOS CHAGUARAMOS DEL 27/01/2009 AL 30/01/2009 CON LA FINALIDAD DE SOLVENTAR SITUACION LABORAL DE LOS TRABAJADORES DEL DPTO DE SEGURIDAD DE ESTA SEDE. CON CARGO AL FONDO DE AVANCE.', 'DEPARTAMENTO DE SEGURIDAD', 'BNS-011', 12, 'PAGADO', NULL, NULL, 'V-12509151', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '30815231', '126', 'DUILIO LOZADA', 'CANCELACION QUE SE LE HACE AL SR. DUILIO LOZADA, TITULAR DE LA C.I. V-9.326.804, POR TRASLADARSE A LA UBV CARACAS LOS DIAS 18 Y 19 DE ABRIL DE 2.009, PARA LLEVAR A UN GRUPO DE ESTUDIANTES DE UBV LOS CHAGUARAMOS. CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE TRANSPORTE', 'BNS-012', 13, 'PAGADO', NULL, NULL, '9326804', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '50815232', '126', 'MARCOS SANCHEZ', 'CANCELACION QUE SE LE HACE AL SR. MARCOS SANCHEZ, TITULAR DE LA C.I. V-4.383.047, CHOFER DE LA UBV SEDE BARINAS, POR TRASLDO A LA UBV CARACAS, LOS DIAS 12 Y 13 DE ABRIL DEL 2.009, PARA BUSCAR A UN GRUPO DE ESTUDIANTES DE LA SEDE LOS CHAGUARAMOS. CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE TRANSPORTE', 'BNS-013', 14, 'PAGADO', NULL, NULL, 'V-4383047', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '24815233', '126', 'ESTEBAN PEREZ', 'CANCELACION QUE SE LE HACE AL SR. ESTEBAN PEREZ, TITULAR DE LA C.I. V-10.052.857, POR TRASLADARSE A LA UBV CARACAS LOS DIAS 12 Y 13 DE ABRIL DE 2.009, PARA BUSCAR A UN GRUPO DE ESTUDIANTES DE UBV LOS CHAGUARAMOS. CON CARGO AL FONDO DE AVANCE. ', 'COORDINACION DE TRANSPORTE', 'BNS-014', 15, 'PAGADO', NULL, NULL, 'V-10052857', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '44815234', '312', 'ESTEBAN PEREZ', 'CANCELACION QUE SE LE HACE AL SR. ESTEBAN PEREZ, TITULAR DE LA C.I. V-10.052.857, CHOFER DE LA UBV SEDE BARINAS, POR TRASLADO DE TRES PROFESORES A LA UBV CARACAS, LOS DIAS 25,26 Y 27 DE MARZO DE 2.009. CON CARGO AL FONDO DE AVANCE. ', 'COORDINACION DE TRANSPORTE', 'BNS-015', 16, 'PAGADO', NULL, NULL, 'V-10052857', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '19815235', '224', 'LEDYS JIMENEZ ', 'ASISTENCIA DE LA PROF. LEDYS JIMENEZ TITULAR DE LA CEDULA DE IDENTIDAD V-14.662.447 COORDINADORA ACADEMICA DE UBV BARINAS, A UNA REUNION DE TRABAJO CON LA CIUDADANA RECTORA MARLENE YADIRA CORDOVA EN UBV LOS CHAGUARAMOS LOS DIAS 18 Y 19 DE FEBRERO DE 2009. CON CARGO AL FONDO DE AVANCE.', 'COORDINACION ACADEMICA', 'BNS-016', 17, 'PAGADO', NULL, NULL, 'V-14662447', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '39815236', '318', 'LEDYS JIMENEZ ', 'CANCELACION A LA PROFESORA LEDYS JIMENEZ TITULAR DE LA CEDULA DE IDENTIDAD V-14.662.447 COORDINADORA ACADEMICA DE UBV SEDE BARINAS POR ASISTENCIA A UN TALLER NACIONAL DE CENTROS DE ESTUDIOS LOS DIAS 25 Y 26 DE MARZO DE 2009 EN UBV LOS CHAGUARAMOS. CON CARGO AL FONDO DE AVANCE. ', 'COORDINACION ACADEMICA', 'BNS-017', 18, 'PAGADO', NULL, NULL, 'V-14662447', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '03815222', '586', 'BLANCA PEREZ ', 'CANCELACION QUE SE LA HACE A LA T.S.U. BLANCA PEREZ, TITULAR DE LA C.I. Nº V-8.189.876, TECNICO EN RECURSOS INFORMATICOS DE LA UBV SEDE BARINAS, POR ASISTENCIA AL CURSO DE MOODLE PARA PERFIL DE ADIMINISTARDORES Y TECNICOS REALIZADO EN LA UBV SEDE LOS CHAGUARAMOS DEL 27/01 AL 30/01/2009. CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE INFORMATICA', 'BNS-03', 4, 'PAGADO', NULL, NULL, 'V-8189876', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '13815237', '288', 'MIREL VOLCAN', 'CANCELACION QUE SE LE HACE A PROF. MIREL VOLCAN TITULAR DE LA C.I. V-9.986.790, DOCENTE DEL PFG GESTION AMBIENTAL DE LA UBV SEDE BARINAS, POR ASISTENCIA A UNA REUNION DE COMISION DE INGRESOS PROPIOS DE LA UBV EN CARACAS EN REPRESENTACION DE ESTA SEDE . CON CARGO AL FONDO DE AVANCE.', 'PFG GESTION AMBIENTAL', 'BNS-018', 19, 'PAGADO', NULL, NULL, 'V-9986790', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '23815238', '800', 'YELITZA ORTIZ', 'CANCELACION QUE SE LE HACE A LA LCDA YELITZA ORTIZ, TITULAR DE LA C.I. 4.925.151, COORDINADORA DE ADMINISTRACION DE ESTA SEDE BARINAS / PORTUGUESA, POR CONCEPTO DE PAGO DE PAGO DE PASAJE PARA TRASLADARSE A LA SEDE LOS CHAGUARAMOS, Y ASISTIR A REUNION DE TRABAJO CON LA CIUDADANA DIRECTORA GENERAL DE ADMINISTRACION ECON. BAYSE ALFONZO, FECHA 19-03-2009 CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE ADMINISTRACION', 'BNS-019', 20, 'PAGADO', NULL, NULL, 'V-4.925.151', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '08815239', '806.99', 'LEDYS JIMENEZ ', 'CANCELACION QUE SE LE HACE A LA CIUDADANA LCDA.LEDYS JIMENEZ, TITULAR DE LA C.I. 14.662.447, COORDINADORA ACADEMICA DE ESTA SEDE BARINAS / PORTUGUESA, POR CONCEPTO DE ALIMENTOS Y BEBIDAS, CONSUMIDOS EL DIA 24-04-2009 CON MOTIVO DE CELEBRACION DEL 4TO ANIVERSARIO DE ESTA SEDE UBV BARINAS / PORTUGUESA, FACTURAS N 00001987 DEL 24-04-2009, Y 00000180 DEL 20-04-2009. CON CARGO AL FONDO DE AVANCE.', 'COORDINADORA ACADEMICA', 'BNS-020', 21, 'PAGADO', NULL, NULL, 'V-14662447', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '11815240', '1401.40', 'DALCOBA C.R.L.', 'CANCELACION QUE SE LE HACE A LA EMPRESA DALCOBA CRL POR CONCEPTO DE ALQUILER DE LOS MESES: MARZO, ABRIL, Y MAYO, CONDOMINIO DE LOS MESES ENERO-MAYO, DE LAS INSTALACIONES A DONDE FUNCIONA LA SEDE DE GUANARE, SEGUN FACTURAS NRO 4771 DE FECHA 14-04-2009, POR BSF 1276.80 NRO 4772 DE FECHA 14-04-2009 POR BSF 250,00. SEGUN ORDEN DE PAGO NRO 000019,DE FECHA 24-04-2009, SEGUN COMPROBANTE DE RETENCION DEL IVA NRO 20090400000001 DE FECHA 24-04-2009, SEGUN COMPROBANTE DEL ISRL NRO 20090400000001, DE FECHA 24-04-2009, CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE ADMINISTRACION', 'BNS-021', 22, 'PAGADO', NULL, NULL, 'J-08516887-7', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-24', '96815241', '551.05', 'CLARO CLEAN BARINAS, CA', 'CANCELACION QUE SE LE HACE A LA EMPRESA CLARO CLEAN BARINAS CA, POR CONCEPTO DE COMPRA DE PRODUCTOS DE PAPEL Y CARTON UTILIZADOS POR LA COORDINACION DE CONTROL DE ESTUDIOS, SEGUN FACTURA NRO 001993 DE FECHA 17-04-2009 POR BSF 599.20, SEGUN ORDEN DE PAGO NRO 000020 DE FECHA 24-04-2009, Y SEGUN COMPROBANTE DE RETENCION DEL IVA NRO 20090400000002 DE FECHA 24-04-2009, CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE CONTROL  DE ESTUDIOS', 'BNS-022', 23, 'PAGADO', NULL, NULL, 'J-30728979-1', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-27', '16815242', '9996.15', 'TINTA & TONER C.A.', 'CANCELACION QUE SE LE HACE A LA EMPRESA TINTA & TONER CA RIF J-31474312-0, POR CONCEPTO DE COMPRA DE TINTAS, PINTURAS Y COLORANTES, PARA EL USO DE TODAS LAS COORDINACIONES Y DPTOS ADSCRITAS A ESTA SEDE, SEGUN FACTURAS NRO 00000075 DEL 23-04-2009, Y NRO 00000076 DEL 23-04-2009, SEGUN ORDEN DE COMPRA NRO UBVBNS-2009-0004,DEL 24-04-2009, SEGUN RETENCION DEL IVA NRO 20090400000003 DEL 27-04-2009,Y SEGUN ORDEN DE PAGO NRO 0021 DEL 27-04-2009, CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE ADMINISTRACION', 'BNS-023', 24, 'PAGADO', NULL, NULL, 'J-31474312-0', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-27', '81815243', '306.64', 'SUPER CAUCHOS LOS LLANOS, CA', 'CANCELACION QUE SE LE HACE A LA EMPRESA SUPER CAUCHOS LOS LLANOS CA, RIF J 294439098, POR CONCEPTO DE CONSERVACION Y REPARACION DE MEN. Y EQUIP. DE TRANSPORTE DE LA CAMIONETA ASIGNADA A ESTA SEDE BARINAS / PORTUGUESA, SEGUN FACTURA NRO 00000574 DEL 24-04-2009, SEGUN ORDEN DE SERVICIO NRO UBVBNS-00000001, DEL 23-04-2009, SEGUN RETENCION DEL IVA NRO 20090400000004 DEL 27-04-2009, SEGUN RETENCION DEL ISRL NRO 20090400000002 DEL 27-04-2009, CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE TRANSPORTE', 'BNS-024', 25, 'PAGADO', NULL, NULL, 'J-294439098', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-28', '01815244', '709.49', 'INVERSIONES ECA, CA', 'CANCELACION QUE SE LE HACE A LA EMPRESA INVERSIONES ECA CA, TITULAR DEL RIF J-31045357-8, POR CONCEPTO DE COMPRA DE MATERIALES DE UTILES DE LIMPIEZA, PARA EL MANTENIMIENTO DE LAS INSTALACIONES DE LA SEDE BARINAS / PORTUGUESA, SEGUN ORDEN DE COMPRA NRO UBVBNS-2009-0003 DEL 22-04-2009, SEGUN FACTURA NRO 000528 DEL 27-04-2009, SEGUN RETENCION DEL IVA NRO 20090400000005 DEL 28-04-2009, Y SEGUN ORDEN DE PAGO NRO 000023 DEL 28-04-2009. CON CARGO AL FONDO DE AVANCE.', 'SERVICIOS GENERALES', 'BNS-025', 26, 'PAGADO', NULL, NULL, 'J-31045357-8', 'FONDO MENSUAL', NULL);
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f, estado2) VALUES ('2009-04-28', '75815245', '2763.52', 'PAPALERIA TODOEQUIPOS CA', 'CANCELACION QUE SE LE HACE A LA EMPRESA PAPELERIA TODOEQUIPOS CA, TITULAR DEL RIF J-09009544-6, POR CONCEPTO DE COMPRA DE PRODUCTOS DE PAPEL Y CARTON PARA OFICINA, UTILES DE ESCRITORIO, Y OTROS MATERIALES Y SUMINISTROS, PARA LAS DIFERENTES COORDINACIONES Y DEPARTAMENTOS DE LA SEDE BARINAS / PORTUGUESA, SEGUN ORDEN DE COMPRA NRO UBVBNS-2009-0002 DEL 22-04-2009, SEGUN FACTURA NRO 0000125583 DEL 24-04-2009, SEGUN RETENCION DEL IVA NRO 20090400000006 DEL 28-04-2009, Y SEGUN ORDEN DE PAGO NRO 000024 DEL 28-04-2009. CON CARGO AL FONDO DE AVANCE. ', 'COORDINACION DE ADMINISTRACION', 'BNS-026', 27, 'PAGADO', NULL, NULL, 'J-09009544-6', 'FONDO MENSUAL', NULL);


--
-- TOC entry 1734 (class 0 OID 16399)
-- Dependencies: 1333
-- Data for Name: configuracion; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO configuracion (coordinador_sede, coordinador_adm, administrador, cuenta, iva, isrl, id_configuracion, sede, rif, comienzo_anio, custodio_chica, cargo1, cargo2, cargo3) VALUES ('ING. FRANCISCO LOPEZ', 'LCDA. YELITZA ORTIZ', 'LCDA. NAILI SIMANCAS', '0003 0057 88 0001061050', 12, 75, 1, 'BARINAS', 'G-20003773-3', '2009-01-01', 'LICDA. ROMINA CASTILLO', 'COORD. SEDE', 'COORD. ADM.', 'ADMINIST.');


--
-- TOC entry 1752 (class 0 OID 49527)
-- Dependencies: 1367
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('COORDINACION DE CONTROL DE ESTUDIOS', 3, 'ING. YOEL CASTILLO');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('COORDINACION ACADEMICA', 4, 'ABG. ARNULFO QUINTERO');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('COORDINACION DE BIENESTAR ESTUDIANTIL', 5, 'LIC. ABBY OLAECHEA');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('COORDINACION DE PROYECTO Y PASANTIA', 6, 'LIC. ENRIQUE AGUILERA');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('COORDINACION DE INFORMATICA', 7, 'ING. NOEL PERALTA');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('COORDINACION DE SEDE', 8, 'ING. FRANCISCO LOPEZ');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('PFG COMUNICACION SOCIAL', 9, 'LIC. MANUEL MARQUEZ');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('PFG ESTUDIOS JURIDICOS', 10, 'ABG. ARNULFO QUINTERO');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('PFG GESTION AMBIENTAL', 11, 'ING. IRAIDA IZARRA');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('REPRODUCCION', 12, 'EDWARD SANCHEZ');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('OFICINA OPERATIVA PORTUGUESA', 13, 'VILMA QUINTERO');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('TALENTO HUMANO', 14, 'LUIS FLORES');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('GESTION SOCIAL', 15, 'ROSA MATUTE');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('MISION SUCRE', 16, 'CARLOS RAMIREZ');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('COORDINACION DE CULTURA', 17, 'ALFREDO RAMOS');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('PFG AGROECOLOGIA', 18, 'ING. VICTOR PERALTA');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('COORD. DE RELACIONES INTERINSTITUCIONALES', 19, 'LOLYSABEL YANEZ');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('DEPARTAMENTO DE SEGURIDAD', 20, 'JUAN HERNÁNDEZ');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('PROGRAMA NAC. DE FORM. DE EDUC.', 21, 'YOLANDA ESCORCHA');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('COORDINACION DE ADMINISTRACION', 22, 'LCDA. NAILI SIMANCAS');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('COORD. DE TRANSPORTE', 23, 'ALFONSO VITRIAGO');


--
-- TOC entry 1754 (class 0 OID 49533)
-- Dependencies: 1369
-- Data for Name: despacho; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO despacho (fecha, nombre_entrega, id_departamento, id_despacho, estado) VALUES ('2009-04-23', 'JOSE ALVAREZ ', 8, 2, 'DESPACHADO');


--
-- TOC entry 1755 (class 0 OID 49536)
-- Dependencies: 1370
-- Data for Name: detalle_despacho; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO detalle_despacho (id_despacho, id_departamento, id_material, presentacion, cantidad, estado, id_detalle_despacho) VALUES (2, 8, 130, 'UNIDAD', 1, 'DESPACHADO', 2);
INSERT INTO detalle_despacho (id_despacho, id_departamento, id_material, presentacion, cantidad, estado, id_detalle_despacho) VALUES (2, 8, 129, 'UNIDAD', 1, 'DESPACHADO', 3);
INSERT INTO detalle_despacho (id_despacho, id_departamento, id_material, presentacion, cantidad, estado, id_detalle_despacho) VALUES (2, 8, 131, 'UNIDAD', 1, 'DESPACHADO', 4);
INSERT INTO detalle_despacho (id_despacho, id_departamento, id_material, presentacion, cantidad, estado, id_detalle_despacho) VALUES (2, 8, 132, 'UNIDAD', 20, 'DESPACHADO', 5);
INSERT INTO detalle_despacho (id_despacho, id_departamento, id_material, presentacion, cantidad, estado, id_detalle_despacho) VALUES (2, 8, 135, 'UNIDAD', 5, 'DESPACHADO', 6);
INSERT INTO detalle_despacho (id_despacho, id_departamento, id_material, presentacion, cantidad, estado, id_detalle_despacho) VALUES (2, 8, 133, 'UNIDAD', 12, 'DESPACHADO', 7);
INSERT INTO detalle_despacho (id_despacho, id_departamento, id_material, presentacion, cantidad, estado, id_detalle_despacho) VALUES (2, 8, 134, 'UNIDAD', 1, 'DESPACHADO', 8);


--
-- TOC entry 1757 (class 0 OID 106945)
-- Dependencies: 1377
-- Data for Name: detalle_ordencs; Type: TABLE DATA; Schema: public; Owner: leonardo
--



--
-- TOC entry 1750 (class 0 OID 24926)
-- Dependencies: 1363
-- Data for Name: distribucion_caja_chica; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO distribucion_caja_chica (nfactura, cod_partida, monto_factura, programa, id_distribucion_caja_chica, estado, fecha, id_asignacion_caja_chica, id_caja_chica) VALUES ('0000909', '14', '90.00', 'ADMINISTRACION', 3, 'PAGADO', '15-01-09', '1', '1');
INSERT INTO distribucion_caja_chica (nfactura, cod_partida, monto_factura, programa, id_distribucion_caja_chica, estado, fecha, id_asignacion_caja_chica, id_caja_chica) VALUES ('09263', '16', '4.5', 'COORD. DE TRANSPORTE', 4, 'PAGADO', '06-02-09', '1', '2');
INSERT INTO distribucion_caja_chica (nfactura, cod_partida, monto_factura, programa, id_distribucion_caja_chica, estado, fecha, id_asignacion_caja_chica, id_caja_chica) VALUES ('016592', '16', '2.00', 'COORD. DE TRANSPORTE', 5, 'PAGADO', '06-02-09', '1', '3');
INSERT INTO distribucion_caja_chica (nfactura, cod_partida, monto_factura, programa, id_distribucion_caja_chica, estado, fecha, id_asignacion_caja_chica, id_caja_chica) VALUES ('130070361191', '24', '72.50', 'SERVICIOS GENERALES', 6, 'PAGADO', '05-02-09', '1', '4');
INSERT INTO distribucion_caja_chica (nfactura, cod_partida, monto_factura, programa, id_distribucion_caja_chica, estado, fecha, id_asignacion_caja_chica, id_caja_chica) VALUES ('0463', '26', '400', 'ADMINISTRACION', 7, 'PAGADO', '10-01-09', '1', '5');
INSERT INTO distribucion_caja_chica (nfactura, cod_partida, monto_factura, programa, id_distribucion_caja_chica, estado, fecha, id_asignacion_caja_chica, id_caja_chica) VALUES ('00002863', '20', '84.55', 'SERVIICOS GENERALES', 8, 'PAGADO', '11-02-09', '1', '6');
INSERT INTO distribucion_caja_chica (nfactura, cod_partida, monto_factura, programa, id_distribucion_caja_chica, estado, fecha, id_asignacion_caja_chica, id_caja_chica) VALUES ('00003584', '24', '548.10', 'SERVICIOS GENERALES', 9, 'PAGADO', '11-02-09', '1', '7');
INSERT INTO distribucion_caja_chica (nfactura, cod_partida, monto_factura, programa, id_distribucion_caja_chica, estado, fecha, id_asignacion_caja_chica, id_caja_chica) VALUES ('00000112', '22', '150.00', 'SERVICIOS GENERALES', 10, 'PAGADO', '18-02-09', '1', '8');
INSERT INTO distribucion_caja_chica (nfactura, cod_partida, monto_factura, programa, id_distribucion_caja_chica, estado, fecha, id_asignacion_caja_chica, id_caja_chica) VALUES ('0001026', '14', '24.00', 'ADMINISTRACION', 11, 'PAGADO', '18-02-09', '1', '9');
INSERT INTO distribucion_caja_chica (nfactura, cod_partida, monto_factura, programa, id_distribucion_caja_chica, estado, fecha, id_asignacion_caja_chica, id_caja_chica) VALUES ('00001613', '16', '5.00', 'COORD. DE TRANSPORTE', 12, 'PAGADO', '27-02-09', '1', '10');
INSERT INTO distribucion_caja_chica (nfactura, cod_partida, monto_factura, programa, id_distribucion_caja_chica, estado, fecha, id_asignacion_caja_chica, id_caja_chica) VALUES ('006502', '16', '2.30', 'COORD. DE TRANSPORTE', 13, 'PAGADO', '27-02-09', '1', '11');


--
-- TOC entry 1735 (class 0 OID 16404)
-- Dependencies: 1335
-- Data for Name: distribucion_cheque; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-16', '19815220', '0', '3000', 'COORDINACION DE ADMINISTRACION', 'BNS-01', 2, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-16', '83815221', '32', '600', 'COORDINACION DE ADMINISTRACION', 'BNS-02', 3, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '98815224', '42', '586', 'COORDINACION DE INFORMATICA', 'BNS-05', 14, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '78815223', '42', '586', 'COORDINACION DE INFORMATICA', 'BNS-04', 13, 'ANULADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '62815225', '42', '268', 'COORDINACION DE ADMINISTRACION', 'BNS-06', 15, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '82815226', '42', '224', 'COORDINACION DE TRANSPORTE', 'BNS-07', 16, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '57815227', '42', '220', 'COORDINACION DE TRANSPORTE', 'BNS-08', 17, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '77815228', '42', '220', 'COORDINACION DE TRANSPORTE', 'BNS-09', 18, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '41815229', '42', '224', 'COORDINACION REGIONAL', 'BNS-010', 19, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '65815230', '42', '586', 'DEPARTAMENTO DE SEGURIDAD', 'BNS-011', 20, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '30815231', '42', '126', 'COORDINACION DE TRANSPORTE', 'BNS-012', 21, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '50815232', '42', '126', 'COORDINACION DE TRANSPORTE', 'BNS-013', 22, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '24815233', '42', '126', 'COORDINACION DE TRANSPORTE', 'BNS-014', 23, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '44815234', '42', '312', 'COORDINACION DE TRANSPORTE', 'BNS-015', 24, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '19815235', '42', '224', 'COORDINACION ACADEMICA', 'BNS-016', 25, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '39815236', '42', '318', 'COORDINACION ACADEMICA', 'BNS-017', 26, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '03815222', '42', '586', 'COORDINACION DE INFORMATICA', 'BNS-03', 39, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '13815237', '42', '288', 'PFG GESTION AMBIENTAL', 'BNS-018', 41, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '23815238', '42', '800', 'COORDINACION DE ADMINISTRACION', 'BNS-019', 42, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '23815238', '42', '800', 'COORDINACION DE ADMINISTRACION', 'BNS-019', 43, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '08815239', '2', '806.99', 'COORDINADORA ACADEMICA', 'BNS-020', 46, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '11815240', '33', '1401.40', 'COORDINACION DE ADMINISTRACION', 'BNS-021', 47, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-24', '96815241', '9', '551.05', 'COORDINACION DE CONTROL  DE ESTUDIOS', 'BNS-022', 48, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-27', '16815242', '14', '9996.15', 'COORDINACION DE ADMINISTRACION', 'BNS-023', 49, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-27', '81815243', '44', '306.64', 'COORDINACION DE TRANSPORTE', 'BNS-024', 50, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-28', '01815244', '24', '709.49', 'SERVICIOS GENERALES', 'BNS-025', 51, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-28', '75815245', '9', '1965.10', 'COORDINACION DE ADMINISTRACION', 'BNS-026', 52, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-28', '75815245', '25', '468.82', 'COORDINACION DE ADMINISTRACION', 'BNS-026', 53, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2009-04-28', '75815245', '30', '329.60', 'COORDINACION DE ADMINISTRACION', 'BNS-026', 54, 'PAGADO', 'FONDO MENSUAL');


--
-- TOC entry 1736 (class 0 OID 16409)
-- Dependencies: 1337
-- Data for Name: ingresos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ingresos (fecha, codigo, beneficiario, concepto, monto, id_ingresos, tipo_f) VALUES ('2009-04-16', '7689912', 'UBV BARINAS', 'DEPOSITO DE FONDOS', '30000', 1, 'FONDO MENSUAL');
INSERT INTO ingresos (fecha, codigo, beneficiario, concepto, monto, id_ingresos, tipo_f) VALUES ('2009-02-20', '60050745', 'UBV BARINAS', 'DEPOSITO POR ERROR', '2.90', 2, 'FONDO MENSUAL');


--
-- TOC entry 1753 (class 0 OID 49530)
-- Dependencies: 1368
-- Data for Name: material; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('25', 'CINTA DE EMBALAR COLOR CANELA ', 'UNIDAD', 9, 'ACTIVO', 137);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'GANCHOS PARA CARPETAS', 'CAJA', 6, NULL, 53);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'GANCHOS PARA PORTA CARNET', 'UNIDAD', 0, NULL, 54);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'GRAPAS', 'CAJA', 1, NULL, 55);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('9', 'GRAPAS LISAS', 'CAJA', 0, 'ACTIVO', 113);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'GRAPAS PARA ENGRAPADORA INDUSTRIAL', 'CAJA', 4, NULL, 56);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('9', 'HOJAS BLANCAS TAMAÑO OFICIO', 'RESMA', 0, 'ACTIVO', 128);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'HOJAS TAMAÑO CARTA', 'RESMA', 60, NULL, 57);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'IMPRESORA Hp Color Laser Jet 2600 n', 'UNIDAD', 0, NULL, 58);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'IMPRESORA Hp Laser Jet M 1005', 'UNIDAD', 0, NULL, 59);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('24', 'JABON EN POLVO YAREX ', 'UNIDAD', 0, 'ACTIVO', 132);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'KITS DE LIMPIEZA PARA  CARNETIZADORA', 'UNIDAD', 0, NULL, 60);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('13', 'LAMINA DE FOAMY AZUL CARTA ', 'UNIDAD', 0, 'ACTIVO', 120);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('13', 'LAMINA DE FOAMY ROJO CARTA ', 'UNIDAD', 0, 'ACTIVO', 121);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'LAMINAS DE PAPEL BOND', 'UNIDAD', 38, NULL, 61);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'LAMINAS PARA FOTOGRAFIA', 'UNIDAD', 25, NULL, 62);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'LAPICES MONGOL', 'UNIDAD', 12, NULL, 63);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'BLOCK ENCOLADO DE RAYA', 'UNIDAD', 21, NULL, 8);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'BOLÍGRAFOS AZUL', 'UNIDAD', 12, NULL, 9);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'BOLÍGRAFOS NEGROS', 'UNIDAD', 12, NULL, 10);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('24', 'CERA AUTOBRILLANTE EN ENVASE ', 'UNIDAD', 0, 'ACTIVO', 130);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CINTA PLASTICA CELOVEN', 'UNIDAD', 6, NULL, 42);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CINTAS CEBRAS TRUE COLORS CARD PRINTERS', 'CAJA', 0, NULL, 43);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CLIPS MARIPOSA', 'CAJA', 11, NULL, 44);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CLIPS NORMAL', 'CAJA', 13, NULL, 45);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('24', 'CLORO CON ENVASE ', 'UNIDAD', 0, 'ACTIVO', 129);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'COMPUTADORAS PORTATILES', 'UNIDAD', 0, NULL, 46);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CORRECTOR LIQUIDO', 'UNIDAD', 3, NULL, 47);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CUENTA FÁCIL', 'UNIDAD', 1, NULL, 48);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('24', 'DESINFECTANTE EN ENVASE ', 'UNIDAD', 0, 'ACTIVO', 131);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARPETAS AMARILLAS OFICIO', 'UNIDAD', 0, NULL, 18);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARPETAS COLGANTES', 'UNIDAD', 5, NULL, 19);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARPETAS DE 3 AROS DE 2 COLOR BLANCO', 'UNIDAD', 6, NULL, 20);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARPETAS MARRON CARTA', 'UNIDAD', 40, NULL, 21);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARPETAS MARRON OFICIO', 'UNIDAD', 0, NULL, 22);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARPETAS MODERNAS DE FIBRA SIN GANCHO OFICIO', 'UNIDAD', 168, NULL, 23);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'Cartucho Hp LaserJet 49A', 'UNIDAD', 1, NULL, 49);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'ALMOHADILLAS PARA SELLOS', 'UNIDAD', 0, NULL, 5);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'ACORDEON', 'UNIDAD', 0, NULL, 3);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'AGENDAS TELEFÓNICAS', 'UNIDAD', 0, NULL, 4);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('9', 'ARCHICOMODOS', 'UNIDAD', 0, 'ACTIVO', 112);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'ARCHIVADOR TAMAÑO CARTA', 'UNIDAD', 12, NULL, 6);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'BANDAS DE GOMA', 'CAJA', 0, NULL, 7);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'Baterias Energizer AAA', 'UNIDAD', 0, NULL, 13);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'BORRADORES NATA', 'UNIDAD', 2, NULL, 11);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'BORRADORES PARA PIZARRA ACRILICA', 'UNIDAD', 0, NULL, 12);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CAMARAS DIGITALES', 'UNIDAD', 0, NULL, 14);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARGADOR DE BATERIAS AA', 'UNIDAD', 0, NULL, 15);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARGADOR RAPIDO PARA CAMARA DIGITAL', 'UNIDAD', 0, NULL, 16);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARPETAS AMARILLAS CARTA', 'UNIDAD', 300, NULL, 17);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARTELERA DE CORCHO MEDIANA', 'UNIDAD', 0, NULL, 24);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('14', 'Cartucho Hp LaserJet 12A', 'UNIDAD', 2, 'ACTIVO', 116);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARTUCHOS EPSON STYLUS C67 AMARILLO', 'UNIDAD', 9, NULL, 25);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARTUCHOS EPSON STYLUS C67 CIAN', 'UNIDAD', 7, NULL, 26);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARTUCHOS EPSON STYLUS C67 MAGENTA', 'UNIDAD', 8, NULL, 27);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARTUCHOS EPSON STYLUS C67 NEGRO', 'UNIDAD', 0, NULL, 28);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARTUCHOS Hp LaserJet 5500 COLOR AMARILLO', 'UNIDAD', 1, NULL, 33);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARTUCHOS Hp LaserJet 5500 COLOR AZUL', 'UNIDAD', 1, NULL, 34);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARTUCHOS Hp LaserJet 5500 COLOR NEGRO', 'UNIDAD', 1, NULL, 35);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARTUCHOS HP N° 21', 'UNIDAD', 18, NULL, 29);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARTUCHOS HP N° 22', 'UNIDAD', 22, NULL, 30);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARTUCHOS HP N° 92', 'UNIDAD', 0, NULL, 31);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARTUCHOS HP N° 95', 'UNIDAD', 3, NULL, 32);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CD VIRGENES', 'UNIDAD', 0, NULL, 40);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARTUHOS EPSON STYLUS C67 MAGENTA', 'UNIDAD', 0, NULL, 36);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARTUHOS Hp LaserJet 5500 COLOR ROJO', 'UNIDAD', 1, NULL, 37);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARTULINAS  CARTA  BLANCO', 'UNIDAD', 0, NULL, 38);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CARTULINAS CARTA CREMA', 'UNIDAD', 22, NULL, 39);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'CHINCHES', 'CAJA', 1, NULL, 41);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'ENCUADERNADORA', 'UNIDAD', 1, NULL, 50);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'ENGRAPADORAS', 'UNIDAD', 0, NULL, 51);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('30', 'Estambre', 'UNIDAD', 0, 'ACTIVO', 117);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'FUNDAS PARA CD', 'UNIDAD', 38, NULL, 52);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('28', 'LAMPARAS FLUORESCENTES', 'UNIDAD', 0, 'ACTIVO', 123);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'LIBRETA COCIDA GRANDE', 'UNIDAD', 0, NULL, 64);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'LIBRETAS COCIDAS PEQUEÑAS', 'UNIDAD', 0, NULL, 65);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('9', 'LIBRO DE ACTAS DE 500 FOLIOS', 'UNIDAD', 2, 'ACTIVO', 111);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'LIGAS', 'PAQUETE', 0, NULL, 66);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'MAQUINA CARNETIZADORA ZEBRA CARD PRINTER SOLUCIONTS P340 i', 'UNIDAD', 0, NULL, 67);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'MAQUINA DE FAX HYUNDAI  UX-888', 'UNIDAD', 0, NULL, 68);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'MARCADOR ACRILICO COLOR AZUL', 'UNIDAD', 0, NULL, 71);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'MARCADOR  ACRILICO COLOR NEGRO', 'UNIDAD', 7, NULL, 69);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'MARCADOR ACRILICO COLOR  ROJO', 'UNIDAD', 0, NULL, 70);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'MARCADOR ACRILICO VERDE', 'UNIDAD', 0, NULL, 72);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'MARCADORES PUNTA GRUESA ANARANJADO', 'UNIDAD', 0, NULL, 76);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'MARCADOR PUNTA GRUESA  AZUL', 'UNIDAD', 0, NULL, 73);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'MARCADOR PUNTA GRUESA NEGRO', 'UNIDAD', 34, NULL, 74);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'MARCADOR PUNTA GRUESA ROJO', 'UNIDAD', 0, NULL, 75);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'Mini- CD para DVD Phillips', 'UNIDAD', 0, NULL, 77);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('24', 'MOPA NRO 42', 'UNIDAD', 0, 'ACTIVO', 135);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('24', 'MOPA NRO 42', 'UNIDAD', 0, 'ACTIVO', 136);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('24', 'PANOS AMARILLOS GRANDES ', 'UNIDAD', 0, 'ACTIVO', 133);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('9', 'PEGA BLANCA ESCOLAR', 'UNIDAD', 1, 'ACTIVO', 122);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'PEGAMENTO EN BARRA', 'UNIDAD', 3, NULL, 78);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'PERFORADORA DE TRES PUNTOS', 'UNIDAD', 1, NULL, 2);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'PLASTIFICADORA DE OFICINA OFFICE TECH', 'UNIDAD', 1, NULL, 79);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'PORTA CARNET', 'UNIDAD', 0, NULL, 80);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('24', 'PORTA MOPAS ', 'UNIDAD', 0, 'ACTIVO', 134);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'PRIPOR MASTER HQ-40 L', 'UNIDAD', 1, NULL, 81);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'PROTECTORES DE HOJAS', 'UNIDAD', 150, NULL, 82);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'PVC PARA CARNETS', 'UNIDAD', 0, NULL, 83);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'REGLAS PLASTICAS', 'UNIDAD', 0, NULL, 84);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'REGULADOR DE VOLTAJE FORZA POWER 1200-VA', 'UNIDAD', 0, NULL, 85);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'RESALTADORES', 'UNIDAD', 5, NULL, 86);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'ROLLON DE TINTA AZUL', 'UNIDAD', 2, NULL, 88);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'ROLLON DE TINTA MORADO', 'UNIDAD', 1, NULL, 89);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'ROLLON DE TINTA  NEGRO', 'UNIDAD', 0, NULL, 87);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'ROLLOS DE PAPEL PARA FAX', 'UNIDAD', 3, NULL, 90);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'ROLLOS DE PAPEL PARA SUMADORA', 'UNIDAD', 8, NULL, 91);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('30', 'RUEDA DE ALFILERES', 'UNIDAD', 0, 'ACTIVO', 118);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'SACAGRAPAS', 'UNIDAD', 6, NULL, 92);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'SEPARADORES', 'UNIDAD', 0, NULL, 93);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('9', 'SEPARADORES DE 8 DIVSIONES ', 'UNIDAD', 24, 'ACTIVO', 139);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('9', 'SILICON LIQUIDO', 'UNIDAD', 0, 'ACTIVO', 119);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'SILICON LIQUIDO', 'UNIDAD', 1, NULL, 94);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'SOBRES DE CARTA BLANCO', 'UNIDAD', 302, NULL, 95);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'SOBRES MANILA CARTA', 'UNIDAD', 0, NULL, 96);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'SOBRES MANILA OFICIO', 'UNIDAD', 162, NULL, 97);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('9', 'TACOS BLANCOS', 'UNIDAD', 12, 'ACTIVO', 114);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('9', 'TACOS ENGOMADOS', 'UNIDAD', 10, 'ACTIVO', 115);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'TARJETA DIGITAL NOTEBOOK ADAPTER', 'UNIDAD', 0, NULL, 98);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'TIJERAS', 'UNIDAD', 0, NULL, 99);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'TINTA RICOH HQ-40', 'UNIDAD', 0, NULL, 100);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('25', 'TIRRO DE 1 ``', 'UNIDAD', 9, 'ACTIVO', 138);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'TIRRO DE EMBALAR CLARO', 'UNIDAD', 0, NULL, 101);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('14', 'TONER CANON GPR-22', 'UNIDAD', 2, 'ACTIVO', 140);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('14', 'TONER HP 6000A NEGRO', 'UNIDAD', 1, 'ACTIVO', 124);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('14', 'TONER HP 6001A CIANO', 'UNIDAD', 1, 'ACTIVO', 125);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('14', 'TONER HP 6002A YELLOW', 'UNIDAD', 1, 'ACTIVO', 126);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES ('14', 'TONER HP 6003A MAGENTA', 'UNIDAD', 1, 'ACTIVO', 127);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'TONNER CANNON GPR-10', 'UNIDAD', 2, NULL, 102);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'TONNER CANNON NPG-11', 'UNIDAD', 1, NULL, 103);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'TONNER WORKCENTRE M20', 'UNIDAD', 0, NULL, 104);
INSERT INTO material (cod_partida, descripcion, presentacion, existencia, estado, id_material) VALUES (NULL, 'VIDEO CASSETTE RECORDER LG', 'UNIDAD', 4, NULL, 105);


--
-- TOC entry 1744 (class 0 OID 16463)
-- Dependencies: 1353
-- Data for Name: oficio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO oficio (id_oficio, para, dest, de, rem, pie) VALUES (1, 'COORD ADMINISTRACION', 'COORDINADOR', 'PRESUPUESTO', 'COORDINADOR', 'PATRIA SOCIALISMO O MUERTE, VENCEREMOS');


--
-- TOC entry 1756 (class 0 OID 106937)
-- Dependencies: 1375
-- Data for Name: ordencs; Type: TABLE DATA; Schema: public; Owner: leonardo
--



--
-- TOC entry 1737 (class 0 OID 16419)
-- Dependencies: 1340
-- Data for Name: p_principal; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO p_principal (codigo, descripcion, monto_asig, monto_ejec, id_p_principal) VALUES ('2.01.00.00.00', 'Pasivo Circulante', 0, 0, 1);
INSERT INTO p_principal (codigo, descripcion, monto_asig, monto_ejec, id_p_principal) VALUES ('4.02.00.00.00', 'Materiales Suministros', 0, 0, 2);
INSERT INTO p_principal (codigo, descripcion, monto_asig, monto_ejec, id_p_principal) VALUES ('4.03.00.00.00', 'Servicios No Personales', 0, 0, 3);
INSERT INTO p_principal (codigo, descripcion, monto_asig, monto_ejec, id_p_principal) VALUES ('4.04.00.00.00', 'Activos Reales', 0, 0, 4);


--
-- TOC entry 1738 (class 0 OID 16424)
-- Dependencies: 1342
-- Data for Name: p_secundaria; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO p_secundaria (codigo_s, codigo_p, descripcion, monto_asig, monto_ejec, id_p_secundaria) VALUES ('2.01.01.00.00', '2.01.00.00.00', 'Cuentas por Pagar', 0, 0, 1);
INSERT INTO p_secundaria (codigo_s, codigo_p, descripcion, monto_asig, monto_ejec, id_p_secundaria) VALUES ('4.02.01.00.00', '4.02.00.00.00', 'Productos Alimenticios Y Agropecuarios', 0, 0, 2);
INSERT INTO p_secundaria (codigo_s, codigo_p, descripcion, monto_asig, monto_ejec, id_p_secundaria) VALUES ('4.02.03.00.00', '4.02.00.00.00', 'Textiles Y Vestuarios', 0, 0, 3);
INSERT INTO p_secundaria (codigo_s, codigo_p, descripcion, monto_asig, monto_ejec, id_p_secundaria) VALUES ('4.02.05.00.00', '4.02.00.00.00', 'Prod. Papel, Carton E Impresos', 0, 0, 4);
INSERT INTO p_secundaria (codigo_s, codigo_p, descripcion, monto_asig, monto_ejec, id_p_secundaria) VALUES ('4.02.06.00.00', '4.02.00.00.00', 'Productos Quimicos Y Deriv.', 0, 0, 5);
INSERT INTO p_secundaria (codigo_s, codigo_p, descripcion, monto_asig, monto_ejec, id_p_secundaria) VALUES ('4.02.08.00.00', '4.02.00.00.00', 'Productos Metalicos', 0, 0, 6);
INSERT INTO p_secundaria (codigo_s, codigo_p, descripcion, monto_asig, monto_ejec, id_p_secundaria) VALUES ('4.02.10.00.00', '4.02.00.00.00', 'Prod. Varios Y Util. Diversos', 0, 0, 7);
INSERT INTO p_secundaria (codigo_s, codigo_p, descripcion, monto_asig, monto_ejec, id_p_secundaria) VALUES ('4.02.99.00.00', '4.02.00.00.00', 'Otros Mat Y Suminstros', 0, 0, 8);
INSERT INTO p_secundaria (codigo_s, codigo_p, descripcion, monto_asig, monto_ejec, id_p_secundaria) VALUES ('4.03.03.00.00', '4.03.00.00.00', 'Servicios Basicos', 0, 0, 9);
INSERT INTO p_secundaria (codigo_s, codigo_p, descripcion, monto_asig, monto_ejec, id_p_secundaria) VALUES ('4.03.04.00.00', '4.03.00.00.00', 'Serv. Transporte Y Almac.', 0, 0, 10);
INSERT INTO p_secundaria (codigo_s, codigo_p, descripcion, monto_asig, monto_ejec, id_p_secundaria) VALUES ('4.03.05.00.00', '4.03.00.00.00', 'Serv. Infor. Imp. Relac. Publicas', 0, 0, 11);
INSERT INTO p_secundaria (codigo_s, codigo_p, descripcion, monto_asig, monto_ejec, id_p_secundaria) VALUES ('4.03.07.00.00', '4.03.00.00.00', 'Viaticos Y Pasajes', 0, 0, 12);
INSERT INTO p_secundaria (codigo_s, codigo_p, descripcion, monto_asig, monto_ejec, id_p_secundaria) VALUES ('4.03.08.00.00', '4.03.00.00.00', 'Servicios Profesionales Y Tecnicos', 0, 0, 13);
INSERT INTO p_secundaria (codigo_s, codigo_p, descripcion, monto_asig, monto_ejec, id_p_secundaria) VALUES ('4.03.09.00.00', '4.03.00.00.00', 'Conserv. Y Rep. Men. Maq. Y Demas Eq.', 0, 0, 14);
INSERT INTO p_secundaria (codigo_s, codigo_p, descripcion, monto_asig, monto_ejec, id_p_secundaria) VALUES ('4.04.03.00.00', '4.04.00.00.00', 'Maq Y Dmas Eq. De Construccion Cpo Y Talles', 0, 0, 15);
INSERT INTO p_secundaria (codigo_s, codigo_p, descripcion, monto_asig, monto_ejec, id_p_secundaria) VALUES ('4.04.04.00.00', '4.04.00.00.00', 'Eqipos De Transporte, Traccion', 0, 0, 16);


--
-- TOC entry 1739 (class 0 OID 16429)
-- Dependencies: 1344
-- Data for Name: p_terciaria; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('0', 'CAJA CHICA', NULL, NULL, 0);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.07.01.00', 'Publicidad y propaganda', '12000.00', '1000.00', 37);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.07.04.00', 'Avisos', '6000.00', '500.00', 40);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.01.01.00', 'Alimentos y bebidas para personas', '6000.00', '500.00', 2);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.02.05.00', 'Piedra. arcilla. arena y piedra', '480.00', '40.00', 3);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.04.03.00', 'Cauchos y tripas para vehiculos', '3360.00', '280', 6);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.05.03.00', 'Productos de papel y carton  para oficina', '19632.00', '1636', 9);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.05.04.00', 'Libros. revistas y periodicos', '600.00', '50.00', 10);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.05.06.00', 'Prod. de papel y cartton para computacion', '300.00', '25.00', 12);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.05.99.00', 'Otros prod.  de  pulpa . papel y cartton', '1200.00', '100.00', 13);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.06.03.00', 'Tintas. pinturas y colorantes', '6000.00', '500.00', 14);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.06.04.00', 'Productos farmaceuticos y medicamentos', '600.00', '50.00', 15);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.06.06.00', 'Combustibles y lubricantes', '6000.00', '500.00', 16);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.07.04.00', 'Cemento. cal y yeso', '300.00', '25.00', 19);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.07.02.00', 'Vidrios y productos de Vidrio', '1200.00', '100.00', 18);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.08.03.00', 'Herramientas menores, cuchilleria art gen de ferret.', '1200.00', '100.00', 20);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.08.09.00', 'Resp. y accesorios equipo de transporte', '19200.00', '1600.00', 21);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.08.10.00', 'Repuestos y accesorios para otros equipos', '12000.00', '1000', 22);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.10.02.00', 'Materiales y  utiles de limpieza y Aseo', '6000.00', '500', 24);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.10.05.00', 'Utiles  de escritorio. ofic. y mat. de Instrucc.', '6000', '500', 25);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.10.06.00', 'Condecoraciones. y ofrendas similares', '8040', '670', 26);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.99.01.00', 'Otros materiales y suministros', '2400', '200', 30);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.02.02.00', 'Alquiler de equipos de transporte. trac y elev', '600', '50', 31);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.10.99.00', 'Otros servicios profesionales y  tecnicos', '15000', '1250', 43);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.11.02.00', 'Conserv.  y reparac. Men. Equip. Transporte', '30000', '2500', 44);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.10.08.00', 'Materiales para equipos de computacion', '18000', '1500', 27);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.10.11.00', 'Materiales electricos', '3600', '300', 28);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.10.99.00', 'Otros productos y utiles diversos', '2400', '200', 29);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.12.01.00', 'Conserv.  y reparac. de bienes  inmuebles del dominio publico', '18000', '1500', 48);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.99.01.00', 'Otros servicios no profesionales', '6000', '500', 47);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.02.05.00', 'Alq. Equipos cientificos. religiosos. ens y recre.', '600', '50', 32);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.02.06.00', 'Alq. de maq.. muebles y equip. de alojamiento', '12000', '1000', 33);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.04.05.00', 'Servicios de comunicaciones', '1800', '150', 34);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.06.01.00', 'Fletes y embalajes', '360', '30', 35);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.07.02.00', 'Imprenta y reproducciòn', '720', '60', 38);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.08.02.00', 'Comisiones y Gastos Bancarios', '144', '12', 41);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.15.02.00', 'Tasas y otros derechos obligatorios', '264', '22', 50);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.09.01.00', 'Viaticos y pasajes dentro del pais', '132000', '11000', 42);


--
-- TOC entry 1740 (class 0 OID 16434)
-- Dependencies: 1346
-- Data for Name: retencion_isrl; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2009-04-14', 'DALCOBA C.R.L.', 'J-08516887-7', '20090400000001', '11815240', 'Alq. de maq.. muebles y equip. de alojamiento', '1140', '2', '22.8', 'ASIGNADO', 2);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2009-04-27', 'SUPER CAUCHOS LOS LLANOS, CA', 'J-294439098', '20090400000002', '81815243', 'Conserv.  y reparac. Men. Equip. Transporte', '303.60', '2', '6.072', 'ASIGNADO', 3);


--
-- TOC entry 1741 (class 0 OID 16442)
-- Dependencies: 1348
-- Data for Name: retencion_iva; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2009-04-24', 'DALCOBA C.R.L.', 'J-08516887-7', '20090400000001', '14-04-2009', '4772', '001772', '11815240', 'Alq. de maq.. muebles y equip. de alojamiento', '250', '250', '0.00', '0.00', '0.00', 'ASIGNADO', 3, '12', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2009-04-24', 'DALCOBA C.R.L.', 'J-08516887-7', '20090400000001', '14-04-2009', '4771', '001771', '11815240', 'Alq. de maq.. muebles y equip. de alojamiento', '1276.80', '0', '1140.00', '136.80', '102.60', 'ASIGNADO', 2, '12', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2009-04-24', 'CLARO CLEAN BARINAS, CA', 'J-30728979-1', '20090400000002', '17-04-2009', '001993', '00001993', '96815241', 'Productos de papel y carton  para oficina', '599.20', '0', '535.00', '64.20', '48.15', 'ASIGNADO', 4, '12', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2009-04-27', 'TINTA & TONER C.A.', 'J-31474312-0', '20090400000003', '23-04-2009', '00000075', '00001075', '16815242', 'Tintas. pinturas y colorantes', '9548.00', '0', '8525.00', '1023.00', '767.25', 'ASIGNADO', 5, '12', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2009-04-27', 'TINTA & TONER C.A.', 'J-31474312-0', '20090400000003', '23-04-2009', '00000076', '00001076', '16815242', 'Tintas. pinturas y colorantes', '1321.60', '0', '1180.00', '141.60', '106.20', 'ASIGNADO', 6, '12', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2009-04-27', 'SUPER CAUCHOS LOS LLANOS, CA', 'J-294439098', '20090400000004', '24-04-2009', '00000574', '0', '81815243', 'Conserv.  y reparac. Men. Equip. Transporte', '340.03', '0', '303.60', '36.43', '27.32', 'ASIGNADO', 7, '12', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2009-04-28', 'INVERSIONES ECA, CA', 'J-31045357-8', '20090400000005', '27-04-2009', '000528', '000528', '01815244', 'Materiales y  utiles de limpieza y Aseo', '771.48', '0', '688.82', '82.66', '61.99', 'ASIGNADO', 8, '12', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2009-04-28', 'PAPALERIA TODOEQUIPOS CA', 'J-09009544-6', '20090400000006', '24-04-2009', '0000125583', '00-0007710', '75815245', 'Productos de papel y carton  para oficina', '720.14', '0', '642.98', '77.16', '57.87', 'ASIGNADO', 9, '12', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2009-04-28', 'PAPALERIA TODOEQUIPOS CA', 'J-09009544-6', '20090400000006', '27-04-2009', '0000125653', '00-0007784', '75815245', 'Productos de papel y carton  para oficina', '2284.85', '0', '2040.04', '244.81', '183.60', 'ASIGNADO', 10, '12', '75');


--
-- TOC entry 1745 (class 0 OID 16468)
-- Dependencies: 1354
-- Data for Name: tabla; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tabla (tipo, desayuno, almuerzo, cena, alojamiento, taxi, transporte, tasa, autobus, vehiculo, id_tabla) VALUES ('OBREROS', 10, 12, 12, 70, 40, 30, 29, 0, 0, 3);
INSERT INTO tabla (tipo, desayuno, almuerzo, cena, alojamiento, taxi, transporte, tasa, autobus, vehiculo, id_tabla) VALUES ('DOC. Y ADMINIST.', 12, 12, 12, 70, 40, 30, 29, 0, 0, 4);
INSERT INTO tabla (tipo, desayuno, almuerzo, cena, alojamiento, taxi, transporte, tasa, autobus, vehiculo, id_tabla) VALUES ('DIRECTIVOS', 12, 18, 14, 85, 40, 30, 29, 0, 0, 5);
INSERT INTO tabla (tipo, desayuno, almuerzo, cena, alojamiento, taxi, transporte, tasa, autobus, vehiculo, id_tabla) VALUES ('AUTORIDADES', 12, 22, 18, 95, 40, 30, 29, 0, 0, 6);
INSERT INTO tabla (tipo, desayuno, almuerzo, cena, alojamiento, taxi, transporte, tasa, autobus, vehiculo, id_tabla) VALUES ('ESTUDIANTES', 10, 12, 12, 70, 40, 30, 29, 29, 0, 2);


--
-- TOC entry 1751 (class 0 OID 33145)
-- Dependencies: 1366
-- Data for Name: tareas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tareas (fecha, operacion, usuario) VALUES ('2008-10-28', 'CAMBIAR LOS MARGENES DEL CHEQUE Y VOUCHER.....', 'leonardo');
INSERT INTO tareas (fecha, operacion, usuario) VALUES ('2008-10-28', 'REVISAR LA FECHA DEL SISTEMA AL MOMENTO DE IMPRIMIR', 'leonardo');
INSERT INTO tareas (fecha, operacion, usuario) VALUES ('2008-10-28', 'ACTIVAR EL MODULO DE BIENES NACIONALES', 'leonardo');
INSERT INTO tareas (fecha, operacion, usuario) VALUES ('2008-11-17', 'MARGENES:  iz:3,7 Der:4,02 Sup:4,3 Inf:12,78', 'leonardo');
INSERT INTO tareas (fecha, operacion, usuario) VALUES ('2009-03-13', 'ejemplo', 'leonardo');


--
-- TOC entry 1742 (class 0 OID 16450)
-- Dependencies: 1350
-- Data for Name: transaccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-15', '09:48:04-04:30', '-Operacion: Entrar al sistema', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-15', '09:49:08-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '07:54:55-04:30', '-Operacion: Entrar al sistema', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '07:55:32-04:30', '-Operacion: Editar archivo de configuracion -BARINAS', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '08:03:18-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-01-2009 tipo de reporte: 01 Fondo: FONDO MENSUALexportar: 0', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '08:10:01-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '08:13:10-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '08:14:11-04:30', '-Operacion: Editar archivo de configuracion -BARINAS', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '08:14:26-04:30', '-Operacion: Editar archivo de configuracion -BARINAS', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '08:32:40-04:30', '-Agregar Partida Presupuestaria :', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '08:32:48-04:30', '-Operacion: Eliminar p_terciaria: 49', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '08:33:18-04:30', '-Operacion: Eliminar p_terciaria: 49', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '08:47:42-04:30', '-Operacion: Entrar al sistema', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:10:19-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:11:47-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.01.01.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:13:13-04:30', '-Operacion: Eliminar p_terciaria: 4', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:13:33-04:30', '-Operacion: Eliminar p_terciaria: 5', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:13:55-04:30', '-Operacion: Eliminar p_terciaria: 7', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:14:05-04:30', '-Operacion: Eliminar p_terciaria: 8', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:14:20-04:30', '-Operacion: Eliminar p_terciaria: 11', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:14:52-04:30', '-Operacion: Eliminar p_terciaria: 17', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:15:23-04:30', '-Operacion: Eliminar p_terciaria: 23', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:16:11-04:30', '-Operacion: Eliminar p_terciaria: 36', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:16:28-04:30', '-Operacion: Eliminar p_terciaria: 39', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:17:12-04:30', '-Operacion: Eliminar p_terciaria: 45', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:17:28-04:30', '-Operacion: Eliminar p_terciaria: 46', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:18:29-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.02.05.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:18:51-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.04.03.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:19:35-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.05.03.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:20:29-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.05.04.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:21:14-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.05.06.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:21:52-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.05.99.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:22:17-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.06.03.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:23:07-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.06.04.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:24:34-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.06.06.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:25:11-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.07.02.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:29:15-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:39:30-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.07.04.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:40:03-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.08.03.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:40:29-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.08.03.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:40:50-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.08.03.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:43:25-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.08.09.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:43:48-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.08.10.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:44:36-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.10.02.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:45:19-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.10.05.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:46:51-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.10.06.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:47:44-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.10.08.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:52:11-04:30', '-Operacion: Entrar al sistema', 'yelitza');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:52:23-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.10.11.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:53:01-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.10.99.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:53:49-04:30', '-Operacion: Editar archivo de configuracion -BARINAS', 'yelitza');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:54:03-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.02.99.01.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '09:55:11-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.03.02.02.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:00:45-04:30', '-Operacion: Entrar al sistema', 'yelitza');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:06:20-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-01-2009 tipo de reporte: 03 Fondo: 0exportar: 0', 'yelitza');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:06:25-04:30', '-Operacion: Consultar:  desde :01-01-2008 hasta:01-01-2008 tipo de reporte: 03 Fondo: 0exportar: 0', 'yelitza');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:06:29-04:30', '-Operacion: Consultar:  desde :01-01-2008 hasta:01-06-2008 tipo de reporte: 03 Fondo: 0exportar: 0', 'yelitza');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:06:34-04:30', '-Operacion: Consultar:  desde :01-01-2008 hasta:01-06-2008 tipo de reporte: 05 Fondo: 0exportar: 0', 'yelitza');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:27:10-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.03.99.01.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:28:51-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.03.12.01.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:29:20-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.03.99.01.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:30:06-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.03.11.02.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:30:49-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.03.10.99.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:31:34-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.03.09.01.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:34:25-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.03.02.05.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:34:49-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.03.02.06.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:35:10-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.03.04.05.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:35:30-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.03.06.01.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:55:41-04:30', '-Operacion: Entrar al sistema', 'yelitza');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:35:56-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.03.07.02.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:36:21-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.03.08.02.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:48:22-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '13:36:00-04:30', '-Operacion: Consultar:  desde :01-04-2009 hasta:16-04-2009 tipo de reporte: 03 Fondo: 0exportar: 0', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '14:10:33-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:36:56-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.03.11.02.00', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:40:57-04:30', '-Agregar Partida Presupuestaria :', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:42:31-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:45:46-04:30', '-Operacion: Entrar al sistema', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '10:56:57-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '11:02:08-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-01-2009 tipo de reporte: 02 Fondo: 0exportar: 0', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '11:24:41-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '13:32:10-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '13:33:31-04:30', '-Agregar Ingresos :', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '13:33:42-04:30', '-Agregar Ingresos :', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '13:34:06-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-01-2009 tipo de reporte: 03 Fondo: FONDO MENSUALexportar: 0', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '13:34:30-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:16-04-2009 tipo de reporte: 03 Fondo: FONDO MENSUALexportar: 0', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '13:34:48-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:16-04-2009 tipo de reporte: 03 Fondo: FONDO MENSUALexportar: 0', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '13:35:40-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:31-04-2009 tipo de reporte: 03 Fondo: 0exportar: 0', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '14:23:54-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-01-2009 tipo de reporte: 01 Fondo: 0exportar: 0', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '14:24:06-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-01-2009 tipo de reporte: 03 Fondo: 0exportar: 0', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '15:10:14-04:30', '-Operacion: Entrar al sistema', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '15:44:55-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '16:32:06-04:30', '-Operacion: Editar archivo de configuracion -BARINAS', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-17', '08:11:56-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-17', '08:24:37-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-17', '10:33:45-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '13:43:49-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '15:01:36-04:30', '-Operacion: Entrar al sistema', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '15:05:52-04:30', '-Operacion: Agregar -Cheque:  19815220', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '15:17:10-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:16-04-2009 tipo de reporte: 03 Fondo: 0exportar: 0', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '15:30:24-04:30', '-Operacion: Agregar -Cheque:  83815221', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '16:21:03-04:30', '-Operacion: Editar archivo de configuracion -BARINAS', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-17', '09:25:12-04:30', '-Operacion: Editar archivo de configuracion -BARINAS', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-17', '09:25:22-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-04-2009 tipo de reporte: 03 Fondo: 0exportar: 0', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-17', '09:25:27-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-05-2009 tipo de reporte: 03 Fondo: 0exportar: 0', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-16', '15:56:28-04:30', '-Operacion: Entrar al sistema', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-17', '09:22:16-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-09-2009 tipo de reporte: 00 Fondo: 0exportar: 0', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-17', '09:22:23-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-09-2009 tipo de reporte: 03 Fondo: 0exportar: 0', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-17', '09:23:51-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-09-2009 tipo de reporte: 03 Fondo: FONDO MENSUALexportar: 0', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-17', '10:02:17-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-17', '10:02:57-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-17', '14:21:32-04:30', '-Operacion: Entrar al sistema', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-17', '15:08:00-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-17', '16:48:43-04:30', '-Operacion: Entrar al sistema', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-21', '08:16:04-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-21', '08:24:14-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-21', '08:25:16-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: V-10052857', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-21', '08:29:24-04:30', '-Operacion: Modificar -Tabla: Viaticos -Registro ID: 2', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-21', '08:29:33-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 2', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-21', '08:34:36-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: V-10052857', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-21', '08:37:16-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: V-9326804', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-21', '08:37:46-04:30', '-Operacion: Modificar -Tabla: Viaticos -Registro ID: 3', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-21', '08:50:01-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-21', '08:53:26-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: V-4383047', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-21', '14:07:42-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-21', '14:34:30-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-22', '08:01:26-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-22', '08:18:45-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-22', '08:57:28-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-22', '09:00:49-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-22', '15:07:20-04:30', '-Operacion: Entrar al sistema', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-23', '09:11:23-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-23', '09:11:35-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 2', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-23', '09:11:54-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 3', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-23', '09:12:12-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 4', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-23', '09:12:27-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 5', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-23', '14:46:11-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-23', '14:46:58-04:30', '-Operacion: Agregar -MATERIAL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-23', '14:50:42-04:30', '-Operacion: Agregar -MATERIAL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-23', '14:51:14-04:30', '-Operacion: Agregar -MATERIAL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-23', '14:51:52-04:30', '-Operacion: Agregar -MATERIAL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-23', '14:54:06-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-23', '14:54:52-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-23', '14:55:27-04:30', '-Operacion: Agregar -MATERIAL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-23', '14:55:49-04:30', '-Operacion: Agregar -MATERIAL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-23', '14:56:16-04:30', '-Operacion: Agregar -MATERIAL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-23', '15:01:32-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-23', '15:01:52-04:30', '-Operacion: Agregar -MATERIAL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-23', '15:14:44-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: V-12509151', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-23', '15:14:53-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 6', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '07:31:17-04:30', '-Operacion: Entrar al sistema', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '07:37:55-04:30', '-Operacion: Entrar al sistema', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '07:40:21-04:30', '-Operacion: Agregar -Cheque:  03815222', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '07:45:07-04:30', '-Operacion: Entrar al sistema', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '07:46:15-04:30', '-Operacion: Entrar al sistema', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '07:49:44-04:30', '-Operacion: Agregar -Cheque:  78815223', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '07:56:17-04:30', '-Operacion: Agregar -Cheque:  98815224', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '07:57:39-04:30', '-Operacion: Anular -Cheque:  78815223', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '08:06:09-04:30', '-Operacion: Agregar -Cheque:  62815225', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '08:24:39-04:30', '-Operacion: Agregar -Cheque:  82815226', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '08:43:28-04:30', '-Operacion: Entrar al sistema', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '08:45:41-04:30', '-Operacion: Agregar -Cheque:  57815227', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '08:51:27-04:30', '-Operacion: Agregar -Cheque:  77815228', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '08:55:50-04:30', '-Operacion: Agregar -Cheque:  41815229', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '09:09:21-04:30', '-Operacion: Agregar -Cheque:  65815230', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '09:13:46-04:30', '-Operacion: Agregar -Cheque:  30815231', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '09:17:54-04:30', '-Operacion: Agregar -Cheque:  50815232', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '09:21:40-04:30', '-Operacion: Agregar -Cheque:  24815233', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '09:25:40-04:30', '-Operacion: Agregar -Cheque:  44815234', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '10:47:26-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '10:47:34-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 130', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '10:48:00-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '10:56:18-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: V-14662447', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '10:57:27-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 2', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '11:02:43-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: V-14662447', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '11:05:40-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 7', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '11:05:49-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 8', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '11:14:57-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '11:15:08-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 2', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '11:15:32-04:30', '-Operacion: Entrar al sistema', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '11:15:43-04:30', '-Operacion: Modificar -Tabla: Viaticos -Registro ID: 8', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '11:16:40-04:30', '-Operacion: Modificar -Tabla: Viaticos -Registro ID: 8', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '11:16:49-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 8', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '11:18:16-04:30', '-Operacion: Agregar -Cheque:  19815235', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '11:22:01-04:30', '-Operacion: Agregar -Cheque:  39815236', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:36:40-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:36:52-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 5', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:37:40-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 6', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:42:21-04:30', '-Operacion: Modificar -Cheque:  03815222', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:49:58-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '15:48:37-04:30', '-Operacion: Modificar -Cheque:  13815237', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:20:08-04:30', '-Agregar Retencion ISRL: ', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:16:47-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:34:09-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.03.09.01.00', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:34:26-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.03.09.01.00', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:34:46-04:30', '-Operacion: Modificar -Cheque:  03815222', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:37:14-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 8', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:20:47-04:30', '-Operacion: Entrar al sistema', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:22:03-04:30', '-Operacion: Modificar -Acceso:  -Registro ID: 4', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:43:01-04:30', '-Operacion: Modificar -Cheque:  03815222', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:45:45-04:30', '-Operacion: Modificar Partida Presupuestaria: 4.03.09.01.00', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:54:15-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: V-9986790', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:54:28-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 9', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:10:42-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:24-04-2009 tipo de reporte: 00 Fondo: FONDO MENSUALexportar: 0', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:36:30-04:30', '-Operacion: Modificar -Cheque:  03815222', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:40:07-04:30', '-Operacion: Modificar -Cheque:  03815222', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:40:30-04:30', '-Operacion: Modificar -Cheque:  03815222', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '15:23:55-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '15:43:09-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '15:52:29-04:30', '-Operacion: Agregar -MATERIAL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:03:20-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:24-04-2009 tipo de reporte: 03 Fondo: FONDO MENSUALexportar: 0', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:04:15-04:30', '-Operacion: Agregar -MATERIAL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:09:24-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:12:28-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:15:47-04:30', '-Agregar Retencion IVA:  20090400000001', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:16:23-04:30', '-Modificar Retencion IVA: 2', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:24:30-04:30', '-Operacion: Modificar -Cheque:  08815239', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '14:41:37-04:30', '-Operacion: Modificar -Cheque:  03815222', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '15:18:37-04:30', '-Operacion: Agregar -Cheque:  13815237', 'mgvq');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '15:44:25-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '15:46:22-04:30', '-Operacion: Entrar al sistema', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '15:51:04-04:30', '-Operacion: Agregar -MATERIAL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:01:36-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:03:29-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:04:15-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:04:35-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:24-04-2009 tipo de reporte: 03 Fondo: FONDO MENSUALexportar: 0', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:06:20-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:08:56-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:10:13-04:30', '-Agregar Ingresos :', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:11:17-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:24-04-2009 tipo de reporte: 03 Fondo: FONDO MENSUALexportar: 0', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:14:28-04:30', '-Agregar Retencion IVA:  20090400000001', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:15:20-04:30', '-Operacion: Agregar -Cheque:  23815238', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:20:42-04:30', '-Modificar Retencion ISRL: 2', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:23:54-04:30', '-Operacion: Agregar -Cheque:  08815239', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:48:27-04:30', '-Agregar Retencion IVA:  20090400000002', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '16:57:21-04:30', '-Operacion: Agregar -Cheque:  11815240', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-24', '17:08:32-04:30', '-Operacion: Agregar -Cheque:  96815241', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '09:38:43-04:30', '-Operacion: Entrar al sistema', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '09:50:52-04:30', '-Agregar Retencion IVA:  20090400000003', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '09:52:11-04:30', '-Agregar Retencion IVA:  20090400000003', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:11:10-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:12:15-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:20:20-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:29:04-04:30', '-Operacion: Agregar -Cheque:  16815242', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:32:37-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 131', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:33:58-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 131', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:34:07-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 131', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:34:47-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 131', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:34:50-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 131', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:35:07-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 131', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:35:09-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 131', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:35:09-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 131', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:35:10-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 131', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:35:11-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 131', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:35:21-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 131', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:35:36-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 131', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:35:47-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 131', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:38:24-04:30', '-Agregar Retencion IVA:  20090400000004', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:40:31-04:30', '-Agregar Retencion ISRL: ', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '10:59:33-04:30', '-Operacion: Agregar -Cheque:  81815243', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '14:07:18-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '14:26:52-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '14:42:37-04:30', '-Operacion: Entrar al sistema', 'yromi22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '15:13:28-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '15:19:13-04:30', '-Operacion: Agregar -caja chica:  0000909', 'yromi22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '15:26:52-04:30', '-Operacion: Agregar -caja chica:  09263', 'yromi22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '15:29:55-04:30', '-Operacion: Agregar -caja chica:  016592', 'yromi22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '15:36:14-04:30', '-Operacion: Modificar -Caja Chica:  4', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '15:43:29-04:30', '-Operacion: Agregar -caja chica:  130070361191', 'yromi22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '15:50:14-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '15:50:54-04:30', '-Operacion: Modificar -Caja Chica:  5', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '15:51:08-04:30', '-Operacion: Modificar -Caja Chica:  5', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '16:03:57-04:30', '-Operacion: Agregar -caja chica:  0463', 'yromi22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '16:06:37-04:30', '-Operacion: Agregar -caja chica:  00002863', 'yromi22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '16:07:38-04:30', '-Operacion: Modificar -Caja Chica:  6', 'yromi22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '16:08:11-04:30', '-Operacion: Modificar -Caja Chica:  5', 'yromi22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '16:14:51-04:30', '-Operacion: Agregar -caja chica:  00003584', 'yromi22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '16:17:48-04:30', '-Operacion: Agregar -caja chica:  00000112', 'yromi22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '16:20:17-04:30', '-Operacion: Agregar -caja chica:  0001026', 'yromi22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '16:41:49-04:30', '-Operacion: Agregar -caja chica:  00001613', 'yromi22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '16:42:45-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '16:44:23-04:30', '-Operacion: Agregar -caja chica:  006502', 'yromi22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '16:45:38-04:30', '-Operacion: Agregar -MATERIAL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '16:59:20-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '16:59:50-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:27-04-2009 tipo de reporte: 03 Fondo: 0exportar: 0', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '17:01:50-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '17:02:18-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:27-04-2009 tipo de reporte: 01 Fondo: 0exportar: 0', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '17:02:56-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:27-04-2009 tipo de reporte: 04 Fondo: 0exportar: 0', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '17:16:28-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-27', '17:16:45-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:27-04-2009 tipo de reporte: 01 Fondo: 0exportar: 0', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-28', '07:35:05-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-28', '08:10:54-04:30', '-Operacion: Agregar -Cheque:  01815244', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-28', '08:52:40-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:28-04-2009 tipo de reporte: 07 Fondo: FONDO MENSUALexportar: 0', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-28', '07:38:20-04:30', '-Operacion: Entrar al sistema', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-28', '07:44:09-04:30', '-Agregar Retencion IVA:  20090400000005', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-28', '08:19:38-04:30', '-Agregar Retencion IVA:  20090400000006', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-28', '08:26:09-04:30', '-Agregar Retencion IVA:  20090400000006', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-28', '08:46:06-04:30', '-Operacion: Agregar -Cheque:  75815245', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-28', '08:55:36-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-28', '08:55:47-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-01-2009 tipo de reporte: 09 Fondo: 0exportar: 0', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-28', '08:55:56-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-05-2009 tipo de reporte: 08 Fondo: 0exportar: 0', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-28', '08:56:07-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:28-04-2009 tipo de reporte: 01 Fondo: FONDO MENSUALexportar: 0', 'mariagabriela');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-28', '08:56:42-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-05-2009 tipo de reporte: 01 Fondo: 0exportar: 0', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2009-04-28', '08:57:56-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:28-04-2009 tipo de reporte: 07 Fondo: FONDO MENSUALexportar: 0', 'mariagabriela');


--
-- TOC entry 1743 (class 0 OID 16455)
-- Dependencies: 1351
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-31401906-6', 'COOPERATIVA TURISTICA KURIARA 674', 'NO', 'NO', 2, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-9367505', 'VICTOR NOGUERA', 'PEDRAZA', '0414-0763509', 22, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('14258402', 'PEDRO CONDE', 'NO', 'no', 23, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-14352372', 'ALEXANDER LEAL', 'BARINAS', 'SIN NUMERO', 27, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-30580717-5', 'LIBRERIA ESCORPIO CA', 'AV.  SUCRE ENTRE CALLES CAMEJO Y CARVAJAL Nº 9-24', '0273-5528269', 29, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('10059412', 'VICTOR PERALTA', NULL, NULL, 32, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('15073565', 'ROSEMARY DAVILA', NULL, NULL, 34, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('4926074', 'ABBY OLAECHEA', NULL, NULL, 38, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('10052857', 'ESTEBAN PÉREZ', NULL, NULL, 40, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('9326804', 'DUILIO LOZADA', NULL, NULL, 42, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('12781174', 'JHON VELASQUEZ', NULL, NULL, 43, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('16513698', 'YSHAMDRA AL HAJALI', NULL, NULL, 44, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('9406887', 'YRENE LOZADA', NULL, NULL, 45, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('13063614', 'YOEL CASTILLO', NULL, NULL, 46, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('11715878', 'NICAMAR ABREU', NULL, NULL, 47, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('4853036', 'MANUEL MARQUEZ', NULL, NULL, 48, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('12831247', 'YENITZA SANDOVAL', NULL, NULL, 49, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-12779802-4', 'LA NOTICIA DE BARINAS', 'AV. INDUSTRIAL CON AV. CARABOBO, AL LADO DE AUTOPARABRISAS BARINAS.', '0273-5323184', 50, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('7801949', 'MARIA TERESA BORREGO', NULL, NULL, 51, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-30959385-4', 'LAS MARGARITAS VARIEDADES C.A.', 'CALLE MERIDA ENTRE AVENIDAS LIBERTAD Y MONTILLA.', '0273-5526589', 53, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('8132701', 'FELIX A. VITRIAGO', NULL, NULL, 54, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-30727568-5', 'EL DIARIO DE LOS LLANOS BARINESES C.A.', 'AV. INDUSTRIAL A 50 MTS DEL CNE. ZONA INDUSTRIAL DE BARINAS.', '0273-5462898', 55, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-10052857', 'ESTEBAN PEREZ', 'BARINAS', 'NO', 56, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-3593862', 'LUIS FLORES', 'BARINAS', 'NO', 57, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-1988874', 'FRANCISCO LOPEZ', 'BARINAS', 'NO', 59, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-7237276', 'NOEL PERALTA', 'BARINAS', 'NO', 60, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('1565892', 'OGLA BRAVO', 'NO', 'no', 28, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-12203397', 'GLADYS VILLEGAS', NULL, NULL, 62, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-12836864', 'ROKGLAY MOLERO', NULL, NULL, 63, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-5949417', 'ALFREDO RAMOS', 'BARINAS', 'NO', 67, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('0', 'TESORO NACIONAL', 'no', 'no', 20, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-30859479-2', 'EL REY DEL FRIO, C.A.', 'NO', 'NO', 9, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-14827336', 'DOMINGO ANATO', NULL, NULL, 73, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-9326804', 'DUILIO LOZADA', NULL, NULL, 74, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-13967194', 'GREGORIA MARILYN VARGAS', 'BARINAS', 'NO', 65, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('G-20003773-3', 'UNIVERSIDAD BOLIVARIANA DE VENEZUELA', 'LOS CHAGUARAMOS AV LEONARDO DA VINCI EDIFICIO UBV CARACAS SEDE PRINCIPAL', 'NO', 76, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-15796044', 'LEONARDO MATOS', 'NO', 'NO', 21, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-12705229', 'VANESSA GUTIERREZ', NULL, NULL, 83, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-9871629', 'MERQUI CORINA TORREALBA', 'NO', 'NO', 84, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-3130439', 'ARNULFO QUINTERO', 'BARINAS', 'NO', 78, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-17768572', 'MARIA GABRIELA', NULL, NULL, 86, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-18224900', 'WILLIANS BERRIOS', NULL, NULL, 87, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-1565892', 'OGLA BRAVO', NULL, NULL, 88, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-29370348-4', 'ASOCIACION COOPERATIVA  EVENTOS CHELAS', 'CALLE 8 Nº 01 URB TERRAZAS DE ALTO BARINAS ', '0414-1584236', 30, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('G-000000000', 'BANCO INDUSTRIAL DE VENEZUELA', 'BARINAS', 'NO', 89, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J307963980', 'INVERSIONES EUROPA C.A.', 'AV. 05 DE DICIEMBRE/ AV.26 Y 27 C.C. ACARIGUA, LOCAL G FRENTE A PLAZA PAEZ ACARIGUA EDO PORTUGUESA', '0255-6230074', 90, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-30796398-0', 'INVERSIONES EUROPA CA', 'AV 5 DE DICIEMBRE ACARIGUA', '0255-6230074', 91, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-31300080-9', 'COOPERATIVA LAS AMIGAS', 'AV 2 ESQUINA CALLE 7 A DOS CUADRAS DE LA PLAZA BOLIVAR', '04141574332', 92, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-4430249', 'JESUS PALACIOS', NULL, NULL, 93, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-11683087', 'GRACIELA TOVAR', NULL, NULL, 94, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-13063614', 'YOEL CASTILLO', NULL, NULL, 95, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-12509151', 'JUAN HERNANDEZ', NULL, NULL, 96, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-8132701', 'FELIX VITRIAGO', NULL, NULL, 97, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-090138781', 'EDITORIAL SABANA, C.A.', 'AV. ANDRES VARELA ENTRE CALLES PLAZA Y 5 DE JULIO. EDIFICIO LA PRENSA BARINAS.', '0273-5526835', 98, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-313883590', 'MEGA TONER 2010, C.A.', 'AV. MEDINA JIMENEZ ESQUINA CALLE PLAZA, SECTOR CENTRO COMERCIAL LOS CRISTALES LOCAL 3, BARINAS', '0416-8563529', 99, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-4853036', 'MANUEL MARQUEZ', NULL, NULL, 100, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-11715261', 'MASSIEL POLEO', NULL, NULL, 101, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-14108913', 'EVELIN POLANCO', NULL, NULL, 102, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-12831247', 'YENITZA SANDOVAL', NULL, NULL, 103, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-10035692', 'DAVID GOMEZ', NULL, NULL, 105, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-9157132', 'JAIR GONZALEZ', NULL, NULL, 106, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-15071519', 'LOLYSABEL YANEZ', NULL, NULL, 107, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-7801949', 'MARIA TERESA BORREGO', 'NO', 'no', 104, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-7824965', 'HEBERTO GUERRERO', NULL, NULL, 108, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-11963625', 'ROSA MATUTE', NULL, NULL, 109, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-12239943', 'MAGDA JIMENEZ', NULL, NULL, 110, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-16634218', 'LINOSKA RODRIGUEZ', NULL, NULL, 111, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-15384338', 'WALTER MORA ', NULL, NULL, 112, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-12555046-7', 'MULTISERVICIOS L-B', 'AVENIDA ANDRES VARELA CRUCE CON CALLE BOLIVAR', '0414-5687053', 113, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-300495264', 'TAMBOCA C.A.', 'AVENIDA ELIAS CORDERO Nº3-71 SECTOR SAN JOSE BARINAS', '0273-5321206', 114, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-31381105-0', 'ASOCIACION COOPERATIVA TURISCAMBA 591', 'AVENIDA INDUSTRIAL BARRIO SAN JUAN, CALLEJON Nº 8, CASA 6-56', '04147588089', 115, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-08143703-0', 'RUBEN RONDON SANTIAGO', 'URB. DON SAMUEL, VEREDA 02, CASA 12.', '04145196521', 116, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-4.925.151', 'YELITZA ORTIZ', 'BARINAS', '04143577756', 117, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-31474312-0', 'TINTA & TONER C.A.', 'AVENIDA CRUZ PAREDES Y MONTILLA PLANTA BAJA N 5 SECTOR CENTRO', '0273-4166400', 118, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-31615856-0', 'S & V INVERSIONES C.A.', 'AVENIDA LOS ANDES PROLONGACION AVENIDA 23 DE ENERO URB.ALTO BARINAS', '0273-5418258', 119, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-29384777-6', 'ASOCIACION COOPERATIVA RICOPY R.L.', 'CALLE PLAZA ENTRE AV. MEDINA JIMENEZ Y AV. MARQUEZ DEL PUMAR LOCAL Nº 1 SECTOR CENTRO ', '0273-2227367', 120, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-29486507-0', 'ASOCIACION COOPERATIVA DE SERVICIOS ELECTROMECANICO EL ALBA', 'AV. ELIAS CORDERO UZCATEGUI CASA Nº 17 SECTOR SAN JOSE. BARINAS', '04245071699', 121, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-29406932-0', 'A UNO SERVICIOS, C.A.', 'AV. OLIMPICA Nº 7-16. BARINAS', '04145694431', 122, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-29545328-0', 'CRISLEO TIPOGRAFIA C.A.', 'Calle Cedeño entre Av. Paèz y Briceño Mèndez, Casa Nº 9-61, Barinas.', '0273-5333093', 123, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-30436123-8', 'MATERIALES LOS ANDES BARINAS C. A.', 'AV. CUTRICENTENARIA GALPON MATERIALES BARINAS EDO BARINAS', '0273-5464554', 124, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-08505914-8', 'PRECA,S.A.', 'AV. CUATRICENTENARIA, DIAGONAL A LA POLAR,BARINAS.', '0273-5460578', 125, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-4925151', 'YELITZA ORTIZ', NULL, NULL, 126, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-12781174', 'JHON VELASQUEZ', NULL, NULL, 127, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-15791432', 'EDWARD SANCHEZ', NULL, NULL, 128, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-4924355', 'LEOVALDO SALAS', NULL, NULL, 129, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('00', 'FUNDACION TEATRO ORLANDO ARAUJO', 'BARINAS EDO BARINAS', 'NO TIENE', 130, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-09024226-0', 'PEZCAZA, C.A. ', 'AV. LIBERTAD Nro8-37 ENTRE CALLES CARVAJAL Y ARAMENDI CASA 8-37 SECTOR CENTRO BARINAS', '0273-5526635', 131, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-08065295-6', 'FLORISTERIA GENESIS', 'CALLE 15, ENTRE CARRERAS 6 Y 7, GUANARE. EDO-PORTUGUESA,', '0257-2538383', 132, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-31377984-9', 'INVERSIONES EL PILON CA', 'AVENIDA SUCRE ENTRE CALLES ARISMENDI Y CEDEÑO 7-36', '0273 5334782', 133, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-13816541', 'DUGLAS CABIEDES', NULL, NULL, 134, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-12464473', 'EDUAR VARELA', NULL, NULL, 135, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-10560238', 'DILIA MONSALVE', NULL, NULL, 136, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J31264216-5', 'H & H SUMINISTROS, CA', 'CALLE MERIDA EDIFICIO DORIA JOHANNA PISO PB LOCAL 03 SECTOR CENTRO. BARINAS EDO BARINAS', 'NO TIENE', 137, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-30728979-1', 'CLARO CLEAN BARINAS, CA', 'AV MARQUEZ DEL PUMAR ENTRE CALLE MERIDA Y AV CRUZ PAREDES ZONA CENTRAL LOCAL s/n CASA Nº 11-87', '0273-5528152', 138, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-29514640-0', 'SUMINISTROS RENS, CA', 'AV SUCRE Nº 1338 SECTOR CENTRO. BARINAS EDO BARINAS', '0273-5111378', 139, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-29588842-2', 'AUTO CAMIONES MERIDA CA', 'CALLE PRIMERA TRANSVERSAL 1-22 SECTOR LOS GUASIMITOS MUNICIPIO OBISPO', '0273-5464005', 140, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-31282012-8', 'COMPUSERVICIOS ARPANET C.A.', 'NO', 'NO', 3, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-30876921-5', 'SERVICIOS MERIDA C.A.', 'NO', 'NO', 10, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-10562624-6', 'DISTRIBUIDORA J.C. HAHN', 'NO', 'NO', 11, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-31478446-3', 'ASOCIACION COOPERATIVA AMARAIZA, R.L.', 'NO', 'NO', 12, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-30713640-5', 'CONFECCIONES KAMIKAZE, C.A.', 'NO', 'NO', 13, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-30614875-2', 'FARMACIA LA TRINIDAD C.A.', 'NO', 'NO', 14, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-29389073-0', 'ASOCIACION COOPERATIVA EL SABOR Y REVOLUCION 2007, R.L', 'NO', 'NO', 15, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-29428263-6', 'MULTISERVICIOS SAN ANDRES, C.A', 'AV INDUSTRIAL NUMERO 01-106', '0273-5323478', 18, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-16699923-1', 'PROVEEDURIA ESTUDIANTIL LOS LLANOS (PROVELLANOS)', 'NO', 'NO', 17, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-11190952', 'ENRIQUE AGUILERA', 'NO', 'NO', 6, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-11714856', 'LUIS A, RONDON', 'NO', 'NO', 8, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-6384084', 'FRANCISCO JIMENEZ', 'NO', 'NO', 16, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-13063445', 'ANA MAR COLMENARES', 'NO', 'NO', 7, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-29515097-0', 'ASOCIACION COOPERATIVA YOGURES D` LINA', 'VEREDA 4 CASA Nº 4 URB PALACIO FAJARDO ', '0273-5333360', 141, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-3877264', 'EDGAR CRESPO ', NULL, NULL, 142, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-08516887-7', 'DALCOBA C.R.L.', 'CALLE 6 CON CARRERA 5 EDIFICIO CARLUMARA PLANTA BAJA OFICINA 10 GUANARE-PORTUGUESA', '0257-2511955', 143, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-300562913', 'FESTEJOS LOS CHAGUARAMOS CA', 'AV 23 DE ENERO CON AV SIMON BOLIVAR ENTRADA A GUANARE', '0257-2514875', 144, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-9987655', 'NAILI SIMANCAS ', NULL, NULL, 145, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-8568447', 'JOSE RAFAEL ALVAREZ', 'BARINAS EDO BARINAS', 'NO DIO', 146, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-8189876', 'BLANCA PEREZ ', NULL, NULL, 147, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-4383047', 'MARCOS SANCHEZ', 'NO', 'NO', 5, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-14662447', 'LEDYS JIMENEZ ', NULL, NULL, 148, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('10562912', 'CARLOS RAMIREZ', 'NO', 'NO', 36, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-11191100', 'FELIX GALINDEZ', 'NO', 'NO', 64, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('12509151', 'JUAN HERNANDEZ', 'NO', 'NO', 52, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('9387902', 'JAVIER RONDON', 'NO', 'NO', 33, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-9986790', 'MIREL VOLCAN', 'BARINAS', 'NO', 35, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-294439098', 'SUPER CAUCHOS LOS LLANOS, CA', 'AV AGUSTIN CODAZZI NUMERO 06, SECTOR VISTA HERMOSA, BARINAS', '0273-5337651', 149, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-31045357-8', 'INVERSIONES ECA, CA', 'AV CARABOBO ENTRE CALLE CEDEÑO Y AVENIDA INDUSTRIAL, CASA NRO 8-2, SECTOR CAJA DE AGUA. BARINAS EDO BARINAS', 'NO APLICA', 150, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-09009544-6', 'PAPALERIA TODOEQUIPOS CA', 'CALLE CEDEÑO ENTRE AVS MEDINA JIMENEZ Y MARQUEZ DEL PUMAR EDIF TODOEQUIPOS.', '0273-5521023', 151, 'PROVEEDOR');


--
-- TOC entry 1746 (class 0 OID 16491)
-- Dependencies: 1357
-- Data for Name: viaticos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, 'V-8189876', 'CANCELACION QUE SE LA HACE A LA T.S.U. BLANCA MARINA PEREZ, TITULAR DE LA C.I. NºV-8.189.876,TECNICO DE RECURSOS DE INFORMATICA DE LA UBV SEDE BARINAS,POR ASISTENCIA AL CURSO DE MOODLE PARA PERFIL DE ADIMINISTARDORES Y TECNICOS REALIZADO EN LA UBV SEDE LOS CHAGUARAMOS DEL 27/01 AL 30/01/2009. CON CARGO AL FONDO DE AVANCE ', '26/01/2009', '30/01/2009', 5, 436, 0, 30, 0, 120, 0, '120 BsF POR CONCEPTO DE TRANSPORTE TERRESTRE PARA LA RUTA BARINAS-CARACAS Y CARACAS-BARINAS.', 586, '3', '3', '1', '1', '1', '1', 125, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, 'V-16634218', 'CANCELACION QUE SE LA HACE A LA T.S.U. LINOSKA RODRIGUEZ, TITULAR DE LA C.I. Nº V-16.634.218, ASISTENTE DE LABORATORIO DE INFORMATICA DE LA UBV SEDE BARINAS, POR ASISTENCIA AL CURSO DE MOODLE PARA PERFIL DE ADIMINISTARDORES Y TECNICOS REALIZADO EN LA UBV SEDE LOS CHAGUARAMOS DEL 27/01 AL 30/01/2009. CON CARGO AL FONDO DE AVANCE.', '26/01/2009', '30/01/2009', 5, 436, 0, 30, 0, 0, 120, '120 BsF POR CONCEPTO DE TRANSPORTE TERRESTRE PARA LA RUTA BARINAS-CARACAS Y CARACAS-BARINAS.', 586, '3', '3', '1', '1', '1', '1', 126, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, 'V-9987655', 'CANCELACION QUE SE LE HACE A LA LCDA. NAILI SIMANCAS, C.I. V-9.987.655, ADMINISTRADORA DE LA UBV SEDE BARINAS, POR ASISTENCIA A LA OFICINA DE CAJA DE AHORROS DE LOS TRABAJADORES DE LA UNIVERSIDAD BOLIVARIANA DE VENEZUELA (UBV LOS CHAGUARAMOS) EL DIA 10/02/2009,  PARA REALIZAR ENTREGA DEL LIBRO DE ACTAS DE LA ASAMBLEA PARCIAL EXTRAORDINARIA REALIZADA EL 06/02/2009 EN LA SEDE BARINAS. CON CARGO AL FONDO DE AVANCE.', '09/02/2009', '10/02/2009', 2, 118, 0, 30, 0, 0, 120, '120 BsF POR CONCEPTO DE PASAJE TERRESTRE PARA LA RUTA BARINAS CARACAS Y CARACAS BARINAS', 268, '3', '3', '1', '1', '1', '1', 127, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, 'V-8132701', 'CANCELACION QUE SE LE HACE AL T.S.U. FELIX VITRIAGO, TITULAR DE LA C.I. V-8.132.701, ASISTENTE ADMINISTRATIVO DE LA UBV SEDE BARINAS, PARA ASISTIR A LA UBV CARACAS DEL 19/01/2009 AL 21/01/2009 A LA COORDINACION NACIONAL DE SERVICIOS ESTUDIANTILES A UNA REUNION CON LA LCDA. JACQUELINE ROMERO. CON CARGO AL FONDO DE AVANCE.', '19/01/2009', '21/01/2009', 3, 224, 0, 0, 0, 0, 0, '', 224, '3', '3', '1', '1', '1', '1', 129, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (3, 'V-4383047', 'CANCELACION QUE SE LE HACE AL SR. MARCOS SANCHEZ, TITULAR DE LA C.I. V-4.383.047, CHOFER DE LA UBV SEDE BARINAS, POR TRASALDO DE PERSONAL ADMINISTRATIVO A LA UBV LOS CHAGUARAMOS DEL 17/02/2009 AL 19/02/2009. CON CARGO AL FONDO DE AVANCE.', '17/02/2009', '19/02/2009', 3, 220, 0, 0, 0, 0, 0, '', 220, '3', '3', '1', '1', '1', '1', 131, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (3, 'V-4383047', 'CANCELACION QUE SE LE HACE AL CIUDADANO MARCOS SANCHEZ, TITULAR DE LA C.I.V-4.383.047, CHOFER DE LA UBV SEDE BARINAS, POR TRASLADO DE PERSONAL ADMINISTRATIVO A LA UBV CARACAS DEL 19/01/2009 AL 21/01/2009 A LA COORDINACION NACIONAL DE SERVICIOS ESTUDIANTILES.CON CARGO AL FONDO DE AVANCE. ', '19/01/2009', '21/01/2009', 3, 220, 0, 0, 0, 0, 0, '', 220, '3', '3', '1', '1', '1', '1', 128, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, 'V-1988874', 'CANCELACION QUE SE LE HACE AL ING. FRANCISCO LOPEZ, TITULAR DE LA C.I. V-1.988.874, COORDINADOR GENERAL DE LA UBV SEDE BARINAS, POR ASISTENCIA A LA UBV LOS CHAGUARAMOS DEL 17/02/2009 AL 19/02/2009, A UNA REUNION DE TRABAJOCON LA CIUDADANA RECTORA DRA. MARLENE CORDOVA.CON CARGO AL FONDO DE AVANCE.', '17/02/2009', '19/02/2009', 3, 224, 0, 0, 0, 0, 0, '', 224, '3', '3', '1', '1', '1', '1', 130, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, 'V-12509151', 'TRASLADO DEL SR. JUAN HERNADEZ TITULAR DE LA CEDULA DE IDENTIDAD V-12.509.151, SUPERVISOR DE PROTECCION DE LA UBV SEDE BARINAS,A LA UBV LOS CHAGUARAMOS DEL 27/01/2009 AL 30/01/2009 CON LA FINALIDAD DE SOLVENTAR SITUACION LABORAL DE LOS TRABAJADORES DEL DPTO DE SEGURIDAD DE ESTA SEDE. CON CARGO AL FONDO DE AVANCE.', '26/01/2009', '30/01/2009', 5, 436, 0, 30, 0, 0, 120, '120 Bs.F POR CONCEPTO DE PASAJE TERRESTRE DE LA RUTA BARINAS CARACAS Y VICEVERSA', 586, '3', '3', '1', '1', '1', '1', 6, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (3, 'V-9326804', 'CANCELACION QUE SE LE HACE AL SR. DUILIO LOZADA, TITULAR DE LA C.I. V-9.326.804, POR TRASLADARSE A LA UBV CARACAS LOS DIAS 18 Y 19 DE ABRIL DE 2.009, PARA LLEVAR A UN GRUPO DE ESTUDIANTES DE UBV LOS CHAGUARAMOS. CON CARGO AL FONDO DE AVANCE.', '18/04/2009', '19/04/2009', 2, 126, 0, 0, 0, 0, 0, '', 126, '1', '2', '1', '1', '1', '1', 4, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (3, 'V-4383047', 'CANCELACION QUE SE LE HACE AL SR. MARCOS SANCHEZ, TITULAR DE LA C.I. V-4.383.047, CHOFER DE LA UBV SEDE BARINAS, POR TRASLDO A LA UBV CARACAS, LOS DIAS 12 Y 13 DE ABRIL DEL 2.009, PARA BUSCAR A UN GRUPO DE ESTUDIANTES DE LA SEDE LOS CHAGUARAMOS. CON CARGO AL FONDO DE AVANCE.', '12/04/2009', '13/04/2009', 2, 126, 0, 0, 0, 0, 0, '', 126, '1', '2', '1', '1', '1', '1', 5, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (3, 'V-10052857', 'CANCELACION QUE SE LE HACE AL SR. ESTEBAN PEREZ, TITULAR DE LA C.I. V-10.052.857, POR TRASLADARSE A LA UBV CARACAS LOS DIAS 12 Y 13 DE ABRIL DE 2.009, PARA BUSCAR A UN GRUPO DE ESTUDIANTES DE UBV LOS CHAGUARAMOS. CON CARGO AL FONDO DE AVANCE. ', '12/04/2009', '13/04/2009', 2, 126, 0, 0, 0, 0, 0, '', 126, '1', '2', '1', '1', '1', '1', 3, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (3, 'V-10052857', 'CANCELACION QUE SE LE HACE AL SR. ESTEBAN PEREZ, TITULAR DE LA C.I. V-10.052.857, CHOFER DE LA UBV SEDE BARINAS, POR TRASLADO DE TRES PROFESORES A LA UBV CARACAS, LOS DIAS 25,26 Y 27 DE MARZO DE 2.009. CON CARGO AL FONDO DE AVANCE. ', '24/03/2009', '27/03/2009', 4, 312, 0, 0, 0, 0, 0, '', 312, '3', '2', '1', '1', '1', '1', 2, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, 'V-14662447', 'ASISTENCIA DE LA PROF. LEDYS JIMENEZ TITULAR DE LA CEDULA DE IDENTIDAD V-14.662.447 COORDINADORA ACADEMICA DE UBV BARINAS, A UNA REUNION DE TRABAJO CON LA CIUDADANA RECTORA MARLENE YADIRA CORDOVA EN UBV LOS CHAGUARAMOS LOS DIAS 18 Y 19 DE FEBRERO DE 2009. CON CARGO AL FONDO DE AVANCE.', '17/02/2009', '19/02/2009', 3, 224, 0, 0, 0, 0, 0, '', 224, '3', '3', '1', '1', '1', '1', 7, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, 'V-14662447', 'CANCELACION A LA PROFESORA LEDYS JIMENEZ TITULAR DE LA CEDULA DE IDENTIDAD V-14.662.447 COORDINADORA ACADEMICA DE UBV SEDE BARINAS POR ASISTENCIA A UN TALLER NACIONAL DE CENTROS DE ESTUDIOS LOS DIAS 25 Y 26 DE MARZO DE 2009 EN UBV LOS CHAGUARAMOS. CON CARGO AL FONDO DE AVANCE. ', '24/03/2009', '27/03/2009', 4, 318, 0, 0, 0, 0, 0, '', 318, '3', '2', '1', '1', '1', '1', 8, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, 'V-9986790', 'CANCELACION QUE SE LE HACE A PROF. MIREL VOLCAN TITULAR DE LA C.I. V-9.986.790, DOCENTE DEL PFG GESTION AMBIENTAL DE LA UBV SEDE BARINAS, POR ASISTENCIA A UNA REUNION DE COMISION DE INGRESOS PROPIOS DE LA UBV EN CARACAS EN REPRESENTACION DE ESTA SEDE . CON CARGO AL FONDO DE AVANCE.', '19/02/2009', '20/02/2009', 2, 118, 0, 30, 0, 0, 140, '140 Bs.F POR CONCEPTO DE PASAJE TERRESTRE DE LA RUTA BARINAS CARACAS Y CARACAS BARINAS ', 288, '3', '3', '1', '1', '1', '1', 9, '', 'PROCESADO');


--
-- TOC entry 1762 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2009-04-28 09:10:05 VET

--
-- PostgreSQL database dump complete
--

