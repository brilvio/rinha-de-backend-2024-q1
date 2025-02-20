--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.1 (Debian 16.1-1.pgdg120+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Clientes" (
    "Id" integer NOT NULL,
    "Limite" integer NOT NULL,
    "SaldoInicial" integer NOT NULL
);


ALTER TABLE public."Clientes" OWNER TO postgres;

--
-- Name: Clientes_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Clientes" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Clientes_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Transacaos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Transacaos" (
    "Id" integer NOT NULL,
    "Valor" integer NOT NULL,
    "ClienteId" integer NOT NULL,
    "Tipo" character(1) NOT NULL,
    "Descricao" text NOT NULL,
    "RealizadoEm" timestamp with time zone NOT NULL
);


ALTER TABLE public."Transacaos" OWNER TO postgres;

--
-- Name: Transacaos_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Transacaos" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Transacaos_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: Clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Clientes" ("Id", "Limite", "SaldoInicial") FROM stdin;
1	100000	0
2	80000	0
3	1000000	0
4	10000000	0
5	500000	0
\.


--
-- Data for Name: Transacaos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Transacaos" ("Id", "Valor", "ClienteId", "Tipo", "Descricao", "RealizadoEm") FROM stdin;
\.


--
-- Name: Clientes_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Clientes_Id_seq"', 1, false);


--
-- Name: Transacaos_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Transacaos_Id_seq"', 1, false);


--
-- Name: Clientes PK_Clientes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clientes"
    ADD CONSTRAINT "PK_Clientes" PRIMARY KEY ("Id");


--
-- Name: Transacaos PK_Transacaos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transacaos"
    ADD CONSTRAINT "PK_Transacaos" PRIMARY KEY ("Id");


--
-- Name: IX_Transacaos_ClienteId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Transacaos_ClienteId" ON public."Transacaos" USING btree ("ClienteId");


--
-- Name: Transacaos FK_Transacaos_Clientes_ClienteId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transacaos"
    ADD CONSTRAINT "FK_Transacaos_Clientes_ClienteId" FOREIGN KEY ("ClienteId") REFERENCES public."Clientes"("Id") ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

