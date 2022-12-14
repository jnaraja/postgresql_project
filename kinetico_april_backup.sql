toc.dat                                                                                             0000600 0004000 0002000 00000017463 14304171454 0014455 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                            z           kineteco    14.5    14.5                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    16405    kineteco    DATABASE     S   CREATE DATABASE kineteco WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE kineteco;
                postgres    false                     2615    16407    human_resources    SCHEMA        CREATE SCHEMA human_resources;
    DROP SCHEMA human_resources;
                postgres    false                     2615    16406    manufacturing    SCHEMA        CREATE SCHEMA manufacturing;
    DROP SCHEMA manufacturing;
                postgres    false         ?            1259    16444    departments    TABLE     ?   CREATE TABLE human_resources.departments (
    department_id integer NOT NULL,
    department_name character varying(50) NOT NULL,
    building character varying(50) NOT NULL
);
 (   DROP TABLE human_resources.departments;
       human_resources         heap    postgres    false    7         ?            1259    16449 	   employees    TABLE     ?   CREATE TABLE human_resources.employees (
    employee_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    hire_date date NOT NULL,
    department_id integer DEFAULT 800 NOT NULL
);
 &   DROP TABLE human_resources.employees;
       human_resources         heap    postgres    false    7         ?            1259    16413 
   categories    TABLE       CREATE TABLE manufacturing.categories (
    category_id integer NOT NULL,
    name character varying(50) NOT NULL,
    market character varying(20) NOT NULL,
    CONSTRAINT categories_market_check CHECK ((((market)::text = 'domestic'::text) OR ((market)::text = 'industrial'::text)))
);
 %   DROP TABLE manufacturing.categories;
       manufacturing         heap    postgres    false    5         ?            1259    16408    products    TABLE     ?   CREATE TABLE manufacturing.products (
    product_id character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    power integer,
    manufacturing_cost money NOT NULL,
    category_id integer DEFAULT 4 NOT NULL
);
 #   DROP TABLE manufacturing.products;
       manufacturing         heap    postgres    false    5         ?            1259    16459    product_details    VIEW     E  CREATE VIEW manufacturing.product_details AS
 SELECT products.product_id,
    products.name AS products_name,
    products.manufacturing_cost,
    categories.name AS category_name,
    categories.market
   FROM (manufacturing.products
     JOIN manufacturing.categories ON ((products.category_id = categories.category_id)));
 )   DROP VIEW manufacturing.product_details;
       manufacturing          postgres    false    211    212    212    212    211    211    211    5                   0    16444    departments 
   TABLE DATA           X   COPY human_resources.departments (department_id, department_name, building) FROM stdin;
    human_resources          postgres    false    213       3606.dat           0    16449 	   employees 
   TABLE DATA           j   COPY human_resources.employees (employee_id, first_name, last_name, hire_date, department_id) FROM stdin;
    human_resources          postgres    false    214       3607.dat           0    16413 
   categories 
   TABLE DATA           F   COPY manufacturing.categories (category_id, name, market) FROM stdin;
    manufacturing          postgres    false    212       3605.dat           0    16408    products 
   TABLE DATA           c   COPY manufacturing.products (product_id, name, power, manufacturing_cost, category_id) FROM stdin;
    manufacturing          postgres    false    211       3604.dat ?           2606    16448    departments departments_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY human_resources.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);
 O   ALTER TABLE ONLY human_resources.departments DROP CONSTRAINT departments_pkey;
       human_resources            postgres    false    213         z           2606    16469 #   employees employees_hire_date_check    CHECK CONSTRAINT     ?   ALTER TABLE human_resources.employees
    ADD CONSTRAINT employees_hire_date_check CHECK ((hire_date > '2020-01-01'::date)) NOT VALID;
 Q   ALTER TABLE human_resources.employees DROP CONSTRAINT employees_hire_date_check;
       human_resources          postgres    false    214    214         ?           2606    16453    employees employees_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY human_resources.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 K   ALTER TABLE ONLY human_resources.employees DROP CONSTRAINT employees_pkey;
       human_resources            postgres    false    214                    2606    16417    categories categories_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY manufacturing.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);
 K   ALTER TABLE ONLY manufacturing.categories DROP CONSTRAINT categories_pkey;
       manufacturing            postgres    false    212         }           2606    16412    products products_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY manufacturing.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 G   ALTER TABLE ONLY manufacturing.products DROP CONSTRAINT products_pkey;
       manufacturing            postgres    false    211         ?           1259    16466    employees_employee_id_idx    INDEX     _   CREATE INDEX employees_employee_id_idx ON human_resources.employees USING btree (employee_id);
 6   DROP INDEX human_resources.employees_employee_id_idx;
       human_resources            postgres    false    214         ?           1259    16467    employees_last_name_idx    INDEX     [   CREATE INDEX employees_last_name_idx ON human_resources.employees USING btree (last_name);
 4   DROP INDEX human_resources.employees_last_name_idx;
       human_resources            postgres    false    214         {           1259    16463     products_product_id_idx    INDEX     \   CREATE INDEX " products_product_id_idx" ON manufacturing.products USING btree (product_id);
 5   DROP INDEX manufacturing." products_product_id_idx";
       manufacturing            postgres    false    211         ?           2606    16454 &   employees employees_department_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY human_resources.employees
    ADD CONSTRAINT employees_department_id_fkey FOREIGN KEY (department_id) REFERENCES human_resources.departments(department_id) ON UPDATE CASCADE;
 Y   ALTER TABLE ONLY human_resources.employees DROP CONSTRAINT employees_department_id_fkey;
       human_resources          postgres    false    213    214    3457         ?           2606    16418 "   products products_category_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY manufacturing.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES manufacturing.categories(category_id) ON UPDATE CASCADE;
 S   ALTER TABLE ONLY manufacturing.products DROP CONSTRAINT products_category_id_fkey;
       manufacturing          postgres    false    212    211    3455                                                                                                                                                                                                                     3606.dat                                                                                            0000600 0004000 0002000 00000000340 14304171454 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        100	Account Management	Main
200	Environmental Compliance	Taft
300	Facilities/Engineering	Watson
400	Human Resources	Main
500	Manufacturing	South
600	Manufacturing Admin	South
700	Quality Control	South
800	Training	Main
\.


                                                                                                                                                                                                                                                                                                3607.dat                                                                                            0000600 0004000 0002000 00000002234 14304171454 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	Suzanne	Farmer	2014-09-18	300
5	Leonard	Grant	2009-12-05	300
20	Elaine	Jefferson	2020-03-02	500
27	Raquel	Booth	2010-10-24	600
28	Eric	Jackson	2020-06-30	800
36	Chris	Preston	2020-03-27	400
44	Diane	Andrews	2017-06-07	500
58	Jessica	Chapman	2020-04-10	800
59	Michael	Bowman	2018-09-03	300
61	Mark	Moses	2017-10-13	700
67	Leslie	Doyle	2014-12-24	400
77	Allan	Carter	2010-12-18	700
84	Michael	Kirby	2018-11-19	400
96	Christopher	Soto	2019-09-24	500
103	Deborah	Lindsey	2013-05-25	200
111	Teason	Anderson	2018-01-30	800
112	Douglas	Howell	2009-08-06	100
114	Bryant	Vargas	2019-08-21	100
139	Edward	Hayes	2020-03-11	100
157	Al	Serrano	2019-11-01	100
168	John	Cameron	2017-08-28	600
190	Jessica	Wilson	2019-01-21	600
198	Hunyen	Curry	2009-10-30	200
205	Michael	Vasquez	2018-06-06	100
213	Brian	Morton	2019-06-18	700
214	Gary	Jennings	2020-04-07	500
222	Danielle	Atkinson	2018-07-27	200
234	Gary	Long	2019-01-12	500
251	Michael	Schmidt	2010-07-28	500
259	George	Horn	2020-02-06	400
275	Shannon	Gilbert	2011-07-03	800
287	Dennis	Freeman	2019-08-20	800
290	Robert	French	2013-02-06	100
303	Cynthia	Harper	2019-09-20	400
313	Ellen	Fox	2010-01-20	400
500	Adam	Wilbert	2020-02-01	800
\.


                                                                                                                                                                                                                                                                                                                                                                    3605.dat                                                                                            0000600 0004000 0002000 00000000207 14304171454 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        4	solar panels	industrial
3	lightbulbs	domestic
2	grid tie inverters	industrial
1	batteries	domestic
5	wind harvesters	industrial
\.


                                                                                                                                                                                                                                                                                                                                                                                         3604.dat                                                                                            0000600 0004000 0002000 00000002635 14304171454 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        KE5	K-Eco Mini	5	$16.25	4
KE48Li	K-Eco 48-volt Lithium-Ion solar battery	\N	$3,500.00	1
KE001	K-Eco phone charger	3	$1.23	4
KEAA12	K-Eco AA  NiMH rechargeable batteries (12-pack)	\N	$5.00	1
KEAAA06	K-Eco  AAA NiMH rechargeable batteries  (6-pack)	\N	$2.20	1
KEAAA12	K-Eco  AAA NiMH rechargeable batteries (12-pack)	\N	$4.40	1
KE12Li	K-Eco 12-volt Lithium-ion solar battery	\N	$2,100.00	1
KE18Li	K-Eco 18-volt Lithium-ion solar battery	\N	$2,300.00	1
KE36Li	K-Eco 36-volt Lithium-ion solar battery	\N	$2,800.00	1
KEBR5	K-Eco Breeze Mini 	5	$31.45	5
KEBL100	K-Eco Blast 100	100	$175.00	5
KEBL200	K-Eco Blast 200	200	$230.00	5
KEBL400	K-Eco Blast 400	400	$455.00	5
KEBL400X	K-Eco Blast 400x	400	$650.00	5
KEBL600	K-Eco Blast 600	600	$585.00	5
KEBL800	K-Eco Blast 800	800	$685.00	5
KEBL1200	K-Eco Blast 1200	1200	$1,050.00	5
KE9W	K-Eco Energy Bulbs 9W 	9	$0.55	3
KE9W04	K-Eco Energy Bulbs 9W (4-pack)	9	$2.20	3
KE9W08	K-Eco Energy Bulbs 9W  (8-pack)	9	$4.40	3
KE13W	K-Eco Energy Bulbs 13W 	13	$0.75	3
KE13W04	K-Eco Energy Bulbs 13W (4-pack)	13	$3.00	3
KE13W08	K-Eco Energy Bulbs 13W  (8-pack)	13	$6.00	3
KE20W	K-Eco Energy Bulbs 20W 	20	$1.20	3
KE20W04	K-Eco Energy Bulbs 20W (4-pack)	20	$4.90	3
KE20W08	K-Eco Energy Bulbs 20W  (8-pack)	20	$9.80	3
KE23W	K-Eco Energy Bulbs 23W 	23	$1.45	3
KE23W04	K-Eco Energy Bulbs 23W (4-pack)	23	$5.80	3
KE23W08	K-Eco Energy Bulbs 23W  (8-pack)	23	$11.60	3
KE250	K-Eco 250w solar panel	250	$350.00	4
\.


                                                                                                   restore.sql                                                                                         0000600 0004000 0002000 00000015550 14304171454 0015375 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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

DROP DATABASE kineteco;
--
-- Name: kineteco; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE kineteco WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE kineteco OWNER TO postgres;

\connect kineteco

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
-- Name: human_resources; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA human_resources;


ALTER SCHEMA human_resources OWNER TO postgres;

--
-- Name: manufacturing; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA manufacturing;


ALTER SCHEMA manufacturing OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: departments; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.departments (
    department_id integer NOT NULL,
    department_name character varying(50) NOT NULL,
    building character varying(50) NOT NULL
);


ALTER TABLE human_resources.departments OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: human_resources; Owner: postgres
--

CREATE TABLE human_resources.employees (
    employee_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    hire_date date NOT NULL,
    department_id integer DEFAULT 800 NOT NULL
);


ALTER TABLE human_resources.employees OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: manufacturing; Owner: postgres
--

CREATE TABLE manufacturing.categories (
    category_id integer NOT NULL,
    name character varying(50) NOT NULL,
    market character varying(20) NOT NULL,
    CONSTRAINT categories_market_check CHECK ((((market)::text = 'domestic'::text) OR ((market)::text = 'industrial'::text)))
);


ALTER TABLE manufacturing.categories OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: manufacturing; Owner: postgres
--

CREATE TABLE manufacturing.products (
    product_id character varying(10) NOT NULL,
    name character varying(100) NOT NULL,
    power integer,
    manufacturing_cost money NOT NULL,
    category_id integer DEFAULT 4 NOT NULL
);


ALTER TABLE manufacturing.products OWNER TO postgres;

--
-- Name: product_details; Type: VIEW; Schema: manufacturing; Owner: postgres
--

CREATE VIEW manufacturing.product_details AS
 SELECT products.product_id,
    products.name AS products_name,
    products.manufacturing_cost,
    categories.name AS category_name,
    categories.market
   FROM (manufacturing.products
     JOIN manufacturing.categories ON ((products.category_id = categories.category_id)));


ALTER TABLE manufacturing.product_details OWNER TO postgres;

--
-- Data for Name: departments; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.departments (department_id, department_name, building) FROM stdin;
\.
COPY human_resources.departments (department_id, department_name, building) FROM '$$PATH$$/3606.dat';

--
-- Data for Name: employees; Type: TABLE DATA; Schema: human_resources; Owner: postgres
--

COPY human_resources.employees (employee_id, first_name, last_name, hire_date, department_id) FROM stdin;
\.
COPY human_resources.employees (employee_id, first_name, last_name, hire_date, department_id) FROM '$$PATH$$/3607.dat';

--
-- Data for Name: categories; Type: TABLE DATA; Schema: manufacturing; Owner: postgres
--

COPY manufacturing.categories (category_id, name, market) FROM stdin;
\.
COPY manufacturing.categories (category_id, name, market) FROM '$$PATH$$/3605.dat';

--
-- Data for Name: products; Type: TABLE DATA; Schema: manufacturing; Owner: postgres
--

COPY manufacturing.products (product_id, name, power, manufacturing_cost, category_id) FROM stdin;
\.
COPY manufacturing.products (product_id, name, power, manufacturing_cost, category_id) FROM '$$PATH$$/3604.dat';

--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);


--
-- Name: employees employees_hire_date_check; Type: CHECK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE human_resources.employees
    ADD CONSTRAINT employees_hire_date_check CHECK ((hire_date > '2020-01-01'::date)) NOT VALID;


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: manufacturing; Owner: postgres
--

ALTER TABLE ONLY manufacturing.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: manufacturing; Owner: postgres
--

ALTER TABLE ONLY manufacturing.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: employees_employee_id_idx; Type: INDEX; Schema: human_resources; Owner: postgres
--

CREATE INDEX employees_employee_id_idx ON human_resources.employees USING btree (employee_id);


--
-- Name: employees_last_name_idx; Type: INDEX; Schema: human_resources; Owner: postgres
--

CREATE INDEX employees_last_name_idx ON human_resources.employees USING btree (last_name);


--
-- Name:  products_product_id_idx; Type: INDEX; Schema: manufacturing; Owner: postgres
--

CREATE INDEX " products_product_id_idx" ON manufacturing.products USING btree (product_id);


--
-- Name: employees employees_department_id_fkey; Type: FK CONSTRAINT; Schema: human_resources; Owner: postgres
--

ALTER TABLE ONLY human_resources.employees
    ADD CONSTRAINT employees_department_id_fkey FOREIGN KEY (department_id) REFERENCES human_resources.departments(department_id) ON UPDATE CASCADE;


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: manufacturing; Owner: postgres
--

ALTER TABLE ONLY manufacturing.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES manufacturing.categories(category_id) ON UPDATE CASCADE;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        