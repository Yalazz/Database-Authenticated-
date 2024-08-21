--
-- PostgreSQL database cluster dump
--

-- Started on 2024-08-21 17:00:16

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:nMDq3tnKU0/FNw4RK/ryMA==$Z4KFQeKVr0QjIVDzBd+STUwx2UBksPNLPsW2u3aXRVA=:OoDOq+yhFdxBIy/4Z2E7cNOrDGsAloVaH/knzR2izcI=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-08-21 17:00:16

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

-- Completed on 2024-08-21 17:00:17

--
-- PostgreSQL database dump complete
--

--
-- Database "CarsDB" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-08-21 17:00:17

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
-- TOC entry 4815 (class 1262 OID 16533)
-- Name: CarsDB; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "CarsDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "CarsDB" OWNER TO postgres;

\connect "CarsDB"

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
-- TOC entry 215 (class 1259 OID 16534)
-- Name: Cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Cars" (
    id integer NOT NULL,
    model text,
    make text,
    color text,
    year integer,
    doors smallint
);


ALTER TABLE public."Cars" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16541)
-- Name: Cars_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Cars" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Cars_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 16550)
-- Name: cars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cars (
    id integer NOT NULL,
    model character varying(50),
    year integer,
    doors integer
);


ALTER TABLE public.cars OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16549)
-- Name: cars_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cars_id_seq OWNER TO postgres;

--
-- TOC entry 4816 (class 0 OID 0)
-- Dependencies: 218
-- Name: cars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cars_id_seq OWNED BY public.cars.id;


--
-- TOC entry 217 (class 1259 OID 16542)
-- Name: random; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.random (
    id integer,
    name text
)
INHERITS (public."Cars");


ALTER TABLE public.random OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16557)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16556)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4817 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4648 (class 2604 OID 16553)
-- Name: cars id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars ALTER COLUMN id SET DEFAULT nextval('public.cars_id_seq'::regclass);


--
-- TOC entry 4649 (class 2604 OID 16560)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4803 (class 0 OID 16534)
-- Dependencies: 215
-- Data for Name: Cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Cars" (id, model, make, color, year, doors) FROM stdin;
9	Kruvasan	Krema	Purple	2006	5
16	test2	Tır	Gri	1881	9
\.


--
-- TOC entry 4807 (class 0 OID 16550)
-- Dependencies: 219
-- Data for Name: cars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cars (id, model, year, doors) FROM stdin;
\.


--
-- TOC entry 4805 (class 0 OID 16542)
-- Dependencies: 217
-- Data for Name: random; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.random (id, model, make, color, year, doors, name) FROM stdin;
\.


--
-- TOC entry 4809 (class 0 OID 16557)
-- Dependencies: 221
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password) FROM stdin;
1	Emre	Deneme1
2	John Doe	denek2
3	Smartiq	Denek3
4	Matt	Bellammy
5	DENEK	DENEK1
6	a	a
\.


--
-- TOC entry 4818 (class 0 OID 0)
-- Dependencies: 216
-- Name: Cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Cars_id_seq"', 18, true);


--
-- TOC entry 4819 (class 0 OID 0)
-- Dependencies: 218
-- Name: cars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cars_id_seq', 1, false);


--
-- TOC entry 4820 (class 0 OID 0)
-- Dependencies: 220
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- TOC entry 4651 (class 2606 OID 16540)
-- Name: Cars Cars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Cars"
    ADD CONSTRAINT "Cars_pkey" PRIMARY KEY (id);


--
-- TOC entry 4655 (class 2606 OID 16555)
-- Name: cars cars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);


--
-- TOC entry 4653 (class 2606 OID 16548)
-- Name: random random_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.random
    ADD CONSTRAINT random_pkey PRIMARY KEY (id);


--
-- TOC entry 4657 (class 2606 OID 16562)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4659 (class 2606 OID 16564)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


-- Completed on 2024-08-21 17:00:17

--
-- PostgreSQL database dump complete
--

--
-- Database "Employee_Tracker" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-08-21 17:00:17

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
-- TOC entry 4788 (class 1262 OID 16519)
-- Name: Employee_Tracker; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Employee_Tracker" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "Employee_Tracker" OWNER TO postgres;

\connect "Employee_Tracker"

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
-- TOC entry 6 (class 2615 OID 16521)
-- Name: employee_tracker; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA employee_tracker;


ALTER SCHEMA employee_tracker OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16523)
-- Name: employee; Type: TABLE; Schema: employee_tracker; Owner: postgres
--

CREATE TABLE employee_tracker.employee (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    job_title character varying(100),
    salary numeric(10,2),
    hire_date date
);


ALTER TABLE employee_tracker.employee OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16522)
-- Name: employee_id_seq; Type: SEQUENCE; Schema: employee_tracker; Owner: postgres
--

CREATE SEQUENCE employee_tracker.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE employee_tracker.employee_id_seq OWNER TO postgres;

--
-- TOC entry 4789 (class 0 OID 0)
-- Dependencies: 216
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: employee_tracker; Owner: postgres
--

ALTER SEQUENCE employee_tracker.employee_id_seq OWNED BY employee_tracker.employee.id;


--
-- TOC entry 4635 (class 2604 OID 16526)
-- Name: employee id; Type: DEFAULT; Schema: employee_tracker; Owner: postgres
--

ALTER TABLE ONLY employee_tracker.employee ALTER COLUMN id SET DEFAULT nextval('employee_tracker.employee_id_seq'::regclass);


--
-- TOC entry 4782 (class 0 OID 16523)
-- Dependencies: 217
-- Data for Name: employee; Type: TABLE DATA; Schema: employee_tracker; Owner: postgres
--

COPY employee_tracker.employee (id, first_name, last_name, job_title, salary, hire_date) FROM stdin;
\.


--
-- TOC entry 4790 (class 0 OID 0)
-- Dependencies: 216
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: employee_tracker; Owner: postgres
--

SELECT pg_catalog.setval('employee_tracker.employee_id_seq', 1, false);


--
-- TOC entry 4637 (class 2606 OID 16528)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: employee_tracker; Owner: postgres
--

ALTER TABLE ONLY employee_tracker.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


-- Completed on 2024-08-21 17:00:17

--
-- PostgreSQL database dump complete
--

--
-- Database "dburunler" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-08-21 17:00:17

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
-- TOC entry 4798 (class 1262 OID 16453)
-- Name: dburunler; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dburunler WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE dburunler OWNER TO postgres;

\connect dburunler

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
-- TOC entry 215 (class 1259 OID 16454)
-- Name: kategoriler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategoriler (
    kategoriid integer NOT NULL,
    kategoriad character varying(20)
);


ALTER TABLE public.kategoriler OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16459)
-- Name: urunler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.urunler (
    urunid integer NOT NULL,
    urunad character varying(30),
    stok integer,
    alisfiyat double precision,
    satisfiyat double precision,
    gorsel character varying(100),
    kategori integer
);


ALTER TABLE public.urunler OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16529)
-- Name: urunlistesi; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.urunlistesi AS
 SELECT urunler.urunid,
    urunler.urunad,
    urunler.stok,
    urunler.alisfiyat,
    urunler.satisfiyat,
    urunler.gorsel,
    kategoriler.kategoriad
   FROM (public.urunler
     JOIN public.kategoriler ON ((urunler.kategori = kategoriler.kategoriid)));


ALTER VIEW public.urunlistesi OWNER TO postgres;

--
-- TOC entry 4791 (class 0 OID 16454)
-- Dependencies: 215
-- Data for Name: kategoriler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kategoriler (kategoriid, kategoriad) FROM stdin;
1	Beyaz Eşya
2	Motosiklet
3	Uçak
4	Gemi
5	Tren
\.


--
-- TOC entry 4792 (class 0 OID 16459)
-- Dependencies: 216
-- Data for Name: urunler; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.urunler (urunid, urunad, stok, alisfiyat, satisfiyat, gorsel, kategori) FROM stdin;
1	Tofaş	20	200000	400000	\N	1
2	Spor Motosiklet	100	500000	10000000		2
3	Vapur	3	200000000	400000000	text	4
\.


--
-- TOC entry 4642 (class 2606 OID 16458)
-- Name: kategoriler kategoriler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategoriler
    ADD CONSTRAINT kategoriler_pkey PRIMARY KEY (kategoriid);


--
-- TOC entry 4645 (class 2606 OID 16463)
-- Name: urunler urunler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urunler
    ADD CONSTRAINT urunler_pkey PRIMARY KEY (urunid);


--
-- TOC entry 4643 (class 1259 OID 16469)
-- Name: fki_urunler_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_urunler_foreign ON public.urunler USING btree (urunid);


--
-- TOC entry 4646 (class 2606 OID 16470)
-- Name: urunler urunler_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.urunler
    ADD CONSTRAINT urunler_foreign FOREIGN KEY (kategori) REFERENCES public.kategoriler(kategoriid) NOT VALID;


-- Completed on 2024-08-21 17:00:17

--
-- PostgreSQL database dump complete
--

--
-- Database "mytestdb" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-08-21 17:00:17

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
-- TOC entry 4793 (class 1262 OID 16475)
-- Name: mytestdb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE mytestdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE mytestdb OWNER TO postgres;

\connect mytestdb

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
-- TOC entry 216 (class 1259 OID 16477)
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    departmentid integer NOT NULL,
    departmentname character varying(500)
);


ALTER TABLE public.department OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16476)
-- Name: department_departmentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_departmentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.department_departmentid_seq OWNER TO postgres;

--
-- TOC entry 4794 (class 0 OID 0)
-- Dependencies: 215
-- Name: department_departmentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_departmentid_seq OWNED BY public.department.departmentid;


--
-- TOC entry 218 (class 1259 OID 16484)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employeeid integer NOT NULL,
    employeename character varying(500),
    department character varying(500),
    dateofjoining date,
    photofilename character varying(500)
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16483)
-- Name: employee_employeeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_employeeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_employeeid_seq OWNER TO postgres;

--
-- TOC entry 4795 (class 0 OID 0)
-- Dependencies: 217
-- Name: employee_employeeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_employeeid_seq OWNED BY public.employee.employeeid;


--
-- TOC entry 4639 (class 2604 OID 16480)
-- Name: department departmentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department ALTER COLUMN departmentid SET DEFAULT nextval('public.department_departmentid_seq'::regclass);


--
-- TOC entry 4640 (class 2604 OID 16487)
-- Name: employee employeeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN employeeid SET DEFAULT nextval('public.employee_employeeid_seq'::regclass);


--
-- TOC entry 4785 (class 0 OID 16477)
-- Dependencies: 216
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department (departmentid, departmentname) FROM stdin;
1	IT
2	Support
\.


--
-- TOC entry 4787 (class 0 OID 16484)
-- Dependencies: 218
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employeeid, employeename, department, dateofjoining, photofilename) FROM stdin;
1	Bob	IT	2021-06-21	anonymous.png
\.


--
-- TOC entry 4796 (class 0 OID 0)
-- Dependencies: 215
-- Name: department_departmentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_departmentid_seq', 2, true);


--
-- TOC entry 4797 (class 0 OID 0)
-- Dependencies: 217
-- Name: employee_employeeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_employeeid_seq', 1, true);


-- Completed on 2024-08-21 17:00:17

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-08-21 17:00:17

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 4778 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


-- Completed on 2024-08-21 17:00:17

--
-- PostgreSQL database dump complete
--

--
-- Database "shoppingFlipkart" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-08-21 17:00:17

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
-- TOC entry 4804 (class 1262 OID 16491)
-- Name: shoppingFlipkart; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "shoppingFlipkart" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "shoppingFlipkart" OWNER TO postgres;

\connect "shoppingFlipkart"

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
-- TOC entry 215 (class 1259 OID 16492)
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16506)
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    id integer NOT NULL,
    "Productid" integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL,
    phone text NOT NULL
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16505)
-- Name: order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."order" ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 217 (class 1259 OID 16498)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name text NOT NULL,
    brand text NOT NULL,
    size integer NOT NULL,
    price numeric NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16497)
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4794 (class 0 OID 16492)
-- Dependencies: 215
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
20240818020601_InitialDatabase	8.0.8
20240818021715_UpdateReference	8.0.8
\.


--
-- TOC entry 4798 (class 0 OID 16506)
-- Dependencies: 219
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."order" (id, "Productid", name, address, phone) FROM stdin;
\.


--
-- TOC entry 4796 (class 0 OID 16498)
-- Dependencies: 217
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (id, name, brand, size, price) FROM stdin;
1	Product Name	Brand Name	1	100
2	Product 2	Brand Name 2	2	200
\.


--
-- TOC entry 4805 (class 0 OID 0)
-- Dependencies: 218
-- Name: order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_id_seq', 1, false);


--
-- TOC entry 4806 (class 0 OID 0)
-- Dependencies: 216
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_id_seq', 1, false);


--
-- TOC entry 4644 (class 2606 OID 16496)
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- TOC entry 4649 (class 2606 OID 16512)
-- Name: order PK_order; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "PK_order" PRIMARY KEY (id);


--
-- TOC entry 4646 (class 2606 OID 16504)
-- Name: product PK_product; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "PK_product" PRIMARY KEY (id);


--
-- TOC entry 4647 (class 1259 OID 16518)
-- Name: IX_order_Productid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_order_Productid" ON public."order" USING btree ("Productid");


--
-- TOC entry 4650 (class 2606 OID 16513)
-- Name: order FK_order_product_Productid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "FK_order_product_Productid" FOREIGN KEY ("Productid") REFERENCES public.product(id) ON DELETE CASCADE;


-- Completed on 2024-08-21 17:00:17

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-08-21 17:00:17

--
-- PostgreSQL database cluster dump complete
--

