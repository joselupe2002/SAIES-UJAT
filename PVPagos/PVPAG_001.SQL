----***********************************--------------*************---------

---crea las tablas de pagos y cancela pagos, y la vista de pvpagos


----***********************************--------------*************---------


-- Create table
create table PPAGOS
(
  PAGO_PAGO      NUMBER(15) not null,
  PAGO_NOMINA    NUMBER(10),
  PAGO_NOMPER    NUMBER(10),
  PAGO_EMPL      VARCHAR2(12),
  PAGO_TEMPL     VARCHAR2(1),
  PAGO_URES      VARCHAR2(8),
  PAGO_NOMB      NUMBER(10),
  PAGO_TPLAZA    VARCHAR2(2),
  PAGO_TPSTO     VARCHAR2(2),
  PAGO_PSTO      VARCHAR2(10),
  PAGO_CATEG     VARCHAR2(10),
  PAGO_REFER     NUMBER(15),
  PAGO_BANCO     VARCHAR2(12),
  PAGO_CTABCO    VARCHAR2(15),
  PAGO_CHEQUE    VARCHAR2(15),
  PAGO_FECCANCEL DATE
);

-- Add comments to the table 
comment on table PPAGOS is 'Tabla de Pagos';

-- Add comments to the columns 
comment on column PPAGOS.PAGO_PAGO is 'Pago
Numero de pago
*';

comment on column PPAGOS.PAGO_NOMINA is 'Nomina
Numero de Nomina donde se Aplica el Pago
*';

comment on column PPAGOS.PAGO_NOMPER is 'Nomina Per
Numero de Nomina a la que Pertenece el Pago
*';

comment on column PPAGOS.PAGO_EMPL is 'Empleado
Empleado
*';

comment on column PPAGOS.PAGO_TEMPL is 'Tipo Empl
Tipo de Empleado
*';

comment on column PPAGOS.PAGO_URES is 'U Resp
Unidad responsable
*';

comment on column PPAGOS.PAGO_NOMB is 'Nombramiento
Numero de Nombramiento, cuando corresponde
*';

comment on column PPAGOS.PAGO_TPLAZA is 'TPlaza
Tipo de Plaza
*';

comment on column PPAGOS.PAGO_TPSTO is 'TPuesto
Tipo de Puesto
*';
 
comment on column PPAGOS.PAGO_PSTO is 'Puesto
Puesto
*';

comment on column PPAGOS.PAGO_CATEG is 'Categoria
Categoria del Empleado en el Puesto
*';

comment on column PPAGOS.PAGO_REFER is 'Referencia
Referencia adicional del Pago
*';

comment on column PPAGOS.PAGO_BANCO is 'Banco
Cuenta de Banco a pagar, cuando es diferente al de la Nomina
*';

comment on column PPAGOS.PAGO_CTABCO is 'CtaBco
Cuenta Bancaria a Depositar en Pago Electronico
*';

comment on column PPAGOS.PAGO_CHEQUE is 'Cheque
Numero de cheque
*';

comment on column PPAGOS.PAGO_FECCANCEL is 'Fecha Cancel
Fecha de cancelacion del Pago
*';

-- Create/Recreate primary, unique and foreign key constraints 
alter table PPAGOS
  add constraint PK$PPAGOS$PAGO primary key (PAGO_PAGO);

alter table PPAGOS
  add constraint FK$PPAGOS$BANCO foreign key (PAGO_BANCO)
  references FINANZAS.FBANCOS (BANC_BANCO);

alter table PPAGOS
  add constraint FK$PPAGOS$NOMINA foreign key (PAGO_NOMINA)
  references PACUMNOM (ACUM_NOMINA);

alter table PPAGOS
  add constraint FK$PPAGOS$NOMPER foreign key (PAGO_NOMPER)
  references PACUMNOM (ACUM_NOMINA);

alter table PPAGOS
  add constraint FK$PPAGOS$TEMPL foreign key (PAGO_TEMPL)
  references PTEMPLS (TEMP_TEMPL);

alter table PPAGOS
  add constraint FK$PPAGOS$TPLAZA foreign key (PAGO_TPLAZA)
  references PTPLAZAS (TPLA_TPLAZA);

alter table PPAGOS
  add constraint FK$PPAGOS$URES foreign key (PAGO_URES)
  references FINANZAS.FURES (URES_URES);

-- Create/Recreate check constraints 
alter table PPAGOS
  add constraint NN$PPAGOS$BANCO
  check (PAGO_Banco is not null);

alter table PPAGOS
  add constraint NN$PPAGOS$EMPL
  check (PAGO_EMPL IS NOT NULL);

alter table PPAGOS
  add constraint NN$PPAGOS$NOMINA
  check (PAGO_Nomina IS NOT NULL);

alter table PPAGOS
  add constraint NN$PPAGOS$NOMPER
  check (PAGO_NomPer IS NOT NULL);

alter table PPAGOS
  add constraint NN$PPAGOS$TEMPL
  check (PAGO_TEMPL IS NOT NULL);

alter table PPAGOS
  add constraint NN$PPAGOS$URES
  check (PAGO_URES IS NOT NULL);

-- Create/Recreate indexes 
create index IX$PPAGOS$BANCO on PPAGOS (PAGO_BANCO);

create index IX$PPAGOS$CHEQUE on PPAGOS (PAGO_CHEQUE);

create index IX$PPAGOS$CTABCO on PPAGOS (PAGO_CTABCO);

create index IX$PPAGOS$EMPL on PPAGOS (PAGO_EMPL);

create index IX$PPAGOS$NOMB on PPAGOS (PAGO_NOMB);

create index IX$PPAGOS$NOMINA on PPAGOS (PAGO_NOMINA);

create index IX$PPAGOS$NOMPER on PPAGOS (PAGO_NOMPER);

create index IX$PPAGOS$PSTO on PPAGOS (PAGO_PSTO);

create index IX$PPAGOS$REFER on PPAGOS (PAGO_REFER);

create index IX$PPAGOS$TEMPL on PPAGOS (PAGO_TEMPL);

create index IX$PPAGOS$URES on PPAGOS (PAGO_URES);


-- Grant/Revoke object privileges 
grant select, references on PPAGOS to ESCOLAR;

grant select on PPAGOS to REPDOC;




--***--------**-------------------****************--------------

CREATE OR REPLACE VIEW PVPAGOS As
Select
 PAGO_Pago    As VPAG_Pago,
 PAGO_Nomina  As VPAG_Nomina,
 PAGO_NomPer  As VPAG_NomPer,
 NOMI_Tipo    As VPAG_Tipo,
 NOMI_Fecha   As VPAG_Fecha,
 ACPA_Percs	  As VPAG_Percs,
 ACPA_Dedus   As VPAG_Dedus,
 ACPA_Ambos   As VPAG_Ambos,
 ACPA_Percs - ACPA_Dedus As VPAG_Neto,
 ACPA_Dias	  As VPAG_Dias,
 ACPA_FDias	  As VPAG_FDias,
 PAGO_Empl    As VPAG_Empl,
 SUBSTR(PERS_APEPAT||' '||PERS_APEMAT||' '||PERS_NOMBRE,1,45) As VPAG_Nombre,
 PAGO_TEmpl   As VPAG_TEmpl,
 PAGO_URes    As VPAG_URes,
 URES_Descrip As VPAG_UresDesc,
 PAGO_Nomb    As VPAG_Nomb,
 PAGO_TPlaza  As VPAG_TPlaza,
 PAGO_TPsto   As VPAG_TPsto,
 PAGO_Psto    As VPAG_Psto,
 PAGO_Categ   As VPAG_Categ,
 PAGO_Refer	  As VPAG_Refer,
 PAGO_Banco   As VPAG_Banco,
 PAGO_CtaBco  As VPAG_CtaBco,
 PAGO_Cheque  As VPAG_Cheque,
 PAGO_FecCancel As VPAG_FecCancel,
 CANC_Cancela As VPAG_Cancelado,
 CANC_Texto As VPAG_Texto
From FPERSONAS, PPAGOS, PACPAGOS, PNOMINAS, PCANCPAGO, FURES
Where PERS_Persona= PAGO_Empl
  And NOMI_Nomina= PAGO_Nomina
  And ACPA_Pago= PAGO_Pago
  And PAGO_Pago = CANC_Pago
  And Ures_Ures = Pago_Ures ;

/



--***--------**-------------------****************--------------


CREATE PUBLIC SYNONYM PVPAGOS FOR PERSONAL.PVPAGOS ;

COMMENT ON TABLE PERSONAL.PVPAGOS IS 'Vista de Pagos' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_Pago IS 'Pago
Numero de pago
00
*S' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_Nomina IS 'Nomina
Numero de Nomina donde se Aplica el Pago
01
*S' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_NomPer IS 'Nomina Per
Numero de Nomina donde pertence el Pago
02
*S' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_Tipo IS 'Tipo Nom
Tipo de Nomina, donde O=Ordinaria y C=Complementaria
03
*S' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_Fecha IS 'Fecha
Fecha de la nomina
04
*S' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_Percs IS 'Perceps
Total Percepciones
*C' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_Dedus IS 'Deducs
Total Deducciones
*C' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_Ambos IS 'Ambos
Total Ambos
*C' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_Neto IS 'Neto
Neto del Pago
05
*S
*C' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_Dias IS 'Dias
Dias de Antiguedad a considerar en el pago
06
*S' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_FDias IS 'Dias Falta
Dias Faltados
*' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_Empl IS 'Empleado
Empleado
07
*S' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_Nombre IS 'Nombre
Nombre del Empleado
08
*S' ;


COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_TEmpl IS 'Tipo Empl
Tipo de Empleado
09
*S' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_URes IS 'U Resp
Ures
10
*S' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_UResDesc IS 'Unidad Responsable
Unidad responsable
11
*S' ;


COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_Nomb IS 'Nombramiento
Numero de Nombramiento
12
*S' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_TPlaza IS 'TPlaza
Tipo de Plaza
*' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_TPsto IS 'TPuesto
Tipo de Puesto
13
*S' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_Psto IS 'Puesto
Puesto
14
*S' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_Categ IS 'Categ
Categoria del Puesto
15
*S' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_Refer IS 'Referencia
Referencia adicional del Pago
*' ;


COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_Banco IS 'Banco
Cuenta de Banco a pagar, cuando es diferente al de la Nomina
*' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_CtaBco IS 'CtaBanco
Cuenta de Banco a Depositar para pago Electronico
*' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_Cheque IS 'Cheque
Numero de cheque
16
*S' ;

COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_FecCancel IS 'Fecha Cancel
Fecha de cancelacion del pago
17
*S' ;


COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_CANCELADO IS 'Cancelado
Pago Cancelado S/N
18
*S' ;


COMMENT ON COLUMN PERSONAL.PVPAGOS.VPAG_TEXTO IS 'Texto
Motivo de la Cancelacion
19
*S' ;


--***********-----------------***********-----------------*********


--***--------**-------------------****************--------------


--**************************-----------------------------************

create or replace trigger "PERSONAL".TAI_PPAGOS
AFTER Insert ON PPAGOS FOR EACH ROW

declare
 cnt Integer ;
BEGIN
 INSERT INTO PACPAGOS (ACPA_Pago, ACPA_Nomina, ACPA_Empl)
 VALUES(:new.PAGO_Pago, :new.PAGO_Nomina, :new.PAGO_Empl)  ;

 SELECT Count(*) into cnt
 FROM PACNOMEMP
 WHERE ACNO_Empl= :new.PAGO_Empl
   And ACNO_Nomina= :new.PAGO_Nomina ;

 if cnt= 0 then
  INSERT INTO PACNOMEMP (ACNO_Empl, ACNO_Nomina)
  VALUES (:new.PAGO_Empl, :new.PAGO_Nomina) ;
 end if ;

 
 INSERT INTO PCANCPAGO(CANC_Pago, CANC_Cancela)
 VALUES(:new.PAGO_Pago, 'N')  ;
 
 
END ;
/



--**************************-----------------------------************


CREATE OR REPLACE TRIGGER TAD_PPAGOS
AFTER Delete ON PPAGOS FOR EACH ROW



BEGIN

-- Quitamos Relaciones en PDPAGOS
 
 UPDATE PDPAGOS A Set
  DPAG_CDPAGO= Null
 WHERE DPAG_DPago in
  (SELECT DPAG_CDPago
   FROM PDPAGOS
   Where DPAG_Pago= :old.PAGO_Pago
     And DPAG_CDPago is not null) ; 

-- Delete From PDPAGOS
-- Where DPAG_PerDed= 'D'
--   And DPAG_Pago= :old.PAGO_Pago ;

 Delete From PDPAGOS
 Where DPAG_Pago= :old.PAGO_Pago ;

 Delete From PACPAGOS
 Where ACPA_Pago= :old.PAGO_Pago ;


 Delete From PCANCPAGO
 Where CANC_Pago= :old.PAGO_Pago ;


END ;
/



--**************************-----------------------------************

CREATE OR REPLACE TRIGGER TAU_PPAGOS
AFTER UPDATE OF PAGO_FecCancel  ON PPAGOS FOR EACH ROW



DECLARE
 Cursor Poliza is
 SELECT
  BANCO, SFDO, PROG, URES, CNTA, SCTA, TMOVI, SUM(Monto) As Monto
 FROM
 (
  SELECT
   DECODE(DPAG_PerDed, 'A', 'a@#', :new.PAGO_Banco) Banco,
   DPAG_DPago DPago,
   DPPA_SFdo SFdo,
   DPPA_Prog Prog,
   DPPA_URes URes,
   DPAG_Cnta Cnta,
   DPAG_Scta Scta,
   DECODE(DPAG_PerDed, 'D', DECODE(DPAG_Signo, 1, 'A', 'C'), DECODE(DPAG_Signo, 1, 'C', 'A') ) As TMovi,
    DPAG_Signo * ROUND(DPAG_Monto * DPPA_Porc/100,2)+ DECODE(PDPPAGOS.rowid, rowidx, DPAG_Monto - Montox, 0) As Monto,
  'c' As tt
  FROM PDPAGOS, PDPPAGOS, PDATPER,
  (SELECT
    DPAG_Pago As Pagox,
    DPAG_DPago As DPagox,
    MIN(PDPPAGOS.rowid) As rowidx,
    SUM(ROUND(DPAG_Monto * DPPA_Porc/100,2)) As Montox
   FROM PDPAGOS, PDPPAGOS
   WHERE DPPA_Pago= DPAG_Pago
     And DPAG_Pago= :new.PAGO_Pago
   GROUP BY DPAG_Pago, DPAG_DPago)
 WHERE DPAG_PerDed <> 'X'
   And DPAG_Pago= :new.PAGO_Pago
   And DPAG_ConP <> DATP_CONP_Terc
   And DPPA_Pago= DPAG_Pago
   And PAGOx= DPAG_Pago
   And DPagox= DPAG_DPago

 UNION

 SELECT
  DECODE(DPAG_PerDed, 'A', 'a@#', :new.PAGO_Banco),
  DPAG_DPago DPago,
  DPPA_SFdo SFdo,
  DPPA_Prog Prog,
  DPPA_URes URes,
  DECODE(DPAG_PerDed, 'A', CONC_Cnta, CUEN_Cnta) Cnta,
  DECODE(DPAG_PerDed, 'A', NVL(CONC_Scta, :new.PAGO_Empl), :new.PAGO_Banco) Scta,
  'A' As TMovi,
  DECODE(DPAG_PerDed, 'D', DECODE(DPAG_Signo, 1, -1, 1), DECODE(DPAG_Signo, 1, 1, -1) ) *
  DPAG_Signo * ROUND(DPAG_Monto * DPPA_Porc/100,2)+ DECODE(PDPPAGOS.rowid, rowidx, DPAG_Monto - Montox, 0) As Monto,
  'a' As tt
 FROM PDPAGOS, PDPPAGOS, FCUENTAS, PDATPER, PCONCEPTO,
  (SELECT
    DPAG_Pago As Pagox,
    DPAG_DPago As DPagox,
    MIN(PDPPAGOS.rowid) As rowidx,
    SUM(ROUND(DPAG_Monto * DPPA_Porc/100,2)) As Montox
   FROM PDPAGOS, PDPPAGOS
   WHERE DPPA_Pago= DPAG_Pago
     And DPAG_Pago= :new.PAGO_Pago
   GROUP BY DPAG_Pago, DPAG_DPago)
 WHERE DPAG_PerDed <> 'X'
  And DPAG_Pago= :new.PAGO_Pago
  And DPAG_ConP <> DATP_CONP_Terc
  And DPPA_Pago= DPAG_Pago
  And CONC_ConP= DPAG_ConP
  And CUEN_ICta= '1102'
  And PAGOx= DPAG_Pago
  And DPagox= DPAG_DPago
 )
 GROUP BY BANCO, SFDO, PROG, URES, CNTA, SCTA, TMOVI
 ORDER BY BANCO, SFDO, DECODE(TMOVI, 'C',1,2), CNTA, SCTA ;
 rPoliza Poliza%RowType ;

 Polid Number ;
 banco varchar2(12) ;

BEGIN


-- Cuando Descancela
 if :new.PAGO_FecCancel is null then

-- Descancelamos Detalle de Pago
  UPDATE PDPAGOS Set
   DPAG_CDPago= Null
  Where DPAG_Pago= :new.PAGO_Pago ;

  -- Cancelamos polizas
  INSERT INTO FCANPOLI (CANP_Polid,CANP_FecCancel)
  SELECT POLC_Polid, :old.PAGO_FecCancel
  FROM PPOLCPAGOS
  WHERE POLC_Pago= :new.PAGO_Pago ;

  DELETE FROM PPOLCPAGOS
  WHERE POLC_Pago= :new.PAGO_Pago ;

  return ;
 end if ;


-- Cuando Cancela
 UPDATE PDPAGOS Set
  DPAG_CDPago= DPAG_DPago
 Where DPAG_Pago= :new.PAGO_Pago ;

-- Generamos las Polizas de Reversa

 open poliza ;
 fetch poliza into rPoliza ;

 loop
  exit when poliza%NotFound ;
  banco := rPoliza.Banco ;

-- Insertamos Encabezado de la Poliza
  INSERT INTO FPOLIZAS
   (POLI_Polid, POLI_TIPDOC, POLI_Fecha, POLI_Descrip)
  SELECT
   FSQPolid.NextVal, 'CP', :new.PAGO_FecCancel, 'CANCEL PAGO NOMINA '||TO_Char(:new.PAGO_Pago)
  FROM DUAL ;

-- Insertamos en el Listado de Polizas
  INSERT INTO PPOLCPAGOS
   (POLC_Pago, POLC_Polid)
  VALUES
   (:new.PAGO_Pago, FSQPolid.CurrVal) ;


  while banco= rPoliza.Banco loop --> Una Poliza X Banco

   INSERT INTO FDETMOVI
    (DETM_RngId, DETM_Polid, DETM_Item, DETM_Reng, DETM_SFdo, DETM_URes,
     DETM_Prog, DETM_Cnta, DETM_SCta,  DETM_TMov, DETM_Monto, DETM_Descrip)
   VALUES
    (FSQRngId.NextVal, FSQPolid.CurrVal, 1, 1, rPoliza.SFdo, rPoliza.URes,
     rPoliza.Prog, rPoliza.Cnta, rPoliza.Scta, rPoliza.TMovi, -rPoliza.Monto,
     'CANCEL PAGO NOMINA '||TO_Char(:new.PAGO_Pago)) ;
   fetch poliza into rPoliza ;
   exit when poliza%NotFound ;
  end loop ;
 end loop ;


END ;

/


--**************************-----------------------------************

CREATE OR REPLACE TRIGGER TBU_PPAGOS
BEFORE UPDATE OF PAGO_FecCancel ON PPAGOS FOR EACH ROW



DECLARE
 Contab varchar2(1) ;
BEGIN
 SELECT NOMI_Contab
 Into Contab
 From PNOMINAS
 WHERE NOMI_Nomina= :new.PAGO_Nomina ;

 if Contab= 'N' then
  Raise_Application_Error(-20001, 'Nomina no esta cancelada, no se puede Cancelar Pago') ;
 end if ;

 if :old.PAGO_FecCancel is not null And :new.PAGO_FecCancel is not null then
  Raise_Application_Error(-20001, 'Pago ya esta Cancelado') ;
 end if ;

 if :old.PAGO_FecCancel is null And :new.PAGO_FecCancel is null then
  Raise_Application_Error(-20001, 'Pago no esta Cancelado') ;
 end if ;

END ;


/
--**************************-----------------------------************

--**************************-----------------------------************

--**************************-----------------------------************

--**************************-----------------------------************
