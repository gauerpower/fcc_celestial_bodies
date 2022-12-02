--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    name character varying(50) NOT NULL,
    comet_id integer NOT NULL,
    description text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    galaxy_type character varying(30) NOT NULL,
    distance_from_earth_in_light_years numeric(16,2),
    age_in_millions_of_years integer,
    diameter_in_kpc numeric(6,2)
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
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(8,3),
    planet_id integer,
    orbital_distance_in_km integer,
    diameter_in_km integer,
    mass_in_earth_masses numeric(6,2)
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
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(8,3),
    planet_type character varying(30) NOT NULL,
    star_id integer,
    mass_in_earth_masses numeric(8,2),
    diameter_in_km integer,
    distance_from_sun_in_au numeric(12,4)
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
    name character varying(50) NOT NULL,
    description text,
    is_spherical boolean,
    age_in_millions_of_years numeric(8,3),
    star_type character varying(30) NOT NULL,
    distance_from_earth_in_light_years numeric(12,6),
    galaxy_id integer,
    size_in_solar_radii numeric(8,2),
    mass_in_solar_masses numeric(8,2)
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES ('Halley''s Comet', 1, NULL);
INSERT INTO public.comet VALUES ('Comet Holmes', 2, NULL);
INSERT INTO public.comet VALUES ('Comet Swift-Tuttle', 3, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 'Spiral', 0.00, 12500, 27.00);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Nearest neighbor', 'Spiral', 2.50, 10010, 47.00);
INSERT INTO public.galaxy VALUES (4, 'Hercules', 'Dwarf galaxy in the Hercules constellation', 'Elliptical/Spheroid', 479000.00, NULL, 0.35);
INSERT INTO public.galaxy VALUES (5, 'Maffei 1', 'Giant galaxy in Casseopeia constellation', 'Elliptical', 14530000.00, NULL, 23.00);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Radio galaxy in the Centaurus constellation', 'Elliptical/Lenticular', 13000000.00, NULL, 18.40);
INSERT INTO public.galaxy VALUES (7, 'NeVe 1', 'Supergiant galaxy known for a major supercluster eruption', 'Elliptical', 411000000.00, NULL, 101.74);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The moon', 'Earth''s only moon', false, true, 4530.000, 1, 385000, 3474, 0.01);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Fast-orbiting, rises and sets twice a day', false, false, NULL, 4, 6000, 22, 0.00);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Small and asteroid-like', false, false, NULL, 4, 24363, 12, 0.00);
INSERT INTO public.moon VALUES (4, 'Charon', 'Forms a binary system with Pluto', false, true, NULL, 10, 19587, 1212, 0.00);
INSERT INTO public.moon VALUES (5, 'Europa', 'Smooth and possibly habitable', NULL, true, 4503.000, 5, 670900, 3012, 0.01);
INSERT INTO public.moon VALUES (7, 'Ganymede', 'Largest moon in the solar system', false, true, 4503.000, 5, 1070400, 5268, 0.03);
INSERT INTO public.moon VALUES (8, 'Callisto', 'Mercury-sized but much less dense', false, true, 4503.000, 5, 1882700, 4820, 0.02);
INSERT INTO public.moon VALUES (9, 'Titan', 'Second-largest in solar system', NULL, true, 4503.000, 6, 1221870, 5150, 0.02);
INSERT INTO public.moon VALUES (10, 'Dione', 'Dense and icy', NULL, true, 4503.000, 6, 377396, 1123, 0.00);
INSERT INTO public.moon VALUES (11, 'Enceladus', 'Icy, shiny, and volcanic', NULL, true, 4503.000, 6, 237984, 500, 0.00);
INSERT INTO public.moon VALUES (12, 'Triton', 'Large and planetlike with a retrograde orbit', NULL, true, 4503.000, 8, 354759, 2707, 0.00);
INSERT INTO public.moon VALUES (13, 'Nereid', 'Extremely irregular orbit', false, false, 4503.000, 8, 5504000, 714, 0.00);
INSERT INTO public.moon VALUES (14, 'Proteus', 'Highly cratered and misshapen', false, false, 4503.000, 8, 117647, 420, 0.00);
INSERT INTO public.moon VALUES (6, 'Io', 'Dense, dry, and volcanic', NULL, true, 4503.000, 5, 421700, 3642, 0.02);
INSERT INTO public.moon VALUES (15, 'Hyperion', 'Spongelike surface and irregular rotation', false, false, 4503.000, 6, 1481009, 270, 0.00);
INSERT INTO public.moon VALUES (16, 'Cordelia', 'Tiny and mostly unknown', false, false, NULL, 7, 49770, 20, 0.00);
INSERT INTO public.moon VALUES (17, 'Titania', 'Icy, reddish, and moderately cratered', false, true, 4503.000, 7, 435910, 21578, 0.00);
INSERT INTO public.moon VALUES (18, 'Oberon', 'Dense, icy, and impacted by craters', false, true, 4503.000, 7, 583520, 1522, 0.00);
INSERT INTO public.moon VALUES (19, 'Miranda', 'Very small for a sphere', false, true, 4503.000, 7, 129390, 480, 0.00);
INSERT INTO public.moon VALUES (20, 'Rhea', 'Very low density', false, true, 4503.000, 6, 527108, 1532, 0.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Home planet', true, true, 4543.000, 'Terrestrial', 1, 1.00, 12756, 1.0000);
INSERT INTO public.planet VALUES (2, 'Mercury', 'Small planet closest to sun', false, true, 4503.000, 'Terrestrial', 1, 0.06, 4879, 0.4000);
INSERT INTO public.planet VALUES (3, 'Venus', 'Earthlike other than poisonous atmosphere and molten surface', false, true, 4503.000, 'Terrestrial', 1, 0.82, 6052, 0.7000);
INSERT INTO public.planet VALUES (4, 'Mars', 'The red planet', NULL, true, 4603.000, 'Terrestrial', 1, 0.11, 3390, 1.5000);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest in the solar system', false, true, 4603.000, 'Gas giant', 1, 317.80, 139820, 5.2000);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Fancy rings and tons of moons', false, true, 4503.000, 'Gas giant', 1, 95.20, 106464, 9.5000);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Faint rings and a tilted axis', false, true, 4503.000, 'Ice giant', 1, 14.50, 50714, 19.2000);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Dense, cold, and windy', false, true, 4503.000, 'Ice giant', 1, 17.15, 49244, 30.1000);
INSERT INTO public.planet VALUES (9, 'Planet Nine', 'Conjectured/existence unconfirmed', false, true, 4503.000, 'Unknown', 1, 7.50, 39000, 600.0000);
INSERT INTO public.planet VALUES (10, 'Pluto', 'Icy microplanet', false, true, 4503.000, 'Terrestrial', 1, 0.18, 2377, 39.0000);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri D', 'Nearest known exoplanet', NULL, true, 4850.000, 'Terrestrial', 2, 0.25, 10332, 265613.0000);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri B', 'Possible habitable exoplanet', NULL, true, 4853.000, 'Terrestrial', 2, 1.07, 16583, 265613.0000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The sun', 'An average yellow star', true, 4600.000, 'G-type main sequence', 0.000016, 1, 1.00, 1.00);
INSERT INTO public.star VALUES (5, 'Rigel Kentaurus', 'Sunlike star in the Alpha Centauri system', true, 5000.000, 'G-type main sequence', 4.340000, 1, 1.10, 1.08);
INSERT INTO public.star VALUES (4, 'Barnard''s Star', 'Next closest star after the Centauris', true, 10000.000, 'Red dwarf', 5.960000, 1, 0.20, 0.14);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Nearest neighboring star', true, 4850.000, 'Red dwarf', 4.250000, 1, 0.15, 0.12);
INSERT INTO public.star VALUES (7, 'Toliman', 'Also a sunlike star in the Alpha Centauri system', true, 5000.000, 'K-type main sequence', 4.340000, 1, 0.86, 0.91);
INSERT INTO public.star VALUES (8, 'V354 Cephei', 'Largest known star in the galaxy', true, NULL, 'Red supergiant', 8900.000000, 1, 685.00, 3.61);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: comet comet_comet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_comet_id_key UNIQUE (comet_id);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


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
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


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
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


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
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


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

