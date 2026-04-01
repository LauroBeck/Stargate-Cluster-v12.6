--
-- PostgreSQL database dump
--

\restrict MpUefc8jzBSsvN0nLQajaY1Uc0WHHfA9F4PZcBBHlmehsb0SCov5gg1BMrfVGL6

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
-- Data for Name: volatility_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.volatility_logs (id, ticker, last_price, prediction, confidence, ts) FROM stdin;
1	IBM US Equity	237.25	EXPANDING_SKEW	96.4	2026-04-01 14:42:11.359737
2	SPX Index	6343.72	NEUTRAL	92.1	2026-04-01 14:42:11.359737
3	NDX Index	20794.64	MEAN_REVERSION	88.5	2026-04-01 14:42:11.359737
4	LVMH FP Equity	614.75	VOL_SPIKE	94.2	2026-04-01 14:42:11.359737
5	EURUSD Curncy	1.0842	TREND_FOLLOW	91	2026-04-01 14:42:11.359737
6	TSLA US Equity	168.3	HIGH_GAMMA	97.8	2026-04-01 14:42:11.359737
7	NVDA US Equity	894.2	STABLE	95.3	2026-04-01 14:42:11.359737
8	BTCUSD Curncy	67201.5	MOMENTUM_LONG	89.9	2026-04-01 14:42:11.359737
9	GLD US Equity	215.4	HEDGE_FLOW	93.6	2026-04-01 14:42:11.359737
10	AAPL US Equity	172.5	EXPANDING_SKEW	96.2	2026-04-01 14:42:11.359737
\.


--
-- Name: volatility_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.volatility_logs_id_seq', 10, true);


--
-- Name: volatility_logs volatility_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volatility_logs
    ADD CONSTRAINT volatility_logs_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict MpUefc8jzBSsvN0nLQajaY1Uc0WHHfA9F4PZcBBHlmehsb0SCov5gg1BMrfVGL6

