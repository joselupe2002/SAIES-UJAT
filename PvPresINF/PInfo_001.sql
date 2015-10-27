--Script de modificaciones a la pantalla de Crédito Infonavit (PVPRESIN.DLL) para que 
--permita el descuento a través de la tabla de porcentajes y a través de una cuota Fija

--*---*--*--*--*---*--*--*--*---*--*--*--*---*--*--*--*---*--*--*--*---*--*--*--*---*--*--*
CONNECT PERSONAL/PERSONAL@BD

ALTER TABLE PPRESINF Add PRES_CUOTAF NUMBER (16,2);


-- Add comments to the table 
comment on table PPRESINF is 'Empleados con Prestamo Infonavit';

-- Add comments to the columns 
comment on column PPRESINF.PRES_MOVI is 'Movimiento
Numero de Movimiento del Prestamo
*';

comment on column PPRESINF.PRES_EMPL is 'Empleado
Empleado al que aplica el Prestamo
*';

comment on column PPRESINF.PRES_PORC is 'Porcentaje
Porcentaje al que aplica 1= 20%, 2= 25%, 3= 30%
*';

comment on column PPRESINF.PRES_CUOTAF is 'Cuota Fija
Cuota Fija establecida por Infonavit
*';

comment on column PPRESINF.PRES_FECINI is 'FecIni
Fecha Inicial del Prestamo
*';

comment on column PPRESINF.PRES_FECFIN is 'FecFin
Fecha Final del Prestamo
*';

--*---*--*--*--*---*--*--*--*---*--*--*--*---*--*--*--*---*--*--*--*---*--*--*--*---*--*--*
----------
--VIEWS---
----------

CREATE OR REPLACE VIEW PVPRESINF AS
SELECT
 PRES_Movi	As VPRE_Movi,
 PRES_Empl	As VPRE_Empl,
 SUBSTR(PERS_NOMBRE||' '||PERS_APEPAT||' '||PERS_APEMAT,1,45) As VPRE_Nombre,
 PRES_Porc	As VPRE_Porc,
 NVL(PRES_CuotaF,0)  As VPRE_CuotaF,
 PRES_FecIni As VPRE_FecIni,
 PRES_FecFin As VPRE_FecFin
FROM FPERSONAS, PPRESINF
Where PERS_Persona= PRES_Empl ;

COMMENT ON TABLE PVPRESINF IS 'Creditos INFONAVIT' ;

COMMENT ON COLUMN PVPRESINF.VPRE_Movi is 'Movi
Movimiento
00
*S' ;

COMMENT ON COLUMN PVPRESINF.VPRE_Empl is 'Empleado
Empleado del Credito
01
*S' ;

COMMENT ON COLUMN PVPRESINF.VPRE_Nombre is 'Nombre
Nombre
02
*S' ;

COMMENT ON COLUMN PVPRESINF.VPRE_Porc is 'Porc
Porcentaje del credito donde 1= 20%, 2=25% 3=30%
03
*S' ;

COMMENT ON COLUMN PVPRESINF.VPRE_CuotaF is 'Cuota Fija
Cuota Fija establecida por el Infonavit
04
*S' ;

COMMENT ON COLUMN PVPRESINF.VPRE_FecIni is 'Fecha Inicial
Fecha Inicial del credito
05
*S' ;

COMMENT ON COLUMN PVPRESINF.VPRE_FecFin is 'Fecha Final
Fecha Final del credito
06
*S' ;

--*---*--*--*--*---*--*--*--*---*--*--*--*---*--*--*--*---*--*--*--*---*--*--*--*---*--*--*
------------
--TRIGGERS--
------------

create or replace trigger "PERSONAL".TAD_PPRESINF
AFTER DELETE ON PPRESINF FOR EACH ROW

begin
 DELETE FROM PMOVIMS
 Where MOVI_Movi= :old.PRES_Movi ;
end ;
/


create or replace trigger "PERSONAL".TAI_PPRESINF
AFTER INSERT ON PPRESINF FOR EACH ROW


begin
 INSERT INTO PVMOVEMPL
  (VMOV_Movi, VMOV_Empl, VMOV_ConP, VMOV_Descrip, VMOV_PerDed, VMOV_Quin, VMOV_AntTerc,
   VMOV_Difer, VMOV_Expr, VMOV_FecIni, VMOV_FecFin, VMOV_Susp)
 Select :new.PRES_Movi, :new.PRES_Empl, DATG_Conp_Infon, 'CREDITO INFONAVIT', 'D', 'A', 'N',
   'N', 'NOM$PRESINF', :new.PRES_FecIni, :new.PRES_FecFin, 'N'
 From PDATGEN ;
end ;
/

create or replace trigger "PERSONAL".TAU_PPRESINF
AFTER UPDATE ON PPRESINF FOR EACH ROW


begin
 UPDATE PVMOVEMPL Set
  VMOV_Empl= :new.PRES_Empl,
  VMOV_FecIni= :new.PRES_FecIni,
  VMOV_FecFin= :new.PRES_FecFin
 WHERE VMOV_Movi= :new.PRES_Movi ;
end ;
/
