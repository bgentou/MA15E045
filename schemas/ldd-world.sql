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
-- Name: world; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA world;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: city; Type: TABLE; Schema: world; Owner: -
--

CREATE TABLE world.city (
    id integer NOT NULL,
    name text NOT NULL,
    countrycode character(3) NOT NULL,
    district text NOT NULL,
    population integer NOT NULL
);


--
-- Name: sex_ratio(integer); Type: FUNCTION; Schema: world; Owner: -
--

CREATE FUNCTION world.sex_ratio(p_y integer) RETURNS numeric
    LANGUAGE sql
    AS $$
    WITH R AS (
        SELECT b.sex, SUM(b."count") AS n 
        FROM babynames.bebes as b
        WHERE b."year"=p_y
        GROUP by b.sex
    )

    SELECT  
       (r1.n::float/r2.n::float)::decimal(3,2) AS sex_ratio
    FROM R r1 JOIN R r2 ON (r1.sex < r2.sex) ;
$$;


--
-- Name: country; Type: TABLE; Schema: world; Owner: -
--

CREATE TABLE world.country (
    countrycode character(3) NOT NULL,
    name_country text NOT NULL,
    continent text NOT NULL,
    region text NOT NULL,
    surfacearea real NOT NULL,
    indepyear smallint,
    population_country integer NOT NULL,
    lifeexpectancy real,
    gnp numeric(10,2),
    gnpold numeric(10,2),
    localname text NOT NULL,
    governmentform text NOT NULL,
    headofstate text,
    capital integer,
    code2 character(2) NOT NULL,
    CONSTRAINT country_continent_check CHECK (((continent = 'Asia'::text) OR (continent = 'Europe'::text) OR (continent = 'North America'::text) OR (continent = 'Africa'::text) OR (continent = 'Oceania'::text) OR (continent = 'Antarctica'::text) OR (continent = 'South America'::text)))
);


--
-- Name: countrylanguage; Type: TABLE; Schema: world; Owner: -
--

CREATE TABLE world.countrylanguage (
    countrycode character(3) NOT NULL,
    language text NOT NULL,
    isofficial boolean NOT NULL,
    percentage real NOT NULL
);


--
-- Name: ricchi_e_poveri; Type: VIEW; Schema: world; Owner: -
--

CREATE VIEW world.ricchi_e_poveri AS
 WITH gnppercapita AS (
         SELECT country.region,
            country.name_country,
            (country.gnp / (country.population_country)::numeric) AS gnp_per_capita
           FROM world.country
          WHERE ((country.population_country > 0) AND (country.gnp IS NOT NULL))
        )
 SELECT g1.region,
    min(g1.gnp_per_capita) AS min_gnp_cap,
    ( SELECT g2.name_country
           FROM gnppercapita g2
          WHERE (g2.region = g1.region)
          ORDER BY g2.gnp_per_capita
         LIMIT 1) AS poorest_country_name,
    max(g1.gnp_per_capita) AS max_gnp_per_cap,
    ( SELECT g2.name_country
           FROM gnppercapita g2
          WHERE (g2.region = g1.region)
          ORDER BY g2.gnp_per_capita DESC
         LIMIT 1) AS richest_country_name
   FROM gnppercapita g1
  GROUP BY g1.region;


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: world; Owner: -
--

ALTER TABLE ONLY world.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: world; Owner: -
--

ALTER TABLE ONLY world.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (countrycode);


--
-- Name: countrylanguage countrylanguage_pkey; Type: CONSTRAINT; Schema: world; Owner: -
--

ALTER TABLE ONLY world.countrylanguage
    ADD CONSTRAINT countrylanguage_pkey PRIMARY KEY (countrycode, language);


--
-- Name: city city_country_fk; Type: FK CONSTRAINT; Schema: world; Owner: -
--

ALTER TABLE ONLY world.city
    ADD CONSTRAINT city_country_fk FOREIGN KEY (countrycode) REFERENCES world.country(countrycode) ON UPDATE CASCADE ON DELETE SET NULL DEFERRABLE;


--
-- Name: country country_capital_fkey; Type: FK CONSTRAINT; Schema: world; Owner: -
--

ALTER TABLE ONLY world.country
    ADD CONSTRAINT country_capital_fkey FOREIGN KEY (capital) REFERENCES world.city(id);


--
-- Name: countrylanguage countrylanguage_countrycode_fkey; Type: FK CONSTRAINT; Schema: world; Owner: -
--

ALTER TABLE ONLY world.countrylanguage
    ADD CONSTRAINT countrylanguage_countrycode_fkey FOREIGN KEY (countrycode) REFERENCES world.country(countrycode);


--
-- Name: SCHEMA world; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA world TO schmitz;
GRANT USAGE ON SCHEMA world TO enseignant;
GRANT USAGE ON SCHEMA world TO etudiant;


--
-- Name: TABLE city; Type: ACL; Schema: world; Owner: -
--

GRANT SELECT ON TABLE world.city TO etudiant;


--
-- Name: TABLE country; Type: ACL; Schema: world; Owner: -
--

GRANT SELECT ON TABLE world.country TO etudiant;


--
-- Name: TABLE countrylanguage; Type: ACL; Schema: world; Owner: -
--

GRANT SELECT ON TABLE world.countrylanguage TO etudiant;


--
-- PostgreSQL database dump complete
--

