
----------------------------------------
----------------------------------------
--- ----------- NOMBRAMIENTO ---
----------------------------------------
----------------------------------------


CONNECT SHAKE/SHAKE@BD;

INSERT INTO SMODULOS(MODU_MODULO, MODU_PRED, MODU_DESCRIP, MODU_APLICACION,MODU_DETALLE,
 MODU_MANTEN, MODU_REPORTE, MODU_VERSION, MODU_SCRIPT, MODU_INSERTA, MODU_EDITA, MODU_BORRA)
VALUES('PVHNOMBRAM', 'PNOMISH','Nombramientos HAS','0','S','N','S','3.0.0.0', 'PvhN_001','S','S','S');


COMMIT;


--**--*-*-*-*---**--*-*-*-*---**--*-*-*-*---**--*-*-*-*---**--*-*-*-*---**--*-*-*-*---**--*-*-*-*-

CONNECT PERSONAL/PERSONAL@BD;


create table PhNOMBRAM
(
  NOMB_NOMB      NUMBER(10) not null,
  NOMB_NOMB_REEM NUMBER(10),
  NOMB_PLAZA     NUMBER(10),
  NOMB_EMPL      VARCHAR2(12),
  NOMB_DESCRIP   VARCHAR2(35),
  NOMB_SSUELDO   NUMBER(16,2) default 0,
  NOMB_TEXTO     VARCHAR2(500),
  NOMB_SUSP      VARCHAR2(1) default 'N',
  NOMB_INI       DATE,
  NOMB_FIN       DATE,
  NOMB_ANTES     NUMBER(10),
  NOMB_AINI      DATE,
  NOMB_AFIN      DATE,
  NOMB_LICE      NUMBER,
  NOMB_ILICE     DATE,
  NOMB_FLICE     DATE,
  NOMB_FINRET    DATE,
  NOMB_SPIUJAT   VARCHAR2(1) default 'N',
  NOMB_DIRIGIDO  VARCHAR2(10),
  NOMB_COPIAU    VARCHAR2(10),
  NOMB_COPIAD    VARCHAR2(10),
  NOMB_COPIAT    VARCHAR2(12),
  NOMB_CONT      VARCHAR2(12),
  NOMB_FECHA     DATE,
  NOMB_CATEG     VARCHAR2(10),
  NOMB_USU       VARCHAR2(30) default USER,
  NOMB_FEC       DATE default SYSDATE,
  NOMB_BANCO_NOM VARCHAR2(12),
  NOMB_BANCOD    VARCHAR2(2),
  NOMB_CBANC     VARCHAR2(15),
  NOMB_INGRESO   DATE,
  NOMB_BAJA      DATE,
  NOMB_USUM      VARCHAR2(30) default USER
);


CREATE PUBLIC SYNONYM PhNOMBRAM FOR PERSONAL.PhNOMBRAM;

-- Add comments to the table 
comment on table PhNOMBRAM is 'Tabla de Nombramientos';


-- Add comments to the columns 
comment on column PhNOMBRAM.NOMB_NOMB is 'Nomb
Numero de Nombramiento
*';

comment on column PhNOMBRAM.NOMB_NOMB_REEM is 'Nomb Reemp
Nombramiento que Reemplaza
*';

comment on column PhNOMBRAM.NOMB_PLAZA is 'Plaza
Plaza del Nombramiento
*';

comment on column PhNOMBRAM.NOMB_EMPL is 'Empleado
Empleado del Nombramiento
*';

comment on column PhNOMBRAM.NOMB_DESCRIP is 'Descripcion
Descripcion del Nombramiento
*';

comment on column PhNOMBRAM.NOMB_SSUELDO is 'SobreSueldo
Sueldo extra que se le paga en el nombramiento
*';

comment on column PhNOMBRAM.NOMB_TEXTO is 'Texto
Texto descriptivo del Nombramiento
*';

comment on column PhNOMBRAM.NOMB_SUSP is 'Suspendido
Indica si el nombramiento esta suspendido o no
*';

comment on column PhNOMBRAM.NOMB_INI is 'Fecha Ini
Fecha Inicial del Nombramiento
*';

comment on column PhNOMBRAM.NOMB_FIN is 'Fecha Fin
Fecha Final del Nombramiento
*';

comment on column PhNOMBRAM.NOMB_ANTES is 'Nomb Anterior
Nombramiento anterior (Cuando corresponde a Nombram)
*';

comment on column PhNOMBRAM.NOMB_AINI is 'Ini Nomb Anterior
Inicio del Nombramiento Anterior
*';

comment on column PhNOMBRAM.NOMB_AFIN is 'Fin Nomb Anterior
Fin del Nombramiento Anterior
*';

comment on column PhNOMBRAM.NOMB_LICE is 'Licencia
Ultima Licencia
*';

comment on column PhNOMBRAM.NOMB_ILICE is 'Inicio de Licencia
Fecha Inicial de Ultima Licencia
*';

comment on column PhNOMBRAM.NOMB_FLICE is 'Fin de Licencia
Fecha Final de Ultima Licencia
*';

comment on column PhNOMBRAM.NOMB_FINRET is 'Fin Retr
Fecha de Fin cuando termina con un Retroactivo
*';

comment on column PhNOMBRAM.NOMB_SPIUJAT is 'SPIUJAT
Indica si el Nombramiento pertence o no al SPIUJAT
*';

comment on column PhNOMBRAM.NOMB_DIRIGIDO is 'Dirigido a
Persona a la que va dirigido el oficio
*';

comment on column PhNOMBRAM.NOMB_COPIAU is 'Copia1
Primera Copia
*';

comment on column PhNOMBRAM.NOMB_COPIAD is 'Copia2
Segunda Copia
*';

comment on column PhNOMBRAM.NOMB_COPIAT is 'Copia3
Tercera Copia
*';

comment on column PhNOMBRAM.NOMB_CONT is 'Contrato
Contrato u Oficio
*';

comment on column PhNOMBRAM.NOMB_FECHA is 'Fecha
Fecha de Elaboración del Contrato u Oficio
*';

comment on column PhNOMBRAM.NOMB_CATEG is 'Categoría
Categoría del NOmbramiento
*';

comment on column PhNOMBRAM.NOMB_USU is 'Usuario
Usuario que Agregó o Modificó el Registro
*';

comment on column PhNOMBRAM.NOMB_FEC is 'Fecha
Fecha de Creación o Modificación del Registro
*';

comment on column PhNOMBRAM.NOMB_BANCO_NOM is 'Banco
Banco con el que se paga el Nombramiento
*';

comment on column PhNOMBRAM.NOMB_BANCOD is 'Banco_Dep
Banco donde se Deposita el pago del nombramiento
*';

comment on column PhNOMBRAM.NOMB_CBANC is 'Cuenta
Cuenta Bancaria en donde se Deposita el pago del Nombramiento
*';

comment on column PhNOMBRAM.NOMB_INGRESO is 'Ingreso
Fecha de Ingreso con el nombramiento
*';

comment on column PhNOMBRAM.NOMB_BAJA is 'Baja
Fecha de Baja del Nombramiento
*';

comment on column PhNOMBRAM.NOMB_USUM is 'Usuario_Mod
Usuario que Modificó el Registro
*';

-- Create/Recreate primary, unique and foreign key constraints 
alter table PhNOMBRAM
  add constraint PK$PhNOMBRAM$NOMB primary key (NOMB_NOMB);

alter table PhNOMBRAM
  add constraint FK$PhNOMBRAM$EMPL foreign key (NOMB_EMPL)
  references FINANZAS.FPERSONAS (PERS_PERSONA);

alter table PhNOMBRAM
  add constraint FK$PhNOMBRAM$NOMB_REEM foreign key (NOMB_NOMB_REEM)
  references PhNOMBRAM (NOMB_NOMB);

alter table PhNOMBRAM
  add constraint FK$PhNOMBRAM$PLAZA foreign key (NOMB_PLAZA)
  references PHPLAZAS (PLAZ_PLAZA);

-- Create/Recreate check constraints 
alter table PhNOMBRAM
  add constraint CC$PhNOMBRAM$AFIN
  check (NOMB_INI > NOMB_AFin);

alter table PhNOMBRAM
  add constraint CC$PhNOMBRAM$FIN
  check (NOMB_FIN >= NOMB_INI);

alter table PhNOMBRAM
  add constraint CC$PhNOMBRAM$FINRET
  check (NOMB_FinRet > NOMB_Ini);

alter table PhNOMBRAM
  add constraint CC$PhNOMBRAM$FLICE
  check (NOMB_FLice <= NOMB_Fin);

alter table PhNOMBRAM
  add constraint CC$PhNOMBRAM$ILICE
  check (NOMB_ILice >= NOMB_Ini);

alter table PhNOMBRAM
  add constraint CC$PhNOMBRAM$SUSP
  check (NOMB_SUSP IN ('S','N'));

alter table PhNOMBRAM
  add constraint CC$PhNOMBRAM$XLICE
  check ((NOMB_Lice is null And  NOMB_ILice is null And  NOMB_FLice is null) or  (NOMB_Lice is not null And  NOMB_ILice is not null And  NOMB_FLice is not null));

alter table PhNOMBRAM
  add constraint NN$PhNOMBRAM$CATEG
  check (NOMB_CATEG IS NOT NULL);

alter table PhNOMBRAM
  add constraint NN$PhNOMBRAM$DESCRIP
  check (NOMB_Descrip IS NOT NULL);

alter table PhNOMBRAM
  add constraint NN$PhNOMBRAM$EMPL
  check (NOMB_EMPL IS NOT NULL);

alter table PhNOMBRAM
  add constraint NN$PhNOMBRAM$FIN
  check (NOMB_FIN IS NOT NULL);

alter table PhNOMBRAM
  add constraint NN$PhNOMBRAM$INI
  check (NOMB_INI IS NOT NULL);

alter table PhNOMBRAM
  add constraint NN$PhNOMBRAM$PLAZA
  check (NOMB_Plaza is not Null);

alter table PhNOMBRAM
  add constraint NN$PhNOMBRAM$SSUELDO
  check (NOMB_SSUELDO IS NOT NULL);

alter table PhNOMBRAM
  add constraint NN$PhNOMBRAM$SUSP
  check (NOMB_SUSP IS NOT NULL);

-- Create/Recreate indexes 
create index IX$PhNOMBRAM$CATEG on PhNOMBRAM (NOMB_CATEG);

create index IX$PhNOMBRAM$EMPL on PhNOMBRAM (NOMB_EMPL);

create index IX$PhNOMBRAM$NOMB_REEM on PhNOMBRAM (NOMB_NOMB_REEM);

create index IX$PhNOMBRAM$PLAZA on PhNOMBRAM (NOMB_PLAZA);

create index PK$PhNOMBRAM$NOMFIN on PhNOMBRAM (NOMB_FIN);


----------------
----------------
----TRIGGERS----
----------------


CREATE OR REPLACE TRIGGER TAD_PhNOMBRAM
AFTER Delete ON PERSONAL.PhNOMBRAM FOR EACH ROW



DECLARE
--
BEGIN
 if :old.NOMB_Nomb_Reem is null then
  Update PHPLAZAS SET
   PLAZ_Nomb= :old.NOMB_Antes,
   PLAZ_INomb= :old.NOMB_AIni,
   PLAZ_FNomb= :old.NOMB_AFin
  Where PLAZ_Plaza= :old.NOMB_Plaza ;
 end if ;
 
END ;
/



-------********************************----------------------************
CREATE OR REPLACE TRIGGER TAIU_PhNOMBRAM
AFTER INSERT OR UPDATE OF NOMB_Ini, NOMB_Fin ON PERSONAL.PhNOMBRAM FOR EACH ROW



DECLARE
--
BEGIN
 if :new.NOMB_Nomb_Reem is null then
  Update PHPLAZAS SET
   PLAZ_Nomb= :new.NOMB_Nomb,
   PLAZ_INomb= :new.NOMB_Ini,
   PLAZ_FNomb= :new.NOMB_Fin
  Where PLAZ_Plaza= :new.NOMB_Plaza ;
 end if ;

 
/* IF INSERTING THEN
     ---AUDITORIA DE MODIFICACION DE NOMBRAMIENTOS
     INSERT INTO PEAUDINOMB (AUDI_NOMB, AUDI_PLAZA, AUDI_EMPL, AUDI_DESCRIP, AUDI_CATEG, AUDI_INI, AUDI_FIN, AUDI_USU,
                           AUDI_FEC, AUDI_USUM, AUDI_USER, AUDI_TMOV)
     VALUES (:NEW.NOMB_NOMB, :NEW.NOMB_PLAZA, :OLD.NOMB_EMPL, :NEW.NOMB_DESCRIP, :NEW.NOMB_CATEG, :NEW.NOMB_INI,
             :NEW.NOMB_FIN, :NEW.NOMB_USU, :NEW.NOMB_FEC, :NEW.NOMB_USUM, USER,'I');
 END IF; 
 
 IF UPDATING THEN
     ---AUDITORIA DE MODIFICACION DE NOMBRAMIENTOS
     INSERT INTO PEAUDINOMB (AUDI_NOMB, AUDI_PLAZA, AUDI_EMPL, AUDI_DESCRIP, AUDI_CATEG, AUDI_INI, AUDI_FIN, AUDI_USU,
                           AUDI_FEC, AUDI_USUM, AUDI_USER, AUDI_TMOV)
     VALUES (:NEW.NOMB_NOMB, :NEW.NOMB_PLAZA, :OLD.NOMB_EMPL, :NEW.NOMB_DESCRIP, :NEW.NOMB_CATEG, :NEW.NOMB_INI,
             :NEW.NOMB_FIN, :NEW.NOMB_USU, :NEW.NOMB_FEC, :NEW.NOMB_USUM, USER,'M');
 END IF; 

*/

 
END ;

/


--*************---------------------------------******************************---------


CREATE OR REPLACE TRIGGER TBD_PhNOMBRAM
BEFORE DELETE ON PERSONAL.PhNOMBRAM FOR EACH ROW



DECLARE
 Nomb Number(10,0) ;
BEGIN

 SELECT COUNT(*) into Nomb
 FROM PHPAGOS
 WHERE rownum= 1
   And PAGO_NOMB= :old.NOMB_Nomb
   And PAGO_FecCancel is null ;

 if Nomb <> 0 then
  Raise_Application_Error(-20001, 'No se puede borrar nombramiento con pagos' ) ;
 end if ;


 if :old.NOMB_Nomb_Reem is not null then
  return ;
 end if ;

 Select PLaz_Nomb Into Nomb
 From PHPLAZAS
 Where PLAZ_Plaza= :old.NOMB_Plaza ;

 if Nomb is not null And nomb <> :old.NOMB_Nomb then
  Raise_Application_Error(-20001, 'Solo se puede borrar nombramiento activo en la plaza '||TO_Char(Nomb) ) ;
 end if ;

/*

 ---AUDITORIA DE ELIMINACION DE NOMBRAMIENTOS
 INSERT INTO PEAUDINOMB (AUDI_NOMB, AUDI_PLAZA, AUDI_EMPL, AUDI_DESCRIP, AUDI_CATEG, AUDI_INI, AUDI_FIN, AUDI_USU,
                       AUDI_FEC, AUDI_USUM, AUDI_USER, AUDI_TMOV)
 VALUES (:OLD.NOMB_NOMB, :OLD.NOMB_PLAZA, :OLD.NOMB_EMPL, :OLD.NOMB_DESCRIP, :OLD.NOMB_CATEG, :OLD.NOMB_INI,
         :OLD.NOMB_FIN, :OLD.NOMB_USU, :OLD.NOMB_FEC, :OLD.NOMB_USUM, USER,'E');
 

*/
 
END ;

/


------------*************************************************************************************-------------------CREATE OR REPLACE TRIGGER TBI_PNOMBRAM

CREATE OR REPLACE TRIGGER TBI_PhNOMBRAM
BEFORE INSERT ON PERSONAL.PhNOMBRAM FOR EACH ROW


DECLARE
 Antes Number ;
 Ini Date ;
 Fin Date ;
BEGIN

 if :new.NOMB_Fin is null then
  :new.NOMB_Fin := TO_Date('31/12/3000', 'DD/MM/YYYY') ;
 end if ;

 if :new.NOMB_Descrip is null then
  SELECT PUES_Descrip into :new.NOMB_Descrip
  FROM PHPUESTOS
  Where PUES_Psto=
   (SELECT PLAZ_Psto
    From PHPLAZAS
    Where PLAZ_Plaza= :new.NOMB_Plaza) ;
 end if ;

 if :new.NOMB_Nomb_Reem is not null then
  SELECT NOMB_Ini, NOMB_Fin
  Into Ini, Fin
  FROM PhNOMBRAM
  Where NOMB_Nomb= :new.NOMB_Nomb_Reem ;

  if :new.NOMB_Ini < Ini then
   Raise_Application_Error(-20001, 'Inicio de Reemplazo no puede ser menor a Inicio de Titular' ) ;
  end if ;

  if :new.NOMB_Fin > Fin then
   Raise_Application_Error(-20001, 'Fin de Reemplazo no puede ser mayor a Fin de Titular' ) ;
  end if ;
  return ;
 end if ;

 
 Select Count(*) Into Antes
 From PhNOMBRAM
 Where NOMB_Plaza= :new.NOMB_Plaza ;


 if Antes= 0 then
  Return ;
 end if ;

--  RAISE_APPLICATION_ERROR(-20001,:new.NOMB_Plaza);
 
 Select NOMB_Nomb, NOMB_Ini, NOMB_Fin Into Antes, Ini, Fin
 From PhNOMBRAM
 Where NOMB_Plaza= :new.NOMB_Plaza
   And NOMB_Fin=
    (Select MAX(Nomb_Fin)
     From PhNOMBRAM
     Where NOMB_Plaza= :new.NOMB_Plaza
   And NOMB_NOMB_REEM IS NULL)
   And NOMB_Ini=
    (Select MAX(Nomb_Ini)
     From PhNOMBRAM
     Where NOMB_Plaza= :new.NOMB_Plaza
   And NOMB_NOMB_REEM IS NULL);


     
 :new.NOMB_Antes := Antes ;
 :new.NOMB_AIni  := Ini ;
 :new.NOMB_AFin  := Fin ;

END ;

/


---*-*-*-*-*-*--*-*-*-************************************************************************-


CREATE OR REPLACE TRIGGER TBU_PhNOMBRAM
BEFORE UPDATE ON PERSONAL.PhNOMBRAM FOR EACH ROW



DECLARE
 Nomb Number(10,0) ;
 UltPago Date ;
BEGIN

 if UPDATING('NOMB_Antes') or UPDATING('NOMB_AIni') or UPDATING('NOMB_AFin') then
  Raise_Application_Error(-20001, 'No se puede modificar Nombramiento Anterior') ;
 end if ;

 if :new.NOMB_Fin is null then
  :new.NOMB_Fin := TO_Date('31/12/3000', 'DD/MM/YYYY') ;
 end if ;

-- Checamos cuando el update es x retroactivo

 if not UPDATING('NOMB_FinRet') And :new.NOMB_FinRet is not null then
  Raise_Application_Error(-20001, 'No se puede modificar Nombramiento Sustituido x retroactivo') ;
 end if ;


 SELECT MAX(NOMI_Fecha) into UltPago
 FROM PHPAGOS, PHNOMINAS
 WHERE NOMI_Nomina= PAGO_Nomina
   And NOMI_Tipo= 'O'
   And PAGO_FecCancel is null
   And PAGO_Nomb= :old.NOMB_Nomb ;

   
 if UltPago is not null And (
  (:old.NOMB_Plaza <> :new.NOMB_Plaza) or
  (:old.NOMB_Empl <> :new.NOMB_Empl) or
  (:old.NOMB_Ini <> :new.NOMB_Ini) --or
  --(:old.NOMB_Categ <> :new.NOMB_Categ)
   ) then
  Raise_Application_Error(-20001, 'No se puede Modificar Plaza, Empleado, Categoría ó Fecha de Inicio de nombramiento con pagos' ) ;
 end if ;

 if UPDATING('NOMB_Fin') And UltPago is not null And :new.NOMB_Fin < UltPago then
  Raise_Application_Error(-20001, 'Fin de Nombramiento no puede ser menor a fecha de ultimo pago '||TO_Char(UltPago,'DD/MM/YYYY') ) ;
 end if ;

 if :new.NOMB_Nomb_Reem is not null then
  return ;
 end if ;
/*
 Select PLaz_Nomb Into Nomb
 From PHPLAZAS
 Where PLAZ_Plaza= :new.NOMB_Plaza ;

 if Nomb is not null And nomb <> :new.NOMB_Nomb then
  Raise_Application_Error(-20001, 'Solo se puede modificar nombramiento activo en la plaza '||TO_Char(Nomb) ) ;
 end if ;
*/
END ;

/



--*******************************************************************************************************************-

------------------------------------------------------------------------------------
--------------------------------
---- Vista de Nombramientos ----
--------------------------------

CREATE OR REPLACE VIEW PVHNOMBRAM AS
Select
 NOMB_Nomb	As VNOM_Nomb,
 DECODE(NOMB_Nomb_Reem, Null, 'T', 'R') As VNOM_Tipo,
 NOMB_Plaza	As VNOM_Plaza,
 NOMB_Nomb_Reem As VNOM_Reem,
 NOMB_Cont As VNOM_Cont,
 NOMB_Fecha As VNOM_Fecha,
 NOMB_Empl	As VNOM_Empl,
 SUBSTR(PERS_NOMBRE||' '||PERS_APEPAT||' '||PERS_APEMAT,1,45) As VNOM_Nombre,
 NOMB_Descrip	As VNOM_Descrip,
 PLAZ_URes		As VNOM_URes,
 URes_Descrip As VNOM_UResDesc,
 PLAZ_SFdo		As VNOM_SFdo,
 PLAZ_Tplaza  As VNOM_TPlaza,
 PUES_TPsto		As VNOM_TPsto,
 PLAZ_Psto		As VNOM_Psto,
 PLAZ_Docen		As VNOM_Docen,
 CPUE_Categ As VNOM_CategR,
 CPUE_DESCRIP As VNOM_CategRDesc,
 CPUE_Categ As VNOM_Categ,
 PLAZ_Horas		As VNOM_Horas,
 DECODE(PUES_SUEL_ALT, 'S', PLAZ_SLDO,
 decode(pues_fpago, 'H', plaz_horas * SPUE_Sueldo, spue_sueldo)) As VNOM_SldoR,
 NOMB_SSueldo 	As VNOM_SSueldo,
 DECODE(PUES_SUEL_ALT, 'S', PLAZ_SLDO,
  DECODE(PUES_FPAGO, 'H', PLAZ_Horas * SPUE_SUELDO,
   DECODE(PUES_TPsto, 'A', SPUE_Sueldo,
   SPUE_SUELDO)))+NOMB_SSueldo As VNOM_Sldo,
 PLAZ_Ini     	As VNOM_PIni,
 PLAZ_Fin     	As VNOM_PFin,
 NOMB_Texto		As VNOM_Texto,
 NOMB_Ini		As VNOM_Ini,
 NVL(NOMB_FinRet, NOMB_Fin) As VNOM_Fin,
 NOMB_INGRESO	AS VNOM_INGRESO,
 NOMB_BAJA	AS VNOM_BAJA,
 NOMB_Susp   	As VNOM_Susp,
 NVL(DECODE(PUES_TPSTO , 'D', ATRE_SPIUJAT, 'BE',ATRE_SPIUJAT, 'BD',ATRE_SPIUJAT,
                         'JD', ATRE_SPIUJAT, 'PD', ATRE_SPIUJAT, 'N'),'N') As VNOM_SPIUJAT,
 NVL(PLAZ_PROMEP,'N') AS VNOM_PROMEP,
 NVL(PLAZ_AREA,'N') AS VNOM_AREA,
 NOMB_BANCO_NOM AS VNOM_BANCO_NOM,
 NOMB_BANCOD AS VNOM_BANCOD,
 NOMB_CBANC AS VNOM_CBANC,
 NOMB_DIRIGIDO AS VNOM_DIRIGIDO,
 NOMB_COPIAU AS VNOM_COPIAU,
 NOMB_COPIAD AS VNOM_COPIAD,
 NOMB_COPIAT AS VNOM_COPIAT,
 NOMB_USU AS VNOM_USU,
 NOMB_FEC AS VNOM_FEC,
 NOMB_USUM AS VNOM_USUM
FROM FPERSONAS, PhNOMBRAM, PHPLAZAS, PHPUESTOS, PHCPUESTOS, PHSPUESTOS, PATREMPL, FURES
Where PERS_PERSONA= NOMB_Empl
  And PLAZ_PLAZA= NOMB_Plaza
  And URES_URes = PLAZ_Ures
  And PUES_Psto= PLAZ_Psto
  And CPUE_Psto= PUES_Psto
  And CPUE_Categ= NOMB_Categ
 And SPUE_SPue= CPUE_SPue
 And ATRE_Empl(+)= NOMB_Empl ;


/


CREATE PUBLIC SYNONYM PVHNOMBRAM FOR PERSONAL.PVHNOMBRAM;


COMMENT ON TABLE PERSONAL.PVHNOMBRAM IS 'Vista de Nombramientos' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_Nomb IS 'Nomb
Numero del nombramiento
00
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_Tipo IS 'Tipo Nomb
Tipo de Nombram donde T=Titular, R=Reemplazo
01
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_Plaza IS 'Plaza
Plaza del Nombramiento
02
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_Reem IS 'Reemplazo
Nombramiento al que Reemplaza
03
*S' ;

COMMENT ON COLUMN PVHNOMBRAM.VNom_Cont is 'Contrato
Contrato u oficio
*' ;

COMMENT ON COLUMN PVHNOMBRAM.VNom_Fecha is 'Fecha
Fecha de elaboración del contrato u oficio
*' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_Empl IS 'Empl
Empleado que tiene el nombramiento
04
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_Nombre IS 'Nombre
Nombre del Empleado que tiene el nombramiento
05
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_Descrip IS 'Descripcion
Descripcion del Nombramiento
06
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_URes IS 'Cve URes
Clave de Unidad Responsable
07
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_UResDesc IS 'URes
Unidad Responsable
08
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_SFdo IS 'SFdo
SubFondo que paga la plaza
09
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_Tplaza IS 'TPlaza
Tipo de Plaza
10
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_TPsto IS 'TPsto
Tipo de Puesto
11
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_Psto IS 'Puesto
Puesto
12
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_CategR IS 'Categoria
Categoria de la Persona en el Puesto
13
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_CategRDesc IS 'Descripción Categoria
Descripción de la Categoria
14
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_Categ IS 'Categoria Base
Categoria Base del Puesto
*' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_Horas IS 'Horas
Carga Horaria
15
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_SldoR IS 'Sueldo
Sueldo Real basado en la Categoría
16
*S
*C' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_Sldo IS 'Sueldo Base
Sueldo de la Categoría Base
' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_SSueldo IS 'SobreSueldo
Sobre Sueldo
*C' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_PIni IS 'Ini Plaza
Inicio de la Plaza
*' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_PFin IS 'Fin Plaza
Fin de la Plaza
*' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_Texto IS 'Texto
Texto Descriptivo del Nombramiento
*' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_Ini IS 'Inicio
Inicio del Nombramiento
*' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_Fin IS 'Fin
Fin del Nombramiento
*' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_Ingreso IS 'Ingreso
Ingreso al Nombramiento
18
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_Baja IS 'Baja
Baja del Nombramiento
19
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_Susp IS 'Suspendido
Indica si el nombramiento esta o no suspendido
20
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_SPIUJAT IS 'SPIUJAT
Indica si el nombramiento pertenece o no al SPIUJAT
21
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_PROMEP IS 'PROMEP
Indica si la plaza es de tipo PROMEP
22
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_AREA IS 'Area
Indica si es Area Contable o de Jardinería
23
*S' ;

COMMENT ON COLUMN PVHNOMBRAM.VNom_Banco_Nom is 'Banco
Banco con el que se paga el nombramiento
* ' ;

COMMENT ON COLUMN PVHNOMBRAM.VNom_BancoD is 'Banco_dep
Banco donde se deposita el pago del nombramiento
* ' ;

COMMENT ON COLUMN PVHNOMBRAM.VNom_Cbanc is 'Cuenta
Cuenta bancaria en donde se deposita el pago del nombramiento
*' ;

COMMENT ON COLUMN PVHNOMBRAM.VNom_Dirigido is 'Dirigido a
Persona a la que va dirigido el oficio
*' ;

COMMENT ON COLUMN PVHNOMBRAM.VNom_Copiau is 'Copia1
Primera copia
* ' ;

COMMENT ON COLUMN PVHNOMBRAM.VNom_Copiad is 'Copia2
Segunda copia
* ' ;

COMMENT ON COLUMN PVHNOMBRAM.VNom_Copiat is 'Copia3
Tercera copia
* ' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_USU IS 'Usuario_Capturo
Usuario que creó el Nombramiento
24
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_FEC IS 'Capturado
Fecha de Captura o de Modificación del Nombramiento
25
*S' ;

COMMENT ON COLUMN PERSONAL.PVHNOMBRAM.VNOM_USUM IS 'Usuario_Modifico
Usuario que Modificó por última vez el Nombramiento
26
*S' ;

----------------------------------------------------------------------------------------------------------------

create or replace trigger TII_PVHNOMBRAM
 instead of insert on PVHNOMBRAM  for each row

declare
 plaz number ;
 tt varchar2(30) ;
 verifica_categ number := 0;

begin

IF :NEW.VNOM_TPSTO = 'BD' THEN
   RAISE_APPLICATION_ERROR(-20001,'Tipo de Puesto ha sido modificado a BE');
END IF;


Select count(*)
Into Verifica_Categ
From PHcpuestos
Where Cpue_Psto =  :new.VNOM_Psto
and CPue_Categ = :new.VNOM_Categ;

If verifica_categ = 0 then
    Raise_application_error(-20001,'La Categoría no existe para ese Puesto'); 
end if;


-- Insertamos en Nombramiento
 INSERT INTO PhNOMBRAM
 (NOMB_Nomb, NOMB_Nomb_Reem, NOMB_Plaza, NOMB_Empl, NOMB_Descrip,
  NOMB_SSueldo, NOMB_Texto, NOMB_Susp, NOMB_Ini, NOMB_Fin, NOMB_BANCO_NOM,
  NOMB_BANCOD, NOMB_CBANC, NOMB_DIRIGIDO, NOMB_COPIAU, NOMB_COPIAD, NOMB_COPIAT,
  NOMB_CONT, NOMB_FECHA, NOMB_CATEG, NOMB_USU, NOMB_FEC, NOMB_Ingreso, NOMB_Baja)
 VALUES
 (:new.VNOM_Nomb, :new.VNOM_Reem, :new.VNOM_Plaza, :new.VNOM_Empl, :new.VNOM_Descrip,
  :new.VNOM_SSueldo, :new.VNOM_Texto, :new.VNOM_Susp, :new.VNOM_Ini, :new.VNOM_Fin,
  :new.VNOM_BANCO_NOM, :NEW.VNOM_BANCOD, :NEW.VNOM_CBANC, :NEW.VNOM_DIRIGIDO, :NEW.VNOM_COPIAU,
  :NEW.VNOM_COPIAD, :NEW.VNOM_COPIAT, :NEW.VNOM_CONT, :NEW.VNOM_FECHA, :NEW.VNOM_CATEG,
  USER, SYSDATE, :new.VNOM_Ingreso, :new.VNOM_Baja);


end ;
/


----------------------------------------------------------------------------------------------------------------

create or replace trigger TIU_PVHNOMBRAM
 instead of update on PVHNOMBRAM  for each row
declare
 tt varchar2(30) ;
 ini date ;
 fin date ;
 verifica_categ number := 0;
begin


IF :NEW.VNOM_TPSTO = 'BD' THEN
   RAISE_APPLICATION_ERROR(-20001,'Tipo de Puesto ha sido modificado a BE');
END IF;



Select count(*)
Into Verifica_Categ
From PHcpuestos
Where Cpue_Psto =  :new.VNOM_Psto
and CPue_Categ = :new.VNOM_Categ;

If verifica_categ = 0 then
    Raise_application_error(-20001,'La Categoría no existe para ese Puesto'); 
end if;



-- Validacion en Vista PARA Fechas de Reemplazo <---
 if :new.VNOM_Tipo= 'R' then
  SELECT NOMB_Ini, NOMB_Fin
  Into Ini, Fin
  FROM PhNOMBRAM
  Where NOMB_Nomb= :new.VNOM_Reem ;

  if :new.VNOM_Ini < Ini then
   Raise_Application_Error(-20001, 'Inicio de Reemplazo no puede ser menor a Inicio de Titular' ) ;
  end if ;

/*
  if :new.VNOM_Fin > Fin then
   Raise_Application_Error(-20001, 'Fin de Reemplazo no puede ser mayor a Fin de Titular' ) ;
  end if ;*/
 end if ;


-- Actualizamos Nombramiento
 UPDATE PhNOMBRAM Set
  NOMB_Plaza= :new.VNOM_Plaza,
  NOMB_Nomb_Reem= :new.VNOM_Reem,
  NOMB_Empl= :new.VNOM_Empl,
  NOMB_Descrip= :new.VNOM_Descrip,
  NOMB_SSueldo= :new.VNOM_SSueldo,
  NOMB_Texto= :new.VNOM_Texto,
  NOMB_Susp= :new.VNOM_Susp,
  NOMB_Ini= :new.VNOM_Ini,
  NOMB_Fin= :new.VNOM_Fin,
  NOMB_Ingreso= :new.VNOM_Ingreso,
  NOMB_Baja= :new.VNOM_Baja,
  NOMB_BANCO_NOM= :new.VNOM_BANCO_NOM,
  NOMB_BANCOD= :new.VNOM_BANCOD,
  NOMB_CBANC= :new.VNOM_CBANC,
  NOMB_DIRIGIDO= :NEW.VNOM_DIRIGIDO,
  NOMB_COPIAU= :NEW.VNOM_COPIAU,
  NOMB_COPIAD= :NEW.VNOM_COPIAD,
  NOMB_COPIAT= :NEW.VNOM_COPIAT,
  NOMB_CONT= :NEW.VNOM_CONT,
  NOMB_FECHA= :NEW.VNOM_FECHA,
  NOMB_CATEG= :NEW.VNOM_CATEG,
  NOMB_USUM= USER,
  NOMB_FEC= SYSDATE
 Where NOMB_Nomb= :new.VNOM_Nomb ;


end ;

/



---------------------------------------
---------------------------------------
--- VISTAS PARA SELECCION EN NOMINA ---
---------------------------------------
---------------------------------------


-----------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW PVHSELNOMB AS
SELECT
 NOMB_Empl As VNOM_Empl,
 NOMB_Nomb As VNOM_Nomb,
 DECODE(NOMB_Nomb_Reem, Null, 'T', 'R') As VNOM_Tipo,
 NOMB_Descrip As VNOM_Descrip,
 PLAZ_Docen As VNOM_Docen,
 PLAZ_Plaza As VNOM_Plaza,
 PLAZ_TPlaza As VNOM_TPlaza,
 PLAZ_URes   As VNOM_URes,
 PLAZ_SFdo   As VNOM_SFdo,
 PUES_TPsto As VNOM_TPsto,
 PLAZ_Psto As VNOM_Psto,
 CPUE_Categ As VNOM_Categ,
 NVL(CALCULA_ANTIG(NOMI_FECHA, ATRE_FINGRESO, 1),0) As VNOM_Antig,
 NVL(CALCULA_ANTIG(NOMI_FECHA, ATRE_FINGRESOD, 1),0) As VNOM_AntigD,
 PLAZ_Horas As VNOM_Horas,
 NOMB_SSueldo As VNOM_SSueldo,
 DECODE(PUES_SUEL_ALT, 'S', PLAZ_Sldo,
  DECODE(PUES_FPAGO, 'H', PLAZ_Horas * SPUE_SUELDO, SPUE_SUELDO))+NOMB_SSueldo As VNOM_Sldo,
 NOMB_Ini		As VNOM_Ini,
 NVL(NOMB_FinRet, NOMB_Fin) As VNOM_Fin,
 NOMB_Susp   	As VNOM_Susp,
 ATRE_Banco_Emp   As VNOM_EBanco,
 NOMB_Banco_Nom as VNOM_NBanco,
 VURB_Banco		As VNOM_UBanco,
 NVL(DECODE(PUES_TPSTO , 'D', ATRE_SPIUJAT, 'BE',ATRE_SPIUJAT, 'BD',ATRE_SPIUJAT,
                         'JD', ATRE_SPIUJAT, 'PD', ATRE_SPIUJAT, 'N'),'N') As VNOM_SPIUJAT,
 15			As VNOM_NDias,
  0			As VNOM_LDias,
  0			As VNOM_FDias,
  0			As VNOM_Refer
From PhNOMBRAM, PHPLAZAS, PHPUESTOS, PHCPUESTOS, PHSPUESTOS, PATREMPL, PVURBATP, PHNOMINAS--, PBCOURES
Where PLAZ_PLAZA= NOMB_Plaza
  And PUES_Psto= PLAZ_Psto
  And CPUE_Psto= PUES_Psto
  And CPUE_Categ= NOMB_CATEG
/*(
SELECT DECODE(Count(*), 0, PUES_Categ_Defa, MAX(CATE_Categ))
From PCATEMPL
Where CATE_Empl= NOMB_Empl
 And CATE_Psto= PLAZ_Psto
)*/
 And SPUE_SPue= CPUE_SPue
 And ATRE_Empl(+)= NOMB_Empl
 --And BCOU_URes(+)= PLAZ_URes
 And VURB_Ures = PLAZ_URes
 And VURB_TPsto = PUES_TPsto
 And Nomi_Nomina = (Select Max(Nomi_Nomina) from Phnominas);

/


