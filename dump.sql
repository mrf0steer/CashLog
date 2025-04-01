--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

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
-- Name: update_modified_column(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.update_modified_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN

    NEW.update_at = CURRENT_TIMESTAMP;

    RETURN NEW;

END;

$$;


ALTER FUNCTION public.update_modified_column() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: expenses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.expenses (
    id integer NOT NULL,
    place character varying(255) NOT NULL,
    category character varying(100) NOT NULL,
    amount numeric(10,2) NOT NULL,
    date timestamp without time zone NOT NULL,
    comment text,
    create_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.expenses OWNER TO postgres;

--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.expenses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.expenses_id_seq OWNER TO postgres;

--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.expenses_id_seq OWNED BY public.expenses.id;


--
-- Name: expenses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expenses ALTER COLUMN id SET DEFAULT nextval('public.expenses_id_seq'::regclass);


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.expenses (id, place, category, amount, date, comment, create_at, update_at) FROM stdin;
24	-	╨ƒ╤Ç╨╛╨┤╤â╨║╤é╤ï	500.00	2025-04-01 21:45:45	╨Æ╨╛╨┤╨░	2025-04-01 21:46:08.449436	2025-04-01 21:46:08.449436
25	╨Ü╨╕╨╜╨╛	╨á╨░╨╖╨▓╨╗╨╡╤ç╨╡╨╜╨╕╤Å	400.00	2025-04-01 21:58:00	╨ƒ╤Ç╨╛╤ü╨╝╨╛╤é╤Ç ╨£╨╕╨║╨║╨╕ 17	2025-04-01 21:46:36.061492	2025-04-01 21:46:36.061492
26	-	╨ö╤Ç╤â╨│╨╛╨╡	2000.00	2025-04-03 14:58:00	╨ö╨╗╤Å ╨┤╨╛╨╝╨░	2025-04-01 21:47:13.736573	2025-04-01 21:47:13.736573
\.


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.expenses_id_seq', 26, true);


--
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- Name: expenses update_expenses_modtime; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_expenses_modtime BEFORE UPDATE ON public.expenses FOR EACH ROW EXECUTE FUNCTION public.update_modified_column();


--
-- PostgreSQL database dump complete
--

