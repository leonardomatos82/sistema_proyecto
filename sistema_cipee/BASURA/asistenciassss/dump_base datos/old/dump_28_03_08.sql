--
-- PostgreSQL database dump
--

-- Started on 2008-03-28 14:04:08 VET

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1719 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1313 (class 1259 OID 16386)
-- Dependencies: 1680 5
-- Name: acceso; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE acceso (
    "login" character varying(30) NOT NULL,
    clave character varying(30) NOT NULL,
    tipo character varying(15) NOT NULL,
    id_acceso integer DEFAULT nextval(('public.acceso_id_acceso_seq'::text)::regclass) NOT NULL
);


ALTER TABLE public.acceso OWNER TO leonardo;

--
-- TOC entry 1314 (class 1259 OID 16389)
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
-- TOC entry 1721 (class 0 OID 0)
-- Dependencies: 1314
-- Name: acceso_id_acceso_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('acceso_id_acceso_seq', 7, true);


--
-- TOC entry 1343 (class 1259 OID 16715)
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
-- TOC entry 1722 (class 0 OID 0)
-- Dependencies: 1343
-- Name: acceso_id_acceso_solicitud_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('acceso_id_acceso_solicitud_seq', 1, false);


--
-- TOC entry 1342 (class 1259 OID 16712)
-- Dependencies: 1693 5
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
-- TOC entry 1345 (class 1259 OID 16730)
-- Dependencies: 1694 5
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
-- TOC entry 1344 (class 1259 OID 16728)
-- Dependencies: 5
-- Name: asignacion_caja_chica_id_asignacion_caja_chica_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE asignacion_caja_chica_id_asignacion_caja_chica_seq
    START WITH 2
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.asignacion_caja_chica_id_asignacion_caja_chica_seq OWNER TO leonardo;

--
-- TOC entry 1723 (class 0 OID 0)
-- Dependencies: 1344
-- Name: asignacion_caja_chica_id_asignacion_caja_chica_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('asignacion_caja_chica_id_asignacion_caja_chica_seq', 2, false);


--
-- TOC entry 1346 (class 1259 OID 24920)
-- Dependencies: 1695 5
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
    fecha character varying(15)
);


ALTER TABLE public.caja_chica OWNER TO leonardo;

--
-- TOC entry 1348 (class 1259 OID 24929)
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
-- TOC entry 1724 (class 0 OID 0)
-- Dependencies: 1348
-- Name: caja_chica_id_caja_chica_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('caja_chica_id_caja_chica_seq', 1, true);


--
-- TOC entry 1315 (class 1259 OID 16391)
-- Dependencies: 1681 5
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
    tipo_f character varying(30)
);


ALTER TABLE public.cheque OWNER TO leonardo;

--
-- TOC entry 1316 (class 1259 OID 16397)
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
-- TOC entry 1725 (class 0 OID 0)
-- Dependencies: 1316
-- Name: cheque_id_cheque_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('cheque_id_cheque_seq', 94, true);


--
-- TOC entry 1317 (class 1259 OID 16399)
-- Dependencies: 1682 5
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
    comienzo_anio date
);


ALTER TABLE public.configuracion OWNER TO leonardo;

--
-- TOC entry 1318 (class 1259 OID 16402)
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
-- TOC entry 1726 (class 0 OID 0)
-- Dependencies: 1318
-- Name: configuracion_id_configuracion_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('configuracion_id_configuracion_seq', 2, false);


--
-- TOC entry 1347 (class 1259 OID 24926)
-- Dependencies: 1696 5
-- Name: distribucion_caja_chica; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE distribucion_caja_chica (
    nfactura character varying(15) NOT NULL,
    cod_partida character varying(60) NOT NULL,
    monto_factura character varying(30),
    programa character varying(150) NOT NULL,
    id_distribucion_caja_chica integer DEFAULT nextval(('public.distribucion_caja_chica_id_distribucion_caja_chica_seq'::text)::regclass) NOT NULL,
    estado character varying(25),
    fecha character varying(15)
);


ALTER TABLE public.distribucion_caja_chica OWNER TO leonardo;

--
-- TOC entry 1349 (class 1259 OID 24931)
-- Dependencies: 5
-- Name: distribucion_caja_chica_id_distribucion_caja_chica_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE distribucion_caja_chica_id_distribucion_caja_chica_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.distribucion_caja_chica_id_distribucion_caja_chica_seq OWNER TO leonardo;

--
-- TOC entry 1727 (class 0 OID 0)
-- Dependencies: 1349
-- Name: distribucion_caja_chica_id_distribucion_caja_chica_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('distribucion_caja_chica_id_distribucion_caja_chica_seq', 1, false);


--
-- TOC entry 1319 (class 1259 OID 16404)
-- Dependencies: 1683 5
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
-- TOC entry 1320 (class 1259 OID 16407)
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
-- TOC entry 1728 (class 0 OID 0)
-- Dependencies: 1320
-- Name: distribucion_cheque_id_distribucion_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('distribucion_cheque_id_distribucion_seq', 162, true);


--
-- TOC entry 1321 (class 1259 OID 16409)
-- Dependencies: 1684 5
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
-- TOC entry 1322 (class 1259 OID 16415)
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
-- TOC entry 1729 (class 0 OID 0)
-- Dependencies: 1322
-- Name: ingresos_id_ingresos_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('ingresos_id_ingresos_seq', 6, true);


--
-- TOC entry 1323 (class 1259 OID 16417)
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
-- TOC entry 1730 (class 0 OID 0)
-- Dependencies: 1323
-- Name: numero_id_numero_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('numero_id_numero_seq', 1, false);


--
-- TOC entry 1337 (class 1259 OID 16463)
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
-- TOC entry 1324 (class 1259 OID 16419)
-- Dependencies: 1685 5
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
-- TOC entry 1325 (class 1259 OID 16422)
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
-- TOC entry 1731 (class 0 OID 0)
-- Dependencies: 1325
-- Name: p_principal_id_p_principal_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('p_principal_id_p_principal_seq', 1, false);


--
-- TOC entry 1326 (class 1259 OID 16424)
-- Dependencies: 1686 5
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
-- TOC entry 1327 (class 1259 OID 16427)
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
-- TOC entry 1732 (class 0 OID 0)
-- Dependencies: 1327
-- Name: p_secundaria_id_p_secundaria_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('p_secundaria_id_p_secundaria_seq', 1, false);


--
-- TOC entry 1328 (class 1259 OID 16429)
-- Dependencies: 1687 5
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
-- TOC entry 1329 (class 1259 OID 16432)
-- Dependencies: 5
-- Name: p_terciaria_id_p_terciaria_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE p_terciaria_id_p_terciaria_seq
    START WITH 48
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.p_terciaria_id_p_terciaria_seq OWNER TO leonardo;

--
-- TOC entry 1733 (class 0 OID 0)
-- Dependencies: 1329
-- Name: p_terciaria_id_p_terciaria_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('p_terciaria_id_p_terciaria_seq', 48, false);


--
-- TOC entry 1330 (class 1259 OID 16434)
-- Dependencies: 1688 5
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
-- TOC entry 1331 (class 1259 OID 16440)
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
-- TOC entry 1734 (class 0 OID 0)
-- Dependencies: 1331
-- Name: retencion_isrl_id_retencion_isrl_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('retencion_isrl_id_retencion_isrl_seq', 15, true);


--
-- TOC entry 1332 (class 1259 OID 16442)
-- Dependencies: 1689 5
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
-- TOC entry 1333 (class 1259 OID 16448)
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
-- TOC entry 1735 (class 0 OID 0)
-- Dependencies: 1333
-- Name: retencion_iva_id_retencion_iva_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('retencion_iva_id_retencion_iva_seq', 31, true);


--
-- TOC entry 1338 (class 1259 OID 16468)
-- Dependencies: 1691 5
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
-- TOC entry 1339 (class 1259 OID 16474)
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
-- TOC entry 1736 (class 0 OID 0)
-- Dependencies: 1339
-- Name: tabla_id_tabla_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tabla_id_tabla_seq', 6, true);


--
-- TOC entry 1334 (class 1259 OID 16450)
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
-- TOC entry 1335 (class 1259 OID 16455)
-- Dependencies: 1690 5
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
-- TOC entry 1336 (class 1259 OID 16461)
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
-- TOC entry 1737 (class 0 OID 0)
-- Dependencies: 1336
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 73, true);


--
-- TOC entry 1341 (class 1259 OID 16491)
-- Dependencies: 1692 5
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
-- TOC entry 1340 (class 1259 OID 16487)
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
-- TOC entry 1738 (class 0 OID 0)
-- Dependencies: 1340
-- Name: viaticos_id_viatico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('viaticos_id_viatico_seq', 41, true);


--
-- TOC entry 1697 (class 0 OID 16386)
-- Dependencies: 1313
-- Data for Name: acceso; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO acceso ("login", clave, tipo, id_acceso) VALUES ('leonardo', '15796044', 'A', 2);
INSERT INTO acceso ("login", clave, tipo, id_acceso) VALUES ('administracion', '9266165', 'U', 1);
INSERT INTO acceso ("login", clave, tipo, id_acceso) VALUES ('gaby22', '9269610', 'A', 4);
INSERT INTO acceso ("login", clave, tipo, id_acceso) VALUES ('jenrry', 'jc11021987', 'A', 6);
INSERT INTO acceso ("login", clave, tipo, id_acceso) VALUES ('naili', 'ubvsbp2008', 'A', 5);
INSERT INTO acceso ("login", clave, tipo, id_acceso) VALUES ('anato', '1730', 'A', 7);


--
-- TOC entry 1712 (class 0 OID 16712)
-- Dependencies: 1342
-- Data for Name: acceso_solicitud; Type: TABLE DATA; Schema: public; Owner: leonardo
--



--
-- TOC entry 1713 (class 0 OID 16730)
-- Dependencies: 1345
-- Data for Name: asignacion_caja_chica; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO asignacion_caja_chica (fecha, ncheque, monto, descripcion, estado, id_asignacion_caja_chica, disponible) VALUES ('2008-02-14', '13812415', '6000.00', '1 REPOSICION DE CAJA CHICA', 'EJECUTADO', 1, NULL);
INSERT INTO asignacion_caja_chica (fecha, ncheque, monto, descripcion, estado, id_asignacion_caja_chica, disponible) VALUES ('2008-03-25', '39812455', '5998.80', '2 REPOSICION DE CAJA CHICA', 'EN EJECUCION', 2, NULL);


--
-- TOC entry 1714 (class 0 OID 24920)
-- Dependencies: 1346
-- Data for Name: caja_chica; Type: TABLE DATA; Schema: public; Owner: leonardo
--



--
-- TOC entry 1698 (class 0 OID 16391)
-- Dependencies: 1315
-- Data for Name: cheque; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-14', '13812415', '6000', 'FRANCISCO JIMENEZ', 'APERTURA DE CAJA CHICA CORRESPONDIENTE AL MES DE ENERO AÑO 2008', 'COORDINACION DE ADMINISTRACION', 'BNS-001', 2, 'PAGADO', NULL, NULL, 'V-6384084', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-14', '16812420', '1200.62', 'CONFECCIONES KAMIKAZE, C.A.', 'CANCELACION A LA EMPRESA POR COMPRA DE 20 CHEMISE Y 20 GORRAS, POR EVENTO UNIVERSIDAD 2008 A REALIZARSE EN LA HABANA CUBA.SEGUN FACTURAS NROS 4711 12-02-2008;2801 12-02-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-006', 8, 'PAGADO', NULL, NULL, 'J-30713640-5', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-14', '47812431', '8716.15', 'COMPUSERVICIOS ARPANET C.A.', 'CANCELACION QUE SE HACE A LA EMPRESA COMPUSERVICIOS ARPANET C.A. POR LA COMPRA DE TINTA,TONER,CINTAS DE MINI DVD,REGULADORES PARA IMPRESORA.MATERIAL UTILIZADO POR TODAS LAS COORDINACIONES ADSCRITAS A ESTA SEDE.SEGUN FACTURAS NROS:000371 22-01-2008; 000376 28-01-2008; 000377 28-01-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-017', 20, 'PAGADO', NULL, NULL, 'J-31282012-8', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-14', '05812424', '3268.15', 'EL REY DEL FRIO, C.A.', 'CANCELACION A LA EMPRESA EL REY DEL FRIO, C.A. POR MANTENIMIENTO DE AIRES ACONDICIONADOS DE LA SEDE BARINAS.SEGUN FACTURA NRO 001104 24-01-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-010', 12, 'PAGADO', NULL, NULL, 'J-30859479-2', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-14', '85812423', '1772.42', 'SERVICIOS MERIDA C.A.', 'CANCELACION A LA EMPRESA SERVICIOS MERIDA C.A. POR MANTENIMIENTOS A LA UNIDAD DE TRANSPORTE TOYOTA PLACA AFG-69C.SEGUN FACTURA NRO 1604 29-01-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-009', 11, 'PAGADO', NULL, NULL, 'J-30876921-5', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-14', '33812416', '8716.15', 'COMPUSERVICIOS ARPANET C.A.', 'CANCELACION QUE SE HACE A LA EMPRESA COMPUSERVICIOS ARPANET C.A. POR LA COMPRA DE TINTA,TONER,CINTAS DE MINI DVD,REGULADORES PARA IMPRESORA.MATERIAL UTILIZADO POR TODAS LAS COORDINACIONES ADSCRITAS A ESTA SEDE.SEGUN FACTURAS NROS:000371 22-01-2008; 000376 28-01-2008; 000377 28-01-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-002', 4, 'ANULADO', 'ERROR DE IMPRESION', '2008-02-14', 'J-31282012-8', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-14', '11812422', '637.98', 'DISTRIBUIDORA J.C. HAHN', 'CANCELACION A LA EMPRESA DISTRIBUIDORA J.C. HAHN POR COMPRA DE BOTELLONES DE AGUA PARA LA SEDE UBV BARINAS. SEGUN FACTURAS NROS 010257 22-01-2008; 000712 29-01-2008; 010289 30-01-2008; 010326 08-02-2008; 000722 08-02-2008; 000721 08-02-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-008', 10, 'PAGADO', NULL, NULL, 'V-10562624-6', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-18', '31812433', '2932.31', 'MULTISERVICIOS J.H. C.A.', 'CANCELACION A LA EMPRESA MULTISERVICIOS J.H. C.A. POR CONCEPTO DE MANTENIMIENTO DE TODAS LAS UNIDADES DE TRANSPORTES ADSCRITAS A NUESTRA SEDE BARINAS.SEGUN FACTURAS 0127 15-02-2008; 0126 15-02-2008; 0125 15-02-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-019', 22, 'PAGADO', NULL, NULL, 'J-29486767-7', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-14', '67812432', '10800', 'COOPERATIVA TURISTICA KURIARA 674', 'CANCELACION A LA COOPERATIVA TURISTICA KURIARA 674 POR CONCEPTO DE TRASLADO DEL PERSONAL DOCENTE DE LA UBV BARINAS A LOS MUNICIPIOS SUCRE,ZAMORA,BARINAS,LA GUAIRA,IDA Y VUELTA.SEGUN FACTURAS 0024 29-01-2008; 0025 11-02-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-018', 21, 'PAGADO', NULL, NULL, 'J-31401906-6', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-14', '72812430', '254', 'YOEL CASTILLO', 'CANCELACION DE VIATICOS AL SR. YOEL CASTILLO, POR CONCEPTO DE ASISTENCIA A LA DIRECCION NACIONAL DE CONTROL DE ESTUDIOS PARA REALIZAR IMPRESIONES DE NOTAS DE ESTUDIANTES PROXIMOS A GRADUARSE. EN LA SEDE CARACAS LOS DIAS DESDE EL 17-02-2008 AL 19-02-2008.', 'CONTROL DE ESTUDIOS', 'BNS-016', 18, 'PAGADO', NULL, NULL, 'V-13063614', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-14', '59812429', '250', 'MARCOS SANCHEZ', 'CANCELACION DE VIATICOS AL SR. MARCOS SANCHEZ, POR CONCEPTO DE TRASLADO DE COMISION ASISTENTE A LA DIRECCION NACIONAL DE CONTROL DE ESTUDIOS PARA LA IMPRESION DE NOTAS CERTIFICADAS PROXIMAS A GRADUAR. LOS DIAS DESDE EL 17-02-2008 AL 19-02-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-015', 17, 'PAGADO', NULL, NULL, 'V-4343047', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-14', '84812428', '374', 'ENRIQUE AGUILERA', 'CANCELACION DE VIATICOS AL SR. ENRIQUE AGUILERA POR CONCEPTO DE ASISTENCIA A LA REUNION UBV XXI EN SU MOMENTO II EN LA SEDE CARACAS LOS DIAS DESDE EL 24-01-2008 AL 26-01-2008.', 'PROYECTOS Y PASANTIAS', 'BNS-014', 16, 'PAGADO', NULL, NULL, 'V-11190952', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-14', '64812427', '374', 'ANA MAR COLMENARES', 'CANCELACION DE VIATICOS A LA SRA. ANA MAR COLMENARES POR CONCEPTO DE REUNION CON AUTORIDADES DE LA DIRECCION NACIONAL DE POLITICAS ESTUDIANTILES EN LA SEDE CARACAS LOS DIAS DESDE EL 24-01-2008 AL 26-01-2008.', 'BIENESTAR ESTUDIANTIL', 'BNS-013', 15, 'PAGADO', NULL, NULL, 'V-13063445', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-14', '90812426', '610', 'YOEL CASTILLO', 'CANCELACION DE VIATICOS AL SR. YOEL CASTILLO POR CONCEPTO DE PROCESO DE AUDITORIA A REALIZARSE EN LA SEDE CARACAS LOS DIAS DESDE EL 08-02-2008 AL 12-02-2008.', 'CONTROL DE ESTUDIOS', 'BNS-012', 14, 'PAGADO', NULL, NULL, 'V-13063614', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-14', '70812425', '610', 'LUIS A. RONDON', 'CANCELACION DE VIATICOS AL SR. LUIS A. RONDON POR CONCEPTO DE PROCESO DE AUDITORIA A REALIZARSE EN LA SEDE CARACAS LOS DIAS DESDE EL 08-02-2008 AL 12-02-2008.', 'CONTROL DE ESTUDIOS', 'BNS-011', 13, 'PAGADO', NULL, NULL, 'V-11714856', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-14', '91812421', '1272', 'ASOCIACION COOPERATIVA AMARAIZA, R.L.', 'CANCELACION A LA ASOCIACION COOPERATIVA AMARAIZA, R.L. POR COMPRA DE COMIDA A FAVOR DE ACTIVIDADES ACADEMICAS REALIZADAS EN UBV BARINAS EN EL MES DE ENERO 2008.SEGUN FACTURA NRO 0053 13-02-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-007', 9, 'PAGADO', NULL, NULL, 'J-31478446-3', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-14', '02812419', '97.08', 'FARMACIA LA TRINIDAD C.A.', 'CANCELACION A LA EMPRESA FARMACIA LA TRINIDAD C.A. POR COMPRA DE MEDICAMENTOS A FAVOR DE LOS ESTUDIANTES DEL PFG AGROECOLOGIA.SEGUN FACTURAS NROS 440825 15-01-2008;442718 25-01-2008;443753 30-01-2008.', 'AGROECOLOGIA', 'BNS-005', 7, 'PAGADO', NULL, NULL, 'J-30614875-2', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-14', '28812418', '10800', 'COOPERATIVA TURISTICA KURIARA 674', 'CANCELACION A LA COOPERATIVA TURISTICA KURIARA 674 POR CONCEPTO DE TRASLADO DEL PERSONAL DOCENTE DE LA UBV BARINAS A LOS MUNICIPIOS SUCRE,ZAMORA,BARINAS,LA GUAIRA,IDA Y VUELTA.SEGUN FACTURAS 0024 29-01-2008; 0025 11-02-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-004', 6, 'ANULADO', 'ERROR DE IMPRESION', '2008-02-14', 'J-29486767-7', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-14', '18812417', '2800', 'ASOCIACION COOPERATIVA EL SABOR Y REVOLUCION 2007, R.L', 'CANCELACION QUE SE HACE A LA ASOCIACION COOPERATIVA "EL SABOR Y REVOLUCION 2007, R.L" POR LA COMPRA DE 200 ALMUERZOS PARA LA COORDINACION DE GESTION SOCIAL.POR ACTIVIDAD DE PASANTIAS. SEGUN FACTURAS NROS: 0096 28-01-2008.', 'GESTION SOCIAL', 'BNS-003', 5, 'PAGADO', NULL, NULL, 'J-29389073-0', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-26', '51812434', '7490.32', 'PROVEEDURIA ESTUDIANTIL LOS LLANOS (PROVELLANOS)', 'CANCELACION A LA EMPRESA PROVEEDURIA ESTUDIANTIL LOS LLANOS (PROVELLANOS)POR CONCEPTO DE COMPRA DE PRODUCTOS DE PAPEL Y CARTON PARA OFICINA SEGUN FACTURA NRO 1132 DE FECHA 25-02-2008.

', 'ADMINISTRACION', 'BNS-020', 23, 'PAGADO', NULL, NULL, 'V-16699923-1', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-27', '26812435', '35.36', 'TESORERIA NACIONAL', 'CANCELACION QUE SE HACE A TESORERIA NACIONAL, POR CONCEPTO DE RETENCION DEL I.S.L.R. A LA EMPRESA SERVICIOS MERIDA CA COMPROBANTE DE RETENCION NRO 20080100000001 DE FECHA 13-02-2008 MONTO SUJETO 1.768.00 RETENCION 2% IMPUESTO BSF 35.36.', 'COORDINACION DE ADMINISTRACION', 'BNS-021', 25, 'PAGADO', NULL, NULL, '0', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-27', '46812436', '65.20', 'TESORERIA NACIONAL', 'CANCELACION QUE SE HACE A TESORERIA NACIONAL, POR CONCEPTO DE RETENCION DEL I.S.L.R. A LA EMPRESA EL REY DEL FRIO CA, COMPROBANTE DE RETENCION NRO 20080100000002 DE FECHA 13-02-2008 MONTO SUJETO 3.260, RETENCION 2% IMPUESTO BSF 65.20.


', 'COORDINACION DE ADMINISTRACION', 'BNS-022', 26, 'PAGADO', NULL, NULL, '0', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-02-27', '11812437', '58.50', 'TESORERIA NACIONAL', 'CANCELACION QUE SE HACE A TESORERIA NACIONAL, POR CONCEPTO DE RETENCION DEL I.S.L.R. A LA EMPRESA MULTISERVICIOS JH CA COMPROBANTE DE RETENCION NRO 20080100000003 DE FECHA 15-02-2008 MONTO SUJETO 2.925, RETENCION 2% IMPUESTO BSF 58.50.


', 'COORDINACION DE ADMINISTRACION', 'BNS-023', 27, 'PAGADO', NULL, NULL, '0', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-04', '31812438', '260', 'VICTOR NOGUERA', 'CANCELACION QUE SE LE HACE AL CIUDADANO VICTOR NOGUERA TITULAR DE LA C.I. V-9.367.505, CHOFER DE LA COOPERATIVA TRANSPORTE PEDRAZA RL POR CONCEPTO DE TRASLADO DE LOS ESTUDIANTES GRADUANDOS DE LOS PFG GESTION SOCIAL Y GESTION AMBIENTAL DESDE SANTA BARBARA DE BARINAS HASTA SOCOPO Y VICEVERSA SEGUN FACTURA NRO 019408 DE FECHA 04-03-2008. CON CARGO AL FONDO ESPECIAL DE AVANCE POR MOTIVO DE ACTO DE GRADO.', 'COORDINACION DE ADMINISTRACION', 'BNS-024', 28, 'PAGADO', NULL, NULL, 'V-9367505', 'FONDO ESPECIAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-06', '15812439', '416', 'PEDRO CONDE', 'Asistencia a Acto de Grado en la Ciudad de Mérida. Enviado por la Secretaria General de la UBV ', 'COORDINACION DE ADMINISTRACION', 'BNS-025', 31, 'PAGADO', NULL, NULL, '14258402', 'FONDO ESPECIAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-06', '29812440', '4000', 'COOPERATIVA TURISTICA KURIARA 674', 'CANCELACION A LA EMPRESA COOPERATIVA TURISTICA KURIARA 674 POR CONCEPTO DE SERVICIO DE TRASLADO EN AUTOBUS CON AIRE ACONDICIONADO DESDE BARINAS A SOCOPO IDA Y REGRESO ACTO DE CLAUSURA Y GRADUACION. SEGUN FACTURA NRO 0032 DE FECHA 05-03-2008. CON CARGO AL FONDO ESPECIAL DE ACTO DE GRADO 2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-026', 32, 'PAGADO', NULL, NULL, 'J-31401906-6', 'FONDO ESPECIAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-06', '13812442', '300', 'ALEXANDER LEAL', 'TRASLADO DE COMISION TECNICO DE PROTOCOLO A SOCOPO POR MOTIVO DE PREPARATIVOS PARA ACTO DE GRADO. REALIZADO EL DIA 28-02-2008. CON CARGO AL FONDO ESPECIAL DE ACTO DE GRADO 2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-027', 33, 'PAGADO', NULL, NULL, 'V-14352372', 'FONDO ESPECIAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-06', '18812444', '460.09', 'YOEL CASTILLO', 'CANCELACION QUE SE HACE AL ING. YOEL CASTILLO, TITULAR DE LA CEDULA DE IDENTIDAD NRO V-13.063.614, COORDINADOR DE CONTROL DE ESTUDIOS DE LA UBV SEDE BARINAS / PORTUGUESA, POR CONCEPTO DE REEMBOLSO DE GASTOS OCASIONADOS POR MOTIVOS DE ACTIVIDADES RELACIONADAS CON ACTO DE GRADO 2008. SEGUN FACTURAS NROS 00061084 DE FECHA 05-03-2008, DE BSF 104.84, 00061155 DE FECHA 05-03-2008, DE BSF 157.25, 1523 DE FECHA 16-02-2008, DE BSF 69.00, 007840 DE FECHA 27-02-2008,DE BSF 112.00, 18080 DE FECHA 27-02-2008, DE BSF 3.00, 010209 DE FECHA 27-02-2008, DE BSF 7.00, Y FACTURA SIN NUMERO DE FECHA 28-02-2008, DE BSF 7.00. TOTAL A CANCELAR BSF 460.09', 'CONTROL DE ESTUDIOS', 'BNS-029', 35, 'PAGADO', NULL, NULL, 'V-13063614', 'FONDO ESPECIAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-06', '98812443', '534', 'OGLA BRAVO', 'CANCELACION QUE SE HACE A LA LIC. OGLA BRAVO TITULAR DE LA CEDULA DE IDENTIDAD NRO V-1.565.892, ENCARGADA DE LA COORDINACION DE PROTOCOLO DE LA UBV SEDE BARINAS / PORTUGUESA, POR CONCEPTO DE TRASLADO A LA SEDE UBV CARACAS LOS DIAS 28 Y 29 DE FEBRERO DEL AÑO 2008, CON MOTIVO DE REUNION EXTRAORDINARIA RELACIONADA CON ACTO DE GRADO 2008. CON CARGO AL FONDO ESPECIAL DE ACTO DE GRADO 2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-030', 36, 'PAGADO', NULL, NULL, '1565892', 'FONDO ESPECIAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-07', '82812445', '234.52', 'LIBRERIA ESCORPIO CA', 'CANCELACION QUE SE HACE A LA LIBRERIA ESCORPIO CA POR CONCEPTO DE COMPRA DE 100 CARPETAS KIMBERLYN, LAS CUALES SERAN UTILIZADAS POR CONTROL DE ESTUDIOS PARA LA ENTREGA DE LAS NOTAS CERTIFICADAS A LOS GRADUANDOS 2008.CON CARGO AL FONDO ESPECIAL DE GRADO 2008.', 'CONTROL DE ESTUDIOS', 'BNS-031', 37, 'PAGADO', NULL, NULL, 'J-30580717-5', 'FONDO ESPECIAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-07', '02812446', '268.00', 'OGLA BRAVO', 'CANCELACION QUE SE HACE A LA LIC. OGLA BRAVO POR CONCEPTO DE REEMBOLSO POR GASTOS OCASIONADOS EN EL ACTO DE GRADO 2008. SEGUN FACTURA N 00829226-05 DE FECHA 04-03-2008 POR BsF 117.00; Nº 014 DE FECHA 06-03-2008 POR BsF 41.00; Nº 2994 DE FECHA 04-03-2008 POR BsF 110.00. PARA UN TOTAL DE BsF 268.00. CON CARGO AL FONDO ACTO DE GRADO 2008.', 'CONTROL DE ESTUDIOS', 'BNS-032', 38, 'PAGADO', NULL, NULL, '1565892', 'FONDO ESPECIAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-06', '03812441', '460.09', 'YOEL CASTILLO', 'CANCELACION QUE SE HACE AL ING. YOEL CASTILLO, TITULAR DE LA CEDULA DE IDENTIDAD NRO V-13.063.614, COORDINADOR DE CONTROL DE ESTUDIOS DE LA UBV SEDE BARINAS / PORTUGUESA, POR CONCEPTO DE REEMBOLSO DE GASTOS OCASIONADOS POR MOTIVOS DE ACTIVIDADES RELACIONADAS CON ACTO DE GRADO 2008. SEGUN FACTURAS NROS 00061084 DE FECHA 05-03-2008, DE BSF 104.84, 00061155 DE FECHA 05-03-2008, DE BSF 157.25, 1523 DE FECHA 16-02-2008, DE BSF 69.00, 007840 DE FECHA 27-02-2008,DE BSF 112.00, 18080 DE FECHA 27-02-2008, DE BSF 3.00, 010209 DE FECHA 27-02-2008, DE BSF 7.00, Y FACTURA SIN NUMERO DE FECHA 28-02-2008, DE BSF 7.00.', 'CONTROL DE ESTUDIOS', 'BNS-028', 34, 'ANULADO', 'ERROR DE IMPRESION', '2008-03-10', 'V-13063614', 'FONDO ESPECIAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-10', '77812447', '224.70', 'YOEL CASTILLO', 'CANCELACION QUE SE HACE AL ING. YOEL CASTILLO, TITULAR DE LA CEDULA DE IDENTIDAD NRO V-13.063.614, COORDINADOR DE CONTROL DE ESTUDIOS DE LA UBV SEDE BARINAS / PORTUGUESA, POR CONCEPTO DE REEMBOLSO DE GASTOS OCASIONADOS POR MOTIVOS DE ACTIVIDADES RELACIONADAS CON ACTO DE GRADO 2008. SEGUN FACTURAS NROS 037714, DE FECHA 04-03-2008; BSF 3.50, 157525, DE FECHA 06-03-2008; BSF 2.20, 8387, DE FECHA 07-03-2008, BSF 34.00, 37077, DE FECHA 08-03-2008, BSF 85.00, 15081, DE FECHA 08-03-2008, BSF 100.00, PARA UN TOTAL DE BSF 224.70, CON CARGO AL FONDO ESPECIAL DE ACTO DE GRADO 2008.
', 'CONTROL DE ESTUDIOS', 'BNS-033', 39, 'PAGADO', NULL, NULL, 'V-13063614', 'FONDO ESPECIAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-11', '61812449', '376', 'YOEL CASTILLO', 'CANCELACION QUE SE LE HACE AL ING YOEL CASTILLO POR CONCEPTO DE ASISTENCIA A LA SEDE CARACAS PARA REALIZAR REVISION Y CORRECCION EN NOTAS CERTIFICADAS Y TITULOS DE LOS GRADUANDOS EN GESTION SOCIAL Y GESTION AMBIENTAL 2008.', 'CONTROL DE ESTUDIOS', 'BNS-035', 41, 'ANULADO', 'ERROR DE IMPRESION', '2008-03-11', 'V-13063614', 'FONDO ESPECIAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-11', '85812450', '376.00', 'YOEL CASTILLO', 'CANCELACION QUE SE LE HACE AL ING YOEL CASTILLO POR CONCEPTO DE ASISTENCIA A LA SEDE CARACAS PARA REALIZAR REVISION Y CORRECCION EN NOTAS CERTIFICADAS Y TITULOS DE LOS GRADUANDOS EN GESTION SOCIAL Y GESTION AMBIENTAL 2008.', 'CONTROL DE ESTUDIOS', 'BNS-036', 42, 'PAGADO', NULL, NULL, 'V-13063614', 'FONDO ESPECIAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-11', '97812448', '69925.00', 'ASOCIACION COOPERATIVA  EVENTOS CHELAS', 'CANCELACION QUE SE LE HACE A LA EMPRESA ASOCIACION COOPERATIVA EVENTOS CHELAS POR CONCEPTO DE COMPRA DE REFRIGERIOS, ALQUILER DE EQUIPOS, Y SERVICIOS DE TRANSPORTE, Y OTROS MATERIALES Y SUMINISTROS,  SEGUN FACTURAS Nº 0238 DE FECHA 10-03-2008, 0237, DE FECHA 10-03-2008, CON CARGO AL FONDO ESPECIAL DE GRADO 2008.  ', 'COORDINACION DE ADMINISTRACION', 'BNS-034', 40, 'PAGADO', NULL, NULL, '', 'FONDO ESPECIAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-14', '50812451', '1770', 'YRENE LOZADA', 'CANCELACION QUE SE LE HACE A LA PROF. YRENE LOZADA TITULAR DE LA CEDULA DE IDENTIDAD V- 9.406.887, POR CONCEPTO DE ASISTENCIA A JORNADAS PREPARATORIAS DE UBV XXI PROYECTO Y PASANTIAS. REALIZADAS EN LA UBV BARINAS. CON CARGO AL FONDO ESPECIAL DE GRADO 2008', 'COORDINACION DE ADMINISTRACION', 'BNS-037', 43, 'PAGADO', NULL, NULL, '9406887', 'FONDO ESPECIAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-24', '70812452', '278', 'YOEL CASTILLO', 'CANCELACION QUE SE LE HACE AL ING YOEL CASTILLO POR CONCEPTO DE ASISTENCIA A LA SEDE UBV CARACAS LOS DIAS 24 AL 26 DE MARZO DEL 2008. PARA HACER RETIRO DE BOINAS, TOGAS, MEDALLAS, Y ULTIMAR PREPARATIVOS PARA EL ACTO DE CONFERIMIENTO DE TÍTULO DE LOS GRADUANDOS EN GESTIÓN AMBIENTAL Y GESTIÓN SOCIAL. CON CARGO AL FONDO ESPECIAL DE GRADO 2008.', 'CONTROL DE ESTUDIOS', 'BNS-038', 44, 'PAGADO', NULL, NULL, 'V-13063614', 'FONDO ESPECIAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-24', '44812453', '248', 'MARCOS SANCHEZ', 'CANCELACION QUE SE LE HACE AL SR MARCOS SANCHEZ POR CONCEPTO DE TRASLADO DE PERSONAL ADMINISTRATIVO A LA SEDE UBV CARACAS,LOS DIAS 24 AL 26 DE MARZO DEL 2008. PARA REALIZAR RETIRO DE TOGAS, BOINAS, Y MEDALLAS PARA EL ACTO DE CONFERIMIENTO DE TÍTULO DE LOS GRADUANDOS DE GESTIÓN AMBIENTAL Y GÉSTIÓN SOCIAL. CON CARGO AL FONDO ESPECIAL DE GRADO 2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-039', 45, 'PAGADO', NULL, NULL, 'V-4343047', 'FONDO ESPECIAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-24', '64812454', '254', 'NICAMAR ABREU', 'CANCELACION QUE SE LE HACE A LA ING NICAMAR ABREU ASISTENCIA A LA SEDE UBV CARACAS LOS DIAS 24 AL 26 DE MARZO DEL 2008. PARA REALIZAR RETIRO DE TOGAS, BOINAS Y MEDALLAS PARA EL ACTO DE CONFERIMIENTO DE TÍTULOS DE LOS GRADUANDOS DE GESTIÓN AMBIENTAL Y GESTIÓN SOCIAL. CON CARGO AL FONDO ESPECIAL DE GRADO 2008', 'CONTROL DE ESTUDIOS', 'BNS-040', 46, 'PAGADO', NULL, NULL, '11715878', 'FONDO ESPECIAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '23812457', '258', 'CARLOS RAMÍREZ', 'CANCELACION QUE SE LE HACE AL LIC CARLOS RAMIREZ TITULAR DE LA CEDULA DE IDENTIDAD NRO V 10.562.912, POR CONCEPTO DE DILIGENCIAS REALIZADAS CON RESPECTO A LA ASIGNACIONES DE BECAS 2007 Y EL PAGO DE PROFESORES PARA EL LAPSO 2007-2. DESDE 02-03-2008 HASTA EL 03-03-2008. CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE MISION SUCRE', 'BNS-043', 49, 'PAGADO', NULL, NULL, '10562912', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '18812459', '576', 'ROSEMARY DAVILA', 'CANCELACION QUE SE LE HACE A LA LIC ROSEMARY DAVILA TITULAR DE CEDULA DE IDENTIDAD NRO V 15.073.565, POR CONCEPTO DE PARTICIPACIÓN AL SIMPOSIO INTERNACIONAL SOBRE METODOLOGÍA DE LA SISTEMATIZACIÓN DE EXPERIENCIAS COMUNITARIAS REALIZADO EN LA UBV CARACAS DEL 05 AL 09/03/2008. CON CARGO AL FONDO DE AVANCE.', 'GESTION SOCIAL', 'BNS-045', 51, 'PAGADO', NULL, NULL, '15073565', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '43812458', '764', 'MIREL VOLCÁN', 'CANCELACION QUE SE LE HACE A LA LIC MIREL VOLCAN TITULAR DE LA CEDULA DE IDENTIDAD NRO V 9.986.790 POR CONCEPTO DE PARTICIPACIÓN EN EL SIMPOSIO INTERNACIONAL SOBRE METODOLOGÍA DE LA SISTEMATIZACIÓN DE EXPERIENCIAS COMUNITARIAS, REALIZADAS EN LA UBV CARACAS DEL 03 AL 09/03/2008. CON CARGO AL FONDO DE AVANCE.', 'GESTION AMBIENTAL', 'BNS-044', 50, 'PAGADO', NULL, NULL, '18224900', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '01812463', '552', 'ANA MAR COLMENARES', 'CANCELACION QUE SE LE HACE A LA LIC ANA MAR COLMENARES TITULAR DE LA CEDULA DE IDENTIDAD NRO V 13.063.445 POR CONCEPTO DE ASISTENCIA AL PRIMER ENCUENTRO NACIONAL DE PSICOSOCIAL CELEBRADO EN LA UBV CARACAS. DESDE EL 03-03-2008 AL 07-03-2008. CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE BIENESTAR ESTUDIANTIL', 'BNS-050', 56, 'PAGADO', NULL, NULL, 'V-13063445', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '00812468', '682', 'YSHAMDRA AL HAJALI', 'CANCELACION QUE SE LE HACE A LA LIC YSHAMDRA AL HAJALI TITULAR DE LA CEDULA DE IDENTIDAD NRO V 16.513.698 POR CONCEPTO DE ASISTENCIA AL CONSEJO NACIONAL DÉL PFG EN ESTUDIOS JURÍDICOS, CELEBRADO EN LA UBV CARACAS. DESDE EL 04 AL 09 DE MARZO DEL 2008. CON CARGO AL FONDO DE AVANCE.', 'ESTUDIOS JURIDICOS', 'BNS-055', 61, 'PAGADO', NULL, NULL, '16513698', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '31812460', '552', 'JAVIER RONDÓN', 'CANCELACION QUE SE LE HACE AL LIC JAVIER RONDON TITULAR DE LA CEDULA DE IDENTIDAD NRO V 9.387.902 POR CONCEPTO DE PARTICIPACIÓN EN EL SIMPOSIO INTERNACIONAL SOBRE METODOLOGÍA DE LA SISTEMATIZACIÓN DE EXPERIENCIAS COMUNITARIAS REALIZADO EN LA SEDE UBV CARACAS DEL 03 A 07/03/2008. CON CARGO AL FONDO DE AVANCE.', 'GESTION SOCIAL', 'BNS-046', 52, 'PAGADO', NULL, NULL, '9387902', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '15812466', '208.60', 'ESTEBAN PÉREZ', 'CANCELACION QUE SE LE HACE AL SR ESTEBAN PEREZ TITULAR DE LA CEDULA DE IDENTIDAD NRO V 10.052.857 POR CONCEPTO DE SERVICIOS DE TRASLADO A LAS DIFERENTES ALDEAS UNIVERSITARIAS DEL ESTADO BARINAS. DESDE EL 19 AL 20 DE ENERO 2008. CON CARGO AL FONDO DE AVANCE.', 'SERVICIOS GENERALES', 'BNS-053', 59, 'PAGADO', NULL, NULL, '10052857', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '39812455', '5998.80', 'FRANCISCO JIMENEZ', 'PRIMERA REPOSICION DE CAJA CHICA PARA LOS GASTOS INMEDIATOS INTERNOS DE LA SEDE BARINAS / PORTUGUESA, CHEQUE QUE SE REALIZA A NOMBRE DE FRANCISCO JIMENEZ MENSAJERO DE LA UNIVERSIDAD. CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE ADMINISTRACION', 'BNS-064', 70, 'PAGADO', NULL, NULL, 'V-6384084', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '41812475', '282', 'JUAN HERNÁNDEZ', 'CANCELACION QUE SE LE HACE AL SR JUAN HERNANDEZ TITULAR DE LA CEDULA DE IDENTIDAD NRO V 12.509.151 POR CONCEPTO DE ASISTIR A REUNIóN EN LA DIRECCIóN NACIONAL DE SEGURIDAD, PARA TRATAR CASOS DE PAGOS RETRASADOS DE LOS NUEVOS INGRESOS DEL PERSONAL DE SEGURIDAD. DESDE EL 25 AL 26 DE MARZO DEL 2008. CON CARGO AL FONDO DE AVANCE.', 'SEGURIDAD', 'BNS-062', 68, 'ANULADO', 'ERROR EN EL CALCULO', '2008-03-26', '12509151', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '80812467', '387.50', 'MARCOS SANCHEZ', 'CANCELACION QUE SE LE HACE AL SR MARCOS SANCHEZ TITULAR DE LA CEDULA DE IDENTIDAD NRO V 4.383.047 POR CONCEPTO DE SERVICIOS DE TRANSPORTE DEL PERSONAL DOCENTE A LAS DIFERENTES ALDEAS UNIVERSITARIAS. DESDE EL 19 AL 22 DE ENERO DEL 2008. CON CARGO AL FONDO DE AVANCE.', 'SERVICIOS GENERALES', 'BNS-054', 60, 'PAGADO', NULL, NULL, 'V-4343047', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '82812472', '446', 'YENITZA SANDOVAL', 'CANCELACION QUE SE LE HACE A LA LIC YENITZA SANDOVAL TITULAR DE LA CEDULA DE IDENTIDAD NRO V 12.831.247 POR CONCEPTO DE ASISTENCIA A LAS II JORNADAS NACIONALES DE REVISIóN DE UNIDADES CURRICULARES QUE SE REALIZARá EN LA UBV CARACAS. DESDE EL 01 AL 04 DE ABRIL 2008. CON CARGO AL FONDO DE AVANCE.', 'COMUNICACION SOCIAL', 'BNS-059', 65, 'PAGADO', NULL, NULL, '12831247', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '74812469', '148', 'FELIX A. VITRIAGO', 'CANCELACION QUE SE LE HACE AL SR FELIX VITRIAGO TITULAR DE LA CEDULA DE IDENTIDAD NRO V 8.132.701 POR CONCEPTO DE ASISTENCIA A REUNIóN REALIZADA EN LA SEDE UBV CARACAS, EN LA DIRECCIóN NACIONAL DE SERVICIOS ESTUDIANTILES. DESDE EL 02 AL 03 DE MARZO DEL 2008. CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE ADMINISTRACION', 'BNS-056', 62, 'PAGADO', NULL, NULL, '8132701', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '62812471', '600', 'CARLOS RAMÍREZ', 'CANCELACION QUE SE LE HACE AL LIC CARLOS RAMIREZ TITULAR DE LA CEDULA DE IDENTIDAD NRO V 10.562.912 POR CONCEPTO DE ASISTENCIA A LA IV REUNIóN NACIONAL DE MISIóN SUCRE REALIZAD EN LA CIUDAD DE CARACAS. DESDE EL 14 AL 18 DE ENERO DEL 2008. CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE MISION SUCRE', 'BNS-058', 64, 'PAGADO', NULL, NULL, '10562912', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '16812461', '446', 'VICTOR PERALTA', 'CANCELACION QUE SE LE HACE AL LIC VICTOR PERALTA TITULAR DE LA CEDULA DE IDENTIDAD NRO V 10.059.412, POR CONCEPTO DE ASISTENCIA AL CONSEJO NACIONAL DE AGROECOLOGÍA CELEBRADO EN LA SEDE UBV CARACAS LOS DÍAS 20 Y 23 DE FEBRERO DE 2008. CON CARGO AL FONDO DE AVANCE', 'COORDINACION DE AGROECOLOGIA', 'BNS-047', 53, 'PAGADO', NULL, NULL, '10059412', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '11812464', '192.30', 'DUILIO LOZADA', 'CANCELACION QUE SE LE HACE AL SR DUILIO LOZADA TITULAR DE LA CEDULA DE IDENTIDAD NRO 9.326.804 POR CONCEPTO DE SERVICIO DE TRANSPORTE DEL PERSONAL DOCENTE A LAS DIVERSAS ALDEAS UNIVERSITARIAS. DESDE EL 27 AL 28 DE ENERO 2008. CON CARGO AL FONDO DE AVANCE.', 'SERVICIOS GENERALES', 'BNS-051', 57, 'PAGADO', NULL, NULL, '9326804', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '98812470', '148', 'MARCOS SANCHEZ', 'CANCELACION QUE SE LE HACE AL SR MARCOS SANCHEZ TITULAR DE LA CEDULA DE IDENTIDAD NRO V 4.383.047 POR CONCEPTO DE ASISTENCIA A REUNIóN EN LA DIRECCIóN NACIONAL DE SERVISIóN ESTUDIANTILES, REALIZADA EN LA UBV CARACAS. DESDE EL 02 AL 03 DE MARZO DEL 2008. CON CARGO AL FONDO DE AVANCE.', 'SERVICIOS GENERALES', 'BNS-057', 63, 'PAGADO', NULL, NULL, 'V-4343047', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '77812474', '446', 'MARIA TERESA BORREGO', 'CANCELACION QUE SE LE HACE A LA LIC MARIA TERESA BORREGO TITULAR DE LA CEDULA DE IDENTIDAD NRO V 7.801.949 POR CONCEPTO DE ASISTENCIA A LAS II JORNADAS NACIONALES DE REVISIóN  DE UNIDADES CURRICULARES QUE SE REALIZARá EN LA SEDE CARACAS.DESDE EL 01 AL 04 DE ABRIL DEL 2008. CON CARGO AL FONDO DE AVANCE.', 'COMUNICACION SOCIAL', 'BNS-061', 67, 'PAGADO', NULL, NULL, '7801949', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '57812473', '446', 'MANUEL MARQUEZ', 'CANCELACION QUE SE LE HACE AL LIC MANUEL MARQUEZ TITULAR DE LA CEDULA DE IDENTIDAD NRO V 4.853.036 POR CONCEPTO DE ASISTENCIA A LA II JORNADA NACIONAL DE REVISIóN DE UNIDADES CURRICULARES QUE SE REALIZARá EN LA UBV CARACAS. 01 AL 04 DE ABRIL DEL 2008. CON CARGO AL FONDO DE AVANCE.', 'COMUNICACION SOCIAL', 'BNS-060', 66, 'PAGADO', NULL, NULL, '4853036', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '61812476', '470', 'ESTEBAN PÉREZ', 'CANCELACION QUE SE LE HACE AL SR ESTEBAN PEREZ TITULAR DE LA CEDULA DE IDENTIDAD NRO V 10.052.857 POR CONCEPTO DE TRASLADO DE PERSONAL ESTUDIANTIL DEL PFG EN AGROECOLOGíA A JORNADA VACACIONAL SEMANA SANTA 2008. DESDE EL 17 AL 20 DE MARZO DEL 2008. CON CARGO AL FONDO DE AVANCE.', 'SERVICIOS GENERALES', 'BNS-063', 69, 'PAGADO', NULL, NULL, '10052857', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '59812456', '446', 'ENRIQUE AGUILERA', 'CANCELACION QUE SE LE HACE AL LIC. ENRIQUE AGUILERA, TITULAR DE LA CEDULA DE IDENTIDAD NRO V-11.190.952, POR CONCEPTO DE ASISTENCIA A LA SEDE CARACAS PARA TRATAR ASPECTOS RELACIONADOS A LAS EXPERIENCIAS DE LA JORNADA NACIONAL DE UBV XXI.DESDE 27-02-2008 HASTA 01-03-2008, CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE PROYECTOS  PASANTIAS', 'BNS-041', 47, 'ANULADO', 'ERROR DE FECHA', '2008-03-26', 'V-11190952', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '36812477', '446', 'ENRIQUE AGUILERA', 'CANCELACION QUE SE LE HACE AL LIC. ENRIQUE AGUILERA, TITULAR DE LA CEDULA DE IDENTIDAD NRO V-11.190.952, POR CONCEPTO DE ASISTENCIA A LA SEDE CARACAS PARA TRATAR ASPECTOS RELACIONADOS A LAS EXPERIENCIAS DE LA JORNADA NACIONAL DE UBV XXI.DESDE 27-02-2008 HASTA 01-03-2008, CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE PROYECTOS  PASANTIAS', 'BNS-063', 71, 'PAGADO', NULL, NULL, 'V-11190952', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '21812479', '1435.11', 'FRANCISCO LOPEZ', 'CANCELACION QUE SE LE HACE AL ING FRANCISCO LOPEZ TITULAR DE LA CEDULA DE IDENTIDAD NRO V 1.988.874, COORDINADOR DE LA SEDE BARINAS - PORTUGUESA, POR CONCEPTO DE REEMBOLSO DE GASTOS OCASIONADOS EN LA SEDE DURANTE LOS MESES DE FEBRERO Y MARZO SEGUN FACTURAS ANEXAS Y CON CARGO A MATERIALES Y UTILES DE LIMPIEZA BSF 37.35, ARTICULOS DE FERRETERIA BSF 1.397.76, TOTAL BSF 1.435.11. CON CARGO AL FONDO DE AVANCE.', 'COORDINACION REGIONAL ', 'BNS-065', 73, 'PAGADO', NULL, NULL, 'V-1988874', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '44812480', '100.49', 'NOEL PERALTA', 'CANCELACION QUE SE LE HACE AL ING NOEL PERALTA TITULAR DE LA CEDULA DE IDENTIDAD NRO V 7.237.276, COORDINADOR DE INFORMATICA, POR CONCEPTO DE REEMBOLSO POR GASTOS OCASIONADOS EN EL LABORATORIO DE INFORMATICA, DURANTE LOS MESES DE FEBRERO Y MARZO 2008. SEGUN FACTURAS ANEXAS, CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE INFORMATICA', 'BNS-066', 74, 'PAGADO', NULL, NULL, 'V-7237276', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '19812481', '200', 'ALFREDO RAMOS', 'CANCELACION QUE SE LE HACE AL LIC ALFREDO RAMOS TITULAR DE LA CEDULA DE IDENTIDAD NRO V 5.949.417 COORDINADOR DE CULTURA, POR CONCEPTO DE REEMBOLSO POR GASTOS OCASIONADO CON MOTIVO DE ALQUILER DE SONIDO UTILIZADO DURANTE EL ACTO DE HOMENAJE A LAS MUJERES DE LA COMUNIDAD NEGRO PRIMERO EL DIA 13-03-2008, CON CARGO AL FONDO DE AVANCE. ', 'COORDINACION DE CULTURA', 'BNS-067', 75, 'PAGADO', NULL, NULL, 'V-5949417', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '56812478', '658', 'LUIS FLORES', 'CANCELACION QUE SE LE HACE AL LIC LUIS FLORES POR CONCEPTO DE TRASLADO A CARACAS PARA REALIZAR UN TALLER SOBRE EVALUACION Y DESEMPEÑO LABORAL, DESDE EL DIA 15 AL 18 DE ENERO DEL 2008, CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE TALENTO HUMANO', 'BNS-064', 72, 'PAGADO', NULL, NULL, 'V-3593862', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '39812482', '78.24', 'FARMACIA LA TRINIDAD C.A.', 'CANCELACION QUE SE LE HACE A FARMACIA LA TRINIDAD CA POR CONCEPTO DE MEDICINAS SUMINISTRADAS A ESTUDIANTES DE AGROECOLOGIA DURANTE EL MES DE FEBRERO DEL 2008. SEGUN FACTURA NRO 358912 DE FECHA 01-02-2008, CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE ADMINISTRACION', 'BNS-068', 76, 'PAGADO', NULL, NULL, 'J-30614875-2', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '13812483', '505.26', 'MULTISERVICIOS SAN ANDRES, C.A', 'CANCELACION QUE SE LE HACE A LA EMPRESA MULTISERVICIOS SAN ANDRES CA POR CONCEPTO DE LAVADO, LAVADO DE MOTOR, ENGRASE, DUCHA, CAMBIO DE ACEITE Y FILTRO, A LA CAMIONETA TOYOTA AFG 69C SEGUN FACTURAS 00237 DE FECHA 23-01-2008, 0025 DE FECHA 07-02-2008, 00277 DE FECHA 25-02-2008, CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE ADMINISTRACION', 'BNS-069', 77, 'PAGADO', NULL, NULL, 'J-29428263-6', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '95812492', '1373.66', 'EL DIARIO DE LOS LLANOS BARINESES C.A.', 'CANCELACION QUE SE LE HACE A LA EMPRESA EL DIARIO DE LOS LLANOS BARINESES CA POR CONCEPTO DE AVISO PUBLICITARIO CON MOTIVO DE IMPOSICION DE MEDALLAS DE ACTO DE GRADO DE LOS PRIMEROS TECNICOS SUPERIORES UNIVERSITARIOS, PUBLICADO EL DIA 06-03-2008.SEGUN FACTURA NRO 12627 DE FECHA 18-03-2008. CON CARGO AL FONDO DE AVANCE. ', 'COORDINACION DE ADMINISTRACION', 'BNS-078', 86, 'PAGADO', NULL, NULL, 'J-30727568-5', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '23812484', '1784.41', 'DIARIO LA NOTICIA DE BARINAS', 'CANCELACION QUE SE LE HACE A LA EMPRESA DIARIO LA NOTICIA DE BARINAS POR CONCEPTO DE 2000 EJEMPLARES FULL COLOR DEL PERIODICO UBEVISTA REVOLUCIONARIO 3RAQ EDICION SEGUN PRESUPUESTO ANEXO. CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE ADMINISTRACION', 'BNS-070', 78, 'PAGADO', NULL, NULL, 'V-12779802-4', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '18812486', '6585.23', 'EL REY DEL FRIO, C.A.', 'CANCELACION QUE SE LE HACE A LA EMPRESA EL REY DEL FRIO CA POR CONCEPTO DE MANTENIMIENTO PREVENTIVO DE LOS AIRES ACONDICIONADOS RECARGA DE 30 TONELADAS DE GAS; ASI COMO SUMINISTROS ES INSTALACION DE BREAKER TRIFACICO. SEGUN FACTURAS 001134 DE FECHA 25-02-2008, CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE ADMINISTRACION', 'BNS-072', 80, 'PAGADO', NULL, NULL, 'V-30859479-2', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '87812489', '1284.20', 'SERVICIOS MERIDA C.A.', 'CANCELACION QUE SE LE HACE A LA EMPRESA SERVICIOS MERIDA CA POR CONCEPTO DE CAMBIO DE ACEITE Y FILTRO A LOS VEHICULOS CHEVROLET LUV DMAX PLACA A20AV6A Y CHEVROLET LUV DMAX PLACA A42AB12, SEGUN FACTURAS 1690 Y 1691 DE FECHA 11-03-2008; ASI MISMO SE CANCELA MANTENIMIENTO DE VEHICULO IVECO PLACA 11T-MBC CON CARGO AL FONDO DE AVANCE', 'COORDINACION DE ADMINISTRACION', 'BNS-075', 83, 'PAGADO', NULL, NULL, 'J-30876921-5', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '75812491', '8009.45', 'PROVEEDURIA ESTUDIANTIL LOS LLANOS (PROVELLANOS)', 'CANCELACION QUE SE LE HACE A LA EMPRESA PROVEEDURIA ESTUDIANTIL LOS LLANOS (PROVELLANOS) POR CONCEPTO DE SUMINISTROS DE MATERIALES UTILIZADOS EN LAS DIFERENTES COORDINACIONES DE LA SEDE BARINAS PORTUGUESA CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE ADMINISTRACION', 'BNS-077', 85, 'PAGADO', NULL, NULL, 'V-16699923-1', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '80812494', '203', 'FRANCISCO LOPEZ', 'CANCELACION QUE SE LE HACE AL ING FRANCISCO LOPEZ TITULAR DE LA CEDULA DE IDENTIDAD NRO V 1.988.874 COORDINADOR REGIONAL UBV BARINAS PORTUGUESA POR CONCEPTO DE VIAJE REALIZADO A LA SEDE CARACAS, PARA RETIRAR UNIDADES DE TRANSPORTE ASIGNADAS A LA SEDE BARINAS. DESDE 28-02-2008 HASTA 29-02-2008 CON CARGO AL FONDO DE AVANCE.', 'COORDINACION REGIONAL ', 'BNS-080', 88, 'PAGADO', NULL, NULL, 'V-1988874', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '08812485', '2261.76', 'COMPUSERVICIOS ARPANET C.A.', 'CANCELACION QUE SE LE HACE A LA EMPRESA COMPUSERVICIOS ARPANET CA POR CONCEPTO DE SUMINISTROS DE MASTER PRINT PARA SER COLOCADO EN EL COPY PRINTER SEGUN FACTURA NRO 000397 DE FECHA 25-02-2008, CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE ADMINISTRACION', 'BNS-071', 79, 'PAGADO', NULL, NULL, 'J-31282012-8', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '54812495', '552', 'FÉLIX GALINDEZ', 'CANCELACION QUE SE LE HACE AL LIC FELIX GALINDEZ TITULAR DE LA CEDULA DE IDENTIDAD NRO V 11.191.100 POR CONCEPTO DE ASISTENCIA AL TALLER DE SEMIPRESENCIALIDAD A REALIZARSE EN LA SEDE UBV CARACAS. DESDE EL 26-03-2008 HASTA EL 30-03-2008 CON CARGO AL FONDO DE AVANCE.', 'ESTUDIOS JURIDICOS', 'BNS-081', 89, 'PAGADO', NULL, NULL, 'V-11191100', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '92812487', '179.17', 'LAS MARGARITAS VARIEDADES C.A.', 'CANCELACION QUE SE LE HACE A LA EMPRESA LAS MARGARITAS VARIEDADES CA POR CONCEPTO DE COMPRA DE 50 ROSAS Y ARREGLO FLORAL CON MOTIVO A LA CELEBRACION DEL DIA DE LA MUJER SEGUN FACTURA NRO 05203 DE FECHA 07-03-2008 CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE ADMINISTRACION', 'BNS-073', 81, 'PAGADO', NULL, NULL, 'J-30959385-4', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '12812488', '1264.25', 'DIARIO LA NOTICIA DE BARINAS', 'CANCELACION QUE SE LE HACE A LA EMPRESA DIARIO LA NOTICIA DE BARINAS POR CONCEPTO DE UNA PAGINA DE AVISO PUBLICITARIO CON MOTIVO DE IMPOSICION DE MEDALLAS DE ACTO DE GRADO A LOS PRIMEROS TECNICOS SUPERIORES UNIVERSITARIOS PUBLICADO EL DIA 06-03-2008 SEGUN FACTURA NRO 005650. CON CARGO AL FONDO DE AVANCE. ', 'COORDINACION DE ADMINISTRACION', 'BNS-074', 82, 'PAGADO', NULL, NULL, 'V-12779802-4', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '74812496', '552', 'GLADYS VILLEGAS', 'CANCELACION QUE SE LE HACE A LA LIC GLADYS VILLEGAS TITULAR DE LA CEDULA DE IDENTIDAD NRO V 12.203.397 POR CONCEPTO DE ASISTENCIA AL TALLER DE SEMIPRESENCIALIDAD, A REALIZARSE EN LA SEDE UBV CARACAS. DESDE EL 26-03-2008 HASTA EL 30-03-2008 CON CARGO AL FONDO DE AVANCE.', 'ESTUDIOS JURIDICOS', 'BNS-082', 90, 'PAGADO', NULL, NULL, 'V-12203397', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '95812465', '310.15', 'JHON VELASQUEZ', 'CANCELACION QUE SE LE HACE AL SR JHON VELASQUEZ TITULAR DE LA CEDULA DE IDENTIDAD NRO V 12.781.174 POR CONCEPTO DE SERVICIO DE TRASLADO AL PERSONAL DOCENTE UBV A LAS DIFERENTES ALDEAS UNIVERSITARIAS. DESDE 26 AL 28 DE ENERO 2008 POR Bs. 230; ALIMENTOS Y BEBIDAS BS. 19.75; COMBUSTIBLES Y LUBRICANTES BS. 60.40 PARA UN TOTAL  A CANCELAR DE 310.15 BS.CON CARGO AL FONDO DE AVANCE.', 'SERVICIOS GENERALES', 'BNS-052', 58, 'PAGADO', NULL, NULL, '12781174', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '01812490', '983.65', 'DISTRIBUIDORA J.C. HAHN', 'CANCELACION QUE SE LE HACE A LA EMPRESA DISTRIBUIDORA J.C. HAHN POR CONCEPTO DE SUMINISTRO DE 169 BOTELLONES DE AGUA DURANTE LOS MESES DE FEBRERO Y MARZO DEL 2008 SEGUN FACTURAS NRO 010372 DE FECHA 15-02-2008, 010408 DE FECHA 22-02-2008, 010503 DE FECHA 16-03-2008, 010558 DE FECHA 24-03-2008, CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE ADMINISTRACION', 'BNS-076', 84, 'PAGADO', NULL, NULL, 'V-10562624-6', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '60812493', '364', 'JUAN HERNÁNDEZ', 'CANCELACION QUE SE LE HACE AL SR JUAN HERNANDEZ TITULAR DE LA CEDULA DE IDENTIDAD NRO V 12.509.151 POR CONCEPTO DE ASISTIR A LA UBV CARACAS POR REUNION EN LA DIRECCION NACIONAL DE SEGURIDAD PARA TRATAR CASOS DE PAGOS RETRASADOS DE LOS NUEVOS INGRESOS DEL PERSONAL DE SEGURIDAD. DESDE EL 25-03-2008 HASTA EL 27-03-2008 CON CARGO AL FONDO DE AVANCE', 'SEGURIDAD', 'BNS-079', 87, 'PAGADO', NULL, NULL, '12509151', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '49812497', '552', 'MARILYN VARGAS', 'CANCELACION QUE SE LE HACE A LA BACHILLER MARILYN VARGAS TITULAR DE LA CEDULA DE IDENTIDAD NRO V 13.967.194 POR CONCEPTO DE ASISTENCIA AL TALLER DE SEMIPRESENCIALIDAD A REALIZARSE EN LA SEDE UBV CARACAS. DESDE EL 26-03-2008 HASTA EL 30-03-2008,', 'ESTUDIANTE', 'BNS-083', 91, 'PAGADO', NULL, NULL, 'V-13967194', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-26', '69812498', '552', 'ROKGLAY MOLERO', 'CANCELACION QUE SE LE HACE A LA CIUDADANA ROKGLAY MOLERO TITULAR DE LA CEDULA DE IDENTIDAD NRO V 12.836.864 POR CONCEPTO DE ASISTENCIA AL TALLER DE SEMIPRESENCIALIDAD A REALIZARSE EN LA SEDE UBV CARACAS DESDE 26-03-2008 HASTA 30-03-2008 CON CARGO AL FONDO DE AVANCE', 'COORDINACION DE ADMINISTRACION', 'BNS-084', 92, 'PAGADO', NULL, NULL, 'V-12836864', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-27', '33812499', '442', 'ANA MAR COLMENARES', 'CANCELACION QUE SE LE HACE A LA LIC. ANA MAR COLMENARES TITULAR DE LA CEDULA DE IDENTIDAD Nº V-13.063.445, POR ASISTENCIA AL II ENCUENTRO INTERNACIONAL DE ESTUDIANTES UNIVERSITARIOS A REALIZARSE EN EL HOTEL IPASMAR DEL ESTADO MIRANDA DEL 10 AL 14-04-2008. CON CARGO AL FONDO DE AVANCE.', 'BIENESTAR ESTUDIANTIL', 'BNS-085', 93, 'PAGADO', NULL, NULL, 'V-13063445', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-27', '79812500', '431', 'DOMINGO ANATO', 'CANCELACION QUE SE LE HACE AL LIC DOMINGO ANATO TITULAR DE LA CEDULA DE IDENTIDAD NRO V 14.827.336 COORDINADOR DE ADMINISTRACION POR CONCEPTO DE ASISTENCIA A LA SEDE UBV CARACAS PARA TRATAR ASUNTOS ADMINISTRATIVOS RELACIONADOS CON LA SEDE BARINAS. DESDE 02-04-2008 HASTA 05-04-2008 CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE ADMINISTRACION', 'BNS-086', 94, 'PAGADO', NULL, NULL, 'V-14827336', 'FONDO MENSUAL');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif, tipo_f) VALUES ('2008-03-25', '26812462', '364', 'ABBY OLAECHEA', 'CANCELACION QUE SE LE HACE A LA LIC ABBY OLAECHEA TITULAR DE LA CEDULA DE IDENTIDAD NRO V 4.926.074 POR CONCEPTO DE ASISTENCIA A REUNION NACIONAL DE COORDINADORES DE DESARROLLO ESTUDIANTIL REALIZADA EN LA SEDE UBV CARACAS.DESDE EL 27-02-2008 AL 29-02-2008. CON CARGO AL FONDO DE AVANCE.', 'COORDINACION DE BIENESTAR ESTUDIANT', 'BNS-048', 54, 'ANULADO', 'NO ASISTIO A LA REUNION PAUTADA', '2008-03-27', '4926074', 'FONDO MENSUAL');


--
-- TOC entry 1699 (class 0 OID 16399)
-- Dependencies: 1317
-- Data for Name: configuracion; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO configuracion (coordinador_sede, coordinador_adm, administrador, cuenta, iva, isrl, id_configuracion, sede, rif, comienzo_anio) VALUES ('ING. FRANCISCO LOPEZ', 'LIC. DOMINGO ANATO', 'LIC. NAILI SIMANCAS', '0003 0057 82 0001061084', 9, 75, 1, 'BARINAS', 'G-20003773-3', '2008-01-01');


--
-- TOC entry 1715 (class 0 OID 24926)
-- Dependencies: 1347
-- Data for Name: distribucion_caja_chica; Type: TABLE DATA; Schema: public; Owner: leonardo
--



--
-- TOC entry 1700 (class 0 OID 16404)
-- Dependencies: 1319
-- Data for Name: distribucion_cheque; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '91812421', '2', '1272', 'COORDINACION DE ADMINISTRACION', 'BNS-007', 9, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '70812425', '42', '610', 'CONTROL DE ESTUDIOS', 'BNS-011', 13, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '90812426', '42', '610', 'CONTROL DE ESTUDIOS', 'BNS-012', 14, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '64812427', '42', '374', 'BIENESTAR ESTUDIANTIL', 'BNS-013', 15, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '84812428', '42', '374', 'PROYECTOS Y PASANTIAS', 'BNS-014', 16, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '59812429', '42', '250', 'COORDINACION DE ADMINISTRACION', 'BNS-015', 17, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '72812430', '42', '254', 'CONTROL DE ESTUDIOS', 'BNS-016', 18, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '02812419', '15', '97.02', 'AGROECOLOGIA', 'BNS-005', 7, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '16812420', '5', '1200.62', 'COORDINACION DE ADMINISTRACION', 'BNS-006', 8, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '11812422', '2', '637.98', 'COORDINACION DE ADMINISTRACION', 'BNS-008', 10, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '85812423', '44', '1772.42', 'COORDINACION DE ADMINISTRACION', 'BNS-009', 11, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '05812424', '43', '3268.15', 'COORDINACION DE ADMINISTRACION', 'BNS-010', 12, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '18812417', '2', '2800', 'GESTION SOCIAL', 'BNS-003', 5, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '47812431', '27', '5348.53', 'COORDINACION DE ADMINISTRACION', 'BNS-017', 19, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '67812432', '31', '10800', 'COORDINACION DE ADMINISTRACION', 'BNS-018', 21, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '33812416', '27', '5348.53', 'COORDINACION DE ADMINISTRACION', 'BNS-002', 3, 'ANULADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '33812416', '14', '3367.62', 'COORDINACION DE ADMINISTRACION', 'BNS-002', 4, 'ANULADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '28812418', '31', '10800', 'COORDINACION DE ADMINISTRACION', 'BNS-004', 6, 'ANULADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '47812431', '14', '3367.62', 'COORDINACION DE ADMINISTRACION', 'BNS-017', 20, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-18', '31812433', '44', '2932.31', 'COORDINACION DE ADMINISTRACION', 'BNS-019', 22, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-14', '13812415', '0', '6000', 'COORDINACION DE ADMINISTRACION', 'BNS-001', 2, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-26', '51812434', '9', '7490.32', 'COORDINACION DE ADMINISTRACION', 'BNS-020', 1, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-27', '26812435', '44', '35.36', 'COORDINACION DE ADMINISTRACION', 'BNS-021', 24, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-27', '46812436', '44', '62.20', 'COORDINACION DE ADMINISTRACION', 'BNS-022', 25, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-02-27', '11812437', '44', '58.50', 'COORDINACION DE ADMINISTRACION', 'BNS-023', 26, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-04', '31812438', '31', '260', 'COORDINACION DE ADMINISTRACION', 'BNS-024', 27, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-06', '15812439', '42', '416', 'COORDINACION DE ADMINISTRACION', 'BNS-025', 32, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-06', '29812440', '31', '4000', 'COORDINACION DE ADMINISTRACION', 'BNS-026', 33, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-06', '13812442', '31', '300', 'COORDINACION DE ADMINISTRACION', 'BNS-027', 34, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-06', '03812441', '2', '181.00', 'CONTROL DE ESTUDIOS', 'BNS-028', 35, 'ANULADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-06', '03812441', '16', '17.00', 'CONTROL DE ESTUDIOS', 'BNS-028', 36, 'ANULADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-06', '03812441', '9', '262.09', 'CONTROL DE ESTUDIOS', 'BNS-028', 37, 'ANULADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-06', '18812444', '2', '181.00', 'CONTROL DE ESTUDIOS', 'BNS-029', 38, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-06', '18812444', '16', '17.00', 'CONTROL DE ESTUDIOS', 'BNS-029', 39, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-06', '18812444', '9', '262.09', 'CONTROL DE ESTUDIOS', 'BNS-029', 40, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-06', '98812443', '42', '534', 'COORDINACION DE ADMINISTRACION', 'BNS-030', 41, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-07', '82812445', '9', '234.52', 'CONTROL DE ESTUDIOS', 'BNS-031', 42, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-07', '02812446', '2', '41.00', 'CONTROL DE ESTUDIOS', 'BNS-032', 43, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-07', '02812446', '9', '117.00', 'CONTROL DE ESTUDIOS', 'BNS-032', 44, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-07', '02812446', '42', '110.00', 'CONTROL DE ESTUDIOS', 'BNS-032', 45, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-10', '77812447', '2', '34.00', 'CONTROL DE ESTUDIOS', 'BNS-033', 46, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-10', '77812447', '16', '5.70', 'CONTROL DE ESTUDIOS', 'BNS-033', 47, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-10', '77812447', '42', '185.00', 'CONTROL DE ESTUDIOS', 'BNS-033', 48, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-11', '97812448', '2', '53425', 'COORDINACION DE ADMINISTRACION', 'BNS-034', 49, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-11', '97812448', '26', '6300', 'COORDINACION DE ADMINISTRACION', 'BNS-034', 50, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-11', '97812448', '31', '2950', 'COORDINACION DE ADMINISTRACION', 'BNS-034', 51, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-11', '97812448', '32', '7250', 'COORDINACION DE ADMINISTRACION', 'BNS-034', 52, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-11', '61812449', '42', '376', 'CONTROL DE ESTUDIOS', 'BNS-035', 53, 'ANULADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-11', '85812450', '42', '376.00', 'CONTROL DE ESTUDIOS', 'BNS-036', 54, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-14', '50812451', '42', '1770', 'COORDINACION DE ADMINISTRACION', 'BNS-037', 55, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '80812467', '42', '334', 'SERVICIOS GENERALES', 'BNS-054', 117, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '80812467', '16', '29.50', 'SERVICIOS GENERALES', 'BNS-054', 118, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '80812467', '2', '24', 'SERVICIOS GENERALES', 'BNS-054', 119, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '00812468', '42', '682', 'ESTUDIOS JURIDICOS', 'BNS-055', 120, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '74812469', '42', '148', 'COORDINACION DE ADMINISTRACION', 'BNS-056', 121, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '98812470', '42', '148', 'SERVICIOS GENERALES', 'BNS-057', 122, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '62812471', '42', '600', 'COORDINACION DE MISION SUCRE', 'BNS-058', 123, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '82812472', '42', '446', 'COMUNICACION SOCIAL', 'BNS-059', 124, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '61812476', '42', '470', 'SERVICIOS GENERALES', 'BNS-063', 129, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '57812473', '42', '446', 'COMUNICACION SOCIAL', 'BNS-060', 127, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '77812474', '42', '446', 'COMUNICACION SOCIAL', 'BNS-061', 126, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '41812475', '42', '282', 'SEGURIDAD', 'BNS-062', 128, 'ANULADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '21812479', '24', '37.35', 'COORDINACION REGIONAL ', 'BNS-065', 133, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '21812479', '20', '1397.76', 'COORDINACION REGIONAL ', 'BNS-065', 134, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '44812480', '27', '100.49', 'COORDINACION DE INFORMATICA', 'BNS-066', 135, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '19812481', '32', '200', 'COORDINACION DE CULTURA', 'BNS-067', 136, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '39812482', '15', '78.24', 'COORDINACION DE ADMINISTRACION', 'BNS-068', 138, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '13812483', '44', '505.26', 'COORDINACION DE ADMINISTRACION', 'BNS-069', 139, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '23812484', '37', '1784.41', 'COORDINACION DE ADMINISTRACION', 'BNS-070', 140, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '08812485', '14', '2261.76', 'COORDINACION DE ADMINISTRACION', 'BNS-071', 141, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '18812486', '43', '6585.23', 'COORDINACION DE ADMINISTRACION', 'BNS-072', 142, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '92812487', '26', '179.17', 'COORDINACION DE ADMINISTRACION', 'BNS-073', 143, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '12812488', '37', '1264.25', 'COORDINACION DE ADMINISTRACION', 'BNS-074', 144, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '87812489', '44', '1284.20', 'COORDINACION DE ADMINISTRACION', 'BNS-075', 145, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '01812490', '2', '983.65', 'COORDINACION DE ADMINISTRACION', 'BNS-076', 146, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '75812491', '9', '7200.48', 'COORDINACION DE ADMINISTRACION', 'BNS-077', 147, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '75812491', '25', '518.41', 'COORDINACION DE ADMINISTRACION', 'BNS-077', 148, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '75812491', '30', '7.16', 'COORDINACION DE ADMINISTRACION', 'BNS-077', 149, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '75812491', '38', '283.40', 'COORDINACION DE ADMINISTRACION', 'BNS-077', 150, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '95812492', '37', '1373.66', 'COORDINACION DE ADMINISTRACION', 'BNS-078', 151, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '60812493', '42', '364', 'SEGURIDAD', 'BNS-079', 152, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '80812494', '42', '203', 'COORDINACION REGIONAL ', 'BNS-080', 153, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '54812495', '42', '552', 'ESTUDIOS JURIDICOS', 'BNS-081', 154, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '74812496', '42', '552', 'ESTUDIOS JURIDICOS', 'BNS-082', 155, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '49812497', '42', '552', 'ESTUDIANTE', 'BNS-083', 156, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '69812498', '42', '552', 'COORDINACION DE ADMINISTRACION', 'BNS-084', 157, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-24', '64812454', '42', '254', 'CONTROL DE ESTUDIOS', 'BNS-040', 58, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-24', '44812453', '42', '248', 'COORDINACION DE ADMINISTRACION', 'BNS-039', 57, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-24', '70812452', '42', '278', 'CONTROL DE ESTUDIOS', 'BNS-038', 56, 'PAGADO', 'FONDO ESPECIAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '59812456', '42', '446', 'COORDINACION DE PROYECTOS  PASANTIAS', 'BNS-041', 102, 'ANULADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '23812457', '42', '258', 'COORDINACION DE MISION SUCRE', 'BNS-043', 103, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '43812458', '42', '764', 'GESTION AMBIENTAL', 'BNS-044', 106, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '18812459', '42', '576', 'GESTION SOCIAL', 'BNS-045', 105, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '31812460', '42', '552', 'GESTION SOCIAL', 'BNS-046', 107, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '16812461', '42', '446', 'COORDINACION DE AGROECOLOGIA', 'BNS-047', 108, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '01812463', '42', '552', 'COORDINACION DE BIENESTAR ESTUDIANTIL', 'BNS-050', 110, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '11812464', '16', '38.30', 'SERVICIOS GENERALES', 'BNS-051', 111, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '11812464', '42', '114', 'SERVICIOS GENERALES', 'BNS-051', 112, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '11812464', '44', '40', 'SERVICIOS GENERALES', 'BNS-051', 113, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '15812466', '16', '82.60', 'SERVICIOS GENERALES', 'BNS-053', 115, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '15812466', '42', '126', 'SERVICIOS GENERALES', 'BNS-053', 116, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '36812477', '42', '446', 'COORDINACION DE PROYECTOS  PASANTIAS', 'BNS-063', 131, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '39812455', '0', '5998.80', 'COORDINACION DE ADMINISTRACION', 'BNS-064', 130, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '56812478', '42', '658', 'COORDINACION DE TALENTO HUMANO', 'BNS-064', 137, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-27', '95812465', '2', '19.75', 'SERVICIOS GENERALES', 'BNS-052', 158, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-27', '95812465', '16', '60.40', 'SERVICIOS GENERALES', 'BNS-052', 159, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-27', '95812465', '42', '230', 'SERVICIOS GENERALES', 'BNS-052', 160, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-27', '33812499', '42', '442', 'BIENESTAR ESTUDIANTIL', 'BNS-085', 161, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-27', '79812500', '42', '431', 'COORDINACION DE ADMINISTRACION', 'BNS-086', 162, 'PAGADO', 'FONDO MENSUAL');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado, tipo_f) VALUES ('2008-03-26', '26812462', '42', '364', 'COORDINACION DE BIENESTAR ESTUDIANT', 'BNS-048', 109, 'ANULADO', 'FONDO MENSUAL');


--
-- TOC entry 1701 (class 0 OID 16409)
-- Dependencies: 1321
-- Data for Name: ingresos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ingresos (fecha, codigo, beneficiario, concepto, monto, id_ingresos, tipo_f) VALUES ('2008-03-14', '743431', 'UBV BARINAS', 'DEPOSITO DE FONDOS', '55615.69', 5, NULL);
INSERT INTO ingresos (fecha, codigo, beneficiario, concepto, monto, id_ingresos, tipo_f) VALUES ('2008-03-18', '743244', 'UBV BARINAS', 'DEPOSITO DE FONDO ESPECIAL', '40000', 6, NULL);
INSERT INTO ingresos (fecha, codigo, beneficiario, concepto, monto, id_ingresos, tipo_f) VALUES ('2008-02-07', '717560', 'UBV BARINAS', 'DEPOSITO DE FONDOS', '50000.00', 1, 'FONDO MENSUAL');
INSERT INTO ingresos (fecha, codigo, beneficiario, concepto, monto, id_ingresos, tipo_f) VALUES ('2008-03-10', '1361246', 'UBV BARINAS', 'DEPOSITO DE FONDO ESPECIAL PARA GRADUACION', '100000', 3, 'FONDO ESPECIAL');


--
-- TOC entry 1709 (class 0 OID 16463)
-- Dependencies: 1337
-- Data for Name: oficio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO oficio (id_oficio, para, dest, de, rem, pie) VALUES (1, 'COORD ADMINISTRACION', 'COORDINADOR', 'PRESUPUESTO', 'COORDINADOR', 'PATRIA SOCIALISMO O MUERTE, VENCEREMOS');


--
-- TOC entry 1702 (class 0 OID 16419)
-- Dependencies: 1324
-- Data for Name: p_principal; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO p_principal (codigo, descripcion, monto_asig, monto_ejec, id_p_principal) VALUES ('2.01.00.00.00', 'Pasivo Circulante', 0, 0, 1);
INSERT INTO p_principal (codigo, descripcion, monto_asig, monto_ejec, id_p_principal) VALUES ('4.02.00.00.00', 'Materiales Suministros', 0, 0, 2);
INSERT INTO p_principal (codigo, descripcion, monto_asig, monto_ejec, id_p_principal) VALUES ('4.03.00.00.00', 'Servicios No Personales', 0, 0, 3);
INSERT INTO p_principal (codigo, descripcion, monto_asig, monto_ejec, id_p_principal) VALUES ('4.04.00.00.00', 'Activos Reales', 0, 0, 4);


--
-- TOC entry 1703 (class 0 OID 16424)
-- Dependencies: 1326
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
-- TOC entry 1704 (class 0 OID 16429)
-- Dependencies: 1328
-- Data for Name: p_terciaria; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('0', 'CAJA CHICA', NULL, NULL, 0);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.01.01.00', 'Alimentos y bebidas para personas', '30000.00', '2500.00', 2);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.02.05.00', 'Piedra. arcilla. arena y piedra', '3600.00', '300.00', 3);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.03.01.00', 'Textiles', '12000.00', '1000.00', 4);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.03.02.00', 'Prendas de vestir', '6000.00', '500.00', 5);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.04.03.00', 'Cauchos y tripas para vehiculos', '3000.00', '250.00', 6);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.05.01.00', 'Pulpa de madera papel y cartón', '1800.00', '150.00', 7);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.05.02.00', 'Envases y cajas de papel y cartón', '600.00', '50.00', 8);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.05.03.00', 'Productos de papel y cartón para oficina', '900.00', '75.00', 9);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.05.04.00', 'Libros. revistas y periódicos', '3000.00', '250.00', 10);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.05.05.00', 'Materiales de enseñanza', '5400.00', '450.00', 11);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.05.06.00', 'Otros prod. De  pulpa . papel y cartòn', '6900.00', '575.00', 13);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.05.06.00', 'Prod. de papel y cartón para computaciòn', '3000.00', '250.00', 12);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.06.03.00', 'Tintas. pinturas y colorantes', '4800.00', '400.00', 14);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.06.04.00', 'Productos farmacèuticos  y medicamentos', '4800.00', '400.00', 15);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.06.06.00', 'Combustibles y lubricantes', '3000.00', '250.00', 16);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.06.08.00', 'Productos Plàsticos', '1800.00', '150.00', 17);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.07.02.00', 'Vidrios y productos de Vidrio', '1500.00', '125.00', 18);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.07.04.00', 'Cemento. cal y yeso', '900.00', '75.00', 19);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.08.03.00', 'Herramientas menores. cuchillería y ferrete.', '12000.00', '1000.00', 20);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.08.09.00', 'Resp. y accesorios equipo de transporte', '12000.00', '1000.00', 21);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.08.10.00', 'Repuestos y accesorios para otros equipos', '3000.00', '250.00', 22);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.10.01.00', 'Articulos de deporte. recreaciòn y juguetes', '12000.00', '1000.00', 23);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.10.02.00', 'Materiales y útiles de limpieza y Aseo', '6000.00', '500.00', 24);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.10.05.00', 'Útiles de escritorio. ofic. y mat. de Instrucc.', '48000.00', '4000.00', 25);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.10.06.00', 'Condecoraciones. y ofrendas similares', '6000.00', '500.00', 26);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.10.08.00', 'Materiales para equipos de computación', '6000.00', '500.00', 27);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.10.11.00', 'Materiales eléctricos', '3000.00', '250.00', 28);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.10.99.00', 'Otros productos y utiles diversos', '15000.00', '1250.00', 29);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.02.99.01.00', 'Otros materiales y suministros', '3000.00', '250.00', 30);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.02.02.00', 'Alquiler de equipos de transporte. trac y elev', '15000.00', '1250.00', 31);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.02.05.00', 'Alq. Equipos cientificos. religiosos. ens y recre.', '3000.00', '250.00', 32);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.02.06.00', 'Alq. de maq.. muebles y equip. de alojamiento', '3000.00', '250.00', 33);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.04.05.00', 'Servicios de comunicaciones', '300.00', '25.00', 34);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.06.01.00', 'Fletes y embalajes', '3600.00', '300.00', 35);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.06.05.00', 'Serv. de protecciòn en traslado de fondos', '1200.00', '100.00', 36);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.07.01.00', 'Publicidad y propaganda', '12000.00', '1000.00', 37);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.07.02.00', 'Imprenta y reproducciòn', '9000.00', '750.00', 38);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.07.03.00', 'Relaciones sociales', '12000.00', '1000.00', 39);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.07.04.00', 'Avisos', '6000.00', '500.00', 40);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.08.02.00', 'Comisiones y Gastos Bancarios', '1200.00', '100.00', 41);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.09.01.00', 'Viáticos y pasajes dentro del país', '180000.00', '15000.00', 42);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.10.99.00', 'Otros servicios profesionales y tècnicos', '30000.00', '2500.00', 43);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.11.02.00', 'Conserv.  y reparac. Men. Equip. Transporte', '6000.00', '500.00', 44);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.12.01.00', 'Conserv.  y reparac. de bienes  del dominio privado', '0.00', '0.00', 48);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.15.02.00', 'Tasas y Otros derechos obligatorios', '1200.00', '100.00', 45);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.18.01.00', 'Impuesto al Valor Agregado', '84000.00', '7000.00', 46);
INSERT INTO p_terciaria (codigo_t, descripcion, asig_anual, asig_mensual, id_p_terciaria) VALUES ('4.03.99.01.00', 'Otros servicios no profesionales', '13500.00', '1125.00', 47);


--
-- TOC entry 1705 (class 0 OID 16434)
-- Dependencies: 1330
-- Data for Name: retencion_isrl; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-02-24', 'SERVICIOS MERIDA C.A.', 'J-30876921-5', '20080200000001', '85812423', 'Conserv.  y reparac. Men. Equip. Transporte', '1768.00', '2', '35.36', 'ASIGNADO', 1);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-02-24', 'MULTISERVICIOS J.H. C.A.', 'J-29486767-7', '20080200000003', '31812433', 'Conserv.  y reparac. Men. Equip. Transporte', '2180.00', '2', '43.6', 'ASIGNADO', 5);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-02-24', 'MULTISERVICIOS J.H. C.A.', 'J-29486767-7', '20080200000003', '31812433', 'Conserv.  y reparac. Men. Equip. Transporte', '415', '2', '8.3', 'ASIGNADO', 4);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-02-24', 'MULTISERVICIOS J.H. C.A.', 'J-29486767-7', '20080200000003', '31812433', 'Conserv.  y reparac. Men. Equip. Transporte', '330', '2', '6.6', 'ASIGNADO', 3);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-02-24', 'EL REY DEL FRIO, C.A.', 'J-30859479-2', '20080200000002', '05812424', 'Otros servicios profesionales y tècnicos', '3260.00', '2', '65.2', 'ASIGNADO', 2);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-03-25', 'EL REY DEL FRIO, C.A.', 'V-30859479-2', '20080300000006', '18812486', 'Otros servicios profesionales y tècnicos', '6568.81', '2', '131.3762', 'ASIGNADO', 10);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-03-25', 'LA NOTICIA DE BARINAS', 'V-12779802-4', '20080300000007', '12812488', 'Publicidad y propaganda', '1300', '5', '65', 'ASIGNADO', 11);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-03-25', 'SERVICIOS MERIDA C.A.', 'J-30876921-5', '20080300000008', '87812489', 'Conserv.  y reparac. Men. Equip. Transporte', '208', '2', '4.16', 'ASIGNADO', 12);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-03-25', 'SERVICIOS MERIDA C.A.', 'J-30876921-5', '20080300000008', '87812489', 'Conserv.  y reparac. Men. Equip. Transporte', '208', '2', '4.16', 'ASIGNADO', 13);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-03-25', 'SERVICIOS MERIDA C.A.', 'J-30876921-5', '20080300000008', '87812489', 'Conserv.  y reparac. Men. Equip. Transporte', '865', '2', '17.3', 'ASIGNADO', 14);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-03-25', 'EL DIARIO DE LOS LLANOS BARINESES C.A.', 'J-30727568-5', '20080300000009', '95812492', 'Publicidad y propaganda', '1412.50', '5', '70.625', 'ASIGNADO', 15);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-03-25', 'LA NOTICIA DE BARINAS', 'V-12779802-4', '20080300000005', '23812484', 'Publicidad y propaganda', '1834.86', '5', '91.743', 'SIN ASIGNAR', 9);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-03-25', 'MULTISERVICIOS SAN ANDRES, C.A', 'J-29428263-6', '20080300000004', '13812483', 'Conserv.  y reparac. Men. Equip. Transporte', '165', '2', '3.3', 'SIN ASIGNAR', 8);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-03-25', 'MULTISERVICIOS SAN ANDRES, C.A', 'J-29428263-6', '20080300000004', '13812483', 'Conserv.  y reparac. Men. Equip. Transporte', '80', '2', '1.6', 'SIN ASIGNAR', 7);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-03-25', 'MULTISERVICIOS SAN ANDRES, C.A', 'J-29428263-6', '20080300000004', '13812483', 'Conserv.  y reparac. Men. Equip. Transporte', '259', '2', '5.18', 'SIN ASIGNAR', 6);


--
-- TOC entry 1706 (class 0 OID 16442)
-- Dependencies: 1332
-- Data for Name: retencion_iva; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-02-23', 'CONFECCIONES KAMIKAZE, C.A.', 'J-30713640-5', '20080200000001', '12/02/2008', '4711', '4711', '16812420', 'Prendas de vestir', '1279.88', '0', '1174.2018348623853', '105.67816513761468', '79.258623853211', 'ASIGNADO', 1, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-02-23', 'DISTRIBUIDORA J.C. HAHN', 'V-10562624', '20080200000002', '22/01/2008', '10257', '10257', '11812422', 'Alimentos y bebidas para personas', '48.98', '0', '44.93577981651376', '4.044220183486239', '3.033165137614679', 'ASIGNADO', 2, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-02-23', 'DISTRIBUIDORA J.C. HAHN', 'V-10562624', '20080200000002', '30/01/2008', '10326', '10326', '11812422', 'Alimentos y bebidas para personas', '453.98', '0', '416.4954128440367', '37.484587155963304', '28.113440366972476', 'ASIGNADO', 3, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-02-23', 'DISTRIBUIDORA J.C. HAHN', 'V-10562624', '20080200000002', '08/02/2008', '10289', '10289', '11812422', 'Alimentos y bebidas para personas', '177.13', '0', '162.5045871559633', '14.625412844036695', '10.96905963302752', 'ASIGNADO', 4, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-02-23', 'EL REY DEL FRIO, C.A.', 'J-30859479-2', '20080200000004', '24/01/2008', '1104', '1104', '05812424', 'Otros servicios profesionales y tècnicos', '3553.40', '0', '3260', '293.4', '220.05', 'ASIGNADO', 6, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-02-23', 'COMPUSERVICIOS ARPANET C.A.', 'J-31282012-8', '20080200000005', '22/01/2008', '000371', '0423', '47812431', 'Tintas. pinturas y colorantes', '2927.67', '0', '2685.935779816514', '241.73422018348626', '181.30066513761471', 'ASIGNADO', 7, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-02-23', 'COMPUSERVICIOS ARPANET C.A.', 'J-31282012-8', '20080200000005', '28/01/2008', '000376', '0428', '47812431', 'Materiales para equipos de computación', '5000.00', '0', '4587.155963302752', '412.84403669724764', '309.6330275229357', 'ASIGNADO', 8, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-02-23', 'COMPUSERVICIOS ARPANET C.A.', 'J-31282012-8', '20080200000005', '28/01/2008', '000377', '0431', '47812431', 'Tintas. pinturas y colorantes', '1363.87', '0', '1251.2568807339448', '112.61311926605503', '84.45983944954129', 'ASIGNADO', 9, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-02-23', 'MULTISERVICIOS J.H. C.A.', 'J-29486767-7', '20080200000006', '15/02/2008', '0125', '0125', '31812433', 'Conserv.  y reparac. Men. Equip. Transporte', '359.70', '0', '329.99999999999994', '29.699999999999995', '22.274999999999995', 'ASIGNADO', 10, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-02-23', 'MULTISERVICIOS J.H. C.A.', 'J-29486767-7', '20080200000006', '15/02/2008', '0126', '0126', '31812433', 'Conserv.  y reparac. Men. Equip. Transporte', '452.35', '0', '415', '37.35', '28.0125', 'ASIGNADO', 11, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-02-23', 'MULTISERVICIOS J.H. C.A.', 'J-29486767-7', '20080200000006', '15/02/2008', '0127', '0127', '31812433', 'Conserv.  y reparac. Men. Equip. Transporte', '2376.20', '0', '2179.9999999999995', '196.19999999999996', '147.14999999999998', 'ASIGNADO', 12, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-02-24', 'SERVICIOS MERIDA C.A.', 'J-30876921-5', '20080200000003', '23/02/2008', '1604', '1604', '85812423', 'Conserv.  y reparac. Men. Equip. Transporte', '1927.12', '0', '1767.9999999999997', '159.11999999999998', '119.33999999999997', 'ASIGNADO', 5, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-02-29', 'PROVEEDURIA ESTUDIANTIL LOS LLANOS (PROVELLANOS)', 'V-16699923-1', '20080200000007', '25/02/2008', '1132', '1132', '51812434', 'Productos de papel y cartón para oficina', '7984.79', '0.00', '7325.495412844036', '659.2945871559632', '494.4709403669724', 'ASIGNADO', 13, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-03-07', 'LIBRERIA ESCORPIO CA', 'J-30580717-5', '20080300000008', '07/03/2008', '00', '00', '82812445', 'Productos de papel y cartón para oficina', '250.00', '0.00', '229.3577981651376', '20.642201834862383', '15.481651376146787', 'ASIGNADO', 14, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-03-25', 'EL REY DEL FRIO, C.A.', 'V-30859479-2', '20080300000012', '25/02/2008', '001134', '001134', '18812486', 'Otros servicios profesionales y tècnicos', '7160', '0', '6568.80733944954', '591.1926605504586', '443.394495412844', 'ASIGNADO', 20, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-03-25', 'SERVICIOS MERIDA C.A.', 'J-30876921-5', '20080300000015', '11/03/2008', '1690', '1690', '87812489', 'Conserv.  y reparac. Men. Equip. Transporte', '226.72', '0', '207.99999999999997', '18.72', '14.04', 'ASIGNADO', 23, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-03-25', 'SERVICIOS MERIDA C.A.', 'J-30876921-5', '20080300000015', '11/03/2008', '1692', '1692', '87812489', 'Conserv.  y reparac. Men. Equip. Transporte', '942.85', '0', '865', '77.85', '58.3875', 'ASIGNADO', 25, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-03-27', 'COMPUSERVICIOS ARPANET C.A.', 'J-31282012-8', '20080300000011', '25/02/2008', '000397', '0454', '08812485', 'Tintas. pinturas y colorantes', '2200', '0', '2018.348623853211', '181.65137614678898', '136.23853211009174', 'SIN ASIGNAR', 19, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-03-25', 'LAS MARGARITAS VARIEDADES C.A.', 'J-30959385-4', '20080300000013', '07/03/2008', '05203', '11403', '92812487', 'Condecoraciones. y ofrendas similares', '191', '0', '175.22935779816512', '15.770642201834862', '11.827981651376147', 'ASIGNADO', 21, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-03-25', 'LA NOTICIA DE BARINAS', 'V-12779802-4', '20080300000014', '10/03/2008', '005650', '005650', '12812488', 'Publicidad y propaganda', '1417', '0', '1300', '117', '87.75', 'ASIGNADO', 22, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-03-25', 'SERVICIOS MERIDA C.A.', 'J-30876921-5', '20080300000015', '11/03/2008', '1691', '1691', '87812489', 'Conserv.  y reparac. Men. Equip. Transporte', '226.72', '0', '207.99999999999997', '18.72', '14.04', 'ASIGNADO', 24, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-03-25', 'DISTRIBUIDORA J.C. HAHN', 'V-10562624-6', '20080300000016', '15/02/2008', '010372', '010372', '01812490', 'Alimentos y bebidas para personas', '92.105', '0', '84.5', '7.605', '5.70375', 'ASIGNADO', 26, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-03-25', 'DISTRIBUIDORA J.C. HAHN', 'V-10562624-6', '20080300000016', '22/02/2008', '010408', '010408', '01812490', 'Alimentos y bebidas para personas', '283.4', '0', '259.99999999999994', '23.399999999999995', '17.549999999999997', 'ASIGNADO', 27, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-03-25', 'DISTRIBUIDORA J.C. HAHN', 'V-10562624-6', '20080300000016', '10/03/2008', '010503', '010503', '01812490', 'Alimentos y bebidas para personas', '325.91', '0', '299', '26.91', '20.1825', 'ASIGNADO', 28, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-03-25', 'DISTRIBUIDORA J.C. HAHN', 'V-10562624-6', '20080300000016', '24/03/2008', '010558', '010558', '01812490', 'Alimentos y bebidas para personas', '347.16', '0', '318.4954128440367', '28.664587155963303', '21.498440366972477', 'ASIGNADO', 29, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-03-25', 'EL DIARIO DE LOS LLANOS BARINESES C.A.', 'J-30727568-5', '20080300000018', '18/03/2008', '12627', '12627', '95812492', 'Publicidad y propaganda', '1539.63', '0', '1412.5045871559632', '127.12541284403669', '95.34405963302751', 'ASIGNADO', 31, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-03-25', 'PROVEEDURIA ESTUDIANTIL LOS LLANOS (PROVELLANOS)', 'V-16699923-1', '20080300000017', '14/03/2008', '1187', '1187 C', '75812491', 'Productos de papel y cartón para oficina', '8538.19', '0', '7833.201834862385', '704.9881651376147', '528.741123853211', 'ASIGNADO', 30, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-03-27', 'MULTISERVICIOS SAN ANDRES, C.A', 'J-29428263-6', '20080300000009', '07/02/2008', '00250', '00250', '13812483', 'Conserv.  y reparac. Men. Equip. Transporte', '87.20', '0', '80', '7.2', '5.4', 'SIN ASIGNAR', 16, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-03-27', 'MULTISERVICIOS SAN ANDRES, C.A', 'J-29428263-6', '20080300000009', '23/01/2008', '00237', '00237', '13812483', 'Conserv.  y reparac. Men. Equip. Transporte', '282.31', '0', '259', '23.31', '17.4825', 'SIN ASIGNAR', 15, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-03-27', 'MULTISERVICIOS SAN ANDRES, C.A', 'J-29428263-6', '20080300000009', '25/02/2008', '00277', '00277', '13812483', 'Conserv.  y reparac. Men. Equip. Transporte', '179.85', '0', '164.99999999999997', '14.849999999999997', '11.137499999999997', 'SIN ASIGNAR', 17, '9', '75');
INSERT INTO retencion_iva (fecha, sujeto, cedula_rif, comprobante, fecha_fact, nfactura, ncontrol, ncheque, tipo_transaccion, monto_total, monto_scf, monto_base, iva, monto_retenido, estado, id_retencion_iva, piva, pret) VALUES ('2008-03-27', 'LA NOTICIA DE BARINAS', 'V-12779802-4', '20080300000010', '20/02/2008', '00', '00', '23812484', 'Publicidad y propaganda', '2000', '0', '1834.8623853211008', '165.13761467889907', '123.8532110091743', 'SIN ASIGNAR', 18, '9', '75');


--
-- TOC entry 1710 (class 0 OID 16468)
-- Dependencies: 1338
-- Data for Name: tabla; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tabla (tipo, desayuno, almuerzo, cena, alojamiento, taxi, transporte, tasa, autobus, vehiculo, id_tabla) VALUES ('ESTUDIANTES', 10, 12, 12, 70, 40, 30, 29, 0, 0, 2);
INSERT INTO tabla (tipo, desayuno, almuerzo, cena, alojamiento, taxi, transporte, tasa, autobus, vehiculo, id_tabla) VALUES ('OBREROS', 10, 12, 12, 70, 40, 30, 29, 0, 0, 3);
INSERT INTO tabla (tipo, desayuno, almuerzo, cena, alojamiento, taxi, transporte, tasa, autobus, vehiculo, id_tabla) VALUES ('DOC. Y ADMINIST.', 12, 12, 12, 70, 40, 30, 29, 0, 0, 4);
INSERT INTO tabla (tipo, desayuno, almuerzo, cena, alojamiento, taxi, transporte, tasa, autobus, vehiculo, id_tabla) VALUES ('DIRECTIVOS', 12, 18, 14, 85, 40, 30, 29, 0, 0, 5);
INSERT INTO tabla (tipo, desayuno, almuerzo, cena, alojamiento, taxi, transporte, tasa, autobus, vehiculo, id_tabla) VALUES ('AUTORIDADES', 12, 22, 18, 95, 40, 30, 29, 0, 0, 6);


--
-- TOC entry 1707 (class 0 OID 16450)
-- Dependencies: 1334
-- Data for Name: transaccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-27', '08:26:10-04', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-27', '08:40:49-04', '-Operacion: Modificar -Cheque:  26812435', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-27', '11:45:17-04', '-Operacion: Agregar -Cheque:  11812437', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-27', '08:00:34-04', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-27', '11:37:25-04', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-27', '08:37:37-04', '-Operacion: Agregar -Cheque:  26812435', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-27', '11:41:23-04', '-Operacion: Agregar -Cheque:  46812436', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-27', '14:14:14-04', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-28', '16:29:45-04', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-28', '16:47:12-04', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-28', '16:58:30-04', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-28', '18:17:35-04', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-28', '18:48:49-04', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-29', '09:52:23-04', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-29', '10:14:56-04', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-29', '10:17:52-04', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-29', '10:39:59-04', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-29', '11:11:25-04', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-29', '11:14:23-04', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-29', '11:16:10-04', '-Agregar Retencion IVA:  20080200000007', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-29', '11:32:42-04', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-29', '12:27:23-04', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-29', '14:10:40-04', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-29', '14:17:37-04', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-29', '15:15:33-04', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-29', '15:21:54-04', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-29', '15:35:41-04', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-02-29', '16:19:44-04', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '09:34:59-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '10:56:18-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '11:58:32-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '11:58:43-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '12:21:34-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '12:29:22-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '13:13:49-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '13:13:57-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '13:22:16-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 15796044', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '13:22:24-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 4', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '14:24:03-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 4', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '14:24:37-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 4', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '14:24:38-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 4', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '14:47:48-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '14:56:01-04:30', '-Operacion: Eliminar -Tabla: Viaticos -Registro ID: 4', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '14:56:14-04:30', '-Operacion: Eliminar -Tabla: Acceso -Registro ID: 1', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '14:57:23-04:30', '-Operacion: Eliminar -Tabla: Acceso -Registro ID: 1', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '15:07:01-04:30', '-Operacion: Agregar -Acceso: Tabla -Registro Desc: prueba', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '15:07:34-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 15796044', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '15:42:46-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 1', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '15:43:50-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 1', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '15:43:51-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 1', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '15:43:52-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 1', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '15:50:10-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 1', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '16:21:29-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-03', '17:15:28-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-04', '16:39:53-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-04', '16:53:34-04:30', '-Operacion: Agregar -Cheque:  31812438', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-04', '16:54:58-04:30', '-Operacion: Modificar -Cheque:  31812438', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-04', '20:01:28-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-04', '20:02:28-04:30', '-Operacion: Agregar -Cheque:  12345', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-05', '14:23:44-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-05', '14:27:49-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-05', '14:30:05-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-05', '14:39:30-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-05', '17:42:49-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-05', '18:51:33-04:30', '-Operacion: Modificar -Cheque:  31812438', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-05', '19:56:29-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '12:18:35-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '12:26:06-04:30', '-Operacion: Agregar -Acceso: Tabla -Registro Desc: AUTORIDADES', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '12:41:59-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 15796044', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '16:09:35-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 1565892', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '16:09:43-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 5', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '17:23:09-04:30', '-Operacion: Modificar -Cheque:  98812443', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-05', '20:03:49-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-05', '20:09:42-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '10:59:19-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '11:13:50-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '12:18:57-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '12:52:30-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '15:15:27-04:30', '-Operacion: Agregar -Cheque:  15812439', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '15:32:35-04:30', '-Operacion: Agregar -Cheque:  29812440', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '17:09:32-04:30', '-Operacion: Agregar -Cheque:  03812441', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '17:19:35-04:30', '-Operacion: Agregar -Cheque:  98812443', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '08:32:50-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '11:21:42-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '12:38:40-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '08:38:55-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '11:01:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: anato', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '11:27:49-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '11:28:24-04:30', '-Operacion: Eliminar -Tabla: Acceso -Registro ID: 1', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '12:11:11-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '12:25:26-04:30', '-Operacion: Agregar -Acceso: Tabla -Registro Desc: DIRECTIVOS', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '12:31:39-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 14258402', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '16:04:07-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '12:11:39-04:30', '-Operacion: Agregar -Cheque:  12345', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '12:22:51-04:30', '-Operacion: Agregar -Acceso: Tabla -Registro Desc: ESTUDIANTES', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '12:49:16-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 4', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '16:06:07-04:30', '-Operacion: Agregar -Cheque:  13812442', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '17:01:48-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '12:17:52-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '12:23:43-04:30', '-Operacion: Agregar -Acceso: Tabla -Registro Desc: OBREROS', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '12:24:46-04:30', '-Operacion: Agregar -Acceso: Tabla -Registro Desc: DOC. Y ADMINIST.', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '12:35:39-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '12:48:29-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 14258402', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '12:48:42-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 4', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '15:13:25-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '16:12:01-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 5', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '17:16:01-04:30', '-Operacion: Agregar -Cheque:  18812444', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-06', '17:28:55-04:30', '-Operacion: Modificar -Cheque:  98812443', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-07', '09:17:14-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-07', '09:19:57-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-07', '09:27:50-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-07', '09:33:00-04:30', '-Agregar Retencion IVA:  20080300000008', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-07', '09:34:22-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-07', '11:14:25-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-07', '11:30:04-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-07', '11:31:43-04:30', '-Operacion: Agregar -Cheque:  82812445', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-07', '11:48:01-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-07', '11:53:23-04:30', '-Operacion: Agregar -Cheque:  02812446', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '08:33:40-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '09:22:25-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '09:33:18-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '09:34:10-04:30', '-Operacion: Anular -Cheque:  03812441', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '10:25:10-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '10:33:58-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '10:34:59-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '10:41:16-04:30', '-Operacion: Agregar -Cheque:  77812447', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '10:44:19-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '10:45:38-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '10:47:09-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '11:40:18-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '13:59:41-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '14:35:17-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '14:58:11-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '16:28:04-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '16:46:21-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '16:46:45-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '17:00:41-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '17:01:40-04:30', '-Agregar Ingresos :', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '17:01:51-04:30', '-Operacion: Modificar Ingresos: 3', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '17:20:15-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '17:53:10-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '18:07:17-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-10', '18:43:05-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '08:32:42-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '08:38:21-04:30', '-Operacion: Modificar Ingresos: 3', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '09:55:56-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '09:58:20-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '10:00:38-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '10:07:16-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 13063614', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '10:07:28-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 6', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '10:24:45-04:30', '-Operacion: Agregar -Cheque:  97812448', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '10:29:35-04:30', '-Operacion: Modificar -Cheque:  97812448', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '10:30:38-04:30', '-Operacion: Modificar -Cheque:  97812448', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '10:32:55-04:30', '-Operacion: Modificar -Cheque:  97812448', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '10:33:51-04:30', '-Operacion: Modificar -Cheque:  97812448', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '10:59:24-04:30', '-Operacion: Agregar -Cheque:  61812449', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '11:05:15-04:30', '-Operacion: Agregar -Cheque:  85812450', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '11:23:41-04:30', '-Operacion: Anular -Cheque:  61812449', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '11:23:54-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '12:04:09-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '14:38:01-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '14:59:48-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '15:03:38-04:30', '-Operacion: Modificar -Cheque:  97812448', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-11', '15:14:57-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '09:28:22-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '09:30:23-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '12:49:44-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '12:53:24-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 10059412', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '12:53:42-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 7', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '13:04:00-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 9387902', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '13:04:28-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 8', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '13:12:25-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '13:14:28-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 15073565', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '13:14:37-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 9', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '13:19:09-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 18224900', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '13:19:17-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 10', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '13:25:50-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 10562912', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '13:25:55-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 11', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-14', '15:04:10-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 20', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '13:30:49-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '14:36:08-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 4926074', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '14:36:14-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 13', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-14', '15:04:04-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '13:32:53-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 11190952', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '13:32:59-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 12', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '13:43:11-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:09:09-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:20:34-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-14', '14:49:18-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '14:33:54-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:12:44-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 15', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:26:02-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 9326804', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:26:06-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 17', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-14', '10:40:38-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '14:34:10-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:08:39-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 10052857', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:08:45-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 15', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '14:44:18-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 13063445', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '14:44:23-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 14', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '16:11:52-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-14', '15:09:10-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:11:02-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 4383047', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:11:07-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 16', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-14', '15:12:55-04:30', '-Operacion: Agregar -Cheque:  50812451', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:27:58-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 12781174', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:28:03-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 18', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-14', '14:59:10-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 9406887', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-14', '14:59:17-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 20', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '16:14:49-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 16513698', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '16:14:56-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 19', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-15', '08:26:09-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-24', '11:05:05-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-24', '11:15:36-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 13063614', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-24', '11:15:43-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 21', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-24', '11:18:15-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 4383047', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-24', '11:18:21-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 22', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-24', '11:20:06-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 11715878', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-24', '11:20:14-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 23', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-24', '11:29:29-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-24', '11:35:57-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-24', '11:44:30-04:30', '-Operacion: Agregar -Cheque:  70812452', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-24', '11:49:51-04:30', '-Operacion: Agregar -Cheque:  44812453', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-24', '11:57:40-04:30', '-Operacion: Agregar -Cheque:  64812454', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-24', '12:00:38-04:30', '-Operacion: Modificar -Cheque:  70812452', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-24', '12:00:56-04:30', '-Operacion: Modificar -Cheque:  44812453', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '11:40:53-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '11:51:12-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '11:53:43-04:30', '-Agregar Ingresos :', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '11:53:55-04:30', '-Operacion: Eliminar Ingreso: 4', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '11:54:36-04:30', '-Agregar Ingresos :', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '11:55:16-04:30', '-Agregar Ingresos :', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '14:27:13-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '14:30:10-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:14:39-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:25:57-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 23', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:28:02-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 23', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:28:27-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 23', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:28:28-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 23', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:28:28-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 23', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:28:39-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 23', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:28:40-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 23', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:28:40-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 23', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:31:10-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:33:12-04:30', '-Agregar Retencion IVA:  20080300000009', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:35:48-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:36:02-04:30', '-Operacion: Modificar Ingresos: 1', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:36:17-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:36:41-04:30', '-Agregar Retencion IVA:  20080300000009', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:37:37-04:30', '-Agregar Retencion IVA:  20080300000009', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:39:16-04:30', '-Agregar Retencion ISRL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:39:31-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 4853036', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:39:39-04:30', '-Operacion: Modificar Ingresos: 3', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:39:39-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 24', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:39:45-04:30', '-Agregar Retencion ISRL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:39:54-04:30', '-Operacion: Modificar Ingresos: 3', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:40:12-04:30', '-Agregar Retencion ISRL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:42:47-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 12831247', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:42:52-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 25', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:47:23-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 7801949', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:47:28-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 26', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:54:15-04:30', '-Agregar Retencion IVA:  20080300000010', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:55:08-04:30', '-Agregar Retencion ISRL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:55:10-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 12509151', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:55:15-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 27', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:56:57-04:30', '-Agregar Retencion IVA:  20080300000011', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:58:50-04:30', '-Agregar Retencion IVA:  20080300000012', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '15:59:24-04:30', '-Agregar Retencion ISRL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:02:28-04:30', '-Agregar Retencion IVA:  20080300000013', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:02:40-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 10562912', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:02:46-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 28', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:03:24-04:30', '-Agregar Retencion IVA:  20080300000014', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:03:50-04:30', '-Agregar Retencion ISRL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:05:35-04:30', '-Agregar Retencion IVA:  20080300000015', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:06:12-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 4383047', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:06:31-04:30', '-Agregar Retencion IVA:  20080300000015', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:06:57-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 4383047', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:07:02-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 30', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:10:51-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:11:00-04:30', '-Agregar Retencion IVA:  20080300000015', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:14:15-04:30', '-Agregar Retencion ISRL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:14:43-04:30', '-Agregar Retencion ISRL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:15:19-04:30', '-Agregar Retencion ISRL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:16:30-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:18:04-04:30', '-Operacion: Eliminar -Tabla: Viaticos -Registro ID: 30', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:19:48-04:30', '-Agregar Retencion IVA:  20080300000016', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:31:38-04:30', '-Operacion: Agregar -Cheque:  43812458', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:20:09-04:30', '-Operacion: Modificar -Tabla: Viaticos -Registro ID: 29', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:20:13-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 29', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:24:31-04:30', '-Agregar Retencion IVA:  20080300000016', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:32:28-04:30', '-Operacion: Modificar -Tabla: Viaticos -Registro ID: 32', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:09:39-04:30', '-Operacion: Modificar -Cheque:  11812464', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:41:38-04:30', '-Operacion: Agregar -Cheque:  62812471', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '08:22:12-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '08:33:05-04:30', '-Operacion: Modificar -Cheque:  59812456', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '09:05:51-04:30', '-Operacion: Modificar -Cheque:  74812469', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '10:11:58-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 32', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:21:27-04:30', '-Operacion: Agregar -Cheque:  59812456', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:28:46-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 10052857', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:28:50-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 32', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:32:25-04:30', '-Agregar Retencion IVA:  20080300000018', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:14:49-04:30', '-Operacion: Modificar -Cheque:  11812464', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:26:20-04:30', '-Operacion: Agregar -Cheque:  15812466', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:47:52-04:30', '-Operacion: Agregar -Cheque:  41812475', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:56:02-04:30', '-Operacion: Agregar -Cheque:  39812455', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '08:33:10-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '08:46:46-04:30', '-Operacion: Modificar -Cheque:  31812460', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '09:14:49-04:30', '-Operacion: Modificar -Cheque:  39812455', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '09:39:19-04:30', '-Operacion: Modificar -Cheque:  39812455', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:21:38-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 29', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:29:23-04:30', '-Operacion: Agregar -Cheque:  23812457', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:41:58-04:30', '-Operacion: Agregar -Cheque:  26812462', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:12:04-04:30', '-Operacion: Modificar -Cheque:  11812464', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:12:24-04:30', '-Operacion: Modificar -Cheque:  11812464', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:12:40-04:30', '-Operacion: Modificar -Cheque:  11812464', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:39:50-04:30', '-Operacion: Agregar -Cheque:  98812470', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '08:31:57-04:30', '-Operacion: Modificar -Cheque:  59812456', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '08:52:38-04:30', '-Operacion: Modificar -Cheque:  01812463', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '09:09:46-04:30', '-Operacion: Modificar -Cheque:  77812474', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '09:10:07-04:30', '-Operacion: Modificar -Cheque:  57812473', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:22:00-04:30', '-Operacion: Agregar -Cheque:  59812456', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:36:41-04:30', '-Operacion: Agregar -Cheque:  74812469', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '08:29:07-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '09:03:36-04:30', '-Operacion: Modificar -Cheque:  00812468', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:22:19-04:30', '-Agregar Retencion IVA:  20080300000016', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:33:30-04:30', '-Agregar Retencion ISRL: ', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:37:39-04:30', '-Operacion: Agregar -Cheque:  31812460', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:54:40-04:30', '-Operacion: Agregar -Cheque:  95812465', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:29:45-04:30', '-Operacion: Agregar -Cheque:  80812467', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:43:10-04:30', '-Operacion: Agregar -Cheque:  82812472', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '08:51:17-04:30', '-Operacion: Modificar -Cheque:  26812462', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '09:01:10-04:30', '-Operacion: Modificar -Cheque:  15812466', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '09:08:16-04:30', '-Operacion: Modificar -Cheque:  82812472', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:23:11-04:30', '-Agregar Retencion IVA:  20080300000016', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:46:07-04:30', '-Operacion: Agregar -Cheque:  77812474', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:49:26-04:30', '-Operacion: Agregar -Cheque:  61812476', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:56:13-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '09:11:28-04:30', '-Operacion: Modificar -Cheque:  41812475', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:24:21-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 8132701', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:24:27-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 31', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:27:46-04:30', '-Agregar Retencion IVA:  20080300000017', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:34:33-04:30', '-Operacion: Agregar -Cheque:  18812459', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:44:24-04:30', '-Operacion: Agregar -Cheque:  01812463', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:05:32-04:30', '-Operacion: Modificar -Cheque:  11812464', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:34:34-04:30', '-Operacion: Agregar -Cheque:  00812468', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:50:30-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '08:24:19-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '08:37:58-04:30', '-Operacion: Modificar -Cheque:  43812458', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '08:45:21-04:30', '-Operacion: Modificar -Cheque:  43812458', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '09:02:52-04:30', '-Operacion: Modificar -Cheque:  80812467', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:33:34-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:33:43-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 32', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:39:56-04:30', '-Operacion: Agregar -Cheque:  16812461', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:27:38-04:30', '-Operacion: Modificar -Cheque:  15812466', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:40:12-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:44:39-04:30', '-Operacion: Agregar -Cheque:  57812473', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '08:18:09-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '08:48:35-04:30', '-Operacion: Modificar -Cheque:  16812461', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '08:59:15-04:30', '-Operacion: Modificar -Cheque:  11812464', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '09:06:41-04:30', '-Operacion: Modificar -Cheque:  98812470', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:42:22-04:30', '-Operacion: Agregar -Cheque:  26812462', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '16:50:34-04:30', '-Operacion: Agregar -Cheque:  11812464', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-25', '17:04:12-04:30', '-Operacion: Modificar -Cheque:  11812464', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '08:35:01-04:30', '-Operacion: Modificar -Cheque:  23812457', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '08:44:31-04:30', '-Operacion: Modificar -Cheque:  18812459', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '09:00:14-04:30', '-Operacion: Modificar -Cheque:  95812465', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '09:07:22-04:30', '-Operacion: Modificar -Cheque:  62812471', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '09:08:55-04:30', '-Operacion: Modificar -Cheque:  57812473', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '09:12:31-04:30', '-Operacion: Modificar -Cheque:  61812476', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '09:36:19-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:15:04-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 32', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:15:55-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:16:29-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 32', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:18:20-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 32', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:18:53-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 32', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:21:34-04:30', '-Operacion: Anular -Cheque:  59812456', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:22:41-04:30', '-Operacion: Agregar -Cheque:  36812477', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:27:21-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:32:22-04:30', '-Operacion: Agregar -Cheque:  56812478', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:34:14-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 3593862', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:34:25-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 33', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:39:54-04:30', '-Operacion: Modificar -Tabla: Viaticos -Registro ID: 27', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:40:03-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 27', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:42:27-04:30', '-Operacion: Agregar -Cheque:  21812479', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:52:21-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 5', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:52:55-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 5', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:54:48-04:30', '-Operacion: Modificar -Tabla: Viaticos -Registro ID: 5', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:54:55-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 5', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:57:59-04:30', '-Operacion: Agregar -Cheque:  44812480', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '11:58:19-04:30', '-Operacion: Eliminar -Tabla: Viaticos -Registro ID: 10', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '12:00:59-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: V-9986790', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '12:01:56-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 34', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '12:07:08-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: V-12203397', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '12:07:17-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 35', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '12:12:25-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: V-12836864', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '12:12:37-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 36', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '12:15:47-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: V-11191100', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '12:15:56-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 37', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '12:19:44-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: V-13967194', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '12:19:49-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 38', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '14:10:45-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '14:45:41-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '14:46:45-04:30', '-Operacion: Modificar -Tabla: Viaticos -Registro ID: 27', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '14:46:54-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 27', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '14:47:44-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '14:48:28-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '14:51:17-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: V-1988874', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '14:51:21-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 39', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '14:58:28-04:30', '-Operacion: Agregar -Cheque:  19812481', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '15:11:47-04:30', '-Operacion: Modificar -Cheque:  56812478', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '15:18:01-04:30', '-Operacion: Anular -Cheque:  41812475', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '15:26:06-04:30', '-Operacion: Agregar -Cheque:  39812482', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '15:28:13-04:30', '-Operacion: Agregar -caja chica:  123', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '15:31:12-04:30', '-Operacion: Agregar -caja chica:  23232', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '15:35:07-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '15:37:33-04:30', '-Operacion: Agregar -Cheque:  13812483', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '15:48:03-04:30', '-Operacion: Agregar -Cheque:  23812484', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '15:53:39-04:30', '-Operacion: Agregar -Cheque:  08812485', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '16:01:49-04:30', '-Operacion: Agregar -Cheque:  18812486', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '16:07:40-04:30', '-Operacion: Agregar -Cheque:  92812487', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '16:14:43-04:30', '-Operacion: Agregar -Cheque:  12812488', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '16:28:13-04:30', '-Operacion: Agregar -Cheque:  87812489', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '16:37:06-04:30', '-Operacion: Agregar -Cheque:  01812490', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '16:43:15-04:30', '-Operacion: Agregar -Cheque:  75812491', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '16:53:20-04:30', '-Operacion: Agregar -Cheque:  95812492', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '17:02:41-04:30', '-Operacion: Agregar -Cheque:  60812493', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '17:07:24-04:30', '-Operacion: Agregar -Cheque:  80812494', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '17:11:15-04:30', '-Operacion: Agregar -Cheque:  54812495', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '17:14:37-04:30', '-Operacion: Agregar -Cheque:  74812496', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '17:17:42-04:30', '-Operacion: Agregar -Cheque:  49812497', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-26', '17:21:22-04:30', '-Operacion: Agregar -Cheque:  69812498', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '08:43:27-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '08:51:40-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '08:57:49-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '09:08:42-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '09:15:28-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '09:21:00-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '09:39:38-04:30', '-Modificar Retencion IVA: 16', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '09:40:06-04:30', '-Modificar Retencion IVA: 15', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '09:40:39-04:30', '-Modificar Retencion IVA: 17', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '09:41:06-04:30', '-Modificar Retencion IVA: 18', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '09:41:31-04:30', '-Modificar Retencion IVA: 19', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '10:38:12-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '11:07:32-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '09:42:06-04:30', '-Modificar Retencion ISRL: 7', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '09:42:18-04:30', '-Modificar Retencion ISRL: 6', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '09:42:33-04:30', '-Modificar Retencion ISRL: 8', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '09:42:53-04:30', '-Modificar Retencion ISRL: 9', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '10:39:52-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '10:44:58-04:30', '-Operacion: Modificar -Cheque:  95812465', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '11:33:05-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '12:13:02-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '12:19:42-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '12:22:23-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: V-13063445', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '12:22:29-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 40', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '12:25:42-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: V-14827336', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '12:25:48-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 41', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '14:27:53-04:30', '-Operacion: Entrar al sistema', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '14:33:54-04:30', '-Operacion: Agregar -Cheque:  33812499', 'jenrry');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '14:39:15-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '14:44:14-04:30', '-Operacion: Agregar -caja chica:  123', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '14:45:02-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '14:47:30-04:30', '-Operacion: Agregar -caja chica:  333', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '14:48:13-04:30', '-Operacion: Agregar -Cheque:  79812500', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '14:51:57-04:30', '-Operacion: Agregar -caja chica:  2222', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '14:52:25-04:30', '-Operacion: Agregar -caja chica:  2222', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '14:53:16-04:30', '-Operacion: Agregar -caja chica:  2222', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '14:56:51-04:30', '-Operacion: Agregar -caja chica:  2222', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '15:05:07-04:30', '-Operacion: Agregar -caja chica:  333', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '15:25:35-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '16:36:55-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '17:06:45-04:30', '-Operacion: Entrar al sistema', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-27', '17:07:40-04:30', '-Operacion: Anular -Cheque:  26812462', 'gaby22');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-28', '09:12:22-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-28', '09:22:36-04:30', '-Modificar Retencion ISRL: 9', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-28', '09:23:12-04:30', '-Modificar Retencion ISRL: 8', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-28', '09:23:33-04:30', '-Modificar Retencion ISRL: 7', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-28', '09:23:53-04:30', '-Modificar Retencion ISRL: 6', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-28', '10:23:21-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-28', '10:24:19-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-28', '11:07:21-04:30', '-Operacion: Modificar Ingresos: 1', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-28', '11:07:57-04:30', '-Operacion: Modificar Ingresos: 1', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-28', '11:08:07-04:30', '-Operacion: Modificar Ingresos: 3', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-28', '11:27:48-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-28', '11:55:18-04:30', '-Operacion: Entrar al sistema', 'naili');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-28', '12:16:00-04:30', '-Operacion: Entrar al sistema', 'gaby22');


--
-- TOC entry 1708 (class 0 OID 16455)
-- Dependencies: 1335
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-31282012-8', 'COMPUSERVICIOS ARPANET C.A.', 'NO', 'NO', 3, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-4343047', 'MARCOS SANCHEZ', 'NO', 'NO', 5, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-11190952', 'ENRIQUE AGUILERA', 'NO', 'NO', 6, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-11714856', 'LUIS A, RONDON', 'NO', 'NO', 8, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-30876921-5', 'SERVICIOS MERIDA C.A.', 'NO', 'NO', 10, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-10562624-6', 'DISTRIBUIDORA J.C. HAHN', 'NO', 'NO', 11, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-31478446-3', 'ASOCIACION COOPERATIVA AMARAIZA, R.L.', 'NO', 'NO', 12, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-30713640-5', 'CONFECCIONES KAMIKAZE, C.A.', 'NO', 'NO', 13, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-30614875-2', 'FARMACIA LA TRINIDAD C.A.', 'NO', 'NO', 14, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-29389073-0', 'ASOCIACION COOPERATIVA EL SABOR Y REVOLUCION 2007, R.L', 'NO', 'NO', 15, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-6384084', 'FRANCISCO JIMENEZ', 'NO', 'NO', 16, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-29428263-6', 'MULTISERVICIOS SAN ANDRES, C.A', 'AV INDUSTRIAL NUMERO 01-106', '0273-5323478', 18, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-16699923-1', 'PROVEEDURIA ESTUDIANTIL LOS LLANOS (PROVELLANOS)', 'NO', 'NO', 17, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-13063445', 'ANA MAR COLMENARES', 'NO', 'NO', 7, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-31401906-6', 'COOPERATIVA TURISTICA KURIARA 674', 'NO', 'NO', 2, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('15796044', 'LEONARDO MATOS', 'NO', 'NO', 21, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-9367505', 'VICTOR NOGUERA', 'PEDRAZA', '0414-0763509', 22, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('14258402', 'PEDRO CONDE', 'NO', 'no', 23, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-14352372', 'ALEXANDER LEAL', 'BARINAS', 'SIN NUMERO', 27, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-30580717-5', 'LIBRERIA ESCORPIO CA', 'AV.  SUCRE ENTRE CALLES CAMEJO Y CARVAJAL Nº 9-24', '0273-5528269', 29, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-29370348-4', 'ASOCIACION COOPERATIVA  EVENTOS CHELAS', 'CALLE 8 Nº 01 URB TERRAZAS DE ALTO BARINAS ', '0414-1584236', 30, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('10059412', 'VICTOR PERALTA', NULL, NULL, 32, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('9387902', 'JAVIER RONDÓN', NULL, NULL, 33, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('15073565', 'ROSEMARY DAVILA', NULL, NULL, 34, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('10562912', 'CARLOS RAMÍREZ', NULL, NULL, 36, 'TRABAJADOR');
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
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('12509151', 'JUAN HERNÁNDEZ', NULL, NULL, 52, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-30959385-4', 'LAS MARGARITAS VARIEDADES C.A.', 'CALLE MERIDA ENTRE AVENIDAS LIBERTAD Y MONTILLA.', '0273-5526589', 53, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('8132701', 'FELIX A. VITRIAGO', NULL, NULL, 54, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-30727568-5', 'EL DIARIO DE LOS LLANOS BARINESES C.A.', 'AV. INDUSTRIAL A 50 MTS DEL CNE. ZONA INDUSTRIAL DE BARINAS.', '0273-5462898', 55, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-10052857', 'ESTEBAN PEREZ', 'BARINAS', 'NO', 56, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-3593862', 'LUIS FLORES', 'BARINAS', 'NO', 57, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-1988874', 'FRANCISCO LOPEZ', 'BARINAS', 'NO', 59, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-7237276', 'NOEL PERALTA', 'BARINAS', 'NO', 60, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('1565892', 'OGLA BRAVO', 'NO', 'no', 28, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-9986790', 'MIREL VOLCÁN', 'BARINAS', 'NO', 35, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-12203397', 'GLADYS VILLEGAS', NULL, NULL, 62, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-12836864', 'ROKGLAY MOLERO', NULL, NULL, 63, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-11191100', 'FÉLIX GALINDEZ', NULL, NULL, 64, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-13967194', 'MARILYN VARGAS', NULL, NULL, 65, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-5949417', 'ALFREDO RAMOS', 'BARINAS', 'NO', 67, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('0', 'TESORERIA NACIONAL', 'no', 'no', 20, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-30859479-2', 'EL REY DEL FRIO, C.A.', 'NO', 'NO', 9, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-13063445', 'ANA MAR COLMENARES', NULL, NULL, 72, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-14827336', 'DOMINGO ANATO', NULL, NULL, 73, 'TRABAJADOR');


--
-- TOC entry 1711 (class 0 OID 16491)
-- Dependencies: 1341
-- Data for Name: viaticos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (3, '9326804', 'SERVICIO DE TRANSPORTE DEL PERSONAL DOCENTE A LAS DIVERSAS ALDEAS UNIVERSITARIAS', '27/01/2008', '28/01/2008', 2, 114, 0, 0, 0, 0, 0, '', 114, '1', '1', '1', '1', '1', '1', 17, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '9406887', 'ASISTENCIA A JORNADAS PREPARATORIAS DE UBV XXI PROYECTO Y PASANTIAS. REALIZADAS EN LA UBV BARINAS.', '13/03/2008', '14/03/2008', 2, 118, 0, 0, 0, 1652, 0, 'BsF: 1.652,00. Por concepto de pagto de restante de los 14 asistentes que participaron el la Jornada de UBV XXI en la Sede Barinas', 1770, '1', '1', '1', '1', '1', '1', 20, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (3, '12781174', 'SERVICIO DE TRASLADO AL PERSONAL DOCENTE UBV A LAS DIFERENTES ALDEAS UNIVERSITARIAS.', '26/01/2008', '28/01/2008', 3, 230, 0, 0, 0, 0, 0, '', 230, '1', '2', '1', '1', '1', '1', 18, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '10562912', 'ASISTENCIA A LA IV REUNIóN NACIONAL DE MISIóN SUCRE REALIZAD EN LA CIUDAD DE CARACAS.', '14/01/2008', '18/01/2008', 5, 460, 0, 30, 0, 110, 0, 'Bs.F: 110,00. Pasaje Terrestre IDa y Vuelta Barinas-Caracas-Barinas.', 600, '1', '3', '1', '1', '1', '1', 28, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '10052857', 'TRASLADO DE PERSONAL ESTUDIANTIL DEL PFG EN AGROECOLOGíA A JORNADA VACACIONAL SEMANA SANTA 2008.', '17/03/2008', '20/03/2008', 4, 306, 0, 30, 0, 134, 0, 'Bsf. 134 gastos emergentes suscitados en el traslado. facturas anexas', 470, '3', '1', '1', '1', '1', '1', 32, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '15073565', 'PARTICIPACIÓN AL SIMPOSIO INTERNACIONAL SOBRE METODOLOGÍA DE LA SISTEMATIZACIÓN DE EXPERIENCIAS COMUNITARIAS REALIZADO EN LA UBV CARACAS DEL 05 AL 08/03/2008', '05/03/2008', '09/03/2008', 5, 436, 0, 30, 0, 110, 0, 'Bs.F: 110,00. Pasaje Terrestre Barinas-Caracas-Barinas', 576, '1', '1', '1', '1', '1', '1', 9, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '13063445', 'ASISTENCIA AL PRIMER ENCUENTRO NACIONAL DE PSICOSOCIAL CELEBRADO EN LA UBV CARACAS', '03/03/2008', '07/03/2008', 5, 412, 0, 30, 0, 110, 0, 'Bs.F: 110,00. Pasaje terrestre BArinas-Caracas-Barinas', 552, '3', '1', '1', '1', '1', '1', 14, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '16513698', 'ASISTENCIA AL CONSEJO NACIONAL DÉL PFG EN ESTUDIOS JURÍDICOS, CELEBRADO EN LA UBV CARACAS.', '04/03/2008', '09/03/2008', 6, 542, 0, 30, 0, 110, 0, 'Bs.F: 110,00. Pasaje terrestre Barinas-Caracas-Barinas.', 682, '1', '1', '1', '1', '1', '1', 19, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '9387902', 'PARTICIPACIÓN EN EL SIMPOSIO INTERNACIONAL SOBRE METODOLOGÍA DE LA SISTEMATIZACIÓN DE EXPERIENCIAS COMUNITARIAS REALIZADO EN LA SEDE UBV CARACAS DEL 04 A 06/03/2008', '03/03/2008', '07/03/2008', 5, 412, 0, 30, 0, 110, 0, 'Bs.F: 110,00 Pasaje Terrestre Barinas-Caracas-Barinas', 552, '3', '1', '1', '1', '1', '1', 8, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '10059412', 'ASISTENCIA AL CONSEJO NACIONAL DE AGROECOLOGÍA CELEBRADO EN LA SEDE UBV CARACAS LOS DÍAS 21 Y 22 DE FEBRERO DE 2008', '20/02/2008', '23/02/2008', 4, 306, 0, 30, 0, 110, 0, 'Bs.F: 110,00 Pasaje Terrestre Barinas-Caracas-Barinas', 446, '3', '1', '1', '1', '1', '1', 7, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (3, '4383047', 'SERVICIOS DE TRANSPORTE DEL PERSONAL DOCENTE A LAS DIFERENTES ALDEAS UNIVERSITARIAS', '19/01/2008', '22/01/2008', 4, 334, 0, 0, 0, 0, 0, '', 334, '1', '2', '1', '1', '1', '1', 16, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '12831247', 'ASISTENCIA A LAS II JORNADAS NACIONALES DE REVISIóN DE UNIDADES CURRICULARES QUE SE REALIZARá EN LA UBV CARACAS.', '01/04/2008', '04/04/2008', 4, 306, 0, 30, 0, 110, 0, 'Bs.F: 110,00. Pasaje Terrestre IDa y Vuelta Barinas-Caracas-Barinas', 446, '3', '1', '1', '1', '1', '1', 25, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '4853036', 'ASISTENCIA A LA II JORNADA NACIONAL DE REVISIóN DE UNIDADES CURRICULARES QUE SE REALIZARá EN LA UBV CARACAS', '01/04/2008', '04/04/2008', 4, 306, 0, 30, 0, 110, 0, 'Bs.F: 110,00. Pasaje Terrestre IDa y Vuelta Barinas-Caracas-Barinas', 446, '3', '1', '1', '1', '1', '1', 24, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '4926074', 'ASISTENCIA A REUNION NACIONAL DE COORDINADORES DE DESARROLLO ESTUDIANTIL REALIZADA EN LA SEDE UBV CARACAS', '27/02/2008', '29/02/2008', 3, 224, 0, 30, 0, 110, 0, 'Bs.F: 110,00. PAsaje Terrestre Barinas-Caracas-BArinas', 364, '1', '1', '1', '1', '1', '1', 13, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '4383047', 'ASISTENCIA A REUNIóN EN LA DIRECCIóN NACIONAL DE SERVISIóN ESTUDIANTILES, REALIZADA EN LA UBV CARACAS.', '02/03/2008', '03/03/2008', 2, 118, 0, 30, 0, 0, 0, '0', 148, '3', '3', '1', '1', '1', '1', 29, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '14258402', 'Asistencia a Acto de Grado en la Ciudad de Mérida. Enviado por la Secretaria General de la UBV ', '06/03/2008', '09/03/2008', 4, 306, 40, 30, 0, 40, 0, 'Bs.F: 40. Pasaje Ida y Vuelta a la Ciudad de Mérida', 416, '3', '1', '1', '1', '1', '1', 4, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '13063614', 'Asistencia a la Sede Caracas para realizar revisión y corrección en Notas Certificadas y titulos de los graduandos en Gestión Social y Gestión Ambiental.', '11/03/2008', '13/03/2008', 3, 236, 0, 30, 0, 110, 0, 'Bs.F: 110,00 Transporte Terrestre Barinas-Caracas-Barinas', 376, '1', '2', '1', '1', '1', '1', 6, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '13063614', 'Asistencia a la Sede UBV Caracas para hacer retiro de boinas, togas, medallas, y ultimar preparativos para el Acto de Conferimiento de Título de los GRaduandos en Gestión Ambiental y Gestión Social.', '24/03/2008', '26/03/2008', 3, 248, 0, 30, 0, 0, 0, '', 278, '1', '3', '1', '1', '1', '1', 21, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (3, '4383047', 'Traslado de personal administrativo a la Sede UBV Caracas, para realizar retiro de togas, boinas, y medallas para el Acto de Conferimiento de Título de los graduandos de Gestión Ambiental y Géstión Social.', '24/03/2008', '26/03/2008', 3, 218, 0, 30, 0, 0, 0, '', 248, '1', '1', '1', '1', '1', '1', 22, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '11715878', 'Asistencia a la Sede UBV Caracas para realizar retiro de togas, boinas y medallas para el Acto de Conferimiento de Títulos de los graduandos de Gestión Ambiental y Gestión Social.', '24/03/2008', '26/03/2008', 3, 224, 0, 30, 0, 0, 0, '', 254, '1', '1', '1', '1', '1', '1', 23, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '11190952', 'ASISTENCIA A LA SEDE CARACAS PARA TRATAR ASPECTOS RELACIONADOS A LAS EXPERIENCIAS DE LA JORNADA NACIONAL DE UBV XXI', '27/02/2008', '01/03/2008', 4, 306, 0, 30, 0, 110, 0, 'Bs.F: 110,00. Pasaje Terrestre Barinas-Caracas-BArinas', 446, '3', '1', '1', '1', '1', '1', 12, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '10562912', 'DILIGENCIAS REALIZADAS CON RESPECTO A LA ASIGNACIONES DE BECAS 2007 Y EL PAGO DE PROFESORES PARA EL LAPSO 2007-2', '02/03/2008', '03/03/2008', 2, 118, 0, 30, 0, 110, 0, 'Bs.F: 110,00. Pasaje Terrestre Barinas-Caracas-Barinas', 258, '3', '3', '1', '1', '1', '1', 11, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (3, '10052857', 'SERVICIOS DE TRASLADO A LAS DIFERENTES ALDEAS UNIVERSITARIAS DEL ESTADO BARINAS.', '19/01/2008', '20/01/2008', 2, 126, 0, 0, 0, 0, 0, '', 126, '1', '2', '1', '1', '1', '1', 15, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '8132701', 'ASISTENCIA A REUNIóN REALIZADA EN LA SEDE UBV CARACAS, EN LA DIRECCIóN NACIONAL DE SERVICIOS ESTUDIANTILES', '02/03/2008', '03/03/2008', 2, 118, 0, 30, 0, 0, 0, '', 148, '3', '3', '1', '1', '1', '1', 31, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '7801949', 'ASISTENCIA A LAS II JORNADAS NACIONALES DE REVISIóN  DE UNIDADES CURRICULARES QUE SE REALIZARá EN LA SEDE CARACAS.', '01/04/2008', '04/04/2008', 4, 306, 0, 30, 0, 110, 0, 'Bs.F: 110,00. Pasaje Terrestre Ida y Vuelta Barinas-Caracas-Barinas.', 446, '3', '1', '1', '1', '1', '1', 26, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '3593862', 'ASISTENCIA A TALLER SOBRE EVALUACIÓN DE DESEMPEÑO LABORAL, REALIZADO EN RECTORADO DE LA UBV CARACAS.', '14/01/2008', '19/01/2008', 6, 518, 0, 30, 0, 110, 0, 'Bs.F: 110,00. PASAJE IDA Y VUELTA BARINAS-CARACAS-BARINAS.', 658, '3', '1', '1', '1', '1', '1', 33, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '1565892', 'Traslado a Reunión Extraordinaria celebrada el día 28/02/2008 en la UBV Sede Caracas', '28/02/2008', '29/02/2008', 2, 130, 40, 30, 29, 250, 55, 'Bs.F: 250,00 correspondiente a PAsaje Aéreo Barinas-caracas
Bs.F: 55,00 corespondiente a Pasaje Terrestre Caracas-Barinas', 534, '1', '2', '1', '1', '1', '1', 5, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, 'V-9986790', 'PARTICIPACIÓN EN EL SIMPOSIO INTERNACIONAL SOBRE METODOLOGÍA DE LA SISTEMATIZACIÓN DE EXPERIENCIAS COMUNITARIAS, REALIZADAS EN LA UBV CARACAS DEL 04 AL 08/03/2008', '03/03/2008', '09/03/2008', 7, 624, 0, 30, 0, 110, 0, 'Bs.F: 110,00. Pasaje terrestre Barinas-Caracas-Barinas', 764, '3', '1', '1', '1', '1', '1', 34, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '12509151', 'ASISTIR A REUNIÓN EN LA DIRECCIóN NACIONAL DE SEGURIDAD, PARA TRATAR CASOS DE PAGOS RETRASADOS DE LOS NUEVOS INGRESOS DEL PERSONAL DE SEGURIDAD.', '25/03/2008', '27/03/2008', 3, 224, 0, 30, 0, 110, 0, 'Bs.F: 110,00. Pasaje Terrestre Ida y Vuelta Barinas-Caracas-Barinas.', 364, '3', '3', '1', '1', '1', '1', 27, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (5, 'V-1988874', 'VIAJE REALIZADO A LA SEDE CARACAS, PARA RETIRAR UNIDADES DE TRANSPORTE ASIGNADAS A LA SEDE BARINAS.', '28/02/2008', '29/02/2008', 2, 173, 0, 30, 0, 0, 0, '', 203, '1', '3', '1', '1', '1', '1', 39, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, 'V-11191100', 'ASISTENCIA AL TALLER DE SEMIPRESENCIALIDAD A REALIZARSE EN LA SEDE UBV CARACAS.', '26/03/2008', '30/03/2008', 5, 412, 0, 30, 0, 110, 0, 'Bs.F: 110,00. PASAJE TERRESTRE IDA Y VUELTA BARINAS-CARACAS-BARINAS.', 552, '3', '1', '1', '1', '1', '1', 37, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, 'V-12203397', 'ASISTENCIA AL TALLER DE SEMIPRESENCIALIDAD, A REALIZARSE EN LA SEDE UBV CARACAS.', '26/03/2008', '30/03/2008', 5, 412, 0, 30, 0, 110, 0, 'Bs.F: 110,00. PASAJE TERRESTRE IDA Y VUELTA BARINAS-CARACAS-BARINAS.', 552, '3', '1', '1', '1', '1', '1', 35, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, 'V-13967194', 'ASISTENCIA AL TALLER DE SEMIPRESENCIALIDAD A REALIZARSE EN LA SEDE UBV CARACAS.', '26/03/2008', '30/03/2008', 5, 412, 0, 30, 0, 110, 0, 'Bs.F: 110,00. PASAJE TERRESTRE IDA Y VUELTA BARINAS-CARACAS-BARINAS', 552, '3', '1', '1', '1', '1', '1', 38, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, 'V-12836864', 'ASISTENCIA AL TALLER DE SEMIPRESENCIALIDAD A REALIZARSE EN LA SEDE UBV CARACAS', '26/03/2008', '30/03/2008', 5, 412, 0, 30, 0, 110, 0, 'Bs.F: 110,00. PASAJE TERRESTRE IDA Y VUELTA BARINAS-CARACAS-BARINAS.', 552, '3', '1', '1', '1', '1', '1', 36, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, 'V-13063445', 'ASISTENCIA AL II ENCUENTRO INTERNACIONAL  DE ESTUDIANTES UNIVERSITARIOS A REALIZARSE EN EL HOTEL IPASMAR DEL ESTADO MIRANDA.', '10/04/2008', '14/04/2008', 5, 412, 0, 30, 0, 0, 0, '', 442, '3', '1', '1', '1', '1', '1', 40, '', 'EN PROCESO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (5, 'V-14827336', 'ASISTENCIA A LA SEDE UBV CARACAS PARA TRATAR ASUNTOS ADMINISTRATIVOS RELACIONADOS CON LA SEDE BARINAS. ', '02/04/2008', '05/04/2008', 4, 401, 0, 30, 0, 0, 0, 'Bs.F: 110,00. PASAJE TERRESTRE IDA Y VUELTA BARINAS-CARACAS-BARINAS', 431, '3', '3', '1', '1', '1', '1', 41, '', 'PROCESADO');


--
-- TOC entry 1720 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2008-03-28 14:04:08 VET

--
-- PostgreSQL database dump complete
--

