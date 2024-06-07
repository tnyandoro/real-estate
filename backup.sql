--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE "user";
ALTER ROLE "user" WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






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

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- PostgreSQL database dump complete
--

--
-- Database "HospitalManagementSystem_development" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- Name: HospitalManagementSystem_development; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE "HospitalManagementSystem_development" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE "HospitalManagementSystem_development" OWNER TO "user";

\connect "HospitalManagementSystem_development"

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO "user";

--
-- Name: patients; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.patients (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    dob date,
    gender character varying,
    race character varying,
    address character varying,
    phone_number character varying,
    underlying_conditions text,
    vaccination_history text,
    bp character varying,
    urine_sample character varying,
    temp character varying,
    cardio character varying,
    weight character varying,
    height character varying,
    allergies text,
    medical_allergies text,
    female boolean,
    number_of_children integer,
    marital_status character varying,
    next_of_kin character varying,
    scan_results text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.patients OWNER TO "user";

--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.patients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patients_id_seq OWNER TO "user";

--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.patients_id_seq OWNED BY public.patients.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO "user";

--
-- Name: users; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "user";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: patients id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.patients ALTER COLUMN id SET DEFAULT nextval('public.patients_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-09-23 14:43:58.773239	2023-09-23 14:43:58.773239
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.patients (id, first_name, last_name, dob, gender, race, address, phone_number, underlying_conditions, vaccination_history, bp, urine_sample, temp, cardio, weight, height, allergies, medical_allergies, female, number_of_children, marital_status, next_of_kin, scan_results, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.schema_migrations (version) FROM stdin;
20230923145533
20230923150107
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.patients_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: user
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: user
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- PostgreSQL database dump complete
--

--
-- Database "HospitalManagementSystem_test" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- Name: HospitalManagementSystem_test; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE "HospitalManagementSystem_test" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE "HospitalManagementSystem_test" OWNER TO "user";

\connect "HospitalManagementSystem_test"

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
-- PostgreSQL database dump complete
--

--
-- Database "blog_app_development" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- Name: blog_app_development; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE blog_app_development WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE blog_app_development OWNER TO "user";

\connect blog_app_development

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO "user";

--
-- Name: blogs; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.blogs (
    id bigint NOT NULL,
    title character varying,
    body text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.blogs OWNER TO "user";

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_id_seq OWNER TO "user";

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO "user";

--
-- Name: blogs id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-03-07 13:31:27.695895	2023-03-07 13:31:27.695895
\.


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.blogs (id, title, body, created_at, updated_at) FROM stdin;
6	The Benefits of Learning a Second Language	Learning a second language has become increasingly important in today's globalized world. Not only does it broaden our cultural horizons, but it also provides numerous personal and professional benefits. In this blog post, we will explore some of the key advantages of learning a second language	2023-03-08 08:32:46.695684	2023-03-08 08:32:46.695684
7	The Importance of Coding in Today's World	In today's digital age, coding has become an essential skill for individuals and organizations alike. From developing mobile apps and websites to analyzing data and automating tasks, coding is used in a wide range of industries and applications. In this blog post, we'll explore the importance of coding in today's world and why you should consider learning this valuable skill.	2023-03-08 08:32:46.7022	2023-03-08 08:32:46.7022
8	After turbo	Content after turbo lets see if that workd 	2023-03-09 08:24:13.439704	2023-03-09 08:24:13.439704
9	Render Blog after turbo prepand	Lets render a new bolog after turbo prepend \r\n	2023-03-09 08:30:08.89923	2023-03-09 08:30:08.89923
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.schema_migrations (version) FROM stdin;
20230307095942
\.


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.blogs_id_seq', 9, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: blogs blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- PostgreSQL database dump complete
--

--
-- Database "blog_app_test" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- Name: blog_app_test; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE blog_app_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE blog_app_test OWNER TO "user";

\connect blog_app_test

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
-- PostgreSQL database dump complete
--

--
-- Database "blog_development" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- Name: blog_development; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE blog_development WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE blog_development OWNER TO "user";

\connect blog_development

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO "user";

--
-- Name: blogs; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.blogs (
    id bigint NOT NULL,
    title character varying,
    body text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.blogs OWNER TO "user";

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_id_seq OWNER TO "user";

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO "user";

--
-- Name: blogs id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-03-07 12:54:15.200811	2023-03-07 12:54:15.200811
\.


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.blogs (id, title, body, created_at, updated_at) FROM stdin;
1	First blog post	Learning a second language has become increasingly important in today's globalized world. Not only does it broaden our cultural horizons, but it also provides numerous personal and professional benefits. In this blog post, we will explore some of the key advantages of learning a second language	2023-03-07 12:58:08.262647	2023-03-07 12:58:08.262647
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.schema_migrations (version) FROM stdin;
20230307095942
\.


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.blogs_id_seq', 1, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: blogs blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- PostgreSQL database dump complete
--

--
-- Database "blog_test" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- Name: blog_test; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE blog_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE blog_test OWNER TO "user";

\connect blog_test

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
-- PostgreSQL database dump complete
--

--
-- Database "buddies_app_development" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- Name: buddies_app_development; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE buddies_app_development WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE buddies_app_development OWNER TO "user";

\connect buddies_app_development

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
-- PostgreSQL database dump complete
--

--
-- Database "buddies_app_test" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- Name: buddies_app_test; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE buddies_app_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE buddies_app_test OWNER TO "user";

\connect buddies_app_test

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
-- PostgreSQL database dump complete
--

--
-- Database "my_video_recording_app_development" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- Name: my_video_recording_app_development; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE my_video_recording_app_development WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE my_video_recording_app_development OWNER TO "user";

\connect my_video_recording_app_development

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
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO "user";

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO "user";

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO "user";

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO "user";

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO "user";

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_variant_records_id_seq OWNER TO "user";

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO "user";

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO "user";

--
-- Name: selfies; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.selfies (
    id bigint NOT NULL,
    title character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.selfies OWNER TO "user";

--
-- Name: selfies_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.selfies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.selfies_id_seq OWNER TO "user";

--
-- Name: selfies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.selfies_id_seq OWNED BY public.selfies.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: selfies id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.selfies ALTER COLUMN id SET DEFAULT nextval('public.selfies_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
1	photo	Selfie	2	1	2023-12-01 10:01:55.948639
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
1	thk4ddq3miu9lazu701l2n35zz7k	cherry.jpeg	image/jpeg	{"identified":true,"analyzed":true}	local	1897036	2+5l2VUlFde5bbwgcfFnhA==	2023-12-01 10:01:55.946111
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-12-01 09:04:07.877073	2023-12-01 09:04:07.877073
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.schema_migrations (version) FROM stdin;
20231201091138
20231201093441
\.


--
-- Data for Name: selfies; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.selfies (id, title, created_at, updated_at) FROM stdin;
1		2023-12-01 10:00:49.336493	2023-12-01 10:00:49.336493
2		2023-12-01 10:01:55.821633	2023-12-01 10:01:55.996343
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 1, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 1, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: selfies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.selfies_id_seq', 2, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: selfies selfies_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.selfies
    ADD CONSTRAINT selfies_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: user
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: user
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: user
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "my_video_recording_app_test" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- Name: my_video_recording_app_test; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE my_video_recording_app_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE my_video_recording_app_test OWNER TO "user";

\connect my_video_recording_app_test

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
-- PostgreSQL database dump complete
--

--
-- Database "mysite_development" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- Name: mysite_development; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE mysite_development WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE mysite_development OWNER TO "user";

\connect mysite_development

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
-- PostgreSQL database dump complete
--

--
-- Database "mysite_test" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- Name: mysite_test; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE mysite_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE mysite_test OWNER TO "user";

\connect mysite_test

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
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- PostgreSQL database dump complete
--

--
-- Database "properties_backend_development" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- Name: properties_backend_development; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE properties_backend_development WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE properties_backend_development OWNER TO "user";

\connect properties_backend_development

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
-- Name: agents; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.agents (
    id bigint NOT NULL,
    name character varying,
    phone_number character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.agents OWNER TO "user";

--
-- Name: agents_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.agents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agents_id_seq OWNER TO "user";

--
-- Name: agents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.agents_id_seq OWNED BY public.agents.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO "user";

--
-- Name: connect_agent_properties; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.connect_agent_properties (
    id bigint NOT NULL,
    agent_id bigint NOT NULL,
    property_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.connect_agent_properties OWNER TO "user";

--
-- Name: connect_agent_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.connect_agent_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.connect_agent_properties_id_seq OWNER TO "user";

--
-- Name: connect_agent_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.connect_agent_properties_id_seq OWNED BY public.connect_agent_properties.id;


--
-- Name: properties; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.properties (
    id bigint NOT NULL,
    property_type character varying,
    property_name character varying,
    property_size character varying,
    location character varying,
    property_price character varying,
    image_url character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.properties OWNER TO "user";

--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.properties_id_seq OWNER TO "user";

--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.properties_id_seq OWNED BY public.properties.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO "user";

--
-- Name: agents id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.agents ALTER COLUMN id SET DEFAULT nextval('public.agents_id_seq'::regclass);


--
-- Name: connect_agent_properties id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.connect_agent_properties ALTER COLUMN id SET DEFAULT nextval('public.connect_agent_properties_id_seq'::regclass);


--
-- Name: properties id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.properties ALTER COLUMN id SET DEFAULT nextval('public.properties_id_seq'::regclass);


--
-- Data for Name: agents; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.agents (id, name, phone_number, created_at, updated_at) FROM stdin;
1	Robyn	+27742591362	2023-03-09 13:51:30.559836	2023-03-09 13:51:30.559836
2	Lisa	 +27630190641	2023-03-09 13:51:30.576658	2023-03-09 13:51:30.576658
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-03-09 13:50:17.182426	2023-03-09 13:50:17.182426
\.


--
-- Data for Name: connect_agent_properties; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.connect_agent_properties (id, agent_id, property_id, created_at, updated_at) FROM stdin;
1	1	1	2023-03-09 13:51:30.620725	2023-03-09 13:51:30.620725
2	2	2	2023-03-09 13:51:30.66621	2023-03-09 13:51:30.66621
3	1	3	2023-03-09 13:51:30.671127	2023-03-09 13:51:30.671127
4	2	4	2023-03-09 13:51:30.674622	2023-03-09 13:51:30.674622
5	1	5	2023-03-09 13:51:30.677572	2023-03-09 13:51:30.677572
\.


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.properties (id, property_type, property_name, property_size, location, property_price, image_url, created_at, updated_at) FROM stdin;
1	industrial	Joint Commercial	2500sqm	GAUTENG	150000	https://unsplash.com/photos/1Nrns7n9xKY	2023-03-09 13:51:30.590254	2023-03-09 13:51:30.590254
2	industrial	Warehouse	1500sqm	KZN	150000	https://unsplash.com/photos/_KZLh83JvqU	2023-03-09 13:51:30.594322	2023-03-09 13:51:30.594322
3	office	The zone	300sqm	PRETORIA	20000	https://unsplash.com/photos/_KZLh83JvqU	2023-03-09 13:51:30.597679	2023-03-09 13:51:30.597679
4	industrial	Warehouse	1500sqm	CAPETOWN	150000	https://unsplash.com/photos/_KZLh83JvqU	2023-03-09 13:51:30.600845	2023-03-09 13:51:30.600845
5	office	Warehouse	500sqm	EC	150000	https://unsplash.com/photos/_KZLh83JvqU	2023-03-09 13:51:30.604006	2023-03-09 13:51:30.604006
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.schema_migrations (version) FROM stdin;
20230309130027
20230309130125
20230309132140
\.


--
-- Name: agents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.agents_id_seq', 2, true);


--
-- Name: connect_agent_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.connect_agent_properties_id_seq', 5, true);


--
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.properties_id_seq', 5, true);


--
-- Name: agents agents_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.agents
    ADD CONSTRAINT agents_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: connect_agent_properties connect_agent_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.connect_agent_properties
    ADD CONSTRAINT connect_agent_properties_pkey PRIMARY KEY (id);


--
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_connect_agent_properties_on_agent_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX index_connect_agent_properties_on_agent_id ON public.connect_agent_properties USING btree (agent_id);


--
-- Name: index_connect_agent_properties_on_property_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX index_connect_agent_properties_on_property_id ON public.connect_agent_properties USING btree (property_id);


--
-- Name: connect_agent_properties fk_rails_0b0b8a7a7c; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.connect_agent_properties
    ADD CONSTRAINT fk_rails_0b0b8a7a7c FOREIGN KEY (agent_id) REFERENCES public.agents(id);


--
-- Name: connect_agent_properties fk_rails_b674da15f4; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.connect_agent_properties
    ADD CONSTRAINT fk_rails_b674da15f4 FOREIGN KEY (property_id) REFERENCES public.properties(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "properties_backend_test" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- Name: properties_backend_test; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE properties_backend_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE properties_backend_test OWNER TO "user";

\connect properties_backend_test

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
-- PostgreSQL database dump complete
--

--
-- Database "reaz_school_api_development" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- Name: reaz_school_api_development; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE reaz_school_api_development WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE reaz_school_api_development OWNER TO "user";

\connect reaz_school_api_development

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO "user";

--
-- Name: certificates; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.certificates (
    id bigint NOT NULL,
    student_id bigint NOT NULL,
    course_id bigint NOT NULL,
    certificate_number character varying,
    pdf_certificate bytea,
    png_certificate bytea,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.certificates OWNER TO "user";

--
-- Name: certificates_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.certificates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.certificates_id_seq OWNER TO "user";

--
-- Name: certificates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.certificates_id_seq OWNED BY public.certificates.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.courses (
    id bigint NOT NULL,
    title character varying,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.courses OWNER TO "user";

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_id_seq OWNER TO "user";

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: enrollments; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.enrollments (
    id bigint NOT NULL,
    student_id bigint NOT NULL,
    course_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.enrollments OWNER TO "user";

--
-- Name: enrollments_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.enrollments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enrollments_id_seq OWNER TO "user";

--
-- Name: enrollments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.enrollments_id_seq OWNED BY public.enrollments.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO "user";

--
-- Name: students; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.students (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    face_image bytea,
    identification character varying,
    date_of_birth date,
    region character varying,
    program character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    email character varying,
    dob date
);


ALTER TABLE public.students OWNER TO "user";

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO "user";

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: certificates id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.certificates ALTER COLUMN id SET DEFAULT nextval('public.certificates_id_seq'::regclass);


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: enrollments id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.enrollments ALTER COLUMN id SET DEFAULT nextval('public.enrollments_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2024-05-22 18:42:07.492494	2024-05-22 18:42:07.492494
\.


--
-- Data for Name: certificates; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.certificates (id, student_id, course_id, certificate_number, pdf_certificate, png_certificate, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.courses (id, title, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: enrollments; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.enrollments (id, student_id, course_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.schema_migrations (version) FROM stdin;
20240522184136
20240522184138
20240522184140
20240522184142
20240523104841
20240523105920
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.students (id, first_name, last_name, face_image, identification, date_of_birth, region, program, created_at, updated_at, email, dob) FROM stdin;
1	Jacquelyn	Moen	\N	\N	\N	New York	Information Systems 511	2024-05-23 11:01:23.242196	2024-05-23 11:01:23.242196	dennis@kuhn.test	1987-07-31
2	Robbie	Little	\N	\N	\N	West Virginia	Design 371	2024-05-23 11:01:23.298406	2024-05-23 11:01:23.298406	josef_mohr@murazik.example	1992-11-09
3	Britt	Legros	\N	\N	\N	West Virginia	Commerce 588	2024-05-23 11:01:23.303384	2024-05-23 11:01:23.303384	laverne@boyer-roberts.test	1998-07-27
4	Jan	Gerlach	\N	\N	\N	Vermont	Biological Science 414	2024-05-23 11:01:23.308022	2024-05-23 11:01:23.308022	russell@smith-mueller.example	1969-01-06
5	Luise	Hettinger	\N	\N	\N	Virginia	Arts 541	2024-05-23 11:01:23.313269	2024-05-23 11:01:23.313269	belia@lind-kreiger.test	1984-12-16
6	Leesa	Johns	\N	\N	\N	Maine	Medicine 282	2024-05-23 11:01:23.319518	2024-05-23 11:01:23.319518	darnell.schumm@hettinger.test	1993-08-30
7	Devon	Boyle	\N	\N	\N	Oregon	Biological Science 214	2024-05-23 11:01:23.324928	2024-05-23 11:01:23.324928	gene.sawayn@bayer.test	1976-07-30
8	Venita	Auer	\N	\N	\N	Illinois	Forensic Science 519	2024-05-23 11:01:23.331518	2024-05-23 11:01:23.331518	damian.schamberger@bode-medhurst.example	1992-10-10
9	Lanny	Wilderman	\N	\N	\N	California	Medicine 494	2024-05-23 11:01:23.336609	2024-05-23 11:01:23.336609	serita_nienow@berge.example	1986-01-07
10	Arden	Schinner	\N	\N	\N	California	Psychology 231	2024-05-23 11:01:23.341841	2024-05-23 11:01:23.341841	estela@block-rowe.test	1979-10-26
\.


--
-- Name: certificates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.certificates_id_seq', 1, false);


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.courses_id_seq', 1, false);


--
-- Name: enrollments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.enrollments_id_seq', 1, false);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.students_id_seq', 10, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: certificates certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT certificates_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: enrollments enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: index_certificates_on_course_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX index_certificates_on_course_id ON public.certificates USING btree (course_id);


--
-- Name: index_certificates_on_student_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX index_certificates_on_student_id ON public.certificates USING btree (student_id);


--
-- Name: index_enrollments_on_course_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX index_enrollments_on_course_id ON public.enrollments USING btree (course_id);


--
-- Name: index_enrollments_on_student_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX index_enrollments_on_student_id ON public.enrollments USING btree (student_id);


--
-- Name: enrollments fk_rails_2e119501f4; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT fk_rails_2e119501f4 FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: certificates fk_rails_4affdaec3e; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT fk_rails_4affdaec3e FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: enrollments fk_rails_f01c555e06; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT fk_rails_f01c555e06 FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- Name: certificates fk_rails_fb0c0639da; Type: FK CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT fk_rails_fb0c0639da FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "reaz_school_api_test" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- Name: reaz_school_api_test; Type: DATABASE; Schema: -; Owner: user
--

CREATE DATABASE reaz_school_api_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE reaz_school_api_test OWNER TO "user";

\connect reaz_school_api_test

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
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

