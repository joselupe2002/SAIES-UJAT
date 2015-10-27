CONNECT PERSONAL/PERSONAL@SAIES1;


INSERT INTO SMODULOS(MODU_MODULO, MODU_PRED, MODU_DESCRIP, MODU_APLICACION,MODU_DETALLE,
 MODU_MANTEN, MODU_REPORTE, MODU_VERSION, MODU_SCRIPT, MODU_INSERTA, MODU_EDITA, MODU_BORRA)
 VALUES('PVHFALTAS','PHASMOV1','Faltas HAS',0,'S','S','S','3.0.0.0','PVHFALT','S','S','S');




----------------
----------------
--- TABLA ------
----------------
----------------


create table PHFALTAS
(
  FALT_NOMB NUMBER(10) not null,
  FALT_FECHA DATE not null,
  FALT_TFALTA VARCHAR2(2),
  FALT_GOCE VARCHAR2(1) default 'N',
  FALT_TEXTO VARCHAR2(300),
  FALT_NOMINA NUMBER(10),
  FALT_USU VARCHAR2(30) default user,
  FALT_FEC DATE default sysdate,
  FALT_HORAS NUMBER(10,2),
  FALT_FECHAF DATE
);

-- Add comments to the table 
comment on table PHFALTAS is 'Tabla de Faltas HAS';

-- Add comments to the columns 
comment on column PHFALTAS.FALT_NOMB is 'Nombramiento
Nombramiento que Falta
*';

comment on column PHFALTAS.FALT_FECHA is 'Fecha
Fecha de la Falta
*';

comment on column PHFALTAS.FALT_TFALTA is 'Tipo Falta
Tipo de Falta
*';

comment on column PHFALTAS.FALT_GOCE is 'Goce
Indica si la falta es con goce de sueldo o no
*';

comment on column PHFALTAS.FALT_TEXTO is 'Texto
Texto descriptivo de la falta
*';

comment on column PHFALTAS.FALT_NOMINA is 'Nomina
Nomina donde se Aplica la Falta
*';

comment on column PHFALTAS.FALT_USU is 'Usuario Reg
Usuario que registra la falta
*';

comment on column PHFALTAS.FALT_FEC is 'Fecha Reg
Fecha de Registro de la Falta
*';

comment on column PHFALTAS.FALT_HORAS is 'Horas
Horas faltadas (Para docentes)
*';

comment on column PHFALTAS.FALT_FECHAF is 'Fecha Fin
Fecha de fin de la falta
*';





-- Create/Recreate primary, unique and foreign key constraints 
alter table PHFALTAS
  add constraint PK$PHFALTAS$FECHA primary key (FALT_NOMB,FALT_FECHA);

alter table PHFALTAS add constraint FK$PHFALTAS$NOMINA foreign key (FALT_NOMINA)
  references PHACUMNOM (ACUM_NOMINA);

alter table PHFALTAS add constraint FK$PHFALTAS$TFALTA foreign key (FALT_TFALTA)
  references PHTFALTA (TFAL_TFALTAH);

-- Create/Recreate check constraints 
alter table PHFALTAS add constraint CC$PHFALTAS$GOCE
  check (FALT_GOCE IN ('S','N'));

alter table PHFALTAS add constraint NN$PHFALTAS$GOCE
  check (FALT_GOCE IS NOT NULL);

alter table PHFALTAS add constraint NN$PHFALTAS$TFALTA
  check (FALT_TFalta IS NOT NULL);

-- Create/Recreate indexes 
create index IX$PHFALTAS$FECHA on PHFALTAS (FALT_FECHA);

create index IX$PHFALTAS$NOMB on PHFALTAS (FALT_NOMB);

create index IX$PHFALTAS$NOMINA on PHFALTAS (FALT_NOMINA);



----sinonimos

CREATE PUBLIC SYNONYM PHFALTAS FOR PERSONAL.PHFALTAS

-- Grant/Revoke privileges 
grant select on PHFALTAS to PUBLIC;
grant select on PHFALTAS to REPDOC;


---*****************---------------************--------------------*****************-------------------------------*


----------------
----------------
--- TRIGGERS ---
----------------
----------------

create or replace trigger PERSONAL.TBD_PHFALTAS
BEFORE DELETE ON PERSONAL.PHFALTAS FOR EACH ROW

BEGIN

-- No se puede Cambiar Falta con Nomina
 if :old.FALT_Nomina is not null  then
  Raise_Application_Error(-20001, 'No se puede borrar Falta con nómina aplicada' ) ;
 end if ;

END ;

/


create or replace trigger PERSONAL.TBU_PHFALTAS
BEFORE UPDATE ON PERSONAL.PHFALTAS FOR EACH ROW

DECLARE
 cnt Integer ;
BEGIN

-- No se puede Cambiar Falta con Nomina
 if not UPDATING('FALT_Nomina')
  and :old.FALT_Nomina is not null  then
  Raise_Application_Error(-20001, 'No se puede modificar Falta con nómina aplicada' ) ;
 end if ;

END ;

/





--************-----------******************--------------------------********************-----------------*********

----------------
----------------
--- VISTAS -----
----------------
---------------- 


CREATE OR REPLACE VIEW PVHFALTAS As 
SELECT
 FALT_Nomb	 As VFAL_Nomb,
 FALT_Fecha	 As VFAL_Fecha,
 FALT_Fechaf As VFAL_Fechaf,
 FALT_Horas  As VFAL_Horas,
 NOMB_Empl	 As VFAL_Empl,
 SUBSTR(PERS_NOMBRE||' '||PERS_APEPAT||' '||PERS_APEMAT,1,45) As VFAL_Nombre,
 FALT_TFalta As VFAL_TFaltaH,
 FALT_Goce	 As VFAL_Goce,
 FALT_Texto	 As VFAL_Texto,
 FALT_Nomina As VFAL_Nomina
FROM FPERSONAS, PHNOMBRAM, PHFALTAS
Where NOMB_Nomb= FALT_Nomb 
 And PERS_Persona= NOMB_Empl;


CREATE PUBLIC SYNONYM PVHFALTAS FOR PERSONAL.PVHFALTAS ;

COMMENT ON TABLE PVFALTAS IS 'Vista de Tabla de Faltas HAS' ;

COMMENT ON COLUMN PERSONAL.PVHFALTAS.VFAL_Nomb IS 'Nombramiento
Nombramiento que Falta
00
*S' ;

COMMENT ON COLUMN PERSONAL.PVHFALTAS.VFAL_Fecha IS 'Fecha
Fecha de la Falta
01
*S' ;

COMMENT ON COLUMN PERSONAL.PVHFALTAS.VFAL_Fechaf IS 'Fecha Fin
Fecha de fin de la Falta
02
*S' ;

COMMENT ON COLUMN PERSONAL.PVHFALTAS.VFAL_Horas IS 'Horas
Horas faltadas (Para docentes)
03
*S' ;


COMMENT ON COLUMN PERSONAL.PVHFALTAS.VFAL_Empl IS 'Empleado
Prestador de servicios que Falta
04
*S' ;

COMMENT ON COLUMN PERSONAL.PVHFALTAS.VFAL_Nombre IS 'Nombre
Nombre
05
*S' ;

COMMENT ON COLUMN PERSONAL.PVHFALTAS.VFAL_TFaltaH IS 'Tipo Falta
Tipo de Falta
06
*S' ;

COMMENT ON COLUMN PERSONAL.PVHFALTAS.VFAL_Texto IS 'Texto
Texto descriptivo de la falta
*' ;


COMMENT ON COLUMN PERSONAL.PVHFALTAS.VFAL_Goce IS 'Goce
Indica si la falta es con goce de sueldo o no
07
*S' ;

COMMENT ON COLUMN PERSONAL.PVHFALTAS.VFAL_Nomina IS 'Nomina
Nómina donde se Aplica la Falta
08
*S' ;



----------------
----------------
--- TRIGGERS ---
----------------
----------------

----------------------------------------------------------------------------------------------------------------

create or replace trigger PERSONAL.TII_PVHFALTAS
INSTEAD OF INSERT ON PERSONAL.PVHFALTAS FOR EACH ROW

DECLARE

 vFecha Date;

BEGIN

     if :new.VFAL_Fecha > :new.VFAL_Fechaf then
        Raise_Application_Error(-20001,'La fecha de Fin debe ser mayor a la fecha de Inicio');
     end if;

     vFecha := :new.VFAL_Fecha;

     --while :new.VFAL_Fechaf > vFechaf loop
     loop
       INSERT INTO PHFALTAS
       (FALT_Nomb, FALT_Fecha, FALT_Fechaf, FALT_Horas, FALT_TFalta, FALT_Goce, FALT_Texto)
       Values
       (:new.VFAL_Nomb, vFecha, vFecha, :new.VFAL_Horas, :new.VFAL_TFaltaH, :new.VFAL_Goce, :new.VFAL_Texto) ;
 
       vfecha := vfecha + 1;

       exit when Vfecha > :new.VFAL_Fechaf;
     end loop;         
     
END ;
/






*******TIPOS DE FALTA************************

create table PHTFALTA
(
  TFAL_TFALTAH  VARCHAR2(2) not null,
  TFAL_DESCRIP VARCHAR2(35),
  TFAL_DESCANT VARCHAR2(1) default 'N',
  TFAL_TEXTO   VARCHAR2(300)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );


-- Add comments to the table 
comment on table PHTFALTA
  is 'Tipos de Falta';



-- Add comments to the columns 
comment on column PHTFALTA.TFAL_TFALTAH
  is 'Tipo
Tipo de Falta
*';
comment on column PHTFALTA.TFAL_DESCRIP
  is 'Descripción
Descripcion
*';
comment on column PHTFALTA.TFAL_DESCANT
  is 'Desc Antig
Indica si la Falta descuenta o no Antiguedad
*';
comment on column PHTFALTA.TFAL_TEXTO
  is 'Texto
Texto Descriptivo de la Falta
*';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PHTFALTA
  add constraint PK$PHTFALTA$TFALTAH primary key (TFAL_TFALTAH)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate check constraints 
alter table PHTFALTA
  add constraint CC$PHTFALTA$DESCANT
  check (TFAL_DescAnt IN ('S','N'));

alter table PHTFALTA
  add constraint NN$PHTFALTA$DESCANT
  check (TFAL_DescAnt IS NOT NULL);

alter table PHTFALTA
  add constraint NN$PHTFALTA$DESCRIP
  check (TFAL_Descrip IS NOT NULL);


--SINONIMO

CREATE PUBLIC SYNONYM PHTFALTA FOR PERSONAL.PHTFALTA ;

-- Grant/Revoke object privileges 

grant select on PHTFALTA to REPDOC;


****CJA TIPO FALTA

INSERT INTO SREFDESC(REFD_CAMPO, REFD_SCRIPT, REFD_SQL)
 VALUES('TFALTAH','PFH_001','SELECT
 TFAL_TFaltah As Tipo,
 TFAL_Descrip As Descripcion
From PHTFALTA
      WHERE 1=1');




SELECT
 TFAL_TFalta As Tipo,
 TFAL_Descrip As Descripcion
From PHTFALTA


--COPIAR DATOS
-- select t.*, t.rowid from phtfalta t