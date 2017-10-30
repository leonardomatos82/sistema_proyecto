--
-- PostgreSQL database dump
--

-- Started on 2008-03-14 09:41:49 VET

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1699 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1305 (class 1259 OID 16386)
-- Dependencies: 1666 5
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
-- TOC entry 1306 (class 1259 OID 16389)
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
-- TOC entry 1701 (class 0 OID 0)
-- Dependencies: 1306
-- Name: acceso_id_acceso_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('acceso_id_acceso_seq', 7, true);


--
-- TOC entry 1335 (class 1259 OID 16715)
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
-- TOC entry 1702 (class 0 OID 0)
-- Dependencies: 1335
-- Name: acceso_id_acceso_solicitud_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('acceso_id_acceso_solicitud_seq', 1, false);


--
-- TOC entry 1334 (class 1259 OID 16712)
-- Dependencies: 1679 5
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
-- TOC entry 1307 (class 1259 OID 16391)
-- Dependencies: 1667 5
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
-- TOC entry 1308 (class 1259 OID 16397)
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
-- TOC entry 1703 (class 0 OID 0)
-- Dependencies: 1308
-- Name: cheque_id_cheque_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('cheque_id_cheque_seq', 42, true);


--
-- TOC entry 1309 (class 1259 OID 16399)
-- Dependencies: 1668 5
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
-- TOC entry 1310 (class 1259 OID 16402)
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
-- TOC entry 1704 (class 0 OID 0)
-- Dependencies: 1310
-- Name: configuracion_id_configuracion_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('configuracion_id_configuracion_seq', 2, false);


--
-- TOC entry 1311 (class 1259 OID 16404)
-- Dependencies: 1669 5
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
-- TOC entry 1312 (class 1259 OID 16407)
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
-- TOC entry 1705 (class 0 OID 0)
-- Dependencies: 1312
-- Name: distribucion_cheque_id_distribucion_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('distribucion_cheque_id_distribucion_seq', 54, true);


--
-- TOC entry 1313 (class 1259 OID 16409)
-- Dependencies: 1670 5
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
-- TOC entry 1314 (class 1259 OID 16415)
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
-- TOC entry 1706 (class 0 OID 0)
-- Dependencies: 1314
-- Name: ingresos_id_ingresos_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('ingresos_id_ingresos_seq', 3, true);


--
-- TOC entry 1315 (class 1259 OID 16417)
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
-- TOC entry 1707 (class 0 OID 0)
-- Dependencies: 1315
-- Name: numero_id_numero_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('numero_id_numero_seq', 1, false);


--
-- TOC entry 1329 (class 1259 OID 16463)
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
-- TOC entry 1316 (class 1259 OID 16419)
-- Dependencies: 1671 5
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
-- TOC entry 1317 (class 1259 OID 16422)
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
-- TOC entry 1708 (class 0 OID 0)
-- Dependencies: 1317
-- Name: p_principal_id_p_principal_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('p_principal_id_p_principal_seq', 1, false);


--
-- TOC entry 1318 (class 1259 OID 16424)
-- Dependencies: 1672 5
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
-- TOC entry 1319 (class 1259 OID 16427)
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
-- TOC entry 1709 (class 0 OID 0)
-- Dependencies: 1319
-- Name: p_secundaria_id_p_secundaria_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('p_secundaria_id_p_secundaria_seq', 1, false);


--
-- TOC entry 1320 (class 1259 OID 16429)
-- Dependencies: 1673 5
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
-- TOC entry 1321 (class 1259 OID 16432)
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
-- TOC entry 1710 (class 0 OID 0)
-- Dependencies: 1321
-- Name: p_terciaria_id_p_terciaria_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('p_terciaria_id_p_terciaria_seq', 48, false);


--
-- TOC entry 1322 (class 1259 OID 16434)
-- Dependencies: 1674 5
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
-- TOC entry 1323 (class 1259 OID 16440)
-- Dependencies: 5
-- Name: retencion_isrl_id_retencion_isrl_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE retencion_isrl_id_retencion_isrl_seq
    START WITH 6
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.retencion_isrl_id_retencion_isrl_seq OWNER TO leonardo;

--
-- TOC entry 1711 (class 0 OID 0)
-- Dependencies: 1323
-- Name: retencion_isrl_id_retencion_isrl_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('retencion_isrl_id_retencion_isrl_seq', 6, false);


--
-- TOC entry 1324 (class 1259 OID 16442)
-- Dependencies: 1675 5
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
-- TOC entry 1325 (class 1259 OID 16448)
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
-- TOC entry 1712 (class 0 OID 0)
-- Dependencies: 1325
-- Name: retencion_iva_id_retencion_iva_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('retencion_iva_id_retencion_iva_seq', 14, true);


--
-- TOC entry 1330 (class 1259 OID 16468)
-- Dependencies: 1677 5
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
-- TOC entry 1331 (class 1259 OID 16474)
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
-- TOC entry 1713 (class 0 OID 0)
-- Dependencies: 1331
-- Name: tabla_id_tabla_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tabla_id_tabla_seq', 6, true);


--
-- TOC entry 1326 (class 1259 OID 16450)
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
-- TOC entry 1327 (class 1259 OID 16455)
-- Dependencies: 1676 5
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
-- TOC entry 1328 (class 1259 OID 16461)
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
-- TOC entry 1714 (class 0 OID 0)
-- Dependencies: 1328
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 44, true);


--
-- TOC entry 1333 (class 1259 OID 16491)
-- Dependencies: 1678 5
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
-- TOC entry 1332 (class 1259 OID 16487)
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
-- TOC entry 1715 (class 0 OID 0)
-- Dependencies: 1332
-- Name: viaticos_id_viatico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('viaticos_id_viatico_seq', 19, true);


--
-- TOC entry 1680 (class 0 OID 16386)
-- Dependencies: 1305
-- Data for Name: acceso; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO acceso ("login", clave, tipo, id_acceso) VALUES ('leonardo', '15796044', 'A', 2);
INSERT INTO acceso ("login", clave, tipo, id_acceso) VALUES ('administracion', '9266165', 'U', 1);
INSERT INTO acceso ("login", clave, tipo, id_acceso) VALUES ('gaby22', '9269610', 'A', 4);
INSERT INTO acceso ("login", clave, tipo, id_acceso) VALUES ('jenrry', 'jc11021987', 'A', 6);
INSERT INTO acceso ("login", clave, tipo, id_acceso) VALUES ('naili', 'ubvsbp2008', 'A', 5);
INSERT INTO acceso ("login", clave, tipo, id_acceso) VALUES ('anato', '1730', 'A', 7);


--
-- TOC entry 1695 (class 0 OID 16712)
-- Dependencies: 1334
-- Data for Name: acceso_solicitud; Type: TABLE DATA; Schema: public; Owner: leonardo
--



--
-- TOC entry 1681 (class 0 OID 16391)
-- Dependencies: 1307
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


--
-- TOC entry 1682 (class 0 OID 16399)
-- Dependencies: 1309
-- Data for Name: configuracion; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO configuracion (coordinador_sede, coordinador_adm, administrador, cuenta, iva, isrl, id_configuracion, sede, rif, comienzo_anio) VALUES ('ING. FRANCISCO LOPEZ', 'LIC. DOMINGO ANATO', 'LIC. NAILI SIMANCAS', '0003 0057 82 0001061084', 9, 75, 1, 'BARINAS', 'G-20003773-3', '2008-01-01');


--
-- TOC entry 1683 (class 0 OID 16404)
-- Dependencies: 1311
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


--
-- TOC entry 1684 (class 0 OID 16409)
-- Dependencies: 1313
-- Data for Name: ingresos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ingresos (fecha, codigo, beneficiario, concepto, monto, id_ingresos, tipo_f) VALUES ('2008-02-07', '717560', 'UBV BARINAS', 'DEPOSITO DE FONDOS', '50000.00', 1, 'FONDO MENSUAL');
INSERT INTO ingresos (fecha, codigo, beneficiario, concepto, monto, id_ingresos, tipo_f) VALUES ('2008-10-03', '1361246', 'UBV BARINAS', 'DEPOSITO DE FONDO ESPECIAL PARA GRADUACION', '100000', 3, 'FONDO ESPECIAL');


--
-- TOC entry 1692 (class 0 OID 16463)
-- Dependencies: 1329
-- Data for Name: oficio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO oficio (id_oficio, para, dest, de, rem, pie) VALUES (1, 'COORD ADMINISTRACION', 'COORDINADOR', 'PRESUPUESTO', 'COORDINADOR', 'PATRIA SOCIALISMO O MUERTE, VENCEREMOS');


--
-- TOC entry 1685 (class 0 OID 16419)
-- Dependencies: 1316
-- Data for Name: p_principal; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO p_principal (codigo, descripcion, monto_asig, monto_ejec, id_p_principal) VALUES ('2.01.00.00.00', 'Pasivo Circulante', 0, 0, 1);
INSERT INTO p_principal (codigo, descripcion, monto_asig, monto_ejec, id_p_principal) VALUES ('4.02.00.00.00', 'Materiales Suministros', 0, 0, 2);
INSERT INTO p_principal (codigo, descripcion, monto_asig, monto_ejec, id_p_principal) VALUES ('4.03.00.00.00', 'Servicios No Personales', 0, 0, 3);
INSERT INTO p_principal (codigo, descripcion, monto_asig, monto_ejec, id_p_principal) VALUES ('4.04.00.00.00', 'Activos Reales', 0, 0, 4);


--
-- TOC entry 1686 (class 0 OID 16424)
-- Dependencies: 1318
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
-- TOC entry 1687 (class 0 OID 16429)
-- Dependencies: 1320
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
-- TOC entry 1688 (class 0 OID 16434)
-- Dependencies: 1322
-- Data for Name: retencion_isrl; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-02-24', 'SERVICIOS MERIDA C.A.', 'J-30876921-5', '20080200000001', '85812423', 'Conserv.  y reparac. Men. Equip. Transporte', '1768.00', '2', '35.36', 'ASIGNADO', 1);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-02-24', 'MULTISERVICIOS J.H. C.A.', 'J-29486767-7', '20080200000003', '31812433', 'Conserv.  y reparac. Men. Equip. Transporte', '2180.00', '2', '43.6', 'ASIGNADO', 5);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-02-24', 'MULTISERVICIOS J.H. C.A.', 'J-29486767-7', '20080200000003', '31812433', 'Conserv.  y reparac. Men. Equip. Transporte', '415', '2', '8.3', 'ASIGNADO', 4);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-02-24', 'MULTISERVICIOS J.H. C.A.', 'J-29486767-7', '20080200000003', '31812433', 'Conserv.  y reparac. Men. Equip. Transporte', '330', '2', '6.6', 'ASIGNADO', 3);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-02-24', 'EL REY DEL FRIO, C.A.', 'J-30859479-2', '20080200000002', '05812424', 'Otros servicios profesionales y tècnicos', '3260.00', '2', '65.2', 'ASIGNADO', 2);


--
-- TOC entry 1689 (class 0 OID 16442)
-- Dependencies: 1324
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


--
-- TOC entry 1693 (class 0 OID 16468)
-- Dependencies: 1330
-- Data for Name: tabla; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tabla (tipo, desayuno, almuerzo, cena, alojamiento, taxi, transporte, tasa, autobus, vehiculo, id_tabla) VALUES ('ESTUDIANTES', 10, 12, 12, 70, 40, 30, 29, 0, 0, 2);
INSERT INTO tabla (tipo, desayuno, almuerzo, cena, alojamiento, taxi, transporte, tasa, autobus, vehiculo, id_tabla) VALUES ('OBREROS', 10, 12, 12, 70, 40, 30, 29, 0, 0, 3);
INSERT INTO tabla (tipo, desayuno, almuerzo, cena, alojamiento, taxi, transporte, tasa, autobus, vehiculo, id_tabla) VALUES ('DOC. Y ADMINIST.', 12, 12, 12, 70, 40, 30, 29, 0, 0, 4);
INSERT INTO tabla (tipo, desayuno, almuerzo, cena, alojamiento, taxi, transporte, tasa, autobus, vehiculo, id_tabla) VALUES ('DIRECTIVOS', 12, 18, 14, 85, 40, 30, 29, 0, 0, 5);
INSERT INTO tabla (tipo, desayuno, almuerzo, cena, alojamiento, taxi, transporte, tasa, autobus, vehiculo, id_tabla) VALUES ('AUTORIDADES', 12, 22, 18, 95, 40, 30, 29, 0, 0, 6);


--
-- TOC entry 1690 (class 0 OID 16450)
-- Dependencies: 1326
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
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '13:30:49-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '14:36:08-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 4926074', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '14:36:14-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 13', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '13:32:53-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 11190952', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '13:32:59-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 12', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '13:43:11-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:09:09-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:20:34-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '14:33:54-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:12:44-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 15', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:26:02-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 9326804', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:26:06-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 17', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '14:34:10-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:08:39-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 10052857', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:08:45-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 15', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '14:44:18-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 13063445', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '14:44:23-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 14', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '16:11:52-04:30', '-Operacion: Entrar al sistema', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:11:02-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 4383047', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:11:07-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 16', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:27:58-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 12781174', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '15:28:03-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 18', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '16:14:49-04:30', '-Operacion: Agregar -Tabla: Viaticos -Registro ID: 16513698', 'anato');
INSERT INTO transaccion (fecha, hora, operacion, "login") VALUES ('2008-03-13', '16:14:56-04:30', '-Operacion: Imprimir -Tabla: Viatico -Registro ID: 19', 'anato');


--
-- TOC entry 1691 (class 0 OID 16455)
-- Dependencies: 1327
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-31282012-8', 'COMPUSERVICIOS ARPANET C.A.', 'NO', 'NO', 3, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-13063614', 'YOEL CASTILLO', 'NO', 'NO', 4, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-4343047', 'MARCOS SANCHEZ', 'NO', 'NO', 5, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-11190952', 'ENRIQUE AGUILERA', 'NO', 'NO', 6, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-11714856', 'LUIS A, RONDON', 'NO', 'NO', 8, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-30859479-2', 'EL REY DEL FRIO, C.A.', 'NO', 'NO', 9, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-30876921-5', 'SERVICIOS MERIDA C.A.', 'NO', 'NO', 10, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-10562624-6', 'DISTRIBUIDORA J.C. HAHN', 'NO', 'NO', 11, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-31478446-3', 'ASOCIACION COOPERATIVA AMARAIZA, R.L.', 'NO', 'NO', 12, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-30713640-5', 'CONFECCIONES KAMIKAZE, C.A.', 'NO', 'NO', 13, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-30614875-2', 'FARMACIA LA TRINIDAD C.A.', 'NO', 'NO', 14, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-29389073-0', 'ASOCIACION COOPERATIVA EL SABOR Y REVOLUCION 2007, R.L', 'NO', 'NO', 15, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-6384084', 'FRANCISCO JIMENEZ', 'NO', 'NO', 16, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-29428263-6', 'MULTISERVICIOS SAN ANDRES, C.A', 'AV INDUSTRIAL NUMERO 01-106', '0273-5323478', 18, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('0', 'TESORERIA NACIONAL', 'no', 'no', 20, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-16699923-1', 'PROVEEDURIA ESTUDIANTIL LOS LLANOS (PROVELLANOS)', 'NO', 'NO', 17, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-13063445', 'ANA MAR COLMENARES', 'NO', 'NO', 7, NULL);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-31401906-6', 'COOPERATIVA TURISTICA KURIARA 674', 'NO', 'NO', 2, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('15796044', 'LEONARDO MATOS', 'NO', 'NO', 21, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-9367505', 'VICTOR NOGUERA', 'PEDRAZA', '0414-0763509', 22, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('14258402', 'PEDRO CONDE', 'NO', 'no', 23, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-14352372', 'ALEXANDER LEAL', 'BARINAS', 'SIN NUMERO', 27, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-30580717-5', 'LIBRERIA ESCORPIO CA', 'AV.  SUCRE ENTRE CALLES CAMEJO Y CARVAJAL Nº 9-24', '0273-5528269', 29, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('J-29370348-4', 'ASOCIACION COOPERATIVA  EVENTOS CHELAS', 'CALLE 8 Nº 01 URB TERRAZAS DE ALTO BARINAS ', '0414-1584236', 30, 'PROVEEDOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('V-1565892', 'OGLA BRAVO', 'NO', 'no', 28, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('10059412', 'VICTOR PERALTA', NULL, NULL, 32, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('9387902', 'JAVIER RONDÓN', NULL, NULL, 33, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('15073565', 'ROSEMARY DAVILA', NULL, NULL, 34, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('18224900', 'MIREL VOLCÁN', NULL, NULL, 35, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('10562912', 'CARLOS RAMÍREZ', NULL, NULL, 36, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('11190952', 'ENRIQUE AGUILERA', NULL, NULL, 37, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('4926074', 'ABBY OLAECHEA', NULL, NULL, 38, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('13063445', 'ANA MAR COLMENARES', NULL, NULL, 39, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('10052857', 'ESTEBAN PÉREZ', NULL, NULL, 40, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('4383047', 'MARCOS SANCHEZ', NULL, NULL, 41, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('9326804', 'DUILIO LOZADA', NULL, NULL, 42, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('12781174', 'JHON VELASQUEZ', NULL, NULL, 43, 'TRABAJADOR');
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario, tipo) VALUES ('16513698', 'YSHAMDRA AL HAJALI', NULL, NULL, 44, 'TRABAJADOR');


--
-- TOC entry 1694 (class 0 OID 16491)
-- Dependencies: 1333
-- Data for Name: viaticos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '14258402', 'Asistencia a Acto de Grado en la Ciudad de Mérida. Enviado por la Secretaria General de la UBV ', '06/03/2008', '09/03/2008', 4, 306, 40, 30, 0, 40, 0, 'Bs.F: 40. Pasaje Ida y Vuelta a la Ciudad de Mérida', 416, '3', '1', '1', '1', '1', '1', 4, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '1565892', 'TRAslado a Reunión Extraordinaria celebrada el día 28/03/2008 en la UBV Sede Caracas', '28/03/2008', '29/03/2008', 2, 130, 40, 30, 29, 250, 55, 'Bs.F: 250,00 correspondiente a PAsaje Aéreo Barinas-caracas
Bs.F: 55,00 corespondiente a Pasaje Terrestre Caracas-Barinas', 534, '1', '2', '1', '1', '1', '1', 5, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '13063614', 'Asistencia a la Sede Caracas para realizar revisión y corrección en Notas Certificadas y titulos de los graduandos en Gestión Social y Gestión Ambiental.', '11/03/2008', '13/03/2008', 3, 236, 0, 30, 0, 110, 0, 'Bs.F: 110,00 Transporte Terrestre Barinas-Caracas-Barinas', 376, '1', '2', '1', '1', '1', '1', 6, '', 'PROCESADO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '10059412', 'ASISTENCIA AL CONSEJO NACIONAL DE AGROECOLOGÍA CELEBRADO EN LA SEDE UBV CARACAS LOS DÍAS 21 Y 22 DE FEBRERO DE 2008', '20/02/2008', '23/02/2008', 4, 306, 0, 30, 0, 110, 0, 'Bs.F: 110,00 Pasaje Terrestre Barinas-Caracas-Barinas', 446, '3', '1', '1', '1', '1', '1', 7, '', 'EN PROCESO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '9387902', 'PARTICIPACIÓN EN EL SIMPOSIO INTERNACIONAL SOBRE METODOLOGÍA DE LA SISTEMATIZACIÓN DE EXPERIENCIAS COMUNITARIAS REALIZADO EN LA SEDE UBV CARACAS DEL 04 A 06/03/2008', '03/03/2008', '07/03/2008', 5, 412, 0, 30, 0, 110, 0, 'Bs.F: 110,00 Pasaje Terrestre Barinas-Caracas-Barinas', 552, '3', '1', '1', '1', '1', '1', 8, '', 'EN PROCESO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '15073565', 'PARTICIPACIÓN AL SIMPOSIO INTERNACIONAL SOBRE METODOLOGÍA DE LA SISTEMATIZACIÓN DE EXPERIENCIAS COMUNITARIAS REALIZADO EN LA UBV CARACAS DEL 05 AL 08/03/2008', '05/03/2008', '09/03/2008', 5, 436, 0, 30, 0, 110, 0, 'Bs.F: 110,00. Pasaje Terrestre Barinas-Caracas-Barinas', 576, '1', '1', '1', '1', '1', '1', 9, '', 'EN PROCESO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '18224900', 'PARTICIPACIÓN EN EL SIMPOSIO INTERNACIONAL SOBRE METODOLOGÍA DE LA SISTEMATIZACIÓN DE EXPERIENCIAS COMUNITARIAS, REALIZADAS EN LA UBV CARACAS DEL 04 AL 08/03/2008', '03/03/2008', '09/03/2008', 7, 624, 0, 30, 0, 110, 0, 'Bs.F: 110,00 Pasaje Terrestre Barinas-Caracas-Barinas', 764, '3', '1', '1', '1', '1', '1', 10, '', 'EN PROCESO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '10562912', 'DILIGENCIAS REALIZADAS CON RESPECTO A LA ASIGNACIONES DE BECAS 2007 Y EL PAGO DE PROFESORES PARA EL LAPSO 2007-2', '02/03/2008', '03/03/2008', 2, 118, 0, 30, 0, 110, 0, 'Bs.F: 110,00. Pasaje Terrestre Barinas-Caracas-Barinas', 258, '3', '3', '1', '1', '1', '1', 11, '', 'EN PROCESO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '11190952', 'ASISTENCIA A LA SEDE CARACAS PARA TRATAR ASPECTOS RELACIONADOS A LAS EXPERIENCIAS DE LA JORNADA NACIONAL DE UBV XXI', '27/02/2008', '01/03/2008', 4, 306, 0, 30, 0, 110, 0, 'Bs.F: 110,00. Pasaje Terrestre Barinas-Caracas-BArinas', 446, '3', '1', '1', '1', '1', '1', 12, '', 'EN PROCESO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '4926074', 'ASISTENCIA A REUNION NACIONAL DE COORDINADORES DE DESARROLLO ESTUDIANTIL REALIZADA EN LA SEDE UBV CARACAS', '27/02/2008', '29/02/2008', 3, 224, 0, 30, 0, 110, 0, 'Bs.F: 110,00. PAsaje Terrestre Barinas-Caracas-BArinas', 364, '1', '1', '1', '1', '1', '1', 13, '', 'EN PROCESO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '13063445', 'ASISTENCIA AL PRIMER ENCUENTRO NACIONAL DE PSICOSOCIAL CELEBRADO EN LA UBV CARACAS', '03/03/2008', '07/03/2008', 5, 412, 0, 30, 0, 110, 0, 'Bs.F: 110,00. Pasaje terrestre BArinas-Caracas-Barinas', 552, '3', '1', '1', '1', '1', '1', 14, '', 'EN PROCESO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (3, '10052857', 'SERVICIOS DE TRASLADO A LAS DIFERENTES ALDEAS UNIVERSITARIAS DEL ESTADO BARINAS.', '19/01/2008', '20/01/2008', 2, 126, 0, 0, 0, 0, 0, '', 126, '1', '2', '1', '1', '1', '1', 15, '', 'EN PROCESO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (3, '4383047', 'SERVICIOS DE TRANSPORTE DEL PERSONAL DOCENTE A LAS DIFERENTES ALDEAS UNIVERSITARIAS', '19/01/2008', '22/01/2008', 4, 334, 0, 0, 0, 0, 0, '', 334, '1', '2', '1', '1', '1', '1', 16, '', 'EN PROCESO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (3, '9326804', 'SERVICIO DE TRANSPORTE DEL PERSONAL DOCENTE A LAS DIVERSAS ALDEAS UNIVERSITARIAS', '27/01/2008', '28/01/2008', 2, 114, 0, 0, 0, 0, 0, '', 114, '1', '1', '1', '1', '1', '1', 17, '', 'EN PROCESO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (3, '12781174', 'SERVICIO DE TRASLADO AL PERSONAL DOCENTE UBV A LAS DIFERENTES ALDEAS UNIVERSITARIAS.', '26/01/2008', '28/01/2008', 3, 230, 0, 0, 0, 0, 0, '', 230, '1', '2', '1', '1', '1', '1', 18, '', 'EN PROCESO');
INSERT INTO viaticos (id_tipo, cedula, motivo, fecha_ida, fecha_ret, dias, subtotal, taxi, transporte, tasa, otra1, otra2, observaciones, total, tiempo1, tiempo2, des, alm, cen, alo, id_viatico, departamento, estado) VALUES (4, '16513698', 'ASISTENCIA AL CONSEJO NACIONAL DÉL PFG EN ESTUDIOS JURÍDICOS, CELEBRADO EN LA UBV CARACAS.', '04/03/2008', '09/03/2008', 6, 542, 0, 30, 0, 110, 0, 'Bs.F: 110,00. Pasaje terrestre Barinas-Caracas-Barinas.', 682, '1', '1', '1', '1', '1', '1', 19, '', 'EN PROCESO');


--
-- TOC entry 1700 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2008-03-14 09:41:50 VET

--
-- PostgreSQL database dump complete
--

