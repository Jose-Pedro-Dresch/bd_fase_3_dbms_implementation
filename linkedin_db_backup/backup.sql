--
-- PostgreSQL database dump
--

\restrict 9lA9gxtQCMqgqelSAkJJiTMgxK4zNitlujZSPlQBSpFVJ7CctiglYqMBI09BRQ3

-- Dumped from database version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)

-- Started on 2026-05-26 10:42:23 -03

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
-- TOC entry 245 (class 1259 OID 33338)
-- Name: aplicaavaga; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.aplicaavaga (
    dtaplccao timestamp without time zone NOT NULL,
    sttusaplccao character varying(50),
    idvagaemp integer NOT NULL,
    idconta integer NOT NULL
);


ALTER TABLE public.aplicaavaga OWNER TO josepdresch;

--
-- TOC entry 220 (class 1259 OID 33121)
-- Name: cidade; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.cidade (
    idcidade integer NOT NULL,
    nomcidade character varying(100) NOT NULL,
    idestado integer NOT NULL
);


ALTER TABLE public.cidade OWNER TO josepdresch;

--
-- TOC entry 219 (class 1259 OID 33120)
-- Name: cidade_idcidade_seq; Type: SEQUENCE; Schema: public; Owner: josepdresch
--

ALTER TABLE public.cidade ALTER COLUMN idcidade ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cidade_idcidade_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 239 (class 1259 OID 33246)
-- Name: comentario; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.comentario (
    idcomentario integer NOT NULL,
    conteudotxtcom text NOT NULL,
    dtpublicom timestamp without time zone NOT NULL,
    idpost integer NOT NULL,
    idconta integer NOT NULL
);


ALTER TABLE public.comentario OWNER TO josepdresch;

--
-- TOC entry 238 (class 1259 OID 33245)
-- Name: comentario_idcomentario_seq; Type: SEQUENCE; Schema: public; Owner: josepdresch
--

ALTER TABLE public.comentario ALTER COLUMN idcomentario ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comentario_idcomentario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 33179)
-- Name: competencia; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.competencia (
    idcomp integer NOT NULL,
    nomecomp character varying(100) NOT NULL
);


ALTER TABLE public.competencia OWNER TO josepdresch;

--
-- TOC entry 226 (class 1259 OID 33178)
-- Name: competencia_idcomp_seq; Type: SEQUENCE; Schema: public; Owner: josepdresch
--

ALTER TABLE public.competencia ALTER COLUMN idcomp ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.competencia_idcomp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 246 (class 1259 OID 33353)
-- Name: conexao; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.conexao (
    dtenvconv timestamp without time zone NOT NULL,
    dtaceitconv timestamp without time zone,
    statusconexao character varying(50),
    idconta_1 integer NOT NULL,
    idconta_2 integer NOT NULL,
    CONSTRAINT chk_conexao_diferente CHECK ((idconta_1 <> idconta_2))
);


ALTER TABLE public.conexao OWNER TO josepdresch;

--
-- TOC entry 222 (class 1259 OID 33132)
-- Name: conta; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.conta (
    idconta integer NOT NULL,
    emailconta character varying(255) NOT NULL,
    senhaconta character varying(255) NOT NULL,
    dtcrcaoconta date NOT NULL,
    idcidade integer
);


ALTER TABLE public.conta OWNER TO josepdresch;

--
-- TOC entry 221 (class 1259 OID 33131)
-- Name: conta_idconta_seq; Type: SEQUENCE; Schema: public; Owner: josepdresch
--

ALTER TABLE public.conta ALTER COLUMN idconta ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.conta_idconta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 224 (class 1259 OID 33156)
-- Name: corporativa; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.corporativa (
    idconta integer NOT NULL,
    nomcomerc character varying(150) NOT NULL,
    numfuncemp integer,
    descriemp text
);


ALTER TABLE public.corporativa OWNER TO josepdresch;

--
-- TOC entry 225 (class 1259 OID 33168)
-- Name: corporativa_setoremp; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.corporativa_setoremp (
    setoremp character varying(100) NOT NULL,
    idconta integer NOT NULL
);


ALTER TABLE public.corporativa_setoremp OWNER TO josepdresch;

--
-- TOC entry 218 (class 1259 OID 33110)
-- Name: estado; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.estado (
    idestado integer NOT NULL,
    nomestado character varying(100) NOT NULL,
    idpais integer NOT NULL
);


ALTER TABLE public.estado OWNER TO josepdresch;

--
-- TOC entry 217 (class 1259 OID 33109)
-- Name: estado_idestado_seq; Type: SEQUENCE; Schema: public; Owner: josepdresch
--

ALTER TABLE public.estado ALTER COLUMN idestado ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.estado_idestado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 233 (class 1259 OID 33202)
-- Name: experienciaprof; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.experienciaprof (
    idexp integer NOT NULL,
    tituloexp character varying(150) NOT NULL,
    tipoempregoexp character varying(100),
    dtinicioexp date,
    dtfimexp date,
    descatv text,
    idconta integer NOT NULL,
    idemp integer
);


ALTER TABLE public.experienciaprof OWNER TO josepdresch;

--
-- TOC entry 232 (class 1259 OID 33201)
-- Name: experienciaprof_idexp_seq; Type: SEQUENCE; Schema: public; Owner: josepdresch
--

ALTER TABLE public.experienciaprof ALTER COLUMN idexp ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.experienciaprof_idexp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 243 (class 1259 OID 33308)
-- Name: expposscomp; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.expposscomp (
    idcomp integer NOT NULL,
    idexp integer NOT NULL
);


ALTER TABLE public.expposscomp OWNER TO josepdresch;

--
-- TOC entry 244 (class 1259 OID 33323)
-- Name: falaidiom; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.falaidiom (
    nvlprofic character varying(50),
    ididioma integer NOT NULL,
    idconta integer NOT NULL
);


ALTER TABLE public.falaidiom OWNER TO josepdresch;

--
-- TOC entry 231 (class 1259 OID 33191)
-- Name: formacaoacad; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.formacaoacad (
    idform integer NOT NULL,
    nominstitform character varying(150) NOT NULL,
    grauform character varying(100),
    areaform character varying(100),
    dtinicioform date,
    dtfimform date,
    idconta integer NOT NULL
);


ALTER TABLE public.formacaoacad OWNER TO josepdresch;

--
-- TOC entry 230 (class 1259 OID 33190)
-- Name: formacaoacad_idform_seq; Type: SEQUENCE; Schema: public; Owner: josepdresch
--

ALTER TABLE public.formacaoacad ALTER COLUMN idform ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.formacaoacad_idform_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 242 (class 1259 OID 33293)
-- Name: formposscomp; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.formposscomp (
    idcomp integer NOT NULL,
    idform integer NOT NULL
);


ALTER TABLE public.formposscomp OWNER TO josepdresch;

--
-- TOC entry 229 (class 1259 OID 33185)
-- Name: idioma; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.idioma (
    ididioma integer NOT NULL,
    nomeidioma character varying(100) NOT NULL
);


ALTER TABLE public.idioma OWNER TO josepdresch;

--
-- TOC entry 228 (class 1259 OID 33184)
-- Name: idioma_ididioma_seq; Type: SEQUENCE; Schema: public; Owner: josepdresch
--

ALTER TABLE public.idioma ALTER COLUMN ididioma ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.idioma_ididioma_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 33104)
-- Name: pais; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.pais (
    idpais integer NOT NULL,
    nompais character varying(100) NOT NULL
);


ALTER TABLE public.pais OWNER TO josepdresch;

--
-- TOC entry 215 (class 1259 OID 33103)
-- Name: pais_idpais_seq; Type: SEQUENCE; Schema: public; Owner: josepdresch
--

ALTER TABLE public.pais ALTER COLUMN idpais ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pais_idpais_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 33146)
-- Name: pessoal; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.pessoal (
    idconta integer NOT NULL,
    nompsso character varying(100) NOT NULL,
    sobnompsso character varying(100) NOT NULL,
    ttloprofpsso character varying(150)
);


ALTER TABLE public.pessoal OWNER TO josepdresch;

--
-- TOC entry 241 (class 1259 OID 33278)
-- Name: posscomp; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.posscomp (
    idcomp integer NOT NULL,
    idconta integer NOT NULL
);


ALTER TABLE public.posscomp OWNER TO josepdresch;

--
-- TOC entry 237 (class 1259 OID 33233)
-- Name: post; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.post (
    idpost integer NOT NULL,
    dtpublipost timestamp without time zone NOT NULL,
    conteudopost text NOT NULL,
    nivelvisib character varying(50),
    idconta integer NOT NULL
);


ALTER TABLE public.post OWNER TO josepdresch;

--
-- TOC entry 236 (class 1259 OID 33232)
-- Name: post_idpost_seq; Type: SEQUENCE; Schema: public; Owner: josepdresch
--

ALTER TABLE public.post ALTER COLUMN idpost ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.post_idpost_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 240 (class 1259 OID 33263)
-- Name: reagepost; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.reagepost (
    dtreacao timestamp without time zone NOT NULL,
    tiporeacao character varying(50) NOT NULL,
    idconta integer NOT NULL,
    idpost integer NOT NULL
);


ALTER TABLE public.reagepost OWNER TO josepdresch;

--
-- TOC entry 235 (class 1259 OID 33220)
-- Name: vagaemprego; Type: TABLE; Schema: public; Owner: josepdresch
--

CREATE TABLE public.vagaemprego (
    idvagaemp integer NOT NULL,
    ttlovaga character varying(150) NOT NULL,
    descrivaga text,
    formatotrabvaga character varying(50),
    dtcrcaovaga date,
    idconta integer NOT NULL
);


ALTER TABLE public.vagaemprego OWNER TO josepdresch;

--
-- TOC entry 234 (class 1259 OID 33219)
-- Name: vagaemprego_idvagaemp_seq; Type: SEQUENCE; Schema: public; Owner: josepdresch
--

ALTER TABLE public.vagaemprego ALTER COLUMN idvagaemp ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.vagaemprego_idvagaemp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3582 (class 0 OID 33338)
-- Dependencies: 245
-- Data for Name: aplicaavaga; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.aplicaavaga (dtaplccao, sttusaplccao, idvagaemp, idconta) FROM stdin;
2026-03-14 10:00:00	EM_ANALISE	1	2
2026-03-14 10:01:00	EM_ANALISE	1	3
2026-03-14 10:02:00	EM_ANALISE	1	4
2026-03-14 10:03:00	EM_ANALISE	1	7
2026-03-14 10:04:00	EM_ANALISE	1	8
2026-03-14 10:05:00	EM_ANALISE	1	9
2026-02-11 09:15:00	EM_ANALISE	2	3
2026-02-11 09:20:00	EM_ANALISE	2	12
2026-02-12 10:05:00	ENTREVISTA	3	13
2026-02-13 11:30:00	EM_ANALISE	4	16
2026-02-14 14:00:00	EM_ANALISE	5	17
2026-02-15 15:10:00	REJEITADA	6	18
2026-02-16 08:45:00	ACEITA	7	19
2026-02-17 16:00:00	EM_ANALISE	8	20
2026-02-18 12:20:00	EM_ANALISE	9	21
2026-02-19 13:10:00	EM_ANALISE	10	22
2026-02-20 14:50:00	EM_ANALISE	11	23
2026-02-21 10:00:00	EM_ANALISE	1	11
2026-02-21 10:02:00	EM_ANALISE	1	12
2026-02-21 10:04:00	EM_ANALISE	1	13
2026-02-21 10:06:00	EM_ANALISE	1	14
2026-02-21 10:08:00	EM_ANALISE	1	15
2026-02-21 10:10:00	EM_ANALISE	1	16
2026-02-22 09:00:00	EM_ANALISE	2	24
2026-02-22 09:05:00	EM_ANALISE	3	25
2026-02-22 09:10:00	EM_ANALISE	4	26
2026-02-23 11:00:00	EM_ANALISE	5	27
2026-02-23 11:05:00	EM_ANALISE	6	28
2026-02-23 11:10:00	EM_ANALISE	7	29
2026-02-24 09:00:00	EM_ANALISE	8	30
2026-02-24 09:15:00	EM_ANALISE	9	31
2026-02-24 09:20:00	EM_ANALISE	10	32
2026-02-24 09:25:00	EM_ANALISE	11	33
2026-02-24 09:30:00	EM_ANALISE	2	34
2026-02-24 09:35:00	EM_ANALISE	3	35
\.


--
-- TOC entry 3557 (class 0 OID 33121)
-- Dependencies: 220
-- Data for Name: cidade; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.cidade (idcidade, nomcidade, idestado) FROM stdin;
1	Florianópolis	1
2	Joinville	1
3	São Paulo	2
4	Rio Branco	3
5	Cruzeiro do Sul	3
6	Maceió	4
7	Arapiraca	4
8	Macapá	5
9	Santana	5
10	Manaus	6
11	Parintins	6
12	Salvador	7
13	Feira de Santana	7
14	Fortaleza	8
15	Juazeiro do Norte	8
16	Brasília	9
17	São Luís	10
18	Imperatriz	10
19	Vitória	11
20	Vila Velha	11
21	Goiânia	12
22	Anápolis	12
23	Cuiabá	13
24	Rondonópolis	13
25	Campo Grande	14
26	Dourados	14
27	Belo Horizonte	15
28	Uberlândia	15
29	Belém	16
30	Santarém	16
31	João Pessoa	17
32	Campina Grande	17
33	Curitiba	18
34	Londrina	18
35	Recife	19
36	Olinda	19
37	Teresina	20
38	Parnaíba	20
39	Rio de Janeiro	21
40	Niterói	21
41	Natal	22
42	Mossoró	22
43	Porto Alegre	23
44	Caxias do Sul	23
45	Porto Velho	24
46	Ji-Paraná	24
47	Boa Vista	25
48	Pacaraima	25
49	Aracaju	26
50	Nossa Senhora do Socorro	26
51	Palmas	27
52	Araguaína	27
\.


--
-- TOC entry 3576 (class 0 OID 33246)
-- Dependencies: 239
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.comentario (idcomentario, conteudotxtcom, dtpublicom, idpost, idconta) FROM stdin;
1	Excelente oportunidade!	2026-03-14 09:05:00	1	6
2	Empresa incrível!	2026-03-14 09:06:00	1	7
3	Quero muito participar!	2026-03-14 09:06:30	1	8
4	Processo seletivo top!	2026-03-14 09:07:00	1	9
5	Excelente iniciativa!	2026-02-10 08:15:00	2	11
6	Ótimo conteúdo sobre sustentabilidade.	2026-02-10 08:20:00	2	15
7	Tenho experiência com nuvem e posso ajudar.	2026-02-11 09:40:00	3	12
8	Quero saber mais sobre o programa.	2026-02-11 09:50:00	3	17
9	A vaga parece perfeita para meu perfil.	2026-02-12 10:55:00	4	13
10	Já participei de projetos parecidos.	2026-02-12 11:05:00	4	16
11	Me interessei pela posição de segurança.	2026-02-13 11:25:00	5	18
12	Como funciona o processo seletivo?	2026-02-13 11:35:00	5	19
13	Tenho experiência em infraestrutura.	2026-02-14 12:05:00	6	20
14	Excelente empresa para trabalhar.	2026-02-14 12:10:00	6	13
15	Qual o perfil buscado?	2026-02-15 12:35:00	7	21
16	Gosto muito do trabalho de vocês.	2026-02-15 12:45:00	7	22
17	Tenho portfólio pronto.	2026-02-16 13:05:00	8	23
18	Ótima oportunidade!	2026-02-16 13:15:00	8	24
19	Trabalhei com projetos similares.	2026-02-17 13:35:00	9	25
20	Faço parte da área de logística.	2026-02-17 13:45:00	9	26
21	A vaga parece desafiadora.	2026-02-18 14:05:00	10	27
22	Fico feliz em ver essa abertura.	2026-02-18 14:15:00	10	28
23	Adoraria participar do processo.	2026-02-19 14:35:00	11	29
24	Tenho experiência em saúde digital.	2026-02-19 14:45:00	11	30
25	Oportunidade ótima para designers.	2026-02-20 15:05:00	12	31
26	Parabéns pela publicação.	2026-02-20 15:15:00	12	32
27	Gostaria de me conectar com vocês.	2026-02-21 15:35:00	13	33
28	Que iniciativa interessante.	2026-02-21 15:45:00	13	34
29	Excelente notícia para o setor.	2026-02-22 16:05:00	14	35
30	Muito relevante para o mercado.	2026-02-22 16:15:00	14	14
31	Conteúdo muito útil.	2026-02-23 16:35:00	15	12
32	Adoro temas de IA.	2026-02-23 16:45:00	15	27
33	Gostei do post.	2026-02-24 17:05:00	16	25
34	Interessante projeto.	2026-02-24 17:15:00	16	11
35	Ótima chance para profissionais.	2026-02-25 17:35:00	17	16
36	Parabéns pela iniciativa.	2026-02-25 17:45:00	17	18
37	Muito inspirador.	2026-02-26 18:05:00	18	19
38	Quero saber mais.	2026-02-26 18:15:00	18	15
39	Excelente para a comunidade.	2026-02-27 18:35:00	19	20
40	Já participei de eventos similares.	2026-02-27 18:45:00	19	21
41	Uma boa oportunidade para designers.	2026-02-28 19:05:00	20	22
42	A vaga parece atraente.	2026-02-28 19:15:00	20	23
43	Acho que posso contribuir bastante.	2026-03-01 19:35:00	21	24
44	Projetos com energia são meu foco.	2026-03-01 19:45:00	21	29
45	Gostaria de saber mais sobre as vagas.	2026-03-02 08:10:00	1	14
46	Parabéns pela iniciativa da empresa.	2026-03-02 08:12:00	1	17
47	Interessante essa oportunidade de produto.	2026-03-03 09:05:00	2	16
48	Tenho case em nuvem híbrida.	2026-03-03 09:10:00	2	18
49	Boa vaga em segurança da informação.	2026-03-04 10:00:00	3	19
50	Gostaria de participar do processo seletivo.	2026-03-04 10:05:00	3	20
51	Ótimo trabalho de marketing digital.	2026-03-05 11:00:00	4	21
52	Tenho experiência com campanhas B2B.	2026-03-05 11:05:00	4	22
53	Infraestrutura é meu foco.	2026-03-06 12:00:00	5	23
54	Excelente oportunidade em produto.	2026-03-06 12:05:00	5	24
55	Eu jogo e programo, adoraria essa vaga.	2026-03-07 13:00:00	6	25
56	Trabalhei com engines similares.	2026-03-07 13:05:00	6	26
57	Logística está em alta.	2026-03-08 14:00:00	7	27
58	Tenho experiência em cadeia de suprimentos.	2026-03-08 14:05:00	7	28
59	Vaga ótima para quem ama saúde digital.	2026-03-09 15:00:00	8	29
60	Já implementei projetos similares.	2026-03-09 15:05:00	8	30
61	Energia renovável é o futuro.	2026-03-10 16:00:00	9	31
62	Trabalho com eficiência energética.	2026-03-10 16:05:00	9	32
63	Design de produto é o que faço.	2026-03-11 17:00:00	10	33
64	Quero fazer parte dessa equipe.	2026-03-11 17:05:00	10	34
\.


--
-- TOC entry 3564 (class 0 OID 33179)
-- Dependencies: 227
-- Data for Name: competencia; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.competencia (idcomp, nomecomp) FROM stdin;
1	Python
2	SQL
3	Docker
4	Kubernetes
5	Machine Learning
6	Java
7	JavaScript
8	React
9	Node.js
10	AWS
11	Azure
12	Google Cloud
13	CI/CD
14	UX Design
15	Product Management
\.


--
-- TOC entry 3583 (class 0 OID 33353)
-- Dependencies: 246
-- Data for Name: conexao; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.conexao (dtenvconv, dtaceitconv, statusconexao, idconta_1, idconta_2) FROM stdin;
2026-03-13 08:00:00	2026-03-13 08:01:00	ACEITA	7	8
2026-03-13 08:02:00	2026-03-13 08:03:00	ACEITA	8	9
2026-03-13 08:04:00	2026-03-13 08:05:00	ACEITA	7	9
2025-06-01 10:00:00	2025-06-01 10:01:00	ACEITA	5	6
2025-06-02 10:00:00	2025-06-02 10:01:00	ACEITA	2	6
2025-06-03 10:00:00	2025-06-03 10:01:00	ACEITA	5	2
2025-04-01 09:00:00	2025-04-01 09:05:00	ACEITA	11	12
2025-04-02 09:00:00	2025-04-02 09:05:00	ACEITA	12	13
2025-04-03 09:00:00	2025-04-03 09:05:00	ACEITA	13	14
2025-04-04 09:00:00	2025-04-04 09:05:00	ACEITA	14	15
2025-04-05 09:00:00	2025-04-05 09:05:00	ACEITA	15	16
2025-04-06 09:00:00	2025-04-06 09:05:00	ACEITA	16	17
2025-04-07 09:00:00	2025-04-07 09:05:00	ACEITA	17	18
2025-04-08 09:00:00	2025-04-08 09:05:00	ACEITA	18	19
2025-04-09 09:00:00	2025-04-09 09:05:00	ACEITA	19	20
2025-04-10 09:00:00	2025-04-10 09:05:00	ACEITA	20	21
2025-04-11 09:00:00	2025-04-11 09:05:00	ACEITA	21	22
2025-04-12 09:00:00	2025-04-12 09:05:00	ACEITA	22	23
2025-04-13 09:00:00	2025-04-13 09:05:00	ACEITA	23	24
2025-04-14 09:00:00	2025-04-14 09:05:00	ACEITA	24	25
2025-04-15 09:00:00	2025-04-15 09:05:00	ACEITA	25	26
2025-04-16 09:00:00	2025-04-16 09:05:00	ACEITA	26	27
2025-04-17 09:00:00	2025-04-17 09:05:00	ACEITA	27	28
2025-04-18 09:00:00	2025-04-18 09:05:00	ACEITA	28	29
2025-04-19 09:00:00	2025-04-19 09:05:00	ACEITA	29	30
2025-04-20 09:00:00	2025-04-20 09:05:00	ACEITA	30	31
2025-04-21 09:00:00	2025-04-21 09:05:00	ACEITA	31	32
2025-04-22 09:00:00	2025-04-22 09:05:00	ACEITA	32	33
2025-04-23 09:00:00	2025-04-23 09:05:00	ACEITA	33	34
2025-04-24 09:00:00	2025-04-24 09:05:00	ACEITA	34	35
2025-04-25 09:00:00	2025-04-25 09:05:00	ACEITA	2	11
\.


--
-- TOC entry 3559 (class 0 OID 33132)
-- Dependencies: 222
-- Data for Name: conta; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.conta (idconta, emailconta, senhaconta, dtcrcaoconta, idcidade) FROM stdin;
1	ana@techlink.com	123	2025-01-10	3
2	bruno@gmail.com	123	2026-03-10	1
3	carla@gmail.com	123	2026-03-11	1
4	diego@gmail.com	123	2026-03-11	1
5	eduardo@gmail.com	123	2024-08-01	2
6	fernanda@gmail.com	123	2023-04-20	3
7	arnaldobertoldi@gmail.com	123	2026-03-13	1
8	marlonalves@gmail.com	123	2026-03-13	1
9	israelmarcelino@gmail.com	123	2026-03-13	1
10	recruiter@techlink.com	123	2024-02-10	3
11	thais@dataworks.com	123	2024-11-15	12
12	lucas@greencloud.com	123	2024-12-01	16
13	mariana@educatech.com	123	2025-02-20	20
14	felipe@healthnet.com	123	2025-03-03	24
15	isabela@sustentec.com	123	2025-03-10	28
16	rodrigo@ecommercepro.com	123	2025-04-17	32
17	vanessa@consultoria360.com	123	2025-05-05	36
18	alessandro@logipower.com	123	2025-05-18	40
19	camila@markdigital.com	123	2025-06-01	44
20	pedro@seginfotech.com	123	2025-06-12	48
21	laura@gaminglab.com	123	2025-06-20	15
22	joao@agroconnect.com	123	2025-07-01	19
23	daniela@bioplus.com	123	2025-07-10	23
24	caio@retailwave.com	123	2025-08-03	29
25	aline@infrahub.com	123	2025-08-22	33
26	marcos@analyticslab.com	123	2025-09-10	37
27	tatiana@aitech.com	123	2025-10-01	41
28	edu@telecomplus.com	123	2025-10-15	45
29	sophia@energygrid.com	123	2025-11-02	49
30	henrique@designmind.com	123	2025-11-20	6
31	natasha@peerio.com	123	2025-12-04	7
32	rafael@finovate.com	123	2025-12-15	8
33	patricia@healthbridge.com	123	2026-01-05	9
34	bruno2@educonnect.com	123	2026-01-20	13
35	maria@agrotech.com	123	2026-02-02	17
36	alex@cloudfirst.com	123	2026-02-10	21
37	julia@mobilityhub.com	123	2026-02-14	25
38	fernando@smartcity.com	123	2026-02-18	30
39	samara@biotek.com	123	2026-02-22	34
40	henri@foodtech.com	123	2026-02-25	38
41	livia@cyberguard.com	123	2026-03-01	42
42	guilherme@logibrasil.com	123	2026-03-02	46
43	vania@eventech.com	123	2026-03-04	50
44	leonardo@meditech.com	123	2026-03-05	11
45	paula@gamestudio.com	123	2026-03-06	14
46	roberto@sustainabiz.com	123	2026-03-06	18
47	patriciab@devopsnow.com	123	2026-03-07	22
48	adriana@hrsmart.com	123	2026-03-07	26
49	gustavo@logiexpress.com	123	2026-03-08	31
50	marina@solaredge.com	123	2026-03-09	35
51	luana@techeduca.com	123	2026-03-11	39
52	rafa@fintechplus.com	123	2026-03-12	43
53	andrea@medisys.com	123	2026-03-12	47
54	henrique2@mobihub.com	123	2026-03-13	51
55	patricia2@smartlog.com	123	2026-03-13	52
\.


--
-- TOC entry 3561 (class 0 OID 33156)
-- Dependencies: 224
-- Data for Name: corporativa; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.corporativa (idconta, nomcomerc, numfuncemp, descriemp) FROM stdin;
1	TechLink Solutions	500	Empresa de tecnologia especializada em dados
36	DataWorks	120	Empresa de análise de dados e automação
37	GreenCloud	80	Soluções em nuvem sustentável
38	EducaTech	45	Plataforma de educação online
39	HealthNet	160	Serviços de saúde digital
40	SustenTec	65	Tecnologia para sustentabilidade ambiental
41	EcommercePro	95	Loja online de produtos de nicho
42	Consultoria360	50	Consultoria empresarial e digital
43	LogiPower	70	Logística integrada e software de rotas
44	MarkDigital	40	Agência de marketing digital
45	SegInfoTech	55	Segurança da informação e proteção de dados
46	GamingLab	110	Desenvolvimento de jogos e entretenimento
47	AgroConnect	130	Tecnologia para o agronegócio
48	BioPlus	90	Biotecnologia aplicada à saúde
49	RetailWave	75	Soluções de varejo omnichannel
50	InfraHub	80	Infraestrutura de TI e data centers
51	AnalyticsLab	85	Consultoria em analytics e dashboards
52	AITech	66	Inteligência artificial para empresas
53	TelecomPlus	140	Operadora de telecomunicações
54	EnergyGrid	100	Energia renovável e smart grids
55	DesignMind	30	Estúdio de design e inovação
\.


--
-- TOC entry 3562 (class 0 OID 33168)
-- Dependencies: 225
-- Data for Name: corporativa_setoremp; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.corporativa_setoremp (setoremp, idconta) FROM stdin;
Tecnologia	1
FinTech	36
Cloud	37
Educação	38
Saúde	39
Sustentabilidade	40
E-commerce	41
Consultoria	42
Logística	43
Marketing Digital	44
Segurança da Informação	45
Games	46
Agronegócio	47
BioTech	48
Retail	49
Infraestrutura	50
Analytics	51
IA	52
Telecom	53
Energia	54
Design	55
\.


--
-- TOC entry 3555 (class 0 OID 33110)
-- Dependencies: 218
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.estado (idestado, nomestado, idpais) FROM stdin;
1	Santa Catarina	1
2	São Paulo	1
3	Acre	1
4	Alagoas	1
5	Amapá	1
6	Amazonas	1
7	Bahia	1
8	Ceará	1
9	Distrito Federal	1
10	Espírito Santo	1
11	Goiás	1
12	Maranhão	1
13	Mato Grosso	1
14	Mato Grosso do Sul	1
15	Minas Gerais	1
16	Pará	1
17	Paraíba	1
18	Paraná	1
19	Pernambuco	1
20	Piauí	1
21	Rio de Janeiro	1
22	Rio Grande do Norte	1
23	Rio Grande do Sul	1
24	Rondônia	1
25	Roraima	1
26	Sergipe	1
27	Tocantins	1
\.


--
-- TOC entry 3570 (class 0 OID 33202)
-- Dependencies: 233
-- Data for Name: experienciaprof; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.experienciaprof (idexp, tituloexp, tipoempregoexp, dtinicioexp, dtfimexp, descatv, idconta, idemp) FROM stdin;
1	Recruiter	CLT	2024-01-01	\N	Recrutamento técnico	5	1
2	Software Architect	CLT	2023-01-01	2026-02-20	Arquitetura de sistemas distribuídos	6	1
3	Data Engineer	CLT	2025-01-01	\N	Pipelines de dados	2	1
4	Data Scientist	PJ	2023-07-01	\N	Modelagem preditiva e pipelines	3	36
5	Senior Developer	CLT	2022-04-01	2025-12-31	Desenvolvimento de aplicações web	4	37
6	Content Strategist	PJ	2021-03-01	2024-08-01	Campanhas digitais e posicionamento de marca	5	44
7	Performance Analyst	CLT	2020-05-01	2023-12-01	Otimização de resultados online	7	44
8	Product Designer	CLT	2021-08-01	\N	Design de interfaces e experiência	8	38
9	IT Specialist	PJ	2022-06-01	\N	Gerenciamento de infraestrutura de TI	9	50
10	Finance Manager	CLT	2019-02-01	2022-12-01	Gestão financeira e orçamento	10	49
11	Product Owner	CLT	2022-01-01	\N	Gestão de roadmap e stakeholders	11	36
12	Data Analyst	PJ	2023-01-10	\N	Análises de dados e visualizações	12	51
13	UX Researcher	CLT	2021-02-01	2024-05-30	Pesquisa com usuários e usabilidade	13	44
14	Operations Analyst	CLT	2020-07-01	\N	Planejamento operacional e métricas	14	49
15	Marketing Coordinator	PJ	2022-03-01	2025-03-01	Campanhas de comunicação	15	44
16	Cloud Engineer	CLT	2023-09-01	\N	Arquitetura de nuvem e automação	16	37
17	Quality Analyst	PJ	2021-11-01	\N	Testes e garantia de qualidade de software	17	42
18	Infrastructure Consultant	CLT	2022-10-01	\N	Projetos de infraestrutura de TI	18	50
19	People Partner	CLT	2023-05-01	\N	Gestão de talentos e cultura	19	38
20	Logistics Analyst	PJ	2020-04-01	\N	Otimização de cadeia de suprimentos	20	43
21	Game Programmer	PJ	2022-08-01	\N	Desenvolvimento de jogos e simulações	21	46
22	Agronomy Specialist	CLT	2019-09-01	\N	Soluções agrícolas e tecnologia	22	47
23	Biotech Researcher	CLT	2021-01-01	\N	Pesquisa de biotecnologia aplicada	23	48
24	Retail Supervisor	CLT	2020-06-01	\N	Gerência de operações de loja	24	49
25	Network Engineer	CLT	2021-04-01	\N	Administração de redes corporativas	25	50
26	Analytics Specialist	CLT	2022-09-01	\N	Reportes e dashboards executivos	26	51
27	AI Specialist	PJ	2023-02-01	\N	Modelos de aprendizado de máquina	27	52
28	Network Consultant	CLT	2020-01-01	2023-12-01	Implementação de redes e segurança	28	53
29	Energy Consultant	PJ	2021-07-01	\N	Projetos de energia renovável	29	54
30	Visual Designer	PJ	2022-03-01	\N	Design de campanhas e identidade visual	30	55
31	HR Specialist	CLT	2022-11-01	\N	Recrutamento e desenvolvimento	31	38
32	Financial Consultant	PJ	2023-05-01	\N	Estratégia financeira corporativa	32	36
33	Education Manager	CLT	2021-01-01	\N	Operações de educação corporativa	33	38
34	Logistics Planner	CLT	2022-02-01	\N	Planejamento logístico e frota	34	43
35	Customer Success Analyst	PJ	2023-10-01	\N	Relacionamento com clientes e retenção	35	41
\.


--
-- TOC entry 3580 (class 0 OID 33308)
-- Dependencies: 243
-- Data for Name: expposscomp; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.expposscomp (idcomp, idexp) FROM stdin;
2	1
6	2
10	3
9	4
8	5
1	6
4	7
5	8
3	9
2	10
7	11
1	12
6	13
8	14
10	15
2	16
9	17
5	18
1	19
4	20
\.


--
-- TOC entry 3581 (class 0 OID 33323)
-- Dependencies: 244
-- Data for Name: falaidiom; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.falaidiom (nvlprofic, ididioma, idconta) FROM stdin;
Nativo	1	6
Avançado	2	6
Intermediário	3	6
Básico	4	6
Nativo	1	2
Avançado	2	2
Nativo	1	5
Avançado	2	5
Intermediário	5	5
Avançado	3	11
Intermediário	2	11
Básico	6	11
Avançado	2	12
Intermediário	1	13
Básico	5	13
Nativo	1	14
Avançado	2	14
Avançado	3	15
Intermediário	6	16
Nativo	1	17
Avançado	2	17
Intermediário	4	18
Nativo	1	19
Avançado	2	19
Intermediário	5	20
Avançado	2	21
Nativo	1	22
Intermediário	3	23
Avançado	2	24
Nativo	1	25
Avançado	6	26
Básico	4	27
Intermediário	2	28
Avançado	1	29
Básico	5	30
Nativo	1	31
Avançado	2	32
Intermediário	3	33
Básico	4	34
Avançado	5	35
\.


--
-- TOC entry 3568 (class 0 OID 33191)
-- Dependencies: 231
-- Data for Name: formacaoacad; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.formacaoacad (idform, nominstitform, grauform, areaform, dtinicioform, dtfimform, idconta) FROM stdin;
1	UFSC	Bacharelado	Ciência da Computação	2018-01-01	2022-12-01	2
2	USP	Mestrado	Engenharia de Software	2017-01-01	2019-12-01	6
3	UFPR	Bacharelado	Engenharia de Software	2019-01-01	2023-12-01	3
4	UFMG	Bacharelado	Sistemas de Informação	2018-02-01	2022-12-01	4
5	PUC-Rio	Bacharelado	Comunicação Social	2017-03-01	2021-11-30	5
6	UTFPR	Bacharelado	Ciência da Computação	2019-01-01	2023-12-15	7
7	UFPE	Bacharelado	Engenharia de Software	2018-01-15	2022-12-01	8
8	UFRJ	Bacharelado	Engenharia de Computação	2019-02-01	2023-12-01	9
9	UNB	Bacharelado	Administração	2016-01-01	2020-12-01	10
10	PUC-SP	Mestrado	Ciência de Dados	2020-01-01	2022-12-20	11
11	UFBA	Bacharelado	Estatística	2018-02-01	2022-12-01	12
12	UNICAMP	Bacharelado	Design	2017-01-01	2021-12-01	13
13	UFRGS	Bacharelado	Engenharia de Produção	2018-03-01	2022-12-10	14
14	UFC	Bacharelado	Marketing	2017-02-01	2021-12-01	15
15	UFG	Bacharelado	Ciência da Computação	2016-08-01	2020-12-01	16
16	UFMS	Bacharelado	Agronomia	2015-03-01	2019-12-01	17
17	UFSCAR	Bacharelado	Engenharia Eletrônica	2018-02-01	2022-12-01	18
18	UFPA	Bacharelado	Ciência da Computação	2019-03-01	2023-12-01	19
19	UEA	Bacharelado	Ciência da Computação	2018-02-01	2022-12-01	20
20	UFPE	Bacharelado	Design Digital	2017-01-01	2021-12-01	21
21	UFCG	Bacharelado	Psicologia	2017-01-01	2021-12-01	22
22	UFRN	Bacharelado	Administração	2016-02-01	2020-12-01	23
23	UNIFESP	MBA	Gestão de Projetos	2021-01-01	2022-12-01	24
24	USP	Bacharelado	Engenharia de Produção	2015-02-01	2019-12-01	25
25	UFBA	Bacharelado	Engenharia Civil	2015-03-01	2019-12-01	26
26	UEM	Bacharelado	Gestão de TI	2016-02-01	2020-12-01	27
27	UTFPR	Bacharelado	Redes de Computadores	2016-03-01	2020-12-01	28
28	UFRJ	Bacharelado	Engenharia Elétrica	2016-02-01	2020-12-01	29
29	PUC-PR	Bacharelado	Design Gráfico	2017-02-01	2021-12-01	30
30	FATEC	Bacharelado	Jogos Digitais	2018-03-01	2022-12-01	31
31	FGV	Bacharelado	Economia	2016-01-01	2020-12-01	32
32	SENAI	Tecnólogo	Gestão Financeira	2018-04-01	2020-12-01	33
33	UNESP	Bacharelado	Psicologia Organizacional	2017-03-01	2021-12-01	34
34	UNIARA	Bacharelado	Comunicação	2017-01-01	2021-12-01	35
\.


--
-- TOC entry 3579 (class 0 OID 33293)
-- Dependencies: 242
-- Data for Name: formposscomp; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.formposscomp (idcomp, idform) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
1	11
2	12
3	13
4	14
5	15
6	16
7	17
8	18
9	19
10	20
\.


--
-- TOC entry 3566 (class 0 OID 33185)
-- Dependencies: 229
-- Data for Name: idioma; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.idioma (ididioma, nomeidioma) FROM stdin;
1	Português
2	Inglês
3	Espanhol
4	Alemão
5	Italiano
6	Francês
\.


--
-- TOC entry 3553 (class 0 OID 33104)
-- Dependencies: 216
-- Data for Name: pais; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.pais (idpais, nompais) FROM stdin;
1	Brasil
2	Estados Unidos
3	Canadá
4	Argentina
5	México
6	Alemanha
7	Índia
8	Japão
9	Austrália
\.


--
-- TOC entry 3560 (class 0 OID 33146)
-- Dependencies: 223
-- Data for Name: pessoal; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.pessoal (idconta, nompsso, sobnompsso, ttloprofpsso) FROM stdin;
2	Bruno	Silva	Data Engineer
3	Carla	Mendes	Backend Developer
4	Diego	Souza	DevOps Engineer
5	Eduardo	Lima	Senior Recruiter
6	Fernanda	Rocha	Software Architect
7	Arnaldo	Bertoldi	Data Engineer
8	Marlon	Alves	Data Engineer
9	Israel	Marcelino	Data Engineer
10	Patricia	Almeida	Tech Recruiter
11	Thais	Silveira	Product Manager
12	Lucas	Gomes	Full Stack Developer
13	Mariana	Costa	Data Scientist
14	Felipe	Rezende	UX Designer
15	Isabela	Fernandes	Marketing Analyst
16	Rodrigo	Soares	Cybersecurity Analyst
17	Vanessa	Pereira	QA Engineer
18	Alessandro	Mendes	Cloud Architect
19	Camila	Lima	HR Business Partner
20	Pedro	Oliveira	Logistics Coordinator
21	Laura	Barbosa	Game Developer
22	João	Nogueira	Agricultural Engineer
23	Daniela	Ribeiro	Biotech Researcher
24	Caio	Martins	Retail Operations Manager
25	Aline	Farias	Infrastructure Engineer
26	Marcos	Carvalho	Analytics Consultant
27	Tatiana	Santos	AI Researcher
28	Edu	Silva	Network Engineer
29	Sophia	Dias	Energy Specialist
30	Henrique	Pinto	Visual Designer
31	Natasha	Campos	HR Recruiter
32	Rafael	Almeida	Finance Analyst
33	Patricia	Barros	Education Specialist
34	Bruno	Nunes	Logistics Manager
35	Maria	Moura	Customer Success Lead
\.


--
-- TOC entry 3578 (class 0 OID 33278)
-- Dependencies: 241
-- Data for Name: posscomp; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.posscomp (idcomp, idconta) FROM stdin;
1	7
2	7
3	7
1	8
2	8
3	8
1	9
2	9
3	9
1	2
2	2
3	2
1	3
2	3
2	4
3	4
4	4
1	6
2	6
5	6
6	11
2	11
7	11
1	12
8	12
2	13
9	13
3	14
10	14
1	15
6	15
7	16
2	16
4	17
8	17
1	18
2	18
3	19
6	19
9	20
10	20
1	21
2	21
3	22
6	22
8	23
9	23
1	24
4	24
2	25
7	25
3	26
8	26
1	27
5	27
4	28
6	28
2	29
10	29
3	30
9	30
1	31
8	31
2	32
7	32
5	33
10	33
3	34
6	34
4	35
9	35
\.


--
-- TOC entry 3574 (class 0 OID 33233)
-- Dependencies: 237
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.post (idpost, dtpublipost, conteudopost, nivelvisib, idconta) FROM stdin;
1	2026-03-14 09:00:00	Estamos contratando Senior Data Engineers!	PUBLICO	1
2	2026-02-10 08:00:00	Novo artigo sobre Cloud Sustainability.	PUBLICO	37
3	2026-02-11 09:30:00	Buscamos talentos em UX para plataforma global.	PUBLICO	38
4	2026-02-12 10:45:00	Junte-se ao time de segurança da informação.	PUBLICO	45
5	2026-02-13 11:20:00	Aumente seu impacto como coordenador de marketing.	PUBLICO	44
6	2026-02-14 12:00:00	Estamos com vaga aberta para DevOps.	PUBLICO	50
7	2026-02-15 12:30:00	Participe do nosso time de dados e analytics.	PUBLICO	51
8	2026-02-16 13:00:00	O mercado de games está crescendo: venha para o GamingLab.	PUBLICO	46
9	2026-02-17 13:30:00	Projeto em energia renovável começa em breve.	PUBLICO	54
10	2026-02-18 14:00:00	Soluções de logística urbana para grandes cidades.	PUBLICO	43
11	2026-02-19 14:30:00	Fintech com oportunidades para analistas financeiros.	PUBLICO	36
12	2026-02-20 15:00:00	Educação digital inovadora procura talentos.	PUBLICO	38
13	2026-02-21 15:30:00	TechLink busca Senior Data Engineers.	PUBLICO	1
14	2026-02-22 16:00:00	Apresentando a nova plataforma de agronegócio.	PUBLICO	47
15	2026-02-23 16:30:00	Evento online sobre inteligência artificial.	PUBLICO	52
16	2026-02-24 17:00:00	Nosso time de retail está em expansão.	PUBLICO	49
17	2026-02-25 17:30:00	Modernização de redes e infraestrutura.	PUBLICO	50
18	2026-02-26 18:00:00	Consultoria para transformação digital.	PUBLICO	42
19	2026-02-27 18:30:00	Convidamos designers para um projeto internacional.	PUBLICO	55
20	2026-02-28 19:00:00	A equipe de saúde digital está com vagas abertas.	PUBLICO	39
21	2026-03-01 19:30:00	Time de energia inteligente contrata.	PUBLICO	54
\.


--
-- TOC entry 3577 (class 0 OID 33263)
-- Dependencies: 240
-- Data for Name: reagepost; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.reagepost (dtreacao, tiporeacao, idconta, idpost) FROM stdin;
2026-03-14 09:05:00	LIKE	6	1
2026-03-14 09:05:10	LIKE	7	1
2026-03-14 09:05:20	LIKE	8	1
2026-03-14 09:05:30	LIKE	9	1
2026-02-10 08:18:00	LIKE	12	2
2026-02-10 08:19:00	APOIO	15	2
2026-02-11 09:45:00	LIKE	13	3
2026-02-11 09:46:00	APOIO	17	3
2026-02-12 11:00:00	LIKE	18	4
2026-02-12 11:01:00	APOIO	16	4
2026-02-13 11:30:00	LIKE	19	5
2026-02-13 11:31:00	APOIO	20	5
2026-02-14 12:08:00	LIKE	21	6
2026-02-14 12:09:00	APOIO	22	6
2026-02-15 12:55:00	LIKE	23	7
2026-02-15 12:56:00	APOIO	24	7
2026-02-16 13:20:00	LIKE	25	8
2026-02-16 13:21:00	APOIO	26	8
2026-02-17 13:40:00	LIKE	27	9
2026-02-17 13:41:00	APOIO	28	9
2026-02-18 14:10:00	LIKE	29	10
2026-02-18 14:11:00	APOIO	30	10
2026-02-19 14:40:00	LIKE	31	11
2026-02-19 14:41:00	APOIO	32	11
2026-02-20 15:05:00	LIKE	33	12
2026-02-20 15:06:00	APOIO	34	12
2026-02-21 15:40:00	LIKE	35	13
2026-02-21 15:41:00	APOIO	11	13
2026-02-22 16:10:00	LIKE	12	14
2026-02-22 16:11:00	APOIO	13	14
2026-02-23 16:40:00	LIKE	14	15
2026-02-23 16:41:00	APOIO	15	15
2026-02-24 17:10:00	LIKE	16	16
2026-02-24 17:11:00	APOIO	17	16
2026-02-25 17:40:00	LIKE	18	17
2026-02-25 17:41:00	APOIO	19	17
2026-02-26 18:10:00	LIKE	20	18
2026-02-26 18:11:00	APOIO	21	18
2026-02-27 18:40:00	LIKE	22	19
2026-02-27 18:41:00	APOIO	23	19
2026-02-28 19:10:00	LIKE	24	20
2026-02-28 19:11:00	APOIO	25	20
2026-03-01 19:40:00	LIKE	26	21
2026-03-01 19:41:00	APOIO	27	21
2026-03-02 08:15:00	LIKE	15	1
2026-03-02 08:16:00	APOIO	16	1
2026-03-03 09:08:00	LIKE	17	2
2026-03-03 09:09:00	APOIO	18	2
2026-03-04 10:02:00	LIKE	19	3
2026-03-04 10:03:00	APOIO	20	3
2026-03-05 11:02:00	LIKE	21	4
2026-03-05 11:03:00	APOIO	22	4
2026-03-06 12:02:00	LIKE	23	5
2026-03-06 12:03:00	APOIO	24	5
2026-03-07 13:02:00	LIKE	25	6
2026-03-07 13:03:00	APOIO	26	6
2026-03-08 14:02:00	LIKE	27	7
2026-03-08 14:03:00	APOIO	28	7
2026-03-09 15:02:00	LIKE	29	8
2026-03-09 15:03:00	APOIO	30	8
2026-03-10 16:02:00	LIKE	31	9
2026-03-10 16:03:00	APOIO	32	9
2026-03-11 17:02:00	LIKE	33	10
2026-03-11 17:03:00	APOIO	34	10
2026-03-11 17:30:00	LIKE	35	10
2026-03-11 17:35:00	APOIO	14	10
2026-03-12 08:00:00	LIKE	11	11
2026-03-12 08:05:00	APOIO	12	11
2026-03-12 09:20:00	LIKE	13	12
2026-03-12 09:25:00	APOIO	14	12
2026-03-12 10:00:00	LIKE	15	13
2026-03-12 10:05:00	APOIO	16	13
2026-03-12 11:00:00	LIKE	17	14
2026-03-12 11:05:00	APOIO	18	14
2026-03-12 12:00:00	LIKE	19	15
2026-03-12 12:05:00	APOIO	20	15
\.


--
-- TOC entry 3572 (class 0 OID 33220)
-- Dependencies: 235
-- Data for Name: vagaemprego; Type: TABLE DATA; Schema: public; Owner: josepdresch
--

COPY public.vagaemprego (idvagaemp, ttlovaga, descrivaga, formatotrabvaga, dtcrcaovaga, idconta) FROM stdin;
1	Senior Data Engineer	Vaga estratégica para engenharia de dados	REMOTO	2026-03-14	1
2	Analista de Dados	Análise e reports para negócios digitais	HÍBRIDO	2026-02-10	36
3	Engenheiro de Nuvem	Projeto de infraestrutura em AWS e Azure	REMOTO	2026-02-12	37
4	Especialista em UX	Melhoria da experiência do usuário em plataforma	HÍBRIDO	2026-02-14	38
5	Consultor de Segurança	Proteção de dados e auditoria de sistemas	REMOTO	2026-02-16	45
6	Desenvolvedor Full Stack	Aplicações web com React e Node.js	HÍBRIDO	2026-02-18	41
7	Engenheiro de Infraestrutura	Administração de data center e rede	PRESENCIAL	2026-02-20	50
8	Coordenador de Marketing	Campanhas digitais e comunicação integrada	REMOTO	2026-02-22	44
9	Especialista em Produtos	Gestão de produtos de tecnologia	HÍBRIDO	2026-02-24	36
10	Desenvolvedor de Jogos	Criação de jogos multiplataforma	REMOTO	2026-02-26	46
11	Analista de Energia Renovável	Projetos de energia inteligente	PRESENCIAL	2026-02-28	54
12	Especialista em Dados de Saúde	Analytics para soluções médicas	REMOTO	2026-03-05	39
13	Desenvolvedor Mobile	Aplicativos nativos para clientes financeiros.	REMOTO	2026-03-02	41
14	Arquiteto de Software	Plataforma de integração de dados em nuvem.	HÍBRIDO	2026-03-03	37
15	Especialista em DevOps	Automação de pipeline e infraestrutura.	REMOTO	2026-03-04	50
16	Analista de Marketing de Conteúdo	Produção de conteúdo digital para B2B.	REMOTO	2026-03-05	44
17	Gerente de Produto	Gestão de produtos digitais estratégicos.	HÍBRIDO	2026-03-06	36
18	Engenheiro de Software de Jogos	Pipeline de desenvolvimento de jogos.	REMOTO	2026-03-07	46
19	Analista de Logística	Planejamento de transporte urbano.	HÍBRIDO	2026-03-08	43
20	Especialista em Saúde Digital	Plataforma de telemedicina e monitoramento.	REMOTO	2026-03-09	39
21	Analista de Energia	Projetos de energia solar e eficiência.	PRESENCIAL	2026-03-10	54
22	Designer de Produto	Design de soluções físicas e digitais.	HÍBRIDO	2026-03-11	55
\.


--
-- TOC entry 3589 (class 0 OID 0)
-- Dependencies: 219
-- Name: cidade_idcidade_seq; Type: SEQUENCE SET; Schema: public; Owner: josepdresch
--

SELECT pg_catalog.setval('public.cidade_idcidade_seq', 52, true);


--
-- TOC entry 3590 (class 0 OID 0)
-- Dependencies: 238
-- Name: comentario_idcomentario_seq; Type: SEQUENCE SET; Schema: public; Owner: josepdresch
--

SELECT pg_catalog.setval('public.comentario_idcomentario_seq', 64, true);


--
-- TOC entry 3591 (class 0 OID 0)
-- Dependencies: 226
-- Name: competencia_idcomp_seq; Type: SEQUENCE SET; Schema: public; Owner: josepdresch
--

SELECT pg_catalog.setval('public.competencia_idcomp_seq', 15, true);


--
-- TOC entry 3592 (class 0 OID 0)
-- Dependencies: 221
-- Name: conta_idconta_seq; Type: SEQUENCE SET; Schema: public; Owner: josepdresch
--

SELECT pg_catalog.setval('public.conta_idconta_seq', 55, true);


--
-- TOC entry 3593 (class 0 OID 0)
-- Dependencies: 217
-- Name: estado_idestado_seq; Type: SEQUENCE SET; Schema: public; Owner: josepdresch
--

SELECT pg_catalog.setval('public.estado_idestado_seq', 27, true);


--
-- TOC entry 3594 (class 0 OID 0)
-- Dependencies: 232
-- Name: experienciaprof_idexp_seq; Type: SEQUENCE SET; Schema: public; Owner: josepdresch
--

SELECT pg_catalog.setval('public.experienciaprof_idexp_seq', 35, true);


--
-- TOC entry 3595 (class 0 OID 0)
-- Dependencies: 230
-- Name: formacaoacad_idform_seq; Type: SEQUENCE SET; Schema: public; Owner: josepdresch
--

SELECT pg_catalog.setval('public.formacaoacad_idform_seq', 34, true);


--
-- TOC entry 3596 (class 0 OID 0)
-- Dependencies: 228
-- Name: idioma_ididioma_seq; Type: SEQUENCE SET; Schema: public; Owner: josepdresch
--

SELECT pg_catalog.setval('public.idioma_ididioma_seq', 6, true);


--
-- TOC entry 3597 (class 0 OID 0)
-- Dependencies: 215
-- Name: pais_idpais_seq; Type: SEQUENCE SET; Schema: public; Owner: josepdresch
--

SELECT pg_catalog.setval('public.pais_idpais_seq', 9, true);


--
-- TOC entry 3598 (class 0 OID 0)
-- Dependencies: 236
-- Name: post_idpost_seq; Type: SEQUENCE SET; Schema: public; Owner: josepdresch
--

SELECT pg_catalog.setval('public.post_idpost_seq', 21, true);


--
-- TOC entry 3599 (class 0 OID 0)
-- Dependencies: 234
-- Name: vagaemprego_idvagaemp_seq; Type: SEQUENCE SET; Schema: public; Owner: josepdresch
--

SELECT pg_catalog.setval('public.vagaemprego_idvagaemp_seq', 22, true);


--
-- TOC entry 3379 (class 2606 OID 33342)
-- Name: aplicaavaga aplicaavaga_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.aplicaavaga
    ADD CONSTRAINT aplicaavaga_pkey PRIMARY KEY (idvagaemp, idconta);


--
-- TOC entry 3343 (class 2606 OID 33125)
-- Name: cidade cidade_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT cidade_pkey PRIMARY KEY (idcidade);


--
-- TOC entry 3367 (class 2606 OID 33252)
-- Name: comentario comentario_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY (idcomentario);


--
-- TOC entry 3355 (class 2606 OID 33183)
-- Name: competencia competencia_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.competencia
    ADD CONSTRAINT competencia_pkey PRIMARY KEY (idcomp);


--
-- TOC entry 3381 (class 2606 OID 33358)
-- Name: conexao conexao_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.conexao
    ADD CONSTRAINT conexao_pkey PRIMARY KEY (idconta_1, idconta_2);


--
-- TOC entry 3345 (class 2606 OID 33140)
-- Name: conta conta_emailconta_key; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.conta
    ADD CONSTRAINT conta_emailconta_key UNIQUE (emailconta);


--
-- TOC entry 3347 (class 2606 OID 33138)
-- Name: conta conta_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.conta
    ADD CONSTRAINT conta_pkey PRIMARY KEY (idconta);


--
-- TOC entry 3351 (class 2606 OID 33162)
-- Name: corporativa corporativa_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.corporativa
    ADD CONSTRAINT corporativa_pkey PRIMARY KEY (idconta);


--
-- TOC entry 3353 (class 2606 OID 33172)
-- Name: corporativa_setoremp corporativa_setoremp_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.corporativa_setoremp
    ADD CONSTRAINT corporativa_setoremp_pkey PRIMARY KEY (setoremp);


--
-- TOC entry 3341 (class 2606 OID 33114)
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (idestado);


--
-- TOC entry 3361 (class 2606 OID 33208)
-- Name: experienciaprof experienciaprof_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.experienciaprof
    ADD CONSTRAINT experienciaprof_pkey PRIMARY KEY (idexp);


--
-- TOC entry 3375 (class 2606 OID 33312)
-- Name: expposscomp expposscomp_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.expposscomp
    ADD CONSTRAINT expposscomp_pkey PRIMARY KEY (idcomp, idexp);


--
-- TOC entry 3377 (class 2606 OID 33327)
-- Name: falaidiom falaidiom_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.falaidiom
    ADD CONSTRAINT falaidiom_pkey PRIMARY KEY (ididioma, idconta);


--
-- TOC entry 3359 (class 2606 OID 33195)
-- Name: formacaoacad formacaoacad_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.formacaoacad
    ADD CONSTRAINT formacaoacad_pkey PRIMARY KEY (idform);


--
-- TOC entry 3373 (class 2606 OID 33297)
-- Name: formposscomp formposscomp_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.formposscomp
    ADD CONSTRAINT formposscomp_pkey PRIMARY KEY (idcomp, idform);


--
-- TOC entry 3357 (class 2606 OID 33189)
-- Name: idioma idioma_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.idioma
    ADD CONSTRAINT idioma_pkey PRIMARY KEY (ididioma);


--
-- TOC entry 3339 (class 2606 OID 33108)
-- Name: pais pais_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (idpais);


--
-- TOC entry 3349 (class 2606 OID 33150)
-- Name: pessoal pessoal_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.pessoal
    ADD CONSTRAINT pessoal_pkey PRIMARY KEY (idconta);


--
-- TOC entry 3371 (class 2606 OID 33282)
-- Name: posscomp posscomp_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.posscomp
    ADD CONSTRAINT posscomp_pkey PRIMARY KEY (idcomp, idconta);


--
-- TOC entry 3365 (class 2606 OID 33239)
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (idpost);


--
-- TOC entry 3369 (class 2606 OID 33267)
-- Name: reagepost reagepost_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.reagepost
    ADD CONSTRAINT reagepost_pkey PRIMARY KEY (idconta, idpost);


--
-- TOC entry 3363 (class 2606 OID 33226)
-- Name: vagaemprego vagaemprego_pkey; Type: CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.vagaemprego
    ADD CONSTRAINT vagaemprego_pkey PRIMARY KEY (idvagaemp);


--
-- TOC entry 3405 (class 2606 OID 33348)
-- Name: aplicaavaga fk_aplica_pessoal; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.aplicaavaga
    ADD CONSTRAINT fk_aplica_pessoal FOREIGN KEY (idconta) REFERENCES public.pessoal(idconta) ON DELETE CASCADE;


--
-- TOC entry 3406 (class 2606 OID 33343)
-- Name: aplicaavaga fk_aplica_vaga; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.aplicaavaga
    ADD CONSTRAINT fk_aplica_vaga FOREIGN KEY (idvagaemp) REFERENCES public.vagaemprego(idvagaemp) ON DELETE CASCADE;


--
-- TOC entry 3383 (class 2606 OID 33126)
-- Name: cidade fk_cidade_estado; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.cidade
    ADD CONSTRAINT fk_cidade_estado FOREIGN KEY (idestado) REFERENCES public.estado(idestado);


--
-- TOC entry 3393 (class 2606 OID 33258)
-- Name: comentario fk_comentario_conta; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT fk_comentario_conta FOREIGN KEY (idconta) REFERENCES public.conta(idconta) ON DELETE CASCADE;


--
-- TOC entry 3394 (class 2606 OID 33253)
-- Name: comentario fk_comentario_post; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT fk_comentario_post FOREIGN KEY (idpost) REFERENCES public.post(idpost) ON DELETE CASCADE;


--
-- TOC entry 3407 (class 2606 OID 33359)
-- Name: conexao fk_conexao_pessoal1; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.conexao
    ADD CONSTRAINT fk_conexao_pessoal1 FOREIGN KEY (idconta_1) REFERENCES public.pessoal(idconta) ON DELETE CASCADE;


--
-- TOC entry 3408 (class 2606 OID 33364)
-- Name: conexao fk_conexao_pessoal2; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.conexao
    ADD CONSTRAINT fk_conexao_pessoal2 FOREIGN KEY (idconta_2) REFERENCES public.pessoal(idconta) ON DELETE CASCADE;


--
-- TOC entry 3384 (class 2606 OID 33141)
-- Name: conta fk_conta_cidade; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.conta
    ADD CONSTRAINT fk_conta_cidade FOREIGN KEY (idcidade) REFERENCES public.cidade(idcidade);


--
-- TOC entry 3386 (class 2606 OID 33163)
-- Name: corporativa fk_corporativa_conta; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.corporativa
    ADD CONSTRAINT fk_corporativa_conta FOREIGN KEY (idconta) REFERENCES public.conta(idconta) ON DELETE CASCADE;


--
-- TOC entry 3382 (class 2606 OID 33115)
-- Name: estado fk_estado_pais; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT fk_estado_pais FOREIGN KEY (idpais) REFERENCES public.pais(idpais);


--
-- TOC entry 3389 (class 2606 OID 33214)
-- Name: experienciaprof fk_experiencia_corporativa; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.experienciaprof
    ADD CONSTRAINT fk_experiencia_corporativa FOREIGN KEY (idemp) REFERENCES public.corporativa(idconta);


--
-- TOC entry 3390 (class 2606 OID 33209)
-- Name: experienciaprof fk_experiencia_pessoal; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.experienciaprof
    ADD CONSTRAINT fk_experiencia_pessoal FOREIGN KEY (idconta) REFERENCES public.pessoal(idconta) ON DELETE CASCADE;


--
-- TOC entry 3401 (class 2606 OID 33313)
-- Name: expposscomp fk_expposscomp_comp; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.expposscomp
    ADD CONSTRAINT fk_expposscomp_comp FOREIGN KEY (idcomp) REFERENCES public.competencia(idcomp) ON DELETE CASCADE;


--
-- TOC entry 3402 (class 2606 OID 33318)
-- Name: expposscomp fk_expposscomp_exp; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.expposscomp
    ADD CONSTRAINT fk_expposscomp_exp FOREIGN KEY (idexp) REFERENCES public.experienciaprof(idexp) ON DELETE CASCADE;


--
-- TOC entry 3403 (class 2606 OID 33328)
-- Name: falaidiom fk_falaidiom_idioma; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.falaidiom
    ADD CONSTRAINT fk_falaidiom_idioma FOREIGN KEY (ididioma) REFERENCES public.idioma(ididioma) ON DELETE CASCADE;


--
-- TOC entry 3404 (class 2606 OID 33333)
-- Name: falaidiom fk_falaidiom_pessoal; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.falaidiom
    ADD CONSTRAINT fk_falaidiom_pessoal FOREIGN KEY (idconta) REFERENCES public.pessoal(idconta) ON DELETE CASCADE;


--
-- TOC entry 3388 (class 2606 OID 33196)
-- Name: formacaoacad fk_formacao_pessoal; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.formacaoacad
    ADD CONSTRAINT fk_formacao_pessoal FOREIGN KEY (idconta) REFERENCES public.pessoal(idconta) ON DELETE CASCADE;


--
-- TOC entry 3399 (class 2606 OID 33298)
-- Name: formposscomp fk_formposscomp_comp; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.formposscomp
    ADD CONSTRAINT fk_formposscomp_comp FOREIGN KEY (idcomp) REFERENCES public.competencia(idcomp) ON DELETE CASCADE;


--
-- TOC entry 3400 (class 2606 OID 33303)
-- Name: formposscomp fk_formposscomp_form; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.formposscomp
    ADD CONSTRAINT fk_formposscomp_form FOREIGN KEY (idform) REFERENCES public.formacaoacad(idform) ON DELETE CASCADE;


--
-- TOC entry 3385 (class 2606 OID 33151)
-- Name: pessoal fk_pessoal_conta; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.pessoal
    ADD CONSTRAINT fk_pessoal_conta FOREIGN KEY (idconta) REFERENCES public.conta(idconta) ON DELETE CASCADE;


--
-- TOC entry 3397 (class 2606 OID 33283)
-- Name: posscomp fk_posscomp_comp; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.posscomp
    ADD CONSTRAINT fk_posscomp_comp FOREIGN KEY (idcomp) REFERENCES public.competencia(idcomp) ON DELETE CASCADE;


--
-- TOC entry 3398 (class 2606 OID 33288)
-- Name: posscomp fk_posscomp_pessoal; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.posscomp
    ADD CONSTRAINT fk_posscomp_pessoal FOREIGN KEY (idconta) REFERENCES public.pessoal(idconta) ON DELETE CASCADE;


--
-- TOC entry 3392 (class 2606 OID 33240)
-- Name: post fk_post_conta; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT fk_post_conta FOREIGN KEY (idconta) REFERENCES public.conta(idconta) ON DELETE CASCADE;


--
-- TOC entry 3395 (class 2606 OID 33268)
-- Name: reagepost fk_reagepost_conta; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.reagepost
    ADD CONSTRAINT fk_reagepost_conta FOREIGN KEY (idconta) REFERENCES public.conta(idconta) ON DELETE CASCADE;


--
-- TOC entry 3396 (class 2606 OID 33273)
-- Name: reagepost fk_reagepost_post; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.reagepost
    ADD CONSTRAINT fk_reagepost_post FOREIGN KEY (idpost) REFERENCES public.post(idpost) ON DELETE CASCADE;


--
-- TOC entry 3387 (class 2606 OID 33173)
-- Name: corporativa_setoremp fk_setor_corporativa; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.corporativa_setoremp
    ADD CONSTRAINT fk_setor_corporativa FOREIGN KEY (idconta) REFERENCES public.corporativa(idconta) ON DELETE CASCADE;


--
-- TOC entry 3391 (class 2606 OID 33227)
-- Name: vagaemprego fk_vaga_corporativa; Type: FK CONSTRAINT; Schema: public; Owner: josepdresch
--

ALTER TABLE ONLY public.vagaemprego
    ADD CONSTRAINT fk_vaga_corporativa FOREIGN KEY (idconta) REFERENCES public.corporativa(idconta) ON DELETE CASCADE;


-- Completed on 2026-05-26 10:42:23 -03

--
-- PostgreSQL database dump complete
--

\unrestrict 9lA9gxtQCMqgqelSAkJJiTMgxK4zNitlujZSPlQBSpFVJ7CctiglYqMBI09BRQ3

