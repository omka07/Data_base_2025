--
-- PostgreSQL database dump
--

\restrict HoJ9rTJOQRo9cSst50NjN36cANRmf06r5gtcqC8dfSXGjLmwNcIoMlOZQZcCJF8

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    dept_id integer NOT NULL,
    dept_name character varying(50),
    location character varying(50)
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    emp_id integer NOT NULL,
    emp_name character varying(50),
    dept_id integer,
    salary numeric(10,2),
    manager_id integer
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    project_id integer NOT NULL,
    project_name character varying(50),
    dept_id integer,
    budget numeric(10,2)
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (dept_id, dept_name, location) FROM stdin;
101	IT	Building A
102	HR	Building B
103	Finance	Building C
104	Marketing	Building D
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (emp_id, emp_name, dept_id, salary, manager_id) FROM stdin;
1	John Smith	101	50000.00	3
2	Jane Doe	102	60000.00	3
3	Mike Johnson	101	55000.00	\N
4	Sarah Williams	103	65000.00	3
5	Tom Brown	\N	45000.00	3
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (project_id, project_name, dept_id, budget) FROM stdin;
1	Website Redesign	101	100000.00
2	Employee Training	102	50000.00
3	Budget Analysis	103	75000.00
4	Cloud Migration	101	150000.00
5	AI Research	\N	200000.00
\.


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (project_id);


--
-- PostgreSQL database dump complete
--

\unrestrict HoJ9rTJOQRo9cSst50NjN36cANRmf06r5gtcqC8dfSXGjLmwNcIoMlOZQZcCJF8

