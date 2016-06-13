--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6beta1
-- Dumped by pg_dump version 9.6beta1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alocacao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alocacao (
    idalocacao integer NOT NULL,
    idmaquina integer NOT NULL,
    matricula integer NOT NULL,
    idpeca integer NOT NULL,
    datainicio date NOT NULL,
    datafim date NOT NULL,
    horainicio time without time zone NOT NULL,
    horafim time without time zone NOT NULL
);


--
-- Name: alocacao_idalocacao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE alocacao_idalocacao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alocacao_idalocacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE alocacao_idalocacao_seq OWNED BY alocacao.idalocacao;


--
-- Name: categoria; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE categoria (
    idcategoria integer NOT NULL,
    nome character varying NOT NULL
);


--
-- Name: categoria_idcategoria_seq_1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE categoria_idcategoria_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categoria_idcategoria_seq_1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE categoria_idcategoria_seq_1 OWNED BY categoria.idcategoria;


--
-- Name: endereco; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE endereco (
    idendereco integer NOT NULL,
    logradouro character varying NOT NULL,
    numero integer NOT NULL,
    cep character(8) NOT NULL,
    cidade character varying NOT NULL,
    estado character varying NOT NULL
);


--
-- Name: endereco_idendereco_seq_2; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE endereco_idendereco_seq_2
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: endereco_idendereco_seq_2; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE endereco_idendereco_seq_2 OWNED BY endereco.idendereco;


--
-- Name: estilista; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE estilista (
    idestilista integer NOT NULL,
    nome character varying NOT NULL,
    idendereco integer NOT NULL,
    idtelefone integer NOT NULL,
    descricao character varying NOT NULL
);


--
-- Name: estilista_idestilista_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE estilista_idestilista_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: estilista_idestilista_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE estilista_idestilista_seq OWNED BY estilista.idestilista;


--
-- Name: fabricante; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE fabricante (
    matricula integer NOT NULL,
    nome character varying NOT NULL,
    idtelefone integer NOT NULL,
    idendereco integer NOT NULL,
    descricao character varying NOT NULL
);


--
-- Name: fabricante_matricula_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fabricante_matricula_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fabricante_matricula_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE fabricante_matricula_seq OWNED BY fabricante.matricula;


--
-- Name: funcionario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE funcionario (
    matricula integer NOT NULL,
    nome character varying NOT NULL,
    datanascimento varchar(10) NOT NULL,
    idendereco integer NOT NULL,
    idtelefone integer NOT NULL,
    idsupervisor integer NOT NULL,
    salariomin real NOT NULL,
    idcategoria integer NOT NULL,
	senha varchar(10)
);


--
-- Name: funcionario_matricula_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE funcionario_matricula_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: funcionario_matricula_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE funcionario_matricula_seq OWNED BY funcionario.matricula;


--
-- Name: manutencao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE manutencao (
    idmanutencao integer NOT NULL,
    idmaquina integer NOT NULL,
    local character varying NOT NULL,
    descricao character varying NOT NULL,
    idstatus integer NOT NULL,
    datainicio date NOT NULL,
    datafim date NOT NULL,
    horainicio time without time zone NOT NULL,
    horafim time without time zone NOT NULL
);


--
-- Name: manutencao_idmanutencao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE manutencao_idmanutencao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: manutencao_idmanutencao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE manutencao_idmanutencao_seq OWNED BY manutencao.idmanutencao;


--
-- Name: maquina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE maquina (
    idmaquina integer NOT NULL,
    idcategoria integer NOT NULL,
    idstatus integer NOT NULL
);


--
-- Name: peca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE peca (
    idpeca integer NOT NULL,
    modelo character varying NOT NULL,
    idpedido integer NOT NULL,
    descricao character varying NOT NULL,
    idcategoria integer NOT NULL,
    qualidade character varying NOT NULL
);


--
-- Name: peca_idpeca_seq_2; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE peca_idpeca_seq_2
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: peca_idpeca_seq_2; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE peca_idpeca_seq_2 OWNED BY peca.idpeca;


--
-- Name: pedido; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pedido (
    idpedido integer NOT NULL,
    datapedido date NOT NULL,
    idestilista integer NOT NULL,
    total real NOT NULL
);


--
-- Name: pedido_idpedido_seq_1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pedido_idpedido_seq_1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pedido_idpedido_seq_1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pedido_idpedido_seq_1 OWNED BY pedido.idpedido;


--
-- Name: producao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE producao (
    idproducao integer NOT NULL,
    idpeca integer NOT NULL,
    idstatus integer NOT NULL,
    idalocacao integer NOT NULL,
    preco real NOT NULL
);


--
-- Name: producao_idproducao_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE producao_idproducao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: producao_idproducao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE producao_idproducao_seq OWNED BY producao.idproducao;


--
-- Name: rel_desalocada; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW rel_desalocada AS
 SELECT f.nome,
    f.matricula,
    f.salariomin
   FROM funcionario f
  WHERE (NOT (f.matricula IN ( SELECT alocacao.matricula
           FROM alocacao)));


--
-- Name: rel_maquinasconserto; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW rel_maquinasconserto AS
 SELECT maq.idmaquina,
    c.nome,
    m.descricao,
    count(*) AS freq
   FROM ((maquina maq
     JOIN manutencao m ON ((maq.idmaquina = m.idmaquina)))
     JOIN categoria c ON ((maq.idcategoria = c.idcategoria)))
  GROUP BY maq.idmaquina, c.nome, m.descricao
 HAVING (count(*) > 3);


--
-- Name: rel_pecasproduzidas; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW rel_pecasproduzidas AS
 SELECT f.nome,
    f.matricula,
    p.modelo,
    p.descricao,
    a.datainicio,
    a.datafim,
    a.horainicio,
    a.horafim,
    m.idmaquina
   FROM (((funcionario f
     JOIN alocacao a ON ((f.matricula = a.matricula)))
     JOIN maquina m ON ((a.idmaquina = m.idmaquina)))
     JOIN peca p ON ((a.idpeca = p.idpeca)));


--
-- Name: status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE status (
    idstatus integer NOT NULL,
    nome character varying NOT NULL
);


--
-- Name: supervisao; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE supervisao (
    idsupervisor integer NOT NULL
);


--
-- Name: supervisor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE supervisor (
    idsupervisor integer NOT NULL,
    nome character varying NOT NULL,
    datanascimento date NOT NULL,
    idendereco integer NOT NULL,
    idtelefone integer NOT NULL,
    salariomin real NOT NULL
);


--
-- Name: telefone; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE telefone (
    idtelefone integer NOT NULL,
    numero character(10) NOT NULL
);


--
-- Name: telefone_idtelefone_seq_2; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE telefone_idtelefone_seq_2
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: telefone_idtelefone_seq_2; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE telefone_idtelefone_seq_2 OWNED BY telefone.idtelefone;




--
-- Name: alocacao idalocacao; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY alocacao ALTER COLUMN idalocacao SET DEFAULT nextval('alocacao_idalocacao_seq'::regclass);


--
-- Name: categoria idcategoria; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoria ALTER COLUMN idcategoria SET DEFAULT nextval('categoria_idcategoria_seq_1'::regclass);


--
-- Name: endereco idendereco; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY endereco ALTER COLUMN idendereco SET DEFAULT nextval('endereco_idendereco_seq_2'::regclass);


--
-- Name: estilista idestilista; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY estilista ALTER COLUMN idestilista SET DEFAULT nextval('estilista_idestilista_seq'::regclass);


--
-- Name: fabricante matricula; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY fabricante ALTER COLUMN matricula SET DEFAULT nextval('fabricante_matricula_seq'::regclass);


--
-- Name: funcionario matricula; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY funcionario ALTER COLUMN matricula SET DEFAULT nextval('funcionario_matricula_seq'::regclass);


--
-- Name: manutencao idmanutencao; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY manutencao ALTER COLUMN idmanutencao SET DEFAULT nextval('manutencao_idmanutencao_seq'::regclass);


--
-- Name: peca idpeca; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY peca ALTER COLUMN idpeca SET DEFAULT nextval('peca_idpeca_seq_2'::regclass);


--
-- Name: pedido idpedido; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido ALTER COLUMN idpedido SET DEFAULT nextval('pedido_idpedido_seq_1'::regclass);


--
-- Name: producao idproducao; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY producao ALTER COLUMN idproducao SET DEFAULT nextval('producao_idproducao_seq'::regclass);


--
-- Name: telefone idtelefone; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefone ALTER COLUMN idtelefone SET DEFAULT nextval('telefone_idtelefone_seq_2'::regclass);


--
-- Data for Name: alocacao; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO alocacao (idalocacao, idmaquina, matricula, idpeca, datainicio, datafim, horainicio, horafim) VALUES (1, 1, 1, 1, '2016-05-24', '2016-05-25', '08:00:00', '16:00:00');
INSERT INTO alocacao (idalocacao, idmaquina, matricula, idpeca, datainicio, datafim, horainicio, horafim) VALUES (2, 2, 2, 2, '2016-04-20', '2016-04-23', '08:00:00', '17:00:00');


--
-- Name: alocacao_idalocacao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('alocacao_idalocacao_seq', 1, false);


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO categoria (idcategoria, nome) VALUES (1, 'Tecido');
INSERT INTO categoria (idcategoria, nome) VALUES (2, 'Malha');
INSERT INTO categoria (idcategoria, nome) VALUES (3, 'Alta Costura');


--
-- Name: categoria_idcategoria_seq_1; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('categoria_idcategoria_seq_1', 3, true);


--
-- Data for Name: endereco; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO endereco (idendereco, logradouro, numero, cep, cidade, estado) VALUES (1, 'Rua das Flores', 53, '24563985', 'Rio de Janeiro', 'RJ');
INSERT INTO endereco (idendereco, logradouro, numero, cep, cidade, estado) VALUES (2, 'Rua do Bispo', 96, '25463986', 'Rio de Janeiro', 'RJ');
INSERT INTO endereco (idendereco, logradouro, numero, cep, cidade, estado) VALUES (3, 'Rua Tocantins', 124, '24563985', 'Rio de Janeiro', 'RJ');
INSERT INTO endereco (idendereco, logradouro, numero, cep, cidade, estado) VALUES (4, 'Rua Amaral Peixoto', 25, '24563986', 'Rio de Janeiro', 'RJ');
INSERT INTO endereco (idendereco, logradouro, numero, cep, cidade, estado) VALUES (5, 'Rua Amelia de Carvalho', 74, '24563986', 'Rio de Janeiro', 'RJ');
INSERT INTO endereco (idendereco, logradouro, numero, cep, cidade, estado) VALUES (6, 'Rua Jabuti', 1, '25639685', 'Rio de Janeiro', 'RJ');
INSERT INTO endereco (idendereco, logradouro, numero, cep, cidade, estado) VALUES (7, 'Rua das Pedras', 41, '24563974', 'Rio de Janeiro', 'RJ');
INSERT INTO endereco (idendereco, logradouro, numero, cep, cidade, estado) VALUES (8, 'Rua Janot', 15, '24563985', 'Rio de Janeiro', 'RJ');


--
-- Name: endereco_idendereco_seq_2; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('endereco_idendereco_seq_2', 5, true);


--
-- Data for Name: estilista; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO estilista (idestilista, nome, idendereco, idtelefone, descricao) VALUES (1, 'Marcos', 8, 8, 'Primeiro cliente');


--
-- Name: estilista_idestilista_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('estilista_idestilista_seq', 1, false);


--
-- Data for Name: fabricante; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO fabricante (matricula, nome, idtelefone, idendereco, descricao) VALUES (123, 'Teka', 7, 7, 'Alta tecnologia');


--
-- Name: fabricante_matricula_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('fabricante_matricula_seq', 1, false);


--
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO funcionario (matricula, nome, datanascimento, idendereco, idtelefone, idsupervisor, salariomin, idcategoria) VALUES (1, 'Maria', '1970-08-02', 4, 4, 1, 800, 1);
INSERT INTO funcionario (matricula, nome, datanascimento, idendereco, idtelefone, idsupervisor, salariomin, idcategoria) VALUES (2, 'Vania', '1978-07-09', 5, 5, 2, 800, 2);
INSERT INTO funcionario (matricula, nome, datanascimento, idendereco, idtelefone, idsupervisor, salariomin, idcategoria) VALUES (3, 'Patricia', '1980-02-25', 6, 6, 3, 800, 3);


--
-- Name: funcionario_matricula_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('funcionario_matricula_seq', 1, false);


--
-- Data for Name: manutencao; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO manutencao (idmanutencao, idmaquina, local, descricao, idstatus, datainicio, datafim, horainicio, horafim) VALUES (1, 3, 'RJ', 'Problema no pedal', 1, '2016-05-21', '2016-05-29', '08:00:00', '16:00:00');


--
-- Name: manutencao_idmanutencao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('manutencao_idmanutencao_seq', 1, false);


--
-- Data for Name: maquina; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO maquina (idmaquina, idcategoria, idstatus) VALUES (1, 1, 0);
INSERT INTO maquina (idmaquina, idcategoria, idstatus) VALUES (2, 2, 0);
INSERT INTO maquina (idmaquina, idcategoria, idstatus) VALUES (3, 3, 1);


--
-- Data for Name: peca; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO peca (idpeca, modelo, idpedido, descricao, idcategoria, qualidade) VALUES (1, 'top', 1, 'top de tecido', 1, 'alta');
INSERT INTO peca (idpeca, modelo, idpedido, descricao, idcategoria, qualidade) VALUES (2, 'blusa', 2, 'blusa de alta costura', 3, 'alta');


--
-- Name: peca_idpeca_seq_2; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('peca_idpeca_seq_2', 1, false);


--
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO pedido (idpedido, datapedido, idestilista, total) VALUES (1, '2016-05-25', 1, 400);
INSERT INTO pedido (idpedido, datapedido, idestilista, total) VALUES (2, '2016-04-03', 1, 500);


--
-- Name: pedido_idpedido_seq_1; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pedido_idpedido_seq_1', 1, false);


--
-- Data for Name: producao; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO producao (idproducao, idpeca, idstatus, idalocacao, preco) VALUES (1, 1, 0, 1, 400);
INSERT INTO producao (idproducao, idpeca, idstatus, idalocacao, preco) VALUES (2, 2, 0, 2, 500);


--
-- Name: producao_idproducao_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('producao_idproducao_seq', 1, false);


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO status (idstatus, nome) VALUES (0, 'Disponível');
INSERT INTO status (idstatus, nome) VALUES (1, 'Em manutenção');


--
-- Data for Name: supervisao; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO supervisao (idsupervisor) VALUES (1);
INSERT INTO supervisao (idsupervisor) VALUES (2);
INSERT INTO supervisao (idsupervisor) VALUES (3);


--
-- Data for Name: supervisor; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO supervisor (idsupervisor, nome, datanascimento, idendereco, idtelefone, salariomin) VALUES (2, 'Maria', '1970-04-09', 2, 2, 2000);
INSERT INTO supervisor (idsupervisor, nome, datanascimento, idendereco, idtelefone, salariomin) VALUES (1, 'Paulo', '1963-03-20', 1, 1, 2000);
INSERT INTO supervisor (idsupervisor, nome, datanascimento, idendereco, idtelefone, salariomin) VALUES (3, 'Andrea', '1975-02-01', 3, 3, 2000);


--
-- Data for Name: telefone; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO telefone (idtelefone, numero) VALUES (1, '2124569685');
INSERT INTO telefone (idtelefone, numero) VALUES (2, '2127295636');
INSERT INTO telefone (idtelefone, numero) VALUES (3, '2237569857');
INSERT INTO telefone (idtelefone, numero) VALUES (4, '2236898567');
INSERT INTO telefone (idtelefone, numero) VALUES (5, '2126589653');
INSERT INTO telefone (idtelefone, numero) VALUES (6, '2127245810');
INSERT INTO telefone (idtelefone, numero) VALUES (7, '2125689364');
INSERT INTO telefone (idtelefone, numero) VALUES (8, '2136595420');


--
-- Name: telefone_idtelefone_seq_2; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('telefone_idtelefone_seq_2', 4, true);
--
-- Name: alocacao alocacao_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alocacao
    ADD CONSTRAINT alocacao_pk PRIMARY KEY (idalocacao);


--
-- Name: categoria categoria_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT categoria_pk PRIMARY KEY (idcategoria);


--
-- Name: endereco endereco_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco_pk PRIMARY KEY (idendereco);


--
-- Name: estilista estilista_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY estilista
    ADD CONSTRAINT estilista_pk PRIMARY KEY (idestilista);


--
-- Name: fabricante fabricante_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fabricante
    ADD CONSTRAINT fabricante_pk PRIMARY KEY (matricula);


--
-- Name: funcionario funcionario_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT funcionario_pk PRIMARY KEY (matricula);


--
-- Name: manutencao manutencao_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manutencao
    ADD CONSTRAINT manutencao_pk PRIMARY KEY (idmanutencao);


--
-- Name: maquina maquina_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY maquina
    ADD CONSTRAINT maquina_pk PRIMARY KEY (idmaquina);


--
-- Name: peca peca_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY peca
    ADD CONSTRAINT peca_pk PRIMARY KEY (idpeca);


--
-- Name: pedido pedido_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT pedido_pk PRIMARY KEY (idpedido);


--
-- Name: producao producao_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY producao
    ADD CONSTRAINT producao_pk PRIMARY KEY (idproducao);


--
-- Name: status status_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY status
    ADD CONSTRAINT status_pk PRIMARY KEY (idstatus);


--
-- Name: supervisao supervisao_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY supervisao
    ADD CONSTRAINT supervisao_pk PRIMARY KEY (idsupervisor);


--
-- Name: supervisor supervisor_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY supervisor
    ADD CONSTRAINT supervisor_pk PRIMARY KEY (idsupervisor);


--
-- Name: telefone telefone_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefone
    ADD CONSTRAINT telefone_pk PRIMARY KEY (idtelefone);



--
-- Name: fabricante_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fabricante_idx ON fabricante USING btree (nome);


--
-- Name: manutencao_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX manutencao_idx ON manutencao USING btree (datainicio);


--
-- Name: peca_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX peca_idx ON peca USING btree (modelo);


--
-- Name: producao alocacao_producao_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY producao
    ADD CONSTRAINT alocacao_producao_fk FOREIGN KEY (idalocacao) REFERENCES alocacao(idalocacao);


--
-- Name: funcionario categoria_funcionario_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT categoria_funcionario_fk FOREIGN KEY (idcategoria) REFERENCES categoria(idcategoria);


--
-- Name: maquina categoria_maquina_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY maquina
    ADD CONSTRAINT categoria_maquina_fk FOREIGN KEY (idcategoria) REFERENCES categoria(idcategoria);


--
-- Name: peca categoria_peca_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY peca
    ADD CONSTRAINT categoria_peca_fk FOREIGN KEY (idcategoria) REFERENCES categoria(idcategoria);


--
-- Name: estilista endereco_estilista_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY estilista
    ADD CONSTRAINT endereco_estilista_fk FOREIGN KEY (idendereco) REFERENCES endereco(idendereco);


--
-- Name: fabricante endereco_fabricante_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fabricante
    ADD CONSTRAINT endereco_fabricante_fk FOREIGN KEY (idendereco) REFERENCES endereco(idendereco);


--
-- Name: funcionario endereco_funcionario_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT endereco_funcionario_fk FOREIGN KEY (idendereco) REFERENCES endereco(idendereco);


--
-- Name: supervisor endereco_supervisor_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY supervisor
    ADD CONSTRAINT endereco_supervisor_fk FOREIGN KEY (idendereco) REFERENCES endereco(idendereco);


--
-- Name: pedido estilista_pedido_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pedido
    ADD CONSTRAINT estilista_pedido_fk FOREIGN KEY (idestilista) REFERENCES estilista(idestilista);


--
-- Name: alocacao funcionario_alocacao_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alocacao
    ADD CONSTRAINT funcionario_alocacao_fk FOREIGN KEY (matricula) REFERENCES funcionario(matricula);


--
-- Name: alocacao maquina_alocacao_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alocacao
    ADD CONSTRAINT maquina_alocacao_fk FOREIGN KEY (idmaquina) REFERENCES maquina(idmaquina);


--
-- Name: manutencao maquina_manutencao_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manutencao
    ADD CONSTRAINT maquina_manutencao_fk FOREIGN KEY (idmaquina) REFERENCES maquina(idmaquina);


--
-- Name: alocacao peca_alocacao_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alocacao
    ADD CONSTRAINT peca_alocacao_fk FOREIGN KEY (idpeca) REFERENCES peca(idpeca);


--
-- Name: producao peca_producao_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY producao
    ADD CONSTRAINT peca_producao_fk FOREIGN KEY (idpeca) REFERENCES peca(idpeca);


--
-- Name: peca pedido_peca_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY peca
    ADD CONSTRAINT pedido_peca_fk FOREIGN KEY (idpedido) REFERENCES pedido(idpedido);


--
-- Name: manutencao status_manutencao_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY manutencao
    ADD CONSTRAINT status_manutencao_fk FOREIGN KEY (idstatus) REFERENCES status(idstatus);


--
-- Name: maquina status_maquina_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY maquina
    ADD CONSTRAINT status_maquina_fk FOREIGN KEY (idstatus) REFERENCES status(idstatus);


--
-- Name: producao status_producao_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY producao
    ADD CONSTRAINT status_producao_fk FOREIGN KEY (idstatus) REFERENCES status(idstatus);


--
-- Name: funcionario supervisao_funcionario_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT supervisao_funcionario_fk FOREIGN KEY (idsupervisor) REFERENCES supervisao(idsupervisor);


--
-- Name: supervisao supervisor_supervisao_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY supervisao
    ADD CONSTRAINT supervisor_supervisao_fk FOREIGN KEY (idsupervisor) REFERENCES supervisor(idsupervisor);


--
-- Name: estilista telefone_estilista_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY estilista
    ADD CONSTRAINT telefone_estilista_fk FOREIGN KEY (idtelefone) REFERENCES telefone(idtelefone);


--
-- Name: fabricante telefone_fabricante_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fabricante
    ADD CONSTRAINT telefone_fabricante_fk FOREIGN KEY (idtelefone) REFERENCES telefone(idtelefone);


--
-- Name: funcionario telefone_funcionario_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funcionario
    ADD CONSTRAINT telefone_funcionario_fk FOREIGN KEY (idtelefone) REFERENCES telefone(idtelefone);


--
-- Name: supervisor telefone_supervisor_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY supervisor
    ADD CONSTRAINT telefone_supervisor_fk FOREIGN KEY (idtelefone) REFERENCES telefone(idtelefone);


--
-- PostgreSQL database dump complete
--

