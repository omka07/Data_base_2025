--
-- PostgreSQL database dump
--

\restrict q9NEfRkW74I6AxPwqS8lGSfrOC4Ijl7lGsDnAxwtQoJDQFVQQhTN2Fmfa0WKoWk

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
    emp_name character varying(100),
    dept_id integer,
    salary numeric(10,2),
    email character varying(100),
    phone character varying(20),
    hire_date date
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: index_documentation; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.index_documentation AS
 SELECT tablename,
    indexname,
    indexdef,
    'Improves salary-based queries'::text AS purpose
   FROM pg_indexes
  WHERE ((schemaname = 'public'::name) AND (indexname ~~ '%salary%'::text));


ALTER VIEW public.index_documentation OWNER TO postgres;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    proj_id integer NOT NULL,
    proj_name character varying(50),
    budget numeric(12,2),
    dept_id integer
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (dept_id, dept_name, location) FROM stdin;
101	IT	Building A
102	HR	Building B
103	Operations	Building C
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (emp_id, emp_name, dept_id, salary, email, phone, hire_date) FROM stdin;
1	John Smith	101	50000.00	john.smith@company.com	\N	2020-01-15
2	Jane Doe	101	55000.00	jane.doe@company.com	\N	2019-06-20
3	Mike Johnson	102	48000.00	mike.johnson@company.com	\N	2021-03-10
4	Sarah Williams	102	52000.00	sarah.williams@company.com	\N	2020-11-05
5	Tom Brown	103	60000.00	tom.brown@company.com	\N	2018-08-25
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (proj_id, proj_name, budget, dept_id) FROM stdin;
201	Website Redesign	75000.00	101
202	Database Migration	120000.00	101
203	HR System Upgrade	50000.00	102
\.


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_id);


--
-- Name: employees employees_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_phone_key UNIQUE (phone);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (proj_id);


--
-- Name: dept_name_hash_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX dept_name_hash_idx ON public.departments USING hash (dept_name);


--
-- Name: emp_dept_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX emp_dept_idx ON public.employees USING btree (dept_id);


--
-- Name: emp_dept_salary_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX emp_dept_salary_idx ON public.employees USING btree (dept_id, salary);


--
-- Name: emp_email_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX emp_email_idx ON public.employees USING btree (email);


--
-- Name: emp_hire_year_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX emp_hire_year_idx ON public.employees USING btree (EXTRACT(year FROM hire_date));


--
-- Name: emp_name_lower_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX emp_name_lower_idx ON public.employees USING btree (lower((emp_name)::text));


--
-- Name: emp_salary_dept_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX emp_salary_dept_id ON public.employees USING btree (salary, dept_id);


--
-- Name: emp_salary_desc_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX emp_salary_desc_idx ON public.employees USING btree (salary DESC);


--
-- Name: employees_salary_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX employees_salary_index ON public.employees USING btree (salary);


--
-- Name: proj_budget_nulls_first_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX proj_budget_nulls_first_idx ON public.projects USING btree (budget NULLS FIRST);


--
-- Name: proj_high_budget_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX proj_high_budget_idx ON public.projects USING btree (budget) WHERE (budget > (80000)::numeric);


--
-- Name: proj_name_btree_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX proj_name_btree_idx ON public.projects USING btree (proj_name);


--
-- Name: employees employees_dept_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_dept_id_fkey FOREIGN KEY (dept_id) REFERENCES public.departments(dept_id);


--
-- Name: projects projects_dept_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_dept_id_fkey FOREIGN KEY (dept_id) REFERENCES public.departments(dept_id);


--
-- PostgreSQL database dump complete
--

\unrestrict q9NEfRkW74I6AxPwqS8lGSfrOC4Ijl7lGsDnAxwtQoJDQFVQQhTN2Fmfa0WKoWk

