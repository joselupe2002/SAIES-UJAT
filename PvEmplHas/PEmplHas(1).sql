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


----------------BORRARRR


ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_CTABCO ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_ESCOL  ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_EDOCIV ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_DESCRIP ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_ABREVIA ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_CURP ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_ESTA ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_NUMSS ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_BANCOD ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_ANTIG ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_URES_C ;
ALTER TABLE PEMPLHAS DROP COLUMN  EMPLH_HONORARIO ;
ALTER TABLE PEMPLHAS DROP COLUMN  EMPLH_CALCISR ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_SERVMED ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_CIUD_NACI ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_EMAIL ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_COLON_DOMI ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_CVEPAIS_NACI ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_CVESTATUS ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_CVEMUNI_NA ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_CVEMUNI_DO ;

ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_MOTIVO_CONT ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_OBSER_BAJA ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_DESC_JUDI;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_DEPEN_ECO ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_SUB_FONDO ;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_FECHA_BAJA;
ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_OBSERVACION ;

--para identificacion del expediente

  ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_UBICA ;
  ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_UBICA_D ;
  ALTER TABLE PEMPLHAS DROP COLUMN EMPLH_STATUS ;



********************************CREAR*************************************************



connect personal/personal@BD;

ALTER TABLE PEMPLHAS ADD EMPL_CTABCO VARCHAR2(15);
ALTER TABLE PEMPLHAS ADD EMPL_ESCOL VARCHAR2(2) ;
ALTER TABLE PEMPLHAS ADD EMPL_EDOCIV VARCHAR2(1) DEFAULT 'O' ;
ALTER TABLE PEMPLHAS ADD EMPL_DESCRIP VARCHAR2(100);
ALTER TABLE PEMPLHAS ADD EMPL_ABREVIA VARCHAR2(10) DEFAULT 'C.';
ALTER TABLE PEMPLHAS ADD EMPL_CURP VARCHAR2(18) ;
ALTER TABLE PEMPLHAS ADD EMPL_ESTA VARCHAR2(2) ;
ALTER TABLE PEMPLHAS ADD EMPL_NUMSS VARCHAR2(11) ;
ALTER TABLE PEMPLHAS ADD EMPL_BANCOD VARCHAR2(2);
ALTER TABLE PEMPLHAS ADD EMPL_ANTIG NUMBER(5);
ALTER TABLE PEMPLHAS ADD EMPl_URES_C VARCHAR2(12);
ALTER TABLE PEMPLHAS ADD EMPL_HONORARIO VARCHAR2(1) DEFAULT 'S' ;
ALTER TABLE PEMPLHAS ADD EMPL_CALCISR VARCHAR2(1) DEFAULT 'N' ;
ALTER TABLE PEMPLHAS ADD EMPL_SERVMED VARCHAR2(1) DEFAULT 'N' ;
ALTER TABLE PEMPLHAS ADD EMPL_CIUD_NACI VARCHAR2(50);
ALTER TABLE PEMPLHAS ADD EMPL_EMAIL VARCHAR2(50);
ALTER TABLE PEMPLHAS ADD EMPL_COLON_DOMI VARCHAR2(50);
ALTER TABLE PEMPLHAS ADD EMPL_CVEPAIS_NACI VARCHAR2(2);
ALTER TABLE PEMPLHAS ADD EMPL_CVESTATUS VARCHAR2(3);
ALTER TABLE PEMPLHAS ADD EMPL_CVEMUNI_NA VARCHAR2(3);
ALTER TABLE PEMPLHAS ADD EMPL_CVEMUNI_DO VARCHAR2(3);

ALTER TABLE PEMPLHAS ADD EMPL_MOTIVO_CONT VARCHAR2(300);
ALTER TABLE PEMPLHAS ADD EMPL_OBSER_BAJA VARCHAR2(300);
ALTER TABLE PEMPLHAS ADD EMPL_DESC_JUDI VARCHAR2(300);
ALTER TABLE PEMPLHAS ADD EMPL_DEPEN_ECO VARCHAR2(300);
ALTER TABLE PEMPLHAS ADD EMPL_SUB_FONDO VARCHAR2(4);
ALTER TABLE PEMPLHAS ADD EMPL_FECHA_BAJA DATE;
ALTER TABLE PEMPLHAS ADD EMPL_OBSERVACION VARCHAR2(300);

--para identificacion del expediente

  ALTER TABLE PEMPLHAS ADD EMPL_UBICA VARCHAR2(10);
  ALTER TABLE PEMPLHAS ADD EMPL_UBICA_D VARCHAR2(5);
  ALTER TABLE PEMPLHAS ADD EMPL_STATUS VARCHAR2(1);



--**************-----------**************--**************----------HASSS-**************--**************-----------**************
alter table PEMPLHAS add constraint FK$PEMPLHAS$CVEMUNI_NA
 foreign key (EMPL_CVEMUNI_NA) references PMUNICIPIO (MUNI_CVEMUNI);

alter table PEMPLHAS add constraint FK$PEMPLHAS$CVEMUNI_DO 
 foreign key (EMPL_CVEMUNI_DO) references PMUNICIPIO (MUNI_CVEMUNI);


alter table PEMPLHAS add constraint FK$PEMPLHAS$CVEPAIS
 foreign key (EMPL_CVEPAIS_NACI) references PPAISES (PAIS_CVEPAIS);


alter table PEMPLHAS add constraint FK$PEMPLHAS$CVESTATUS 
 foreign key (EMPL_CVESTATUS) references PESTATUSE (ESTA_CVESTA);

ALTER TABLE PEMPLHAS Add CONSTRAINT FK$PEMPLHAS$ESCOL 
 FOREIGN KEY(EMPl_ESCOL) REFERENCES PESCOLARI(ESCO_CVEESCO) ;


  ALTER TABLE PEMPLHAS Add CONSTRAINT HN$PEMPLHAS$ESCOL  ----checar
 CHECK (EMPL_ESCOL IS NOT NULL) ;



ALTER TABLE PEMPLHAS Add CONSTRAINT FK$PEMPLHAS$EDOCIV
 FOREIGN KEY(EMPL_EDOCIV) REFERENCES PEDCIVIL ;

ALTER TABLE PEMPLHAS Add CONSTRAINT NN$PEMPLHAS$EDOCIV
 CHECK (EMPL_EDOCIV IS NOT NULL) ;


ALTER TABLE PEMPLHAS Add CONSTRAINT FK$PEMPLHAS$ESTA 
 FOREIGN KEY(EMPL_ESTA) REFERENCES PESTADOS(ESTA_CVEESTA) ;


ALTER TABLE PEMPLHAS add constraint CC$PEMPLHAS$HONORARIOA
  check (EMPL_HONORARIO IN ('S','N'));

ALTER TABLE PEMPLHAS add constraint CC$PEMPLHAS$CALCISR
  check (empl_CALCISR IN ('S','N'));


ALTER TABLE PEMPLHAS add constraint CC$PEMPLHAS$SERVMED
  check (EMPL_SERVMED IN ('S','N'));


  ALTER TABLE PEMPLHAS Add CONSTRAINT CN$PEMPLHAS$STATUS---checar         
 CHECK (EMPL_STATUS IS NOT NULL) ;

ALTER TABLE PEMPLHAS add constraint CC$PEMPLHAS$STATUS 
  check (EMPL_STATUS IN ('A','P'));


--**************-----------**************--**************-------OK----**************--**************-----------**************



COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_ESCOL IS 'Escolaridad
Escolaridad del Empleado
*' ;

COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_EDOCIV IS 'Estado Civil
Estado Civil del Empleado
*' ;

COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_ESCOL IS 'Escolaridad
Escolaridad del Empleado
*' ;

COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_BANCOD IS 'Banco_Dep
Banco donde se le deposita el pago al Empleado
*' ;

COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_URES_C IS 'Ures_Cobro
Ures donde cobra el Empleado
*' ;


COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_FECHA_BAJA IS 'Fecha_Baja
Fecha de baja
*' ;


COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_HONORARIO IS 'Honorarios
Honorarios Asimilables a Salarios
*' ;


COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_CALCISR IS 'ISR
Calculo de ISR
*' ;


COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_SERVMED IS 'Serv_Medico
Servicio M�dico
*' ;

COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_CIUD_NACI IS 'Ciudad_Nacimiento
Ciudad de Nacimiento
*' ;

COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_EMAIL IS 'Correo_Electr�nico
Correo Electr�nico
*' ;

COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_OBSERVACION IS 'Observaciones
Observaciones
*' ;


COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_COLON_DOMI IS 'Colonia_Domicilio
Colonia Domicilio
*' ;


COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_CVESTATUS IS 'Estatus_Empl
Estatus Empleado
*' ;

COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_CVEMUNI_NA IS 'Municipio_Nacimiento
Municipio de Nacimiento
*' ;

COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_CVEMUNI_DO IS 'Municipio_Domicilio
Municipio Domicilio
*' ;


COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_UBICA IS 'Ubicaci�n
Ubicaci�n Expediente
*' ;

COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_UBICA_D IS 'Ubicaci�n_D
Detalle Ubicaci�n Expediente 
*' ;

COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_STATUS IS 'Estatus
Estatus del Expediente 
*' ;

COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_Sub_FONDO IS 'Sub_Fondo
Sub fondo 
*' ;


COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_MOTIVO_CONT IS 'Motivo_Contrato
Motivos por el cual se realizo la contrataci�n.
*';

COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_OBSER_BAJA  IS'Observ_baja
Observaciones por la baja del empleado
*';

COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_DESC_JUDI IS 'Desc_Judi
Descuento judicial que tiene el empleado
*';

COMMENT ON COLUMN PERSONAL.PEMPLHAS.EMPL_DEPEN_ECO IS 'Dep_Eco
Dependientes econ�micos que tiene el empleado
*';


--**************-----------**************--**************-----------**************--**************-----------**************

CREATE INDEX IX$PEMPLHAS$ESCOL ON PEMPLHAS (EMPL_ESCOL) ;
CREATE INDEX IX$PEMPLHAS$EDOCIV ON PEMPLHAS (EMPL_EDOCIV) ;
CREATE INDEX IX$PEMPLHAS$ESTA ON PEMPLHAS (EMPL_ESTA) ;

--**************-----------**************--**************-----------**************--**************-----------**************

---------------------------------------------
********------------VISTA DE EMPLEADOS HAS --***********************************
--------------------------------------------

CREATE OR REPLACE VIEW PVEMPLHAS AS
SELECT
 PERS_PERSONA	As VEMP_PERSONA,
 PERS_RFC		As VEMP_RFC,
 PERS_NOMBRE	As VEMP_Nombre,
 PERS_APEPAT	As VEMP_ApePat,
 PERS_APEMAT	As VEMP_ApeMat,
 PERS_DIRECCION	As VEMP_Direccion,
 PERS_TELEFONO	As VEMP_Telefono,
 PERS_SEXO		As VEMP_Sexo,
 EMPL_FNACI       AS VEMP_FNACI,
 PERS_ACTIVO	As VEMP_Activo,
 PERS_Foto		As VEMP_Foto,
 'HONORARIOS ASIMILABLES A SALARIOS' AS VEMP_TPSTO,
 'APOYO ADMINISTRATIVO'   AS VEMP_PSTO,
  'I'                AS VEMP_TPLAZA,
  EMPL_Ures_C 	As VEMP_URes_C,
 CALCULA_ANTIG((SELECT MAX(NOMI_FECHA) FROM PHNOMINAS), EMPL_INI, 1) As VEMP_AntigAnios,
 CALCULA_ANTIG((SELECT MAX(NOMI_FECHA) FROM PHNOMINAS), EMPL_INI, 2) 	As VEMP_AntigDias,
 EMPL_INI         AS VEMP_INI,  
 EMPL_FIN         AS VEMP_FIN, 
 EMPL_ESCOL AS VEMP_ESCOL,
 EMPL_EDOCIV As VEMP_EDOCIV,
 EMPL_DESCRIP AS VEMP_DESCRIP,
 EMPL_ABREVIA AS VEMP_ABREVIA,
 EMPL_CURP AS VEMP_CURP,
 EMPL_ESTA AS VEMP_ESTA,
 EMPL_NUMSS AS VEMP_NUMSS,
 EMPL_HONORARIO AS VEMP_HONORARIOA,
 EMPL_CALCISR AS VEMP_CALCISR,
 EMPL_AGUINALDO AS VEMP_AGUINALDO,
 EMPL_PRIMAVAC AS VEMP_PRIMAVAC,
 EMPL_DIAS31 AS VEMP_DIAS31,
 EMPL_BONONAV AS VEMP_BONONAV,
 EMPL_DIASAGUI AS VEMP_DIASAGUI,
 EMPL_SUELDO AS VEMP_SUELDO,
 EMPL_SERVMED AS VEMP_SERVMED,
 EMPL_CVEMUNI_NA AS VEMP_CVEMUNI_NA,
 EMPL_CIUD_NACI AS VEMP_CIUD_NACI,
 EMPL_EMAIL AS VEMP_EMAIL,
 EMPL_OBSERVACION AS VEMP_OBSERVA,
 EMPL_CVEMUNI_DO AS VEMP_CVEMUNI_DO,
 EMPL_COLON_DOMI AS VEMP_COLON_DOMI,
 EMPL_CVEPAIS_NACI AS VEMP_CVEPAIS_NACI,
 EMPL_CVESTATUS AS VEMP_CVESTA,
 EMPL_UBICA AS VEMP_UBICA,
 EMPL_UBICA_D AS VEMP_UBICA_D,
 EMPL_FECHA_BAJA AS VEMP_FBAJA,
 EMPL_MOTIVO_CONT AS VEMP_MOTIVO_CONT,
 EMPL_OBSER_BAJA AS VEMP_OBSERBAJA,
 EMPL_DESC_JUDI AS VEMP_DESCJUDI,
 EMPL_DEPEN_ECO AS VEMP_DEP_ECO,
 EMPL_SUB_FONDO AS VEMP_SUBFONDO,
 EMPL_STATUS AS VEMP_STATUS,
 EMPL_FEC AS VEMP_FEC,
 EMPL_USU AS VEMP_USU
FROM FPersonas, PEMPLHAS
Where 
  EMPL_PERSONA= PERS_Persona;
/



--PERS_EMPLEADO= 'S'

--**************-----------**************--**************-----------**************--**************-----------**************


CREATE PUBLIC SYNONYM PVEMPLHAS FOR PERSONAL.PVEMPLHAS;

COMMENT ON TABLE PERSONAL.PVEMPLHAS IS 'Vista de Empleados HAS
Vista de Empleados por Honorarios Asimilables a Salarios' ;

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_PERSONA IS 'Empleado
Clave del Empleado
00
*S';

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_RFC IS 'RFC
RFC
01
*S';

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_NOMBRE IS 'Nombre
Nombre del Empleado
02
*S';


COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_ApePat IS 'Apellido Paterno
Apellido Paterno del Empleado
03
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_ApeMat IS 'Apellido Materno
Apellido Materno del Empleado
04
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_Direccion IS 'Direccion
Direccion del Empleado, donde vive
*';


COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_Telefono IS 'Telefono(s)
Telefono(s) del Empleado
*';


COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_Sexo IS 'Sexo
Sexo del Empleado (M= Masculino F=Femenino)
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_Activo IS 'Activo
Indica si el Empleado esta o no Activo (S=Si N=No)
05
*S' ;


COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_CURP IS 'Curp
Curp del Empleado
06
*S' ;

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_Foto IS 'Foto
Fotografia del empleado
*';


COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_AntigAnios IS 'Anios de Antiguedad
Anios de Antiguedad
*';

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_AntigDias IS 'Dias de Antiguedad
Dias de Antiguedad
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_FNACI IS 'F. Nacimiento
Fecha de Nacimiento
*';

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_TPSTO IS 'TPuesto
Descripci�n del Tipo de Puesto
07
*S';


COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_PSTO IS 'Puesto
Descripci�n del Puesto
08
*S';


COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_TPLAZA IS 'TPlaza
Descripci�n del Tipo de Plaza
09
*S';


COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_URes_C IS 'Ures_cobro
Ures donde cobra el trabajador
*';

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_INI IS 'Ini
Inicio del Nombramiento
10
*S';

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_FIN IS 'Fin
fin del Nombramiento
11
*S';


COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_ESCOL IS 'Escolaridad 
Nivel de Escolaridad del Empleado
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_EDOCIV IS 'Estado civil
Estado civil
*' ;


COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_DESCRIP IS 'Descripcion
Descripcion de la Escolaridad
*';


COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_ABREVIA IS 'Abreviatura
Abreviatura de la Escolaridad
*';

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_ESTA IS 'Estado
Estado de Nacimiento
*';

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_NUMSS IS 'Seguro Social
N�mero de Seguridad Social
*';

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_HONORARIOA IS 'Honorarios
Honorarios Asimilables a Salarios
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_CALCISR IS 'ISR
Calculo de ISR
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_AGUINALDO IS 'Aguinaldo
Pago de Aguinaldo
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_PRIMAVAC IS 'Prima
Pago de Prima Vacacional
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_DIAS31 IS 'Dias31
Pago de Dias 31
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_BONONAV IS 'Bono
Pago de Bono Navide�o
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_DIASAGUI IS 'Dias
Dias de Aguinaldo
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_SUELDO IS 'Sueldo
Sueldo Mensual
*';

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_SERVMED IS 'Serv_Medico
Servicio M�dico
*' ;
COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_CIUD_NACI IS 'Ciudad_Nacimiento
Ciudad de Nacimiento
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_EMAIL IS 'Correo_Electr�nico
Correo Electr�nico
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_OBSERVA IS 'Observaciones
Observaciones
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_CVEMUNI_DO IS 'Municipio_Domicilio
Municipio Domicilio
*';


COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_COLON_DOMI IS 'Colonia_Domicilio
Colonia Domicilio
*';


COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_UBICA IS 'Ubicacion
Ubicaci�n del Expediente
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_UBICA_D IS 'Ubicacion_D
Detalle de la Ubicaci�n del Expediente
*' ;

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_STATUS IS 'Estatus
Estatus del Expediente (A=en Archivero   P=en Prestamo)
*' ;
COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_FBAJA IS 'Fecha Baja
Fecha de baja del prestador de servicio
12
*S'; 


COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_USU IS 'Usuario
Usuario que Realizo el Movimiento
13
*S';

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_FEC IS 'Fecha_Movto
Fecha de Alta del Movimiento
14
*S';

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_MOTIVO_CONT IS 'Motivo_Contrato
Motivos por el cual se realizo la contrataci�n.
*';

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_OBSERBAJA IS 'Observ_baja
Observaciones por la baja del empleado
*';

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_DESCJUDI IS 'Desc_Judi
Descuento judicial que tiene el empleado
*';

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_DEP_ECO IS 'Dep_Eco
Dependientes econ�micos que tiene el empleado
*';

COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_SUBFONDO  IS'Subfondo
Subfondo
*';


COMMENT ON COLUMN PERSONAL.PVEMPLHAS.VEMP_CVESTA IS 'Estatus_Empl
Estatus Empleado
*' ;


--**************-----------**************--**************--ok---------**************--**************-----------**************
--**************-----------**************--**************-ok----------**************--**************-----------**************


create or replace trigger TII_PVEMPLHAS 
instead of insert on PVEMPLHAS  for each row
declare
  curp varchar2(18) ;
begin

 if :new.vemp_fnaci >= sysdate then
    raise_application_error(-20001,'La fecha de nacimiento debe ser menor o igual a la fecha de hoy');
 end if;


-- Insertamos en Personas
 INSERT INTO FPERSONAS
 (PERS_Persona, PERS_RFC, PERS_Nombre, PERS_ApePat,
  PERS_ApeMat,  PERS_Direccion, PERS_Telefono,
   PERS_Sexo, PERS_PROVEEDOR,PERS_HONOASIM, PERS_Activo,PERS_TIPO)
 VALUES
 (:new.VEMP_PERSONA, :new.VEMP_RFC, :new.VEMP_Nombre, :new.VEMP_ApePat,
  :new.VEMP_ApeMat, :new.VEMP_Direccion, :new.VEMP_Telefono,
  :new.VEMP_Sexo, 'S','S', :new.VEMP_Activo,2) ;

 if (:new.vemp_curp is null) then
    curp := NOM$CURP(:new.VEMP_Apepat, :new.VEMP_Apemat, :new.VEMP_Nombre,
            :new.VEMP_Fnaci, :new.VEMP_Sexo, :new.VEMP_Esta) ;
 else
     curp := :new.VEMP_Curp ;
 end if ;


-- Insertamos en PEMPLHAS
 INSERT INTO PEMPLHAS
  (EMPL_PERSONA,  EMPL_FNACI, EMPL_INI, EMPL_FIN, 
   EMPL_ESCOL, EMPL_EDOCIV,EMPL_DESCRIP, EMPL_ABREVIA, EMPL_CURP, EMPL_ESTA,
   EMPL_NUMSS, EMPL_URes_c, 
   --NUEVOS DATOS PARA EXTERNOS
   EMPL_HONORARIO,  EMPL_CALCISR, EMPL_AGUINALDO, EMPL_PRIMAVAC,
   EMPL_DIAS31, EMPL_BONONAV, EMPL_DIASAGUI, EMPL_SERVMED,
   --NUEVOS DATOS DE EMPLEADOS
   EMPL_CVEMUNI_NA, EMPL_CIUD_NACI, EMPL_EMAIL, EMPL_OBSERVACION, EMPL_CVEMUNI_DO, 
   EMPL_COLON_DOMI,  EMPL_CVEPAIS_NACI, EMPL_CVESTATUS, EMPL_UBICA, EMPL_UBICA_D, EMPL_STATUS,
   
   EMPL_SUELDO,EMPL_FECHA_BAJA,EMPL_MOTIVO_CONT,EMPL_OBSER_BAJA,
   EMPL_DESC_JUDI,EMPL_DEPEN_ECO,EMPL_SUB_FONDO,EMPL_FEC,EMPL_USU)
 VALUES
  (:new.VEMP_PERSONA, 
     :NEW.VEMP_FNACI, :NEW.VEMP_INI, :NEW.VEMP_FIN, 
     :NEW.VEMP_ESCOL, :NEW.VEMP_EDOCIV, :NEW.VEMP_DESCRIP, :NEW.VEMP_ABREVIA,
     CURP, :NEW.VEMP_ESTA,:NEW.VEMP_NUMSS, :new.VEMP_URes_c,
     
     :new.VEMP_HONORARIOA, :new.VEMP_CALCISR,:new.VEMP_AGUINALDO,
     :new.VEMP_PRIMAVAC,:new.VEMP_DIAS31,:new.VEMP_BONONAV,:new.VEMP_DIASAGUI, :NEW.VEMP_SERVMED,

     :new.VEMP_CVEMUNI_NA, :new.VEMP_CIUD_NACI, :new.VEMP_EMAIL, :new.VEMP_OBSERVA, :new.VEMP_CVEMUNI_DO,
      :new.VEMP_COLON_DOMI, :new.VEMP_CVEPAIS_NACI, :new.VEMP_CVESTA, :new.VEMP_UBICA,
     :new.VEMP_UBICA_D, :new.VEMP_STATUS, :new.VEMP_SUELDO,  :new.VEMP_FBAJA, :new.VEMP_MOTIVO_CONT,
     :new.VEMP_OBSERBAJA, :new.VEMP_DESCJUDI,:new.VEMP_DEP_ECO,:new.VEMP_SUBFONDO, SYSDATE,USER) ;

end ;
/

--**************-----------**************--**************-----------**************--**************-----------**************
--**************-----------**************--**************SIP-----------**************--**************-----------**************


create or replace trigger TIU_PVEMPLHAS
instead of update on PVEMPLHAS  for each row
declare
 tt varchar2(30) ;
 curp varchar2(18) ;


begin


 if :new.vemp_fnaci >= sysdate then
    raise_application_error(-20001,'La fecha de Nacimiento debe ser menor o igual a la fecha de hoy');
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
      PERS_Sexo= :new.VEMP_Sexo
     Where PERS_Persona= :new.VEMP_Persona ;

     if (:new.vemp_curp is null) then
        curp := NOM$CURP(:new.VEMP_Apepat, :new.VEMP_Apemat, :new.VEMP_Nombre,
                :new.VEMP_Fnaci, :new.VEMP_Sexo, :new.VEMP_Esta) ;
     else
         curp := :new.VEMP_Curp ;
     end if ;

    -- Cambiamos PATREMPL
     UPDATE PEMPLHAS Set
      EMPL_FNACI = :NEW.VEMP_FNACI,
      EMPL_ESCOL = :NEW.VEMP_ESCOL,
      EMPL_EDOCIV = :NEW.VEMP_EDOCIV,
      EMPL_DESCRIP = :NEW.VEMP_DESCRIP,
      EMPL_ABREVIA = :NEW.VEMP_ABREVIA,
      EMPL_CURP = CURP,
      EMPL_ESTA = :NEW.VEMP_ESTA,
      EMPL_NUMSS = :NEW.VEMP_NUMSS,
      EMPL_HONORARIO =:new.VEMP_HONORARIOA,
      EMPL_CALCISR =:new.VEMP_CALCISR,
      EMPL_AGUINALDO =:new.VEMP_AGUINALDO,
      EMPL_PRIMAVAC =:new.VEMP_PRIMAVAC,
      EMPL_DIAS31 =:new.VEMP_DIAS31,
      EMPL_BONONAV =:new.VEMP_BONONAV,
      EMPL_DIASAGUI =:new.VEMP_DIASAGUI,
      EMPL_SERVMED =:new.VEMP_SERVMED,
      EMPL_CVEMUNI_NA =:new.VEMP_CVEMUNI_NA,
      EMPL_CIUD_NACI =:new.VEMP_CIUD_NACI,
      EMPL_EMAIL =:new.VEMP_EMAIL,
      EMPL_OBSERVACION =:new.VEMP_OBSERVA,
      EMPL_CVEMUNI_DO =:new.VEMP_CVEMUNI_DO,
      EMPL_COLON_DOMI =:new.VEMP_COLON_DOMI,
      EMPL_CVEPAIS_NACI =:new.VEMP_CVEPAIS_NACI,
      EMPL_CVESTATUS =:new.VEMP_CVESTA,
      EMPL_UBICA =:new.VEMP_UBICA,
      EMPL_UBICA_D =:new.VEMP_UBICA_D,
      EMPL_STATUS =:new.VEMP_STATUS,
      EMPL_SUELDO= :NEW.VEMP_SUELDO,
      EMPL_FECHA_BAJA= :NEW.VEMP_FBAJA,
      EMPL_MOTIVO_CONT= :NEW.VEMP_MOTIVO_CONT,
      EMPL_OBSER_BAJA=:NEW.VEMP_OBSERBAJA,
      EMPL_DESC_JUDI=:NEW.VEMP_DESCJUDI,
      EMPL_DEPEN_ECO=:NEW.VEMP_DEP_ECO,
      EMPL_SUB_FONDO=:NEW.VEMP_SUBFONDO
     Where EMPL_PERSONA= :new.VEMP_PERSONA
     Returning rowid into tt ;


    -- Insertamos en PATREMPL si no existe registro
     if tt is null then

     INSERT INTO PEMPLHAS
        (EMPL_PERSONA,   EMPL_FNACI, EMPL_INI, EMPL_FIN,
        EMPL_ESCOL, EMPL_EDOCIV,EMPL_DESCRIP, EMPL_ABREVIA, EMPL_CURP, EMPL_ESTA,
        EMPL_NUMSS, EMPL_URes_c,
      --NUEVOS DATOS PARA EXTERNOS
        EMPL_HONORARIO,  EMPL_CALCISR, EMPL_AGUINALDO, EMPL_PRIMAVAC,
        EMPL_DIAS31, EMPL_BONONAV, EMPL_DIASAGUI, EMPL_SERVMED,
      --NUEVOS DATOS DE EMPLEADOS
       EMPL_CVEMUNI_NA, EMPL_CIUD_NACI, EMPL_EMAIL, EMPL_OBSERVACION, EMPL_CVEMUNI_DO,
       EMPL_COLON_DOMI,  EMPL_CVEPAIS_NACI, EMPL_CVESTATUS, EMPL_UBICA, EMPL_UBICA_D, EMPL_STATUS,
       EMPL_SUELDO,EMPL_FECHA_BAJA,EMPL_MOTIVO_CONT,EMPL_OBSER_BAJA,
       EMPL_DESC_JUDI,EMPL_DEPEN_ECO,EMPL_SUB_FONDO,EMPL_FEC,EMPL_USU)
    VALUES
       (:new.VEMP_PERSONA, 
       :NEW.VEMP_FNACI, :NEW.VEMP_INI, :NEW.VEMP_FIN,
       :NEW.VEMP_ESCOL, :NEW.VEMP_EDOCIV, :NEW.VEMP_DESCRIP, :NEW.VEMP_ABREVIA,
       CURP, :NEW.VEMP_ESTA,:NEW.VEMP_NUMSS,  :new.VEMP_URes_c,
       :new.VEMP_HONORARIOA, :new.VEMP_CALCISR,:new.VEMP_AGUINALDO,
       :new.VEMP_PRIMAVAC,:new.VEMP_DIAS31,:new.VEMP_BONONAV,:new.VEMP_DIASAGUI, :NEW.VEMP_SERVMED,
       :new.VEMP_CVEMUNI_NA, :new.VEMP_CIUD_NACI, :new.VEMP_EMAIL, :new.VEMP_OBSERVA, :new.VEMP_CVEMUNI_DO,
       :new.VEMP_COLON_DOMI, :new.VEMP_CVEPAIS_NACI, :new.VEMP_CVESTA, :new.VEMP_UBICA,
       :new.VEMP_UBICA_D, :new.VEMP_STATUS, :new.VEMP_SUELDO,  :new.VEMP_FBAJA, :new.VEMP_MOTIVO_CONT,
       :new.VEMP_OBSERBAJA, :new.VEMP_DESCJUDI,:new.VEMP_DEP_ECO,:new.VEMP_SUBFONDO, SYSDATE,USER) ;

     end if ;

ELSE

    -- Cambiamos FPersonas
     UPDATE FPERSONAS Set
      PERS_RFC= :new.VEMP_RFC,
      PERS_Nombre= :new.VEMP_Nombre,
      PERS_ApePat= :new.VEMP_ApePat,
      PERS_ApeMat= :new.VEMP_ApeMat,
      PERS_Direccion= :new.VEMP_Direccion,
      PERS_Telefono= :new.VEMP_Telefono,
      PERS_Sexo= :new.VEMP_Sexo,
      PERS_Activo= :new.VEMP_Activo
     Where PERS_Persona= :new.VEMP_Persona ;


     if (:new.vemp_curp is null) then
        curp := NOM$CURP(:new.VEMP_Apepat, :new.VEMP_Apemat, :new.VEMP_Nombre,
                :new.VEMP_Fnaci, :new.VEMP_Sexo, :new.VEMP_Esta) ;
     else
         curp := :new.VEMP_Curp ;
     end if ;

    -- Cambiamos PATREMPL
     UPDATE PEMPLHAS Set
      EMPL_FNACI = :NEW.VEMP_FNACI,
      EMPL_ESCOL = :NEW.VEMP_ESCOL,
      EMPL_EDOCIV = :NEW.VEMP_EDOCIV,
      EMPL_DESCRIP = :NEW.VEMP_DESCRIP,
      EMPL_ABREVIA = :NEW.VEMP_ABREVIA,
      EMPL_CURP = CURP,
      EMPL_ESTA = :NEW.VEMP_ESTA,
      EMPL_NUMSS = :NEW.VEMP_NUMSS,
      EMPL_HONORARIO =:new.VEMP_HONORARIOA,
      EMPL_CALCISR =:new.VEMP_CALCISR,
      EMPL_AGUINALDO =:new.VEMP_AGUINALDO,
      EMPL_PRIMAVAC =:new.VEMP_PRIMAVAC,
      EMPL_DIAS31 =:new.VEMP_DIAS31,
      EMPL_BONONAV =:new.VEMP_BONONAV,
      EMPL_DIASAGUI =:new.VEMP_DIASAGUI,
      EMPL_SERVMED =:new.VEMP_SERVMED,
      EMPL_CVEMUNI_NA =:new.VEMP_CVEMUNI_NA,
      EMPL_CIUD_NACI =:new.VEMP_CIUD_NACI,
      EMPL_EMAIL =:new.VEMP_EMAIL,
      EMPL_OBSERVACION =:new.VEMP_OBSERVA,
      EMPL_CVEMUNI_DO =:new.VEMP_CVEMUNI_DO,
      EMPL_COLON_DOMI =:new.VEMP_COLON_DOMI,
      EMPL_CVEPAIS_NACI =:new.VEMP_CVEPAIS_NACI,
      EMPL_CVESTATUS =:new.VEMP_CVESTA,
      EMPL_UBICA =:new.VEMP_UBICA,
      EMPL_UBICA_D =:new.VEMP_UBICA_D,
      EMPL_STATUS =:new.VEMP_STATUS,
      EMPL_SUELDO= :NEW.VEMP_SUELDO,
      EMPL_FECHA_BAJA= :NEW.VEMP_FBAJA,
      EMPL_MOTIVO_CONT= :NEW.VEMP_MOTIVO_CONT,
      EMPL_OBSER_BAJA=:NEW.VEMP_OBSERBAJA,
      EMPL_DESC_JUDI=:NEW.VEMP_DESCJUDI,
      EMPL_DEPEN_ECO=:NEW.VEMP_DEP_ECO,
      EMPL_SUB_FONDO=:NEW.VEMP_SUBFONDO
   WHERE EMPL_PERSONA= :new.VEMP_PERSONA
     Returning rowid into tt ;


    -- Insertamos en PATREMPL si no existe registro
   if tt is null then

     INSERT INTO PEMPLHAS
      (EMPL_PERSONA,   EMPL_FNACI, EMPL_INI, EMPL_FIN,
       EMPL_ESCOL, EMPL_EDOCIV,EMPL_DESCRIP, EMPL_ABREVIA, EMPL_CURP, EMPL_ESTA,
       EMPL_NUMSS, EMPL_URes_c,
      --NUEVOS DATOS PARA EXTERNOS
       EMPL_HONORARIO,  EMPL_CALCISR, EMPL_AGUINALDO, EMPL_PRIMAVAC,
       EMPL_DIAS31, EMPL_BONONAV, EMPL_DIASAGUI, EMPL_SERVMED,
       --NUEVOS DATOS DE EMPLEADOS
       EMPL_CVEMUNI_NA, EMPL_CIUD_NACI, EMPL_EMAIL, EMPL_OBSERVACION, EMPL_CVEMUNI_DO,
       EMPL_COLON_DOMI,  EMPL_CVEPAIS_NACI, EMPL_CVESTATUS, EMPL_UBICA, EMPL_UBICA_D, EMPL_STATUS,
       EMPL_SUELDO,EMPL_FECHA_BAJA,EMPL_MOTIVO_CONT,EMPL_OBSER_BAJA,
       EMPL_DESC_JUDI,EMPL_DEPEN_ECO,EMPL_SUB_FONDO,EMPL_FEC,EMPL_USU)
     VALUES
        (:new.VEMP_PERSONA, 
        :NEW.VEMP_FNACI, :NEW.VEMP_INI, :NEW.VEMP_FIN,
        :NEW.VEMP_ESCOL, :NEW.VEMP_EDOCIV, :NEW.VEMP_DESCRIP, :NEW.VEMP_ABREVIA,
         CURP, :NEW.VEMP_ESTA,:NEW.VEMP_NUMSS,  :new.VEMP_URes_c,
        :new.VEMP_HONORARIOA, :new.VEMP_CALCISR,:new.VEMP_AGUINALDO,
        :new.VEMP_PRIMAVAC,:new.VEMP_DIAS31,:new.VEMP_BONONAV,:new.VEMP_DIASAGUI, :NEW.VEMP_SERVMED,
         :new.VEMP_CVEMUNI_NA, :new.VEMP_CIUD_NACI, :new.VEMP_EMAIL, :new.VEMP_OBSERVA, :new.VEMP_CVEMUNI_DO,
        :new.VEMP_COLON_DOMI, :new.VEMP_CVEPAIS_NACI, :new.VEMP_CVESTA, :new.VEMP_UBICA,
        :new.VEMP_UBICA_D, :new.VEMP_STATUS, :new.VEMP_SUELDO,  :new.VEMP_FBAJA, :new.VEMP_MOTIVO_CONT,
        :new.VEMP_OBSERBAJA, :new.VEMP_DESCJUDI,:new.VEMP_DEP_ECO,:new.VEMP_SUBFONDO, SYSDATE,USER) ;

    end if ;
END IF;



end ;
/

--**************-----------**************--**************----sip-------**************--**************-----------**************


--**************-----------**************--NO crear**************-----------**************--**************-----------**************








********************CREAR TABLA CATALOGO EMPLEADO**********SIP*******************

create table PHCATEMPL
(
  CATE_EMPL  VARCHAR2(12) not null,
  CATE_PSTO  VARCHAR2(10) not null,
  CATE_CATEG VARCHAR2(10)
);


CREATE PUBLIC SYNONYM PHCATEMPL FOR PERSONAL.PHCATEMPL ;




-- Add comments to the table 
comment on table PHCATEMPL
  is 'Homologacion de Empleados
Tabla de categorias por Empleado-Puesto';
-- Add comments to the columns 
comment on column PHCATEMPL.CATE_EMPL
  is 'Empleado
Clave del Empleado
*';
comment on column PHCATEMPL.CATE_PSTO
  is 'Puesto
Clave del Puesto
*';
comment on column PHCATEMPL.CATE_CATEG
  is 'Categoria
Clave de la Categoria
*';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PHCATEMPL
  add constraint PK$PHCATEMPL$PSTO primary key (CATE_EMPL, CATE_PSTO);

-- Create/Recreate indexes 
create index IX$PHCATEMPL$CATEG on PHCATEMPL (CATE_CATEG);
create index IX$PHCATEMPL$EMPL on PHCATEMPL (CATE_EMPL);
create index IX$PhCATEMPL$PSTO on PHCATEMPL (CATE_PSTO);
  
-- Grant/Revoke object privileges 
grant select on PHCATEMPL to ESCO;
grant select on PHCATEMPL to MEDICOS;
grant select on PHCATEMPL to PERFILMASTER;
grant select on PHCATEMPL to REPDOC;
grant select on PHCATEMPL to SYSTCALPROF;


