--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**
--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**

connect personal/personal@BD;

--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*
-----------
--TABLAS---
-----------

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**
-- Create table 
create table PMOVTERC
(
  MOVT_MOVI NUMBER(10) not null,
  MOVT_EMPL VARCHAR2(12),
  MOVT_PERSONA VARCHAR2(12)
);


-- Create the new synonym 
create public synonym PMOVTERC for PERSONAL.PMOVTERC;

-- Add comments to the table 
comment on table PMOVTERC is 'Movimientos de Pagos a Terceros
Pagos a terceros de nomina';

-- Add comments to the columns 
comment on column PMOVTERC.MOVT_MOVI is 'Movimiento
Numero de Movimiento
*';

comment on column PMOVTERC.MOVT_EMPL is 'Empleado
Empleado que paga al tercero
*';

comment on column PMOVTERC.MOVT_PERSONA is 'Persona
Persona al que se le paga
*';

-- Create/Recreate primary, unique and foreign key constraints 
alter table PMOVTERC
  add constraint PK$PMOVTERC$MOVI primary key (MOVT_MOVI);

alter table PMOVTERC add constraint FK$PMOVTERC$MOVI foreign key (MOVT_MOVI)
  references PMOVIMS (MOVI_MOVI) on delete cascade;

-- Create/Recreate check constraints 
alter table PMOVTERC add constraint NN$PMOVTERC$EMPL
  check (MOVT_EMPL IS NOT NULL);

alter table PMOVTERC add constraint NN$PMOVTERC$PERSONA
  check (MOVT_PERSONA IS NOT NULL);

-- Grant/Revoke privileges 
grant select on PMOVTERC to REPDOC;


--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**
--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**

CREATE OR REPLACE VIEW PVMOVTERC AS
SELECT
 MOVI_Movi		As VMOV_Movi,
 MOVT_Empl		As VMOV_Empl,
 SUBSTR(PERS_NOMBRE||' '||PERS_APEPAT||' '||PERS_APEMAT,1,45) As VMOV_Nombre,
 MOVT_Persona	As VMOV_Persona,
 MOVI_Texto		As VMOV_Texto,
 MOVI_Expr	  	As VMOV_Expr,
 MOVI_Total		As VMOV_Total,
 MOVI_Acum		As VMOV_Acum,
 MOVI_FecIni	As VMOV_FecIni,
 MOVI_FecFin	As VMOV_FecFin
FROM FPersonas, PMOVTERC, PMOVIMS
Where PERS_Persona= MOVT_Empl
  And MOVI_Movi= MOVT_Movi ;

/


-- Create the new synonym 
create public synonym PVMOVTERC for PERSONAL.PVMOVTERC;

-- Add comments to the view
comment on table PVMOVTERC is 'Movimientos de Pagos a Terceros
Pagos a terceros de nomina';

-- Add comments to the columns 
comment on column PVMOVTERC.VMOV_MOVI is 'Movimiento
Numero de Movimiento
00
*S';

comment on column PVMOVTERC.VMOV_EMPL is 'Empleado
Empleado que paga al tercero
01
*S';

comment on column PVMOVTERC.VMOV_NOMBRE is 'Nombre
Nombre del Empleado
02
*S';

comment on column PVMOVTERC.VMOV_PERSONA is 'Persona
Persona al que se le paga
03
*S';

comment on column PVMOVTERC.VMOV_TEXTO is 'Texto
Texto Descriptivo del Movimiento
*';

comment on column PVMOVTERC.VMOV_EXPR is 'Expresion
Expresion que se descuenta
*';

comment on column PVMOVTERC.VMOV_TOTAL is 'Total
Total a descontar
07
*S
*C';

comment on column PVMOVTERC.VMOV_ACUM is 'Descontado
Total descontado
08
*S
*C';

comment on column PVMOVTERC.VMOV_FECINI is 'Fecha Inicio
Fecha de Inicio del descuento
09
*S';

comment on column PVMOVTERC.VMOV_FECFIN is 'Fecha Final
Fecha de Fin del Descuento
10
*S';


--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**

create or replace trigger "PERSONAL".TII_PVMOVTERC
 instead of insert on pvmovterc  for each row

begin

-- Insertamos en Movims
 INSERT INTO PMOVIMS
  (MOVI_Movi, MOVI_TMovi, MOVI_ConP, MOVI_Descrip, MOVI_Texto,  MOVI_PerDed, MOVI_Expr, MOVI_Total, MOVI_FecIni, MOVI_FecFin)
 SELECT
  :new.VMOV_Movi, 'T', DATP_ConP_Terc, :new.VMOV_Persona, :new.VMOV_Texto, 'D',
  :new.VMOV_Expr, :new.VMOV_Total, :new.VMOV_FecIni, :new.VMOV_FecFin
 FROM PDatPer ;

-- Insertamos en PMovGEmpl
 INSERT INTO PMOVTERC
  (MOVT_Movi, MOVT_Empl, MOVT_Persona)
 VALUES
  (:new.VMOV_Movi, :new.VMOV_Empl, :new.VMOV_Persona) ;
end ;
/

--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**

create or replace trigger "PERSONAL".TIU_PVMOVTERC
 instead of update on pvmovterc  for each row

begin

-- Actualizamos en Movims
 UPDATE PMOVIMS Set
   MOVI_Descrip= :new.VMOV_Persona,
   MOVI_Texto= :new.VMOV_Texto,
   MOVI_Expr= :new.VMOV_Expr,
   MOVI_Total= :new.VMOV_Total,
   MOVI_FecIni= :new.VMOV_FecIni,
   MOVI_FecFin= :new.VMOV_FecFin
 Where MOVI_Movi= :new.VMOV_Movi ;

 -- Actualizamos en PMovTerc
  UPDATE PMOVTERC Set
   MOVT_Empl= :new.VMOV_Empl,
   MOVT_Persona= :new.VMOV_Persona
  Where MOVT_Movi= :new.VMOV_Movi ;
end ;

/


--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**
--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**
--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**
--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**
--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**--**


