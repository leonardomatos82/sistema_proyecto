

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
-- Name: acceso_id_acceso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE acceso_id_acceso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;




CREATE TABLE autorizado (
    nombre character varying(300),
    cargo character varying(300),
    cargo_completo character varying(300),
    resolucion character varying(300),
    cestaticket character varying(10),
    fondo character varying(200)
);


ALTER TABLE public.autorizado OWNER TO postgres;

--
-- Name: cargo; Type: TABLE; Schema: public; Owner: leonardo; Tablespace: 
--


CREATE TABLE solicitud (
    id_solicitud integer DEFAULT nextval(('public.solicitud_id_solicitud_seq'::text)::regclass) NOT NULL,
    nacion character varying(2),
    cedula character varying(30),
    nombre character varying(280) NOT NULL,
    fecha_solicitud character varying(30),
    codigo character varying(30),
    tomo character varying(30),
    folio character varying(30),
    ciudad_r character varying(180),
    estado_ character varying(30),
    estatus character varying(30)
);


CREATE SEQUENCE solicitud_id_solicitud_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


INSERT INTO acceso VALUES ('leonardo', '12345', 'A', 1, 'LEONARDO MATOS', NULL);



INSERT INTO autorizado VALUES ('MSc. Ledys Lisbeth Jimenez Gonzalez', 'Coordinadora ( E ) Regional  Barinas – Portuguesa', 'Coordinadora Regional (E) Universidad Bolivariana de Venezuela Eje Barinas - Portuguesa', '(Según Resolución Nº 10-10, de fecha 13 de Abril de 2011)', '38', 'imagenes/fondo/t.jpg');
