--
-- PostgreSQL database dump
--

-- Dumped from database version 13.8
-- Dumped by pg_dump version 16.4 (Ubuntu 16.4-0ubuntu0.24.04.2)

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

--
-- Name: nycflights; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA nycflights;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: airlines; Type: TABLE; Schema: nycflights; Owner: -
--

CREATE TABLE nycflights.airlines (
    carrier text NOT NULL,
    name text
);


--
-- Name: airports; Type: TABLE; Schema: nycflights; Owner: -
--

CREATE TABLE nycflights.airports (
    faa text NOT NULL,
    name text,
    lat double precision,
    lon double precision,
    alt double precision,
    tz double precision,
    dst text,
    tzone text
);


--
-- Name: flights; Type: TABLE; Schema: nycflights; Owner: -
--

CREATE TABLE nycflights.flights (
    year integer,
    month integer,
    day integer,
    dep_time integer,
    sched_dep_time integer,
    dep_delay double precision,
    arr_time integer,
    sched_arr_time integer,
    arr_delay double precision,
    carrier text,
    flight integer,
    tailnum text,
    origin text,
    dest text,
    air_time double precision,
    distance double precision,
    hour double precision,
    minute double precision,
    time_hour timestamp with time zone
);


--
-- Name: planes; Type: TABLE; Schema: nycflights; Owner: -
--

CREATE TABLE nycflights.planes (
    tailnum text NOT NULL,
    year integer,
    type text,
    manufacturer text,
    model text,
    engines integer,
    seats integer,
    speed integer,
    engine text
);


--
-- Name: weather; Type: TABLE; Schema: nycflights; Owner: -
--

CREATE TABLE nycflights.weather (
    origin text NOT NULL,
    year integer,
    month integer,
    day integer,
    hour integer,
    temp double precision,
    dewp double precision,
    humid double precision,
    wind_dir double precision,
    wind_speed double precision,
    wind_gust double precision,
    precip double precision,
    pressure double precision,
    visib double precision,
    time_hour timestamp with time zone NOT NULL
);


--
-- Name: airlines pk_airlines; Type: CONSTRAINT; Schema: nycflights; Owner: -
--

ALTER TABLE ONLY nycflights.airlines
    ADD CONSTRAINT pk_airlines PRIMARY KEY (carrier);


--
-- Name: airports pk_airports; Type: CONSTRAINT; Schema: nycflights; Owner: -
--

ALTER TABLE ONLY nycflights.airports
    ADD CONSTRAINT pk_airports PRIMARY KEY (faa);


--
-- Name: planes pk_planes; Type: CONSTRAINT; Schema: nycflights; Owner: -
--

ALTER TABLE ONLY nycflights.planes
    ADD CONSTRAINT pk_planes PRIMARY KEY (tailnum);


--
-- Name: airports unq_airports_faa; Type: CONSTRAINT; Schema: nycflights; Owner: -
--

ALTER TABLE ONLY nycflights.airports
    ADD CONSTRAINT unq_airports_faa UNIQUE (faa);


--
-- Name: flights fk_flights_airports; Type: FK CONSTRAINT; Schema: nycflights; Owner: -
--

ALTER TABLE ONLY nycflights.flights
    ADD CONSTRAINT fk_flights_airports FOREIGN KEY (origin) REFERENCES nycflights.airports(faa);


--
-- Name: weather fk_weather_airports; Type: FK CONSTRAINT; Schema: nycflights; Owner: -
--

ALTER TABLE ONLY nycflights.weather
    ADD CONSTRAINT fk_weather_airports FOREIGN KEY (origin) REFERENCES nycflights.airports(faa);


--
-- Name: SCHEMA nycflights; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA nycflights TO schmitz;
GRANT USAGE ON SCHEMA nycflights TO enseignant;
GRANT USAGE ON SCHEMA nycflights TO etudiant;


--
-- Name: TABLE airlines; Type: ACL; Schema: nycflights; Owner: -
--

GRANT SELECT ON TABLE nycflights.airlines TO etudiant;


--
-- Name: TABLE airports; Type: ACL; Schema: nycflights; Owner: -
--

GRANT SELECT ON TABLE nycflights.airports TO etudiant;


--
-- Name: TABLE flights; Type: ACL; Schema: nycflights; Owner: -
--

GRANT SELECT ON TABLE nycflights.flights TO etudiant;


--
-- Name: TABLE planes; Type: ACL; Schema: nycflights; Owner: -
--

GRANT SELECT ON TABLE nycflights.planes TO etudiant;


--
-- Name: TABLE weather; Type: ACL; Schema: nycflights; Owner: -
--

GRANT SELECT ON TABLE nycflights.weather TO etudiant;


--
-- PostgreSQL database dump complete
--

