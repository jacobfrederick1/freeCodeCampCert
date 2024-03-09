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
    name character varying(20) NOT NULL,
    is_expanding boolean NOT NULL,
    size_in_million_miles integer NOT NULL,
    description text NOT NULL
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_id integer NOT NULL,
    description text NOT NULL,
    has_normal_orbit boolean NOT NULL
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
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    description text NOT NULL,
    planet_data_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_data; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_data (
    planet_data_id integer NOT NULL,
    population_in_millions numeric(10,2) NOT NULL,
    size_in_thousand_miles numeric(10,2) NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.planet_data OWNER TO freecodecamp;

--
-- Name: planet_data_planet_data_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_data_planet_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_data_planet_data_id_seq OWNER TO freecodecamp;

--
-- Name: planet_data_planet_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_data_planet_data_id_seq OWNED BY public.planet_data.planet_data_id;


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
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    description text NOT NULL,
    size_in_million_miles integer NOT NULL
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_data planet_data_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_data ALTER COLUMN planet_data_id SET DEFAULT nextval('public.planet_data_planet_data_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy 1', true, 2, 'galaxy 1');
INSERT INTO public.galaxy VALUES (2, 'galaxy 2', true, 3, 'galaxy 2');
INSERT INTO public.galaxy VALUES (3, 'galaxy 3', true, 4, 'galaxy 3');
INSERT INTO public.galaxy VALUES (4, 'galaxy 4', true, 5, 'galaxy 4');
INSERT INTO public.galaxy VALUES (5, 'galaxy 5', true, 6, 'galaxy 5');
INSERT INTO public.galaxy VALUES (6, 'galaxy 6', true, 7, 'galaxy 6');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (40, 'moon 1', 1, 'moon 1', true);
INSERT INTO public.moon VALUES (41, 'moon 2', 2, 'moon 2', true);
INSERT INTO public.moon VALUES (42, 'moon 3', 3, 'moon 3', true);
INSERT INTO public.moon VALUES (43, 'moon 4', 4, 'moon 4', false);
INSERT INTO public.moon VALUES (44, 'moon 5', 5, 'moon 5', true);
INSERT INTO public.moon VALUES (45, 'moon 6', 6, 'moon 6', false);
INSERT INTO public.moon VALUES (46, 'moon 7', 1, 'moon 7', true);
INSERT INTO public.moon VALUES (47, 'moon 8', 2, 'moon 8', false);
INSERT INTO public.moon VALUES (48, 'moon 9', 3, 'moon 9', true);
INSERT INTO public.moon VALUES (49, 'moon 10', 4, 'moon 10', false);
INSERT INTO public.moon VALUES (50, 'moon 11', 5, 'moon 11', true);
INSERT INTO public.moon VALUES (51, 'moon 12', 6, 'moon 12', false);
INSERT INTO public.moon VALUES (52, 'moon 13', 14, 'moon 13', true);
INSERT INTO public.moon VALUES (53, 'moon 14', 15, 'moon 14', false);
INSERT INTO public.moon VALUES (54, 'moon 15', 16, 'moon 15', true);
INSERT INTO public.moon VALUES (55, 'moon 16', 17, 'moon 16', false);
INSERT INTO public.moon VALUES (56, 'moon 17', 18, 'moon 17', true);
INSERT INTO public.moon VALUES (57, 'moon 18', 19, 'moon 18', false);
INSERT INTO public.moon VALUES (58, 'moon 19', 19, 'moon 19', true);
INSERT INTO public.moon VALUES (59, 'moon 20', 18, 'moon 20', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet 1', 1, 'planet 1', 1);
INSERT INTO public.planet VALUES (2, 'planet 2', 2, 'planet 2', 2);
INSERT INTO public.planet VALUES (3, 'planet 3', 3, 'planet 3', 3);
INSERT INTO public.planet VALUES (4, 'planet 4', 4, 'planet 4', 4);
INSERT INTO public.planet VALUES (5, 'planet 5', 5, 'planet 5', 5);
INSERT INTO public.planet VALUES (6, 'planet 6', 6, 'planet 6', 6);
INSERT INTO public.planet VALUES (14, 'planet 7', 1, 'planet 7', 7);
INSERT INTO public.planet VALUES (15, 'planet 8', 2, 'planet 8', 8);
INSERT INTO public.planet VALUES (16, 'planet 9', 3, 'planet 9', 9);
INSERT INTO public.planet VALUES (17, 'planet 10', 4, 'planet 10', 10);
INSERT INTO public.planet VALUES (18, 'planet 11', 5, 'planet 11', 11);
INSERT INTO public.planet VALUES (19, 'planet 12', 6, 'planet 12', 12);


--
-- Data for Name: planet_data; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_data VALUES (1, 1.10, 1.10, 'planet 1');
INSERT INTO public.planet_data VALUES (2, 2.10, 2.10, 'planet 2');
INSERT INTO public.planet_data VALUES (3, 3.10, 3.10, 'planet 3');
INSERT INTO public.planet_data VALUES (4, 4.10, 4.10, 'planet 4');
INSERT INTO public.planet_data VALUES (5, 5.10, 5.10, 'planet 5');
INSERT INTO public.planet_data VALUES (6, 6.10, 6.10, 'planet 6');
INSERT INTO public.planet_data VALUES (7, 7.10, 7.10, 'planet 7');
INSERT INTO public.planet_data VALUES (8, 8.10, 8.10, 'planet 8');
INSERT INTO public.planet_data VALUES (9, 9.10, 9.10, 'planet 9');
INSERT INTO public.planet_data VALUES (10, 10.10, 10.10, 'planet 10');
INSERT INTO public.planet_data VALUES (11, 11.10, 11.10, 'planet 11');
INSERT INTO public.planet_data VALUES (12, 12.10, 12.10, 'planet 12');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star 1', 1, 'star 1', 1);
INSERT INTO public.star VALUES (2, 'star 2', 2, 'star 2', 2);
INSERT INTO public.star VALUES (3, 'star 3', 3, 'star 3', 3);
INSERT INTO public.star VALUES (4, 'star 4', 4, 'star 4', 4);
INSERT INTO public.star VALUES (5, 'star 5', 5, 'star 5', 5);
INSERT INTO public.star VALUES (6, 'star 6', 6, 'star 6', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 59, true);


--
-- Name: planet_data_planet_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_data_planet_data_id_seq', 12, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 19, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_data planet_data_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_data
    ADD CONSTRAINT planet_data_name_key UNIQUE (name);


--
-- Name: planet_data planet_data_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_data
    ADD CONSTRAINT planet_data_pkey PRIMARY KEY (planet_data_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_data_id_fkey FOREIGN KEY (planet_data_id) REFERENCES public.planet_data(planet_data_id);


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

