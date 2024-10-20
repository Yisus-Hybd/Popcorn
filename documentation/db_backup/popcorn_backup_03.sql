PGDMP                  	    |            popcorn    16.3    16.3 .    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16989    popcorn    DATABASE     z   CREATE DATABASE popcorn WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE popcorn;
                popcorn_admin    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    17014    calificaciones    TABLE     �   CREATE TABLE public.calificaciones (
    id integer NOT NULL,
    valoracion integer NOT NULL,
    usuario_id integer,
    pelicula_serie_id integer
);
 "   DROP TABLE public.calificaciones;
       public         heap    postgres    false    4            �            1259    17013    calificaciones_id_seq    SEQUENCE     �   CREATE SEQUENCE public.calificaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.calificaciones_id_seq;
       public          postgres    false    4    220            �           0    0    calificaciones_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.calificaciones_id_seq OWNED BY public.calificaciones.id;
          public          postgres    false    219            �            1259    17031    comentarios    TABLE     �   CREATE TABLE public.comentarios (
    id integer NOT NULL,
    comentario text,
    fecha date,
    usuario_id integer,
    pelicula_serie_id integer
);
    DROP TABLE public.comentarios;
       public         heap    postgres    false    4            �            1259    17030    comentarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comentarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.comentarios_id_seq;
       public          postgres    false    4    222            �           0    0    comentarios_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.comentarios_id_seq OWNED BY public.comentarios.id;
          public          postgres    false    221            �            1259    17050 	   peliculas    TABLE     �   CREATE TABLE public.peliculas (
    id integer NOT NULL,
    titulo character varying(255) NOT NULL,
    descripcion text NOT NULL,
    fecha_publicacion date NOT NULL,
    moderador_id integer NOT NULL,
    imagen character varying(255)
);
    DROP TABLE public.peliculas;
       public         heap    popcorn_admin    false    4            �            1259    17049    peliculas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.peliculas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.peliculas_id_seq;
       public          popcorn_admin    false    4    224            �           0    0    peliculas_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.peliculas_id_seq OWNED BY public.peliculas.id;
          public          popcorn_admin    false    223            �            1259    17000    peliculas_series    TABLE     �   CREATE TABLE public.peliculas_series (
    id integer NOT NULL,
    titulo character varying(255) NOT NULL,
    descripcion text,
    fecha_publicacion date,
    moderador_id integer
);
 $   DROP TABLE public.peliculas_series;
       public         heap    postgres    false    4            �            1259    16999    peliculas_series_id_seq    SEQUENCE     �   CREATE SEQUENCE public.peliculas_series_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.peliculas_series_id_seq;
       public          postgres    false    4    218            �           0    0    peliculas_series_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.peliculas_series_id_seq OWNED BY public.peliculas_series.id;
          public          postgres    false    217            �            1259    16991    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre_usuario character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    "contraseña" character varying(255) NOT NULL,
    tipo_usuario character varying(50) NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false    4            �            1259    16990    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public          postgres    false    216    4            �           0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public          postgres    false    215            0           2604    17017    calificaciones id    DEFAULT     v   ALTER TABLE ONLY public.calificaciones ALTER COLUMN id SET DEFAULT nextval('public.calificaciones_id_seq'::regclass);
 @   ALTER TABLE public.calificaciones ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            1           2604    17034    comentarios id    DEFAULT     p   ALTER TABLE ONLY public.comentarios ALTER COLUMN id SET DEFAULT nextval('public.comentarios_id_seq'::regclass);
 =   ALTER TABLE public.comentarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            2           2604    17053    peliculas id    DEFAULT     l   ALTER TABLE ONLY public.peliculas ALTER COLUMN id SET DEFAULT nextval('public.peliculas_id_seq'::regclass);
 ;   ALTER TABLE public.peliculas ALTER COLUMN id DROP DEFAULT;
       public          popcorn_admin    false    223    224    224            /           2604    17003    peliculas_series id    DEFAULT     z   ALTER TABLE ONLY public.peliculas_series ALTER COLUMN id SET DEFAULT nextval('public.peliculas_series_id_seq'::regclass);
 B   ALTER TABLE public.peliculas_series ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            .           2604    16994    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    17014    calificaciones 
   TABLE DATA           W   COPY public.calificaciones (id, valoracion, usuario_id, pelicula_serie_id) FROM stdin;
    public          postgres    false    220   �5       �          0    17031    comentarios 
   TABLE DATA           [   COPY public.comentarios (id, comentario, fecha, usuario_id, pelicula_serie_id) FROM stdin;
    public          postgres    false    222   �5       �          0    17050 	   peliculas 
   TABLE DATA           e   COPY public.peliculas (id, titulo, descripcion, fecha_publicacion, moderador_id, imagen) FROM stdin;
    public          popcorn_admin    false    224   �5       �          0    17000    peliculas_series 
   TABLE DATA           d   COPY public.peliculas_series (id, titulo, descripcion, fecha_publicacion, moderador_id) FROM stdin;
    public          postgres    false    218   �5       �          0    16991    usuarios 
   TABLE DATA           Z   COPY public.usuarios (id, nombre_usuario, email, "contraseña", tipo_usuario) FROM stdin;
    public          postgres    false    216   6       �           0    0    calificaciones_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.calificaciones_id_seq', 1, false);
          public          postgres    false    219            �           0    0    comentarios_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.comentarios_id_seq', 1, false);
          public          postgres    false    221            �           0    0    peliculas_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.peliculas_id_seq', 1, false);
          public          popcorn_admin    false    223            �           0    0    peliculas_series_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.peliculas_series_id_seq', 1, false);
          public          postgres    false    217            �           0    0    usuarios_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuarios_id_seq', 6, true);
          public          postgres    false    215            8           2606    17019 "   calificaciones calificaciones_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificaciones_pkey;
       public            postgres    false    220            :           2606    17038    comentarios comentarios_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.comentarios DROP CONSTRAINT comentarios_pkey;
       public            postgres    false    222            <           2606    17057    peliculas peliculas_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.peliculas
    ADD CONSTRAINT peliculas_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.peliculas DROP CONSTRAINT peliculas_pkey;
       public            popcorn_admin    false    224            6           2606    17007 &   peliculas_series peliculas_series_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.peliculas_series
    ADD CONSTRAINT peliculas_series_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.peliculas_series DROP CONSTRAINT peliculas_series_pkey;
       public            postgres    false    218            4           2606    16998    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    216            >           2606    17025 4   calificaciones calificaciones_pelicula_serie_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_pelicula_serie_id_fkey FOREIGN KEY (pelicula_serie_id) REFERENCES public.peliculas_series(id);
 ^   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificaciones_pelicula_serie_id_fkey;
       public          postgres    false    218    4662    220            ?           2606    17020 -   calificaciones calificaciones_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);
 W   ALTER TABLE ONLY public.calificaciones DROP CONSTRAINT calificaciones_usuario_id_fkey;
       public          postgres    false    4660    216    220            @           2606    17044 .   comentarios comentarios_pelicula_serie_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_pelicula_serie_id_fkey FOREIGN KEY (pelicula_serie_id) REFERENCES public.peliculas_series(id);
 X   ALTER TABLE ONLY public.comentarios DROP CONSTRAINT comentarios_pelicula_serie_id_fkey;
       public          postgres    false    218    4662    222            A           2606    17039 '   comentarios comentarios_usuario_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);
 Q   ALTER TABLE ONLY public.comentarios DROP CONSTRAINT comentarios_usuario_id_fkey;
       public          postgres    false    4660    216    222            =           2606    17008 3   peliculas_series peliculas_series_moderador_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.peliculas_series
    ADD CONSTRAINT peliculas_series_moderador_id_fkey FOREIGN KEY (moderador_id) REFERENCES public.usuarios(id);
 ]   ALTER TABLE ONLY public.peliculas_series DROP CONSTRAINT peliculas_series_moderador_id_fkey;
       public          postgres    false    4660    218    216            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �     x���Ao�1�����y��$Nv���&�8 !��vhQ����ݯ'�Eb.��X��qr7��E������Z��~1<�'2�M62���Sr�i:��ի۫�/t������O3�,�s�JQ+�Ĺ�����Qqd��+�KEb�k�U�V�%��}�L�Xt^�UR֜K��XT��.��֎�S7y��x(�Ű�+��Aĺl6��Q'�ٖ{-�C� �g���v�__6�ߟ�|���h��rof�UWdk��S�j � ��Sr�	�q�¾��}wP�sE4���Z��x�(�W��5d'	t�(i�RJţ�0�c�s��|G^q����n���m�X^ϸxd�a���q̱0��;�dM[h5ZҌ�Qz,=OR3�D�)WE�`5b��F������H�Pcl�/�)GN-D棈x�w�u���q���_	r��O��|w+�0�n���c�������V����Y-�1��Bw75Ua�	��R���)Y�='�k
Ijo
	�,1B��B�է�S�I�(���t:���
4     