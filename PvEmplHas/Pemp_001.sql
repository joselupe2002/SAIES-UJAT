--**************-----------**************--**************-----------**************--**************-----------**************
connect SHAKE/SHAKE@BD;

INSERT INTO SREFDESC(REFD_CAMPO, REFD_SCRIPT, REFD_SQL)
 VALUES('CVEMUNI','Pemp_001','SELECT
 MUNI_CVEMUNI AS CveMuni,
 MUNI_DESCRIP AS Municipio,
 MUNI_CVEESTA AS Cve_Esta,
 ESTA_DESCRIP As Estado
FROM PMUNICIPIO, PESTADOS
WHERE Esta_CveEsta = Muni_CveESta');

COMMIT;

--**************-----------**************--**************-----------**************--**************-----------**************


connect personal/personal@BD;

ALTER TABLE PATREMPL ADD ATRE_IMPRESA VARCHAR2(1) DEFAULT 'N' ;
ALTER TABLE PATREMPL ADD ATRE_FNACI  DATE ;
ALTER TABLE PATREMPL ADD ATRE_FINGRESO DATE ;
ALTER TABLE PATREMPL ADD ATRE_ESCOL VARCHAR2(2) ;
ALTER TABLE PATREMPL ADD ATRE_EDOCIV VARCHAR2(1) DEFAULT 'O' ;
ALTER TABLE PATREMPL ADD ATRE_PROMEP VARCHAR2(1) DEFAULT 'N' ;
ALTER TABLE PATREMPL ADD ATRE_EXPED VARCHAR2(1) DEFAULT 'N' ;
ALTER TABLE PATREMPL ADD ATRE_DESCRIP VARCHAR2(100);
ALTER TABLE PATREMPL ADD ATRE_ABREVIA VARCHAR2(10) DEFAULT 'C.';
ALTER TABLE PATREMPL ADD ATRE_CURP VARCHAR2(18) ;
ALTER TABLE PATREMPL ADD ATRE_NUMSS VARCHAR2(11) ;
ALTER TABLE PATREMPL ADD ATRE_BANCOD VARCHAR2(2);
ALTER TABLE PATREMPL ADD ATRE_URES_C VARCHAR2(12);
ALTER TABLE PATREMPL ADD ATRE_FINGRESOD DATE;

ALTER TABLE PATREMPL ADD ATRE_FHINGRESOD DATE;
ALTER TABLE PATREMPL ADD ATRE_FHINGRESO DATE;

ALTER TABLE PATREMPL ADD ATRE_FJUBILA DATE;
ALTER TABLE PATREMPL ADD ATRE_FJUBILAD DATE;


ALTER TABLE PATREMPL ADD ATRE_HONORARIOA VARCHAR2(1) DEFAULT 'N' ;
ALTER TABLE PATREMPL ADD ATRE_LISRAYA VARCHAR2(1) DEFAULT 'N' ;
ALTER TABLE PATREMPL ADD ATRE_RECIBOFOL VARCHAR2(1) DEFAULT 'N' ;
ALTER TABLE PATREMPL ADD ATRE_CALCISR VARCHAR2(1) DEFAULT 'N' ;
ALTER TABLE PATREMPL ADD ATRE_AGUINALDO VARCHAR2(1) DEFAULT 'N' ;
ALTER TABLE PATREMPL ADD ATRE_PRIMAVAC VARCHAR2(1) DEFAULT 'N' ;
ALTER TABLE PATREMPL ADD ATRE_DIAS31 VARCHAR2(1) DEFAULT 'N' ;
ALTER TABLE PATREMPL ADD ATRE_BONONAV VARCHAR2(1) DEFAULT 'N' ;
ALTER TABLE PATREMPL ADD ATRE_SERVMED VARCHAR2(1) DEFAULT 'N' ;

ALTER TABLE PATREMPL ADD ATRE_DIASAGUI NUMBER(2);


--NUEVOS DATOS ACTUALIZACION DE CEDULAS DE EMPLEADOS
ALTER TABLE PATREMPL ADD ATRE_CVEPAIS_NACI VARCHAR2(2);
ALTER TABLE PATREMPL ADD ATRE_ESTA VARCHAR2(2) ;
ALTER TABLE PATREMPL ADD ATRE_CIUD_NACI VARCHAR2(50);

ALTER TABLE PATREMPL ADD ATRE_EMAIL VARCHAR2(50);
ALTER TABLE PATREMPL ADD ATRE_OBSERVA VARCHAR2(300);

ALTER TABLE PATREMPL ADD ATRE_COLON_DOMI VARCHAR2(50);
ALTER TABLE PATREMPL ADD ATRE_CVEESTA_DOMI VARCHAR2(2);

ALTER TABLE PATREMPL ADD ATRE_CVESTATUS VARCHAR2(3);


ALTER TABLE PATREMPL ADD ATRE_CVEMUNI_NA VARCHAR2(3);
ALTER TABLE PATREMPL ADD ATRE_CVEMUNI_DO VARCHAR2(3);


--para identificacion del expediente

ALTER TABLE PATREMPL ADD ATRE_UBICA VARCHAR2(10);
ALTER TABLE PATREMPL ADD ATRE_UBICA_D VARCHAR2(5);
ALTER TABLE PATREMPL ADD ATRE_STATUS VARCHAR2(1);



--**************-----------**************--**************-----------**************--**************-----------**************
alter table PATREMPL add constraint FK$PATREMPL$CVEMUNI_NA
 foreign key (ATRE_CVEMUNI_NA) references PMUNICIPIO (MUNI_CVEMUNI);

alter table PATREMPL add constraint FK$PATREMPL$CVEMUNI_DO 
 foreign key (ATRE_CVEMUNI_DO) references PMUNICIPIO (MUNI_CVEMUNI);


alter table PATREMPL add constraint FK$PATREMPL$CVEESTA 
 foreign key (ATRE_CVEESTA_DOMI) references PESTADOS (ESTA_CVEESTA);

alter table PATREMPL add constraint FK$PATREMPL$CVEPAIS
 foreign key (ATRE_CVEPAIS_NACI) references PPAISES (PAIS_CVEPAIS);

alter table PATREMPL add constraint FK$PATREMPL$CVESTATUS 
 foreign key (ATRE_CVESTATUS) references PESTATUSE (ESTA_CVESTA);

ALTER TABLE PATREMPL Add CONSTRAINT FK$PATREMPL$ESCOL 
 FOREIGN KEY(ATRE_ESCOL) REFERENCES PESCOLARI(ESCO_CVEESCO) ;

ALTER TABLE PATREMPL Add CONSTRAINT NN$PATREMPL$ESCOL 
 CHECK (ATRE_ESCOL IS NOT NULL) ;

ALTER TABLE PATREMPL Add CONSTRAINT FK$PATREMPL$EDOCIV
 FOREIGN KEY(ATRE_EDOCIV) REFERENCES PEDCIVIL ;

ALTER TABLE PATREMPL Add CONSTRAINT NN$PATREMPL$EDOCIV
 CHECK (ATRE_EDOCIV IS NOT NULL) ;

ALTER TABLE PATREMPL add constraint CC$PATREMPL$PROMEP
  check (ATRE_PROMEP IN ('S','N'));

ALTER TABLE PATREMPL add constraint CC$PATREMPL$EXPED
  check (ATRE_EXPED IN ('S','N'));

ALTER TABLE PATREMPL Add CONSTRAINT FK$PATREMPL$ESTA 
 FOREIGN KEY(ATRE_ESTA) REFERENCES PESTADOS(ESTA_CVEESTA) ;


ALTER TABLE PATREMPL add constraint CC$PATREMPL$HONORARIOA
  check (ATRE_HONORARIOA IN ('S','N'));

ALTER TABLE PATREMPL add constraint CC$PATREMPL$LISRAYA
  check (ATRE_LISRAYA IN ('S','N'));

ALTER TABLE PATREMPL add constraint CC$PATREMPL$RECIBOFOL
  check (ATRE_RECIBOFOL IN ('S','N'));

ALTER TABLE PATREMPL add constraint CC$PATREMPL$CALCISR
  check (ATRE_CALCISR IN ('S','N'));

ALTER TABLE PATREMPL add constraint CC$PATREMPL$AGUINALDO
  check (ATRE_AGUINALDO IN ('S','N'));

ALTER TABLE PATREMPL add constraint CC$PATREMPL$PRIMAVAC
  check (ATRE_PRIMAVAC IN ('S','N'));

ALTER TABLE PATREMPL add constraint CC$PATREMPL$DIAS31
  check (ATRE_DIAS31 IN ('S','N'));

ALTER TABLE PATREMPL add constraint CC$PATREMPL$BONONAV
  check (ATRE_BONONAV IN ('S','N'));

ALTER TABLE PATREMPL add constraint CC$PATREMPL$SERVMED
  check (ATRE_SERVMED IN ('S','N'));



ALTER TABLE PATREMPL Add CONSTRAINT NN$PATREMPL$STATUS
 CHECK (ATRE_STATUS IS NOT NULL) ;

ALTER TABLE PATREMPL add constraint CC$PATREMPL$STATUS
  check (ATRE_STATUS IN ('A','P'));


--**************-----------**************--**************-----------**************--**************-----------**************


COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_EXPED IS 'Expediente
Indica si está revisado el Expediente
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_ESCOL IS 'Escolaridad
Escolaridad del Empleado
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_EDOCIV IS 'Estado Civil
Estado Civil del Empleado
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_ESCOL IS 'Escolaridad
Escolaridad del Empleado
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_BANCOD IS 'Banco_Dep
Banco donde se le deposita el pago al Empleado
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_URES_C IS 'Ures_Cobro
Ures donde cobra el Empleado
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_FINGRESOD IS 'Ingreso_Doc
Fecha de Ingreso Docente
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_FHINGRESO IS 'His_Ingreso
Fecha de Ingreso historica
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_FHINGRESOD IS 'His_IngresoD
Fecha de Ingreso historica Docente
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_FJUBILA IS 'FJubilacion
Fecha de Ingreso Docente
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_FJUBILAD IS 'FJubilacionD
Fecha de Ingreso Docente
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_HONORARIOA IS 'Honorarios
Honorarios Asimilables a Salarios
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_LISRAYA IS 'ListaR
Lista de Raya
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_RECIBOFOL IS 'Recibos
Recibos Foliados
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_CALCISR IS 'ISR
Calculo de ISR
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_AGUINALDO IS 'Aguinaldo
Pago de Aguinaldo
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_PRIMAVAC IS 'Prima
Pago de Prima Vacacional
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_DIAS31 IS 'Dias31
Pago de Dias 31
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_BONONAV IS 'Bono
Pago de Bono Navideño
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_DIASAGUI IS 'Dias
Dias de Aguinaldo
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_SERVMED IS 'Serv_Medico
Servicio Médico
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_CIUD_NACI IS 'Ciudad_Nacimiento
Ciudad de Nacimiento
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_EMAIL IS 'Correo_Electrónico
Correo Electrónico
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_OBSERVA IS 'Observaciones
Observaciones
*' ;


COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_COLON_DOMI IS 'Colonia_Domicilio
Colonia Domicilio
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_CVEESTA_DOMI IS 'Cve_Estado_Domi
Clave de Estado Domicilio
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_CVESTATUS IS 'Estatus_Empl
Estatus Empleado
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_CVEMUNI_NA IS 'Municipio_Nacimiento
Municipio de Nacimiento
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_CVEMUNI_DO IS 'Municipio_Domicilio
Municipio Domicilio


*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_UBICA IS 'Ubicación
Ubicación Expediente
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_UBICA_D IS 'Ubicación_D
Detalle Ubicación Expediente 
*' ;

COMMENT ON COLUMN PERSONAL.PATREMPL.ATRE_STATUS IS 'Estatus
Estatus del Expediente 
*' ;

--**************-----------**************--**************-----------**************--**************-----------**************

CREATE INDEX IX$PATREMPL$ESCOL ON PATREMPL (ATRE_ESCOL) ;
CREATE INDEX IX$PATREMPL$EDOCIV ON PATREMPL (ATRE_EDOCIV) ;
CREATE INDEX IX$PATREMPL$PROMEP ON PATREMPL (ATRE_PROMEP) ;
CREATE INDEX IX$PATREMPL$ESTA ON PATREMPL (ATRE_ESTA) ;

--**************-----------**************--**************-----------**************--**************-----------**************

------------------------
-- VISTA DE EMPLEADOS --
------------------------

CREATE OR REPLACE VIEW PVEMPLDOS AS
SELECT
 PERS_PERSONA	As VEMP_EMPL,
 PERS_RFC		As VEMP_RFC,
 PERS_NOMBRE	As VEMP_Nombre,
 PERS_APEPAT	As VEMP_ApePat,
 PERS_APEMAT	As VEMP_ApeMat,
 PERS_USUARIO	As VEMP_Usuario,
 PERS_DIRECCION	As VEMP_Direccion,
 PERS_TELEFONO	As VEMP_Telefono,
 PERS_Contactos	As VEMP_Contactos,
 PERS_SEXO		As VEMP_Sexo,
 PERS_ACTIVO	As VEMP_Activo,
 PERS_Foto		As VEMP_Foto,
 ATRE_Banco_Emp	As VEMP_Banco_Emp,
 ATRE_CtaBco 	As VEMP_CtaBco,
 ATRE_BancoD    As VEMP_BancoD,
 ATRE_Ures_P 	As VEMP_URes_P,
 ATRE_Ures_C 	As VEMP_URes_C,
 TRUNC(NVL(PATREMPL.ATRE_ANTIG,0)/360) ANTIGUEDAD_AÑOS,
 CALCULA_ANTIG((SELECT MAX(NOMI_FECHA) FROM PNOMINAS), ATRE_FINGRESO, 1) 	As VEMP_AntigAnios,
 CALCULA_ANTIG((SELECT MAX(NOMI_FECHA) FROM PNOMINAS), ATRE_FINGRESO, 2) 	As VEMP_AntigDias,
-- FLOOR(NVL(ATRE_Antig,0)/360) 	As VEMP_AntigAnios,
-- MOD(NVL(ATRE_Antig,0),360) 	As VEMP_AntigDias,
 NVL(ATRE_SPIUJAT,'N') As VEMP_SPIUJAT,
-- FLOOR(NVL(ATRE_AntigD,0)/360) 	As VEMP_AntigDAnios,
-- MOD(NVL(ATRE_AntigD,0),360) 	As VEMP_AntigDDias,
 CALCULA_ANTIG((SELECT MAX(NOMI_FECHA) FROM PNOMINAS), ATRE_FINGRESOD, 1) 	As VEMP_AntigDAnios,
 CALCULA_ANTIG((SELECT MAX(NOMI_FECHA) FROM PNOMINAS), ATRE_FINGRESOD, 2) 	As VEMP_AntigDDias,
 ATRE_Impresa As VEMP_Impresa,
 ATRE_FNACI AS VEMP_FNACI,
 ATRE_FINGRESO AS VEMP_FINGRESO,
 ATRE_FHINGRESO AS VEMP_FHINGRESO,
 ATRE_FJUBILA AS VEMP_FJUBILA,
 ATRE_ESCOL AS VEMP_ESCOL,
 ATRE_EDOCIV As VEMP_EDOCIV,
 ATRE_PROMEP AS VEMP_PROMEP,
 ATRE_EXPED AS VEMP_EXPED,
 ATRE_DESCRIP AS VEMP_DESCRIP,
 ATRE_ABREVIA AS VEMP_ABREVIA,
 ATRE_CURP AS VEMP_CURP,
 ATRE_ESTA AS VEMP_ESTA,
 ATRE_NUMSS AS VEMP_NUMSS,
 ATRE_FINGRESOD AS VEMP_FINGRESOD,
 ATRE_FHINGRESOD AS VEMP_FHINGRESOD,
 ATRE_FJUBILAD AS VEMP_FJUBILAD,
 ATRE_HONORARIOA AS VEMP_HONORARIOA,
 ATRE_LISRAYA AS VEMP_LISRAYA,
 ATRE_RECIBOFOL AS VEMP_RECIBOFOL,
 DECODE(ATRE_HONORARIOA,'N',DECODE(ATRE_LISRAYA,'N',DECODE(ATRE_RECIBOFOL,'N','N','S'),'S'),'S') AS VEMP_EXTERNO,
 ATRE_CALCISR AS VEMP_CALCISR,
 ATRE_AGUINALDO AS VEMP_AGUINALDO,
 ATRE_PRIMAVAC AS VEMP_PRIMAVAC,
 ATRE_DIAS31 AS VEMP_DIAS31,
 ATRE_BONONAV AS VEMP_BONONAV,
 ATRE_DIASAGUI AS VEMP_DIASAGUI,
 ATRE_SERVMED AS VEMP_SERVMED,
 ATRE_CVEMUNI_NA AS VEMP_CVEMUNI_NA,
 ATRE_CIUD_NACI AS VEMP_CIUD_NACI,
 ATRE_EMAIL AS VEMP_EMAIL,
 ATRE_OBSERVA AS VEMP_OBSERVA,
 ATRE_CVEMUNI_DO AS VEMP_CVEMUNI_DO,
 ATRE_COLON_DOMI AS VEMP_COLON_DOMI,
 ATRE_CVEESTA_DOMI AS VEMP_CVEESTA_DOMI,
 ATRE_CVEPAIS_NACI AS VEMP_CVEPAIS_NACI,
 ATRE_CVESTATUS AS VEMP_CVESTA,
 ATRE_UBICA AS VEMP_UBICA,
 ATRE_UBICA_D AS VEMP_UBICA_D,
 ATRE_STATUS AS VEMP_STATUS
FROM FPersonas, PATREMPL
Where PERS_EMPLEADO= 'S'
 And ATRE_Empl(+)= PERS_Persona;

/

--**************-----------**************--**************-----------**************--**************-----------**************


COMMENT ON TABLE PERSONAL.PVEMPLDOS IS 'Catalogo de Empleados
Catalogo de empleados (Vista de Personas de Finanzas)' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_EMPL IS 'Empleado
Clave del Empleado
00
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_RFC IS 'RFC
Registro Federal de Causantes del Empleado
01
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_Nombre IS 'Nombre
Nombre del Empleado
02
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_ApePat IS 'Apellido Paterno
Apellido Paterno del Empleado
03
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_ApeMat IS 'Apellido Materno
Apellido Materno del Empleado
04
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_Usuario IS 'Usuario
Nombre de Usuario con el que entra al sistema
05
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_Direccion IS 'Direccion
Direccion del Empleado, donde vive
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_Telefono IS 'Telefono(s)
Telefono(s) del Empleado
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_Contactos IS 'Contactos
Contactos, o donde mas se le puede encontrar al empleado
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_Sexo IS 'Sexo
Sexo del Empleado (M= Masculino F=Femenino)
06
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_Activo IS 'Activo
Indica si el Empleado esta o no Activo (S=Si N=No)
07
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_Foto IS 'Foto
Fotografia del empleado
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_Banco_Emp IS 'Banco
Cuenta Bancario con la que se le paga al Empleado
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_BancoD IS 'Banco_Dep
Banco donde se le deposita el pago al Empleado
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_CtaBco IS 'CtaBco
Cuenta Bancaria del Banco donde Cobra el Empleado
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_URes_P IS 'UResP
Unidad Responsable donde Cobra el Empleado
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_AntigAnios IS 'Anios de Antiguedad
Anios de Antiguedad
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_AntigDias IS 'Dias de Antiguedad
Dias de Antiguedad
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_SPIUJAT IS 'SPIUJAT
Indica si el empleado pertenece o no al SPIUJAT
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_AntigDAnios IS 'Anios de Antiguedad Docente
Anios de Antiguedad
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_AntigDDias IS 'Dias de Antiguedad Docente
Dias de Antiguedad
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_IMPRESA IS 'Credencial 
Indica si la Credencial ya fue impresa (S=Si N=No)
08
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_FNACI IS 'Nacimiento
Fecha de Nacimiento del Empleado
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_FINGRESO IS 'Ingreso
Fecha de Ingreso a la UJAT
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_FHINGRESO IS 'His_Ingreso
Fecha Historica de Ingreso a la UJAT
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_FJUBILA IS 'FJubilacion
Fecha de Jubilacion
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_ESCOL IS 'Escolaridad 
Nivel de Escolaridad del Empleado
09
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_EDOCIV IS 'Estado civil
Estado civil
10
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_PROMEP IS 'Promep
Perfil Promep
11
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_EXPED IS 'Exped
Indica si está revisado el expediente
12
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_DESCRIP IS 'Descripcion
Descripcion de la Escolaridad
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_ABREVIA IS 'Abreviatura
Abreviatura de la Escolaridad
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_CURP IS 'Curp
Curp del Empleado
13
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_ESTA IS 'Estado
Estado de Nacimiento
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_NUMSS IS 'Seguro Social
Número de Seguridad Social
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_URes_C IS 'UResP_C
Unidad Responsable donde Cobra el Empleado Sindicalizado
*' ;


COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_FINGRESOD IS 'Ingreso_Doc
Fecha de Ingreso Docente
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_FHINGRESOD IS 'His_IngresoD
Fecha Historica de Ingreso Docente
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_FJUBILAD IS 'FJubilacionD
Fecha de Jubilacion Docente
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_HONORARIOA IS 'Honorarios
Honorarios Asimilables a Salarios
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_LISRAYA IS 'ListaR
Lista de Raya
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_RECIBOFOL IS 'Recibos
Recibos Foliados
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_CALCISR IS 'ISR
Calculo de ISR
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_AGUINALDO IS 'Aguinaldo
Pago de Aguinaldo
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_PRIMAVAC IS 'Prima
Pago de Prima Vacacional
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_DIAS31 IS 'Dias31
Pago de Dias 31
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_BONONAV IS 'Bono
Pago de Bono Navideño
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_SERVMED IS 'Serv_Medico
Servicio Médico
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_DIASAGUI IS 'Dias
Dias de Aguinaldo
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_EXTERNO IS 'Externo
Empleado Externo
14
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_CVEMUNI_NA IS 'Municipio_Nacimiento
Municipio de Nacimiento
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_CIUD_NACI IS 'Ciudad_Nacimiento
Ciudad de Nacimiento
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_EMAIL IS 'Correo_Electrónico
Correo Electrónico
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_OBSERVA IS 'Observaciones
Observaciones
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_CVEMUNI_DO IS 'Municipio_Domicilio
Municipio Domicilio
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_COLON_DOMI IS 'Colonia_Domicilio
Colonia Domicilio
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_CVEESTA_DOMI IS 'Cve_Estado_Domi
Clave de Estado Domicilio
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_CVESTA IS 'Estatus_Empl
Estatus Empleado
*' ;



COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_UBICA IS 'Ubicacion
Ubicación del Expediente
15
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_UBICA_D IS 'Ubicacion_D
Detalle de la Ubicación del Expediente
16
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLDOS.VEMP_STATUS IS 'Estatus
Estatus del Expediente (A=en Archivero   P=en Prestamo)
17
*S' ;



--**************-----------**************--**************-----------**************--**************-----------**************
--**************-----------**************--**************-----------**************--**************-----------**************


create or replace trigger TII_PVEMPLDOS
instead of insert on PVEMPLDOS  for each row
declare
  curp varchar2(18) ;
begin

 if :new.vemp_fnaci >= sysdate then
    raise_application_error(-20001,'La fecha de nacimiento debe ser menor o igual a la fecha de hoy');
 end if;


-- Insertamos en Personas
 INSERT INTO FPERSONAS
 (PERS_Persona, PERS_RFC, PERS_Nombre, PERS_ApePat,
  PERS_ApeMat, PERS_Usuario, PERS_Direccion, PERS_Telefono,
  PERS_Contactos, PERS_Sexo, PERS_Empleado,  PERS_Activo)
 VALUES
 (:new.VEMP_Empl, :new.VEMP_RFC, :new.VEMP_Nombre, :new.VEMP_ApePat,
  :new.VEMP_ApeMat, :new.VEMP_Usuario, :new.VEMP_Direccion, :new.VEMP_Telefono,
  :new.VEMP_Contactos, :new.VEMP_Sexo, 'S', :new.VEMP_Activo) ;

 if (:new.vemp_curp is null) then
    curp := NOM$CURP(:new.VEMP_Apepat, :new.VEMP_Apemat, :new.VEMP_Nombre,
            :new.VEMP_Fnaci, :new.VEMP_Sexo, :new.VEMP_Esta) ;
 else
     curp := :new.VEMP_Curp ;
 end if ;


-- Insertamos en PATREMPL
 INSERT INTO PATREMPL
  (ATRE_Empl, ATRE_Banco_Emp, ATRE_CtaBco, ATRE_URes_P, ATRE_SPIUJAT,
   ATRE_IMPRESA, ATRE_FNACI, ATRE_FINGRESO, ATRE_FHINGRESO, ATRE_FJUBILA,
   ATRE_ESCOL, ATRE_EDOCIV,ATRE_PROMEP,ATRE_EXPED,ATRE_DESCRIP, ATRE_ABREVIA, ATRE_CURP, ATRE_ESTA,
   ATRE_NUMSS, ATRE_BANCOD, ATRE_URes_c, ATRE_FINGRESOD, ATRE_FHINGRESOD, ATRE_FJUBILAD,
   --NUEVOS DATOS PARA EXTERNOS
   ATRE_HONORARIOA, ATRE_LISRAYA, ATRE_RECIBOFOL, ATRE_CALCISR, ATRE_AGUINALDO, ATRE_PRIMAVAC,
   ATRE_DIAS31, ATRE_BONONAV, ATRE_DIASAGUI, ATRE_SERVMED,
   --NUEVOS DATOS DE EMPLEADOS
   ATRE_CVEMUNI_NA, ATRE_CIUD_NACI, ATRE_EMAIL, ATRE_OBSERVA, ATRE_CVEMUNI_DO, ATRE_COLON_DOMI,
   ATRE_CVEESTA_DOMI, ATRE_CVEPAIS_NACI, ATRE_CVESTATUS, ATRE_UBICA, ATRE_UBICA_D, ATRE_STATUS)
 VALUES
  (:new.VEMP_Empl, :new.VEMP_Banco_Emp, :new.VEMP_CtaBco, :new.VEMP_URes_P, :new.VEMP_SPIUJAT,
     :NEW.VEMP_IMPRESA, :NEW.VEMP_FNACI, :NEW.VEMP_FINGRESO, :NEW.VEMP_FHINGRESO, :NEW.VEMP_FJUBILA,
     :NEW.VEMP_ESCOL, :NEW.VEMP_EDOCIV,:NEW.VEMP_PROMEP, :NEW.VEMP_EXPED, :NEW.VEMP_DESCRIP, :NEW.VEMP_ABREVIA,
     CURP, :NEW.VEMP_ESTA,:NEW.VEMP_NUMSS, :NEW.VEMP_BANCOD, :new.VEMP_URes_c,
     :new.VEMP_FIngresoD, :new.VEMP_FHIngresoD, :new.VEMP_FJUBILAD,
     :new.VEMP_HONORARIOA, :new.VEMP_LISRAYA, :new.VEMP_RECIBOFOL,:new.VEMP_CALCISR,:new.VEMP_AGUINALDO,
     :new.VEMP_PRIMAVAC,:new.VEMP_DIAS31,:new.VEMP_BONONAV,:new.VEMP_DIASAGUI, :NEW.VEMP_SERVMED,
     :new.VEMP_CVEMUNI_NA, :new.VEMP_CIUD_NACI, :new.VEMP_EMAIL, :new.VEMP_OBSERVA, :new.VEMP_CVEMUNI_DO, 
     :new.VEMP_COLON_DOMI, :new.VEMP_CVEESTA_DOMI, :new.VEMP_CVEPAIS_NACI, :new.VEMP_CVESTA, :new.VEMP_UBICA,
     :new.VEMP_UBICA_D, :new.VEMP_STATUS) ;

end ;
/

--**************-----------**************--**************-----------**************--**************-----------**************
--**************-----------**************--**************-----------**************--**************-----------**************

create or replace trigger TIU_PVEMPLDOS
instead of update on PVEMPLDOS  for each row
declare
 tt varchar2(30) ;
 curp varchar2(18) ;
 CUENTA NUMBER;

begin


 if :new.vemp_fnaci >= sysdate then
    raise_application_error(-20001,'La fecha de nacimiento debe ser menor o igual a la fecha de hoy');
 end if;


IF USER IN ('MCM00445','APH01655') THEN

    -- Cambiamos FPersonas
     UPDATE FPERSONAS Set
      PERS_RFC= :new.VEMP_RFC,
      PERS_Nombre= :new.VEMP_Nombre,
      PERS_ApePat= :new.VEMP_ApePat,
      PERS_ApeMat= :new.VEMP_ApeMat,
      PERS_Direccion= :new.VEMP_Direccion,
      PERS_Telefono= :new.VEMP_Telefono,
      PERS_Contactos= :new.VEMP_Contactos,
      PERS_Sexo= :new.VEMP_Sexo
     Where PERS_Persona= :new.VEMP_Empl ;


     if (:new.vemp_curp is null) then
        curp := NOM$CURP(:new.VEMP_Apepat, :new.VEMP_Apemat, :new.VEMP_Nombre,
                :new.VEMP_Fnaci, :new.VEMP_Sexo, :new.VEMP_Esta) ;
     else
         curp := :new.VEMP_Curp ;
     end if ;

    -- Cambiamos PATREMPL
     UPDATE PATREMPL Set
      ATRE_IMPRESA= :NEW.VEMP_IMPRESA,
      ATRE_FNACI = :NEW.VEMP_FNACI,
      ATRE_ESCOL = :NEW.VEMP_ESCOL,
      ATRE_EDOCIV = :NEW.VEMP_EDOCIV,
      ATRE_EXPED = :NEW.VEMP_EXPED,
      ATRE_DESCRIP = :NEW.VEMP_DESCRIP,
      ATRE_ABREVIA = :NEW.VEMP_ABREVIA,
      ATRE_CURP = CURP,
      ATRE_ESTA = :NEW.VEMP_ESTA,
      ATRE_NUMSS = :NEW.VEMP_NUMSS,
      ATRE_HONORARIOA =:new.VEMP_HONORARIOA,
      ATRE_LISRAYA =:new.VEMP_LISRAYA,
      ATRE_RECIBOFOL =:new.VEMP_RECIBOFOL,
      ATRE_CALCISR =:new.VEMP_CALCISR,
      ATRE_AGUINALDO =:new.VEMP_AGUINALDO,
      ATRE_PRIMAVAC =:new.VEMP_PRIMAVAC,
      ATRE_DIAS31 =:new.VEMP_DIAS31,
      ATRE_BONONAV =:new.VEMP_BONONAV,
      ATRE_DIASAGUI =:new.VEMP_DIASAGUI,
      ATRE_SERVMED =:new.VEMP_SERVMED,
      ATRE_CVEMUNI_NA =:new.VEMP_CVEMUNI_NA,
      ATRE_CIUD_NACI =:new.VEMP_CIUD_NACI,
      ATRE_EMAIL =:new.VEMP_EMAIL,
      ATRE_OBSERVA =:new.VEMP_OBSERVA,
      ATRE_CVEMUNI_DO =:new.VEMP_CVEMUNI_DO,
      ATRE_COLON_DOMI =:new.VEMP_COLON_DOMI,
      ATRE_CVEESTA_DOMI =:new.VEMP_CVEESTA_DOMI,
      ATRE_CVEPAIS_NACI =:new.VEMP_CVEPAIS_NACI,
      ATRE_CVESTATUS =:new.VEMP_CVESTA,
      ATRE_UBICA =:new.VEMP_UBICA,
      ATRE_UBICA_D =:new.VEMP_UBICA_D,
      ATRE_STATUS =:new.VEMP_STATUS
     Where ATRE_Empl= :new.VEMP_Empl
     Returning rowid into tt ;


    -- Insertamos en PATREMPL si no existe registro
     if tt is null then
      INSERT INTO PATREMPL
       (ATRE_Empl, ATRE_IMPRESA, ATRE_FNACI,
           ATRE_ESCOL, ATRE_EDOCIV, ATRE_EXPED, ATRE_DESCRIP, ATRE_ABREVIA, ATRE_CURP, ATRE_ESTA,
           ATRE_NUMSS,
       --NUEVOS DATOS PARA EXTERNOS
       ATRE_HONORARIOA, ATRE_LISRAYA, ATRE_RECIBOFOL, ATRE_CALCISR, ATRE_AGUINALDO, ATRE_PRIMAVAC,
       ATRE_DIAS31, ATRE_BONONAV, ATRE_DIASAGUI, ATRE_SERVMED,
      --NUEVOS DATOS DE EMPLEADOS
       ATRE_CVEMUNI_NA, ATRE_CIUD_NACI, ATRE_EMAIL, ATRE_OBSERVA, ATRE_CVEMUNI_DO, ATRE_COLON_DOMI,
       ATRE_CVEESTA_DOMI, ATRE_CVEPAIS_NACI, ATRE_CVESTATUS, ATRE_UBICA, ATRE_UBICA_D, ATRE_STATUS)
      VALUES
       (:new.VEMP_Empl,
        :NEW.VEMP_IMPRESA, :NEW.VEMP_FNACI,
        :NEW.VEMP_ESCOL, :NEW.VEMP_EdoCiv,
        :NEW.VEMP_EXPED, :NEW.VEMP_DESCRIP, :NEW.VEMP_ABREVIA, CURP, :NEW.VEMP_ESTA,
        :NEW.VEMP_NUMSS,
        :new.VEMP_HONORARIOA, :new.VEMP_LISRAYA, :new.VEMP_RECIBOFOL,:new.VEMP_CALCISR,:new.VEMP_AGUINALDO,
        :new.VEMP_PRIMAVAC,:new.VEMP_DIAS31,:new.VEMP_BONONAV,:new.VEMP_DIASAGUI, :NEW.VEMP_SERVMED,
        :new.VEMP_CVEMUNI_NA, :new.VEMP_CIUD_NACI, :new.VEMP_EMAIL, :new.VEMP_OBSERVA, :new.VEMP_CVEMUNI_DO,
        :new.VEMP_COLON_DOMI, :new.VEMP_CVEESTA_DOMI, :new.VEMP_CVEPAIS_NACI, :new.VEMP_CVESTA, :new.VEMP_UBICA,
        :new.VEMP_UBICA_D, :new.VEMP_STATUS) ;
     end if ;


ELSE

    -- Cambiamos FPersonas
     UPDATE FPERSONAS Set
      PERS_RFC= :new.VEMP_RFC,
      PERS_Nombre= :new.VEMP_Nombre,
      PERS_ApePat= :new.VEMP_ApePat,
      PERS_ApeMat= :new.VEMP_ApeMat,
      PERS_Usuario= :new.VEMP_Usuario,
      PERS_Direccion= :new.VEMP_Direccion,
      PERS_Telefono= :new.VEMP_Telefono,
      PERS_Contactos= :new.VEMP_Contactos,
      PERS_Sexo= :new.VEMP_Sexo,
      PERS_Activo= :new.VEMP_Activo
     Where PERS_Persona= :new.VEMP_Empl ;


     if (:new.vemp_curp is null) then
        curp := NOM$CURP(:new.VEMP_Apepat, :new.VEMP_Apemat, :new.VEMP_Nombre,
                :new.VEMP_Fnaci, :new.VEMP_Sexo, :new.VEMP_Esta) ;
     else
         curp := :new.VEMP_Curp ;
     end if ;

    -- Cambiamos PATREMPL
     UPDATE PATREMPL Set
      ATRE_Banco_Emp= :new.VEMP_Banco_Emp,
      ATRE_CtaBco= :new.VEMP_CtaBco,
      ATRE_URes_P= :new.VEMP_URes_P,
      ATRE_SPIUJAT= :new.VEMP_SPIUJAT,
      ATRE_IMPRESA= :NEW.VEMP_IMPRESA,
      ATRE_FNACI = :NEW.VEMP_FNACI,
      ATRE_FINGRESO = :NEW.VEMP_FINGRESO,
      ATRE_FHINGRESO = :NEW.VEMP_FHINGRESO,
      ATRE_FJUBILA = :NEW.VEMP_FJUBILA,
      ATRE_ESCOL = :NEW.VEMP_ESCOL,
      ATRE_EDOCIV = :NEW.VEMP_EDOCIV,
      ATRE_PROMEP = :NEW.VEMP_PROMEP,
      ATRE_EXPED = :NEW.VEMP_EXPED,
      ATRE_DESCRIP = :NEW.VEMP_DESCRIP,
      ATRE_ABREVIA = :NEW.VEMP_ABREVIA,
      ATRE_CURP = CURP,
      ATRE_ESTA = :NEW.VEMP_ESTA,
      ATRE_NUMSS = :NEW.VEMP_NUMSS,
      ATRE_BANCOD = :NEW.VEMP_BANCOD,
      ATRE_URES_C = :NEW.VEMP_URES_C,
      ATRE_FINGRESOD = :NEW.VEMP_FINGRESOD,
      ATRE_FHINGRESOD = :NEW.VEMP_FHINGRESOD,
      ATRE_FJUBILAD = :NEW.VEMP_FJUBILAD,
      ATRE_HONORARIOA =:new.VEMP_HONORARIOA,
      ATRE_LISRAYA =:new.VEMP_LISRAYA,
      ATRE_RECIBOFOL =:new.VEMP_RECIBOFOL,
      ATRE_CALCISR =:new.VEMP_CALCISR,
      ATRE_AGUINALDO =:new.VEMP_AGUINALDO,
      ATRE_PRIMAVAC =:new.VEMP_PRIMAVAC,
      ATRE_DIAS31 =:new.VEMP_DIAS31,
      ATRE_BONONAV =:new.VEMP_BONONAV,
      ATRE_DIASAGUI =:new.VEMP_DIASAGUI,
      ATRE_SERVMED =:new.VEMP_SERVMED,
      ATRE_CVEMUNI_NA =:new.VEMP_CVEMUNI_NA,
      ATRE_CIUD_NACI =:new.VEMP_CIUD_NACI,
      ATRE_EMAIL =:new.VEMP_EMAIL,
      ATRE_OBSERVA =:new.VEMP_OBSERVA,
      ATRE_CVEMUNI_DO =:new.VEMP_CVEMUNI_DO,
      ATRE_COLON_DOMI =:new.VEMP_COLON_DOMI,
      ATRE_CVEESTA_DOMI =:new.VEMP_CVEESTA_DOMI,
      ATRE_CVEPAIS_NACI =:new.VEMP_CVEPAIS_NACI,
      ATRE_CVESTATUS =:new.VEMP_CVESTA,
      ATRE_UBICA =:new.VEMP_UBICA,
      ATRE_UBICA_D =:new.VEMP_UBICA_D,
      ATRE_STATUS =:new.VEMP_STATUS
     Where ATRE_Empl= :new.VEMP_Empl
     Returning rowid into tt ;


    -- Insertamos en PATREMPL si no existe registro
     if tt is null then
      INSERT INTO PATREMPL
       (ATRE_Empl, ATRE_Banco_Emp, ATRE_CtaBco, ATRE_URes_P, ATRE_SPIUJAT,
           ATRE_IMPRESA, ATRE_FNACI, ATRE_FINGRESO, ATRE_FHINGRESO, ATRE_FJUBILA,
           ATRE_ESCOL, ATRE_EDOCIV, ATRE_PROMEP, ATRE_EXPED, ATRE_DESCRIP, ATRE_ABREVIA, ATRE_CURP, ATRE_ESTA,
           ATRE_NUMSS, ATRE_BANCOD, ATRE_URes_C, ATRE_FINGRESOD, ATRE_FHINGRESOD, ATRE_FJUBILAD,
       --NUEVOS DATOS PARA EXTERNOS
       ATRE_HONORARIOA, ATRE_LISRAYA, ATRE_RECIBOFOL, ATRE_CALCISR, ATRE_AGUINALDO, ATRE_PRIMAVAC,
       ATRE_DIAS31, ATRE_BONONAV, ATRE_DIASAGUI, ATRE_SERVMED,
      --NUEVOS DATOS DE EMPLEADOS
       ATRE_CVEMUNI_NA, ATRE_CIUD_NACI, ATRE_EMAIL, ATRE_OBSERVA, ATRE_CVEMUNI_DO, ATRE_COLON_DOMI,
       ATRE_CVEESTA_DOMI, ATRE_CVEPAIS_NACI, ATRE_CVESTATUS, ATRE_UBICA, ATRE_UBICA_D, ATRE_STATUS)
      VALUES
       (:new.VEMP_Empl, :new.VEMP_Banco_Emp, :new.VEMP_CtaBco, :new.VEMP_URes_P, :new.VEMP_SPIUJAT,
        :NEW.VEMP_IMPRESA, :NEW.VEMP_FNACI, :NEW.VEMP_FINGRESO, :NEW.VEMP_FHINGRESO, :NEW.VEMP_FJUBILA,
        :NEW.VEMP_ESCOL, :NEW.VEMP_EdoCiv,
        :NEW.VEMP_PROMEP, :NEW.VEMP_EXPED, :NEW.VEMP_DESCRIP, :NEW.VEMP_ABREVIA, CURP, :NEW.VEMP_ESTA,
        :NEW.VEMP_NUMSS, :NEW.VEMP_BANCOD, :new.VEMP_URes_C, :NEW.VEMP_FINGRESOD, :NEW.VEMP_FHINGRESOD, :NEW.VEMP_FJUBILAD,
        :new.VEMP_HONORARIOA, :new.VEMP_LISRAYA, :new.VEMP_RECIBOFOL,:new.VEMP_CALCISR,:new.VEMP_AGUINALDO,
        :new.VEMP_PRIMAVAC,:new.VEMP_DIAS31,:new.VEMP_BONONAV,:new.VEMP_DIASAGUI, :NEW.VEMP_SERVMED,
        :new.VEMP_CVEMUNI_NA, :new.VEMP_CIUD_NACI, :new.VEMP_EMAIL, :new.VEMP_OBSERVA, :new.VEMP_CVEMUNI_DO,
        :new.VEMP_COLON_DOMI, :new.VEMP_CVEESTA_DOMI, :new.VEMP_CVEPAIS_NACI, :new.VEMP_CVESTA, :new.VEMP_UBICA,
        :new.VEMP_UBICA_D, :new.VEMP_STATUS) ;
     end if ;

END IF;

   --ACTUALIZA CONTROL ESCOLAR

   SELECT COUNT(*)
   INTO CUENTA
   FROM PNOMBRAM A, PPLAZAS B
   WHERE A.NOMB_PLAZA = B.PLAZ_PLAZA
   AND B.PLAZ_PSTO IN ('PROFINV','TECACAD')
   AND A.NOMB_EMPL = :NEW.VEMP_EMPL;


   IF NVL(CUENTA,0) > 0 THEN
      ACTUALIZA_ESCOLAR(:NEW.VEMP_EMPL, 1, :new.VEMP_Nombre, :new.VEMP_ApePat, :new.VEMP_ApeMat, :NEW.VEMP_ABREVIA,'');
   END IF;



end ;

/

--**************-----------**************--**************-----------**************--**************-----------**************
--**************-----------**************--**************-----------**************--**************-----------**************



GRANT EXECUTE ON NOM$CURP TO MEDICOS;

CREATE PUBLIC SYNONYM NOM$CURP FOR PERSONAL.NOM$CURP;



CONNECT SHAKE/SHAKE@SAIES1

UPDATE SREFDESC
SET REFD_SQL = 
'SELECT
 PUES_PSTO As Puesto,
 PUES_Descrip As Descripcion,
 PUES_TPSTO As T_Puesto
From PPUESTOS
where
 (pues_tpsto IN (select  decode(user,'LCC00369','D','EHR01004','A','D')FROM DUAL)
  OR pues_tpsto IN (select  decode(user,'LCC00369','BD','EHR01004','MS','A')FROM DUAL)
	OR pues_tpsto IN (select  decode(user,'LCC00369','JD','EHR01004','JA','JA')FROM DUAL)
  OR pues_tpsto IN (select  decode(user,'LCC00369','PD','EHR01004','PA','PA')FROM DUAL)
  OR pues_tpsto IN (select  decode(user,'LCC00369','D','EHR01004','C','MS')FROM DUAL)
  OR pues_tpsto IN (select  decode(user,'LCC00369','D','EHR01004','BA','C')FROM DUAL)
  OR pues_tpsto IN (select  decode(user,'LCC00369','D','EHR01004','A','BA')FROM DUAL)
  OR pues_tpsto IN (select  decode(user,'LCC00369','D','EHR01004','A','JD')FROM DUAL)
  OR pues_tpsto IN (select  decode(user,'LCC00369','D','EHR01004','A','PD')FROM DUAL)
  OR pues_tpsto IN (select  decode(user,'LCC00369','D','EHR01004','A','BD')FROM DUAL))'	
WHERE REFD_CAMPO = 'PSTO';


commit ;




