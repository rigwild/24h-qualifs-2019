--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 11.1

-- Started on 2019-02-02 10:30:07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 191 (class 1259 OID 16953)
-- Name: affectation_jeu; Type: TABLE; Schema: public; Owner: 24h
--

CREATE TABLE public.affectation_jeu (
    id_user integer NOT NULL,
    id_jeu integer NOT NULL,
    date_affectation date NOT NULL,
    date_retour date
);


ALTER TABLE public.affectation_jeu OWNER TO "24h";

--
-- TOC entry 190 (class 1259 OID 16939)
-- Name: blame; Type: TABLE; Schema: public; Owner: 24h
--

CREATE TABLE public.blame (
    id_blame integer NOT NULL,
    id_user integer NOT NULL,
    date_blame date NOT NULL,
    raison text
);


ALTER TABLE public.blame OWNER TO "24h";

--
-- TOC entry 189 (class 1259 OID 16937)
-- Name: blame_id_blame_seq; Type: SEQUENCE; Schema: public; Owner: 24h
--

CREATE SEQUENCE public.blame_id_blame_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blame_id_blame_seq OWNER TO "24h";

--
-- TOC entry 2167 (class 0 OID 0)
-- Dependencies: 189
-- Name: blame_id_blame_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 24h
--

ALTER SEQUENCE public.blame_id_blame_seq OWNED BY public.blame.id_blame;


--
-- TOC entry 186 (class 1259 OID 16903)
-- Name: jeu; Type: TABLE; Schema: public; Owner: 24h
--

CREATE TABLE public.jeu (
    id_jeu integer NOT NULL,
    nom_jeu text NOT NULL,
    etat integer DEFAULT 0,
    valeur double precision NOT NULL
);


ALTER TABLE public.jeu OWNER TO "24h";

--
-- TOC entry 185 (class 1259 OID 16901)
-- Name: jeu_id_jeu_seq; Type: SEQUENCE; Schema: public; Owner: 24h
--

CREATE SEQUENCE public.jeu_id_jeu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jeu_id_jeu_seq OWNER TO "24h";

--
-- TOC entry 2168 (class 0 OID 0)
-- Dependencies: 185
-- Name: jeu_id_jeu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 24h
--

ALTER SEQUENCE public.jeu_id_jeu_seq OWNED BY public.jeu.id_jeu;


--
-- TOC entry 188 (class 1259 OID 16927)
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: 24h
--

CREATE TABLE public.utilisateur (
    id_user integer NOT NULL,
    nom character varying(255) NOT NULL,
    prenom character varying(255) NOT NULL,
    email character varying(255),
    telephone character varying(255),
    banned boolean DEFAULT false
);


ALTER TABLE public.utilisateur OWNER TO "24h";

--
-- TOC entry 187 (class 1259 OID 16925)
-- Name: utilisateur_id_user_seq; Type: SEQUENCE; Schema: public; Owner: 24h
--

CREATE SEQUENCE public.utilisateur_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilisateur_id_user_seq OWNER TO "24h";

--
-- TOC entry 2169 (class 0 OID 0)
-- Dependencies: 187
-- Name: utilisateur_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 24h
--

ALTER SEQUENCE public.utilisateur_id_user_seq OWNED BY public.utilisateur.id_user;


--
-- TOC entry 2028 (class 2604 OID 16942)
-- Name: blame id_blame; Type: DEFAULT; Schema: public; Owner: 24h
--

ALTER TABLE ONLY public.blame ALTER COLUMN id_blame SET DEFAULT nextval('public.blame_id_blame_seq'::regclass);


--
-- TOC entry 2024 (class 2604 OID 16906)
-- Name: jeu id_jeu; Type: DEFAULT; Schema: public; Owner: 24h
--

ALTER TABLE ONLY public.jeu ALTER COLUMN id_jeu SET DEFAULT nextval('public.jeu_id_jeu_seq'::regclass);


--
-- TOC entry 2026 (class 2604 OID 16930)
-- Name: utilisateur id_user; Type: DEFAULT; Schema: public; Owner: 24h
--

ALTER TABLE ONLY public.utilisateur ALTER COLUMN id_user SET DEFAULT nextval('public.utilisateur_id_user_seq'::regclass);


--
-- TOC entry 2161 (class 0 OID 16953)
-- Dependencies: 191
-- Data for Name: affectation_jeu; Type: TABLE DATA; Schema: public; Owner: 24h
--

COPY public.affectation_jeu (id_user, id_jeu, date_affectation, date_retour) FROM stdin;
\.


--
-- TOC entry 2160 (class 0 OID 16939)
-- Dependencies: 190
-- Data for Name: blame; Type: TABLE DATA; Schema: public; Owner: 24h
--

COPY public.blame (id_blame, id_user, date_blame, raison) FROM stdin;
\.


--
-- TOC entry 2156 (class 0 OID 16903)
-- Dependencies: 186
-- Data for Name: jeu; Type: TABLE DATA; Schema: public; Owner: 24h
--

COPY public.jeu (id_jeu, nom_jeu, etat, valeur) FROM stdin;
\.


--
-- TOC entry 2158 (class 0 OID 16927)
-- Dependencies: 188
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: 24h
--

COPY public.utilisateur (id_user, nom, prenom, email, telephone, banned) FROM stdin;
\.


--
-- TOC entry 2170 (class 0 OID 0)
-- Dependencies: 189
-- Name: blame_id_blame_seq; Type: SEQUENCE SET; Schema: public; Owner: 24h
--

SELECT pg_catalog.setval('public.blame_id_blame_seq', 1, false);


--
-- TOC entry 2171 (class 0 OID 0)
-- Dependencies: 185
-- Name: jeu_id_jeu_seq; Type: SEQUENCE SET; Schema: public; Owner: 24h
--

SELECT pg_catalog.setval('public.jeu_id_jeu_seq', 1, false);


--
-- TOC entry 2172 (class 0 OID 0)
-- Dependencies: 187
-- Name: utilisateur_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: 24h
--

SELECT pg_catalog.setval('public.utilisateur_id_user_seq', 1, false);


--
-- TOC entry 2034 (class 2606 OID 16947)
-- Name: blame blame_pkey; Type: CONSTRAINT; Schema: public; Owner: 24h
--

ALTER TABLE ONLY public.blame
    ADD CONSTRAINT blame_pkey PRIMARY KEY (id_blame);


--
-- TOC entry 2030 (class 2606 OID 16912)
-- Name: jeu jeu_pkey; Type: CONSTRAINT; Schema: public; Owner: 24h
--

ALTER TABLE ONLY public.jeu
    ADD CONSTRAINT jeu_pkey PRIMARY KEY (id_jeu);


--
-- TOC entry 2032 (class 2606 OID 16936)
-- Name: utilisateur utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: 24h
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id_user);


--
-- TOC entry 2037 (class 2606 OID 16961)
-- Name: affectation_jeu affectation_jeu_id_jeu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: 24h
--

ALTER TABLE ONLY public.affectation_jeu
    ADD CONSTRAINT affectation_jeu_id_jeu_fkey FOREIGN KEY (id_jeu) REFERENCES public.jeu(id_jeu);


--
-- TOC entry 2036 (class 2606 OID 16956)
-- Name: affectation_jeu affectation_jeu_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: 24h
--

ALTER TABLE ONLY public.affectation_jeu
    ADD CONSTRAINT affectation_jeu_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.utilisateur(id_user);


--
-- TOC entry 2035 (class 2606 OID 16948)
-- Name: blame blame_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: 24h
--

ALTER TABLE ONLY public.blame
    ADD CONSTRAINT blame_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.utilisateur(id_user);


-- Completed on 2019-02-02 10:30:12

--
-- PostgreSQL database dump complete
--

