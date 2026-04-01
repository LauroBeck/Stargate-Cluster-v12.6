--
-- PostgreSQL database dump
--

\restrict cVd14GiTauxokHyqW9oIMoJXSZwU9YZZ5G8WaOHpd7hVFvrZHTVuyB968HIY7Rv

-- Dumped from database version 17.9 (Ubuntu 17.9-0ubuntu0.25.10.1)
-- Dumped by pg_dump version 17.9 (Ubuntu 17.9-0ubuntu0.25.10.1)

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
-- Name: volatility_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.volatility_logs (
    id integer NOT NULL,
    ticker text,
    last_price double precision,
    prediction text,
    confidence double precision,
    ts timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.volatility_logs OWNER TO postgres;

--
-- Name: volatility_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.volatility_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.volatility_logs_id_seq OWNER TO postgres;

--
-- Name: volatility_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.volatility_logs_id_seq OWNED BY public.volatility_logs.id;


--
-- Name: volatility_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volatility_logs ALTER COLUMN id SET DEFAULT nextval('public.volatility_logs_id_seq'::regclass);


--
-- Name: volatility_logs volatility_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volatility_logs
    ADD CONSTRAINT volatility_logs_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict cVd14GiTauxokHyqW9oIMoJXSZwU9YZZ5G8WaOHpd7hVFvrZHTVuyB968HIY7Rv

