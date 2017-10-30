--
-- PostgreSQL database dump
--

-- Started on 2008-02-29 16:54:07 VET

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1675 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1295 (class 1259 OID 16386)
-- Dependencies: 1649 5
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
-- TOC entry 1296 (class 1259 OID 16389)
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
-- TOC entry 1677 (class 0 OID 0)
-- Dependencies: 1296
-- Name: acceso_id_acceso_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('acceso_id_acceso_seq', 6, true);


--
-- TOC entry 1297 (class 1259 OID 16391)
-- Dependencies: 1650 5
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
    cedula_rif character varying(30)
);


ALTER TABLE public.cheque OWNER TO leonardo;

--
-- TOC entry 1298 (class 1259 OID 16397)
-- Dependencies: 5
-- Name: cheque_id_cheque_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE cheque_id_cheque_seq
    START WITH 28
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cheque_id_cheque_seq OWNER TO leonardo;

--
-- TOC entry 1678 (class 0 OID 0)
-- Dependencies: 1298
-- Name: cheque_id_cheque_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('cheque_id_cheque_seq', 28, false);


--
-- TOC entry 1299 (class 1259 OID 16399)
-- Dependencies: 1651 5
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
-- TOC entry 1300 (class 1259 OID 16402)
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
-- TOC entry 1679 (class 0 OID 0)
-- Dependencies: 1300
-- Name: configuracion_id_configuracion_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('configuracion_id_configuracion_seq', 2, false);


--
-- TOC entry 1301 (class 1259 OID 16404)
-- Dependencies: 1652 5
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
    estado character varying(25)
);


ALTER TABLE public.distribucion_cheque OWNER TO leonardo;

--
-- TOC entry 1302 (class 1259 OID 16407)
-- Dependencies: 5
-- Name: distribucion_cheque_id_distribucion_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE distribucion_cheque_id_distribucion_seq
    START WITH 27
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.distribucion_cheque_id_distribucion_seq OWNER TO leonardo;

--
-- TOC entry 1680 (class 0 OID 0)
-- Dependencies: 1302
-- Name: distribucion_cheque_id_distribucion_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('distribucion_cheque_id_distribucion_seq', 27, false);


--
-- TOC entry 1303 (class 1259 OID 16409)
-- Dependencies: 1653 5
-- Name: ingresos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ingresos (
    fecha date NOT NULL,
    codigo character varying(15),
    beneficiario character varying(120) NOT NULL,
    concepto character varying(1500) NOT NULL,
    monto character varying(10),
    id_ingresos integer DEFAULT nextval(('public.ingresos_id_ingresos_seq'::text)::regclass) NOT NULL
);


ALTER TABLE public.ingresos OWNER TO postgres;

--
-- TOC entry 1304 (class 1259 OID 16415)
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
-- TOC entry 1681 (class 0 OID 0)
-- Dependencies: 1304
-- Name: ingresos_id_ingresos_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('ingresos_id_ingresos_seq', 2, true);


--
-- TOC entry 1305 (class 1259 OID 16417)
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
-- TOC entry 1682 (class 0 OID 0)
-- Dependencies: 1305
-- Name: numero_id_numero_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('numero_id_numero_seq', 1, false);


--
-- TOC entry 1306 (class 1259 OID 16419)
-- Dependencies: 1654 5
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
-- TOC entry 1307 (class 1259 OID 16422)
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
-- TOC entry 1683 (class 0 OID 0)
-- Dependencies: 1307
-- Name: p_principal_id_p_principal_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('p_principal_id_p_principal_seq', 1, false);


--
-- TOC entry 1308 (class 1259 OID 16424)
-- Dependencies: 1655 5
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
-- TOC entry 1309 (class 1259 OID 16427)
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
-- TOC entry 1684 (class 0 OID 0)
-- Dependencies: 1309
-- Name: p_secundaria_id_p_secundaria_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('p_secundaria_id_p_secundaria_seq', 1, false);


--
-- TOC entry 1310 (class 1259 OID 16429)
-- Dependencies: 1656 5
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
-- TOC entry 1311 (class 1259 OID 16432)
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
-- TOC entry 1685 (class 0 OID 0)
-- Dependencies: 1311
-- Name: p_terciaria_id_p_terciaria_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('p_terciaria_id_p_terciaria_seq', 48, false);


--
-- TOC entry 1312 (class 1259 OID 16434)
-- Dependencies: 1657 5
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
-- TOC entry 1313 (class 1259 OID 16440)
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
-- TOC entry 1686 (class 0 OID 0)
-- Dependencies: 1313
-- Name: retencion_isrl_id_retencion_isrl_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('retencion_isrl_id_retencion_isrl_seq', 6, false);


--
-- TOC entry 1314 (class 1259 OID 16442)
-- Dependencies: 1658 5
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
-- TOC entry 1315 (class 1259 OID 16448)
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
-- TOC entry 1687 (class 0 OID 0)
-- Dependencies: 1315
-- Name: retencion_iva_id_retencion_iva_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('retencion_iva_id_retencion_iva_seq', 13, true);


--
-- TOC entry 1316 (class 1259 OID 16450)
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
-- TOC entry 1317 (class 1259 OID 16455)
-- Dependencies: 1659 5
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    cedula_rif character varying(30),
    nombre character varying(150),
    direccion character varying(500),
    telf character varying(15),
    id_usuario integer DEFAULT nextval(('public.usuario_id_usuario_seq'::text)::regclass) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 1318 (class 1259 OID 16461)
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
-- TOC entry 1688 (class 0 OID 0)
-- Dependencies: 1318
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 20, true);


--
-- TOC entry 1660 (class 0 OID 16386)
-- Dependencies: 1295
-- Data for Name: acceso; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO acceso ("login", clave, tipo, id_acceso) VALUES ('leonardo', '15796044', 'A', 2);
INSERT INTO acceso ("login", clave, tipo, id_acceso) VALUES ('administracion', '9266165', 'U', 1);
INSERT INTO acceso ("login", clave, tipo, id_acceso) VALUES ('gaby22', '9269610', 'A', 4);
INSERT INTO acceso ("login", clave, tipo, id_acceso) VALUES ('jenrry', 'jc11021987', 'A', 6);
INSERT INTO acceso ("login", clave, tipo, id_acceso) VALUES ('naili', 'ubvsbp2008', 'A', 5);


--
-- TOC entry 1661 (class 0 OID 16391)
-- Dependencies: 1297
-- Data for Name: cheque; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-14', '16812420', '1200.62', 'CONFECCIONES KAMIKAZE, C.A.', 'CANCELACION A LA EMPRESA POR COMPRA DE 20 CHEMISE Y 20 GORRAS, POR EVENTO UNIVERSIDAD 2008 A REALIZARSE EN LA HABANA CUBA.SEGUN FACTURAS NROS 4711 12-02-2008;2801 12-02-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-006', 8, 'PAGADO', NULL, NULL, 'J-30713640-5');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-14', '47812431', '8716.15', 'COMPUSERVICIOS ARPANET C.A.', 'CANCELACION QUE SE HACE A LA EMPRESA COMPUSERVICIOS ARPANET C.A. POR LA COMPRA DE TINTA,TONER,CINTAS DE MINI DVD,REGULADORES PARA IMPRESORA.MATERIAL UTILIZADO POR TODAS LAS COORDINACIONES ADSCRITAS A ESTA SEDE.SEGUN FACTURAS NROS:000371 22-01-2008; 000376 28-01-2008; 000377 28-01-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-017', 20, 'PAGADO', NULL, NULL, 'J-31282012-8');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-14', '05812424', '3268.15', 'EL REY DEL FRIO, C.A.', 'CANCELACION A LA EMPRESA EL REY DEL FRIO, C.A. POR MANTENIMIENTO DE AIRES ACONDICIONADOS DE LA SEDE BARINAS.SEGUN FACTURA NRO 001104 24-01-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-010', 12, 'PAGADO', NULL, NULL, 'J-30859479-2');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-14', '85812423', '1772.42', 'SERVICIOS MERIDA C.A.', 'CANCELACION A LA EMPRESA SERVICIOS MERIDA C.A. POR MANTENIMIENTOS A LA UNIDAD DE TRANSPORTE TOYOTA PLACA AFG-69C.SEGUN FACTURA NRO 1604 29-01-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-009', 11, 'PAGADO', NULL, NULL, 'J-30876921-5');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-14', '33812416', '8716.15', 'COMPUSERVICIOS ARPANET C.A.', 'CANCELACION QUE SE HACE A LA EMPRESA COMPUSERVICIOS ARPANET C.A. POR LA COMPRA DE TINTA,TONER,CINTAS DE MINI DVD,REGULADORES PARA IMPRESORA.MATERIAL UTILIZADO POR TODAS LAS COORDINACIONES ADSCRITAS A ESTA SEDE.SEGUN FACTURAS NROS:000371 22-01-2008; 000376 28-01-2008; 000377 28-01-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-002', 4, 'ANULADO', 'ERROR DE IMPRESION', '2008-02-14', 'J-31282012-8');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-14', '11812422', '637.98', 'DISTRIBUIDORA J.C. HAHN', 'CANCELACION A LA EMPRESA DISTRIBUIDORA J.C. HAHN POR COMPRA DE BOTELLONES DE AGUA PARA LA SEDE UBV BARINAS. SEGUN FACTURAS NROS 010257 22-01-2008; 000712 29-01-2008; 010289 30-01-2008; 010326 08-02-2008; 000722 08-02-2008; 000721 08-02-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-008', 10, 'PAGADO', NULL, NULL, 'V-10562624-6');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-18', '31812433', '2932.31', 'MULTISERVICIOS J.H. C.A.', 'CANCELACION A LA EMPRESA MULTISERVICIOS J.H. C.A. POR CONCEPTO DE MANTENIMIENTO DE TODAS LAS UNIDADES DE TRANSPORTES ADSCRITAS A NUESTRA SEDE BARINAS.SEGUN FACTURAS 0127 15-02-2008; 0126 15-02-2008; 0125 15-02-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-019', 22, 'PAGADO', NULL, NULL, 'J-29486767-7');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-14', '67812432', '10800', 'COOPERATIVA TURISTICA KURIARA 674', 'CANCELACION A LA COOPERATIVA TURISTICA KURIARA 674 POR CONCEPTO DE TRASLADO DEL PERSONAL DOCENTE DE LA UBV BARINAS A LOS MUNICIPIOS SUCRE,ZAMORA,BARINAS,LA GUAIRA,IDA Y VUELTA.SEGUN FACTURAS 0024 29-01-2008; 0025 11-02-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-018', 21, 'PAGADO', NULL, NULL, 'J-31401906-6');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-14', '72812430', '254', 'YOEL CASTILLO', 'CANCELACION DE VIATICOS AL SR. YOEL CASTILLO, POR CONCEPTO DE ASISTENCIA A LA DIRECCION NACIONAL DE CONTROL DE ESTUDIOS PARA REALIZAR IMPRESIONES DE NOTAS DE ESTUDIANTES PROXIMOS A GRADUARSE. EN LA SEDE CARACAS LOS DIAS DESDE EL 17-02-2008 AL 19-02-2008.', 'CONTROL DE ESTUDIOS', 'BNS-016', 18, 'PAGADO', NULL, NULL, 'V-13063614');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-14', '59812429', '250', 'MARCOS SANCHEZ', 'CANCELACION DE VIATICOS AL SR. MARCOS SANCHEZ, POR CONCEPTO DE TRASLADO DE COMISION ASISTENTE A LA DIRECCION NACIONAL DE CONTROL DE ESTUDIOS PARA LA IMPRESION DE NOTAS CERTIFICADAS PROXIMAS A GRADUAR. LOS DIAS DESDE EL 17-02-2008 AL 19-02-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-015', 17, 'PAGADO', NULL, NULL, 'V-4343047');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-14', '84812428', '374', 'ENRIQUE AGUILERA', 'CANCELACION DE VIATICOS AL SR. ENRIQUE AGUILERA POR CONCEPTO DE ASISTENCIA A LA REUNION UBV XXI EN SU MOMENTO II EN LA SEDE CARACAS LOS DIAS DESDE EL 24-01-2008 AL 26-01-2008.', 'PROYECTOS Y PASANTIAS', 'BNS-014', 16, 'PAGADO', NULL, NULL, 'V-11190952');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-14', '64812427', '374', 'ANA MAR COLMENARES', 'CANCELACION DE VIATICOS A LA SRA. ANA MAR COLMENARES POR CONCEPTO DE REUNION CON AUTORIDADES DE LA DIRECCION NACIONAL DE POLITICAS ESTUDIANTILES EN LA SEDE CARACAS LOS DIAS DESDE EL 24-01-2008 AL 26-01-2008.', 'BIENESTAR ESTUDIANTIL', 'BNS-013', 15, 'PAGADO', NULL, NULL, 'V-13063445');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-14', '90812426', '610', 'YOEL CASTILLO', 'CANCELACION DE VIATICOS AL SR. YOEL CASTILLO POR CONCEPTO DE PROCESO DE AUDITORIA A REALIZARSE EN LA SEDE CARACAS LOS DIAS DESDE EL 08-02-2008 AL 12-02-2008.', 'CONTROL DE ESTUDIOS', 'BNS-012', 14, 'PAGADO', NULL, NULL, 'V-13063614');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-14', '70812425', '610', 'LUIS A. RONDON', 'CANCELACION DE VIATICOS AL SR. LUIS A. RONDON POR CONCEPTO DE PROCESO DE AUDITORIA A REALIZARSE EN LA SEDE CARACAS LOS DIAS DESDE EL 08-02-2008 AL 12-02-2008.', 'CONTROL DE ESTUDIOS', 'BNS-011', 13, 'PAGADO', NULL, NULL, 'V-11714856');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-14', '91812421', '1272', 'ASOCIACION COOPERATIVA AMARAIZA, R.L.', 'CANCELACION A LA ASOCIACION COOPERATIVA AMARAIZA, R.L. POR COMPRA DE COMIDA A FAVOR DE ACTIVIDADES ACADEMICAS REALIZADAS EN UBV BARINAS EN EL MES DE ENERO 2008.SEGUN FACTURA NRO 0053 13-02-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-007', 9, 'PAGADO', NULL, NULL, 'J-31478446-3');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-14', '02812419', '97.08', 'FARMACIA LA TRINIDAD C.A.', 'CANCELACION A LA EMPRESA FARMACIA LA TRINIDAD C.A. POR COMPRA DE MEDICAMENTOS A FAVOR DE LOS ESTUDIANTES DEL PFG AGROECOLOGIA.SEGUN FACTURAS NROS 440825 15-01-2008;442718 25-01-2008;443753 30-01-2008.', 'AGROECOLOGIA', 'BNS-005', 7, 'PAGADO', NULL, NULL, 'J-30614875-2');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-14', '28812418', '10800', 'COOPERATIVA TURISTICA KURIARA 674', 'CANCELACION A LA COOPERATIVA TURISTICA KURIARA 674 POR CONCEPTO DE TRASLADO DEL PERSONAL DOCENTE DE LA UBV BARINAS A LOS MUNICIPIOS SUCRE,ZAMORA,BARINAS,LA GUAIRA,IDA Y VUELTA.SEGUN FACTURAS 0024 29-01-2008; 0025 11-02-2008.', 'COORDINACION DE ADMINISTRACION', 'BNS-004', 6, 'ANULADO', 'ERROR DE IMPRESION', '2008-02-14', 'J-29486767-7');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-14', '18812417', '2800', 'ASOCIACION COOPERATIVA EL SABOR Y REVOLUCION 2007, R.L', 'CANCELACION QUE SE HACE A LA ASOCIACION COOPERATIVA "EL SABOR Y REVOLUCION 2007, R.L" POR LA COMPRA DE 200 ALMUERZOS PARA LA COORDINACION DE GESTION SOCIAL.POR ACTIVIDAD DE PASANTIAS. SEGUN FACTURAS NROS: 0096 28-01-2008.', 'GESTION SOCIAL', 'BNS-003', 5, 'PAGADO', NULL, NULL, 'J-29389073-0');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-14', '13812415', '6000', 'FRANCISCO JIMENEZ', 'APERTURA DE CAJA CHICA CORRESPONDIENTE AL MES DE ENERO AÑO 2008', 'COORDINACION DE ADMINISTRACION', 'BNS-001', 2, 'PAGADO', NULL, NULL, 'V-6384084');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-26', '51812434', '7490.32', 'PROVEEDURIA ESTUDIANTIL LOS LLANOS (PROVELLANOS)', 'CANCELACION A LA EMPRESA PROVEEDURIA ESTUDIANTIL LOS LLANOS (PROVELLANOS)POR CONCEPTO DE COMPRA DE PRODUCTOS DE PAPEL Y CARTON PARA OFICINA SEGUN FACTURA NRO 1132 DE FECHA 25-02-2008.

', 'ADMINISTRACION', 'BNS-020', 23, 'PAGADO', NULL, NULL, 'V-16699923-1');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-27', '26812435', '35.36', 'TESORERIA NACIONAL', 'CANCELACION QUE SE HACE A TESORERIA NACIONAL, POR CONCEPTO DE RETENCION DEL I.S.L.R. A LA EMPRESA SERVICIOS MERIDA CA COMPROBANTE DE RETENCION NRO 20080100000001 DE FECHA 13-02-2008 MONTO SUJETO 1.768.00 RETENCION 2% IMPUESTO BSF 35.36.', 'COORDINACION DE ADMINISTRACION', 'BNS-021', 25, 'PAGADO', NULL, NULL, '0');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-27', '46812436', '65.20', 'TESORERIA NACIONAL', 'CANCELACION QUE SE HACE A TESORERIA NACIONAL, POR CONCEPTO DE RETENCION DEL I.S.L.R. A LA EMPRESA EL REY DEL FRIO CA, COMPROBANTE DE RETENCION NRO 20080100000002 DE FECHA 13-02-2008 MONTO SUJETO 3.260, RETENCION 2% IMPUESTO BSF 65.20.


', 'COORDINACION DE ADMINISTRACION', 'BNS-022', 26, 'PAGADO', NULL, NULL, '0');
INSERT INTO cheque (fecha, ncheque, monto_cheque, beneficiario, concepto, programa, cod_contable, id_cheque, estado, motivo, fecha_a, cedula_rif) VALUES ('2008-02-27', '11812437', '58.50', 'TESORERIA NACIONAL', 'CANCELACION QUE SE HACE A TESORERIA NACIONAL, POR CONCEPTO DE RETENCION DEL I.S.L.R. A LA EMPRESA MULTISERVICIOS JH CA COMPROBANTE DE RETENCION NRO 20080100000003 DE FECHA 15-02-2008 MONTO SUJETO 2.925, RETENCION 2% IMPUESTO BSF 58.50.


', 'COORDINACION DE ADMINISTRACION', 'BNS-023', 27, 'PAGADO', NULL, NULL, '0');


--
-- TOC entry 1662 (class 0 OID 16399)
-- Dependencies: 1299
-- Data for Name: configuracion; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO configuracion (coordinador_sede, coordinador_adm, administrador, cuenta, iva, isrl, id_configuracion, sede, rif, comienzo_anio) VALUES ('ING. FRANCISCO LOPEZ', 'LIC. DOMINGO ANATO', 'LIC. NAILI SIMANCAS', '0003 0057 82 0001061084', 9, 75, 1, 'BARINAS', 'G-20003773-3', '2008-01-01');


--
-- TOC entry 1663 (class 0 OID 16404)
-- Dependencies: 1301
-- Data for Name: distribucion_cheque; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '91812421', '2', '1272', 'COORDINACION DE ADMINISTRACION', 'BNS-007', 9, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '70812425', '42', '610', 'CONTROL DE ESTUDIOS', 'BNS-011', 13, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '90812426', '42', '610', 'CONTROL DE ESTUDIOS', 'BNS-012', 14, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '64812427', '42', '374', 'BIENESTAR ESTUDIANTIL', 'BNS-013', 15, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '84812428', '42', '374', 'PROYECTOS Y PASANTIAS', 'BNS-014', 16, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '59812429', '42', '250', 'COORDINACION DE ADMINISTRACION', 'BNS-015', 17, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '72812430', '42', '254', 'CONTROL DE ESTUDIOS', 'BNS-016', 18, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '02812419', '15', '97.02', 'AGROECOLOGIA', 'BNS-005', 7, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '16812420', '5', '1200.62', 'COORDINACION DE ADMINISTRACION', 'BNS-006', 8, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '11812422', '2', '637.98', 'COORDINACION DE ADMINISTRACION', 'BNS-008', 10, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '85812423', '44', '1772.42', 'COORDINACION DE ADMINISTRACION', 'BNS-009', 11, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '05812424', '43', '3268.15', 'COORDINACION DE ADMINISTRACION', 'BNS-010', 12, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '18812417', '2', '2800', 'GESTION SOCIAL', 'BNS-003', 5, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '47812431', '27', '5348.53', 'COORDINACION DE ADMINISTRACION', 'BNS-017', 19, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '67812432', '31', '10800', 'COORDINACION DE ADMINISTRACION', 'BNS-018', 21, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '33812416', '27', '5348.53', 'COORDINACION DE ADMINISTRACION', 'BNS-002', 3, 'ANULADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '33812416', '14', '3367.62', 'COORDINACION DE ADMINISTRACION', 'BNS-002', 4, 'ANULADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '28812418', '31', '10800', 'COORDINACION DE ADMINISTRACION', 'BNS-004', 6, 'ANULADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '47812431', '14', '3367.62', 'COORDINACION DE ADMINISTRACION', 'BNS-017', 20, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-18', '31812433', '44', '2932.31', 'COORDINACION DE ADMINISTRACION', 'BNS-019', 22, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-14', '13812415', '0', '6000', 'COORDINACION DE ADMINISTRACION', 'BNS-001', 2, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-26', '51812434', '9', '7490.32', 'COORDINACION DE ADMINISTRACION', 'BNS-020', 1, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-27', '26812435', '44', '35.36', 'COORDINACION DE ADMINISTRACION', 'BNS-021', 24, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-27', '46812436', '44', '62.20', 'COORDINACION DE ADMINISTRACION', 'BNS-022', 25, 'PAGADO');
INSERT INTO distribucion_cheque (fecha, ncheque, cod_partida, monto, programa, cod_contable, id_distribucion, estado) VALUES ('2008-02-27', '11812437', '44', '58.50', 'COORDINACION DE ADMINISTRACION', 'BNS-023', 26, 'PAGADO');


--
-- TOC entry 1664 (class 0 OID 16409)
-- Dependencies: 1303
-- Data for Name: ingresos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ingresos (fecha, codigo, beneficiario, concepto, monto, id_ingresos) VALUES ('2008-02-07', '717560', 'UBV BARINAS', 'DEPOSITO DE FONDOS', '50000.00', 1);


--
-- TOC entry 1665 (class 0 OID 16419)
-- Dependencies: 1306
-- Data for Name: p_principal; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO p_principal (codigo, descripcion, monto_asig, monto_ejec, id_p_principal) VALUES ('2.01.00.00.00', 'Pasivo Circulante', 0, 0, 1);
INSERT INTO p_principal (codigo, descripcion, monto_asig, monto_ejec, id_p_principal) VALUES ('4.02.00.00.00', 'Materiales Suministros', 0, 0, 2);
INSERT INTO p_principal (codigo, descripcion, monto_asig, monto_ejec, id_p_principal) VALUES ('4.03.00.00.00', 'Servicios No Personales', 0, 0, 3);
INSERT INTO p_principal (codigo, descripcion, monto_asig, monto_ejec, id_p_principal) VALUES ('4.04.00.00.00', 'Activos Reales', 0, 0, 4);


--
-- TOC entry 1666 (class 0 OID 16424)
-- Dependencies: 1308
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
-- TOC entry 1667 (class 0 OID 16429)
-- Dependencies: 1310
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
-- TOC entry 1668 (class 0 OID 16434)
-- Dependencies: 1312
-- Data for Name: retencion_isrl; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-02-24', 'SERVICIOS MERIDA C.A.', 'J-30876921-5', '20080200000001', '85812423', 'Conserv.  y reparac. Men. Equip. Transporte', '1768.00', '2', '35.36', 'ASIGNADO', 1);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-02-24', 'MULTISERVICIOS J.H. C.A.', 'J-29486767-7', '20080200000003', '31812433', 'Conserv.  y reparac. Men. Equip. Transporte', '2180.00', '2', '43.6', 'ASIGNADO', 5);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-02-24', 'MULTISERVICIOS J.H. C.A.', 'J-29486767-7', '20080200000003', '31812433', 'Conserv.  y reparac. Men. Equip. Transporte', '415', '2', '8.3', 'ASIGNADO', 4);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-02-24', 'MULTISERVICIOS J.H. C.A.', 'J-29486767-7', '20080200000003', '31812433', 'Conserv.  y reparac. Men. Equip. Transporte', '330', '2', '6.6', 'ASIGNADO', 3);
INSERT INTO retencion_isrl (fecha, sujeto, cedula_rif, comprobante, ncheque, tipo_transaccion, monto_total, pret, monto_retenido, estado, id_retencion_isrl) VALUES ('2008-02-24', 'EL REY DEL FRIO, C.A.', 'J-30859479-2', '20080200000002', '05812424', 'Otros servicios profesionales y tècnicos', '3260.00', '2', '65.2', 'ASIGNADO', 2);


--
-- TOC entry 1669 (class 0 OID 16442)
-- Dependencies: 1314
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


--
-- TOC entry 1670 (class 0 OID 16450)
-- Dependencies: 1316
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


--
-- TOC entry 1671 (class 0 OID 16455)
-- Dependencies: 1317
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario) VALUES ('J-31401906-6', 'COOPERATIVA TURISTICA KURIARA 674', 'NO', 'NO', 2);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario) VALUES ('J-31282012-8', 'COMPUSERVICIOS ARPANET C.A.', 'NO', 'NO', 3);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario) VALUES ('V-13063614', 'YOEL CASTILLO', 'NO', 'NO', 4);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario) VALUES ('V-4343047', 'MARCOS SANCHEZ', 'NO', 'NO', 5);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario) VALUES ('V-11190952', 'ENRIQUE AGUILERA', 'NO', 'NO', 6);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario) VALUES ('V-13063445', 'ANA MAR COLMENARES', 'NO', 'NO', 7);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario) VALUES ('V-11714856', 'LUIS A, RONDON', 'NO', 'NO', 8);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario) VALUES ('V-30859479-2', 'EL REY DEL FRIO, C.A.', 'NO', 'NO', 9);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario) VALUES ('J-30876921-5', 'SERVICIOS MERIDA C.A.', 'NO', 'NO', 10);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario) VALUES ('V-10562624-6', 'DISTRIBUIDORA J.C. HAHN', 'NO', 'NO', 11);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario) VALUES ('J-31478446-3', 'ASOCIACION COOPERATIVA AMARAIZA, R.L.', 'NO', 'NO', 12);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario) VALUES ('J-30713640-5', 'CONFECCIONES KAMIKAZE, C.A.', 'NO', 'NO', 13);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario) VALUES ('J-30614875-2', 'FARMACIA LA TRINIDAD C.A.', 'NO', 'NO', 14);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario) VALUES ('J-29389073-0', 'ASOCIACION COOPERATIVA EL SABOR Y REVOLUCION 2007, R.L', 'NO', 'NO', 15);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario) VALUES ('V-6384084', 'FRANCISCO JIMENEZ', 'NO', 'NO', 16);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario) VALUES ('J-29428263-6', 'MULTISERVICIOS SAN ANDRES, C.A', 'AV INDUSTRIAL NUMERO 01-106', '0273-5323478', 18);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario) VALUES ('0', 'TESORERIA NACIONAL', 'no', 'no', 20);
INSERT INTO usuario (cedula_rif, nombre, direccion, telf, id_usuario) VALUES ('V-16699923-1', 'PROVEEDURIA ESTUDIANTIL LOS LLANOS (PROVELLANOS)', 'NO', 'NO', 17);


--
-- TOC entry 1676 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2008-02-29 16:54:07 VET

--
-- PostgreSQL database dump complete
--

