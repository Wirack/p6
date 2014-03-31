

--
-- Table structure for table danishMovies
--

DROP TABLE IF EXISTS danishMovies;

CREATE TABLE danishMovies (
  title varchar(500) DEFAULT NULL,
  year INTEGER DEFAULT NULL,
  director varchar(500) DEFAULT NULL,
  imdbVotes INTEGER DEFAULT NULL,
  imdbRank float DEFAULT NULL
);

--
-- Table structure for table movie
--

DROP TABLE IF EXISTS movie;
CREATE TABLE movie (
  id INTEGER NOT NULL,
  title varchar(500) DEFAULT NULL,
  year INTEGER DEFAULT NULL,
  color varchar(15) DEFAULT NULL,
  country varchar(50) DEFAULT NULL,
  language varchar(50) DEFAULT NULL,
  distrVotes varchar(10) DEFAULT NULL,
  imdbVotes INTEGER DEFAULT NULL,
  imdbRank float DEFAULT NULL,
  releaseDate date DEFAULT NULL,
  PRIMARY KEY (id)
) ;--ENGINE=InnoDB DEFAULT CHARSET=latin1;
  CREATE INDEX idx4 ON movie (id)
  CREATE INDEX idx9 ON movie (title, id)

  
  
  
--
-- Table structure for table genre
--

DROP TABLE IF EXISTS genre;
CREATE TABLE genre (
  movieId INTEGER DEFAULT NULL,
  genre varchar(50) DEFAULT NULL
);
  CREATE INDEX idx5 ON genre (movieId, genre);
  CREATE INDEX idx6 ON genre (genre, movieId);
  
--
-- Table structure for table involved
--

DROP TABLE IF EXISTS involved;
CREATE TABLE involved (
  personId INTEGER DEFAULT NULL,
  movieId INTEGER DEFAULT NULL,
  role varchar(50) DEFAULT NULL
) ;

--
-- Table structure for table movieref
--

DROP TABLE IF EXISTS movieref;
CREATE TABLE movieref (
  fromId INTEGER DEFAULT NULL,
  toId INTEGER DEFAULT NULL
) ;

CREATE INDEX idx7 ON movieref (fromId, toId);
CREATE INDEX idx8 ON movieref (toId, fromId);


--
-- Table structure for table person
--

DROP TABLE IF EXISTS person;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE person (
  id INTEGER NOT NULL,
  name varchar(500) DEFAULT NULL,
  gender char(1) DEFAULT NULL,
  birthdate date DEFAULT NULL,
  deathdate date DEFAULT NULL,
  height INTEGER DEFAULT NULL,
  PRIMARY KEY (id)
) ;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE INDEX idx3 ON person (id);
CREATE INDEX idx10 ON person (name, id);

--
-- Table structure for table popular
--

DROP TABLE IF EXISTS popular;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE popular (
  id INTEGER NOT NULL,
  title varchar(500) DEFAULT NULL,
  year INTEGER DEFAULT NULL
) --ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table ratings
--

DROP TABLE IF EXISTS ratings;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE ratings (
  "user" varchar(20) DEFAULT NULL,
  movieId INTEGER DEFAULT NULL,
  rating INTEGER DEFAULT NULL
)
/*!40101 SET character_set_client = @saved_cs_client */;


SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;


