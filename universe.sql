--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    star_id integer,
    planet_id integer,
    diameter numeric(4,1),
    description text,
    has_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_planet (
    name character varying(40) NOT NULL,
    area integer NOT NULL,
    mass integer,
    galaxy_planet_id integer NOT NULL
);


ALTER TABLE public.galaxy_planet OWNER TO freecodecamp;

--
-- Name: galaxy_planet_galaxy_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_planet_galaxy_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_planet_galaxy_planet_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_planet_galaxy_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_planet_galaxy_planet_id_seq OWNED BY public.galaxy_planet.galaxy_planet_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    mass integer,
    area integer,
    diameter numeric(4,1) NOT NULL,
    description text,
    has_life boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    mass integer,
    area integer,
    diameter numeric(4,1) NOT NULL,
    description text,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    area integer,
    mass integer,
    diameter numeric(4,1) NOT NULL,
    description text,
    has_life boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_planet galaxy_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet ALTER COLUMN galaxy_planet_id SET DEFAULT nextval('public.galaxy_planet_galaxy_planet_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Earth', NULL, 1, 100.0, NULL, true);
INSERT INTO public.galaxy VALUES (2, 'Venus', NULL, 2, 80.0, NULL, false);
INSERT INTO public.galaxy VALUES (3, 'Mars', NULL, 3, 150.0, NULL, false);
INSERT INTO public.galaxy VALUES (4, 'Jupiter', NULL, 4, 300.0, NULL, false);
INSERT INTO public.galaxy VALUES (5, 'Saturn', NULL, 5, 120.0, NULL, false);
INSERT INTO public.galaxy VALUES (6, 'Mercury', NULL, 6, 70.0, NULL, false);
INSERT INTO public.galaxy VALUES (7, 'Beer', NULL, NULL, 700.0, 'no ids', true);
INSERT INTO public.galaxy VALUES (8, 'Deer', NULL, NULL, 800.0, 'no ids', true);
INSERT INTO public.galaxy VALUES (9, 'John', NULL, NULL, 900.0, 'no ids', true);
INSERT INTO public.galaxy VALUES (10, 'Minto', NULL, NULL, 960.0, 'no ids', true);
INSERT INTO public.galaxy VALUES (11, 'Pluto', NULL, NULL, 970.0, 'no ids', true);
INSERT INTO public.galaxy VALUES (12, 'Edge', NULL, NULL, 980.0, 'no ids', true);
INSERT INTO public.galaxy VALUES (13, 'meloni', NULL, NULL, 980.0, 'no ids', true);
INSERT INTO public.galaxy VALUES (14, 'Tom', NULL, NULL, 160.0, NULL, NULL);
INSERT INTO public.galaxy VALUES (15, 'Jerry', NULL, NULL, 150.0, NULL, NULL);
INSERT INTO public.galaxy VALUES (16, 'Dino', NULL, NULL, 140.0, NULL, NULL);
INSERT INTO public.galaxy VALUES (17, 'Atlas', NULL, NULL, 130.0, NULL, NULL);
INSERT INTO public.galaxy VALUES (18, 'Scorpio', NULL, NULL, 120.0, NULL, NULL);
INSERT INTO public.galaxy VALUES (19, 'Aries', NULL, NULL, 900.0, NULL, NULL);
INSERT INTO public.galaxy VALUES (20, 'Gemini', NULL, NULL, 800.0, NULL, NULL);
INSERT INTO public.galaxy VALUES (21, 'Harries', NULL, NULL, 170.0, NULL, NULL);
INSERT INTO public.galaxy VALUES (22, '', NULL, NULL, 170.0, NULL, NULL);


--
-- Data for Name: galaxy_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_planet VALUES ('trump', 300, NULL, 1);
INSERT INTO public.galaxy_planet VALUES ('Biden', 400, NULL, 2);
INSERT INTO public.galaxy_planet VALUES ('Kamala', 500, NULL, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth', 20000, 1000, 100.0, 'blue in color', true, 1);
INSERT INTO public.moon VALUES (2, 'Venus', 16000, 8000, 80.0, NULL, false, 2);
INSERT INTO public.moon VALUES (3, 'Mars', 300000, 15000, 150.0, NULL, false, 3);
INSERT INTO public.moon VALUES (4, 'Jupiter', 6000000, 30000, 300.0, NULL, false, 4);
INSERT INTO public.moon VALUES (5, 'Saturn', 2400000, 12000, 120.0, NULL, false, 5);
INSERT INTO public.moon VALUES (6, 'Mercury', 140000, 7000, 70.0, NULL, false, 6);
INSERT INTO public.moon VALUES (8, 'Pluto', 40000, 2000, 200.0, 'need to check', true, 8);
INSERT INTO public.moon VALUES (9, 'Minto', 60000, 3000, 300.0, 'need to check', true, 9);
INSERT INTO public.moon VALUES (10, 'Edge', 80000, 4000, 400.0, 'need to check', true, 10);
INSERT INTO public.moon VALUES (11, 'John', 100000, 5000, 500.0, 'need to check', true, 11);
INSERT INTO public.moon VALUES (12, 'Deer', 120000, 6000, 600.0, 'need to check', true, 12);
INSERT INTO public.moon VALUES (13, 'Beer', 140000, 7000, 700.0, 'need to check', true, 13);
INSERT INTO public.moon VALUES (14, 'Gemini', 160000, 8000, 800.0, 'no planet id', true, 15);
INSERT INTO public.moon VALUES (15, 'Aries', 180000, 9000, 900.0, 'no planet id', true, 16);
INSERT INTO public.moon VALUES (16, 'Scorpio', 240000, 12000, 120.0, 'no planet id', true, 17);
INSERT INTO public.moon VALUES (17, 'Atlas', 260000, 13000, 130.0, 'no planet id', true, 18);
INSERT INTO public.moon VALUES (18, 'Hercules', 280000, 14000, 140.0, 'no planet id', true, 19);
INSERT INTO public.moon VALUES (19, 'Dino', 300000, 15000, 150.0, 'no planet id', true, 21);
INSERT INTO public.moon VALUES (20, 'Jerry', 320000, 16000, 160.0, 'no planet id', true, 22);
INSERT INTO public.moon VALUES (21, 'Tom', 340000, 17000, 170.0, 'no planet id', true, 23);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 20000, 1000, 100.0, 'blue in color', true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 16000, 8000, 80.0, NULL, false, 2);
INSERT INTO public.planet VALUES (3, 'Mars', 300000, 15000, 150.0, NULL, false, 3);
INSERT INTO public.planet VALUES (4, 'Jupiter', 6000000, 30000, 300.0, NULL, false, 4);
INSERT INTO public.planet VALUES (5, 'Saturn', 2400000, 12000, 120.0, NULL, false, 5);
INSERT INTO public.planet VALUES (6, 'Mercury', 140000, 7000, 70.0, NULL, false, 6);
INSERT INTO public.planet VALUES (13, 'Beer', 140000, 7000, 700.0, 'need to check', true, 12);
INSERT INTO public.planet VALUES (8, 'Pluto', 40000, 2000, 200.0, 'need to check', true, 7);
INSERT INTO public.planet VALUES (9, 'Minto', 60000, 3000, 300.0, 'need to check', true, 8);
INSERT INTO public.planet VALUES (10, 'Edge', 80000, 4000, 400.0, 'need to check', true, 9);
INSERT INTO public.planet VALUES (11, 'John', 100000, 5000, 500.0, 'need to check', true, 10);
INSERT INTO public.planet VALUES (12, 'Deer', 120000, 6000, 600.0, 'need to check', true, 11);
INSERT INTO public.planet VALUES (15, 'Gemini', NULL, NULL, 800.0, NULL, NULL, 13);
INSERT INTO public.planet VALUES (16, 'Aries', NULL, NULL, 900.0, NULL, NULL, 14);
INSERT INTO public.planet VALUES (17, 'Scorpio', NULL, NULL, 120.0, NULL, NULL, 15);
INSERT INTO public.planet VALUES (18, 'Atlas', NULL, NULL, 130.0, NULL, NULL, 16);
INSERT INTO public.planet VALUES (19, 'Hercules', NULL, NULL, 140.0, NULL, NULL, 20);
INSERT INTO public.planet VALUES (21, 'Dino', NULL, NULL, 140.0, NULL, NULL, 17);
INSERT INTO public.planet VALUES (22, 'Jerry', NULL, NULL, 150.0, NULL, NULL, 18);
INSERT INTO public.planet VALUES (23, 'Tom', NULL, NULL, 160.0, NULL, NULL, 19);
INSERT INTO public.planet VALUES (20, '', NULL, NULL, 140.0, NULL, NULL, 21);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Venus', 8000, 16000, 80.0, NULL, false, 2);
INSERT INTO public.star VALUES (2, 'Mars', 15000, 300000, 150.0, NULL, false, 3);
INSERT INTO public.star VALUES (3, 'Jupiter', 30000, 6000000, 300.0, NULL, false, 4);
INSERT INTO public.star VALUES (4, 'Saturn', 12000, 2400000, 120.0, NULL, false, 5);
INSERT INTO public.star VALUES (5, 'Mercury', 7000, 140000, 70.0, NULL, false, 6);
INSERT INTO public.star VALUES (6, 'Earth', 1000, 20000, 100.0, 'blue in color', true, 1);
INSERT INTO public.star VALUES (12, 'Beer', 7000, 140000, 700.0, 'need to check', true, 7);
INSERT INTO public.star VALUES (11, 'Deer', 6000, 120000, 600.0, 'need to check', true, 8);
INSERT INTO public.star VALUES (10, 'John', 5000, 100000, 500.0, 'need to check', true, 9);
INSERT INTO public.star VALUES (8, 'Minto', 3000, 60000, 300.0, 'need to check', true, 10);
INSERT INTO public.star VALUES (7, 'Pluto', 2000, 40000, 200.0, 'need to check', true, 11);
INSERT INTO public.star VALUES (9, 'Edge', 4000, 80000, 400.0, 'need to check', true, 12);
INSERT INTO public.star VALUES (19, 'Tom', NULL, NULL, 160.0, NULL, NULL, 14);
INSERT INTO public.star VALUES (18, 'Jerry', NULL, NULL, 150.0, NULL, NULL, 15);
INSERT INTO public.star VALUES (17, 'Dino', NULL, NULL, 140.0, NULL, NULL, 16);
INSERT INTO public.star VALUES (16, 'Atlas', NULL, NULL, 130.0, NULL, NULL, 17);
INSERT INTO public.star VALUES (15, 'Scorpio', NULL, NULL, 120.0, NULL, NULL, 18);
INSERT INTO public.star VALUES (14, 'Aries', NULL, NULL, 900.0, NULL, NULL, 19);
INSERT INTO public.star VALUES (13, 'Gemini', NULL, NULL, 800.0, NULL, NULL, 20);
INSERT INTO public.star VALUES (21, '', NULL, NULL, 170.0, NULL, NULL, 21);
INSERT INTO public.star VALUES (20, 'Harries', NULL, NULL, 170.0, NULL, NULL, 22);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 22, true);


--
-- Name: galaxy_planet_galaxy_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_planet_galaxy_planet_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 23, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 21, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_planet galaxy_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
    ADD CONSTRAINT galaxy_planet_name_key UNIQUE (name);


--
-- Name: galaxy_planet galaxy_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planet
    ADD CONSTRAINT galaxy_planet_pkey PRIMARY KEY (galaxy_planet_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planet unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: moon unique_name1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name1 UNIQUE (name);


--
-- Name: star unique_name2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name2 UNIQUE (name);


--
-- Name: galaxy unique_name3; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name3 UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

