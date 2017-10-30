--
-- PostgreSQL database dump
--

-- Started on 2011-01-18 13:22:12 VET

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1479 (class 1259 OID 24577)
-- Dependencies: 1756 3
-- Name: acceso; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE acceso (
    login character varying(30) NOT NULL,
    clave character varying(30) NOT NULL,
    tipo character varying(15) NOT NULL,
    id_acceso integer DEFAULT nextval(('public.acceso_id_acceso_seq'::text)::regclass) NOT NULL,
    nomb_usuario character varying(50),
    id_dpto character varying(10)
);


ALTER TABLE public.acceso OWNER TO leonardo;

--
-- TOC entry 1480 (class 1259 OID 24581)
-- Dependencies: 3
-- Name: acceso_id_acceso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE acceso_id_acceso_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.acceso_id_acceso_seq OWNER TO postgres;

--
-- TOC entry 1772 (class 0 OID 0)
-- Dependencies: 1480
-- Name: acceso_id_acceso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('acceso_id_acceso_seq', 10, true);


--
-- TOC entry 1488 (class 1259 OID 24607)
-- Dependencies: 1760 3
-- Name: asistencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE asistencia (
    id_asistencia integer DEFAULT nextval(('public.asistencia_id_asistencia_seq'::text)::regclass) NOT NULL,
    fecha date NOT NULL,
    id_personal character varying(10),
    cedula character varying(30),
    entra1 character varying(10),
    sale1 character varying(10),
    entra2 character varying(10),
    sale2 character varying(10),
    observacion character varying(1500),
    id_dpto character varying(10)
);


ALTER TABLE public.asistencia OWNER TO postgres;

--
-- TOC entry 1489 (class 1259 OID 24614)
-- Dependencies: 3
-- Name: asistencia_id_asistencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE asistencia_id_asistencia_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.asistencia_id_asistencia_seq OWNER TO postgres;

--
-- TOC entry 1773 (class 0 OID 0)
-- Dependencies: 1489
-- Name: asistencia_id_asistencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('asistencia_id_asistencia_seq', 982, true);


--
-- TOC entry 1485 (class 1259 OID 24595)
-- Dependencies: 1759 3
-- Name: departamento; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE departamento (
    nombre_departamento character varying(150) NOT NULL,
    id_departamento integer DEFAULT nextval(('public.departamento_id_departamento_seq'::text)::regclass) NOT NULL,
    responsable character varying(150)
);


ALTER TABLE public.departamento OWNER TO leonardo;

--
-- TOC entry 1486 (class 1259 OID 24599)
-- Dependencies: 3
-- Name: departamento_id_departamento_seq; Type: SEQUENCE; Schema: public; Owner: leonardo
--

CREATE SEQUENCE departamento_id_departamento_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.departamento_id_departamento_seq OWNER TO leonardo;

--
-- TOC entry 1774 (class 0 OID 0)
-- Dependencies: 1486
-- Name: departamento_id_departamento_seq; Type: SEQUENCE SET; Schema: public; Owner: leonardo
--

SELECT pg_catalog.setval('departamento_id_departamento_seq', 1, false);


--
-- TOC entry 1483 (class 1259 OID 24589)
-- Dependencies: 1758 3
-- Name: horario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE horario (
    id_horario integer DEFAULT nextval(('public.horario_id_horario_seq'::text)::regclass) NOT NULL,
    entra1 character varying(10),
    sale1 character varying(10),
    entra2 character varying(10),
    sale2 character varying(10),
    entra3 character varying(10),
    sale3 character varying(10),
    entra4 character varying(10),
    sale4 character varying(10),
    m1 character varying(5),
    m2 character varying(5),
    m3 character varying(5),
    m4 character varying(5),
    m5 character varying(5),
    m6 character varying(5),
    m7 character varying(5),
    m8 character varying(5)
);


ALTER TABLE public.horario OWNER TO postgres;

--
-- TOC entry 1484 (class 1259 OID 24593)
-- Dependencies: 3
-- Name: horario_id_horario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE horario_id_horario_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.horario_id_horario_seq OWNER TO postgres;

--
-- TOC entry 1775 (class 0 OID 0)
-- Dependencies: 1484
-- Name: horario_id_horario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('horario_id_horario_seq', 1, true);


--
-- TOC entry 1481 (class 1259 OID 24583)
-- Dependencies: 1757 3
-- Name: personal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE personal (
    id_personal integer DEFAULT nextval(('public.personal_id_personal_seq'::text)::regclass) NOT NULL,
    cedula character varying(30),
    nombre character varying(180) NOT NULL,
    cargo character varying(180),
    tipo character varying(50),
    id_dpto character varying(10),
    estado character varying(20)
);


ALTER TABLE public.personal OWNER TO postgres;

--
-- TOC entry 1482 (class 1259 OID 24587)
-- Dependencies: 3
-- Name: personal_id_personal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE personal_id_personal_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.personal_id_personal_seq OWNER TO postgres;

--
-- TOC entry 1776 (class 0 OID 0)
-- Dependencies: 1482
-- Name: personal_id_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personal_id_personal_seq', 45, true);


--
-- TOC entry 1487 (class 1259 OID 24601)
-- Dependencies: 3
-- Name: transaccion; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--

CREATE TABLE transaccion (
    fecha date,
    hora time with time zone,
    operacion text,
    login text
);


ALTER TABLE public.transaccion OWNER TO leonardo;

--
-- TOC entry 1761 (class 0 OID 24577)
-- Dependencies: 1479
-- Data for Name: acceso; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO acceso (login, clave, tipo, id_acceso, nomb_usuario, id_dpto) VALUES ('leonardo', '15796044', 'A', 1, 'LEONARDO MATOS', NULL);
INSERT INTO acceso (login, clave, tipo, id_acceso, nomb_usuario, id_dpto) VALUES ('cramirez', 'cramirez', 'C', 4, 'CARLOS RAMIREZ', NULL);
INSERT INTO acceso (login, clave, tipo, id_acceso, nomb_usuario, id_dpto) VALUES ('jrondon', 'jrondon', 'C', 8, 'JAVIER RONDON', NULL);
INSERT INTO acceso (login, clave, tipo, id_acceso, nomb_usuario, id_dpto) VALUES ('ycastillo', 'ycastillo', 'C', 3, 'YOEL CASTILLO', '3');
INSERT INTO acceso (login, clave, tipo, id_acceso, nomb_usuario, id_dpto) VALUES ('yortiz', 'yortiz', 'C', 7, 'YELITZA ORTIZ', '22');
INSERT INTO acceso (login, clave, tipo, id_acceso, nomb_usuario, id_dpto) VALUES ('jalvarez', 'jalvarez', 'C', 5, 'JOSE ALVAREZ', '24');
INSERT INTO acceso (login, clave, tipo, id_acceso, nomb_usuario, id_dpto) VALUES ('lflores', 'lflores', 'C', 10, 'LUIS FLORES', '14');
INSERT INTO acceso (login, clave, tipo, id_acceso, nomb_usuario, id_dpto) VALUES ('lyanez', 'lyanez', 'C', 9, 'LOLIZABEL YANEZ', '9');
INSERT INTO acceso (login, clave, tipo, id_acceso, nomb_usuario, id_dpto) VALUES ('aolaechea', 'aolaechea', 'C', 6, 'ABBY OLAECHEA', '5');
INSERT INTO acceso (login, clave, tipo, id_acceso, nomb_usuario, id_dpto) VALUES ('nperalta', 'nperalta', '', 2, 'NOEL PERALTA', '7');


--
-- TOC entry 1766 (class 0 OID 24607)
-- Dependencies: 1488
-- Data for Name: asistencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (83, '2010-02-08', '7', '16979004', '07:53', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (84, '2010-02-08', '30', '15596617', '07:53', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (85, '2010-02-08', '17', '8189876', '07:55', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (13, '2010-02-02', '3', '15384338', '07:53', '', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (88, '2010-02-08', '16', '16634218', '07:59', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (89, '2010-02-08', '12', '14663175', '08:00', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (90, '2010-02-08', '6', '12836536', '08:02', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (3, '2010-01-29', '4', '17768572', '08:15', NULL, NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (6, '2010-01-27', '9', '8132701', '08:25', '', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (14, '2010-02-02', '2', '7237276', '07:53', '', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (8, '2010-01-29', '11', '11715878', NULL, '12:56', NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (6, '2010-01-29', '9', '8132701', '08:25', '12:57', NULL, NULL, NULL, '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (9, '2010-01-29', '7', '16979004', NULL, NULL, '01:06', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (7, '2010-01-29', '10', '15791432', '10:43', NULL, '01:07', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (11, '2010-02-02', '5', '16638750', '07:29', NULL, NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (12, '2010-02-02', '12', '14663175', '07:51', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (16, '2010-02-02', '7', '16979004', '08:02', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (18, '2010-02-02', '14', '16189838', '08:07', NULL, NULL, NULL, NULL, '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (19, '2010-02-02', '11', '11715878', '08:08', '12:59', NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (15, '2010-02-02', '9', '8132701', '08:01', NULL, '01:03', NULL, NULL, '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (20, '2010-02-03', '5', '16638750', '07:49', NULL, NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (22, '2010-02-03', '11', '11715878', '08:01', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (23, '2010-02-03', '15', '11714856', '08:02', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (24, '2010-02-03', '6', '12836536', '08:03', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (25, '2010-02-03', '7', '16979004', '08:04', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (28, '2010-02-03', '16', '16634218', '08:07', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (29, '2010-02-03', '17', '8189876', '08:10', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (30, '2010-02-03', '9', '8132701', '08:16', NULL, NULL, NULL, NULL, '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (33, '2010-02-03', '10', '15791432', '08:22', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (34, '2010-02-03', '20', '13947741', '08:23', NULL, NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (35, '2010-02-03', '14', '16189838', '08:28', NULL, NULL, NULL, NULL, '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (36, '2010-02-03', '24', '6384084', '08:35', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (49, '2010-02-04', '31', '4256124', '08:13', NULL, NULL, NULL, NULL, '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (50, '2010-02-04', '32', '10560322', '08:15', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (52, '2010-02-04', '22', '8568447', '08:22', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (55, '2010-02-04', '33', '9389381', '08:24', '12:57', NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (37, '2010-02-03', '25', '10560238', '08:56', '1:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (59, '2010-02-04', '28', '4926074', '', '12:59', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (47, '2010-02-04', '24', '6384084', '08:09', '12:59', NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (41, '2010-02-04', '16', '16634218', '07:56', '12:59', NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (46, '2010-02-04', '15', '11714856', '08:08', '12:59', NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (60, '2010-02-04', '29', '4383047', '', '12:59', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (78, '2010-02-08', '2', '7237276', '07:48', '', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (53, '2010-02-04', '9', '8132701', '08:23', NULL, '01:00', NULL, NULL, '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (44, '2010-02-04', '30', '15596617', '08:08', NULL, '01:01', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (51, '2010-02-04', '10', '15791432', '08:15', NULL, '01:07', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (54, '2010-02-04', '6', '12836536', '08:23', NULL, '01:07', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (45, '2010-02-04', '11', '11715878', '08:08', NULL, '01:09', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (40, '2010-02-04', '7', '16979004', '07:54', NULL, '01:13', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (62, '2010-02-05', '6', '12836536', '08:02', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (63, '2010-02-05', '24', '6384084', '08:05', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (64, '2010-02-05', '15', '11714856', '08:05', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (70, '2010-02-05', '22', '8568447', '08:11', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (71, '2010-02-05', '9', '8132701', '08:16', NULL, NULL, NULL, NULL, '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (73, '2010-02-05', '31', '4256124', '08:33', NULL, NULL, NULL, NULL, '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (74, '2010-02-05', '14', '16189838', '08:53', NULL, NULL, NULL, NULL, '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (67, '2010-02-05', '16', '16634218', '08:08', '12:55', NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (65, '2010-02-05', '17', '8189876', '08:06', '12:57', NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (76, '2010-02-05', '33', '9389381', NULL, '12:58', NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (68, '2010-02-05', '11', '11715878', '08:08', NULL, '01:00', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (72, '2010-02-05', '32', '10560322', '08:23', NULL, '01:00', NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (66, '2010-02-05', '7', '16979004', '08:07', NULL, '01:00', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (61, '2010-02-05', '10', '15791432', '08:02', NULL, '01:04', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (80, '2010-02-08', '34', '9987655', '07:51', NULL, NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (91, '2010-02-08', '20', '13947741', '08:04', NULL, NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (93, '2010-02-08', '24', '6384084', '08:06', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (94, '2010-02-08', '8', '15270968', '08:06', NULL, NULL, NULL, NULL, '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (95, '2010-02-08', '22', '8568447', '08:06', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (98, '2010-02-08', '11', '11715878', '08:12', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (99, '2010-02-08', '10', '15791432', '08:21', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (87, '2010-02-08', '35', '12554677', '07:56', '12:57', NULL, NULL, NULL, '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (58, '2010-02-04', '27', '13063445', '', '12:59', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (57, '2010-02-04', '25', '10560238', '09:10', '12:59', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (39, '2010-02-04', '19', '10562263', '07:48', '12:58', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (102, '2010-02-08', '9', '8132701', NULL, NULL, '01:04', NULL, NULL, '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (86, '2010-02-08', '33', '9389381', '07:55', NULL, '01:05', NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (101, '2010-02-08', '32', '10560322', '08:21', NULL, '01:07', NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (96, '2010-02-08', '31', '4256124', '08:09', NULL, '01:07', NULL, NULL, '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (107, '2010-02-09', '12', '14663175', '08:01', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (108, '2010-02-09', '6', '12836536', '08:02', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (113, '2010-02-09', '24', '6384084', '08:07', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (117, '2010-02-09', '11', '11715878', '08:17', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (114, '2010-02-09', '33', '9389381', '08:09', '12:56', NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (92, '2010-02-08', '25', '10560238', '08:04', '1:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (121, '2010-02-09', '36', '14340860', NULL, '12:58', NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (100, '2010-02-08', '26', '9326804', '08:21', '12:58', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (79, '2010-02-08', '19', '10562263', '07:51', '', '01:03', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (110, '2010-02-09', '17', '8189876', '08:03', NULL, '01:00', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (104, '2010-02-09', '16', '16634218', '08:00', NULL, '01:01', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (116, '2010-02-09', '31', '4256124', '08:17', NULL, '01:05', NULL, NULL, '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (115, '2010-02-09', '7', '16979004', '08:12', NULL, '01:08', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (123, '2010-02-09', '5', '16638750', NULL, NULL, '01:09', NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (1, '2010-01-28', '1', '15796044', '11:30', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (119, '2010-02-09', '32', '10560322', '08:18', NULL, '01:12', NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (118, '2010-02-09', '9', '8132701', '08:18', NULL, '01:21', NULL, NULL, '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (124, '2010-02-10', '7', '16979004', '07:43', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (125, '2010-02-10', '17', '8189876', '07:43', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (5, '2010-01-29', '2', '7237276', '08:16', '', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (105, '2010-02-09', '18', '14663332', '08:01', '12:59', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (120, '2010-02-09', '1', '15796044', '07:58', '10:20', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (82, '2010-02-08', '3', '15384338', '07:53', '', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (77, '2010-02-05', '2', '7237276', '08:05', '01:07', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (21, '2010-02-03', '3', '15384338', '07:59', '', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (17, '2010-02-02', '13', '9386915', '08:06', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (10, '2010-02-01', '2', '7237276', '08:14', '', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (4, '2010-01-29', '3', '15384338', '08:16', '', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (2, '2010-01-29', '1', '15796044', '08:15', '12:55', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (27, '2010-02-03', '13', '9386915', '08:06', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (26, '2010-02-03', '2', '7237276', '08:06', '', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (48, '2010-02-04', '3', '15384338', '08:12', '', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (81, '2010-02-08', '18', '14663332', '07:52', '', '01:04', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (75, '2010-02-05', '26', '9326804', '11:13', '1:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (42, '2010-02-04', '18', '14663332', '07:58', '12:58', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (56, '2010-02-04', '26', '9326804', '09:04', '1:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (31, '2010-02-03', '18', '14663332', '08:19', '1:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (109, '2010-02-09', '25', '10560238', '08:03', '12:57', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (106, '2010-02-09', '19', '10562263', '08:01', '12:59', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (112, '2010-02-09', '27', '13063445', '08:06', '1:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (127, '2010-02-10', '34', '9987655', '07:47', NULL, NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (126, '2010-02-10', '5', '16638750', '07:48', NULL, NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (128, '2010-02-10', '21', '18471179', '07:48', NULL, NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (130, '2010-02-10', '12', '14663175', '07:54', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (131, '2010-02-10', '33', '9389381', '07:57', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (135, '2010-02-10', '16', '16634218', '08:03', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (136, '2010-02-10', '6', '12836536', '08:04', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (137, '2010-02-10', '10', '15791432', '08:07', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (140, '2010-02-10', '11', '11715878', '08:13', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (142, '2010-02-10', '9', '8132701', '08:17', NULL, NULL, NULL, NULL, '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (143, '2010-02-10', '24', '6384084', '08:17', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (144, '2010-02-10', '32', '10560322', '08:18', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (145, '2010-02-10', '37', '14434534', '08:24', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (146, '2010-02-10', '14', '16189838', '08:38', NULL, NULL, NULL, NULL, '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (149, '2010-02-11', '24', '6384084', '08:04', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (150, '2010-02-11', '7', '16979004', '08:05', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (151, '2010-02-11', '22', '8568447', '08:05', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (156, '2010-02-11', '12', '14663175', '08:08', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (159, '2010-02-11', '31', '4256124', '08:24', NULL, NULL, NULL, NULL, '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (160, '2010-02-11', '26', '9326804', '08:26', '1:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (161, '2010-02-11', '6', '12836536', NULL, '12:56', NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (133, '2010-02-10', '18', '14663332', '08:01', '1:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (129, '2010-02-10', '19', '10562263', '07:54', '1:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (162, '2010-02-11', '32', '10560322', NULL, '12:57', NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (250, '2010-02-22', '26', '9326804', '10:04', '12:55', '', '', 'HORARIO CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (191, '2010-02-18', '2', '7237276', '07:45', '', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (163, '2010-02-12', '7', '16979004', '08:09', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (165, '2010-02-12', '22', '8568447', '08:16', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (166, '2010-02-12', '12', '14663175', '08:17', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (148, '2010-02-11', '27', '13063445', '07:50', '1:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (174, '2010-02-17', '38', '11062752', '07:51', NULL, NULL, NULL, NULL, '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (175, '2010-02-17', '12', '14663175', '07:55', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (187, '2010-02-17', '14', '16189838', '09:48', NULL, NULL, NULL, NULL, '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (158, '2010-02-11', '2', '7237276', '08:18', '', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (182, '2010-02-17', '16', '16634218', '08:04', '12:58', NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (188, '2010-02-17', '4', '17768572', NULL, '12:59', NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (173, '2010-02-17', '33', '9389381', '07:48', NULL, '01:01', NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (176, '2010-02-17', '6', '12836536', '07:58', NULL, '01:01', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (189, '2010-02-17', '36', '14340860', NULL, NULL, '01:02', NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (169, '2010-02-12', '27', '13063445', '10:19', '1:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (164, '2010-02-12', '25', '10560238', '08:12', '12:57', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (183, '2010-02-17', '11', '11715878', '08:05', NULL, '01:04', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (180, '2010-02-17', '7', '16979004', '08:01', NULL, '01:04', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (181, '2010-02-17', '31', '4256124', '08:02', NULL, '01:07', NULL, NULL, '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (177, '2010-02-17', '24', '6384084', '07:59', NULL, '01:09', NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (190, '2010-02-17', '26', '9326804', '', '', '01:03', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (172, '2010-02-17', '5', '16638750', '07:44', NULL, '01:10', NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (221, '2010-02-19', '1', '15796044', '08:19', '12:57', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (192, '2010-02-18', '37', '14434534', '07:46', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (194, '2010-02-18', '5', '16638750', '07:47', NULL, NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (197, '2010-02-18', '35', '12554677', '07:54', NULL, NULL, NULL, NULL, '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (198, '2010-02-18', '12', '14663175', '07:55', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (199, '2010-02-18', '21', '18471179', '07:56', NULL, NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (204, '2010-02-18', '38', '11062752', '08:30', NULL, NULL, NULL, NULL, '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (205, '2010-02-18', '33', '9389381', '08:31', '12:55', NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (171, '2010-02-17', '28', '4926074', '07:18', '', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (206, '2010-02-18', '26', '9326804', '10:52', '12:56', '', '', 'HORARIO CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (178, '2010-02-17', '18', '14663332', '08:00', '', '01:03', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (170, '2010-02-17', '25', '10560238', '07:18', '', '01:09', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (200, '2010-02-18', '24', '6384084', '08:00', NULL, '01:01', NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (209, '2010-02-18', '32', '10560322', NULL, NULL, '01:01', NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (210, '2010-02-18', '9', '8132701', NULL, NULL, '01:01', NULL, NULL, '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (196, '2010-02-18', '6', '12836536', '07:54', NULL, '01:01', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (203, '2010-02-18', '31', '4256124', '08:28', NULL, '01:07', NULL, NULL, '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (212, '2010-02-19', '24', '6384084', '08:01', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (219, '2010-02-19', '32', '10560322', '08:08', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (220, '2010-02-19', '35', '12554677', '08:08', NULL, NULL, NULL, NULL, '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (222, '2010-02-19', '4', '17768572', '08:19', NULL, NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (226, '2010-02-19', '11', '11715878', '08:31', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (227, '2010-02-19', '38', '11062752', '09:38', NULL, NULL, NULL, NULL, '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (195, '2010-02-18', '19', '10562263', '07:47', '12:59', '', '', 'HORARIO CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (208, '2010-02-18', '27', '13063445', '', '12:57', '', '', 'HORARIO CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (224, '2010-02-19', '31', '4256124', '08:24', '12:56', NULL, NULL, NULL, '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (153, '2010-02-11', '3', '15384338', '08:07', '12:57', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (213, '2010-02-19', '12', '14663175', '08:02', '12:58', NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (230, '2010-02-19', '9', '8132701', NULL, '12:59', NULL, NULL, NULL, '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (141, '2010-02-10', '3', '15384338', '08:14', '', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (225, '2010-02-19', '14', '16189838', '08:27', NULL, '01:00', NULL, NULL, '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (215, '2010-02-19', '6', '12836536', '08:03', NULL, '01:02', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (214, '2010-02-19', '33', '9389381', '08:02', NULL, '01:03', NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (211, '2010-02-19', '10', '15791432', '08:01', NULL, '01:09', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (232, '2010-02-22', '5', '16638750', '08:00', NULL, NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (235, '2010-02-22', '6', '12836536', '08:05', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (236, '2010-02-22', '24', '6384084', '08:05', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (238, '2010-02-22', '10', '15791432', '08:08', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (239, '2010-02-22', '37', '14434534', '08:08', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (240, '2010-02-22', '4', '17768572', '08:08', NULL, NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (242, '2010-02-22', '22', '8568447', '08:09', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (244, '2010-02-22', '31', '4256124', '08:10', NULL, NULL, NULL, NULL, '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (245, '2010-02-22', '11', '11715878', '08:12', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (246, '2010-02-22', '33', '9389381', '08:17', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (249, '2010-02-22', '14', '16189838', '08:34', NULL, NULL, NULL, NULL, '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (248, '2010-02-22', '12', '14663175', '08:23', '12:55', NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (247, '2010-02-22', '32', '10560322', '08:19', '12:55', NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (228, '2010-02-19', '26', '9326804', '10:52', '', '', '', 'HORARIO CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (251, '2010-02-22', '35', '12554677', NULL, '12:56', NULL, NULL, NULL, '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (184, '2010-02-17', '2', '7237276', '08:06', '', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (138, '2010-02-10', '13', '9386915', '08:08', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (241, '2010-02-22', '1', '15796044', '08:09', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (223, '2010-02-19', '3', '15384338', '08:21', '', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (202, '2010-02-18', '3', '15384338', '08:28', '', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (185, '2010-02-17', '3', '15384338', '08:08', '01:22', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (229, '2010-02-19', '25', '10560238', '', '12:55', '', '', 'HORARIO CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (216, '2010-02-19', '19', '10562263', '08:04', '12:55', '', '', 'HORARIO CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (217, '2010-02-19', '18', '14663332', '08:05', '12:55', '', '', 'HORARIO CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (201, '2010-02-18', '25', '10560238', '08:01', '12:57', '', '', 'HORARIO CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (193, '2010-02-18', '18', '14663332', '07:46', '12:59', '', '', 'HORARIO CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (179, '2010-02-17', '19', '10562263', '08:00', '', '01:03', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (167, '2010-02-12', '18', '14663332', '08:20', '1:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (154, '2010-02-11', '19', '10562263', '08:07', '12:56', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (155, '2010-02-11', '18', '14663332', '08:07', '12:56', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (134, '2010-02-10', '27', '13063445', '08:02', '1:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (243, '2010-02-22', '25', '10560238', '08:09', '', '02:00', '5:30', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (233, '2010-02-22', '19', '10562263', '08:01', '12:59', '', '', 'HORARIO CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (234, '2010-02-22', '18', '14663332', '08:02', '12:59', '', '', 'HORARIO CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (252, '2010-02-23', '24', '6384084', '08:21', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (256, '2010-02-23', '4', '17768572', '08:27', NULL, NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (258, '2010-02-23', '33', '9389381', '09:10', '12:57', NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (320, '2010-02-26', '25', '10560238', '08:00', '12:00', '02:00', '05:26', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (260, '2010-02-23', '12', '14663175', NULL, '12:58', NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (311, '2010-02-26', '18', '14663332', '07:44', '12:27', '02:00', '05:29', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (253, '2010-02-23', '32', '10560322', '08:22', NULL, '01:07', NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (261, '2010-02-23', '6', '12836536', NULL, NULL, '01:15', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (264, '2010-02-24', '37', '14434534', '07:50', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (265, '2010-02-24', '35', '12554677', '07:50', NULL, NULL, NULL, NULL, '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (268, '2010-02-24', '24', '6384084', '07:56', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (270, '2010-02-24', '33', '9389381', '08:00', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (276, '2010-02-24', '22', '8568447', '08:08', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (278, '2010-02-24', '32', '10560322', '08:14', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (280, '2010-02-24', '31', '4256124', '08:17', NULL, NULL, NULL, NULL, '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (282, '2010-02-24', '6', '12836536', '08:19', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (283, '2010-02-24', '38', '11062752', '08:27', NULL, NULL, NULL, NULL, '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (349, '2010-01-15', '18', '14663332', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (286, '2010-02-24', '29', '4383047', '08:00', '12:00', '01:56', '05:12', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (305, '2010-02-25', '32', '10560322', '08:24', '12:04', '01:59', '05:27', NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (306, '2010-02-25', '14', '16189838', NULL, NULL, '01:59', '05:28', NULL, '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (290, '2010-02-25', '18', '14663332', '07:43', '12:03', '01:58', '05:21', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (298, '2010-02-25', '2', '7237276', '08:11', '', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (275, '2010-02-24', '3', '15384338', '08:05', '12:00', '02:00', '05:25', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (277, '2010-02-24', '1', '15796044', '08:14', '12:00', '02:00', '06:22', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (269, '2010-02-24', '2', '7237276', '07:59', '12:00', '02:00', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (331, '2010-02-23', '3', '15384338', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (257, '2010-02-23', '1', '15796044', '08:28', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (285, '2010-02-24', '28', '4926074', '08:00', '12:00', '02:00', '05:08', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (281, '2010-02-24', '23', '1565892', '08:18', NULL, NULL, '05:17', NULL, '9');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (330, '2010-02-23', '2', '7237276', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (266, '2010-02-24', '12', '14663175', '07:53', NULL, NULL, '05:25', NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (284, '2010-02-24', '26', '9326804', '08:47', '', '', '', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (267, '2010-02-24', '15', '11714856', '07:55', NULL, NULL, '05:27', NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (262, '2010-02-24', '5', '16638750', '07:42', NULL, NULL, '05:30', NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (287, '2010-02-24', '11', '11715878', NULL, NULL, NULL, '05:38', NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (273, '2010-02-24', '10', '15791432', '08:04', NULL, NULL, '05:39', NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (272, '2010-02-24', '4', '17768572', '08:03', NULL, NULL, '06:22', NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (132, '2010-02-10', '2', '7237276', '07:57', '', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (293, '2010-02-25', '37', '14434534', '07:58', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (294, '2010-02-25', '31', '4256124', '08:02', NULL, NULL, NULL, NULL, '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (302, '2010-02-25', '22', '8568447', '08:20', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (308, '2010-02-26', '5', '16638750', '07:25', NULL, NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (43, '2010-02-04', '13', '9386915', '08:07', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (69, '2010-02-05', '13', '9386915', '08:08', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (97, '2010-02-08', '13', '9386915', '08:10', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (111, '2010-02-09', '13', '9386915', '08:03', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (152, '2010-02-11', '13', '9386915', '08:05', '12:57', NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (186, '2010-02-17', '13', '9386915', '08:08', '12:55', NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (207, '2010-02-18', '13', '9386915', NULL, '12:56', NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (218, '2010-02-19', '13', '9386915', '08:07', NULL, '01:00', NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (237, '2010-02-22', '13', '9386915', '08:07', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (274, '2010-02-24', '13', '9386915', '08:05', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (254, '2010-02-23', '19', '10562263', '08:25', '12:00', '02:00', '5:30', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (312, '2010-02-26', '12', '14663175', '07:44', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (297, '2010-02-25', '11', '11715878', '08:10', '12:36', NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (304, '2010-02-25', '38', '11062752', '08:24', '12:48', NULL, NULL, NULL, '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (300, '2010-02-25', '24', '6384084', '08:16', '12:02', '01:56', NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (316, '2010-02-26', '31', '4256124', '07:52', NULL, NULL, NULL, NULL, '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (313, '2010-02-26', '4', '17768572', '07:48', '12:09', NULL, '05:09', NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (38, '2010-02-04', '2', '7237276', '07:46', '12:59', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (295, '2010-02-25', '13', '9386915', '08:04', NULL, '01:59', NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (307, '2010-02-25', '35', '12554677', NULL, NULL, '02:09', NULL, NULL, '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (333, '2010-01-16', '2', '7237276', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (303, '2010-02-25', '33', '9389381', '08:23', NULL, NULL, '04:57', NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (288, '2010-02-25', '12', '14663175', '07:40', '11:55', '01:57', '04:59', NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (299, '2010-02-25', '6', '12836536', '08:11', '12:07', '01:53', '05:13', NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (318, '2010-02-26', '23', '1565892', '07:57', NULL, NULL, NULL, NULL, '9');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (319, '2010-02-26', '24', '6384084', '08:04', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (321, '2010-02-26', '35', '12554677', '08:08', NULL, NULL, NULL, NULL, '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (323, '2010-02-26', '10', '15791432', '08:25', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (324, '2010-02-26', '11', '11715878', '08:29', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (296, '2010-02-25', '10', '15791432', '08:09', NULL, NULL, '05:14', NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (301, '2010-02-25', '15', '11714856', '08:18', '11:59', '01:52', '05:15', NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (327, '2010-02-26', '38', '11062752', '09:11', NULL, NULL, NULL, NULL, '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (122, '2010-02-09', '3', '15384338', '08:05', '01:01', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (103, '2010-02-09', '2', '7237276', '07:54', '01:12', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (336, '2010-01-15', '4', '17768572', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (337, '2010-01-15', '5', '16638750', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (338, '2010-01-15', '6', '12836536', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (339, '2010-01-15', '7', '16979004', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (340, '2010-01-15', '8', '15270968', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (341, '2010-01-15', '9', '8132701', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (342, '2010-01-15', '10', '15791432', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (343, '2010-01-15', '11', '11715878', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (317, '2010-02-26', '6', '12836536', '07:56', '12:12', NULL, '05:34', NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (335, '2010-01-15', '3', '15384338', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (334, '2010-01-15', '2', '7237276', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (332, '2010-02-22', '3', '15384338', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (231, '2010-02-22', '2', '7237276', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (344, '2010-01-15', '12', '14663175', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (345, '2010-01-15', '14', '16189838', '08:00', '01:00', '', '', '', '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (346, '2010-01-15', '15', '11714856', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (347, '2010-01-15', '16', '16634218', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (348, '2010-01-15', '17', '8189876', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (351, '2010-01-15', '20', '13947741', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (352, '2010-01-15', '21', '18471179', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (353, '2010-01-15', '22', '8568447', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (354, '2010-01-15', '23', '1565892', '08:00', '01:00', '', '', '', '9');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (315, '2010-02-26', '15', '11714856', '07:49', '11:59', NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (328, '2010-02-25', '1', '15796044', '08:00', '12:00', '02:00', '05:00', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (291, '2010-02-25', '27', '13063445', '07:53', '12:01', '01:58', '05:21', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (310, '2010-02-26', '2', '7237276', '07:41', '12:00', '02:00', '05:00', 'Guanare', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (326, '2010-02-26', '44', '9387147', '09:10', '12:00', '2:00', '05:40', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (314, '2010-02-26', '1', '15796044', '07:48', '12:09', '02:01', '05:05', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (322, '2010-02-26', '33', '9389381', '08:12', NULL, NULL, '04:55', NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (289, '2010-02-25', '3', '15384338', '07:41', '', '02:16', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (325, '2010-02-26', '32', '10560322', '08:29', NULL, NULL, '05:23', NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (292, '2010-02-25', '25', '10560238', '07:54', '12:00', '2:00', '05:45', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (279, '2010-02-24', '27', '13063445', '08:15', '12:05', '01:56', '05:26', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (263, '2010-02-24', '18', '14663332', '07:45', '12:05', '01:56', '05:29', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (350, '2010-01-15', '19', '10562263', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (309, '2010-02-26', '26', '9326804', '07:27', '', '', '05:46', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (355, '2010-01-15', '24', '6384084', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (361, '2010-01-15', '30', '15596617', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (362, '2010-01-15', '31', '4256124', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (363, '2010-01-15', '32', '10560322', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (364, '2010-01-15', '33', '9389381', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (365, '2010-01-15', '34', '9987655', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (366, '2010-01-15', '35', '12554677', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (367, '2010-01-15', '36', '14340860', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (368, '2010-01-15', '37', '14434534', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (369, '2010-01-15', '38', '11062752', '08:00', '01:00', '', '', '', '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (374, '2010-01-15', '13', '9386915', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (379, '2010-01-18', '4', '17768572', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (380, '2010-01-18', '5', '16638750', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (381, '2010-01-18', '6', '12836536', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (382, '2010-01-18', '7', '16979004', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (383, '2010-01-18', '8', '15270968', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (384, '2010-01-18', '9', '8132701', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (385, '2010-01-18', '10', '15791432', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (386, '2010-01-18', '11', '11715878', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (387, '2010-01-18', '12', '14663175', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (388, '2010-01-18', '14', '16189838', '08:00', '01:00', '', '', '', '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (389, '2010-01-18', '15', '11714856', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (390, '2010-01-18', '16', '16634218', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (391, '2010-01-18', '17', '8189876', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (394, '2010-01-18', '20', '13947741', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (395, '2010-01-18', '21', '18471179', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (396, '2010-01-18', '22', '8568447', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (397, '2010-01-18', '23', '1565892', '08:00', '01:00', '', '', '', '9');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (398, '2010-01-18', '24', '6384084', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (404, '2010-01-18', '30', '15596617', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (405, '2010-01-18', '31', '4256124', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (406, '2010-01-18', '32', '10560322', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (407, '2010-01-18', '33', '9389381', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (408, '2010-01-18', '34', '9987655', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (409, '2010-01-18', '35', '12554677', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (410, '2010-01-18', '36', '14340860', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (411, '2010-01-18', '37', '14434534', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (412, '2010-01-18', '38', '11062752', '08:00', '01:00', '', '', '', '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (417, '2010-01-18', '13', '9386915', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (422, '2010-01-19', '4', '17768572', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (423, '2010-01-19', '5', '16638750', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (424, '2010-01-19', '6', '12836536', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (425, '2010-01-19', '7', '16979004', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (426, '2010-01-19', '8', '15270968', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (427, '2010-01-19', '9', '8132701', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (428, '2010-01-19', '10', '15791432', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (429, '2010-01-19', '11', '11715878', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (430, '2010-01-19', '12', '14663175', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (431, '2010-01-19', '14', '16189838', '08:00', '01:00', '', '', '', '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (432, '2010-01-19', '15', '11714856', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (433, '2010-01-19', '16', '16634218', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (434, '2010-01-19', '17', '8189876', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (437, '2010-01-19', '20', '13947741', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (438, '2010-01-19', '21', '18471179', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (439, '2010-01-19', '22', '8568447', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (440, '2010-01-19', '23', '1565892', '08:00', '01:00', '', '', '', '9');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (441, '2010-01-19', '24', '6384084', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (447, '2010-01-19', '30', '15596617', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (448, '2010-01-19', '31', '4256124', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (449, '2010-01-19', '32', '10560322', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (450, '2010-01-19', '33', '9389381', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (451, '2010-01-19', '34', '9987655', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (452, '2010-01-19', '35', '12554677', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (453, '2010-01-19', '36', '14340860', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (454, '2010-01-19', '37', '14434534', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (455, '2010-01-19', '38', '11062752', '08:00', '01:00', '', '', '', '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (460, '2010-01-19', '13', '9386915', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (465, '2010-01-20', '4', '17768572', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (466, '2010-01-20', '5', '16638750', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (467, '2010-01-20', '6', '12836536', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (468, '2010-01-20', '7', '16979004', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (469, '2010-01-20', '8', '15270968', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (461, '2010-01-19', '1', '15796044', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (420, '2010-01-19', '2', '7237276', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (378, '2010-01-18', '3', '15384338', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (418, '2010-01-18', '1', '15796044', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (377, '2010-01-18', '2', '7237276', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (375, '2010-01-15', '1', '15796044', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (444, '2010-01-19', '27', '13063445', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (463, '2010-01-20', '2', '7237276', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (421, '2010-01-19', '3', '15384338', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (459, '2010-01-19', '43', '13816541', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (435, '2010-01-19', '18', '14663332', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (445, '2010-01-19', '28', '4926074', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (443, '2010-01-19', '26', '9326804', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (462, '2010-01-19', '44', '9387147', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (458, '2010-01-19', '42', '9990433', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (413, '2010-01-18', '39', '10052857', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (399, '2010-01-18', '25', '10560238', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (393, '2010-01-18', '19', '10562263', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (401, '2010-01-18', '27', '13063445', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (416, '2010-01-18', '43', '13816541', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (392, '2010-01-18', '18', '14663332', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (403, '2010-01-18', '29', '4383047', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (402, '2010-01-18', '28', '4926074', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (419, '2010-01-18', '44', '9387147', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (415, '2010-01-18', '42', '9990433', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (370, '2010-01-15', '39', '10052857', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (356, '2010-01-15', '25', '10560238', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (371, '2010-01-15', '40', '12781174', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (373, '2010-01-15', '43', '13816541', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (360, '2010-01-15', '29', '4383047', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (359, '2010-01-15', '28', '4926074', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (357, '2010-01-15', '26', '9326804', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (372, '2010-01-15', '42', '9990433', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (456, '2010-01-19', '39', '10052857', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (442, '2010-01-19', '25', '10560238', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (457, '2010-01-19', '40', '12781174', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (470, '2010-01-20', '9', '8132701', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (471, '2010-01-20', '10', '15791432', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (472, '2010-01-20', '11', '11715878', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (473, '2010-01-20', '12', '14663175', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (474, '2010-01-20', '14', '16189838', '08:00', '01:00', '', '', '', '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (475, '2010-01-20', '15', '11714856', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (476, '2010-01-20', '16', '16634218', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (477, '2010-01-20', '17', '8189876', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (480, '2010-01-20', '20', '13947741', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (481, '2010-01-20', '21', '18471179', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (482, '2010-01-20', '22', '8568447', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (483, '2010-01-20', '23', '1565892', '08:00', '01:00', '', '', '', '9');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (484, '2010-01-20', '24', '6384084', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (490, '2010-01-20', '30', '15596617', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (491, '2010-01-20', '31', '4256124', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (492, '2010-01-20', '32', '10560322', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (493, '2010-01-20', '33', '9389381', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (494, '2010-01-20', '34', '9987655', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (495, '2010-01-20', '35', '12554677', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (496, '2010-01-20', '36', '14340860', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (497, '2010-01-20', '37', '14434534', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (498, '2010-01-20', '38', '11062752', '08:00', '01:00', '', '', '', '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (503, '2010-01-20', '13', '9386915', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (508, '2010-01-21', '4', '17768572', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (509, '2010-01-21', '5', '16638750', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (510, '2010-01-21', '6', '12836536', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (511, '2010-01-21', '7', '16979004', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (512, '2010-01-21', '8', '15270968', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (513, '2010-01-21', '9', '8132701', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (514, '2010-01-21', '10', '15791432', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (515, '2010-01-21', '11', '11715878', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (516, '2010-01-21', '12', '14663175', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (517, '2010-01-21', '14', '16189838', '08:00', '01:00', '', '', '', '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (518, '2010-01-21', '15', '11714856', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (519, '2010-01-21', '16', '16634218', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (520, '2010-01-21', '17', '8189876', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (523, '2010-01-21', '20', '13947741', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (524, '2010-01-21', '21', '18471179', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (525, '2010-01-21', '22', '8568447', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (526, '2010-01-21', '23', '1565892', '08:00', '01:00', '', '', '', '9');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (527, '2010-01-21', '24', '6384084', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (533, '2010-01-21', '30', '15596617', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (534, '2010-01-21', '31', '4256124', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (535, '2010-01-21', '32', '10560322', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (536, '2010-01-21', '33', '9389381', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (537, '2010-01-21', '34', '9987655', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (538, '2010-01-21', '35', '12554677', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (539, '2010-01-21', '36', '14340860', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (540, '2010-01-21', '37', '14434534', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (541, '2010-01-21', '38', '11062752', '08:00', '01:00', '', '', '', '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (546, '2010-01-21', '13', '9386915', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (551, '2010-01-22', '4', '17768572', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (552, '2010-01-22', '5', '16638750', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (553, '2010-01-22', '6', '12836536', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (554, '2010-01-22', '7', '16979004', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (555, '2010-01-22', '8', '15270968', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (556, '2010-01-22', '9', '8132701', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (557, '2010-01-22', '10', '15791432', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (558, '2010-01-22', '11', '11715878', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (559, '2010-01-22', '12', '14663175', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (560, '2010-01-22', '14', '16189838', '08:00', '01:00', '', '', '', '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (561, '2010-01-22', '15', '11714856', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (562, '2010-01-22', '16', '16634218', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (563, '2010-01-22', '17', '8189876', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (566, '2010-01-22', '20', '13947741', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (567, '2010-01-22', '21', '18471179', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (568, '2010-01-22', '22', '8568447', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (569, '2010-01-22', '23', '1565892', '08:00', '01:00', '', '', '', '9');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (570, '2010-01-22', '24', '6384084', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (576, '2010-01-22', '30', '15596617', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (577, '2010-01-22', '31', '4256124', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (578, '2010-01-22', '32', '10560322', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (579, '2010-01-22', '33', '9389381', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (580, '2010-01-22', '34', '9987655', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (581, '2010-01-22', '35', '12554677', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (582, '2010-01-22', '36', '14340860', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (583, '2010-01-22', '37', '14434534', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (584, '2010-01-22', '38', '11062752', '08:00', '01:00', '', '', '', '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (547, '2010-01-21', '1', '15796044', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (506, '2010-01-21', '2', '7237276', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (504, '2010-01-20', '1', '15796044', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (574, '2010-01-22', '28', '4926074', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (549, '2010-01-22', '2', '7237276', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (507, '2010-01-21', '3', '15384338', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (572, '2010-01-22', '26', '9326804', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (542, '2010-01-21', '39', '10052857', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (528, '2010-01-21', '25', '10560238', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (522, '2010-01-21', '19', '10562263', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (543, '2010-01-21', '40', '12781174', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (545, '2010-01-21', '43', '13816541', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (521, '2010-01-21', '18', '14663332', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (532, '2010-01-21', '29', '4383047', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (531, '2010-01-21', '28', '4926074', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (529, '2010-01-21', '26', '9326804', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (548, '2010-01-21', '44', '9387147', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (485, '2010-01-20', '25', '10560238', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (479, '2010-01-20', '19', '10562263', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (500, '2010-01-20', '40', '12781174', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (487, '2010-01-20', '27', '13063445', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (502, '2010-01-20', '43', '13816541', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (478, '2010-01-20', '18', '14663332', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (489, '2010-01-20', '29', '4383047', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (488, '2010-01-20', '28', '4926074', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (505, '2010-01-20', '44', '9387147', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (501, '2010-01-20', '42', '9990433', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (565, '2010-01-22', '19', '10562263', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (573, '2010-01-22', '27', '13063445', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (575, '2010-01-22', '29', '4383047', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (589, '2010-01-22', '13', '9386915', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (594, '2010-01-25', '4', '17768572', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (595, '2010-01-25', '5', '16638750', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (596, '2010-01-25', '6', '12836536', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (597, '2010-01-25', '7', '16979004', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (598, '2010-01-25', '8', '15270968', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (599, '2010-01-25', '9', '8132701', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (600, '2010-01-25', '10', '15791432', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (601, '2010-01-25', '11', '11715878', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (602, '2010-01-25', '12', '14663175', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (603, '2010-01-25', '14', '16189838', '08:00', '01:00', '', '', '', '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (604, '2010-01-25', '15', '11714856', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (605, '2010-01-25', '16', '16634218', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (606, '2010-01-25', '17', '8189876', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (609, '2010-01-25', '20', '13947741', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (610, '2010-01-25', '21', '18471179', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (611, '2010-01-25', '22', '8568447', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (612, '2010-01-25', '23', '1565892', '08:00', '01:00', '', '', '', '9');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (613, '2010-01-25', '24', '6384084', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (619, '2010-01-25', '30', '15596617', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (620, '2010-01-25', '31', '4256124', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (621, '2010-01-25', '32', '10560322', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (622, '2010-01-25', '33', '9389381', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (623, '2010-01-25', '34', '9987655', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (624, '2010-01-25', '35', '12554677', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (625, '2010-01-25', '36', '14340860', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (626, '2010-01-25', '37', '14434534', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (627, '2010-01-25', '38', '11062752', '08:00', '01:00', '', '', '', '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (632, '2010-01-25', '13', '9386915', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (637, '2010-01-25', '4', '17768572', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (638, '2010-01-25', '5', '16638750', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (639, '2010-01-25', '6', '12836536', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (640, '2010-01-25', '7', '16979004', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (641, '2010-01-25', '8', '15270968', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (642, '2010-01-25', '9', '8132701', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (643, '2010-01-25', '10', '15791432', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (644, '2010-01-25', '11', '11715878', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (645, '2010-01-25', '12', '14663175', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (646, '2010-01-25', '14', '16189838', '08:00', '01:00', '', '', '', '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (647, '2010-01-25', '15', '11714856', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (648, '2010-01-25', '16', '16634218', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (649, '2010-01-25', '17', '8189876', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (652, '2010-01-25', '20', '13947741', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (653, '2010-01-25', '21', '18471179', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (654, '2010-01-25', '22', '8568447', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (655, '2010-01-25', '23', '1565892', '08:00', '01:00', '', '', '', '9');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (656, '2010-01-25', '24', '6384084', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (662, '2010-01-25', '30', '15596617', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (663, '2010-01-25', '31', '4256124', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (664, '2010-01-25', '32', '10560322', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (665, '2010-01-25', '33', '9389381', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (666, '2010-01-25', '34', '9987655', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (667, '2010-01-25', '35', '12554677', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (668, '2010-01-25', '36', '14340860', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (669, '2010-01-25', '37', '14434534', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (670, '2010-01-25', '38', '11062752', '08:00', '01:00', '', '', '', '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (675, '2010-01-25', '13', '9386915', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (680, '2010-01-26', '4', '17768572', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (681, '2010-01-26', '5', '16638750', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (682, '2010-01-26', '6', '12836536', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (683, '2010-01-26', '7', '16979004', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (684, '2010-01-26', '8', '15270968', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (685, '2010-01-26', '9', '8132701', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (686, '2010-01-26', '10', '15791432', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (687, '2010-01-26', '11', '11715878', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (688, '2010-01-26', '12', '14663175', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (689, '2010-01-26', '14', '16189838', '08:00', '01:00', '', '', '', '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (690, '2010-01-26', '15', '11714856', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (691, '2010-01-26', '16', '16634218', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (692, '2010-01-26', '17', '8189876', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (695, '2010-01-26', '20', '13947741', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (696, '2010-01-26', '21', '18471179', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (697, '2010-01-26', '22', '8568447', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (698, '2010-01-26', '23', '1565892', '08:00', '01:00', '', '', '', '9');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (699, '2010-01-26', '24', '6384084', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (586, '2010-01-22', '40', '12781174', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (678, '2010-01-26', '2', '7237276', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (593, '2010-01-25', '3', '15384338', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (590, '2010-01-22', '1', '15796044', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (633, '2010-01-25', '1', '15796044', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (676, '2010-01-25', '1', '15796044', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (592, '2010-01-25', '2', '7237276', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (635, '2010-01-25', '2', '7237276', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (588, '2010-01-22', '43', '13816541', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (591, '2010-01-22', '44', '9387147', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (628, '2010-01-25', '39', '10052857', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (616, '2010-01-25', '27', '13063445', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (614, '2010-01-25', '25', '10560238', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (629, '2010-01-25', '40', '12781174', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (608, '2010-01-25', '19', '10562263', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (651, '2010-01-25', '19', '10562263', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (618, '2010-01-25', '29', '4383047', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (630, '2010-01-25', '42', '9990433', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (587, '2010-01-22', '42', '9990433', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (631, '2010-01-25', '43', '13816541', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (674, '2010-01-25', '43', '13816541', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (607, '2010-01-25', '18', '14663332', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (650, '2010-01-25', '18', '14663332', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (617, '2010-01-25', '28', '4926074', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (660, '2010-01-25', '28', '4926074', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (615, '2010-01-25', '26', '9326804', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (658, '2010-01-25', '26', '9326804', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (634, '2010-01-25', '44', '9387147', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (677, '2010-01-25', '44', '9387147', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (694, '2010-01-26', '19', '10562263', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (693, '2010-01-26', '18', '14663332', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (585, '2010-01-22', '39', '10052857', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (705, '2010-01-26', '30', '15596617', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (706, '2010-01-26', '31', '4256124', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (707, '2010-01-26', '32', '10560322', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (708, '2010-01-26', '33', '9389381', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (709, '2010-01-26', '34', '9987655', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (710, '2010-01-26', '35', '12554677', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (711, '2010-01-26', '36', '14340860', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (712, '2010-01-26', '37', '14434534', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (713, '2010-01-26', '38', '11062752', '08:00', '01:00', '', '', '', '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (718, '2010-01-26', '13', '9386915', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (723, '2010-01-27', '4', '17768572', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (724, '2010-01-27', '5', '16638750', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (725, '2010-01-27', '6', '12836536', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (726, '2010-01-27', '7', '16979004', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (727, '2010-01-27', '8', '15270968', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (728, '2010-01-27', '9', '8132701', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (729, '2010-01-27', '10', '15791432', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (730, '2010-01-27', '11', '11715878', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (731, '2010-01-27', '12', '14663175', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (732, '2010-01-27', '14', '16189838', '08:00', '01:00', '', '', '', '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (733, '2010-01-27', '15', '11714856', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (734, '2010-01-27', '16', '16634218', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (735, '2010-01-27', '17', '8189876', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (738, '2010-01-27', '20', '13947741', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (739, '2010-01-27', '21', '18471179', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (740, '2010-01-27', '22', '8568447', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (741, '2010-01-27', '23', '1565892', '08:00', '01:00', '', '', '', '9');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (742, '2010-01-27', '24', '6384084', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (748, '2010-01-27', '30', '15596617', '08:00', '01:00', '', '', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (749, '2010-01-27', '31', '4256124', '08:00', '01:00', '', '', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (750, '2010-01-27', '32', '10560322', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (751, '2010-01-27', '33', '9389381', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (752, '2010-01-27', '34', '9987655', '08:00', '01:00', '', '', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (753, '2010-01-27', '35', '12554677', '08:00', '01:00', '', '', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (754, '2010-01-27', '36', '14340860', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (755, '2010-01-27', '37', '14434534', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (756, '2010-01-27', '38', '11062752', '08:00', '01:00', '', '', '', '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (761, '2010-01-27', '13', '9386915', '08:00', '01:00', '', '', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (766, '2010-01-11', '4', '17768572', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (767, '2010-01-11', '5', '16638750', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (768, '2010-01-11', '6', '12836536', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (769, '2010-01-11', '7', '16979004', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (770, '2010-01-11', '8', '15270968', '08:00', '12:00', '02:00', '05:00', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (771, '2010-01-11', '9', '8132701', '08:00', '12:00', '02:00', '05:00', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (772, '2010-01-11', '10', '15791432', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (773, '2010-01-11', '11', '11715878', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (774, '2010-01-11', '12', '14663175', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (775, '2010-01-11', '14', '16189838', '08:00', '12:00', '02:00', '05:00', '', '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (776, '2010-01-11', '15', '11714856', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (777, '2010-01-11', '16', '16634218', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (778, '2010-01-11', '17', '8189876', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (781, '2010-01-11', '20', '13947741', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (782, '2010-01-11', '21', '18471179', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (783, '2010-01-11', '22', '8568447', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (784, '2010-01-11', '23', '1565892', '08:00', '12:00', '02:00', '05:00', '', '9');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (785, '2010-01-11', '24', '6384084', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (791, '2010-01-11', '30', '15596617', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (792, '2010-01-11', '31', '4256124', '08:00', '12:00', '02:00', '05:00', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (793, '2010-01-11', '32', '10560322', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (794, '2010-01-11', '33', '9389381', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (795, '2010-01-11', '34', '9987655', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (796, '2010-01-11', '35', '12554677', '08:00', '12:00', '02:00', '05:00', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (797, '2010-01-11', '36', '14340860', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (798, '2010-01-11', '37', '14434534', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (799, '2010-01-11', '38', '11062752', '08:00', '12:00', '02:00', '05:00', '', '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (804, '2010-01-11', '13', '9386915', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (719, '2010-01-26', '1', '15796044', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (807, '2010-01-12', '2', '7237276', '08:00', '12:00', '02:00', '05:00', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (765, '2010-01-11', '3', '15384338', '08:00', '12:00', '02:00', '05:00', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (805, '2010-01-11', '1', '15796044', '08:00', '12:00', '02:00', '05:00', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (764, '2010-01-11', '2', '7237276', '08:00', '12:00', '02:00', '05:00', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (745, '2010-01-27', '27', '13063445', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (762, '2010-01-27', '1', '15796044', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (721, '2010-01-27', '2', '7237276', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (760, '2010-01-27', '43', '13816541', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (736, '2010-01-27', '18', '14663332', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (746, '2010-01-27', '28', '4926074', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (744, '2010-01-27', '26', '9326804', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (763, '2010-01-27', '44', '9387147', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (759, '2010-01-27', '42', '9990433', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (700, '2010-01-26', '25', '10560238', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (715, '2010-01-26', '40', '12781174', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (702, '2010-01-26', '27', '13063445', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (717, '2010-01-26', '43', '13816541', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (704, '2010-01-26', '29', '4383047', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (703, '2010-01-26', '28', '4926074', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (701, '2010-01-26', '26', '9326804', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (716, '2010-01-26', '42', '9990433', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (800, '2010-01-11', '39', '10052857', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (786, '2010-01-11', '25', '10560238', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (780, '2010-01-11', '19', '10562263', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (801, '2010-01-11', '40', '12781174', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (788, '2010-01-11', '27', '13063445', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (803, '2010-01-11', '43', '13816541', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (779, '2010-01-11', '18', '14663332', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (790, '2010-01-11', '29', '4383047', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (789, '2010-01-11', '28', '4926074', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (787, '2010-01-11', '26', '9326804', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (806, '2010-01-11', '44', '9387147', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (802, '2010-01-11', '42', '9990433', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (757, '2010-01-27', '39', '10052857', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (737, '2010-01-27', '19', '10562263', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (758, '2010-01-27', '40', '12781174', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (809, '2010-01-12', '4', '17768572', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (810, '2010-01-12', '5', '16638750', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (811, '2010-01-12', '6', '12836536', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (812, '2010-01-12', '7', '16979004', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (813, '2010-01-12', '8', '15270968', '08:00', '12:00', '02:00', '05:00', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (814, '2010-01-12', '9', '8132701', '08:00', '12:00', '02:00', '05:00', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (815, '2010-01-12', '10', '15791432', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (816, '2010-01-12', '11', '11715878', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (817, '2010-01-12', '12', '14663175', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (818, '2010-01-12', '14', '16189838', '08:00', '12:00', '02:00', '05:00', '', '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (819, '2010-01-12', '15', '11714856', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (820, '2010-01-12', '16', '16634218', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (821, '2010-01-12', '17', '8189876', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (824, '2010-01-12', '20', '13947741', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (825, '2010-01-12', '21', '18471179', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (826, '2010-01-12', '22', '8568447', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (827, '2010-01-12', '23', '1565892', '08:00', '12:00', '02:00', '05:00', '', '9');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (828, '2010-01-12', '24', '6384084', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (834, '2010-01-12', '30', '15596617', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (835, '2010-01-12', '31', '4256124', '08:00', '12:00', '02:00', '05:00', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (836, '2010-01-12', '32', '10560322', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (837, '2010-01-12', '33', '9389381', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (838, '2010-01-12', '34', '9987655', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (839, '2010-01-12', '35', '12554677', '08:00', '12:00', '02:00', '05:00', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (840, '2010-01-12', '36', '14340860', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (841, '2010-01-12', '37', '14434534', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (842, '2010-01-12', '38', '11062752', '08:00', '12:00', '02:00', '05:00', '', '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (847, '2010-01-12', '13', '9386915', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (852, '2010-01-13', '4', '17768572', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (853, '2010-01-13', '5', '16638750', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (854, '2010-01-13', '6', '12836536', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (855, '2010-01-13', '7', '16979004', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (856, '2010-01-13', '8', '15270968', '08:00', '12:00', '02:00', '05:00', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (857, '2010-01-13', '9', '8132701', '08:00', '12:00', '02:00', '05:00', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (858, '2010-01-13', '10', '15791432', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (859, '2010-01-13', '11', '11715878', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (860, '2010-01-13', '12', '14663175', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (861, '2010-01-13', '14', '16189838', '08:00', '12:00', '02:00', '05:00', '', '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (862, '2010-01-13', '15', '11714856', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (863, '2010-01-13', '16', '16634218', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (864, '2010-01-13', '17', '8189876', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (867, '2010-01-13', '20', '13947741', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (868, '2010-01-13', '21', '18471179', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (869, '2010-01-13', '22', '8568447', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (870, '2010-01-13', '23', '1565892', '08:00', '12:00', '02:00', '05:00', '', '9');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (871, '2010-01-13', '24', '6384084', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (877, '2010-01-13', '30', '15596617', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (878, '2010-01-13', '31', '4256124', '08:00', '12:00', '02:00', '05:00', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (879, '2010-01-13', '32', '10560322', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (880, '2010-01-13', '33', '9389381', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (881, '2010-01-13', '34', '9987655', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (882, '2010-01-13', '35', '12554677', '08:00', '12:00', '02:00', '05:00', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (883, '2010-01-13', '36', '14340860', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (884, '2010-01-13', '37', '14434534', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (885, '2010-01-13', '38', '11062752', '08:00', '12:00', '02:00', '05:00', '', '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (890, '2010-01-13', '13', '9386915', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (895, '2010-01-14', '4', '17768572', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (896, '2010-01-14', '5', '16638750', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (897, '2010-01-14', '6', '12836536', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (898, '2010-01-14', '7', '16979004', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (899, '2010-01-14', '8', '15270968', '08:00', '12:00', '02:00', '05:00', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (900, '2010-01-14', '9', '8132701', '08:00', '12:00', '02:00', '05:00', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (901, '2010-01-14', '10', '15791432', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (902, '2010-01-14', '11', '11715878', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (903, '2010-01-14', '12', '14663175', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (904, '2010-01-14', '14', '16189838', '08:00', '12:00', '02:00', '05:00', '', '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (905, '2010-01-14', '15', '11714856', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (906, '2010-01-14', '16', '16634218', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (907, '2010-01-14', '17', '8189876', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (910, '2010-01-14', '20', '13947741', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (850, '2010-01-13', '2', '7237276', '08:00', '12:00', '02:00', '05:00', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (848, '2010-01-12', '1', '15796044', '08:00', '12:00', '02:00', '05:00', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (872, '2010-01-13', '25', '10560238', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (893, '2010-01-14', '2', '7237276', '08:00', '12:00', '02:00', '05:00', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (866, '2010-01-13', '19', '10562263', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (887, '2010-01-13', '40', '12781174', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (851, '2010-01-13', '3', '15384338', '08:00', '12:00', '02:00', '05:00', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (874, '2010-01-13', '27', '13063445', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (889, '2010-01-13', '43', '13816541', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (865, '2010-01-13', '18', '14663332', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (876, '2010-01-13', '29', '4383047', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (875, '2010-01-13', '28', '4926074', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (873, '2010-01-13', '26', '9326804', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (892, '2010-01-13', '44', '9387147', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (888, '2010-01-13', '42', '9990433', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (843, '2010-01-12', '39', '10052857', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (829, '2010-01-12', '25', '10560238', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (823, '2010-01-12', '19', '10562263', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (831, '2010-01-12', '27', '13063445', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (846, '2010-01-12', '43', '13816541', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (822, '2010-01-12', '18', '14663332', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (833, '2010-01-12', '29', '4383047', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (832, '2010-01-12', '28', '4926074', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (830, '2010-01-12', '26', '9326804', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (849, '2010-01-12', '44', '9387147', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (845, '2010-01-12', '42', '9990433', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (909, '2010-01-14', '19', '10562263', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (908, '2010-01-14', '18', '14663332', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (886, '2010-01-13', '39', '10052857', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (911, '2010-01-14', '21', '18471179', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (912, '2010-01-14', '22', '8568447', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (913, '2010-01-14', '23', '1565892', '08:00', '12:00', '02:00', '05:00', '', '9');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (914, '2010-01-14', '24', '6384084', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (920, '2010-01-14', '30', '15596617', '08:00', '12:00', '02:00', '05:00', '', '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (921, '2010-01-14', '31', '4256124', '08:00', '12:00', '02:00', '05:00', '', '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (922, '2010-01-14', '32', '10560322', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (923, '2010-01-14', '33', '9389381', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (924, '2010-01-14', '34', '9987655', '08:00', '12:00', '02:00', '05:00', '', '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (925, '2010-01-14', '35', '12554677', '08:00', '12:00', '02:00', '05:00', '', '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (926, '2010-01-14', '36', '14340860', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (927, '2010-01-14', '37', '14434534', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (928, '2010-01-14', '38', '11062752', '08:00', '12:00', '02:00', '05:00', '', '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (933, '2010-01-14', '13', '9386915', '08:00', '12:00', '02:00', '05:00', '', '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (956, '2010-03-01', '19', '10562263', '08:02', '12:00', '01:57', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (943, '2010-03-01', '2', '7237276', '07:59', '', '02:17', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (946, '2010-03-01', '21', '18471179', '08:02', NULL, NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (948, '2010-03-01', '11', '11715878', '08:09', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (949, '2010-03-01', '38', '11062752', '08:13', NULL, NULL, NULL, NULL, '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (950, '2010-03-01', '32', '10560322', '08:20', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (951, '2010-03-01', '31', '4256124', '08:22', NULL, NULL, NULL, NULL, '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (747, '2010-01-27', '29', '4383047', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (714, '2010-01-26', '39', '10052857', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (720, '2010-01-26', '44', '9387147', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (571, '2010-01-22', '25', '10560238', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (657, '2010-01-25', '25', '10560238', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (661, '2010-01-25', '29', '4383047', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (672, '2010-01-25', '40', '12781174', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (544, '2010-01-21', '42', '9990433', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (499, '2010-01-20', '39', '10052857', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (329, '2010-02-26', '3', '15384338', '08:00', '12:00', '02:00', '05:00', 'Guanare', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (722, '2010-01-27', '3', '15384338', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (679, '2010-01-26', '3', '15384338', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (918, '2010-01-14', '28', '4926074', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (968, '2010-03-26', '1', '15796044', '09:11', NULL, NULL, NULL, NULL, '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (941, '2010-03-01', '6', '12836536', '07:59', '12:16', '01:54', '05:30', NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (954, '2010-03-01', '15', '11714856', NULL, '11:59', '01:56', '05:31', NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (958, '2010-03-02', '3', '15384338', '07:33', NULL, NULL, NULL, NULL, '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (940, '2010-03-01', '42', '9990433', '07:56', '12:00', '02:01', '', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (936, '2010-02-26', '27', '13063445', '08:05', '12:04', '02:00', '05:26', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (636, '2010-01-25', '3', '15384338', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (550, '2010-01-22', '3', '15384338', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (464, '2010-01-20', '3', '15384338', '08:00', '01:00', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (894, '2010-01-14', '3', '15384338', '08:00', '12:00', '02:00', '05:00', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (934, '2010-01-14', '1', '15796044', '08:00', '12:00', '02:00', '05:00', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (271, '2010-02-24', '25', '10560238', '08:01', '12:05', '01:59', '05:15', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (953, '2010-03-01', '4', '17768572', NULL, '12:11', NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (891, '2010-01-13', '1', '15796044', '08:00', '12:00', '02:00', '05:00', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (255, '2010-02-23', '18', '14663332', '08:25', '12:58', '02:00', '5:30', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (955, '2010-03-01', '14', '16189838', NULL, NULL, '01:27', NULL, NULL, '23');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (962, '2010-03-02', '38', '11062752', '08:44', NULL, NULL, NULL, NULL, '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (963, '2010-03-02', '22', '8568447', '08:45', NULL, NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (947, '2010-03-01', '13', '9386915', '08:07', NULL, '02:01', NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (168, '2010-02-12', '19', '10562263', '08:20', '1:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (808, '2010-01-12', '3', '15384338', '08:00', '12:00', '02:00', '05:00', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (942, '2010-03-01', '24', '6384084', '07:59', NULL, '02:13', NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (944, '2010-03-01', '10', '15791432', '08:02', '12:04', '02:15', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (157, '2010-02-11', '25', '10560238', '08:17', '12:55', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (937, '2010-03-01', '3', '15384338', '07:47', '12:05', '02:13', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (659, '2010-01-25', '27', '13063445', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (673, '2010-01-25', '42', '9990433', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (414, '2010-01-18', '40', '12781174', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (139, '2010-02-10', '25', '10560238', '08:10', '1:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (147, '2010-02-10', '26', '9326804', '11:07', '1:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (32, '2010-02-03', '19', '10562263', '08:21', '1:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (671, '2010-01-25', '39', '10052857', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (486, '2010-01-20', '26', '9326804', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (400, '2010-01-18', '26', '9326804', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (915, '2010-01-14', '25', '10560238', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (930, '2010-01-14', '40', '12781174', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (917, '2010-01-14', '27', '13063445', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (932, '2010-01-14', '43', '13816541', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (916, '2010-01-14', '26', '9326804', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (935, '2010-01-14', '44', '9387147', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (931, '2010-01-14', '42', '9990433', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (844, '2010-01-12', '40', '12781174', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (957, '2010-03-01', '12', '14663175', NULL, NULL, '02:12', '04:53', NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (938, '2010-03-01', '27', '13063445', '07:50', '11:59', '01:56', '05:18', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (939, '2010-03-01', '18', '14663332', '07:51', '12:55', '', '', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (952, '2010-03-01', '1', '15796044', '09:30', '12:11', '02:12', '05:21', 'En la Notaria, tramitando documentos personales', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (743, '2010-01-27', '25', '10560238', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (436, '2010-01-19', '19', '10562263', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (564, '2010-01-22', '18', '14663332', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (530, '2010-01-21', '27', '13063445', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (446, '2010-01-19', '29', '4383047', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (358, '2010-01-15', '27', '13063445', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (376, '2010-01-15', '44', '9387147', '08:00', '01:00', '', '', 'H CORRIDO', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (929, '2010-01-14', '39', '10052857', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (919, '2010-01-14', '29', '4383047', '08:00', '12:00', '02:00', '05:00', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (959, '2010-03-02', '1', '15796044', '07:51', NULL, NULL, NULL, NULL, '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (960, '2010-03-02', '2', '7237276', '07:51', NULL, NULL, NULL, NULL, '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (964, '2010-03-09', '38', '11062752', '08:45', NULL, NULL, NULL, NULL, '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (965, '2010-03-10', '8', '15270968', '08:06', NULL, NULL, NULL, NULL, '15');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (966, '2010-03-11', '38', '11062752', '09:16', NULL, NULL, NULL, NULL, '');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (967, '2010-03-11', '25', '10560238', '08:00', '12:24', '', '', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (961, '2010-03-02', '25', '10560238', '08:03', '', '', '', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (945, '2010-03-01', '25', '10560238', '08:02', '12:00', '02:05', '05:23', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (259, '2010-02-23', '26', '9326804', '11:02', '12:58', '02:00', '5:30', '', '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (969, '2010-04-29', '45', '14434236', '09:30', NULL, NULL, NULL, NULL, '20');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (970, '2010-05-06', '12', '14663175', NULL, '12:30', NULL, NULL, NULL, '24');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (971, '2010-06-18', '25', '10560238', '09:04', NULL, NULL, NULL, NULL, '5');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (972, '2010-09-09', '6', '12836536', NULL, '12:02', NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (975, '2010-11-26', '1', '15796044', '08:08', NULL, NULL, NULL, NULL, '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (974, '2010-11-25', '17', '8189876', NULL, '12:13', '01:04', NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (973, '2010-11-25', '1', '15796044', NULL, '12:03', NULL, '04:04', NULL, '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (976, '2010-11-26', '16', '16634218', '08:08', NULL, NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (977, '2010-11-29', '1', '15796044', NULL, NULL, '01:27', NULL, NULL, '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (978, '2010-11-29', '3', '15384338', '8:00', '', '', '', '', '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (979, '2010-11-30', '1', '15796044', NULL, NULL, '01:20', '04:06', NULL, '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (981, '2010-12-01', '1', '15796044', '08:14', '11:52', NULL, NULL, NULL, '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (980, '2010-12-01', '16', '16634218', '07:37', '12:28', NULL, NULL, NULL, '3');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (982, '2011-01-13', '2', '7237276', '08:14', NULL, NULL, NULL, NULL, '7');


--
-- TOC entry 1764 (class 0 OID 24595)
-- Dependencies: 1485
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('COORDINACION ACADEMICA', 4, 'ABG. ARNULFO QUINTERO');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('COORDINACION DE PROYECTO Y PASANTIA', 6, 'LIC. ENRIQUE AGUILERA');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('COORDINACION DE INFORMATICA', 7, 'ING. NOEL PERALTA');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('COORDINACION DE SEDE', 8, 'ING. FRANCISCO LOPEZ');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('PFG COMUNICACION SOCIAL', 9, 'LIC. MANUEL MARQUEZ');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('PFG ESTUDIOS JURIDICOS', 10, 'ABG. ARNULFO QUINTERO');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('PFG GESTION AMBIENTAL', 11, 'ING. IRAIDA IZARRA');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('REPRODUCCION', 12, 'EDWARD SANCHEZ');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('TALENTO HUMANO', 14, 'LUIS FLORES');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('MISION SUCRE', 16, 'CARLOS RAMIREZ');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('COORDINACION DE CULTURA', 17, 'ALFREDO RAMOS');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('PFG AGROECOLOGIA', 18, 'ING. VICTOR PERALTA');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('DEPARTAMENTO DE SEGURIDAD', 20, 'JUAN HERNÁNDEZ');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('PROGRAMA NAC. DE FORM. DE EDUC.', 21, 'YOLANDA ESCORCHA');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('COORDINACION DE ADMINISTRACION', 22, 'LCDA. NAILI SIMANCAS');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('COORD. DE TRANSPORTE', 23, 'ALFONSO VITRIAGO');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('COORDINACION DE DESARROLLO ESTUDIANTIL', 5, 'LIC. ABBY OLAECHEA');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('UBV PORTUGUESA ', 13, 'VILMA QUINTERO');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('COMUNICACION Y PROYECCION UNIVERSITARIA ', 19, 'LOLYSABEL YANEZ');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('PFG GESTION SOCIAL DEL DESARROLLO LOCAL ', 15, 'ROSA MATUTE');
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('SERVICIOS GENERALES ', 24, NULL);
INSERT INTO departamento (nombre_departamento, id_departamento, responsable) VALUES ('CIPEE', 3, 'ING. YOEL CASTILLO');


--
-- TOC entry 1763 (class 0 OID 24589)
-- Dependencies: 1483
-- Data for Name: horario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO horario (id_horario, entra1, sale1, entra2, sale2, entra3, sale3, entra4, sale4, m1, m2, m3, m4, m5, m6, m7, m8) VALUES (1, '06:00', '08:30', '11:50', '12:59', '01:00', '01:30', '03:50', '06:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 1762 (class 0 OID 24583)
-- Dependencies: 1481
-- Data for Name: personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (2, '7237276', 'NOEL FRANCISCO PERALTA BARRETO', 'COORDINADOR DE INFORMATICA', 'ADMINISTRATIVO', '7', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (3, '15384338', 'WALTER EDUARDO MORA BRITO', 'TECNICO DE RECURSOS INFORMATICOS', 'ADMINISTRATIVO', '7', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (4, '17768572', 'MARIA GABRIELA VIVAS QUINTERO', 'SECRETARIA', 'ADMINISTRATIVO', '22', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (5, '16638750', 'ELIZABETH VELASQUEZ', 'SUPERVISOR DE REGISTRO Y CONTROL DE BIENES NACIONALES', 'ADMINISTRATIVO', '22', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (6, '12836536', 'FRANCISCO JAVIER GONZALEZ SOLER', 'ANALISTA DE ORGANIZACION', 'ADMINISTRATIVO', '3', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (7, '16979004', 'LIRIS ALEJANDRA GONZALEZ TORREALBA', 'ANALISTA DE INFORMACION Y CONTROL ESTUDIANTIL', 'ADMINISTRATIVO', '3', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (8, '15270968', 'Jose Jimenez', 'Docente a Didicacion Exclusiva', 'DOCENTE', '15', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (9, '8132701', 'FELIX ALFONSO VITRIAGO GONZALEZ', 'ASISTENTE ADMINISTRATIVO', 'ADMINISTRATIVO', '14', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (10, '15791432', 'EDWARD JOSE SANCHEZ QUILARQUE', 'OPERADOR DE EQUIPOS DE REPRODUCCION', 'OBRERO', '3', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (11, '11715878', 'NICAMAR LAINET ABREU DELGADO', 'ANALISTA DE INFORMACION Y CONTROL ESTUDIANTIL', 'ADMINISTRATIVO', '3', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (12, '14663175', 'PABLO JOSE DAVILA OLIVERROS', 'ASEADOR', 'OBRERO', '24', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (14, '16189838', 'DANIEL TABORDA', 'CHOFER', 'ADMINISTRATIVO', '23', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (15, '11714856', 'luis rondon', 'ANALISTA DE INFORMACION Y CONTROL ESTUDIANTIL', 'ADMINISTRATIVO', '3', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (16, '16634218', 'Linoska Rodriguez', 'Asistente', 'ADMINISTRATIVO', '3', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (17, '8189876', 'BLANCA PEREZ', 'TECNICO RECURSOS INFORMATICOS', 'ADMINISTRATIVO', '3', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (18, '14663332', 'ELYMAR BANQUEZ', 'BIBLITECARIA', 'COMISION DE SERVICIO', '5', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (19, '10562263', 'MELVIS ARREVILLA', 'BIBLIOTECARIA', 'COMISION DE SERVICIO', '5', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (20, '13947741', 'YENNI CASTILLO', 'ASISTENTE ADMINISTRATIVO', 'ADMINISTRATIVO', '22', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (21, '18471179', 'JENRRY ALBERTO JUNIOR CACERES VALERA ', 'OFICINISTA ', 'ADMINISTRATIVO', '22', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (22, '8568447', 'JOSE RAFAEL ALVAREZ', 'SUPERVISOR DE MANTENIMIENTO', 'ADMINISTRATIVO', '24', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (23, '1565892', 'OGLA BRAVO', 'iNSTRUCTOR', 'DOCENTE', '9', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (24, '6384084', 'FRANCISCO JIMENEZ', 'MENSAJERO EXTERNO', 'ADMINISTRATIVO', '24', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (25, '10560238', 'DILIA DEL CARMEN MONSALVE BASTIDAS', 'AUDITOR', 'ADMINISTRATIVO', '5', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (26, '9326804', 'DUILIO ANTONIO LOZADA LOBO', 'CHOFER', 'OBRERO', '5', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (27, '13063445', 'ANA MAR COLMENARES', 'TRABAJADOR SOCIAL', 'ADMINISTRATIVO', '5', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (28, '4926074', 'ABBY RITA OLAECHEA SCEVEDO', 'COORDINADORA DESARROLLO ESTUDIANTIL', 'ADMINISTRATIVO', '5', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (29, '4383047', 'MARCOS GIOVAN SANCHEZ', 'CHOFER', 'OBRERO', '5', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (30, '15596617', 'MARVIS MARCANO', 'SECRETARIA', 'ADMINISTRATIVO', '3', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (31, '4256124', 'ARCADIA VELAZQUEZ', 'SECRETARIA', 'ADMINISTRATIVO', '15', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (32, '10560322', 'BENILDE BELANDRIA', 'PORTERO', 'OBRERO', '24', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (33, '9389381', 'YUDITH DEL CARMEN CAMACHO', 'ASEADOR', 'OBRERO', '24', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (34, '9987655', 'NAILI CANDELARIA SIMANCAS OCHOA', 'ADMINISTRADORA', 'ADMINISTRATIVO', '22', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (35, '12554677', 'LUIS ALFONSO OSPINA RUIZ', 'ASISTENTE DE RECURSOS HUMANO', 'ADMINISTRATIVO', '14', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (36, '14340860', 'milesa yudith escalona', 'obrero', 'OBRERO', '24', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (37, '14434534', 'Maritza Arias', 'Aseadora', 'OBRERO', '24', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (38, '11062752', 'SOLEY VELAZCO', 'coordinadora de idiomas', 'DOCENTE', '', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (39, '10052857', 'ESTEBAN JOSE PEREZ AZUAJE', 'CHOFER', 'OBRERO', '5', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (40, '12781174', 'JHON ALFREDO VELASQUEZ ALBARRAN', 'CHOFER', 'OBRERO', '5', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (42, '9990433', 'LUIS AMADO BRICENO', 'CHOFER', 'OBRERO', '5', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (43, '13816541', 'DUGLAS CABIEDES', 'CHOFER', 'COMISION DE SERVICIO', '5', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (13, '9386915', 'JOSE LUIS PULIDO D', 'ELECTRICISTAS', 'ADMINISTRATIVO', '24', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (1, '15796044', 'LEONARDO JOSE MATOS', 'ANALISTA PROGRAMADOR DE SISTEMAS', 'ADMINISTRATIVO', '7', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (44, '9387147', 'ANA MERCEDES  MORALES', 'ASIST DESARROLLO EST', 'COMISION DE SERVICIO', '5', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (45, '14434236', 'mayela', 'seguridad', 'ADMINISTRATIVO', '20', 'ACTIVO');


--
-- TOC entry 1765 (class 0 OID 24601)
-- Dependencies: 1487
-- Data for Name: transaccion; Type: TABLE DATA; Schema: public; Owner: leonardo
--

INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:34:23-04:30', '-Operacion: Registro de asistencia', '');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:34:47-04:30', '-Operacion: Registro de asistencia', '');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:35:02-04:30', '-Operacion: Registro de asistencia', '');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:35:04-04:30', '-Operacion: Registro de asistencia', '');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:35:11-04:30', '-Operacion: Registro de asistencia', '');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:35:24-04:30', '-Operacion: Registro de asistencia', '');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:35:26-04:30', '-Operacion: Registro de asistencia', '');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:35:33-04:30', '-Operacion: Registro de asistencia', '');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:36:59-04:30', '-Operacion: Registro de asistencia', '');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:37:05-04:30', '-Operacion: Registro de asistencia', '');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:37:27-04:30', '-Operacion: Registro de asistencia', '');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:37:35-04:30', '-Operacion: Registro de asistencia', '');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:38:09-04:30', '-Operacion: Registro de asistencia', '');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:38:20-04:30', '-Operacion: Registro de asistencia', '');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:39:43-04:30', '-Operacion: Registro de asistencia', '');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:41:03-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:41:17-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:44:37-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:44:53-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:45:22-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:46:02-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:46:29-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:46:50-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:48:45-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:49:34-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:54:44-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '09:58:09-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '10:02:10-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '10:05:06-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '10:09:51-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '10:10:32-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '10:17:00-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '10:57:52-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-28', '11:19:02-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-29', '07:50:15-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-29', '08:15:50-04:30', '-Operacion: Registro de asistencia 17768572', '17768572');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-29', '08:16:13-04:30', '-Operacion: Registro de asistencia 15384338', '15384338');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-29', '08:16:35-04:30', '-Operacion: Registro de asistencia 7237276', '7237276');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-29', '08:25:33-04:30', '-Operacion: Registro de asistencia 8132701', '8132701');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-29', '08:30:48-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-29', '10:43:17-04:30', '-Operacion: Registro de asistencia 15791432', '15791432');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-29', '11:13:36-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-29', '12:56:47-04:30', '-Operacion: Registro de asistencia 11715878', '11715878');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-01-29', '13:06:49-04:30', '-Operacion: Registro de asistencia 16979004', '16979004');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-01', '08:14:01-04:30', '-Operacion: Registro de asistencia 7237276', '7237276');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-02', '07:29:35-04:30', '-Operacion: Registro de asistencia 16638750', '16638750');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-02', '07:51:00-04:30', '-Operacion: Registro de asistencia 14663175', '14663175');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-02', '07:53:03-04:30', '-Operacion: Registro de asistencia 15384338', '15384338');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-02', '07:53:25-04:30', '-Operacion: Registro de asistencia 7237276', '7237276');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-02', '08:01:26-04:30', '-Operacion: Registro de asistencia 8132701', '8132701');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-02', '08:02:49-04:30', '-Operacion: Registro de asistencia 16979004', '16979004');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-02', '08:06:28-04:30', '-Operacion: Registro de asistencia 9386915', '9386915');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-02', '08:07:51-04:30', '-Operacion: Registro de asistencia 16189838', '16189838');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-02', '08:08:05-04:30', '-Operacion: Registro de asistencia 11715878', '11715878');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-03', '07:49:12-04:30', '-Operacion: Registro de asistencia 16638750', '16638750');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-03', '07:59:27-04:30', '-Operacion: Registro de asistencia 15384338', '15384338');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-03', '08:01:22-04:30', '-Operacion: Registro de asistencia 11715878', '11715878');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-03', '08:02:58-04:30', '-Operacion: Registro de asistencia 11714856', '11714856');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-03', '08:03:59-04:30', '-Operacion: Registro de asistencia 12836536', '12836536');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-03', '08:04:07-04:30', '-Operacion: Registro de asistencia 16979004', '16979004');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-03', '08:06:19-04:30', '-Operacion: Registro de asistencia 7237276', '7237276');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-03', '08:06:42-04:30', '-Operacion: Registro de asistencia 9386915', '9386915');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-03', '08:07:49-04:30', '-Operacion: Registro de asistencia 16634218', '16634218');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-03', '08:10:56-04:30', '-Operacion: Registro de asistencia 8189876', '8189876');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-03', '08:14:08-04:30', '-Operacion: Registro de asistencia 8132701', '8132701');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-03', '08:19:48-04:30', '-Operacion: Registro de asistencia 14663332', '14663332');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-03', '08:21:42-04:30', '-Operacion: Registro de asistencia 10562263', '10562263');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-03', '08:22:05-04:30', '-Operacion: Registro de asistencia 15791432', '15791432');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-03', '08:23:06-04:30', '-Operacion: Registro de asistencia 13947741', '13947741');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-03', '08:28:27-04:30', '-Operacion: Registro de asistencia 16189838', '16189838');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-03', '08:35:49-04:30', '-Operacion: Registro de asistencia 6384084', '6384084');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-03', '08:56:57-04:30', '-Operacion: Registro de asistencia 10560238', '10560238');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '07:46:41-04:30', '-Operacion: Registro de asistencia 7237276', '7237276');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '07:48:45-04:30', '-Operacion: Registro de asistencia 10562263', '10562263');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '07:54:16-04:30', '-Operacion: Registro de asistencia 16979004', '16979004');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '07:56:25-04:30', '-Operacion: Registro de asistencia 16634218', '16634218');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '07:58:17-04:30', '-Operacion: Registro de asistencia 14663332', '14663332');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '08:07:54-04:30', '-Operacion: Registro de asistencia 9386915', '9386915');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '08:08:41-04:30', '-Operacion: Registro de asistencia 15596617', '15596617');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '08:08:48-04:30', '-Operacion: Registro de asistencia 11715878', '11715878');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '08:08:56-04:30', '-Operacion: Registro de asistencia 11714856', '11714856');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '08:09:54-04:30', '-Operacion: Registro de asistencia 6384084', '6384084');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '08:12:37-04:30', '-Operacion: Registro de asistencia 15384338', '15384338');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '08:13:43-04:30', '-Operacion: Registro de asistencia 4256124', '4256124');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '08:15:03-04:30', '-Operacion: Registro de asistencia 10560322', '10560322');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '08:15:31-04:30', '-Operacion: Registro de asistencia 15791432', '15791432');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '08:22:44-04:30', '-Operacion: Registro de asistencia 8568447', '8568447');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '08:23:03-04:30', '-Operacion: Registro de asistencia 8132701', '8132701');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '08:23:13-04:30', '-Operacion: Registro de asistencia 12836536', '12836536');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '08:24:46-04:30', '-Operacion: Registro de asistencia 9389381', '9389381');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '09:04:00-04:30', '-Operacion: Registro de asistencia 9326804', '9326804');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '09:10:39-04:30', '-Operacion: Registro de asistencia 10560238', '10560238');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '12:59:05-04:30', '-Operacion: Registro de asistencia 13063445', '13063445');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '12:59:17-04:30', '-Operacion: Registro de asistencia 4926074', '4926074');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-04', '12:59:33-04:30', '-Operacion: Registro de asistencia 4383047', '4383047');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-05', '08:02:09-04:30', '-Operacion: Registro de asistencia 15791432', '15791432');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-05', '08:02:21-04:30', '-Operacion: Registro de asistencia 12836536', '12836536');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-05', '08:05:18-04:30', '-Operacion: Registro de asistencia 6384084', '6384084');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-05', '08:05:31-04:30', '-Operacion: Registro de asistencia 11714856', '11714856');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-05', '08:06:08-04:30', '-Operacion: Registro de asistencia 8189876', '8189876');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-05', '08:07:51-04:30', '-Operacion: Registro de asistencia 16979004', '16979004');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-05', '08:08:03-04:30', '-Operacion: Registro de asistencia 16634218', '16634218');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-05', '08:08:19-04:30', '-Operacion: Registro de asistencia 11715878', '11715878');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-05', '08:08:29-04:30', '-Operacion: Registro de asistencia 9386915', '9386915');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-05', '08:11:14-04:30', '-Operacion: Registro de asistencia 8568447', '8568447');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-05', '08:16:22-04:30', '-Operacion: Registro de asistencia 8132701', '8132701');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-05', '08:23:20-04:30', '-Operacion: Registro de asistencia 10560322', '10560322');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-05', '08:33:16-04:30', '-Operacion: Registro de asistencia 4256124', '4256124');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-05', '08:53:10-04:30', '-Operacion: Registro de asistencia 16189838', '16189838');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-05', '11:13:56-04:30', '-Operacion: Registro de asistencia 9326804', '9326804');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-05', '12:58:25-04:30', '-Operacion: Registro de asistencia 9389381', '9389381');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-05', '13:07:33-04:30', '-Operacion: Registro de asistencia 7237276', '7237276');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '07:48:15-04:30', '-Operacion: Registro de asistencia 7237276', '7237276');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '07:51:35-04:30', '-Operacion: Registro de asistencia 10562263', '10562263');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '07:51:57-04:30', '-Operacion: Registro de asistencia 9987655', '9987655');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '07:52:39-04:30', '-Operacion: Registro de asistencia 14663332', '14663332');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '07:53:17-04:30', '-Operacion: Registro de asistencia 15384338', '15384338');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '07:53:26-04:30', '-Operacion: Registro de asistencia 16979004', '16979004');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '07:53:42-04:30', '-Operacion: Registro de asistencia 15596617', '15596617');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '07:55:08-04:30', '-Operacion: Registro de asistencia 8189876', '8189876');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '07:55:22-04:30', '-Operacion: Registro de asistencia 9389381', '9389381');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '07:56:54-04:30', '-Operacion: Registro de asistencia 12554677', '12554677');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '07:59:14-04:30', '-Operacion: Registro de asistencia 16634218', '16634218');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '08:00:28-04:30', '-Operacion: Registro de asistencia 14663175', '14663175');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '08:02:40-04:30', '-Operacion: Registro de asistencia 12836536', '12836536');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '08:04:32-04:30', '-Operacion: Registro de asistencia 13947741', '13947741');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '08:04:50-04:30', '-Operacion: Registro de asistencia 10560238', '10560238');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '08:06:14-04:30', '-Operacion: Registro de asistencia 6384084', '6384084');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '08:06:39-04:30', '-Operacion: Registro de asistencia 15270968', '15270968');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '08:06:57-04:30', '-Operacion: Registro de asistencia 8568447', '8568447');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '08:09:41-04:30', '-Operacion: Registro de asistencia 4256124', '4256124');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '08:10:39-04:30', '-Operacion: Registro de asistencia 9386915', '9386915');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '08:12:53-04:30', '-Operacion: Registro de asistencia 11715878', '11715878');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '08:21:20-04:30', '-Operacion: Registro de asistencia 15791432', '15791432');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '08:21:29-04:30', '-Operacion: Registro de asistencia 9326804', '9326804');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '08:21:58-04:30', '-Operacion: Registro de asistencia 10560322', '10560322');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-08', '13:04:25-04:30', '-Operacion: Registro de asistencia 8132701', '8132701');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '07:54:53-04:30', '-Operacion: Registro de asistencia 7237276', '7237276');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '08:00:25-04:30', '-Operacion: Registro de asistencia 16634218', '16634218');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '08:01:02-04:30', '-Operacion: Registro de asistencia 14663332', '14663332');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '08:01:20-04:30', '-Operacion: Registro de asistencia 10562263', '10562263');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '08:01:52-04:30', '-Operacion: Registro de asistencia 14663175', '14663175');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '08:02:02-04:30', '-Operacion: Registro de asistencia 12836536', '12836536');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '08:03:33-04:30', '-Operacion: Registro de asistencia 10560238', '10560238');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '08:03:48-04:30', '-Operacion: Registro de asistencia 8189876', '8189876');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '08:03:58-04:30', '-Operacion: Registro de asistencia 9386915', '9386915');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '08:06:56-04:30', '-Operacion: Registro de asistencia 13063445', '13063445');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '08:07:55-04:30', '-Operacion: Registro de asistencia 6384084', '6384084');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '08:09:37-04:30', '-Operacion: Registro de asistencia 9389381', '9389381');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '08:12:55-04:30', '-Operacion: Registro de asistencia 16979004', '16979004');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '08:17:17-04:30', '-Operacion: Registro de asistencia 4256124', '4256124');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '08:17:49-04:30', '-Operacion: Registro de asistencia 11715878', '11715878');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '08:18:02-04:30', '-Operacion: Registro de asistencia 8132701', '8132701');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '08:18:23-04:30', '-Operacion: Registro de asistencia 10560322', '10560322');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '10:03:01-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '10:04:07-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:31-01-2009 tipo de reporte: 01 Fondo: 0exportar: 0', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '10:20:28-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '10:22:59-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '10:24:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: nperalta', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '10:24:31-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '10:26:14-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '11:23:22-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '11:25:29-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '12:58:50-04:30', '-Operacion: Registro de asistencia 14340860', '14340860');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '13:01:34-04:30', '-Operacion: Registro de asistencia 15384338', '15384338');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-09', '13:09:01-04:30', '-Operacion: Registro de asistencia 16638750', '16638750');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '07:43:23-04:30', '-Operacion: Registro de asistencia 16979004', '16979004');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '07:43:41-04:30', '-Operacion: Registro de asistencia 8189876', '8189876');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '07:47:39-04:30', '-Operacion: Registro de asistencia 16638750', '16638750');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '07:47:58-04:30', '-Operacion: Registro de asistencia 9987655', '9987655');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '07:48:11-04:30', '-Operacion: Registro de asistencia 18471179', '18471179');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '07:54:31-04:30', '-Operacion: Registro de asistencia 10562263', '10562263');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '07:54:46-04:30', '-Operacion: Registro de asistencia 14663175', '14663175');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '07:57:06-04:30', '-Operacion: Registro de asistencia 9389381', '9389381');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '07:57:20-04:30', '-Operacion: Registro de asistencia 7237276', '7237276');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '08:01:54-04:30', '-Operacion: Registro de asistencia 14663332', '14663332');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '08:02:57-04:30', '-Operacion: Registro de asistencia 13063445', '13063445');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '08:03:48-04:30', '-Operacion: Registro de asistencia 16634218', '16634218');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '08:04:36-04:30', '-Operacion: Registro de asistencia 12836536', '12836536');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '08:07:10-04:30', '-Operacion: Registro de asistencia 15791432', '15791432');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '08:08:07-04:30', '-Operacion: Registro de asistencia 9386915', '9386915');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '08:10:23-04:30', '-Operacion: Registro de asistencia 10560238', '10560238');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '08:14:47-04:30', '-Operacion: Registro de asistencia 15384338', '15384338');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '08:17:23-04:30', '-Operacion: Registro de asistencia 8132701', '8132701');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '08:17:59-04:30', '-Operacion: Registro de asistencia 6384084', '6384084');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '08:18:40-04:30', '-Operacion: Registro de asistencia 10560322', '10560322');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '08:24:08-04:30', '-Operacion: Registro de asistencia 14434534', '14434534');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '08:38:08-04:30', '-Operacion: Registro de asistencia 16189838', '16189838');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '08:13:44-04:30', '-Operacion: Registro de asistencia 11715878', '11715878');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-10', '11:07:37-04:30', '-Operacion: Registro de asistencia 9326804', '9326804');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-11', '07:50:28-04:30', '-Operacion: Registro de asistencia 13063445', '13063445');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-11', '08:04:21-04:30', '-Operacion: Registro de asistencia 6384084', '6384084');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-11', '08:05:04-04:30', '-Operacion: Registro de asistencia 16979004', '16979004');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-11', '08:05:17-04:30', '-Operacion: Registro de asistencia 8568447', '8568447');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-11', '08:05:38-04:30', '-Operacion: Registro de asistencia 9386915', '9386915');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-11', '08:07:18-04:30', '-Operacion: Registro de asistencia 15384338', '15384338');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-11', '08:07:39-04:30', '-Operacion: Registro de asistencia 10562263', '10562263');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-11', '08:07:56-04:30', '-Operacion: Registro de asistencia 14663332', '14663332');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-11', '08:08:09-04:30', '-Operacion: Registro de asistencia 14663175', '14663175');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-11', '08:17:07-04:30', '-Operacion: Registro de asistencia 10560238', '10560238');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-11', '08:18:32-04:30', '-Operacion: Registro de asistencia 7237276', '7237276');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-11', '08:24:07-04:30', '-Operacion: Registro de asistencia 4256124', '4256124');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-11', '08:26:23-04:30', '-Operacion: Registro de asistencia 9326804', '9326804');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-11', '12:56:18-04:30', '-Operacion: Registro de asistencia 12836536', '12836536');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-11', '12:57:07-04:30', '-Operacion: Registro de asistencia 10560322', '10560322');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-12', '08:09:13-04:30', '-Operacion: Registro de asistencia 16979004', '16979004');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-12', '08:12:22-04:30', '-Operacion: Registro de asistencia 10560238', '10560238');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-12', '08:16:05-04:30', '-Operacion: Registro de asistencia 8568447', '8568447');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-12', '08:17:26-04:30', '-Operacion: Registro de asistencia 14663175', '14663175');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-12', '08:20:24-04:30', '-Operacion: Registro de asistencia 14663332', '14663332');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-12', '08:20:49-04:30', '-Operacion: Registro de asistencia 10562263', '10562263');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-12', '10:19:44-04:30', '-Operacion: Registro de asistencia 13063445', '13063445');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '07:18:22-04:30', '-Operacion: Registro de asistencia 10560238', '10560238');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '07:18:39-04:30', '-Operacion: Registro de asistencia 4926074', '4926074');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '07:44:41-04:30', '-Operacion: Registro de asistencia 16638750', '16638750');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '07:48:23-04:30', '-Operacion: Registro de asistencia 9389381', '9389381');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '07:51:10-04:30', '-Operacion: Registro de asistencia 11062752', '11062752');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '07:55:46-04:30', '-Operacion: Registro de asistencia 14663175', '14663175');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '07:58:49-04:30', '-Operacion: Registro de asistencia 12836536', '12836536');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '07:59:07-04:30', '-Operacion: Registro de asistencia 6384084', '6384084');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '08:00:43-04:30', '-Operacion: Registro de asistencia 14663332', '14663332');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '08:00:58-04:30', '-Operacion: Registro de asistencia 10562263', '10562263');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '08:01:07-04:30', '-Operacion: Registro de asistencia 16979004', '16979004');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '08:02:13-04:30', '-Operacion: Registro de asistencia 4256124', '4256124');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '08:04:13-04:30', '-Operacion: Registro de asistencia 16634218', '16634218');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '08:05:54-04:30', '-Operacion: Registro de asistencia 11715878', '11715878');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '08:06:36-04:30', '-Operacion: Registro de asistencia 7237276', '7237276');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '08:08:17-04:30', '-Operacion: Registro de asistencia 15384338', '15384338');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '08:08:57-04:30', '-Operacion: Registro de asistencia 9386915', '9386915');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '08:12:38-04:30', '-Operacion: Registro de asistencia 16189838', '16189838');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '12:59:00-04:30', '-Operacion: Registro de asistencia 17768572', '17768572');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '13:02:42-04:30', '-Operacion: Registro de asistencia 14340860', '14340860');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-17', '13:03:55-04:30', '-Operacion: Registro de asistencia 9326804', '9326804');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '07:45:36-04:30', '-Operacion: Registro de asistencia 7237276', '7237276');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '07:46:15-04:30', '-Operacion: Registro de asistencia 14434534', '14434534');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '07:46:48-04:30', '-Operacion: Registro de asistencia 14663332', '14663332');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '07:47:23-04:30', '-Operacion: Registro de asistencia 16638750', '16638750');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '07:47:59-04:30', '-Operacion: Registro de asistencia 10562263', '10562263');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '07:54:14-04:30', '-Operacion: Registro de asistencia 12836536', '12836536');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '07:54:25-04:30', '-Operacion: Registro de asistencia 12554677', '12554677');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '07:55:39-04:30', '-Operacion: Registro de asistencia 14663175', '14663175');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '07:56:55-04:30', '-Operacion: Registro de asistencia 18471179', '18471179');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '08:00:10-04:30', '-Operacion: Registro de asistencia 6384084', '6384084');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '08:01:14-04:30', '-Operacion: Registro de asistencia 10560238', '10560238');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '08:28:04-04:30', '-Operacion: Registro de asistencia 15384338', '15384338');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '08:28:14-04:30', '-Operacion: Registro de asistencia 4256124', '4256124');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '08:30:13-04:30', '-Operacion: Registro de asistencia 11062752', '11062752');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '08:31:57-04:30', '-Operacion: Registro de asistencia 9389381', '9389381');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '10:52:10-04:30', '-Operacion: Registro de asistencia 9326804', '9326804');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '12:56:02-04:30', '-Operacion: Registro de asistencia 9386915', '9386915');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '12:57:30-04:30', '-Operacion: Registro de asistencia 13063445', '13063445');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '13:01:37-04:30', '-Operacion: Registro de asistencia 10560322', '10560322');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-18', '13:01:46-04:30', '-Operacion: Registro de asistencia 8132701', '8132701');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '08:01:03-04:30', '-Operacion: Registro de asistencia 15791432', '15791432');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '08:01:25-04:30', '-Operacion: Registro de asistencia 6384084', '6384084');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '08:02:12-04:30', '-Operacion: Registro de asistencia 14663175', '14663175');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '08:02:25-04:30', '-Operacion: Registro de asistencia 9389381', '9389381');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '08:03:22-04:30', '-Operacion: Registro de asistencia 12836536', '12836536');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '08:04:59-04:30', '-Operacion: Registro de asistencia 10562263', '10562263');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '08:05:14-04:30', '-Operacion: Registro de asistencia 14663332', '14663332');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '08:07:01-04:30', '-Operacion: Registro de asistencia 9386915', '9386915');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '08:08:18-04:30', '-Operacion: Registro de asistencia 10560322', '10560322');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '08:08:33-04:30', '-Operacion: Registro de asistencia 12554677', '12554677');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '08:19:30-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '08:19:37-04:30', '-Operacion: Registro de asistencia 17768572', '17768572');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '08:21:57-04:30', '-Operacion: Registro de asistencia 15384338', '15384338');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '08:24:39-04:30', '-Operacion: Registro de asistencia 4256124', '4256124');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '08:27:15-04:30', '-Operacion: Registro de asistencia 16189838', '16189838');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '08:31:03-04:30', '-Operacion: Registro de asistencia 11715878', '11715878');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '08:43:39-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '09:38:05-04:30', '-Operacion: Registro de asistencia 11062752', '11062752');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '10:52:34-04:30', '-Operacion: Registro de asistencia 9326804', '9326804');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '12:55:26-04:30', '-Operacion: Registro de asistencia 10560238', '10560238');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-19', '12:59:37-04:30', '-Operacion: Registro de asistencia 8132701', '8132701');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:00:10-04:30', '-Operacion: Registro de asistencia 7237276', '7237276');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:00:19-04:30', '-Operacion: Registro de asistencia 16638750', '16638750');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:01:46-04:30', '-Operacion: Registro de asistencia 10562263', '10562263');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:02:00-04:30', '-Operacion: Registro de asistencia 14663332', '14663332');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:05:30-04:30', '-Operacion: Registro de asistencia 12836536', '12836536');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:05:51-04:30', '-Operacion: Registro de asistencia 6384084', '6384084');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:07:02-04:30', '-Operacion: Registro de asistencia 9386915', '9386915');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:08:10-04:30', '-Operacion: Registro de asistencia 15791432', '15791432');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:08:22-04:30', '-Operacion: Registro de asistencia 14434534', '14434534');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:08:53-04:30', '-Operacion: Registro de asistencia 17768572', '17768572');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:09:03-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:09:21-04:30', '-Operacion: Registro de asistencia 8568447', '8568447');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:09:43-04:30', '-Operacion: Registro de asistencia 10560238', '10560238');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:10:45-04:30', '-Operacion: Registro de asistencia 4256124', '4256124');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:12:44-04:30', '-Operacion: Registro de asistencia 11715878', '11715878');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:17:40-04:30', '-Operacion: Registro de asistencia 9389381', '9389381');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:19:15-04:30', '-Operacion: Registro de asistencia 10560322', '10560322');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:23:10-04:30', '-Operacion: Registro de asistencia 14663175', '14663175');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:34:32-04:30', '-Operacion: Registro de asistencia 16189838', '16189838');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '08:45:07-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '10:04:43-04:30', '-Operacion: Registro de asistencia 9326804', '9326804');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-22', '12:56:03-04:30', '-Operacion: Registro de asistencia 12554677', '12554677');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-23', '08:21:33-04:30', '-Operacion: Registro de asistencia 6384084', '6384084');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-23', '08:22:59-04:30', '-Operacion: Registro de asistencia 10560322', '10560322');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-23', '08:25:16-04:30', '-Operacion: Registro de asistencia 10562263', '10562263');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-23', '08:25:32-04:30', '-Operacion: Registro de asistencia 14663332', '14663332');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-23', '08:27:59-04:30', '-Operacion: Registro de asistencia 17768572', '17768572');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-23', '08:28:04-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-23', '08:28:18-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-23', '08:41:15-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-23', '09:10:40-04:30', '-Operacion: Registro de asistencia 9389381', '9389381');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-23', '09:33:15-04:30', '-Operacion: Entrar al sistema', 'ycastillo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-23', '10:42:17-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-23', '11:02:20-04:30', '-Operacion: Registro de asistencia 9326804', '9326804');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-23', '12:58:23-04:30', '-Operacion: Registro de asistencia 14663175', '14663175');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-23', '13:15:14-04:30', '-Operacion: Registro de asistencia 12836536', '12836536');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '07:42:26-04:30', '-Operacion: Registro de asistencia 16638750', '16638750');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '07:45:03-04:30', '-Operacion: Registro de asistencia 14663332', '14663332');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '07:50:19-04:30', '-Operacion: Registro de asistencia 14434534', '14434534');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '07:50:38-04:30', '-Operacion: Registro de asistencia 12554677', '12554677');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '07:53:16-04:30', '-Operacion: Registro de asistencia 14663175', '14663175');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '07:55:57-04:30', '-Operacion: Registro de asistencia 11714856', '11714856');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '07:56:51-04:30', '-Operacion: Registro de asistencia 6384084', '6384084');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '07:59:51-04:30', '-Operacion: Registro de asistencia 7237276', '7237276');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '08:00:31-04:30', '-Operacion: Registro de asistencia 9389381', '9389381');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '08:01:34-04:30', '-Operacion: Registro de asistencia 10560238', '10560238');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '08:03:31-04:30', '-Operacion: Registro de asistencia 17768572', '17768572');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '08:04:05-04:30', '-Operacion: Registro de asistencia 15791432', '15791432');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '08:05:18-04:30', '-Operacion: Registro de asistencia 9386915', '9386915');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '08:05:29-04:30', '-Operacion: Registro de asistencia 15384338', '15384338');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '08:08:17-04:30', '-Operacion: Registro de asistencia 8568447', '8568447');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '08:14:49-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '08:14:58-04:30', '-Operacion: Registro de asistencia 10560322', '10560322');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '08:15:18-04:30', '-Operacion: Registro de asistencia 13063445', '13063445');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '08:16:03-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '08:16:22-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '08:17:53-04:30', '-Operacion: Registro de asistencia 4256124', '4256124');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '08:18:58-04:30', '-Operacion: Registro de asistencia 1565892', '1565892');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '08:19:14-04:30', '-Operacion: Registro de asistencia 12836536', '12836536');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '08:27:25-04:30', '-Operacion: Registro de asistencia 11062752', '11062752');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '08:47:22-04:30', '-Operacion: Registro de asistencia 9326804', '9326804');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '10:31:56-04:30', '-Operacion: Entrar al sistema', 'ycastillo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '10:32:03-04:30', '-Operacion: Entrar al sistema', 'ycastillo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '10:49:04-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '11:02:28-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-01-2009 tipo de reporte: 00 Fondo: 0exportar: 0', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '11:15:43-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '11:16:31-04:30', '-Operacion: Entrar al sistema', 'jalvarez');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '11:42:45-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '11:42:59-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '16:35:11-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '17:08:52-04:30', '-Operacion: Registro de asistencia 4926074', '4926074');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '17:09:58-04:30', '-Operacion: Entrar al sistema', 'aolaechea');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '17:12:29-04:30', '-Operacion: Entrar al sistema', 'aolaechea');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '17:12:34-04:30', '-Operacion: Registro de asistencia 4383047', '4383047');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '17:14:47-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '17:16:05-04:30', '-Operacion: Entrar al sistema', 'aolaechea');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-24', '17:38:40-04:30', '-Operacion: Registro de asistencia 11715878', '11715878');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '07:40:52-04:30', '-Operacion: Registro de asistencia 14663175', '14663175');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '07:41:33-04:30', '-Operacion: Registro de asistencia 15384338', '15384338');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '07:43:51-04:30', '-Operacion: Registro de asistencia 14663332', '14663332');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '07:53:57-04:30', '-Operacion: Registro de asistencia 13063445', '13063445');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '07:54:29-04:30', '-Operacion: Registro de asistencia 10560238', '10560238');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '07:58:05-04:30', '-Operacion: Registro de asistencia 14434534', '14434534');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '08:02:07-04:30', '-Operacion: Registro de asistencia 4256124', '4256124');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '08:04:47-04:30', '-Operacion: Registro de asistencia 9386915', '9386915');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '08:09:21-04:30', '-Operacion: Registro de asistencia 15791432', '15791432');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '08:10:41-04:30', '-Operacion: Registro de asistencia 11715878', '11715878');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '08:11:18-04:30', '-Operacion: Registro de asistencia 7237276', '7237276');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '08:11:29-04:30', '-Operacion: Registro de asistencia 12836536', '12836536');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '08:20:26-04:30', '-Operacion: Registro de asistencia 8568447', '8568447');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '08:23:46-04:30', '-Operacion: Registro de asistencia 9389381', '9389381');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '08:24:51-04:30', '-Operacion: Registro de asistencia 10560322', '10560322');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '08:16:27-04:30', '-Operacion: Registro de asistencia 6384084', '6384084');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '08:18:10-04:30', '-Operacion: Registro de asistencia 11714856', '11714856');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '08:24:43-04:30', '-Operacion: Registro de asistencia 11062752', '11062752');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '13:59:57-04:30', '-Operacion: Registro de asistencia 16189838', '16189838');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-25', '14:09:13-04:30', '-Operacion: Registro de asistencia 12554677', '12554677');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '07:25:08-04:30', '-Operacion: Registro de asistencia 16638750', '16638750');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '07:27:50-04:30', '-Operacion: Registro de asistencia 9326804', '9326804');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '07:41:56-04:30', '-Operacion: Registro de asistencia 7237276', '7237276');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '07:44:15-04:30', '-Operacion: Registro de asistencia 14663332', '14663332');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '07:44:26-04:30', '-Operacion: Registro de asistencia 14663175', '14663175');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '07:48:19-04:30', '-Operacion: Registro de asistencia 17768572', '17768572');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '07:48:26-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '07:49:56-04:30', '-Operacion: Registro de asistencia 11714856', '11714856');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '07:52:35-04:30', '-Operacion: Registro de asistencia 4256124', '4256124');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '07:56:27-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '07:56:44-04:30', '-Operacion: Registro de asistencia 12836536', '12836536');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '07:57:19-04:30', '-Operacion: Registro de asistencia 1565892', '1565892');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '08:04:02-04:30', '-Operacion: Registro de asistencia 6384084', '6384084');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '08:07:38-04:30', '-Operacion: Registro de asistencia 10560238', '10560238');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '08:08:26-04:30', '-Operacion: Registro de asistencia 12554677', '12554677');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '08:12:30-04:30', '-Operacion: Registro de asistencia 9389381', '9389381');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '08:25:24-04:30', '-Operacion: Registro de asistencia 15791432', '15791432');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '08:29:20-04:30', '-Operacion: Registro de asistencia 11715878', '11715878');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '08:29:38-04:30', '-Operacion: Registro de asistencia 10560322', '10560322');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '09:10:33-04:30', '-Operacion: Registro de asistencia 9387147', '9387147');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '09:11:42-04:30', '-Operacion: Registro de asistencia 11062752', '11062752');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '10:13:56-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '10:15:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '10:16:26-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '10:18:10-04:30', '-Operacion: Entrar al sistema', 'ycastillo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '10:23:21-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '10:26:59-04:30', '-Operacion: Modificar -Acceso:  -Registro ID: 2', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '10:28:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '10:55:09-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:13:50-04:30', '-Operacion: Entrar al sistema', 'aolaechea');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:15:09-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-01-2009 tipo de reporte: 08 Fondo: FONDO MENSUALexportar: 0', 'aolaechea');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:45:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', '');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:46:03-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:51:45-04:30', '-Operacion: Entrar al sistema', 'aolaechea');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:52:25-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:53:55-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:21-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:35-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:56:46-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:04-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:30-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:30-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:30-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:30-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:30-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:31-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:31-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:31-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:31-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:31-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:31-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:31-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:31-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:31-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:31-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:31-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:32-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:33-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:57:43-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:58:03-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:20-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:34-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:41-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:47-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:48-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:48-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:48-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '11:59:48-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '12:04:22-04:30', '-Operacion: Registro de asistencia 13063445', '13063445');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '15:41:07-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-02-26', '16:25:45-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '07:47:52-04:30', '-Operacion: Registro de asistencia 15384338', '15384338');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '07:50:27-04:30', '-Operacion: Registro de asistencia 13063445', '13063445');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '07:51:28-04:30', '-Operacion: Registro de asistencia 14663332', '14663332');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '07:56:50-04:30', '-Operacion: Registro de asistencia 9990433', '9990433');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '07:59:19-04:30', '-Operacion: Registro de asistencia 12836536', '12836536');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '07:59:29-04:30', '-Operacion: Registro de asistencia 6384084', '6384084');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '07:59:47-04:30', '-Operacion: Registro de asistencia 7237276', '7237276');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '08:02:05-04:30', '-Operacion: Registro de asistencia 15791432', '15791432');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '08:02:32-04:30', '-Operacion: Registro de asistencia 10560238', '10560238');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '08:02:40-04:30', '-Operacion: Registro de asistencia 18471179', '18471179');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '08:07:36-04:30', '-Operacion: Registro de asistencia 9386915', '9386915');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '08:09:35-04:30', '-Operacion: Registro de asistencia 11715878', '11715878');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '08:13:18-04:30', '-Operacion: Registro de asistencia 11062752', '11062752');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '08:20:08-04:30', '-Operacion: Registro de asistencia 10560322', '10560322');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '08:22:51-04:30', '-Operacion: Registro de asistencia 4256124', '4256124');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '11:38:47-04:30', '-Operacion: Entrar al sistema', 'aolaechea');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '11:43:39-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '11:44:18-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '11:56:23-04:30', '-Operacion: Registro de asistencia 17768572', '17768572');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '11:59:41-04:30', '-Operacion: Registro de asistencia 11714856', '11714856');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '13:27:57-04:30', '-Operacion: Registro de asistencia 16189838', '16189838');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '13:57:24-04:30', '-Operacion: Registro de asistencia 10562263', '10562263');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '14:11:31-04:30', '-Operacion: Entrar al sistema', 'aolaechea');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '14:12:22-04:30', '-Operacion: Registro de asistencia 14663175', '14663175');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '16:12:45-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '16:17:16-04:30', '-Operacion: Entrar al sistema', 'aolaechea');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '16:23:47-04:30', '-Operacion: Entrar al sistema', 'aolaechea');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '16:54:37-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-01-2009 tipo de reporte: 14 Fondo: FONDO MENSUALexportar: 0', 'aolaechea');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-01', '17:38:36-04:30', '-Operacion: Entrar al sistema', 'lflores');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-02', '07:33:00-04:30', '-Operacion: Registro de asistencia 15384338', '15384338');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-02', '07:51:35-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-02', '07:51:43-04:30', '-Operacion: Registro de asistencia 7237276', '7237276');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-02', '08:03:38-04:30', '-Operacion: Registro de asistencia 10560238', '10560238');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-02', '08:44:55-04:30', '-Operacion: Registro de asistencia 11062752', '11062752');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-02', '08:45:34-04:30', '-Operacion: Registro de asistencia 8568447', '8568447');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-02', '08:49:10-04:30', '-Operacion: Entrar al sistema', 'jalvarez');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-02', '08:53:19-04:30', '-Operacion: Entrar al sistema', 'jalvarez');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-02', '10:38:30-04:30', '-Operacion: Entrar al sistema', 'jalvarez');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-02', '10:39:19-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:20-01-2009 tipo de reporte: 00 Fondo: FONDO MENSUALexportar: 0', 'jalvarez');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-02', '15:24:00-04:30', '-Operacion: Entrar al sistema', 'aolaechea');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-09', '08:45:56-04:30', '-Operacion: Registro de asistencia 11062752', '11062752');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-09', '10:40:50-04:30', '-Operacion: Entrar al sistema', 'aolaechea');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-10', '08:06:34-04:30', '-Operacion: Registro de asistencia 15270968', '15270968');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-11', '09:16:21-04:30', '-Operacion: Registro de asistencia 11062752', '11062752');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-11', '12:24:54-04:30', '-Operacion: Registro de asistencia 10560238', '10560238');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-15', '09:01:39-04:30', '-Operacion: Entrar al sistema', 'aolaechea');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-26', '09:11:59-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-03-26', '09:12:08-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-04-29', '09:30:55-04:30', '-Operacion: Registro de asistencia 14434236', '14434236');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-05-06', '12:30:38-04:30', '-Operacion: Registro de asistencia 14663175', '14663175');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-06-10', '10:25:12-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-06-10', '11:01:33-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-06-10', '11:01:57-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-01-2009 tipo de reporte: 00 Fondo: 0exportar: 0', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-06-10', '11:02:23-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-06-15', '14:32:11-04:30', '-Operacion: Entrar al sistema', 'ycastillo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-06-15', '14:33:20-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-01-2009 tipo de reporte: 01 Fondo: 0exportar: 0', 'ycastillo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-06-15', '14:35:01-04:30', '-Operacion: Entrar al sistema', 'lflores');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-06-15', '14:35:55-04:30', '-Operacion: Consultar:  desde :01-01-2009 hasta:01-01-2009 tipo de reporte: 01 Fondo: 0exportar: 0', 'lflores');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-06-15', '14:38:55-04:30', '-Operacion: Entrar al sistema', 'jalvarez');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-06-18', '09:04:49-04:30', '-Operacion: Registro de asistencia 10560238', '10560238');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-07-16', '09:40:46-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-09-09', '12:02:20-04:30', '-Operacion: Registro de asistencia 12836536', '12836536');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-11-25', '09:47:36-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-11-25', '09:49:03-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-11-25', '09:50:34-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-11-25', '11:59:35-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-11-25', '12:00:11-04:30', '-Operacion: Entrar al sistema', 'leonardo');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-11-25', '12:00:51-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-11-25', '12:13:53-04:30', '-Operacion: Registro de asistencia 8189876', '8189876');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-11-26', '08:08:03-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-11-26', '08:08:40-04:30', '-Operacion: Registro de asistencia 16634218', '16634218');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-11-29', '13:27:58-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-11-29', '14:58:03-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-11-29', '14:59:44-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-11-29', '15:00:05-04:30', '-Operacion: Entrar al sistema', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-11-29', '15:00:53-04:30', '-Operacion: Agregar -Acceso: -Registro Usuario: ', 'nperalta');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-11-30', '13:20:39-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-12-01', '07:37:20-04:30', '-Operacion: Registro de asistencia 16634218', '16634218');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2010-12-01', '08:14:50-04:30', '-Operacion: Registro de asistencia 15796044', '15796044');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2011-01-13', '08:14:13-04:30', '-Operacion: Registro de asistencia 7237276', '7237276');
INSERT INTO transaccion (fecha, hora, operacion, login) VALUES ('2011-01-14', '09:33:47-04:30', '-Operacion: Entrar al sistema', 'leonardo');


--
-- TOC entry 1771 (class 0 OID 0)
-- Dependencies: 3
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2011-01-18 13:22:13 VET

--
-- PostgreSQL database dump complete
--

