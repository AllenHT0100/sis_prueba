/********************************************I-SCP-MCN-TN-1-24/03/2016********************************************/
CREATE TABLE tn.tclientes (
  id_cliente SERIAL,
  nombre VARCHAR(50),
  nit integer
  CONSTRAINT pk_tcurso_id_curso PRIMARY KEY(id_curso)
) INHERITS (pxp.tbase)

CREATE TABLE tn.tproductos (
  id_produco SERIAL,
  producto VARCHAR(50),
  precio_unit integer,
  cantidad integer,
  id_proveedor integer,
  CONSTRAINT pk_tcurso_id_curso PRIMARY KEY(id_curso)
) INHERITS (pxp.tbase)

CREATE TABLE tn.tproveedores (
  id_proveedor SERIAL,
  proveedor VARCHAR(50),
  nit integer,
  CONSTRAINT pk_tcurso_id_curso PRIMARY KEY(id_curso)
) INHERITS (pxp.tbase)

CREATE TABLE tn.tusuarios (
  id_usuario SERIAL,
  nombre VARCHAR(50),
  loguin varchar(20),
  password VARCHAR(20),
  CONSTRAINT pk_tcurso_id_curso PRIMARY KEY(id_curso)
) INHERITS (pxp.tbase)
/********************************************F-SCP-MCN-TN-1-24/03/2016********************************************/