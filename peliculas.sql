-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 1.0.3
-- PostgreSQL version: 15.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: "PELICULAS" | type: DATABASE --
-- DROP DATABASE IF EXISTS "PELICULAS";
CREATE DATABASE "PELICULAS"
	TABLESPACE = pg_global;
-- ddl-end --


-- object: public."ACTOR" | type: TABLE --
-- DROP TABLE IF EXISTS public."ACTOR" CASCADE;
CREATE TABLE public."ACTOR" (
	"RFCactor" varchar(13) NOT NULL,
	honorario money NOT NULL,
	sexo varchar(1) NOT NULL,
	nacionalidad varchar(40) NOT NULL,
	"nombrePila" varchar(60) NOT NULL,
	"apellidoP" varchar(40) NOT NULL,
	"apellidoM" varchar(40),
	"fechaN" date NOT NULL,
	CONSTRAINT "ACTOR_pk" PRIMARY KEY ("RFCactor")
);
-- ddl-end --
ALTER TABLE public."ACTOR" OWNER TO postgres;
-- ddl-end --

-- object: public."PELICULA" | type: TABLE --
-- DROP TABLE IF EXISTS public."PELICULA" CASCADE;
CREATE TABLE public."PELICULA" (
	"IDpelicula" smallint NOT NULL,
	clasificacion varchar(20) NOT NULL,
	titulo varchar(60) NOT NULL,
	genero varchar(60) NOT NULL,
	CONSTRAINT "PELICULA_pk" PRIMARY KEY ("IDpelicula")
);
-- ddl-end --
ALTER TABLE public."PELICULA" OWNER TO postgres;
-- ddl-end --

-- object: public."many_PELICULA_has_many_ACTOR" | type: TABLE --
-- DROP TABLE IF EXISTS public."many_PELICULA_has_many_ACTOR" CASCADE;
CREATE TABLE public."many_PELICULA_has_many_ACTOR" (
	"IDpelicula_PELICULA" smallint NOT NULL,
	"RFCactor_ACTOR" varchar(13) NOT NULL,
	"actorPrincipal" varchar(120) NOT NULL,
	CONSTRAINT "many_PELICULA_has_many_ACTOR_pk" PRIMARY KEY ("IDpelicula_PELICULA","RFCactor_ACTOR")
);
-- ddl-end --

-- object: "PELICULA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_PELICULA_has_many_ACTOR" DROP CONSTRAINT IF EXISTS "PELICULA_fk" CASCADE;
ALTER TABLE public."many_PELICULA_has_many_ACTOR" ADD CONSTRAINT "PELICULA_fk" FOREIGN KEY ("IDpelicula_PELICULA")
REFERENCES public."PELICULA" ("IDpelicula") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "ACTOR_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_PELICULA_has_many_ACTOR" DROP CONSTRAINT IF EXISTS "ACTOR_fk" CASCADE;
ALTER TABLE public."many_PELICULA_has_many_ACTOR" ADD CONSTRAINT "ACTOR_fk" FOREIGN KEY ("RFCactor_ACTOR")
REFERENCES public."ACTOR" ("RFCactor") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."DIRECTOR" | type: TABLE --
-- DROP TABLE IF EXISTS public."DIRECTOR" CASCADE;
CREATE TABLE public."DIRECTOR" (
	"RFCdirector" varchar(13) NOT NULL,
	"nombrePila" varchar(60) NOT NULL,
	"apellidoP" varchar(40) NOT NULL,
	"apellidoM" varchar(40),
	"paisOrigen" varchar(60) NOT NULL,
	CONSTRAINT "DIRECTOR_pk" PRIMARY KEY ("RFCdirector")
);
-- ddl-end --
ALTER TABLE public."DIRECTOR" OWNER TO postgres;
-- ddl-end --

-- object: public."SALA" | type: TABLE --
-- DROP TABLE IF EXISTS public."SALA" CASCADE;
CREATE TABLE public."SALA" (
	"IDsala" smallint NOT NULL,
	nombre varchar(60) NOT NULL,
	calle varchar(40) NOT NULL,
	numero smallint NOT NULL,
	"CP" smallint NOT NULL,
	CONSTRAINT "SALA_pk" PRIMARY KEY ("IDsala")
);
-- ddl-end --
ALTER TABLE public."SALA" OWNER TO postgres;
-- ddl-end --

-- object: public."PRODUCTORA" | type: TABLE --
-- DROP TABLE IF EXISTS public."PRODUCTORA" CASCADE;
CREATE TABLE public."PRODUCTORA" (
	"IDproductora" smallint NOT NULL,
	"razonSocial" varchar(80) NOT NULL,
	"fechaFundacion" date NOT NULL,
	CONSTRAINT "PRODUCTORA_pk" PRIMARY KEY ("IDproductora")
);
-- ddl-end --
ALTER TABLE public."PRODUCTORA" OWNER TO postgres;
-- ddl-end --

-- object: public."many_PRODUCTORA_has_many_PELICULA" | type: TABLE --
-- DROP TABLE IF EXISTS public."many_PRODUCTORA_has_many_PELICULA" CASCADE;
CREATE TABLE public."many_PRODUCTORA_has_many_PELICULA" (
	"IDproductora_PRODUCTORA" smallint NOT NULL,
	"IDpelicula_PELICULA" smallint NOT NULL,
	CONSTRAINT "many_PRODUCTORA_has_many_PELICULA_pk" PRIMARY KEY ("IDproductora_PRODUCTORA","IDpelicula_PELICULA")
);
-- ddl-end --

-- object: "PRODUCTORA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_PRODUCTORA_has_many_PELICULA" DROP CONSTRAINT IF EXISTS "PRODUCTORA_fk" CASCADE;
ALTER TABLE public."many_PRODUCTORA_has_many_PELICULA" ADD CONSTRAINT "PRODUCTORA_fk" FOREIGN KEY ("IDproductora_PRODUCTORA")
REFERENCES public."PRODUCTORA" ("IDproductora") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "PELICULA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_PRODUCTORA_has_many_PELICULA" DROP CONSTRAINT IF EXISTS "PELICULA_fk" CASCADE;
ALTER TABLE public."many_PRODUCTORA_has_many_PELICULA" ADD CONSTRAINT "PELICULA_fk" FOREIGN KEY ("IDpelicula_PELICULA")
REFERENCES public."PELICULA" ("IDpelicula") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."many_DIRECTOR_has_many_PELICULA" | type: TABLE --
-- DROP TABLE IF EXISTS public."many_DIRECTOR_has_many_PELICULA" CASCADE;
CREATE TABLE public."many_DIRECTOR_has_many_PELICULA" (
	"RFCdirector_DIRECTOR" varchar(13) NOT NULL,
	"IDpelicula_PELICULA" smallint NOT NULL,
	"directorPrincipal" smallint,
	CONSTRAINT "many_DIRECTOR_has_many_PELICULA_pk" PRIMARY KEY ("RFCdirector_DIRECTOR","IDpelicula_PELICULA")
);
-- ddl-end --

-- object: "DIRECTOR_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_DIRECTOR_has_many_PELICULA" DROP CONSTRAINT IF EXISTS "DIRECTOR_fk" CASCADE;
ALTER TABLE public."many_DIRECTOR_has_many_PELICULA" ADD CONSTRAINT "DIRECTOR_fk" FOREIGN KEY ("RFCdirector_DIRECTOR")
REFERENCES public."DIRECTOR" ("RFCdirector") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "PELICULA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_DIRECTOR_has_many_PELICULA" DROP CONSTRAINT IF EXISTS "PELICULA_fk" CASCADE;
ALTER TABLE public."many_DIRECTOR_has_many_PELICULA" ADD CONSTRAINT "PELICULA_fk" FOREIGN KEY ("IDpelicula_PELICULA")
REFERENCES public."PELICULA" ("IDpelicula") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."many_SALA_has_many_PELICULA" | type: TABLE --
-- DROP TABLE IF EXISTS public."many_SALA_has_many_PELICULA" CASCADE;
CREATE TABLE public."many_SALA_has_many_PELICULA" (
	"IDsala_SALA" smallint NOT NULL,
	"IDpelicula_PELICULA" smallint NOT NULL,
	CONSTRAINT "many_SALA_has_many_PELICULA_pk" PRIMARY KEY ("IDsala_SALA","IDpelicula_PELICULA")
);
-- ddl-end --

-- object: "SALA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_SALA_has_many_PELICULA" DROP CONSTRAINT IF EXISTS "SALA_fk" CASCADE;
ALTER TABLE public."many_SALA_has_many_PELICULA" ADD CONSTRAINT "SALA_fk" FOREIGN KEY ("IDsala_SALA")
REFERENCES public."SALA" ("IDsala") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "PELICULA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_SALA_has_many_PELICULA" DROP CONSTRAINT IF EXISTS "PELICULA_fk" CASCADE;
ALTER TABLE public."many_SALA_has_many_PELICULA" ADD CONSTRAINT "PELICULA_fk" FOREIGN KEY ("IDpelicula_PELICULA")
REFERENCES public."PELICULA" ("IDpelicula") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


