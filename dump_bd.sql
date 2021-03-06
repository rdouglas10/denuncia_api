toc.dat                                                                                             0000600 0004000 0002000 00000017050 13635303253 0014445 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       +                     x            denuncias_api    9.6.2    12.2     v	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         w	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         x	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         y	           1262    25867    denuncias_api    DATABASE     k   CREATE DATABASE denuncias_api WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE denuncias_api;
                postgres    false         �            1259    25920    ar_internal_metadata    TABLE     �   CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);
 (   DROP TABLE public.ar_internal_metadata;
       public            postgres    false         �            1259    25942    denunciations    TABLE     d  CREATE TABLE public.denunciations (
    id bigint NOT NULL,
    descricao character varying,
    status character varying,
    latitude character varying,
    longitude character varying,
    user_id bigint NOT NULL,
    medida_adotada text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);
 !   DROP TABLE public.denunciations;
       public            postgres    false         �            1259    25940    denunciations_id_seq    SEQUENCE     }   CREATE SEQUENCE public.denunciations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.denunciations_id_seq;
       public          postgres    false    190         z	           0    0    denunciations_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.denunciations_id_seq OWNED BY public.denunciations.id;
          public          postgres    false    189         �            1259    25912    schema_migrations    TABLE     R   CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public            postgres    false         �            1259    25930    users    TABLE     �  CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    username character varying,
    email character varying,
    password_digest character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    token_access character varying
);
    DROP TABLE public.users;
       public            postgres    false         �            1259    25928    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    188         {	           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    187         �           2604    25945    denunciations id    DEFAULT     t   ALTER TABLE ONLY public.denunciations ALTER COLUMN id SET DEFAULT nextval('public.denunciations_id_seq'::regclass);
 ?   ALTER TABLE public.denunciations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    190    189    190         �           2604    25933    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    188    187    188         o	          0    25920    ar_internal_metadata 
   TABLE DATA           R   COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
    public          postgres    false    186       2415.dat s	          0    25942    denunciations 
   TABLE DATA           �   COPY public.denunciations (id, descricao, status, latitude, longitude, user_id, medida_adotada, created_at, updated_at) FROM stdin;
    public          postgres    false    190       2419.dat n	          0    25912    schema_migrations 
   TABLE DATA           4   COPY public.schema_migrations (version) FROM stdin;
    public          postgres    false    185       2414.dat q	          0    25930    users 
   TABLE DATA           �   COPY public.users (id, name, username, email, password_digest, created_at, updated_at, reset_password_token, reset_password_sent_at, token_access) FROM stdin;
    public          postgres    false    188       2417.dat |	           0    0    denunciations_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.denunciations_id_seq', 21, true);
          public          postgres    false    189         }	           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 5, true);
          public          postgres    false    187         �           2606    25927 .   ar_internal_metadata ar_internal_metadata_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);
 X   ALTER TABLE ONLY public.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
       public            postgres    false    186         �           2606    25950     denunciations denunciations_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.denunciations
    ADD CONSTRAINT denunciations_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.denunciations DROP CONSTRAINT denunciations_pkey;
       public            postgres    false    190         �           2606    25919 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public            postgres    false    185         �           2606    25938    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    188         �           1259    25956    index_denunciations_on_user_id    INDEX     [   CREATE INDEX index_denunciations_on_user_id ON public.denunciations USING btree (user_id);
 2   DROP INDEX public.index_denunciations_on_user_id;
       public            postgres    false    190         �           2606    25951 !   denunciations fk_rails_169d0f539a    FK CONSTRAINT     �   ALTER TABLE ONLY public.denunciations
    ADD CONSTRAINT fk_rails_169d0f539a FOREIGN KEY (user_id) REFERENCES public.users(id);
 K   ALTER TABLE ONLY public.denunciations DROP CONSTRAINT fk_rails_169d0f539a;
       public          postgres    false    188    2292    190                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                2415.dat                                                                                            0000600 0004000 0002000 00000000123 13635303253 0014244 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        environment	development	2020-03-20 02:06:18.855931	2020-03-20 02:06:18.855931
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                             2419.dat                                                                                            0000600 0004000 0002000 00000003446 13635303253 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3	Test description one	Pendent	22º 55	34º 43	5	adopted measure number one	2020-03-20 22:14:55.610337	2020-03-20 22:14:55.610337
4	Test description one	Pendent	22º 55	34º 43	5	adopted measure number one	2020-03-20 22:15:38.345945	2020-03-20 22:15:38.345945
5	Test description one	Pendent	22º 55	34º 43	5	adopted measure number one	2020-03-20 22:16:13.843877	2020-03-20 22:16:13.843877
6	Test description one	Pendent	22º 55	34º 43	1	adopted measure number one	2020-03-20 22:17:05.398159	2020-03-20 22:17:05.398159
7	Test description one	Pendent	22º 55	34º 43	5	adopted measure number one	2020-03-20 22:18:08.76845	2020-03-20 22:18:08.76845
8	Test description one	Pendent	22º 55	34º 43	2	adopted measure number one	2020-03-20 22:18:16.559778	2020-03-20 22:18:16.559778
9	Test description ten	Pendent	22º 55	34º 43	3	adopted measure number one	2020-03-20 22:49:41.001144	2020-03-20 22:49:41.001144
10	Test description ten	Pendent	22º 55	34º 43	3	adopted measure number one	2020-03-20 22:55:31.546957	2020-03-20 22:55:31.546957
11	Test description ten	Pendent	22º 55	34º 43	3	adopted measure number one	2020-03-20 22:56:01.613289	2020-03-20 22:56:01.613289
12	Test description ten	Pendent	22º 55	34º 43	1	adopted measure number one	2020-03-20 23:04:32.837823	2020-03-20 23:04:32.837823
13	Test description ten	Pendent	22º 55	34º 43	1	adopted measure number one	2020-03-20 23:04:49.409283	2020-03-20 23:04:49.409283
14	Test description ten	Pendent	22º 55	34º 43	1	adopted measure number one	2020-03-20 23:05:01.348911	2020-03-20 23:05:01.348911
15	Test description ten	Pendent	22º 55	34º 43	1	adopted measure number one	2020-03-20 23:05:09.930933	2020-03-20 23:05:09.930933
16	Test description ten	Pendent	22º 55	34º 43	1	adopted measure number one	2020-03-20 23:06:50.475516	2020-03-20 23:06:50.475516
\.


                                                                                                                                                                                                                          2414.dat                                                                                            0000600 0004000 0002000 00000000101 13635303253 0014237 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        20200320014552
20200320030622
20200320054543
20200320185647
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                               2417.dat                                                                                            0000600 0004000 0002000 00000002334 13635303253 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	Takarintu	taka	tkrt@gmail.com	$2a$12$CzODTXz4xZVStGnbjyBGx.XnV/axYdxy19BSeKLKc4eBvzZp6jLZ.	2020-03-20 18:47:48.754869	2020-03-20 18:47:48.754869	\N	\N	\N
5	Aristide	aris	arist@gmail.com	$2a$12$BYu.2Mr08Mce0pHYuI4R2erwd.XacNYdwuj6yS4YBXOjDRSeFYGc6	2020-03-20 19:06:53.473739	2020-03-20 20:13:03.452284	\N	\N	eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE1ODQ4MTc2Mzl9.AM6Wx5H8xedmDMQGchkBviGISaOwt6QNpyiiu1KS_P0
1	Primeiro Usuário	teste123	randersondouglas.r@gmail.com	$2a$12$TQs8t1TApb.0ooBCcOa2veYFPZr.gEOFgLcwOsPIrWD7kkIQHhoeW	2020-03-20 02:10:41.759305	2020-03-20 18:44:40.145162	25fd876fd46269662471	2020-03-20 05:01:06.041181	eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE1ODQ4MTc2Mzl9.AM6Wx5H8xedmDMQGchkBviGISaOwt6QNpyiiu1KS_P0
2	segundo Usuário	teste	teste@gmail.com	$2a$12$qLYCyVVqnCrpr5SYnx60F.3KWeIPLDT7dzBk2atFyoNXzAYt0TdWO	2020-03-20 04:21:06.1074	2020-03-20 20:03:08.58191	31eaa05a038eabbe3ead	2020-03-20 05:01:30.270693	eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE1ODQ4MTc2Mzl9.AM6Wx5H8xedmDMQGchkBviGISaOwt6QNpyiiu1KS_P0
3	Terceiro Usuário	Irene	Irene@gmail.com	$2a$12$T9aaItJGLd..o0csAlrW..t/.inOfk1p1TS22MvZyoDqzBQpZDwM.	2020-03-20 04:23:41.011098	2020-03-20 05:35:33.364699	\N	2020-03-20 05:27:33.939345	\N
\.


                                                                                                                                                                                                                                                                                                    restore.sql                                                                                         0000600 0004000 0002000 00000015447 13635303253 0015402 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 12.2

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

DROP DATABASE denuncias_api;
--
-- Name: denuncias_api; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE denuncias_api WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE denuncias_api OWNER TO postgres;

\connect denuncias_api

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

SET default_tablespace = '';

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: denunciations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.denunciations (
    id bigint NOT NULL,
    descricao character varying,
    status character varying,
    latitude character varying,
    longitude character varying,
    user_id bigint NOT NULL,
    medida_adotada text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.denunciations OWNER TO postgres;

--
-- Name: denunciations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.denunciations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.denunciations_id_seq OWNER TO postgres;

--
-- Name: denunciations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.denunciations_id_seq OWNED BY public.denunciations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying,
    username character varying,
    email character varying,
    password_digest character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    token_access character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: denunciations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.denunciations ALTER COLUMN id SET DEFAULT nextval('public.denunciations_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
\.
COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM '$$PATH$$/2415.dat';

--
-- Data for Name: denunciations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.denunciations (id, descricao, status, latitude, longitude, user_id, medida_adotada, created_at, updated_at) FROM stdin;
\.
COPY public.denunciations (id, descricao, status, latitude, longitude, user_id, medida_adotada, created_at, updated_at) FROM '$$PATH$$/2419.dat';

--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
\.
COPY public.schema_migrations (version) FROM '$$PATH$$/2414.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, username, email, password_digest, created_at, updated_at, reset_password_token, reset_password_sent_at, token_access) FROM stdin;
\.
COPY public.users (id, name, username, email, password_digest, created_at, updated_at, reset_password_token, reset_password_sent_at, token_access) FROM '$$PATH$$/2417.dat';

--
-- Name: denunciations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.denunciations_id_seq', 21, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: denunciations denunciations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.denunciations
    ADD CONSTRAINT denunciations_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_denunciations_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_denunciations_on_user_id ON public.denunciations USING btree (user_id);


--
-- Name: denunciations fk_rails_169d0f539a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.denunciations
    ADD CONSTRAINT fk_rails_169d0f539a FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         