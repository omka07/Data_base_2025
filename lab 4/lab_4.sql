--
-- PostgreSQL database dump
--

\restrict 3htBynaX73yp4oaGZHKthCeFUnQBsem8jUjdEAMhH7p5UVMZ7JaRcSf5mjRoJR1

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-10-08 22:52:52

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
-- TOC entry 222 (class 1259 OID 41025)
-- Name: assignments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assignments (
    assignment_id integer NOT NULL,
    employee_id integer,
    project_id integer,
    hours_worked numeric(5,1),
    assignment_date date
);


ALTER TABLE public.assignments OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 41024)
-- Name: assignments_assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assignments_assignment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.assignments_assignment_id_seq OWNER TO postgres;

--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 221
-- Name: assignments_assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assignments_assignment_id_seq OWNED BY public.assignments.assignment_id;


--
-- TOC entry 218 (class 1259 OID 41011)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    department character varying(50),
    salary numeric(10,2),
    hire_date date,
    manager_id integer,
    email character varying(100)
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 41010)
-- Name: employees_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employees_employee_id_seq OWNER TO postgres;

--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 217
-- Name: employees_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_employee_id_seq OWNED BY public.employees.employee_id;


--
-- TOC entry 220 (class 1259 OID 41018)
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    project_id integer NOT NULL,
    project_name character varying(100),
    budget numeric(12,2),
    start_date date,
    end_date date,
    status character varying(20)
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 41017)
-- Name: projects_project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_project_id_seq OWNER TO postgres;

--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 219
-- Name: projects_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_project_id_seq OWNED BY public.projects.project_id;


--
-- TOC entry 4754 (class 2604 OID 41028)
-- Name: assignments assignment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments ALTER COLUMN assignment_id SET DEFAULT nextval('public.assignments_assignment_id_seq'::regclass);


--
-- TOC entry 4752 (class 2604 OID 41014)
-- Name: employees employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN employee_id SET DEFAULT nextval('public.employees_employee_id_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 41021)
-- Name: projects project_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN project_id SET DEFAULT nextval('public.projects_project_id_seq'::regclass);


--
-- TOC entry 4913 (class 0 OID 41025)
-- Dependencies: 222
-- Data for Name: assignments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assignments (assignment_id, employee_id, project_id, hours_worked, assignment_date) FROM stdin;
1	1	1	120.5	2024-01-15
2	2	1	95.0	2024-01-20
3	1	4	80.0	2024-02-01
4	3	3	60.0	2024-03-05
5	5	2	110.0	2024-02-20
6	6	3	75.5	2024-03-10
\.


--
-- TOC entry 4909 (class 0 OID 41011)
-- Dependencies: 218
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (employee_id, first_name, last_name, department, salary, hire_date, manager_id, email) FROM stdin;
1	John	Smith	IT	75000.00	2020-01-15	\N	john.smith@company.com
2	Sarah	Johnson	IT	65000.00	2020-03-20	1	sarah.j@company.com
3	Michael	Brown	Sales	55000.00	2019-06-10	\N	mbrown@company.com
4	Emily	Davis	HR	60000.00	2021-02-01	\N	emily.davis@company.com
5	Robert	Wilson	IT	70000.00	2020-08-15	1	\N
6	Lisa	Anderson	Sales	58000.00	2021-05-20	3	lisa.a@company.com
\.


--
-- TOC entry 4911 (class 0 OID 41018)
-- Dependencies: 220
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (project_id, project_name, budget, start_date, end_date, status) FROM stdin;
1	Website Redesign	150000.00	2024-01-01	2024-06-30	Active
2	CRM Implementation	200000.00	2024-02-15	2024-12-31	Active
3	Marketing Campaign	80000.00	2024-03-01	2024-05-31	Completed
4	Database Migration	120000.00	2024-01-10	\N	Active
\.


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 221
-- Name: assignments_assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assignments_assignment_id_seq', 6, true);


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 217
-- Name: employees_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_employee_id_seq', 6, true);


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 219
-- Name: projects_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_project_id_seq', 4, true);


--
-- TOC entry 4760 (class 2606 OID 41030)
-- Name: assignments assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (assignment_id);


--
-- TOC entry 4756 (class 2606 OID 41016)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 4758 (class 2606 OID 41023)
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (project_id);


--
-- TOC entry 4761 (class 2606 OID 41031)
-- Name: assignments assignments_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);


--
-- TOC entry 4762 (class 2606 OID 41036)
-- Name: assignments assignments_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(project_id);


-- Completed on 2025-10-08 22:52:52

--
-- PostgreSQL database dump complete
--

\unrestrict 3htBynaX73yp4oaGZHKthCeFUnQBsem8jUjdEAMhH7p5UVMZ7JaRcSf5mjRoJR1

