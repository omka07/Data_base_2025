--
-- PostgreSQL database dump
--

\restrict gjEeTF3Cg628RvUyLJf0Bz4v0nAzwcraOBkxrPsKeAgM8vnprChBcwcWkzGUujU

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-10-15 23:48:05

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
-- TOC entry 226 (class 1259 OID 49227)
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    author_id integer NOT NULL,
    author_name text NOT NULL,
    country text
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 49166)
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    booking_id integer,
    check_in_date date,
    check_out_date date,
    num_guests integer,
    CONSTRAINT bookings_check CHECK ((check_out_date > check_in_date)),
    CONSTRAINT bookings_num_guests_check CHECK (((num_guests >= 1) AND (num_guests <= 10)))
);


ALTER TABLE public.bookings OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 49241)
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    book_id integer NOT NULL,
    title text NOT NULL,
    author_id integer,
    publisher_id integer,
    publication_year integer,
    isbn text
);


ALTER TABLE public.books OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 49260)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name text NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 49171)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    email text NOT NULL,
    phone text,
    registration_date date NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 49201)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    dept_id integer NOT NULL,
    dept_name text NOT NULL,
    location text
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 49300)
-- Name: ecommerce_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ecommerce_customers (
    customer_id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    phone text,
    registration_date date NOT NULL
);


ALTER TABLE public.ecommerce_customers OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 49333)
-- Name: ecommerce_order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ecommerce_order_details (
    order_detail_id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer,
    unit_price numeric,
    CONSTRAINT ecommerce_order_details_quantity_check CHECK ((quantity > 0)),
    CONSTRAINT ecommerce_order_details_unit_price_check CHECK ((unit_price >= (0)::numeric))
);


ALTER TABLE public.ecommerce_order_details OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 49319)
-- Name: ecommerce_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ecommerce_orders (
    order_id integer NOT NULL,
    customer_id integer,
    order_date date NOT NULL,
    total_amount numeric,
    status text,
    CONSTRAINT ecommerce_orders_status_check CHECK ((status = ANY (ARRAY['pending'::text, 'processing'::text, 'shipped'::text, 'delivered'::text, 'cancelled'::text]))),
    CONSTRAINT ecommerce_orders_total_amount_check CHECK ((total_amount >= (0)::numeric))
);


ALTER TABLE public.ecommerce_orders OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 49309)
-- Name: ecommerce_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ecommerce_products (
    product_id integer NOT NULL,
    name text NOT NULL,
    description text,
    price numeric,
    stock_quantity integer,
    CONSTRAINT ecommerce_products_price_check CHECK ((price >= (0)::numeric)),
    CONSTRAINT ecommerce_products_stock_quantity_check CHECK ((stock_quantity >= 0))
);


ALTER TABLE public.ecommerce_products OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 49153)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employee_id integer,
    first_name text,
    last_name text,
    age integer,
    salary numeric,
    CONSTRAINT employees_age_check CHECK (((age >= 18) AND (age <= 65))),
    CONSTRAINT employees_salary_check CHECK ((salary > (0)::numeric))
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 49215)
-- Name: employees_dept; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees_dept (
    emp_id integer NOT NULL,
    emp_name text NOT NULL,
    dept_id integer,
    hire_date date
);


ALTER TABLE public.employees_dept OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 49176)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    item_id integer NOT NULL,
    item_name text NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric NOT NULL,
    last_updated timestamp without time zone NOT NULL,
    CONSTRAINT inventory_quantity_check CHECK ((quantity >= 0)),
    CONSTRAINT inventory_unit_price_check CHECK ((unit_price > (0)::numeric))
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 49284)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    item_id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer,
    CONSTRAINT order_items_quantity_check CHECK ((quantity > 0))
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 49279)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    order_date date NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 49160)
-- Name: products_catalog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_catalog (
    product_id integer,
    product_name text,
    regular_price numeric,
    discount_price numeric,
    CONSTRAINT valid_discount CHECK (((regular_price > (0)::numeric) AND (discount_price > (0)::numeric) AND (discount_price < regular_price)))
);


ALTER TABLE public.products_catalog OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 49267)
-- Name: products_fk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_fk (
    product_id integer NOT NULL,
    product_name text NOT NULL,
    category_id integer
);


ALTER TABLE public.products_fk OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 49234)
-- Name: publishers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publishers (
    publisher_id integer NOT NULL,
    publisher_name text NOT NULL,
    city text
);


ALTER TABLE public.publishers OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 49208)
-- Name: student_courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_courses (
    student_id integer NOT NULL,
    course_id integer NOT NULL,
    enrollment_date date,
    grade text
);


ALTER TABLE public.student_courses OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 49192)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer,
    username text,
    email text,
    created_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 5030 (class 0 OID 49227)
-- Dependencies: 226
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (author_id, author_name, country) FROM stdin;
1	J.K. Rowling	UK
2	George R.R. Martin	USA
3	Stephen King	USA
\.


--
-- TOC entry 5023 (class 0 OID 49166)
-- Dependencies: 219
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (booking_id, check_in_date, check_out_date, num_guests) FROM stdin;
1	2024-01-15	2024-01-20	2
2	2024-02-01	2024-02-05	4
\.


--
-- TOC entry 5032 (class 0 OID 49241)
-- Dependencies: 228
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (book_id, title, author_id, publisher_id, publication_year, isbn) FROM stdin;
1	Harry Potter and the Philosopher's Stone	1	1	1997	978-0747532699
2	A Game of Thrones	2	2	1996	978-0553103540
3	The Shining	3	3	1977	978-0307743657
4	Harry Potter and the Chamber of Secrets	1	1	1998	978-0747538493
5	A Clash of Kings	2	2	1998	978-0553108033
\.


--
-- TOC entry 5033 (class 0 OID 49260)
-- Dependencies: 229
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (category_id, category_name) FROM stdin;
1	Electronics
2	Books
3	Clothing
\.


--
-- TOC entry 5024 (class 0 OID 49171)
-- Dependencies: 220
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, email, phone, registration_date) FROM stdin;
1	customer1@email.com	123-456-7890	2024-01-01
2	customer2@email.com	\N	2024-01-02
\.


--
-- TOC entry 5027 (class 0 OID 49201)
-- Dependencies: 223
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (dept_id, dept_name, location) FROM stdin;
1	HR	New York
2	IT	San Francisco
3	Finance	Chicago
4	Marketing	Boston
\.


--
-- TOC entry 5037 (class 0 OID 49300)
-- Dependencies: 233
-- Data for Name: ecommerce_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ecommerce_customers (customer_id, name, email, phone, registration_date) FROM stdin;
1	John Smith	john.smith@email.com	123-456-7890	2024-01-01
2	Emma Johnson	emma.johnson@email.com	123-456-7891	2024-01-02
3	Michael Brown	michael.brown@email.com	123-456-7892	2024-01-03
4	Sarah Davis	sarah.davis@email.com	123-456-7893	2024-01-04
5	David Wilson	david.wilson@email.com	123-456-7894	2024-01-05
\.


--
-- TOC entry 5040 (class 0 OID 49333)
-- Dependencies: 236
-- Data for Name: ecommerce_order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ecommerce_order_details (order_detail_id, order_id, product_id, quantity, unit_price) FROM stdin;
1	1	1	1	999.99
2	1	3	1	199.99
3	2	2	1	699.99
4	3	4	1	399.99
5	3	5	1	249.99
6	4	1	1	999.99
7	4	2	1	699.99
8	5	3	1	199.99
\.


--
-- TOC entry 5039 (class 0 OID 49319)
-- Dependencies: 235
-- Data for Name: ecommerce_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ecommerce_orders (order_id, customer_id, order_date, total_amount, status) FROM stdin;
1	1	2024-01-10	1299.98	delivered
2	2	2024-01-11	699.99	processing
3	3	2024-01-12	449.98	shipped
4	4	2024-01-13	849.97	pending
5	5	2024-01-14	199.99	cancelled
\.


--
-- TOC entry 5038 (class 0 OID 49309)
-- Dependencies: 234
-- Data for Name: ecommerce_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ecommerce_products (product_id, name, description, price, stock_quantity) FROM stdin;
1	Laptop	High-performance laptop	999.99	50
2	Smartphone	Latest smartphone model	699.99	100
3	Headphones	Wireless noise-cancelling headphones	199.99	75
4	Tablet	10-inch tablet	399.99	30
5	Smartwatch	Fitness tracking smartwatch	249.99	60
\.


--
-- TOC entry 5021 (class 0 OID 49153)
-- Dependencies: 217
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (employee_id, first_name, last_name, age, salary) FROM stdin;
1	John	Doe	25	50000
2	Jane	Smith	30	60000
\.


--
-- TOC entry 5029 (class 0 OID 49215)
-- Dependencies: 225
-- Data for Name: employees_dept; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees_dept (emp_id, emp_name, dept_id, hire_date) FROM stdin;
1	Alice Johnson	1	2023-01-15
2	Bob Wilson	2	2023-02-20
\.


--
-- TOC entry 5025 (class 0 OID 49176)
-- Dependencies: 221
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory (item_id, item_name, quantity, unit_price, last_updated) FROM stdin;
1	Product A	100	19.99	2024-01-01 10:00:00
2	Product B	50	29.99	2024-01-01 11:00:00
\.


--
-- TOC entry 5036 (class 0 OID 49284)
-- Dependencies: 232
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (item_id, order_id, product_id, quantity) FROM stdin;
1	1	1	2
2	1	2	1
3	2	3	5
\.


--
-- TOC entry 5035 (class 0 OID 49279)
-- Dependencies: 231
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, order_date) FROM stdin;
1	2024-01-15
2	2024-01-16
\.


--
-- TOC entry 5022 (class 0 OID 49160)
-- Dependencies: 218
-- Data for Name: products_catalog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_catalog (product_id, product_name, regular_price, discount_price) FROM stdin;
1	Laptop	1000	800
2	Mouse	50	40
\.


--
-- TOC entry 5034 (class 0 OID 49267)
-- Dependencies: 230
-- Data for Name: products_fk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_fk (product_id, product_name, category_id) FROM stdin;
1	Laptop	1
2	Smartphone	1
3	Novel	2
\.


--
-- TOC entry 5031 (class 0 OID 49234)
-- Dependencies: 227
-- Data for Name: publishers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.publishers (publisher_id, publisher_name, city) FROM stdin;
1	Penguin Random House	New York
2	HarperCollins	London
3	Simon & Schuster	New York
\.


--
-- TOC entry 5028 (class 0 OID 49208)
-- Dependencies: 224
-- Data for Name: student_courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_courses (student_id, course_id, enrollment_date, grade) FROM stdin;
\.


--
-- TOC entry 5026 (class 0 OID 49192)
-- Dependencies: 222
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, email, created_at) FROM stdin;
1	user1	user1@email.com	2024-01-01 10:00:00
2	user2	user2@email.com	2024-01-01 11:00:00
\.


--
-- TOC entry 4842 (class 2606 OID 49233)
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (author_id);


--
-- TOC entry 4846 (class 2606 OID 49249)
-- Name: books books_isbn_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_isbn_key UNIQUE (isbn);


--
-- TOC entry 4848 (class 2606 OID 49247)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (book_id);


--
-- TOC entry 4850 (class 2606 OID 49266)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- TOC entry 4836 (class 2606 OID 49207)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_id);


--
-- TOC entry 4858 (class 2606 OID 49308)
-- Name: ecommerce_customers ecommerce_customers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecommerce_customers
    ADD CONSTRAINT ecommerce_customers_email_key UNIQUE (email);


--
-- TOC entry 4860 (class 2606 OID 49306)
-- Name: ecommerce_customers ecommerce_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecommerce_customers
    ADD CONSTRAINT ecommerce_customers_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 4866 (class 2606 OID 49341)
-- Name: ecommerce_order_details ecommerce_order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecommerce_order_details
    ADD CONSTRAINT ecommerce_order_details_pkey PRIMARY KEY (order_detail_id);


--
-- TOC entry 4864 (class 2606 OID 49327)
-- Name: ecommerce_orders ecommerce_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecommerce_orders
    ADD CONSTRAINT ecommerce_orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 4862 (class 2606 OID 49317)
-- Name: ecommerce_products ecommerce_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecommerce_products
    ADD CONSTRAINT ecommerce_products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4840 (class 2606 OID 49221)
-- Name: employees_dept employees_dept_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees_dept
    ADD CONSTRAINT employees_dept_pkey PRIMARY KEY (emp_id);


--
-- TOC entry 4856 (class 2606 OID 49289)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (item_id);


--
-- TOC entry 4854 (class 2606 OID 49283)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 4852 (class 2606 OID 49273)
-- Name: products_fk products_fk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_fk
    ADD CONSTRAINT products_fk_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4844 (class 2606 OID 49240)
-- Name: publishers publishers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publishers
    ADD CONSTRAINT publishers_pkey PRIMARY KEY (publisher_id);


--
-- TOC entry 4838 (class 2606 OID 49214)
-- Name: student_courses student_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_courses
    ADD CONSTRAINT student_courses_pkey PRIMARY KEY (student_id, course_id);


--
-- TOC entry 4832 (class 2606 OID 49200)
-- Name: users unique_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_email UNIQUE (email);


--
-- TOC entry 4834 (class 2606 OID 49198)
-- Name: users unique_username; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_username UNIQUE (username);


--
-- TOC entry 4868 (class 2606 OID 49250)
-- Name: books books_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.authors(author_id);


--
-- TOC entry 4869 (class 2606 OID 49255)
-- Name: books books_publisher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_publisher_id_fkey FOREIGN KEY (publisher_id) REFERENCES public.publishers(publisher_id);


--
-- TOC entry 4874 (class 2606 OID 49342)
-- Name: ecommerce_order_details ecommerce_order_details_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecommerce_order_details
    ADD CONSTRAINT ecommerce_order_details_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.ecommerce_orders(order_id) ON DELETE CASCADE;


--
-- TOC entry 4875 (class 2606 OID 49347)
-- Name: ecommerce_order_details ecommerce_order_details_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecommerce_order_details
    ADD CONSTRAINT ecommerce_order_details_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.ecommerce_products(product_id) ON DELETE RESTRICT;


--
-- TOC entry 4873 (class 2606 OID 49328)
-- Name: ecommerce_orders ecommerce_orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecommerce_orders
    ADD CONSTRAINT ecommerce_orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.ecommerce_customers(customer_id) ON DELETE RESTRICT;


--
-- TOC entry 4867 (class 2606 OID 49222)
-- Name: employees_dept employees_dept_dept_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees_dept
    ADD CONSTRAINT employees_dept_dept_id_fkey FOREIGN KEY (dept_id) REFERENCES public.departments(dept_id);


--
-- TOC entry 4871 (class 2606 OID 49290)
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE CASCADE;


--
-- TOC entry 4872 (class 2606 OID 49295)
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products_fk(product_id);


--
-- TOC entry 4870 (class 2606 OID 49274)
-- Name: products_fk products_fk_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_fk
    ADD CONSTRAINT products_fk_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id) ON DELETE RESTRICT;


-- Completed on 2025-10-15 23:48:06

--
-- PostgreSQL database dump complete
--

\unrestrict gjEeTF3Cg628RvUyLJf0Bz4v0nAzwcraOBkxrPsKeAgM8vnprChBcwcWkzGUujU

