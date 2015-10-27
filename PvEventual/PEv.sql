--ACTUALIZA LA PANTALLA DE EVENTUALES (PVEVENTUAL.DLL)

--***************************-----------***************************---------
CONNECT SHAKE/SHAKE@BD
--***************************-----------***************************---------

Update Smodulos 
 Set Modu_Reporte = 'S'
Where Modu_Modulo = 'PVEVENTUAL';

INSERT INTO SREFDESC(REFD_CAMPO, REFD_SCRIPT, REFD_SQL)
 VALUES('DIRIGIDO','PEV.SQL','Select nomb_nomb as Nomb,
   Substr(pers_nombre || ' ' || pers_apepat || ' ' || pers_apemat,1,50) As Nombre,
    nomb_empl As Cve_Empl, nomb_descrip As Puesto, ures_descrip As Ures
   from pnombram, fpersonas, pplazas, ppuestos, fures
   where plaz_plaza = nomb_plaza 
    and pers_persona = nomb_empl
    and pues_psto = plaz_psto
    and pues_tpsto = 'MS'
    and ures_ures = plaz_ures');


INSERT INTO SREFDESC(REFD_CAMPO, REFD_SCRIPT, REFD_SQL)
 VALUES('COPIAU','PEV.SQL','Select nomb_nomb as Nomb,
   Substr(pers_nombre || ' ' || pers_apepat || ' ' || pers_apemat,1,50) As Nombre,
    nomb_empl As Cve_Empl, nomb_descrip As Puesto, ures_descrip As Ures
   from pnombram, fpersonas, pplazas, ppuestos, fures
   where plaz_plaza = nomb_plaza 
    and pers_persona = nomb_empl
    and pues_psto = plaz_psto
    and pues_tpsto = 'MS'
    and ures_ures = plaz_ures');


INSERT INTO SREFDESC(REFD_CAMPO, REFD_SCRIPT, REFD_SQL)
 VALUES('COPIAD','PEV.SQL','Select nomb_nomb as Nomb,
   Substr(pers_nombre || ' ' || pers_apepat || ' ' || pers_apemat,1,50) As Nombre,
    nomb_empl As Cve_Empl, nomb_descrip As Puesto, ures_descrip As Ures
   from pnombram, fpersonas, pplazas, ppuestos, fures
   where plaz_plaza = nomb_plaza 
    and pers_persona = nomb_empl
    and pues_psto = plaz_psto
    and pues_tpsto = 'MS'
    and ures_ures = plaz_ures');


INSERT INTO SREFDESC(REFD_CAMPO, REFD_SCRIPT, REFD_SQL)
 VALUES('COPIAT','PEV.SQL','Select
   pers_persona as pers,
   Substr(pers_nombre || ' ' || pers_apepat || ' ' || pers_apemat,1,50) As Nombre
  from fpersonas
  where pers_activo = 'S'');

commit;

--***************************-----------***************************---------
CONNECT PERSONAL/PERSONAL@BD
--***************************-----------***************************---------

--------------------
---- Eventuales ----
--------------------

CREATE TABLE PEVENTUAL
(
  EVEN_EVEN NUMBER(10) not null,
  EVEN_EMPL VARCHAR2(12),
  EVEN_NOMB NUMBER(10),
  EVEN_NOMINA NUMBER(10),
  EVEN_FECINI DATE,
  EVEN_FECFIN DATE,
  EVEN_USU VARCHAR2(30) default USER,
  EVEN_FEC DATE default SYSDATE
) ;


ALTER TABLE PEVENTUAL ADD EVEN_CONT VARCHAR2(12);

ALTER TABLE PEVENTUAL ADD EVEN_FECHA DATE;

ALTER TABLE PEVENTUAL ADD EVEN_MOTIVO VARCHAR2(200);

ALTER TABLE PEVENTUAL ADD EVEN_DIRIGIDO VARCHAR2(10);

ALTER TABLE PEVENTUAL ADD EVEN_COPIAU VARCHAR2(10);

ALTER TABLE PEVENTUAL ADD EVEN_COPIAD VARCHAR2(10);

ALTER TABLE PEVENTUAL ADD EVEN_COPIAT VARCHAR2(12);

ALTER TABLE PEVENTUAL ADD EVEN_INGRESO DATE;

ALTER TABLE PEVENTUAL ADD EVEN_BAJA DATE;


CREATE SEQUENCE PSQEVENTUAL START WITH 1 ORDER CACHE 10 ;

CREATE PUBLIC SYNONYM PEVENTUAL FOR PERSONAL.PEVENTUAL ;
CREATE PUBLIC SYNONYM PSQEVENTUAL FOR PERSONAL.PSQEVENTUAL ;

CREATE INDEX IX$PEVENTUAL$Empl ON PEVENTUAL (EVEN_Empl) ;
CREATE INDEX IX$PEVENTUAL$Nomb ON PEVENTUAL (EVEN_Nomb) ;
CREATE INDEX IX$PEVENTUAL$Nomina ON PEVENTUAL (EVEN_Nomina) ;

ALTER TABLE PEVENTUAL ADD CONSTRAINT PK$PEVENTUAL$Even
 PRIMARY KEY (EVEN_Even) ;
ALTER TABLE PEVENTUAL ADD CONSTRAINT NN$PEVENTUAL$Empl
 CHECK (EVEN_Empl is not null) ;
ALTER TABLE PEVENTUAL ADD CONSTRAINT FK$PEVENTUAL$Empl
 FOREIGN KEY (EVEN_Empl) REFERENCES FPERSONAS ;
ALTER TABLE PEVENTUAL ADD CONSTRAINT NN$PEVENTUAL$Nomb
 CHECK (EVEN_Nomb is not null) ;
ALTER TABLE PEVENTUAL ADD CONSTRAINT FK$PEVENTUAL$Nomb
 FOREIGN KEY (EVEN_Nomb) REFERENCES PNOMBRAM ON DELETE CASCADE ;
ALTER TABLE PEVENTUAL ADD CONSTRAINT NN$PEVENTUAL$FecIni
 CHECK (EVEN_FecIni is not null) ;
ALTER TABLE PEVENTUAL ADD CONSTRAINT NN$PEVENTUAL$FecFin
 CHECK (EVEN_FecFin is not null) ;
ALTER TABLE PEVENTUAL ADD CONSTRAINT CC$PEVENTUAL$FecFin
 CHECK (EVEN_FecFin >= EVEN_FecIni) ;
ALTER TABLE PEVENTUAL ADD CONSTRAINT NN$PEVENTUAL$Cont
 CHECK (EVEN_Cont is not null) ;


ALTER TABLE PEVENTUAL ADD CONSTRAINT NN$PEVENTUAL$Ingreso
 CHECK (EVEN_Ingreso is not null) ;
ALTER TABLE PEVENTUAL ADD CONSTRAINT NN$PEVENTUAL$Baja
 CHECK (EVEN_Baja is not null) ;
ALTER TABLE PEVENTUAL ADD CONSTRAINT CC$PEVENTUAL$Ingreso
 CHECK (EVEN_Ingreso <= EVEN_Baja) ;


INSERT INTO SERRMES(ERRM_REFER, ERRM_MENSAJE, ERRM_SCRIPT)
 VALUES ('PERSONAL.CC$PEVENTUAL$FECFIN', 'Fecha Final no puede ser Menor a Fecha Inicial', 'PEV') ;


INSERT INTO SERRMES(ERRM_REFER, ERRM_MENSAJE, ERRM_SCRIPT)
 VALUES ('PERSONAL.CC$PEVENTUAL$INGRESO', 'Fecha Baja no puede ser Menor a Fecha Ingreso', 'PEV') ;


COMMIT;


COMMENT ON TABLE PEVENTUAL IS 'Tabla de Eventuales' ;

COMMENT ON COLUMN PEVENTUAL.EVEN_Even IS 'Eventual
Clave del Eventual
*' ;

COMMENT ON COLUMN PEVENTUAL.EVEN_Empl IS 'Empleado
Empleado
*' ;

COMMENT ON COLUMN PEVENTUAL.EVEN_Nomb IS 'Nombramiento
Nombramiento
*' ;

COMMENT ON COLUMN PEVENTUAL.EVEN_Nomina IS 'Nomina
Nomina donde se Aplica el pago
*' ;

COMMENT ON COLUMN PEVENTUAL.EVEN_FecIni IS 'Fecha Inicial
Fecha Inicial del Eventual
*' ;

COMMENT ON COLUMN PEVENTUAL.EVEN_FecFin IS 'Fecha Final
Fecha Final del Eventual
*' ;

COMMENT ON COLUMN PEVENTUAL.EVEN_Ingreso IS 'Ingreso
Fecha Ingreso del Eventual
*' ;

COMMENT ON COLUMN PEVENTUAL.EVEN_Baja IS 'Baja
Fecha Baja del Eventual
*' ;


COMMENT ON COLUMN PEVENTUAL.EVEN_Cont IS 'Contrato
Número de Contrato
*' ;

COMMENT ON COLUMN PEVENTUAL.EVEN_Fecha IS 'Fecha
Fecha de Contratación
*' ;

COMMENT ON COLUMN PEVENTUAL.EVEN_Motivo IS 'Motivo
Motivo de la Contratación
*' ;

COMMENT ON COLUMN PEVENTUAL.EVEN_Dirigido IS 'Dirigido a
Persona a la que va dirigido el Oficio
*' ;

COMMENT ON COLUMN PEVENTUAL.EVEN_CopiaU IS 'Copia1
Primera Copia
*' ;
COMMENT ON COLUMN PEVENTUAL.EVEN_CopiaD IS 'Copia2
Segunda Copia
*' ;
COMMENT ON COLUMN PEVENTUAL.EVEN_CopiaT IS 'Copia3
Tercera Copia
*' ;

comment on column PEVENTUAL.EVEN_USU is 'Usuario
Usuario que Agregó o Modificó el Registro
*';

comment on column PEVENTUAL.EVEN_FEC is 'Fecha
Fecha de Creación o Modificación del Registro
*';



-- Insertamos en tipos de Empleado
INSERT INTO PTEMPLS VALUES ('E', 'Eventual') ;


------------------------------------------------------------------------------------
------------------------------------
---- Dias que Cubre el Eventual ----
------------------------------------

CREATE TABLE PDEVENTUAL
(
 DEVE_Even	Number(10,0),
 DEVE_Dia	Date
) ;

CREATE PUBLIC SYNONYM PDEVENTUAL FOR PERSONAL.PDEVENTUAL ;

CREATE INDEX IX$PDEVENTUAL$Even ON PDEVENTUAL (DEVE_Even) ;

ALTER TABLE PDEVENTUAL ADD CONSTRAINT NN$PDEVENTUAL$Dia
 CHECK (DEVE_Dia is not null) ;
ALTER TABLE PDEVENTUAL ADD CONSTRAINT CC$PDEVENTUAL$Dia
 CHECK ( TO_Char(DEVE_Dia,'D') NOT IN ('6','7') ) ;

INSERT INTO SERRMES(ERRM_REFER, ERRM_MENSAJE, ERRM_SCRIPT)
 VALUES ('PERSONAL.CC$PDEVENTUAL$DIA', 'Dia de Eventual no puede ser Sabado ni Domingo', 'PTABADIC') ;


COMMENT ON TABLE PDEVENTUAL IS 'Dias que cubre el eventual' ;

COMMENT ON COLUMN PDEVENTUAL.DEVE_Even is 'Eventual
Eventual
*' ;

COMMENT ON COLUMN PDEVENTUAL.DEVE_Dia is 'Dia
Dia
*' ;




----------------------------------------------------------------------------------------------------------------
------------------------------------
---- Guardias que Cubre el Eventual ----
------------------------------------

CREATE TABLE PGEVENTUAL
(
 GEVE_Even	Number(10,0),
 GEVE_Dia	Date,
 GEVE_Turno varchar2(1)
) ;

CREATE PUBLIC SYNONYM PGEVENTUAL FOR PERSONAL.PGEVENTUAL ;

ALTER TABLE PGEVENTUAL ADD CONSTRAINT NN$PGEVENTUAL$Dia
 CHECK (GEVE_Dia is not null) ;
ALTER TABLE PGEVENTUAL ADD CONSTRAINT CC$PGEVENTUAL$Dia
 CHECK ( TO_Char(GEVE_Dia,'D') IN ('7','1') ) ;

INSERT INTO SERRMES(ERRM_REFER, ERRM_MENSAJE, ERRM_SCRIPT)
 VALUES ('PERSONAL.CC$PGEVENTUAL$DIA', 'Dia de Guardia de Eventual debe ser Sabado o Domingo', 'PTABADIC') ;


CREATE INDEX IX$PGEVENTUAL$Even ON PGEVENTUAL (GEVE_Even) ;

COMMENT ON TABLE PGEVENTUAL IS 'Guardias que cubre el eventual' ;

COMMENT ON COLUMN PGEVENTUAL.GEVE_Even is 'Eventual
Eventual
*' ;

COMMENT ON COLUMN PGEVENTUAL.GEVE_Dia is 'Dia
Dia que cubre (Debe ser Sabado o Domingo)
*' ;

COMMENT ON COLUMN PGEVENTUAL.GEVE_Turno is 'Turno
Turno de la Guardia
*' ;



----------------------------------------------------------------------------------------------------------------
-----------------------------
---- Vista de Eventuales ----
-----------------------------

INSERT INTO SMODULOS (MODU_MODULO, MODU_PRED, MODU_DESCRIP, MODU_Detalle, MODU_Inserta, MODU_Edita, MODU_Borra, MODU_SCRIPT) 
  VALUES ('PVEVENTUAL', 'PPLAXS', 'Eventuales', 'S', 'S', 'S', 'S', 'PTABADIC') ;


CREATE OR REPLACE VIEW PVEVENTUAL AS
SELECT
 EVEN_Even	As VEVE_Even,
 EVEN_Empl	As VEVE_Empl,
 SUBSTR(A.PERS_APEPAT ||' '|| A.PERS_APEMAT ||' '|| A.PERS_NOMBRE,1,45) As VEVE_Nombre,
 SUBSTR(b.PERS_APEPAT ||' '|| b.PERS_APEMAT ||' '|| b.PERS_NOMBRE,1,45) As VEVE_Sustituye_A,
 EVEN_Nomb	As VEVE_Nomb,
 PUES_Descrip AS VEVE_Puesto,
 Ures_Ures As VEVE_CveUres,
 Ures_Descrip As VEVE_Ures,
 EVEN_FecIni As VEVE_FecIni,
 EVEN_FecFin As VEVE_FecFin,
 EVEN_Ingreso As VEVE_Ingreso,
 EVEN_Baja As VEVE_Baja,
 EVEN_Nomina As VEVE_Nomina,
 EVEN_Cont As VEVE_Cont,
 EVEN_Fecha As VEVE_Fecha,
 EVEN_Motivo As VEVE_Motivo,
 EVEN_Dirigido As VEVE_Dirigido,
 EVEN_CopiaU As VEVE_CopiaU,
 EVEN_CopiaD As VEVE_CopiaD,
 EVEN_CopiaT As VEVE_CopiaT,
 EVEN_USU AS VEVE_Usu,
 EVEN_FEC AS VEVE_Fec
FROM FPERSONAS A, PEVENTUAL, FURES, Ppuestos, Pplazas, Pnombram, FPERSONAS B
Where A.PERS_Persona= EVEN_Empl
And Even_Nomb = Nomb_Nomb
And Plaz_Plaza = Nomb_Plaza
And Pues_Psto = Plaz_Psto
And Ures_Ures = Plaz_Ures
AND B.PERS_PERSONA = PNOMBRAM.NOMB_EMPL;



CREATE PUBLIC SYNONYM PVEVENTUAL FOR PERSONAL.PVEVENTUAL ;

COMMENT ON TABLE PVEVENTUAL IS 'Vista de Tabla de Eventuales' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_Even IS 'Eventual
Clave del Eventual
00
*S' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_Cont IS 'Contrato
Numero de Contrato
01
*S' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_Fecha IS 'Fecha_Contrato
Fecha de Contratacion
02
*S' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_Empl IS 'Empleado
Empleado
03
*S' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_Nombre IS 'Nombre
Nombre del Empleado
04
*S' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_Sustituye_A IS 'Sustituye_a
Nombre del Empleado al que sustituye
05
*S' ;


COMMENT ON COLUMN PVEVENTUAL.VEVE_Nomb IS 'Nombramiento
Nombramiento
06
*S' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_Puesto IS 'Puesto
Puesto del Nombramiento
07
*S' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_CveUres IS 'Ures
Clave Unidad Responsable
08
*S' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_Ures IS 'Unidad Responsable
Unidad Responsable del Nombramiento
09
*S' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_FecIni IS 'Fecha Inicial
Fecha Inicial del Eventual
*' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_FecFin IS 'Fecha Final
Fecha Final del Eventual
*' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_Ingreso IS 'Ingreso
Fecha Ingreso del Eventual
10
*S' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_Baja IS 'Baja
Fecha Baja del Eventual
11
*S' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_Nomina IS 'Nomina
Nomina donde se Aplica el pago
12
*S' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_Motivo IS 'Motivo
Motivo de la Contratacion
*' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_Dirigido IS 'Dirigido a
Persona a la que va dirigido el Oficio
*' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_CopiaU IS 'Copia1
Primera Copia
*' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_CopiaD IS 'Copia2
Segunda Copia
*' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_CopiaT IS 'Copia3
Tercera Copia
*' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_Usu IS 'Usuario
Usuario que capturo o modifico el registro
13
*S' ;

COMMENT ON COLUMN PVEVENTUAL.VEVE_Fec IS 'Fecha
Fecha de ultima modificacion del registro
14
*S' ;

-----------------
--triggers-------
-----------------
-----------------

----------------------------------------------------------------------------------------------------------------


CREATE OR REPLACE TRIGGER TBD_PEVENTUAL
 BEFORE DELETE ON PEVENTUAL FOR EACH ROW

begin

 if :old.EVEN_Nomina is not null then
    Raise_Application_Error(-20001, 'No se puede borrar registro, nomina ya aplicada' ) ;
 end if ;

end ;

/
--***--*-*-*-

CREATE OR REPLACE TRIGGER TBU_PEVENTUAL
 BEFORE UPDATE ON PEVENTUAL FOR EACH ROW

declare

lafecha date;


begin
 if UPDATING('EVEN_Nomina') then
  return ;
 end if ;

 if :old.EVEN_Nomina is not null then

  if updating('even_fecfin') then
    select nomi_fecha
    into lafecha
    from pnominas
    where nomi_nomina =  :old.EVEN_Nomina;

    if :new.even_fecfin < lafecha then
        Raise_Application_Error(-20001, 'La fecha de fin no puede ser menor a fecha de ultima aplicación: ' || lafecha) ;
    end if;
  end if;

  if updating('even_nomb') then
        Raise_Application_Error(-20001, 'No es posible modificar el nombramiento, Nomina ya aplicada') ;
  end if;

 end if ;


 IF :NEW.EVEN_INGRESO IS NULL THEN
	:NEW.EVEN_INGRESO := :NEW.EVEN_FECINI;
 END IF;

 IF :NEW.EVEN_BAJA IS NULL THEN
	:NEW.EVEN_BAJA := :NEW.EVEN_FECFIN;
 END IF;

 IF USER = 'LHT02349' THEN
    :NEW.EVEN_EMPL :=  :OLD.EVEN_EMPL;
    :NEW.EVEN_NOMB :=  :OLD.EVEN_NOMB;
    :NEW.EVEN_FECINI :=  :OLD.EVEN_FECINI;
    :NEW.EVEN_FECFIN :=  :OLD.EVEN_FECFIN;
    :NEW.EVEN_INGRESO :=  :OLD.EVEN_INGRESO;
    :NEW.EVEN_BAJA :=  :OLD.EVEN_BAJA;
 END IF;

end ;

/


--****---*-*--*-

CREATE OR REPLACE TRIGGER TAIU_PEVENTUAL
 AFTER INSERT OR UPDATE ON PEVENTUAL FOR EACH ROW
Declare
 Fecha date ;
begin
 if UPDATING then
  DELETE FROM PDEVENTUAL
  Where DEVE_Even= :old.EVEN_Even ;
 end if ;

 Fecha := :new.EVEN_FecIni ;
 LOOP
  if TO_Char(Fecha, 'D') not in ('6','7') then
   INSERT INTO PDEVENTUAL
    (DEVE_Even, DEVE_Dia)
   Values
    (:new.EVEN_Even, Fecha) ;
  end if ;

  if Fecha= :new.EVEN_FecFin  then
   Exit ;
  end if ;

  Fecha := Fecha+ 1 ;
 END LOOP ;
end ;
/

----------------------------------------------------------------------------------------------------------------


CREATE OR REPLACE TRIGGER TAD_PEVENTUAL
 AFTER DELETE ON PEVENTUAL FOR EACH ROW
begin
 DELETE FROM PDEVENTUAL
 Where DEVE_Even= :old.EVEN_Even ;

 DELETE FROM PGEVENTUAL
 Where GEVE_Even= :old.EVEN_Even ;
end ;

/


----------------------------------------------------------------------------------------------------------------

create or replace trigger PERSONAL.TBIU_PGEVENTUAL
BEFORE INSERT OR UPDATE ON PERSONAL.PGEVENTUAL FOR EACH ROW
DECLARE
 cnt Integer ;
BEGIN
 SELECT COUNT(*) INTO CNT
 FROM PTURGUARD
 WHERE TURG_Turno= :new.GEVE_Turno ;

 if cnt= 0  then
  Raise_Application_Error(-20001, 'No existe Turno' ) ;
 end if ;

END ;
/

----------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE TRIGGER TBI_PEVENTUAL
 BEFORE INSERT ON PEVENTUAL FOR EACH ROW

declare
--

begin
 IF :NEW.EVEN_INGRESO IS NULL THEN
	:NEW.EVEN_INGRESO := :NEW.EVEN_FECINI;
 END IF;

 IF :NEW.EVEN_BAJA IS NULL THEN
	:NEW.EVEN_BAJA := :NEW.EVEN_FECFIN;
 END IF;

end ;

/
