
CREATE TABLE AEROPUERTO
(
	ciudad               VARCHAR2(20) NOT NULL ,
	operador             VARCHAR2(20) NULL ,
	entidadFederativa    VARCHAR2(20) NULL ,
	modelo               VARCHAR2(20) NOT NULL ,
	idAvion              NUMBER(4,2) NOT NULL ,
	numTra               NUMBER(4,2) NOT NULL 
);



CREATE UNIQUE INDEX XPKAEROPUERTO ON AEROPUERTO
(ciudad   ASC,modelo   ASC,idAvion   ASC,numTra   ASC);



ALTER TABLE AEROPUERTO
	ADD CONSTRAINT  XPKAEROPUERTO PRIMARY KEY (ciudad,modelo,idAvion,numTra);



CREATE TABLE AVION
(
	modelo               VARCHAR2(20) NOT NULL ,
	marca                CHAR(18) NULL ,
	horaVuelo            NUMBER(4,2) NULL ,
	disponibilidad       VARCHAR2(20) NULL ,
	idAvion              NUMBER(4,2) NOT NULL ,
	numTra               NUMBER(4,2) NOT NULL 
);



CREATE UNIQUE INDEX XPKAVION ON AVION
(modelo   ASC,idAvion   ASC,numTra   ASC);



ALTER TABLE AVION
	ADD CONSTRAINT  XPKAVION PRIMARY KEY (modelo,idAvion,numTra);



CREATE TABLE DIRPILOTO
(
	col                  VARCHAR2(20) NULL ,
	c.p.                 NUMBER(4,2) NULL ,
	numDir               NUMBER(4,2) NULL ,
	numTra               NUMBER(4,2) NOT NULL 
);



CREATE UNIQUE INDEX XPKDIRPILOTO ON DIRPILOTO
(numTra   ASC);



ALTER TABLE DIRPILOTO
	ADD CONSTRAINT  XPKDIRPILOTO PRIMARY KEY (numTra);



CREATE TABLE F_VUELOPROG
(
	horaLlegada          DATE NULL ,
	horaSalida           DATE NULL ,
	codVuelo             CHAR(18) NOT NULL ,
	idAvion              NUMBER(4,2) NOT NULL ,
	numTra               NUMBER(4,2) NOT NULL 
);



CREATE UNIQUE INDEX XPKF_VUELO_PROG ON F_VUELOPROG
(codVuelo   ASC,idAvion   ASC,numTra   ASC);



ALTER TABLE F_VUELOPROG
	ADD CONSTRAINT  XPKF_VUELO_PROG PRIMARY KEY (codVuelo,idAvion,numTra);



CREATE TABLE HIJO
(
	numHijo              NUMBER(4,2) NOT NULL ,
	fechaNacimineto      DATE NULL ,
	numTra               NUMBER(4,2) NULL 
);



CREATE UNIQUE INDEX XPKnumHijo ON HIJO
(numHijo   ASC);



ALTER TABLE HIJO
	ADD CONSTRAINT  XPKnumHijo PRIMARY KEY (numHijo);



CREATE TABLE NOMPILOTO
(
	nomPila              VARCHAR2(20) NULL ,
	nomMat               VARCHAR2(20) NULL ,
	nomPat               VARCHAR2(20) NULL ,
	numTra               NUMBER(4,2) NOT NULL 
);



CREATE UNIQUE INDEX XPKNOMPILOTO ON NOMPILOTO
(numTra   ASC);



ALTER TABLE NOMPILOTO
	ADD CONSTRAINT  XPKNOMPILOTO PRIMARY KEY (numTra);



CREATE TABLE NUMA_AVION
(
	vertical             NUMBER(4,2) NULL ,
	horizontal           NUMBER(4,2) NULL ,
	total                NUMBER(4,2) NULL ,
	modelo               VARCHAR2(20) NOT NULL ,
	idAvion              NUMBER(4,2) NOT NULL ,
	numTra               NUMBER(4,2) NOT NULL 
);



CREATE UNIQUE INDEX XPKNUMASIENTOAVION ON NUMA_AVION
(modelo   ASC,idAvion   ASC,numTra   ASC);



ALTER TABLE NUMA_AVION
	ADD CONSTRAINT  XPKNUMASIENTOAVION PRIMARY KEY (modelo,idAvion,numTra);



CREATE TABLE PILOTO
(
	numTra               NUMBER(4,2) NOT NULL ,
	rfc                  VARCHAR2(20) NULL ,
	sexo                 CHAR(18) NULL ,
	estadoCivil          CHAR(18) NULL ,
	estado               CHAR(18) NULL ,
	curp                 VARCHAR2(20) NULL 
);



CREATE UNIQUE INDEX XPKPILOTO ON PILOTO
(numTra   ASC);



ALTER TABLE PILOTO
	ADD CONSTRAINT  XPKPILOTO PRIMARY KEY (numTra);



CREATE TABLE PILOTOTEL
(
	telefono             NUMBER(4,2) NOT NULL ,
	numTra               NUMBER(4,2) NOT NULL 
);



CREATE UNIQUE INDEX XPKPILOTOTEL ON PILOTOTEL
(telefono   ASC,numTra   ASC);



ALTER TABLE PILOTOTEL
	ADD CONSTRAINT  XPKPILOTOTEL PRIMARY KEY (telefono,numTra);



CREATE TABLE PUERTA_VUELOPROG
(
	horaSal              DATE NULL ,
	horalleg             DATE NULL ,
	codVuelo             CHAR(18) NOT NULL ,
	idAvion              NUMBER(4,2) NOT NULL ,
	numTra               NUMBER(4,2) NOT NULL 
);



CREATE UNIQUE INDEX XPKPUERTA_VUELOPROG ON PUERTA_VUELOPROG
(codVuelo   ASC,idAvion   ASC,numTra   ASC);



ALTER TABLE PUERTA_VUELOPROG
	ADD CONSTRAINT  XPKPUERTA_VUELOPROG PRIMARY KEY (codVuelo,idAvion,numTra);



CREATE TABLE TERM_VUELOPROG
(
	llegada              DATE NULL ,
	salida               DATE NULL ,
	codVuelo             CHAR(18) NOT NULL ,
	idAvion              NUMBER(4,2) NOT NULL ,
	numTra               NUMBER(4,2) NOT NULL 
);



CREATE UNIQUE INDEX XPKTERM_VUELOPROG ON TERM_VUELOPROG
(codVuelo   ASC,idAvion   ASC,numTra   ASC);



ALTER TABLE TERM_VUELOPROG
	ADD CONSTRAINT  XPKTERM_VUELOPROG PRIMARY KEY (codVuelo,idAvion,numTra);



CREATE TABLE VUELO
(
	idAvion              NUMBER(4,2) NOT NULL ,
	piloOp               CHAR(18) NULL ,
	numPas               NUMBER(4,2) NULL ,
	copiloto             VARCHAR2(20) NULL ,
	numTra               NUMBER(4,2) NOT NULL 
);



CREATE UNIQUE INDEX XPKVUELO ON VUELO
(idAvion   ASC,numTra   ASC);



ALTER TABLE VUELO
	ADD CONSTRAINT  XPKVUELO PRIMARY KEY (idAvion,numTra);



CREATE TABLE VUELOPROGRAMADO
(
	codigoProg           VARCHAR2(20) NULL ,
	destino              VARCHAR2(20) NULL ,
	duracionVuelo        NUMBER(4,2) NULL ,
	origen               VARCHAR2(20) NULL ,
	distancia            NUMBER(4,2) NULL ,
	combustible          NUMBER(4,2) NULL ,
	tiempoReal           NUMBER(4,2) NULL ,
	codVuelo             CHAR(18) NOT NULL ,
	idAvion              NUMBER(4,2) NOT NULL ,
	numTra               NUMBER(4,2) NOT NULL 
);



CREATE UNIQUE INDEX XPKVUELOPROGRAMADO ON VUELOPROGRAMADO
(codVuelo   ASC,numTra   ASC,idAvion   ASC);



ALTER TABLE VUELOPROGRAMADO
	ADD CONSTRAINT  XPKVUELOPROGRAMADO PRIMARY KEY (codVuelo,numTra,idAvion);



ALTER TABLE AEROPUERTO
	ADD (CONSTRAINT R_9 FOREIGN KEY (modelo, idAvion, numTra) REFERENCES AVION (modelo, idAvion, numTra));



ALTER TABLE AVION
	ADD (CONSTRAINT R_8 FOREIGN KEY (idAvion, numTra) REFERENCES VUELO (idAvion, numTra));



ALTER TABLE DIRPILOTO
	ADD (CONSTRAINT R_2 FOREIGN KEY (numTra) REFERENCES PILOTO (numTra));



ALTER TABLE F_VUELOPROG
	ADD (CONSTRAINT R_14 FOREIGN KEY (codVuelo, numTra, idAvion) REFERENCES VUELOPROGRAMADO (codVuelo, numTra, idAvion));



ALTER TABLE HIJO
	ADD (CONSTRAINT R_4 FOREIGN KEY (numTra) REFERENCES PILOTO (numTra) ON DELETE SET NULL);



ALTER TABLE NOMPILOTO
	ADD (CONSTRAINT R_1 FOREIGN KEY (numTra) REFERENCES PILOTO (numTra));



ALTER TABLE NUMA_AVION
	ADD (CONSTRAINT R_12 FOREIGN KEY (modelo, idAvion, numTra) REFERENCES AVION (modelo, idAvion, numTra));



ALTER TABLE PILOTOTEL
	ADD (CONSTRAINT R_7 FOREIGN KEY (numTra) REFERENCES PILOTO (numTra));



ALTER TABLE PUERTA_VUELOPROG
	ADD (CONSTRAINT R_15 FOREIGN KEY (codVuelo, numTra, idAvion) REFERENCES VUELOPROGRAMADO (codVuelo, numTra, idAvion));



ALTER TABLE TERM_VUELOPROG
	ADD (CONSTRAINT R_13 FOREIGN KEY (codVuelo, numTra, idAvion) REFERENCES VUELOPROGRAMADO (codVuelo, numTra, idAvion));



ALTER TABLE VUELO
	ADD (CONSTRAINT R_5 FOREIGN KEY (numTra) REFERENCES PILOTO (numTra));



ALTER TABLE VUELOPROGRAMADO
	ADD (CONSTRAINT R_10 FOREIGN KEY (idAvion, numTra) REFERENCES VUELO (idAvion, numTra));



ALTER TABLE VUELOPROGRAMADO
	ADD (CONSTRAINT R_11 FOREIGN KEY (numTra) REFERENCES PILOTO (numTra));


