--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-10-21 08:14:51

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4832 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 17014)
-- Name: calificaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calificaciones (
    id integer NOT NULL,
    valoracion integer NOT NULL,
    usuario_id integer,
    pelicula_serie_id integer
);


ALTER TABLE public.calificaciones OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17013)
-- Name: calificaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calificaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.calificaciones_id_seq OWNER TO postgres;

--
-- TOC entry 4833 (class 0 OID 0)
-- Dependencies: 219
-- Name: calificaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calificaciones_id_seq OWNED BY public.calificaciones.id;


--
-- TOC entry 222 (class 1259 OID 17031)
-- Name: comentarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comentarios (
    id integer NOT NULL,
    comentario text,
    fecha date,
    usuario_id integer,
    pelicula_serie_id integer
);


ALTER TABLE public.comentarios OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17030)
-- Name: comentarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comentarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comentarios_id_seq OWNER TO postgres;

--
-- TOC entry 4834 (class 0 OID 0)
-- Dependencies: 221
-- Name: comentarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comentarios_id_seq OWNED BY public.comentarios.id;


--
-- TOC entry 224 (class 1259 OID 17050)
-- Name: peliculas; Type: TABLE; Schema: public; Owner: popcorn_admin
--

CREATE TABLE public.peliculas (
    id integer NOT NULL,
    titulo character varying(255) NOT NULL,
    descripcion text NOT NULL,
    fecha_publicacion date NOT NULL,
    moderador_id integer NOT NULL,
    imagen character varying(255)
);


ALTER TABLE public.peliculas OWNER TO popcorn_admin;

--
-- TOC entry 223 (class 1259 OID 17049)
-- Name: peliculas_id_seq; Type: SEQUENCE; Schema: public; Owner: popcorn_admin
--

CREATE SEQUENCE public.peliculas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.peliculas_id_seq OWNER TO popcorn_admin;

--
-- TOC entry 4835 (class 0 OID 0)
-- Dependencies: 223
-- Name: peliculas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: popcorn_admin
--

ALTER SEQUENCE public.peliculas_id_seq OWNED BY public.peliculas.id;


--
-- TOC entry 218 (class 1259 OID 17000)
-- Name: peliculas_series; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.peliculas_series (
    id integer NOT NULL,
    titulo character varying(255) NOT NULL,
    descripcion text,
    fecha_publicacion date,
    moderador_id integer
);


ALTER TABLE public.peliculas_series OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16999)
-- Name: peliculas_series_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.peliculas_series_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.peliculas_series_id_seq OWNER TO postgres;

--
-- TOC entry 4836 (class 0 OID 0)
-- Dependencies: 217
-- Name: peliculas_series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.peliculas_series_id_seq OWNED BY public.peliculas_series.id;


--
-- TOC entry 216 (class 1259 OID 16991)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre_usuario character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    "contraseña" character varying(255) NOT NULL,
    tipo_usuario character varying(50) NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16990)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 4837 (class 0 OID 0)
-- Dependencies: 215
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 4656 (class 2604 OID 17017)
-- Name: calificaciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones ALTER COLUMN id SET DEFAULT nextval('public.calificaciones_id_seq'::regclass);


--
-- TOC entry 4657 (class 2604 OID 17034)
-- Name: comentarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios ALTER COLUMN id SET DEFAULT nextval('public.comentarios_id_seq'::regclass);


--
-- TOC entry 4658 (class 2604 OID 17053)
-- Name: peliculas id; Type: DEFAULT; Schema: public; Owner: popcorn_admin
--

ALTER TABLE ONLY public.peliculas ALTER COLUMN id SET DEFAULT nextval('public.peliculas_id_seq'::regclass);


--
-- TOC entry 4655 (class 2604 OID 17003)
-- Name: peliculas_series id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peliculas_series ALTER COLUMN id SET DEFAULT nextval('public.peliculas_series_id_seq'::regclass);


--
-- TOC entry 4654 (class 2604 OID 16994)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 4822 (class 0 OID 17014)
-- Dependencies: 220
-- Data for Name: calificaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calificaciones (id, valoracion, usuario_id, pelicula_serie_id) FROM stdin;
\.


--
-- TOC entry 4824 (class 0 OID 17031)
-- Dependencies: 222
-- Data for Name: comentarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comentarios (id, comentario, fecha, usuario_id, pelicula_serie_id) FROM stdin;
\.


--
-- TOC entry 4826 (class 0 OID 17050)
-- Dependencies: 224
-- Data for Name: peliculas; Type: TABLE DATA; Schema: public; Owner: popcorn_admin
--

COPY public.peliculas (id, titulo, descripcion, fecha_publicacion, moderador_id, imagen) FROM stdin;
\.


--
-- TOC entry 4820 (class 0 OID 17000)
-- Dependencies: 218
-- Data for Name: peliculas_series; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.peliculas_series (id, titulo, descripcion, fecha_publicacion, moderador_id) FROM stdin;
\.


--
-- TOC entry 4818 (class 0 OID 16991)
-- Dependencies: 216
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, nombre_usuario, email, "contraseña", tipo_usuario) FROM stdin;
1	moderador	moderador@popcornhour.com	scrypt:32768:8:1$KBTKqY3AHSAx5l9z$397c5ac77b4d36db05879f87c5ddd523a23e57beaea0fc1ab1256fc7c2106b8921ddf1304fa7f8179445793e6dae624c5eb3d7d99a60346e7c80b747d26ee6ff	moderador
2	user	user@hotmail.com	password	estandar
3	user_01	user@hotmail.com	password	estandar
4	user	user@test.com	scrypt:32768:8:1$7MDOUR9A3yhcF32G$c43fb2ba09ef5034380b03f0ce8051c0cc738217801f790a74a5b94db0c922acd5ee04015f7c1e0f8b4f004706ca4bd4aff172ce63150bea4cd033d9caaa80d1	estandar
5	test1	test1@correo.com	scrypt:32768:8:1$Isj1EvtbJpnT9FiL$7a417408f1a09742337696a73694a72213efdf5fb6e8d91e76c6eef133deec9331d89bd17b0eb615ce636e004793eee2907f3cac3f73c1f4fb64896052de5677	estandar
6	test2	test2@hybridge	scrypt:32768:8:1$cLy4IqzbODi6yl3N$71f7449fdf9f77f8f81ce01be7fb03ba2eba71d8373b07068fddc724792cecb326e72a088e9bc0f7c2c44d858cbc44f1c3c0e199c6609c8f565c3de88483c088	estandar
\.


--
-- TOC entry 4838 (class 0 OID 0)
-- Dependencies: 219
-- Name: calificaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.calificaciones_id_seq', 1, false);


--
-- TOC entry 4839 (class 0 OID 0)
-- Dependencies: 221
-- Name: comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comentarios_id_seq', 1, false);


--
-- TOC entry 4840 (class 0 OID 0)
-- Dependencies: 223
-- Name: peliculas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: popcorn_admin
--

SELECT pg_catalog.setval('public.peliculas_id_seq', 1, false);


--
-- TOC entry 4841 (class 0 OID 0)
-- Dependencies: 217
-- Name: peliculas_series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.peliculas_series_id_seq', 1, false);


--
-- TOC entry 4842 (class 0 OID 0)
-- Dependencies: 215
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 6, true);


--
-- TOC entry 4664 (class 2606 OID 17019)
-- Name: calificaciones calificaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 4666 (class 2606 OID 17038)
-- Name: comentarios comentarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4668 (class 2606 OID 17057)
-- Name: peliculas peliculas_pkey; Type: CONSTRAINT; Schema: public; Owner: popcorn_admin
--

ALTER TABLE ONLY public.peliculas
    ADD CONSTRAINT peliculas_pkey PRIMARY KEY (id);


--
-- TOC entry 4662 (class 2606 OID 17007)
-- Name: peliculas_series peliculas_series_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peliculas_series
    ADD CONSTRAINT peliculas_series_pkey PRIMARY KEY (id);


--
-- TOC entry 4660 (class 2606 OID 16998)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4670 (class 2606 OID 17025)
-- Name: calificaciones calificaciones_pelicula_serie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_pelicula_serie_id_fkey FOREIGN KEY (pelicula_serie_id) REFERENCES public.peliculas_series(id);


--
-- TOC entry 4671 (class 2606 OID 17020)
-- Name: calificaciones calificaciones_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 4672 (class 2606 OID 17044)
-- Name: comentarios comentarios_pelicula_serie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_pelicula_serie_id_fkey FOREIGN KEY (pelicula_serie_id) REFERENCES public.peliculas_series(id);


--
-- TOC entry 4673 (class 2606 OID 17039)
-- Name: comentarios comentarios_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 4669 (class 2606 OID 17008)
-- Name: peliculas_series peliculas_series_moderador_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peliculas_series
    ADD CONSTRAINT peliculas_series_moderador_id_fkey FOREIGN KEY (moderador_id) REFERENCES public.usuarios(id);


-- Completed on 2024-10-21 08:14:51

--
-- PostgreSQL database dump complete
--

