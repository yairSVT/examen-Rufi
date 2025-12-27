--***** se crea la base de datos: *********

CREATE DATABASE "Creditos"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Mexico.1252'
    LC_CTYPE = 'Spanish_Mexico.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	--********************** tablas necesarias ********* 

CREATE TABLE IF NOT EXISTS public."datosCliente"
(
    "idCliente" integer NOT NULL DEFAULT nextval('"datosCliente_idCliente_seq"'::regclass),
    "ingresosMensuales" double precision,
    "idPersona" integer NOT NULL DEFAULT nextval('"datosCliente_idPersona_seq"'::regclass),
    CONSTRAINT "datosCliente_pkey" PRIMARY KEY ("idCliente"),
    CONSTRAINT fk_persona_cliente FOREIGN KEY ("idPersona")
        REFERENCES public.persona ("idPersona") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."datosCliente"
    OWNER to postgres;
	
	
	
	CREATE TABLE IF NOT EXISTS public."datosCredito"
(
    "idCredito" integer NOT NULL,
    "montoCredito" double precision NOT NULL DEFAULT 0,
    "fechaEntrega" timestamp without time zone,
    "idFrecuenciaPagos" integer NOT NULL,
    "idEstatusCredito" integer NOT NULL,
    "idCliente" integer NOT NULL,
    CONSTRAINT "datosCredito_pkey" PRIMARY KEY ("idCredito"),
    CONSTRAINT fk_cliente_credito FOREIGN KEY ("idCliente")
        REFERENCES public."datosCliente" ("idCliente") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "fk_datosCredito_frecuencaPagos" FOREIGN KEY ("idFrecuenciaPagos")
        REFERENCES public."frecuenciaPagos" ("idFrecuenciaPagos") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fk_estatus_credito FOREIGN KEY ("idEstatusCredito")
        REFERENCES public."estatusCredito" ("idEstatusCredito") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."datosCredito"
    OWNER to postgres;
	
	
	CREATE TABLE IF NOT EXISTS public."datosUsuario"
(
    "idDatosUsuario" integer NOT NULL DEFAULT nextval('"datosUsuario_idDatosUsuario_seq"'::regclass),
    "fechaIngreso" timestamp without time zone,
    "idPersona" integer NOT NULL DEFAULT nextval('"datosUsuario_idPersona_seq"'::regclass),
    usuario text COLLATE pg_catalog."default" NOT NULL,
    contrasena text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "datosUsuario_pkey" PRIMARY KEY ("idDatosUsuario"),
    CONSTRAINT pk_usuarios_personas FOREIGN KEY ("idPersona")
        REFERENCES public.persona ("idPersona") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."datosUsuario"
    OWNER to postgres;
	
	
	CREATE TABLE IF NOT EXISTS public."datosUsuario"
(
    "idDatosUsuario" integer NOT NULL DEFAULT nextval('"datosUsuario_idDatosUsuario_seq"'::regclass),
    "fechaIngreso" timestamp without time zone,
    "idPersona" integer NOT NULL DEFAULT nextval('"datosUsuario_idPersona_seq"'::regclass),
    usuario text COLLATE pg_catalog."default" NOT NULL,
    contrasena text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "datosUsuario_pkey" PRIMARY KEY ("idDatosUsuario"),
    CONSTRAINT pk_usuarios_personas FOREIGN KEY ("idPersona")
        REFERENCES public.persona ("idPersona") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."datosUsuario"
    OWNER to postgres;
	
	
	CREATE TABLE IF NOT EXISTS public."frecuenciaPagos"
(
    "idFrecuenciaPagos" numeric NOT NULL,
    descripcion text COLLATE pg_catalog."default",
    frecuencia text COLLATE pg_catalog."default",
    "fechaCreacion" timestamp without time zone,
    CONSTRAINT "frecuenciaPagos_pkey" PRIMARY KEY ("idFrecuenciaPagos")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."frecuenciaPagos"
    OWNER to postgres;
	
	
	CREATE TABLE IF NOT EXISTS public.persona
(
    "idPersona" integer NOT NULL DEFAULT nextval('"Persona_idPersona_seq"'::regclass),
    nombre text COLLATE pg_catalog."default" NOT NULL,
    "apellidoPaterno" text COLLATE pg_catalog."default",
    "apellidoMaterno" text COLLATE pg_catalog."default",
    "fechaNacimiento" timestamp without time zone NOT NULL,
    CONSTRAINT "Persona_pkey" PRIMARY KEY ("idPersona")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.persona
    OWNER to postgres;
	
	
	
	
	--***************insert ****************
	INSERT INTO public.persona(
	"idPersona", nombre, "apellidoPaterno", "apellidoMaterno", "fechaNacimiento")
	VALUES (1, Yair, Tadeo, Santamaria, '1989-08-21');
	
	INSERT INTO public."frecuenciaPagos"(
	"idFrecuenciaPagos", descripcion, frecuencia, "fechaCreacion")
	VALUES (1, 'pagosContinuos', 'Semanal', current_timestamp);
	
	INSERT INTO public."frecuenciaPagos"(
	"idFrecuenciaPagos", descripcion, frecuencia, "fechaCreacion")
	VALUES (2, 'pagosContinuos', 'Quincenal', current_timestamp);
	
	INSERT INTO public."frecuenciaPagos"(
	"idFrecuenciaPagos", descripcion, frecuencia, "fechaCreacion")
	VALUES (3, 'pagosContinuos', 'Mensual', current_timestamp);
	
	INSERT INTO public."datosUsuario"(
	"idDatosUsuario", "fechaIngreso", "idPersona", usuario, contrasena)
	VALUES (1, current_timestamp, 1, 'yair@correo.com', '1234');
	
	INSERT INTO public."estatusCredito"(
	"idEstatusCredito", descripcion, "fechaAlta")
	VALUES (1, 'Pendiente de pago', current_timestamp);
	
	INSERT INTO public."datosCredito"(
	"idCredito", "montoCredito", "fechaEntrega", "idFrecuenciaPagos", "idEstatusCredito","idCliente")
	VALUES (1, '45000', current_timestamp, 1, 1,1);
	
		INSERT INTO public."datosCredito"(
	"idCredito", "montoCredito", "fechaEntrega", "idFrecuenciaPagos", "idEstatusCredito","idCliente")
	VALUES (2, '5000', current_timestamp, 1, 2,1);
	
	INSERT INTO public."datosCliente"(
	"idCliente", "ingresosMensuales", "idPersona")
	VALUES (1, '20000', 1);
	
	
	