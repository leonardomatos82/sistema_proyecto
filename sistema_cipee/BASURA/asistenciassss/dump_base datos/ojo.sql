--
-- PostgreSQL database dump
--

-- Started on 2010-01-29 09:40:27 VET

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 1769 (class 1262 OID 24576)
-- Name: asistencia; Type: DATABASE; Schema: -; Owner: leonardo
--

CREATE DATABASE asistencia WITH TEMPLATE = template0 ENCODING = 'UTF8';


ALTER DATABASE asistencia OWNER TO leonardo;

\connect asistencia

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
    nomb_usuario character varying(50)
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

SELECT pg_catalog.setval('acceso_id_acceso_seq', 1, true);


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

SELECT pg_catalog.setval('asistencia_id_asistencia_seq', 6, true);


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

SELECT pg_catalog.setval('personal_id_personal_seq', 9, true);


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

INSERT INTO acceso (login, clave, tipo, id_acceso, nomb_usuario) VALUES ('leonardo', '15796044', 'A', 1, 'LEONARDO MATOS');


--
-- TOC entry 1766 (class 0 OID 24607)
-- Dependencies: 1488
-- Data for Name: asistencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (1, '2010-01-28', '1', '15796044', '11:30', '12:57', '01:00', NULL, NULL, '1');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (2, '2010-01-29', '1', '15796044', '08:15', NULL, NULL, NULL, NULL, '1');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (3, '2010-01-29', '4', '17768572', '08:15', NULL, NULL, NULL, NULL, '22');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (4, '2010-01-29', '3', '15384338', '08:16', NULL, NULL, NULL, NULL, '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (5, '2010-01-29', '2', '7237276', '08:16', NULL, NULL, NULL, NULL, '7');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (6, '2010-01-29', '9', '8132701', '08:25', NULL, NULL, NULL, NULL, '14');
INSERT INTO asistencia (id_asistencia, fecha, id_personal, cedula, entra1, sale1, entra2, sale2, observacion, id_dpto) VALUES (6, '2010-01-27', '9', '8132701', '08:25', '', '', '', '', '14');


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

INSERT INTO horario (id_horario, entra1, sale1, entra2, sale2, entra3, sale3, entra4, sale4, m1, m2, m3, m4, m5, m6, m7, m8) VALUES (1, '06:00', '11:30', '12:55', '12:59', '01:00', '02:00', '02:00', '02:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 1762 (class 0 OID 24583)
-- Dependencies: 1481
-- Data for Name: personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (1, '15796044', 'LEONARDO JOSE MATOS', 'ANALISTA PROGRAMADOR DE SISTEMAS', 'ADMINISTRATIVO', '1', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (2, '7237276', 'NOEL FRANCISCO PERALTA BARRETO', 'COORDINADOR DE INFORMATICA', 'ADMINISTRATIVO', '7', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (3, '15384338', 'WALTER EDUARDO MORA BRITO', 'TECNICO DE RECURSOS INFORMATICOS', 'ADMINISTRATIVO', '7', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (4, '17768572', 'MARIA GABRIELA VIVAS QUINTERO', 'SECRETARIA', 'ADMINISTRATIVO', '22', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (5, '16638750', 'ELIZABETH VELASQUEZ', 'SUPERVISOR DE REGISTRO Y CONTROL DE BIENES NACIONALES', 'ADMINISTRATIVO', '22', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (6, '12836536', 'FRANCISCO JAVIER GONZALEZ SOLER', 'ANALISTA DE ORGANIZACION', 'ADMINISTRATIVO', '3', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (7, '16979004', 'LIRIS ALEJANDRA GONZALEZ TORREALBA', 'ANALISTA DE INFORMACION Y CONTROL ESTUDIANTIL', 'ADMINISTRATIVO', '3', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (8, '15270968', 'Jose Jimenez', 'Docente a Didicacion Exclusiva', 'DOCENTE', '15', 'ACTIVO');
INSERT INTO personal (id_personal, cedula, nombre, cargo, tipo, id_dpto, estado) VALUES (9, '8132701', 'FELIX ALFONSO VITRIAGO GONZALEZ', 'ASISTENTE ADMINISTRATIVO', 'ADMINISTRATIVO', '14', 'ACTIVO');


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


--
-- TOC entry 1771 (class 0 OID 0)
-- Dependencies: 3
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2010-01-29 09:40:27 VET

--
-- PostgreSQL database dump complete
--

