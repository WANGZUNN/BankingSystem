toc.dat                                                                                             0000600 0004000 0002000 00000033412 14636610062 0014446 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       -                |            SRBank    16.3    16.3 )               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    25350    SRBank    DATABASE     �   CREATE DATABASE "SRBank" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "SRBank";
                postgres    false         �            1259    25361    customer_cif    TABLE     m  CREATE TABLE public.customer_cif (
    cif_number integer NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(20) NOT NULL,
    gender character(1) NOT NULL,
    dob date NOT NULL,
    nid character varying(9) NOT NULL,
    employment character varying(100),
    source_of_fund character varying(100),
    phone_number character varying(10) NOT NULL,
    district character varying(30) NOT NULL,
    province_city character varying(30) NOT NULL,
    street character varying(20),
    house character varying(20),
    created_on date DEFAULT CURRENT_TIMESTAMP,
    staff_id integer
);
     DROP TABLE public.customer_cif;
       public         heap    postgres    false         �            1259    25360    customer_cif_cif_number_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_cif_cif_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.customer_cif_cif_number_seq;
       public          postgres    false    218                    0    0    customer_cif_cif_number_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.customer_cif_cif_number_seq OWNED BY public.customer_cif.cif_number;
          public          postgres    false    217         �            1259    25394    loan_account    TABLE     �  CREATE TABLE public.loan_account (
    loan_account_id integer NOT NULL,
    loan_account_number bigint,
    cif_number integer,
    interest numeric(5,2) NOT NULL,
    amount numeric(10,4) NOT NULL,
    outstanding numeric(9,4) NOT NULL,
    term integer,
    staff_id integer,
    created_on date DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT loan_account_term_check CHECK ((term <= 120))
);
     DROP TABLE public.loan_account;
       public         heap    postgres    false         �            1259    25393     loan_account_loan_account_id_seq    SEQUENCE     �   CREATE SEQUENCE public.loan_account_loan_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.loan_account_loan_account_id_seq;
       public          postgres    false    222                    0    0     loan_account_loan_account_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.loan_account_loan_account_id_seq OWNED BY public.loan_account.loan_account_id;
          public          postgres    false    221         �            1259    25374    saving_account    TABLE       CREATE TABLE public.saving_account (
    saving_account_id integer NOT NULL,
    saving_account_number bigint,
    cif_number integer,
    interest numeric(5,2) NOT NULL,
    balance numeric(19,4) NOT NULL,
    staff_id integer,
    created_on date DEFAULT CURRENT_TIMESTAMP
);
 "   DROP TABLE public.saving_account;
       public         heap    postgres    false         �            1259    25373 $   saving_account_saving_account_id_seq    SEQUENCE     �   CREATE SEQUENCE public.saving_account_saving_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.saving_account_saving_account_id_seq;
       public          postgres    false    220                    0    0 $   saving_account_saving_account_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.saving_account_saving_account_id_seq OWNED BY public.saving_account.saving_account_id;
          public          postgres    false    219         �            1259    25352    staff    TABLE     �  CREATE TABLE public.staff (
    staff_id integer NOT NULL,
    username character varying(50) NOT NULL,
    password_hash character varying(255) NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(20) NOT NULL,
    phone_number character varying(10) NOT NULL,
    role character varying(50) DEFAULT 'Not yet Assign'::character varying NOT NULL
);
    DROP TABLE public.staff;
       public         heap    postgres    false         �            1259    25351    staff_staff_id_seq    SEQUENCE     �   CREATE SEQUENCE public.staff_staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.staff_staff_id_seq;
       public          postgres    false    216                    0    0    staff_staff_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.staff_staff_id_seq OWNED BY public.staff.staff_id;
          public          postgres    false    215         a           2604    25364    customer_cif cif_number    DEFAULT     �   ALTER TABLE ONLY public.customer_cif ALTER COLUMN cif_number SET DEFAULT nextval('public.customer_cif_cif_number_seq'::regclass);
 F   ALTER TABLE public.customer_cif ALTER COLUMN cif_number DROP DEFAULT;
       public          postgres    false    218    217    218         e           2604    25397    loan_account loan_account_id    DEFAULT     �   ALTER TABLE ONLY public.loan_account ALTER COLUMN loan_account_id SET DEFAULT nextval('public.loan_account_loan_account_id_seq'::regclass);
 K   ALTER TABLE public.loan_account ALTER COLUMN loan_account_id DROP DEFAULT;
       public          postgres    false    222    221    222         c           2604    25377     saving_account saving_account_id    DEFAULT     �   ALTER TABLE ONLY public.saving_account ALTER COLUMN saving_account_id SET DEFAULT nextval('public.saving_account_saving_account_id_seq'::regclass);
 O   ALTER TABLE public.saving_account ALTER COLUMN saving_account_id DROP DEFAULT;
       public          postgres    false    219    220    220         _           2604    25355    staff staff_id    DEFAULT     p   ALTER TABLE ONLY public.staff ALTER COLUMN staff_id SET DEFAULT nextval('public.staff_staff_id_seq'::regclass);
 =   ALTER TABLE public.staff ALTER COLUMN staff_id DROP DEFAULT;
       public          postgres    false    216    215    216                   0    25361    customer_cif 
   TABLE DATA           �   COPY public.customer_cif (cif_number, first_name, last_name, gender, dob, nid, employment, source_of_fund, phone_number, district, province_city, street, house, created_on, staff_id) FROM stdin;
    public          postgres    false    218       4879.dat           0    25394    loan_account 
   TABLE DATA           �   COPY public.loan_account (loan_account_id, loan_account_number, cif_number, interest, amount, outstanding, term, staff_id, created_on) FROM stdin;
    public          postgres    false    222       4883.dat           0    25374    saving_account 
   TABLE DATA           �   COPY public.saving_account (saving_account_id, saving_account_number, cif_number, interest, balance, staff_id, created_on) FROM stdin;
    public          postgres    false    220       4881.dat           0    25352    staff 
   TABLE DATA           m   COPY public.staff (staff_id, username, password_hash, first_name, last_name, phone_number, role) FROM stdin;
    public          postgres    false    216       4877.dat            0    0    customer_cif_cif_number_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.customer_cif_cif_number_seq', 13, true);
          public          postgres    false    217                    0    0     loan_account_loan_account_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.loan_account_loan_account_id_seq', 4, true);
          public          postgres    false    221                     0    0 $   saving_account_saving_account_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.saving_account_saving_account_id_seq', 4, true);
          public          postgres    false    219         !           0    0    staff_staff_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.staff_staff_id_seq', 13, true);
          public          postgres    false    215         m           2606    25367    customer_cif customer_cif_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.customer_cif
    ADD CONSTRAINT customer_cif_pkey PRIMARY KEY (cif_number);
 H   ALTER TABLE ONLY public.customer_cif DROP CONSTRAINT customer_cif_pkey;
       public            postgres    false    218         u           2606    25403 1   loan_account loan_account_loan_account_number_key 
   CONSTRAINT     {   ALTER TABLE ONLY public.loan_account
    ADD CONSTRAINT loan_account_loan_account_number_key UNIQUE (loan_account_number);
 [   ALTER TABLE ONLY public.loan_account DROP CONSTRAINT loan_account_loan_account_number_key;
       public            postgres    false    222         w           2606    25401    loan_account loan_account_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.loan_account
    ADD CONSTRAINT loan_account_pkey PRIMARY KEY (loan_account_id);
 H   ALTER TABLE ONLY public.loan_account DROP CONSTRAINT loan_account_pkey;
       public            postgres    false    222         o           2606    25380 "   saving_account saving_account_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.saving_account
    ADD CONSTRAINT saving_account_pkey PRIMARY KEY (saving_account_id);
 L   ALTER TABLE ONLY public.saving_account DROP CONSTRAINT saving_account_pkey;
       public            postgres    false    220         q           2606    25382 7   saving_account saving_account_saving_account_number_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.saving_account
    ADD CONSTRAINT saving_account_saving_account_number_key UNIQUE (saving_account_number);
 a   ALTER TABLE ONLY public.saving_account DROP CONSTRAINT saving_account_saving_account_number_key;
       public            postgres    false    220         i           2606    25357    staff staff_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staff_id);
 :   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_pkey;
       public            postgres    false    216         k           2606    25359    staff staff_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_username_key;
       public            postgres    false    216         s           2606    33614 .   saving_account uq_unique_saving_account_number 
   CONSTRAINT     z   ALTER TABLE ONLY public.saving_account
    ADD CONSTRAINT uq_unique_saving_account_number UNIQUE (saving_account_number);
 X   ALTER TABLE ONLY public.saving_account DROP CONSTRAINT uq_unique_saving_account_number;
       public            postgres    false    220         x           2606    25368 '   customer_cif customer_cif_staff_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_cif
    ADD CONSTRAINT customer_cif_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.staff(staff_id);
 Q   ALTER TABLE ONLY public.customer_cif DROP CONSTRAINT customer_cif_staff_id_fkey;
       public          postgres    false    218    216    4713         {           2606    25409 )   loan_account loan_account_cif_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.loan_account
    ADD CONSTRAINT loan_account_cif_number_fkey FOREIGN KEY (cif_number) REFERENCES public.customer_cif(cif_number);
 S   ALTER TABLE ONLY public.loan_account DROP CONSTRAINT loan_account_cif_number_fkey;
       public          postgres    false    222    4717    218         |           2606    25404 '   loan_account loan_account_staff_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.loan_account
    ADD CONSTRAINT loan_account_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.staff(staff_id);
 Q   ALTER TABLE ONLY public.loan_account DROP CONSTRAINT loan_account_staff_id_fkey;
       public          postgres    false    4713    222    216         y           2606    25388 -   saving_account saving_account_cif_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.saving_account
    ADD CONSTRAINT saving_account_cif_number_fkey FOREIGN KEY (cif_number) REFERENCES public.customer_cif(cif_number);
 W   ALTER TABLE ONLY public.saving_account DROP CONSTRAINT saving_account_cif_number_fkey;
       public          postgres    false    220    4717    218         z           2606    25383 +   saving_account saving_account_staff_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.saving_account
    ADD CONSTRAINT saving_account_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.staff(staff_id);
 U   ALTER TABLE ONLY public.saving_account DROP CONSTRAINT saving_account_staff_id_fkey;
       public          postgres    false    220    216    4713                                                                                                                                                                                                                                                              4879.dat                                                                                            0000600 0004000 0002000 00000000005 14636610062 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4883.dat                                                                                            0000600 0004000 0002000 00000000005 14636610062 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4881.dat                                                                                            0000600 0004000 0002000 00000000005 14636610062 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           4877.dat                                                                                            0000600 0004000 0002000 00000001256 14636610062 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3	darith	darith123@	Chan	Darith	093545692	Branch Manager
6	chanthy	chanthy123@	Sok	Chanthy	012654585	Personal Banker
7	srun	srun123@	Veng	Srun	086525220	Deputy Branch Manager
8	bopha	bopha123@	Vanny	Bopha	010345489	Teller
9	thida	thida123@	Mongkol	Thida	0885236789	Teller
10	channy	channy123@	Ly	Channy	016458569	Senior Personal Banker
2	Panha	panha123@	Chhun	Panha	012323295	Lending Manager
4	dara	dara123@	Kit	Dara	086959502	Lending Manager
5	Koing	koing123@	Haing	Mengkoing	086755502	Lending Manager
11	amara	amara123@	Amara	Ek	088288288	Supervisor Lending Manager
12	leap	leap123@	Ly	Sreyleap	015154525	Supervisor Teller
13	chenda	chenda123@	Tri	Chenda	010859563	Senoir Teller
\.


                                                                                                                                                                                                                                                                                                                                                  restore.sql                                                                                         0000600 0004000 0002000 00000027016 14636610062 0015376 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
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

DROP DATABASE "SRBank";
--
-- Name: SRBank; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "SRBank" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "SRBank" OWNER TO postgres;

\connect "SRBank"

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

SET default_table_access_method = heap;

--
-- Name: customer_cif; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_cif (
    cif_number integer NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(20) NOT NULL,
    gender character(1) NOT NULL,
    dob date NOT NULL,
    nid character varying(9) NOT NULL,
    employment character varying(100),
    source_of_fund character varying(100),
    phone_number character varying(10) NOT NULL,
    district character varying(30) NOT NULL,
    province_city character varying(30) NOT NULL,
    street character varying(20),
    house character varying(20),
    created_on date DEFAULT CURRENT_TIMESTAMP,
    staff_id integer
);


ALTER TABLE public.customer_cif OWNER TO postgres;

--
-- Name: customer_cif_cif_number_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_cif_cif_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_cif_cif_number_seq OWNER TO postgres;

--
-- Name: customer_cif_cif_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_cif_cif_number_seq OWNED BY public.customer_cif.cif_number;


--
-- Name: loan_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loan_account (
    loan_account_id integer NOT NULL,
    loan_account_number bigint,
    cif_number integer,
    interest numeric(5,2) NOT NULL,
    amount numeric(10,4) NOT NULL,
    outstanding numeric(9,4) NOT NULL,
    term integer,
    staff_id integer,
    created_on date DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT loan_account_term_check CHECK ((term <= 120))
);


ALTER TABLE public.loan_account OWNER TO postgres;

--
-- Name: loan_account_loan_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loan_account_loan_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.loan_account_loan_account_id_seq OWNER TO postgres;

--
-- Name: loan_account_loan_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loan_account_loan_account_id_seq OWNED BY public.loan_account.loan_account_id;


--
-- Name: saving_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.saving_account (
    saving_account_id integer NOT NULL,
    saving_account_number bigint,
    cif_number integer,
    interest numeric(5,2) NOT NULL,
    balance numeric(19,4) NOT NULL,
    staff_id integer,
    created_on date DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.saving_account OWNER TO postgres;

--
-- Name: saving_account_saving_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.saving_account_saving_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.saving_account_saving_account_id_seq OWNER TO postgres;

--
-- Name: saving_account_saving_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.saving_account_saving_account_id_seq OWNED BY public.saving_account.saving_account_id;


--
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    staff_id integer NOT NULL,
    username character varying(50) NOT NULL,
    password_hash character varying(255) NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(20) NOT NULL,
    phone_number character varying(10) NOT NULL,
    role character varying(50) DEFAULT 'Not yet Assign'::character varying NOT NULL
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- Name: staff_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.staff_staff_id_seq OWNER TO postgres;

--
-- Name: staff_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_staff_id_seq OWNED BY public.staff.staff_id;


--
-- Name: customer_cif cif_number; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_cif ALTER COLUMN cif_number SET DEFAULT nextval('public.customer_cif_cif_number_seq'::regclass);


--
-- Name: loan_account loan_account_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_account ALTER COLUMN loan_account_id SET DEFAULT nextval('public.loan_account_loan_account_id_seq'::regclass);


--
-- Name: saving_account saving_account_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saving_account ALTER COLUMN saving_account_id SET DEFAULT nextval('public.saving_account_saving_account_id_seq'::regclass);


--
-- Name: staff staff_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff ALTER COLUMN staff_id SET DEFAULT nextval('public.staff_staff_id_seq'::regclass);


--
-- Data for Name: customer_cif; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_cif (cif_number, first_name, last_name, gender, dob, nid, employment, source_of_fund, phone_number, district, province_city, street, house, created_on, staff_id) FROM stdin;
\.
COPY public.customer_cif (cif_number, first_name, last_name, gender, dob, nid, employment, source_of_fund, phone_number, district, province_city, street, house, created_on, staff_id) FROM '$$PATH$$/4879.dat';

--
-- Data for Name: loan_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loan_account (loan_account_id, loan_account_number, cif_number, interest, amount, outstanding, term, staff_id, created_on) FROM stdin;
\.
COPY public.loan_account (loan_account_id, loan_account_number, cif_number, interest, amount, outstanding, term, staff_id, created_on) FROM '$$PATH$$/4883.dat';

--
-- Data for Name: saving_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.saving_account (saving_account_id, saving_account_number, cif_number, interest, balance, staff_id, created_on) FROM stdin;
\.
COPY public.saving_account (saving_account_id, saving_account_number, cif_number, interest, balance, staff_id, created_on) FROM '$$PATH$$/4881.dat';

--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (staff_id, username, password_hash, first_name, last_name, phone_number, role) FROM stdin;
\.
COPY public.staff (staff_id, username, password_hash, first_name, last_name, phone_number, role) FROM '$$PATH$$/4877.dat';

--
-- Name: customer_cif_cif_number_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_cif_cif_number_seq', 13, true);


--
-- Name: loan_account_loan_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loan_account_loan_account_id_seq', 4, true);


--
-- Name: saving_account_saving_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.saving_account_saving_account_id_seq', 4, true);


--
-- Name: staff_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_staff_id_seq', 13, true);


--
-- Name: customer_cif customer_cif_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_cif
    ADD CONSTRAINT customer_cif_pkey PRIMARY KEY (cif_number);


--
-- Name: loan_account loan_account_loan_account_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_account
    ADD CONSTRAINT loan_account_loan_account_number_key UNIQUE (loan_account_number);


--
-- Name: loan_account loan_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_account
    ADD CONSTRAINT loan_account_pkey PRIMARY KEY (loan_account_id);


--
-- Name: saving_account saving_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saving_account
    ADD CONSTRAINT saving_account_pkey PRIMARY KEY (saving_account_id);


--
-- Name: saving_account saving_account_saving_account_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saving_account
    ADD CONSTRAINT saving_account_saving_account_number_key UNIQUE (saving_account_number);


--
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staff_id);


--
-- Name: staff staff_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_username_key UNIQUE (username);


--
-- Name: saving_account uq_unique_saving_account_number; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saving_account
    ADD CONSTRAINT uq_unique_saving_account_number UNIQUE (saving_account_number);


--
-- Name: customer_cif customer_cif_staff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_cif
    ADD CONSTRAINT customer_cif_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.staff(staff_id);


--
-- Name: loan_account loan_account_cif_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_account
    ADD CONSTRAINT loan_account_cif_number_fkey FOREIGN KEY (cif_number) REFERENCES public.customer_cif(cif_number);


--
-- Name: loan_account loan_account_staff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_account
    ADD CONSTRAINT loan_account_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.staff(staff_id);


--
-- Name: saving_account saving_account_cif_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saving_account
    ADD CONSTRAINT saving_account_cif_number_fkey FOREIGN KEY (cif_number) REFERENCES public.customer_cif(cif_number);


--
-- Name: saving_account saving_account_staff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.saving_account
    ADD CONSTRAINT saving_account_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.staff(staff_id);


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  