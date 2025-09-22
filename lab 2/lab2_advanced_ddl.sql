--
-- PostgreSQL database cluster dump
--

\restrict Zcx7BItf6sM1l5EZYjobWV4xkqKn8xn32FdYnvx9P7gu2DOTEgavxdXBPraEcO5

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:Aqzvrc/gatBtncUVKaY9ZA==$TDyOcu80TQHnEnSzXJPsR3tiyriOlCCnkfi9Ch1HXnQ=:BlbZdvTdQa5rVfnfucDxMKv4k8D+quevyw+o3+Cn2zE=';

--
-- User Configurations
--






--
-- Tablespaces
--

CREATE TABLESPACE student_data OWNER postgres LOCATION E'C:\\postgres_ts_kbtu\\data\\students';
CREATE TABLESPACE course_data OWNER postgres LOCATION E'C:\\postgres_ts_kbtu\\data\\courses';


\unrestrict Zcx7BItf6sM1l5EZYjobWV4xkqKn8xn32FdYnvx9P7gu2DOTEgavxdXBPraEcO5

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

\restrict Dla2n6p2slXtKBpRiIFiPCHULePs9VBnhxeNQ0zYLH01HisZeun3VUnqgY333ZQ

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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

\unrestrict Dla2n6p2slXtKBpRiIFiPCHULePs9VBnhxeNQ0zYLH01HisZeun3VUnqgY333ZQ

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict WCKI4rCLe8lAfMhaUTFrDdl6gktPpcUPIr5HQcMH7daSqI7g3X85mftdmVVsUFd

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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

\unrestrict WCKI4rCLe8lAfMhaUTFrDdl6gktPpcUPIr5HQcMH7daSqI7g3X85mftdmVVsUFd

--
-- Database "student_data" dump
--

--
-- PostgreSQL database dump
--

\restrict 65yxnNEd5TAEYdLJF8hJVeGqhTHfqX7RFmgZ248tzSiMYr7E3c2UmpFcOvS2ulp

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: student_data; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE student_data WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251' TABLESPACE = student_data;


ALTER DATABASE student_data OWNER TO postgres;

\unrestrict 65yxnNEd5TAEYdLJF8hJVeGqhTHfqX7RFmgZ248tzSiMYr7E3c2UmpFcOvS2ulp
\connect student_data
\restrict 65yxnNEd5TAEYdLJF8hJVeGqhTHfqX7RFmgZ248tzSiMYr7E3c2UmpFcOvS2ulp

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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

\unrestrict 65yxnNEd5TAEYdLJF8hJVeGqhTHfqX7RFmgZ248tzSiMYr7E3c2UmpFcOvS2ulp

--
-- Database "university_archive" dump
--

--
-- PostgreSQL database dump
--

\restrict uSOweYEVtQYbBNrvJ63vw0ge4AUEAu9XaIZNOMoyQVnwEctLEryvrC8gz7dxgoc

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: university_archive; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE university_archive WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE university_archive OWNER TO postgres;

\unrestrict uSOweYEVtQYbBNrvJ63vw0ge4AUEAu9XaIZNOMoyQVnwEctLEryvrC8gz7dxgoc
\connect university_archive
\restrict uSOweYEVtQYbBNrvJ63vw0ge4AUEAu9XaIZNOMoyQVnwEctLEryvrC8gz7dxgoc

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: university_archive; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE university_archive CONNECTION LIMIT = 50;


\unrestrict uSOweYEVtQYbBNrvJ63vw0ge4AUEAu9XaIZNOMoyQVnwEctLEryvrC8gz7dxgoc
\connect university_archive
\restrict uSOweYEVtQYbBNrvJ63vw0ge4AUEAu9XaIZNOMoyQVnwEctLEryvrC8gz7dxgoc

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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

\unrestrict uSOweYEVtQYbBNrvJ63vw0ge4AUEAu9XaIZNOMoyQVnwEctLEryvrC8gz7dxgoc

--
-- Database "university_backup" dump
--

--
-- PostgreSQL database dump
--

\restrict 8n7erPkLrngvwRFzgm1c3kEDhxjxOYnBwLabOBGFJft6ddKyG2p6w1kNDZvcm9q

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: university_backup; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE university_backup WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE university_backup OWNER TO postgres;

\unrestrict 8n7erPkLrngvwRFzgm1c3kEDhxjxOYnBwLabOBGFJft6ddKyG2p6w1kNDZvcm9q
\connect university_backup
\restrict 8n7erPkLrngvwRFzgm1c3kEDhxjxOYnBwLabOBGFJft6ddKyG2p6w1kNDZvcm9q

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: class_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class_schedule (
    schedule_id integer NOT NULL,
    course_id integer,
    professor_id integer,
    classroom character varying(30),
    class_date date,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    room_capacity integer,
    session_type character varying(15),
    equipment_needed text
);


ALTER TABLE public.class_schedule OWNER TO postgres;

--
-- Name: class_schedule_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.class_schedule_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.class_schedule_schedule_id_seq OWNER TO postgres;

--
-- Name: class_schedule_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.class_schedule_schedule_id_seq OWNED BY public.class_schedule.schedule_id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course_code character varying(10),
    course_title character varying(100),
    description text,
    credits smallint DEFAULT 3,
    course_fee numeric(10,2),
    is_online boolean,
    created_at timestamp without time zone,
    prerequisite_course_id integer,
    difficulty_level smallint,
    lab_required boolean DEFAULT false,
    department_id integer
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courses_course_id_seq OWNER TO postgres;

--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(100),
    department_code character(5),
    building character varying(50),
    phone character varying(15),
    budget numeric(10,2),
    established_year integer
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: departments_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departments_department_id_seq OWNER TO postgres;

--
-- Name: departments_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_department_id_seq OWNED BY public.departments.department_id;


--
-- Name: grade_scale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grade_scale (
    grade_id integer NOT NULL,
    letter_grade character(2),
    min_percentage numeric(10,1),
    max_percentage numeric(10,1),
    gpa_points numeric(10,2),
    description text
);


ALTER TABLE public.grade_scale OWNER TO postgres;

--
-- Name: grade_scale_grade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grade_scale_grade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grade_scale_grade_id_seq OWNER TO postgres;

--
-- Name: grade_scale_grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grade_scale_grade_id_seq OWNED BY public.grade_scale.grade_id;


--
-- Name: professors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professors (
    professor_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
    office_number character varying(20),
    hire_date date,
    salary numeric(10,2),
    is_tenured boolean DEFAULT false,
    years_experience smallint,
    department_code character(5),
    research_area text,
    last_promotion_date date,
    department_id integer
);


ALTER TABLE public.professors OWNER TO postgres;

--
-- Name: professors_professor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.professors_professor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.professors_professor_id_seq OWNER TO postgres;

--
-- Name: professors_professor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.professors_professor_id_seq OWNED BY public.professors.professor_id;


--
-- Name: semester_calendar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.semester_calendar (
    semester_id integer NOT NULL,
    semester_name character varying(20),
    academic_year integer,
    start_date date,
    end_date date,
    registration_deadline timestamp with time zone
);


ALTER TABLE public.semester_calendar OWNER TO postgres;

--
-- Name: semester_calendar_semester_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.semester_calendar_semester_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.semester_calendar_semester_id_seq OWNER TO postgres;

--
-- Name: semester_calendar_semester_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.semester_calendar_semester_id_seq OWNED BY public.semester_calendar.semester_id;


--
-- Name: student_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_records (
    record_id integer NOT NULL,
    student_id integer,
    course_id integer,
    semester character varying(20),
    year integer,
    grade character varying(5),
    attendance_percentage numeric(10,1),
    submission_timestamp timestamp with time zone,
    extra_credit_points numeric(10,1) DEFAULT 0.0,
    final_exam_date date
);


ALTER TABLE public.student_records OWNER TO postgres;

--
-- Name: student_records_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_records_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_records_record_id_seq OWNER TO postgres;

--
-- Name: student_records_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_records_record_id_seq OWNED BY public.student_records.record_id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
    phone character varying(20),
    date_of_birth date,
    enrollment_date date,
    gpa numeric(3,2) DEFAULT 0.00,
    is_active boolean,
    graduation_year smallint,
    middle_name character varying(30),
    student_status character varying(20) DEFAULT 'ACTIVE'::character varying,
    advisor_id integer
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_student_id_seq OWNER TO postgres;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- Name: class_schedule schedule_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class_schedule ALTER COLUMN schedule_id SET DEFAULT nextval('public.class_schedule_schedule_id_seq'::regclass);


--
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: departments department_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN department_id SET DEFAULT nextval('public.departments_department_id_seq'::regclass);


--
-- Name: grade_scale grade_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade_scale ALTER COLUMN grade_id SET DEFAULT nextval('public.grade_scale_grade_id_seq'::regclass);


--
-- Name: professors professor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors ALTER COLUMN professor_id SET DEFAULT nextval('public.professors_professor_id_seq'::regclass);


--
-- Name: semester_calendar semester_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semester_calendar ALTER COLUMN semester_id SET DEFAULT nextval('public.semester_calendar_semester_id_seq'::regclass);


--
-- Name: student_records record_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_records ALTER COLUMN record_id SET DEFAULT nextval('public.student_records_record_id_seq'::regclass);


--
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- Data for Name: class_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.class_schedule (schedule_id, course_id, professor_id, classroom, class_date, start_time, end_time, room_capacity, session_type, equipment_needed) FROM stdin;
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (course_id, course_code, course_title, description, credits, course_fee, is_online, created_at, prerequisite_course_id, difficulty_level, lab_required, department_id) FROM stdin;
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (department_id, department_name, department_code, building, phone, budget, established_year) FROM stdin;
\.


--
-- Data for Name: grade_scale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grade_scale (grade_id, letter_grade, min_percentage, max_percentage, gpa_points, description) FROM stdin;
\.


--
-- Data for Name: professors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.professors (professor_id, first_name, last_name, email, office_number, hire_date, salary, is_tenured, years_experience, department_code, research_area, last_promotion_date, department_id) FROM stdin;
\.


--
-- Data for Name: semester_calendar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.semester_calendar (semester_id, semester_name, academic_year, start_date, end_date, registration_deadline) FROM stdin;
\.


--
-- Data for Name: student_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_records (record_id, student_id, course_id, semester, year, grade, attendance_percentage, submission_timestamp, extra_credit_points, final_exam_date) FROM stdin;
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (student_id, first_name, last_name, email, phone, date_of_birth, enrollment_date, gpa, is_active, graduation_year, middle_name, student_status, advisor_id) FROM stdin;
\.


--
-- Name: class_schedule_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.class_schedule_schedule_id_seq', 1, false);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 1, false);


--
-- Name: departments_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_department_id_seq', 1, false);


--
-- Name: grade_scale_grade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grade_scale_grade_id_seq', 1, false);


--
-- Name: professors_professor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.professors_professor_id_seq', 1, false);


--
-- Name: semester_calendar_semester_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.semester_calendar_semester_id_seq', 1, false);


--
-- Name: student_records_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_records_record_id_seq', 1, false);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_student_id_seq', 1, false);


--
-- Name: grade_scale grade_scale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade_scale
    ADD CONSTRAINT grade_scale_pkey PRIMARY KEY (grade_id);


--
-- Name: courses id_course; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT id_course PRIMARY KEY (course_id);


--
-- Name: departments id_department; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT id_department PRIMARY KEY (department_id);


--
-- Name: professors id_professor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors
    ADD CONSTRAINT id_professor PRIMARY KEY (professor_id);


--
-- Name: student_records id_record; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_records
    ADD CONSTRAINT id_record PRIMARY KEY (record_id);


--
-- Name: class_schedule id_schedule; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class_schedule
    ADD CONSTRAINT id_schedule PRIMARY KEY (schedule_id);


--
-- Name: students id_student; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT id_student PRIMARY KEY (student_id);


--
-- Name: semester_calendar semester_calendar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semester_calendar
    ADD CONSTRAINT semester_calendar_pkey PRIMARY KEY (semester_id);


--
-- PostgreSQL database dump complete
--

\unrestrict 8n7erPkLrngvwRFzgm1c3kEDhxjxOYnBwLabOBGFJft6ddKyG2p6w1kNDZvcm9q

--
-- Database "university_main" dump
--

--
-- PostgreSQL database dump
--

\restrict zor8keDh1NbG7gioFIxbpo9eMBH6COrS2MYCLPje9doo3HTqZuxjB9Wmdy0nQFd

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: university_main; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE university_main WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE university_main OWNER TO postgres;

\unrestrict zor8keDh1NbG7gioFIxbpo9eMBH6COrS2MYCLPje9doo3HTqZuxjB9Wmdy0nQFd
\connect university_main
\restrict zor8keDh1NbG7gioFIxbpo9eMBH6COrS2MYCLPje9doo3HTqZuxjB9Wmdy0nQFd

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: class_schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class_schedule (
    schedule_id integer NOT NULL,
    course_id integer,
    professor_id integer,
    classroom character varying(30),
    class_date date,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    room_capacity integer,
    session_type character varying(15),
    equipment_needed text
);


ALTER TABLE public.class_schedule OWNER TO postgres;

--
-- Name: class_schedule_schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.class_schedule_schedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.class_schedule_schedule_id_seq OWNER TO postgres;

--
-- Name: class_schedule_schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.class_schedule_schedule_id_seq OWNED BY public.class_schedule.schedule_id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    course_id integer NOT NULL,
    course_code character varying(10),
    course_title character varying(100),
    description text,
    credits smallint DEFAULT 3,
    course_fee numeric(10,2),
    is_online boolean,
    created_at timestamp without time zone,
    prerequisite_course_id integer,
    difficulty_level smallint,
    lab_required boolean DEFAULT false,
    department_id integer
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courses_course_id_seq OWNER TO postgres;

--
-- Name: courses_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_course_id_seq OWNED BY public.courses.course_id;


--
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(100),
    department_code character(5),
    building character varying(50),
    phone character varying(15),
    budget numeric(10,2),
    established_year integer
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: departments_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departments_department_id_seq OWNER TO postgres;

--
-- Name: departments_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_department_id_seq OWNED BY public.departments.department_id;


--
-- Name: grade_scale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grade_scale (
    grade_id integer NOT NULL,
    letter_grade character(2),
    min_percentage numeric(10,1),
    max_percentage numeric(10,1),
    gpa_points numeric(10,2),
    description text
);


ALTER TABLE public.grade_scale OWNER TO postgres;

--
-- Name: grade_scale_grade_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grade_scale_grade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grade_scale_grade_id_seq OWNER TO postgres;

--
-- Name: grade_scale_grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grade_scale_grade_id_seq OWNED BY public.grade_scale.grade_id;


--
-- Name: professors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professors (
    professor_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
    office_number character varying(20),
    hire_date date,
    salary numeric(10,2),
    is_tenured boolean DEFAULT false,
    years_experience smallint,
    department_code character(5),
    research_area text,
    last_promotion_date date,
    department_id integer
);


ALTER TABLE public.professors OWNER TO postgres;

--
-- Name: professors_professor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.professors_professor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.professors_professor_id_seq OWNER TO postgres;

--
-- Name: professors_professor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.professors_professor_id_seq OWNED BY public.professors.professor_id;


--
-- Name: semester_calendar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.semester_calendar (
    semester_id integer NOT NULL,
    semester_name character varying(20),
    academic_year integer,
    start_date date,
    end_date date,
    registration_deadline timestamp with time zone
);


ALTER TABLE public.semester_calendar OWNER TO postgres;

--
-- Name: semester_calendar_semester_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.semester_calendar_semester_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.semester_calendar_semester_id_seq OWNER TO postgres;

--
-- Name: semester_calendar_semester_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.semester_calendar_semester_id_seq OWNED BY public.semester_calendar.semester_id;


--
-- Name: student_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_records (
    record_id integer NOT NULL,
    student_id integer,
    course_id integer,
    semester character varying(20),
    year integer,
    grade character varying(5),
    attendance_percentage numeric(10,1),
    submission_timestamp timestamp with time zone,
    extra_credit_points numeric(10,1) DEFAULT 0.0,
    final_exam_date date
);


ALTER TABLE public.student_records OWNER TO postgres;

--
-- Name: student_records_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_records_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_records_record_id_seq OWNER TO postgres;

--
-- Name: student_records_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_records_record_id_seq OWNED BY public.student_records.record_id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    student_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
    phone character varying(20),
    date_of_birth date,
    enrollment_date date,
    gpa numeric(3,2) DEFAULT 0.00,
    is_active boolean,
    graduation_year smallint,
    middle_name character varying(30),
    student_status character varying(20) DEFAULT 'ACTIVE'::character varying,
    advisor_id integer
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_student_id_seq OWNER TO postgres;

--
-- Name: students_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_student_id_seq OWNED BY public.students.student_id;


--
-- Name: class_schedule schedule_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class_schedule ALTER COLUMN schedule_id SET DEFAULT nextval('public.class_schedule_schedule_id_seq'::regclass);


--
-- Name: courses course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN course_id SET DEFAULT nextval('public.courses_course_id_seq'::regclass);


--
-- Name: departments department_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN department_id SET DEFAULT nextval('public.departments_department_id_seq'::regclass);


--
-- Name: grade_scale grade_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade_scale ALTER COLUMN grade_id SET DEFAULT nextval('public.grade_scale_grade_id_seq'::regclass);


--
-- Name: professors professor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors ALTER COLUMN professor_id SET DEFAULT nextval('public.professors_professor_id_seq'::regclass);


--
-- Name: semester_calendar semester_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semester_calendar ALTER COLUMN semester_id SET DEFAULT nextval('public.semester_calendar_semester_id_seq'::regclass);


--
-- Name: student_records record_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_records ALTER COLUMN record_id SET DEFAULT nextval('public.student_records_record_id_seq'::regclass);


--
-- Name: students student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN student_id SET DEFAULT nextval('public.students_student_id_seq'::regclass);


--
-- Data for Name: class_schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.class_schedule (schedule_id, course_id, professor_id, classroom, class_date, start_time, end_time, room_capacity, session_type, equipment_needed) FROM stdin;
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (course_id, course_code, course_title, description, credits, course_fee, is_online, created_at, prerequisite_course_id, difficulty_level, lab_required, department_id) FROM stdin;
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (department_id, department_name, department_code, building, phone, budget, established_year) FROM stdin;
\.


--
-- Data for Name: grade_scale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grade_scale (grade_id, letter_grade, min_percentage, max_percentage, gpa_points, description) FROM stdin;
\.


--
-- Data for Name: professors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.professors (professor_id, first_name, last_name, email, office_number, hire_date, salary, is_tenured, years_experience, department_code, research_area, last_promotion_date, department_id) FROM stdin;
\.


--
-- Data for Name: semester_calendar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.semester_calendar (semester_id, semester_name, academic_year, start_date, end_date, registration_deadline) FROM stdin;
\.


--
-- Data for Name: student_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_records (record_id, student_id, course_id, semester, year, grade, attendance_percentage, submission_timestamp, extra_credit_points, final_exam_date) FROM stdin;
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (student_id, first_name, last_name, email, phone, date_of_birth, enrollment_date, gpa, is_active, graduation_year, middle_name, student_status, advisor_id) FROM stdin;
\.


--
-- Name: class_schedule_schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.class_schedule_schedule_id_seq', 1, false);


--
-- Name: courses_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_course_id_seq', 1, false);


--
-- Name: departments_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_department_id_seq', 1, false);


--
-- Name: grade_scale_grade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grade_scale_grade_id_seq', 1, false);


--
-- Name: professors_professor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.professors_professor_id_seq', 1, false);


--
-- Name: semester_calendar_semester_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.semester_calendar_semester_id_seq', 1, false);


--
-- Name: student_records_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_records_record_id_seq', 1, false);


--
-- Name: students_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_student_id_seq', 1, false);


--
-- Name: grade_scale grade_scale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade_scale
    ADD CONSTRAINT grade_scale_pkey PRIMARY KEY (grade_id);


--
-- Name: courses id_course; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT id_course PRIMARY KEY (course_id);


--
-- Name: departments id_department; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT id_department PRIMARY KEY (department_id);


--
-- Name: professors id_professor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors
    ADD CONSTRAINT id_professor PRIMARY KEY (professor_id);


--
-- Name: student_records id_record; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_records
    ADD CONSTRAINT id_record PRIMARY KEY (record_id);


--
-- Name: class_schedule id_schedule; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class_schedule
    ADD CONSTRAINT id_schedule PRIMARY KEY (schedule_id);


--
-- Name: students id_student; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT id_student PRIMARY KEY (student_id);


--
-- Name: semester_calendar semester_calendar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semester_calendar
    ADD CONSTRAINT semester_calendar_pkey PRIMARY KEY (semester_id);


--
-- PostgreSQL database dump complete
--

\unrestrict zor8keDh1NbG7gioFIxbpo9eMBH6COrS2MYCLPje9doo3HTqZuxjB9Wmdy0nQFd

--
-- Database "university_test" dump
--

--
-- PostgreSQL database dump
--

\restrict HtPApv35Uwnmxkfvfsh0rq50fhg9BuF8zo5bbdZHMbOoUAlEvhqNVnjkbxJeVGC

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: university_test; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE university_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE university_test OWNER TO postgres;

\unrestrict HtPApv35Uwnmxkfvfsh0rq50fhg9BuF8zo5bbdZHMbOoUAlEvhqNVnjkbxJeVGC
\connect university_test
\restrict HtPApv35Uwnmxkfvfsh0rq50fhg9BuF8zo5bbdZHMbOoUAlEvhqNVnjkbxJeVGC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: university_test; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE university_test CONNECTION LIMIT = 10;
ALTER DATABASE university_test IS_TEMPLATE = true;


\unrestrict HtPApv35Uwnmxkfvfsh0rq50fhg9BuF8zo5bbdZHMbOoUAlEvhqNVnjkbxJeVGC
\connect university_test
\restrict HtPApv35Uwnmxkfvfsh0rq50fhg9BuF8zo5bbdZHMbOoUAlEvhqNVnjkbxJeVGC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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

\unrestrict HtPApv35Uwnmxkfvfsh0rq50fhg9BuF8zo5bbdZHMbOoUAlEvhqNVnjkbxJeVGC

--
-- PostgreSQL database cluster dump complete
--

