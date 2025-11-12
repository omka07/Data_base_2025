--
-- PostgreSQL database dump
--

\restrict nC35YXsaU3q8D6goF4HT5rCKx9cr5VVTIA5hr91gOZ0xkgFN4n8EHMkd1qBVdmd

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
-- Name: dept_statistic; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.dept_statistic AS
 SELECT d.dept_name,
    count(e.emp_id) AS employee_count,
    avg(e.salary) AS average_salary,
    max(e.salary) AS maximum_salary,
    min(e.salary) AS minimum_salary
   FROM (public.departments d
     LEFT JOIN public.employees e ON ((d.dept_id = e.dept_id)))
  GROUP BY d.dept_name;


ALTER VIEW public.dept_statistic OWNER TO postgres;

--
-- Name: dept_statistics; Type: VIEW; Schema: public; Owner: project_manager
--

CREATE VIEW public.dept_statistics AS
 SELECT d.dept_name,
    count(e.emp_id) AS employee_count,
    avg(e.salary) AS average_salary,
    max(e.salary) AS maximum_salary,
    min(e.salary) AS minimum_salary
   FROM (public.departments d
     JOIN public.employees e ON ((d.dept_id = e.dept_id)))
  GROUP BY d.dept_name;


ALTER VIEW public.dept_statistics OWNER TO project_manager;

--
-- Name: employee_details; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.employee_details AS
 SELECT e.emp_name,
    e.salary,
    d.dept_name,
    d.location,
        CASE
            WHEN (e.salary > (60000)::numeric) THEN 'High'::text
            WHEN (e.salary > (50000)::numeric) THEN 'Medium'::text
            ELSE 'Standart'::text
        END AS salary_grade
   FROM (public.employees e
     JOIN public.departments d ON ((e.dept_id = d.dept_id)));


ALTER VIEW public.employee_details OWNER TO postgres;

--
-- Name: employee_salary; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.employee_salary AS
 SELECT emp_id,
    emp_name,
    dept_id,
    salary
   FROM public.employees;


ALTER VIEW public.employee_salary OWNER TO postgres;

--
-- Name: it_employees; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.it_employees AS
 SELECT emp_id,
    emp_name,
    dept_id,
    salary
   FROM public.employees
  WHERE (dept_id = 101)
  WITH LOCAL CHECK OPTION;


ALTER VIEW public.it_employees OWNER TO postgres;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: project_manager
--

CREATE TABLE public.projects (
    project_id integer NOT NULL,
    project_name character varying(50),
    dept_id integer,
    budget numeric(10,2)
);


ALTER TABLE public.projects OWNER TO project_manager;

--
-- Name: project_overview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.project_overview AS
 SELECT p.project_name,
    p.budget,
    d.dept_name,
    d.location,
    count(e.emp_id) AS team_size
   FROM ((public.projects p
     JOIN public.departments d ON ((p.dept_id = d.dept_id)))
     LEFT JOIN public.employees e ON ((d.dept_id = e.dept_id)))
  GROUP BY p.project_name, p.budget, d.dept_name, d.location;


ALTER VIEW public.project_overview OWNER TO postgres;

--
-- Name: project_stats_mv; Type: MATERIALIZED VIEW; Schema: public; Owner: postgres
--

CREATE MATERIALIZED VIEW public.project_stats_mv AS
 SELECT p.project_name,
    p.budget,
    d.dept_name,
    count(e.emp_id) AS employee_count
   FROM ((public.projects p
     LEFT JOIN public.departments d ON ((p.dept_id = d.dept_id)))
     LEFT JOIN public.employees e ON ((d.dept_id = e.dept_id)))
  GROUP BY p.project_name, p.budget, d.dept_name
  WITH NO DATA;


ALTER MATERIALIZED VIEW public.project_stats_mv OWNER TO postgres;

--
-- Name: temp_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temp_table (
    id integer
);


ALTER TABLE public.temp_table OWNER TO postgres;

--
-- Name: top_performers; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.top_performers AS
 SELECT e.emp_name,
    e.salary,
    d.dept_name
   FROM (public.employees e
     LEFT JOIN public.departments d ON ((e.dept_id = d.dept_id)))
  WHERE (e.salary > (55000)::numeric);


ALTER VIEW public.top_performers OWNER TO postgres;

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
2	Jane Doe	102	60000.00	3
3	Mike Johnson	101	55000.00	\N
4	Sarah Williams	103	65000.00	3
5	Tom Brown	\N	45000.00	3
1	John Smith	101	57000.00	3
6	Alice Johnson	102	58000.00	\N
8	Charlie Brown	101	54000.00	\N
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: project_manager
--

COPY public.projects (project_id, project_name, dept_id, budget) FROM stdin;
1	Website Redesign	101	100000.00
2	Employee Training	102	50000.00
3	Budget Analysis	103	75000.00
4	Cloud Migration	101	150000.00
5	AI Research	\N	200000.00
\.


--
-- Data for Name: temp_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temp_table (id) FROM stdin;
\.


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_id);


--
-- Name: dept_summary_mv; Type: MATERIALIZED VIEW; Schema: public; Owner: postgres
--

CREATE MATERIALIZED VIEW public.dept_summary_mv AS
 SELECT d.dept_id,
    d.dept_name,
    COALESCE(count(e.emp_id), (0)::bigint) AS total_employees,
    COALESCE(sum(e.salary), (0)::numeric) AS total_salaries,
    COALESCE(count(DISTINCT p.project_id), (0)::bigint) AS total_projects,
    COALESCE(sum(p.budget), (0)::numeric) AS total_project_budget
   FROM ((public.departments d
     LEFT JOIN public.employees e ON ((d.dept_id = e.dept_id)))
     LEFT JOIN public.projects p ON ((d.dept_id = p.dept_id)))
  GROUP BY d.dept_id
  WITH NO DATA;


ALTER MATERIALIZED VIEW public.dept_summary_mv OWNER TO postgres;

--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: project_manager
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (project_id);


--
-- Name: dept_summary_mv_dept_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX dept_summary_mv_dept_id_idx ON public.dept_summary_mv USING btree (dept_id);


--
-- Name: TABLE departments; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.departments TO analyst;


--
-- Name: TABLE employees; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.employees TO analyst;
GRANT SELECT,INSERT ON TABLE public.employees TO report_user;
GRANT SELECT ON TABLE public.employees TO hr_team;


--
-- Name: TABLE dept_statistics; Type: ACL; Schema: public; Owner: project_manager
--

GRANT SELECT ON TABLE public.dept_statistics TO finance_team;


--
-- Name: TABLE projects; Type: ACL; Schema: public; Owner: project_manager
--

GRANT SELECT ON TABLE public.projects TO analyst;


--
-- Name: dept_summary_mv; Type: MATERIALIZED VIEW DATA; Schema: public; Owner: postgres
--

REFRESH MATERIALIZED VIEW public.dept_summary_mv;


--
-- PostgreSQL database dump complete
--

\unrestrict nC35YXsaU3q8D6goF4HT5rCKx9cr5VVTIA5hr91gOZ0xkgFN4n8EHMkd1qBVdmd

