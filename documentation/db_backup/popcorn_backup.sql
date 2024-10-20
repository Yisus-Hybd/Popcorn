toc.dat                                                                                             0000600 0004000 0002000 00000032404 14705467646 0014465 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   *                	    |            popcorn    16.3    16.3 .    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    16989    popcorn    DATABASE     z   CREATE DATABASE popcorn WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE popcorn;
                popcorn_admin    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false         �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4         �            1259    17014    calificaciones    TABLE     �   CREATE TABLE public.calificaciones (
    id integer NOT NULL,
    valoracion integer NOT NULL,
    usuario_id integer,
    pelicula_serie_id integer
);
 "   DROP TABLE public.calificaciones;
       public         heap    postgres    false    4         �            1259    17013    calificaciones_id_seq    SEQUENCE     �   CREATE SEQUENCE public.calificaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.calificaciones_id_seq;
       public          postgres    false    4    220         �           0    0    calificaciones_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.calificaciones_id_seq OWNED BY public.calificaciones.id;
          public          postgres    false    219         �            1259    17031    comentarios    TABLE     �   CREATE TABLE public.comentarios (
    id integer NOT NULL,
    comentario text,
    fecha date,
    usuario_id integer,
    pelicula_serie_id integer
);
    DROP TABLE public.comentarios;
       public         heap    postgres    false    4         �            1259    17030    comentarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comentarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.comentarios_id_seq;
       public          postgres    false    4    222         �           0    0    comentarios_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.comentarios_id_seq OWNED BY public.comentarios.id;
          public          postgres    false    221         �            1259    17050 	   peliculas    TABLE     �   CREATE TABLE public.peliculas (
    id integer NOT NULL,
    titulo character varying(255) NOT NULL,
    descripcion text NOT NULL,
    fecha_publicacion date NOT NULL,
    moderador_id integer NOT NULL,
    imagen character varying(255)
);
    DROP TABLE public.peliculas;
       public         heap    popcorn_admin    false    4         �            1259    17049    peliculas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.peliculas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.peliculas_id_seq;
       public          popcorn_admin    false    4    224         �           0    0    peliculas_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.peliculas_id_seq OWNED BY public.peliculas.id;
          public          popcorn_admin    false    223         �            1259    17000    peliculas_series    TABLE     �   CREATE TABLE public.peliculas_series (
    id integer NOT NULL,
    titulo character varying(255) NOT NULL,
    descripcion text,
    fecha_publicacion date,
    moderador_id integer
);
 $   DROP TABLE public.peliculas_series;
       public         heap    postgres    false    4         �            1259    16999    peliculas_series_id_seq    SEQUENCE     �   CREATE SEQUENCE public.peliculas_series_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.peliculas_series_id_seq;
       public          postgres    false    4    218         �           0    0    peliculas_series_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.peliculas_series_id_seq OWNED BY public.peliculas_series.id;
          public          postgres    false    217         �            1259    16991    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre_usuario character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    "contraseña" character varying(255) NOT NULL,
    tipo_usuario character varying(50) NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false    4         �            1259    16990    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public          postgres    false    216    4         �           0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public          postgres    false    215         0           2604    17017    calificaciones id    DEFAULT     v   ALTER TABLE ONLY public.calificaciones ALTER COLUMN id SET DEFAULT nextval('public.calificaciones_id_seq'::regclass);
 @   ALTER TABLE public.calificaciones ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220         1           2604    17034    comentarios id    DEFAULT     p   ALTER TABLE ONLY public.comentarios ALTER COLUMN id SET DEFAULT nextval('public.comentarios_id_seq'::regclass);
 =   ALTER TABLE public.comentarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222         2           2604    17053    peliculas id    DEFAULT     l   ALTER TABLE ONLY public.peliculas ALTER COLUMN id SET DEFAULT nextval('public.peliculas_id_seq'::regclass);
 ;   ALTER TABLE public.peliculas ALTER COLUMN id DROP DEFAULT;
       public          popcorn_admin    false    223    224    224         /           2604    17003    peliculas_series id    DEFAULT     z   ALTER TABLE ONLY public.peliculas_series ALTER COLUMN id SET DEFAULT nextval('public.peliculas_series_id_seq'::regclass);
 B   ALTER TABLE public.peliculas_series ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218         .           2604    16994    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216         �          0    17014    calificaciones 
   TABLE DATA           W   COPY public.calificaciones (id, valoracion, usuario_id, pelicula_serie_id) FROM stdin;
    public          postgres    false    220       4822.dat �          0    17031    comentarios 
   TABLE DATA           [   COPY public.comentarios (id, comentario, fecha, usuario_id, pelicula_serie_id) FROM stdin;
    public          postgres    false    222       4824.dat �          0    17050 	   peliculas 
   TABLE DATA           e   COPY public.peliculas (id, titulo, descripcion, fecha_publicacion, moderador_id, imagen) FROM stdin;
    public          popcorn_admin    false    224       4826.dat �          0    17000    peliculas_series 
   TABLE DATA           d   COPY public.peliculas_series (id, titulo, descripcion, fecha_publicacion, moderador_id) FROM stdin;
    public          postgres    false    218       4820.dat �          0    16991    usuarios 
   TABLE DATA           Z   COPY public.usuarios (id, nombre_usuario, email, "contraseña", tipo_usuario) FROM stdin;
    public          postgres    false    216       4818.dat �           0    0    calificaciones_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.calificaciones_id_seq', 1, false);
          public          postgres    false    219         �           0    0    comentarios_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.comentarios_id_seq', 1, false);
          public          postgres    false    221         �           0    0    peliculas_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.peliculas_id_seq', 1, false);
          public          popcorn_admin    false    223         �           0    0    peliculas_series_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.peliculas_series_id_seq', 1, false);
          public          postgres    false    217         �           0    0    usuarios_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuarios_id_seq', 6, true);
          public          postgres    false    215         8           2606    17019 "   calificaciones calificaciones_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificaciones_pkey;
       public            postgres    false    220         :           2606    17038    comentarios comentarios_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.comentarios DROP CONSTRAINT comentarios_pkey;
       public            postgres    false    222         <           2606    17057    peliculas peliculas_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.peliculas
    ADD CONSTRAINT peliculas_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.peliculas DROP CONSTRAINT peliculas_pkey;
       public            popcorn_admin    false    224         6           2606    17007 &   peliculas_series peliculas_series_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.peliculas_series
    ADD CONSTRAINT peliculas_series_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.peliculas_series DROP CONSTRAINT peliculas_series_pkey;
       public            postgres    false    218         4           2606    16998    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    216         >           2606    17025 4   calificaciones calificaciones_pelicula_serie_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_pelicula_serie_id_fkey FOREIGN KEY (pelicula_serie_id) REFERENCES public.peliculas_series(id);
 ^   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificaciones_pelicula_serie_id_fkey;
       public          postgres    false    218    4662    220         ?           2606    17020 -   calificaciones calificaciones_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);
 W   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificaciones_usuario_id_fkey;
       public          postgres    false    4660    216    220         @           2606    17044 .   comentarios comentarios_pelicula_serie_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_pelicula_serie_id_fkey FOREIGN KEY (pelicula_serie_id) REFERENCES public.peliculas_series(id);
 X   ALTER TABLE ONLY public.comentarios DROP CONSTRAINT comentarios_pelicula_serie_id_fkey;
       public          postgres    false    218    4662    222         A           2606    17039 '   comentarios comentarios_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);
 Q   ALTER TABLE ONLY public.comentarios DROP CONSTRAINT comentarios_usuario_id_fkey;
       public          postgres    false    4660    216    222         =           2606    17008 3   peliculas_series peliculas_series_moderador_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.peliculas_series
    ADD CONSTRAINT peliculas_series_moderador_id_fkey FOREIGN KEY (moderador_id) REFERENCES public.usuarios(id);
 ]   ALTER TABLE ONLY public.peliculas_series DROP CONSTRAINT peliculas_series_moderador_id_fkey;
       public          postgres    false    4660    218    216                                                                                                                                                                                                                                                                    4822.dat                                                                                            0000600 0004000 0002000 00000000005 14705467646 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4824.dat                                                                                            0000600 0004000 0002000 00000000005 14705467646 0014271 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4826.dat                                                                                            0000600 0004000 0002000 00000000005 14705467646 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4820.dat                                                                                            0000600 0004000 0002000 00000000005 14705467646 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4818.dat                                                                                            0000600 0004000 0002000 00000001570 14705467646 0014304 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	moderador	moderador@popcornhour.com	scrypt:32768:8:1$KBTKqY3AHSAx5l9z$397c5ac77b4d36db05879f87c5ddd523a23e57beaea0fc1ab1256fc7c2106b8921ddf1304fa7f8179445793e6dae624c5eb3d7d99a60346e7c80b747d26ee6ff	moderador
2	user	user@hotmail.com	password	estandar
3	user_01	user@hotmail.com	password	estandar
4	user	user@test.com	scrypt:32768:8:1$7MDOUR9A3yhcF32G$c43fb2ba09ef5034380b03f0ce8051c0cc738217801f790a74a5b94db0c922acd5ee04015f7c1e0f8b4f004706ca4bd4aff172ce63150bea4cd033d9caaa80d1	estandar
5	test1	test1@correo.com	scrypt:32768:8:1$Isj1EvtbJpnT9FiL$7a417408f1a09742337696a73694a72213efdf5fb6e8d91e76c6eef133deec9331d89bd17b0eb615ce636e004793eee2907f3cac3f73c1f4fb64896052de5677	estandar
6	test2	test2@hybridge	scrypt:32768:8:1$cLy4IqzbODi6yl3N$71f7449fdf9f77f8f81ce01be7fb03ba2eba71d8373b07068fddc724792cecb326e72a088e9bc0f7c2c44d858cbc44f1c3c0e199c6609c8f565c3de88483c088	estandar
\.


                                                                                                                                        restore.sql                                                                                         0000600 0004000 0002000 00000025570 14705467646 0015420 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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

DROP DATABASE popcorn;
--
-- Name: popcorn; Type: DATABASE; Schema: -; Owner: popcorn_admin
--

CREATE DATABASE popcorn WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';


ALTER DATABASE popcorn OWNER TO popcorn_admin;

\connect popcorn

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
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
-- Name: calificaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calificaciones_id_seq OWNED BY public.calificaciones.id;


--
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
-- Name: comentarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comentarios_id_seq OWNED BY public.comentarios.id;


--
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
-- Name: peliculas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: popcorn_admin
--

ALTER SEQUENCE public.peliculas_id_seq OWNED BY public.peliculas.id;


--
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
-- Name: peliculas_series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.peliculas_series_id_seq OWNED BY public.peliculas_series.id;


--
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
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: calificaciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones ALTER COLUMN id SET DEFAULT nextval('public.calificaciones_id_seq'::regclass);


--
-- Name: comentarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios ALTER COLUMN id SET DEFAULT nextval('public.comentarios_id_seq'::regclass);


--
-- Name: peliculas id; Type: DEFAULT; Schema: public; Owner: popcorn_admin
--

ALTER TABLE ONLY public.peliculas ALTER COLUMN id SET DEFAULT nextval('public.peliculas_id_seq'::regclass);


--
-- Name: peliculas_series id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peliculas_series ALTER COLUMN id SET DEFAULT nextval('public.peliculas_series_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Data for Name: calificaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calificaciones (id, valoracion, usuario_id, pelicula_serie_id) FROM stdin;
\.
COPY public.calificaciones (id, valoracion, usuario_id, pelicula_serie_id) FROM '$$PATH$$/4822.dat';

--
-- Data for Name: comentarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comentarios (id, comentario, fecha, usuario_id, pelicula_serie_id) FROM stdin;
\.
COPY public.comentarios (id, comentario, fecha, usuario_id, pelicula_serie_id) FROM '$$PATH$$/4824.dat';

--
-- Data for Name: peliculas; Type: TABLE DATA; Schema: public; Owner: popcorn_admin
--

COPY public.peliculas (id, titulo, descripcion, fecha_publicacion, moderador_id, imagen) FROM stdin;
\.
COPY public.peliculas (id, titulo, descripcion, fecha_publicacion, moderador_id, imagen) FROM '$$PATH$$/4826.dat';

--
-- Data for Name: peliculas_series; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.peliculas_series (id, titulo, descripcion, fecha_publicacion, moderador_id) FROM stdin;
\.
COPY public.peliculas_series (id, titulo, descripcion, fecha_publicacion, moderador_id) FROM '$$PATH$$/4820.dat';

--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, nombre_usuario, email, "contraseña", tipo_usuario) FROM stdin;
\.
COPY public.usuarios (id, nombre_usuario, email, "contraseña", tipo_usuario) FROM '$$PATH$$/4818.dat';

--
-- Name: calificaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.calificaciones_id_seq', 1, false);


--
-- Name: comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comentarios_id_seq', 1, false);


--
-- Name: peliculas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: popcorn_admin
--

SELECT pg_catalog.setval('public.peliculas_id_seq', 1, false);


--
-- Name: peliculas_series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.peliculas_series_id_seq', 1, false);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 6, true);


--
-- Name: calificaciones calificaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_pkey PRIMARY KEY (id);


--
-- Name: comentarios comentarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_pkey PRIMARY KEY (id);


--
-- Name: peliculas peliculas_pkey; Type: CONSTRAINT; Schema: public; Owner: popcorn_admin
--

ALTER TABLE ONLY public.peliculas
    ADD CONSTRAINT peliculas_pkey PRIMARY KEY (id);


--
-- Name: peliculas_series peliculas_series_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peliculas_series
    ADD CONSTRAINT peliculas_series_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: calificaciones calificaciones_pelicula_serie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_pelicula_serie_id_fkey FOREIGN KEY (pelicula_serie_id) REFERENCES public.peliculas_series(id);


--
-- Name: calificaciones calificaciones_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: comentarios comentarios_pelicula_serie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_pelicula_serie_id_fkey FOREIGN KEY (pelicula_serie_id) REFERENCES public.peliculas_series(id);


--
-- Name: comentarios comentarios_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: peliculas_series peliculas_series_moderador_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peliculas_series
    ADD CONSTRAINT peliculas_series_moderador_id_fkey FOREIGN KEY (moderador_id) REFERENCES public.usuarios(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        