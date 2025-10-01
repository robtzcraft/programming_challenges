--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO postgres;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    asteroid_name character varying(100) NOT NULL,
    asteroid_composition text,
    asteroid_type character varying(100),
    asteroid_description text NOT NULL,
    asteroid_size text
);


ALTER TABLE public.asteroid OWNER TO postgres;

--
-- Name: asteroids_asteroids_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.asteroid ALTER COLUMN asteroid_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.asteroids_asteroids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_name character varying(100) NOT NULL,
    galaxy_type character varying(100) NOT NULL,
    galaxy_size_ly integer,
    galaxy_age_millions numeric(7,2),
    galaxy_luminosity numeric(5,2),
    galaxy_distance_ly integer NOT NULL,
    galaxy_description text
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    moon_name character varying(100) NOT NULL,
    moon_orbital_time_days numeric(5,2),
    moon_description text NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    planet_name character varying(100) NOT NULL,
    planet_orbilta_time_in_years numeric(5,2),
    planet_has_water boolean NOT NULL,
    planet_number_moons integer,
    planet_has_mass_earth_masses numeric(5,2),
    planet_radius_km integer,
    planet_gravity numeric(5,2),
    planet_description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    star_name character varying(100) NOT NULL,
    star_has_planets boolean,
    star_age_in_millions numeric(7,2),
    star_spectral_type character(1),
    star_luminosity_solar_luminosity integer,
    star_radius_solar_radius numeric(6,2),
    star_temperature_kelvin integer NOT NULL,
    star_mass_solar_masses numeric(5,2),
    star_description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.asteroid OVERRIDING SYSTEM VALUE VALUES (1, 'Ceres', 'Rock/Ice', 'Dwraf Planet', 'Most massive object of main belt', '940 km');
INSERT INTO public.asteroid OVERRIDING SYSTEM VALUE VALUES (2, 'Vesta', 'Silicate', 'S', 'Second largest object of the main belt', '525 km');
INSERT INTO public.asteroid OVERRIDING SYSTEM VALUE VALUES (3, 'Pallas', 'Solicate, iron, niquel', 'B', 'Large asteroid, irregular', '512 km');
INSERT INTO public.asteroid OVERRIDING SYSTEM VALUE VALUES (4, 'Hygiea', 'Unknown', 'C', 'Can be consider a Dwarf planet', '430 km');
INSERT INTO public.asteroid OVERRIDING SYSTEM VALUE VALUES (5, 'Europa', 'Carbon', 'C', 'Dark surface', '312 km');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Milky Way', 'Spiral', 105700, 13610.00, NULL, 0, 'Mother galaxy');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'Andromeda', 'Spiral', 220000, 10000.00, NULL, 2537000, 'Andromeda galaxy is a barred spiral galaxy and is the nearest major galaxy to Milky Way');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, 'Triangulum Galaxy', 'Spiral', 61120, NULL, NULL, 2730000, 'Is the second-smallest spiral gallaxy in the Local Group after the Large Magellanic Cloud');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Large Magellanic Cloud', 'Magellanic Spiral', 32200, NULL, NULL, 163000, 'Is a dwarf galaxy and satellite of Milky Way.');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'NGC 3109', 'Magellanic Spiral', 41700, NULL, NULL, 4348000, 'Is a small barred Magellanic type spiral or irregular galaxy around 4.35 Mly away in the direction of the constellation of Hydra.');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'M32', 'Elliptical', 8000, NULL, NULL, 2490000, 'Is a dwarf "early-type" galaxy about 2,490,000 light-years (760,000 pc) from the Solar System, appearing in the constellation Andromeda. M32 is a satellite galaxy of the Andromeda Galaxy (M31) and was discovered by Guillaume Le Gentil in 1749. ');
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (7, 'Wolf–Lundmark–Melotte', 'Irregular', 8000, NULL, NULL, 3040000, 'Is a barred irregular galaxy discovered in 1909 by Max Wolf, located on the outer edges of the Local Group. The discovery of the nature of the galaxy was accredited to Knut Lundmark and Philibert Jacques Melotte in 1926. It is located in the constellation of Cetus. ');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 'moon1', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'moon2', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'moon3', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 'moon4', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'moon5', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'moon6', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 'moon7', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'moon8', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'moon9', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'moon10', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'moon11', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 'moon12', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'moon13', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 'moon14', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'moon15', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'moon16', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 'moon17', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'moon18', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'moon19', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (21, 'moon20', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (22, 'moon21', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (23, 'moon22', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (24, 'moon23', 1.00, 'Description', 11);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (25, 'moon24', 1.00, 'Description', 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'Mercury', 0.24, true, 0, 0.05, 2440, 0.38, NULL, 15);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'Venus', 0.61, false, 0, 0.81, 6052, 0.91, NULL, 15);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 'Earth', 1.00, true, 1, 1.00, 6371, 1.00, NULL, 15);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 'Mars', 1.88, true, 2, 0.10, 3390, 0.38, NULL, 15);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (13, 'Jupiter', 11.87, true, 95, 317.80, 69911, 2.53, NULL, 15);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (14, 'Saturn', 29.46, true, 146, 95.20, 58232, 1.06, NULL, 15);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (15, 'Uranus', 84.01, true, 27, 14.50, 25362, 0.89, NULL, 15);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (16, 'Neptune', 164.79, true, 16, 17.10, 24622, 1.14, NULL, 15);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (17, 'Kepler-186f', 0.33, false, 0, 1.40, 1, 0.00, NULL, 15);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (18, 'Kepler-22b', NULL, false, NULL, NULL, NULL, NULL, NULL, 15);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (19, 'Gliese 581g', NULL, false, NULL, NULL, NULL, NULL, NULL, 15);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (20, 'Proxima b', NULL, false, NULL, NULL, NULL, NULL, NULL, 15);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (21, 'TRAPPIST-1e', NULL, false, NULL, NULL, NULL, NULL, NULL, 15);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (22, 'TRAPPIST-1f', NULL, false, NULL, NULL, NULL, NULL, NULL, 15);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (23, 'HD 40307g', NULL, false, NULL, NULL, NULL, NULL, NULL, 15);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (24, '51 Pegasi b', NULL, false, NULL, NULL, NULL, NULL, NULL, 15);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (25, 'Kepler-16b', NULL, false, NULL, NULL, NULL, NULL, NULL, 15);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (26, 'WASP-12b', NULL, false, NULL, NULL, NULL, NULL, NULL, 15);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (27, 'HR 8799e', NULL, false, NULL, NULL, NULL, NULL, NULL, 15);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (28, 'Cancri 55 e', 0.73, true, 0, 8.30, 1, NULL, NULL, 15);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 'WOH G64', false, 5.00, 'B', NULL, 800.00, 4700, 28.00, 'Is a red super-gigant star located in other gallaxy', 4);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 'UY Scuti', false, NULL, NULL, 124000, 909.00, 3550, NULL, NULL, 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 'Rigel', false, 8.00, 'B', 85000, 74.00, 11500, 18.00, 'A blue super-gigant star', 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 'Betelgeuse', false, 8.00, 'M', 65000, 640.00, 3800, 14.00, NULL, 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (7, 'Antares', false, 15.00, 'M', 75000, 680.00, 3660, 13.00, NULL, 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (8, 'Sirio', false, 240.00, 'A', 25, 1.71, 9882, 2.06, NULL, 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (9, 'Vega', true, 455.00, 'A', 38, 2.50, 9830, 2.14, NULL, 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (10, 'Proxima Centauri', true, 4850.00, 'M', 0, 0.14, 3050, 0.12, NULL, 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (11, 'Eta Carinae', false, 3.00, NULL, 4600000, 240.00, 37200, 90.00, NULL, 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (12, 'Aldebarán', true, 6400.00, 'K', 439, 45.00, 3900, 1.16, NULL, 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (13, 'Deneb', false, 10.00, 'A', 100000, 210.00, 8525, 16.00, NULL, 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (14, 'Canopus', false, 25.00, 'A', 10700, 71.00, 7400, 8.50, NULL, 1);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (15, 'Sun', true, NULL, NULL, 1, 1.00, 5000, 1.00, NULL, 1);


--
-- Name: asteroids_asteroids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asteroids_asteroids_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 28, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: asteroid asteroid_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name UNIQUE (asteroid_name);


--
-- Name: asteroid asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (galaxy_name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (moon_name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (planet_name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (star_name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

