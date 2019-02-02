--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 11.1

-- Started on 2019-02-02 16:33:49

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 192 (class 1255 OID 16969)
-- Name: blamecounter(); Type: FUNCTION; Schema: public; Owner: 24h
--

CREATE FUNCTION public.blamecounter() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    DECLARE
    idUser INTEGER; 
    countBlame INTEGER;

    BEGIN
    idUser = NEW.id_user;
    SELECT count(id_user) INTO countBlame FROM blame WHERE id_user = idUser;
    IF countBlame > 2 THEN
        UPDATE utilisateur SET banned = true WHERE id_user = idUser;
        RAISE INFO 'USER % A ETE BANNI', idUser;
    END IF;

    RETURN NEW;
    END;
$$;


ALTER FUNCTION public.blamecounter() OWNER TO "24h";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 191 (class 1259 OID 16953)
-- Name: affectation; Type: TABLE; Schema: public; Owner: 24h
--

CREATE TABLE public.affectation (
    id_user integer NOT NULL,
    id_jeu integer NOT NULL,
    date_affectation date NOT NULL,
    date_retour date
);


ALTER TABLE public.affectation OWNER TO "24h";

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
-- TOC entry 2169 (class 0 OID 0)
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
-- TOC entry 2170 (class 0 OID 0)
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
    banned boolean DEFAULT false,
    username text,
    password character varying(255)
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
-- TOC entry 2171 (class 0 OID 0)
-- Dependencies: 187
-- Name: utilisateur_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: 24h
--

ALTER SEQUENCE public.utilisateur_id_user_seq OWNED BY public.utilisateur.id_user;


--
-- TOC entry 2029 (class 2604 OID 16942)
-- Name: blame id_blame; Type: DEFAULT; Schema: public; Owner: 24h
--

ALTER TABLE ONLY public.blame ALTER COLUMN id_blame SET DEFAULT nextval('public.blame_id_blame_seq'::regclass);


--
-- TOC entry 2025 (class 2604 OID 16906)
-- Name: jeu id_jeu; Type: DEFAULT; Schema: public; Owner: 24h
--

ALTER TABLE ONLY public.jeu ALTER COLUMN id_jeu SET DEFAULT nextval('public.jeu_id_jeu_seq'::regclass);


--
-- TOC entry 2027 (class 2604 OID 16930)
-- Name: utilisateur id_user; Type: DEFAULT; Schema: public; Owner: 24h
--

ALTER TABLE ONLY public.utilisateur ALTER COLUMN id_user SET DEFAULT nextval('public.utilisateur_id_user_seq'::regclass);


--
-- TOC entry 2163 (class 0 OID 16953)
-- Dependencies: 191
-- Data for Name: affectation; Type: TABLE DATA; Schema: public; Owner: 24h
--

COPY public.affectation (id_user, id_jeu, date_affectation, date_retour) FROM stdin;
7	10	2019-02-02	\N
8	2	2019-02-02	2019-02-02
7	6	2019-02-02	2019-02-02
7	8	2019-02-02	2019-02-02
7	3	2019-02-02	2019-02-02
12	4	2019-02-02	2019-02-02
8	4	2019-02-02	2019-02-02
7	4	2019-02-02	2019-02-02
8	4	2019-02-02	2019-02-02
8	4	2019-02-02	\N
8	3	2019-02-02	\N
8	2	2019-02-02	\N
8	5	2019-02-02	2019-02-02
7	5	2019-02-02	2019-02-02
\.


--
-- TOC entry 2162 (class 0 OID 16939)
-- Dependencies: 190
-- Data for Name: blame; Type: TABLE DATA; Schema: public; Owner: 24h
--

COPY public.blame (id_blame, id_user, date_blame, raison) FROM stdin;
1	13	2019-02-02	Retard de 2 semaines
2	13	2019-01-03	Carte de Uno dévoré par un certain Lulu
4	13	2019-02-02	Triple Karmeliet sur plateau de jeu
\.


--
-- TOC entry 2158 (class 0 OID 16903)
-- Dependencies: 186
-- Data for Name: jeu; Type: TABLE DATA; Schema: public; Owner: 24h
--

COPY public.jeu (id_jeu, nom_jeu, etat, valeur) FROM stdin;
1	UNO	0	12
2	Monopoly	0	17
3	1000 Borne	0	16.9899999999999984
4	UNO	0	12
5	Monopoly	0	17
6	1000 Borne	0	16.9899999999999984
7	Loup Garou	0	12.9900000000000002
8	Échec	0	12.9900000000000002
9	Jeu de dames	0	17.9899999999999984
10	Blanc Manger Coco	0	12
11	Limite Limite	0	26.9899999999999984
\.


--
-- TOC entry 2160 (class 0 OID 16927)
-- Dependencies: 188
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: 24h
--

COPY public.utilisateur (id_user, nom, prenom, email, telephone, banned, username, password) FROM stdin;
7	Magniez	Florentin	magniez.florention@kaleeis.fr	0601020304	f	Minigugus	$2y$10$9fXy/wYrdOQEsrJISiEsneBk.BRnZaHbc7i0lwzBdCWzxgi1GS7N2
8	Cerrone	Adrien	cerrone.adrien@kaleeis.fr	0601020304	f	erilia	$2y$10$9fXy/wYrdOQEsrJISiEsneBk.BRnZaHbc7i0lwzBdCWzxgi1GS7N2
10	Vitse	Maxime	vitse.maxime@kaleeis.fr	0601020304	f	Weamix	$2y$10$9fXy/wYrdOQEsrJISiEsneBk.BRnZaHbc7i0lwzBdCWzxgi1GS7N2
11	Limou	Victor	limou.victor@kaleeis.fr	0601020304	f	LordAzyks	$2y$10$9fXy/wYrdOQEsrJISiEsneBk.BRnZaHbc7i0lwzBdCWzxgi1GS7N2
13	Synave	Rémi	synave.remi@univ-littoral.fr	0601020304	t	sywave	$2y$10$9fXy/wYrdOQEsrJISiEsneBk.BRnZaHbc7i0lwzBdCWzxgi1GS7N2
12	Kabeche	Jugurtha	kabeche.jugurtha@kaleeis.fr	0601020304	t	JugurthaK	$2y$10$9fXy/wYrdOQEsrJISiEsneBk.BRnZaHbc7i0lwzBdCWzxgi1GS7N2
9	Sauvage	Antoine	sauvage.antoine@kaleeis.fr	0601020304	t	rigwild	$2y$10$9fXy/wYrdOQEsrJISiEsneBk.BRnZaHbc7i0lwzBdCWzxgi1GS7N2
\.


--
-- TOC entry 2172 (class 0 OID 0)
-- Dependencies: 189
-- Name: blame_id_blame_seq; Type: SEQUENCE SET; Schema: public; Owner: 24h
--

SELECT pg_catalog.setval('public.blame_id_blame_seq', 4, true);


--
-- TOC entry 2173 (class 0 OID 0)
-- Dependencies: 185
-- Name: jeu_id_jeu_seq; Type: SEQUENCE SET; Schema: public; Owner: 24h
--

SELECT pg_catalog.setval('public.jeu_id_jeu_seq', 12, true);


--
-- TOC entry 2174 (class 0 OID 0)
-- Dependencies: 187
-- Name: utilisateur_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: 24h
--

SELECT pg_catalog.setval('public.utilisateur_id_user_seq', 13, true);


--
-- TOC entry 2035 (class 2606 OID 16947)
-- Name: blame blame_pkey; Type: CONSTRAINT; Schema: public; Owner: 24h
--

ALTER TABLE ONLY public.blame
    ADD CONSTRAINT blame_pkey PRIMARY KEY (id_blame);


--
-- TOC entry 2031 (class 2606 OID 16912)
-- Name: jeu jeu_pkey; Type: CONSTRAINT; Schema: public; Owner: 24h
--

ALTER TABLE ONLY public.jeu
    ADD CONSTRAINT jeu_pkey PRIMARY KEY (id_jeu);


--
-- TOC entry 2033 (class 2606 OID 16936)
-- Name: utilisateur utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: 24h
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id_user);


--
-- TOC entry 2039 (class 2620 OID 16970)
-- Name: blame blameban; Type: TRIGGER; Schema: public; Owner: 24h
--

CREATE TRIGGER blameban AFTER INSERT ON public.blame FOR EACH ROW EXECUTE PROCEDURE public.blamecounter();


--
-- TOC entry 2038 (class 2606 OID 16961)
-- Name: affectation affectation_jeu_id_jeu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: 24h
--

ALTER TABLE ONLY public.affectation
    ADD CONSTRAINT affectation_jeu_id_jeu_fkey FOREIGN KEY (id_jeu) REFERENCES public.jeu(id_jeu);


--
-- TOC entry 2037 (class 2606 OID 16956)
-- Name: affectation affectation_jeu_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: 24h
--

ALTER TABLE ONLY public.affectation
    ADD CONSTRAINT affectation_jeu_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.utilisateur(id_user);


--
-- TOC entry 2036 (class 2606 OID 16948)
-- Name: blame blame_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: 24h
--

ALTER TABLE ONLY public.blame
    ADD CONSTRAINT blame_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.utilisateur(id_user);


-- Completed on 2019-02-02 16:33:54

--
-- PostgreSQL database dump complete
--

