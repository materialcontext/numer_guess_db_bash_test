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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: user_records; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_records (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.user_records OWNER TO freecodecamp;

--
-- Data for Name: user_records; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_records VALUES ('user_1677209136256', 1, 352);
INSERT INTO public.user_records VALUES ('user_1677209136255', 1, 631);
INSERT INTO public.user_records VALUES ('Richard', 2, 10);
INSERT INTO public.user_records VALUES ('user_1677210214039', 2, 33);
INSERT INTO public.user_records VALUES ('user_1677210214040', 5, 1);
INSERT INTO public.user_records VALUES ('James', 1, 11);
INSERT INTO public.user_records VALUES ('user_1677210483889', 2, 2);
INSERT INTO public.user_records VALUES ('user_1677210483890', 5, 1);


--
-- Name: user_records user_records_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_records
    ADD CONSTRAINT user_records_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

