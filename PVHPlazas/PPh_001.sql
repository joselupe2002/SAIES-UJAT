--*-*-*-*crea plazas personal externo


CONNECT SHAKE/SHAKE@BD;

INSERT INTO SMODULOS(MODU_MODULO, MODU_PRED, MODU_DESCRIP, MODU_APLICACION,MODU_DETALLE,
 MODU_MANTEN, MODU_REPORTE, MODU_VERSION, MODU_SCRIPT, MODU_INSERTA, MODU_EDITA, MODU_BORRA)
VALUES('PVHPLAZAS','PNOMISH','Plazas HAS','0','S','N','N','3.0.0.0','Pph_001','S','S','S');	

INSERT INTO SREFDESC(REFD_CAMPO, REFD_SCRIP, REFD_SQL)
VALUES('CATEGH','PPh_001','SELECT
 CPUE_Categ AS Categoria,
 CPUE_Descrip AS Descripcion,
 PUES_DESCRIP AS Puesto
 FROM PHCPUESTOS, PHPUESTOS
Where PUES_PSTO = CPUE_Psto');


INSERT INTO SREFDESC(REFD_CAMPO, REFD_SCRIP, REFD_SQL)
VALUES('EMPLH','PPh_001','SELECT 
 PERS_Persona As Empleado,
 SUBSTR(PERS_NOMBRE||' '||PERS_APEPAT||' '||PERS_APEMAT,1,50) As Nombre_Completo,
 PERS_NOMBRE As Nombre,
 PERS_ApePat As ApePat,
 PERS_ApeMat As ApeMat
FROM FPersonas, Pemplhas
WHERE empl_persona = PERS_Persona');

COMMIT;


--**--*-*-*-*---**--*-*-*-*---**--*-*-*-*---**--*-*-*-*---**--*-*-*-*---**--*-*-*-*---**--*-*-*-*-

CONNECT PERSONAL/PERSONAL@BD;


create table PhPLAZAS
(
  PLAZ_PLAZA   NUMBER(10) not null,
  PLAZ_TPLAZA  VARCHAR2(8),
  PLAZ_URES    VARCHAR2(8),
  PLAZ_SFDO    VARCHAR2(8),
  PLAZ_PSTO    VARCHAR2(10),
  PLAZ_HORAS   NUMBER(3),
  PLAZ_SLDO    NUMBER(15,2),
  PLAZ_DOCEN   NUMBER(6,2) default 0,
  PLAZ_INI     DATE,
  PLAZ_FIN     DATE,
  PLAZ_STATUS  VARCHAR2(1) default 'A',
  PLAZ_NOMB    NUMBER(10),
  PLAZ_INOMB   DATE,
  PLAZ_FNOMB   DATE,
  PLAZ_USU     VARCHAR2(30) default USER,
  PLAZ_FEC     DATE default SYSDATE,
  PLAZ_REEMPLA NUMBER(10),
  PLAZ_PROMEP  VARCHAR2(1),
  PLAZ_AREA    VARCHAR2(1)
);


CREATE PUBLIC SYNONYM PHPLAZAS FOR PERSONAL.PHPLAZAS;


-- Add comments to the table 
comment on table PHPLAZAS is 'Plazas
Plazas';

-- Add comments to the columns 
comment on column PHPLAZAS.PLAZ_PLAZA is 'Plaza
Numero de Plaza
*';

comment on column PHPLAZAS.PLAZ_TPLAZA is 'Tipo Plaza
Tipo de Plaza
*';

comment on column PHPLAZAS.PLAZ_URES is 'URes
Clave de la Unidad Responsable
*';

comment on column PHPLAZAS.PLAZ_SFDO is 'SFdo
Clave del SubFondo por Default
*';

comment on column PHPLAZAS.PLAZ_PSTO is 'Puesto
Clave del Puesto
*';

comment on column PHPLAZAS.PLAZ_HORAS is 'Horas
Horas por semana del puesto
*';

comment on column PHPLAZAS.PLAZ_SLDO is 'Sueldo
Sueldo de la plaza para sueldos alternos
*';

comment on column PHPLAZAS.PLAZ_DOCEN is 'Docencia
Porcentaje de la plaza dedicado a la docencia
*';

comment on column PHPLAZAS.PLAZ_INI is 'Inicio
Fecha de inicio de la Plaza
*';

comment on column PHPLAZAS.PLAZ_FIN is 'Fin
Fecha de fin de la Plaza
*';

comment on column PHPLAZAS.PLAZ_STATUS is 'Status
Indica el status de la Plaza, donde A=Abierta y C=Cerrada
*';

comment on column PHPLAZAS.PLAZ_USU is 'Usuario
Usuario de ultima modificacion
*';

comment on column PHPLAZAS.PLAZ_FEC is 'Fec
Fecha de ultima modificacion
*';

comment on column PHPLAZAS.PLAZ_REEMPLA is 'Reemplaza
Nombramiento al que reemplaza
*';

comment on column PHPLAZAS.PLAZ_PROMEP is 'PROMEP
Identifica si es Plaza PROMEP
*';

comment on column PHPLAZAS.PLAZ_AREA is 'AREA
Identifica si es Area Contable o de Jardineria
*';

-- Create/Recreate primary, unique and foreign key constraints 
alter table PHPLAZAS
  add constraint PK$PHPLAZAS$PLAZA primary key (PLAZ_PLAZA);

alter table PHPLAZAS
  add constraint FK$PHPLAZAS$SFDO foreign key (PLAZ_SFDO)
  references FINANZAS.FSFONDOS (SFON_SFDO);

alter table PHPLAZAS
  add constraint FK$PHPLAZAS$TPLAZA foreign key (PLAZ_TPLAZA)
  references PTPLAZAS (TPLA_TPLAZA);

alter table PHPLAZAS
  add constraint FK$PHPLAZAS$URES foreign key (PLAZ_URES)
  references FINANZAS.FURES (URES_URES);

-- Create/Recreate check constraints 
alter table PHPLAZAS
  add constraint CC$PHPLAZAS$AREA
  check (PLAZ_AREA in ('S','N'));

alter table PHPLAZAS
  add constraint CC$PHPLAZAS$FIN
  check (PLAZ_FIN >= PLAZ_INI);

alter table PHPLAZAS
  add constraint CC$PHPLAZAS$FNOMB
  check (PLAZ_FNOMB <= PLAZ_FIN);

alter table PHPLAZAS
  add constraint CC$PHPLAZAS$HORAS
  check (PLAZ_Horas > 0);

alter table PHPLAZAS
  add constraint CC$PHPLAZAS$INOMB
  check (PLAZ_INOMB >= PLAZ_INI);

alter table PHPLAZAS
  add constraint CC$PHPLAZAS$PROMEP
  check (PLAZ_PROMEP in ('S','N'));

alter table PHPLAZAS
  add constraint CC$PHPLAZAS$STATUS
  check (PLAZ_STATUS IN ('A','C'));

alter table PHPLAZAS
  add constraint CC$PHPLAZAS$XNOMB
  check ((PLAZ_Nomb is null and PLAZ_INomb is null and PLAZ_FNomb is null) or    (PLAZ_Nomb is not null and PLAZ_INomb is not null and PLAZ_FNomb is not null));

alter table PHPLAZAS
  add constraint NN$PHPLAZAS$FIN
  check (PLAZ_FIN IS NOT NULL);

alter table PHPLAZAS
  add constraint NN$PHPLAZAS$INI
  check (PLAZ_INI IS NOT NULL);

alter table PHPLAZAS
  add constraint NN$PHPLAZAS$PSTO
  check (PLAZ_PSTO IS NOT NULL);

alter table PHPLAZAS
  add constraint NN$PHPLAZAS$SFDO
  check (PLAZ_Docen is null or PLAZ_SFdo is not null);

alter table PHPLAZAS
  add constraint NN$PHPLAZAS$STATUS
  check (PLAZ_STATUS IS NOT NULL);

alter table PHPLAZAS
  add constraint NN$PHPLAZAS$TPLAZA
  check (PLAZ_TPLAZA IS NOT NULL);

alter table PHPLAZAS
  add constraint NN$PHPLAZAS$URES
  check (PLAZ_URES IS NOT NULL);

-- Create/Recreate indexes 
create index INDX_PhPLAZA_PLAZA_PTO on PHPLAZAS (PLAZ_PLAZA,PLAZ_PSTO);

create index IX$PHPLAZAS$PSTO on PHPLAZAS (PLAZ_PSTO);

create index IX$PHPLAZAS$REEMPLA on PHPLAZAS (PLAZ_REEMPLA);

create index IX$PHPLAZAS$SFDO on PHPLAZAS (PLAZ_SFDO);

create index IX$PHPLAZAS$TPLAZA on PHPLAZAS (PLAZ_TPLAZA);

create index IX$PHPLAZAS$URES on PHPLAZAS (PLAZ_URES);



--**--*-*--**--*-*--**--*-*--**--*-*--**--*-*--**--*-*--**--*-*--**--*-*--**--*-*--**--*-*--**--*-*--**--*-*--**--*-*
CREATE OR REPLACE TRIGGER TBIU_PHPLAZAS
BEFORE INSERT OR UPDATE ON PERSONAL.PHPLAZAS FOR EACH ROW



DECLARE
 FPago varchar2(1) ;
 Cnt Number ;
 Psto varchar2(10) ;
 cini Date ;
 cfin Date ;
BEGIN

-- Revisamos Fecha de Fin
 if :new.PLAZ_Fin is null then
  :new.PLAZ_Fin := TO_Date('31/12/3000', 'DD/MM/YYYY') ;
 end if ;


-- Identificamos como abierto al status

 if UPDATING('PLAZ_Status') then
  return ;
 else
  :new.PLAZ_Status := 'A' ;
 end if ;


-- Checamos que puesto con horas tenga horas

 Select Count(*) Into cnt
 From PHPuestos
 Where PUES_PSto = :new.PLAZ_Psto ;

 if cnt= 0 then
  Raise_Application_Error(-20001, 'Puesto no existe') ;
 end if ;

 Select PUES_Fpago Into FPago
 From PHPuestos
 Where PUES_PSto = :new.PLAZ_Psto ;

 if NVL(FPago,'x')= 'H' And :new.PLAZ_Horas Is null then
   Raise_Application_Error(-20001, 'Debe especificar las horas para el Puesto') ;
 end if ;

-- Checamos si cambia puesto

 if UPDATING And (
  :old.PLAZ_Psto <> :new.PLAZ_Psto or
  :old.PLAZ_Horas <> :new.PLAZ_Horas  or
  :old.PLAZ_Ures <> :new.PLAZ_Ures ) 
  then

  SELECT COUNT(*) into cnt
  FROM PHPAGOS
  WHERE rownum= 1
   And PAGO_NOMB IN
  (SELECT NOMB_NOMB
   FROM PHNombram
   Where NOMB_Plaza= :new.PLAZ_Plaza)
   And PAGO_FecCancel is null ;

  if cnt <> 0 then
   Raise_Application_Error(-20001, 'No se puede cambiar Puesto, Horas ó Ures en Plaza con Nombramientos con Pagos') ;
  end if ;

 end if ;

END ;

/

--**--*-*-*---**--*-*-*---**--*-*-*---**--*-*-*---**--*-*-*---**--*-*-*---**--*-*-*---**--*-*-*---**--*-*-*---**--*-*-*-

CREATE OR REPLACE TRIGGER TBU_PHPLAZAS
BEFORE UPDATE of PLAZ_Status ON PERSONAL.PHPLAZAS FOR EACH ROW



DECLARE
 suma Number(6,2) ;
BEGIN
 if :new.PLAZ_Status <> 'C' then
  return ;
 end if ;

 Select Sum(PLAZ_Porc) into suma
 From PHPLAZPROG
 Where PLAZ_Plaza= :new.PLAZ_Plaza ;

 if  (NVL(suma,0) + NVL(:new.PLAZ_Docen,0)) <> 100 then
   Raise_Application_Error(-20001, 'Suma de porcentajes en programas debe ser igual a 100') ;
 end if ;

END ;
/



--**--*-*--**--*-*--**--*-*--**--*-*--**--*-*--**--*-*--**--*-*--**--*-*--**--*-*--**--*-*--**--*-*--**--*-*--**--*-*



--recrea la vista de PVHplazas
CREATE OR REPLACE VIEW PVHplazas AS
Select
 PLAZ_Plaza	As VPLA_Plaza,
 PLAZ_TPlaza	As VPLA_TPlaza,
 PLAZ_SFdo    As VPLA_SFdo,
 PLAZ_URes    As VPLA_URes,
 PUES_TPsto   As VPLA_TPsto,
 PLAZ_Psto    As VPLA_Psto,
 PLAZ_Horas   As VPLA_Horas,
 DECODE(PUES_Suel_Alt, 'S', PLAZ_Sldo,
  DECODE(PUES_FPago, 'H', PLAZ_Horas * SPUE_Sueldo, SPUE_Sueldo)) As VPLA_Sldo,
 PLAZ_Docen   As VPLA_Docen,
 PLAZ_Ini     As VPLA_Ini,
 PLAZ_Fin     As VPLA_Fin,
 PLAZ_Nomb	As VPLA_Nomb,
 NOMB_Empl	As VPLA_Empl,
 --NVL(B.CPUE_Categ, A.CPUE_Categ) As VPLA_Categ,
 NOMB_CATEG AS VPLA_Categ,
 PLAZ_INomb	As VPLA_INomb,
 PLAZ_FNomb	As VPLA_FNomb,
 NOMB_Descrip As VPLA_NDescrip,
 PLAZ_Reempla As VPLA_Reempla,
 PLAZ_PROMEP As VPLA_PROMEP,
 PLAZ_AREA As VPLA_AREA
From PHPLAZAS, PHPUESTOS, PHCPUESTOS A, PHSPUESTOS, PHNOMBRAM, PHCPUESTOS B
Where PUES_Psto= PLAZ_Psto
 And A.CPUE_Psto= PUES_Psto
 And A.CPUE_Categ= PUES_Categ_Defa
 And SPUE_Spue= A.CPUE_SPue
 And NOMB_Nomb(+)= PLAZ_Nomb
 And B.CPUE_Psto= PLAZ_Psto
 And B.CPUE_Categ=
(
 SELECT DECODE(Count(*), 0, PUES_Categ_Defa, MAX(CATE_Categ))
 From PCATEMPL
 Where CATE_Empl= NVL(NOMB_Empl,'x')
   And CATE_Psto= PLAZ_Psto
);
/



CREATE PUBLIC SYNONYM PVHplazas FOR PERSONAL.PVHplazas;

--comments
COMMENT ON TABLE PERSONAL.PVHplazas IS 'Vista de Plazas
Vista de Plazas' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_PLAZA IS 'Plaza
Numero de Plaza
00
*S' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_TPLAZA IS 'Tipo Plaza
Tipo de Plaza
01
*S' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_SFdo IS 'SFdo
Clave del subfondo
02
*S' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_URES IS 'URes
Clave de la Unidad Responsable
03
*S' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_TPSTO IS 'T Puesto
Tipo de Puesto
04
*S' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_PSTO IS 'Puesto
Clave del Puesto
05
*S' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_HORAS IS 'Horas
Horas por semana del puesto
06
*S' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_SLDO IS 'Sueldo
Sueldo Mensual de la Plaza
07
*S
*C' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_Docen IS 'Docencia
Porcentaje de la plaza dedicado a la docencia
*' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_INI IS 'Inicio
Fecha de inicio de la Plaza
08
*S' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_FIN IS 'Fin
Fecha de fin de la Plaza
09
*S' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_Nomb IS 'Nombramiento
Nombramiento activo en la plaza
*' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_Empl IS 'Empleado
Empleado activo en la plaza
10
*S' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_Categ IS 'Categoria
Categoria del Nombramiento
*' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_INomb IS 'Inicio del Nombramiento
Inicio del Nombramiento
*' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_FNomb IS 'Fin del Nombramiento
Fin del Nombramiento
*' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_NDescrip IS 'Nombram Descrip
Descripción del Nombramiento
*' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_Reempla IS 'Reemplaza a
Nombramiento al que reemplaza
11
*S' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_PROMEP IS 'PROMEP
Identifica si es Plaza PROMEP
12
*S' ;

COMMENT ON COLUMN PERSONAL.PVHplazas.VPLA_AREA IS 'Area
Identifica si es Area Contable o Jardineria
13
*S' ;

--**--**--*-*---**--**--*-*---**--**--*-*---**--**--*-*---**--**--*-*---**--**--*-*---**--**--*-*---**--**--*-*-
--**--**--*-*---**--**--*-*---**--**--*-*---**--**--*-*---**--**--*-*---**--**--*-*---**--**--*-*---**--**--*-*-

--------------------
--triggers--*-------
--------------------

create or replace trigger "PERSONAL".TII_PVHplazas
 instead of insert on PVHplazas  for each row

declare
 horas_acum number;
 horas_max number;
 Fin date :=  :new.VPLA_Fin ;
Verifica_Categ NUMBER;

begin

 horas_acum := 0;
 horas_max := 0;

 IF :new.VPLA_Horas > 40 THEN
       Raise_Application_Error(-20001,'Las Horas no pueden ser mayor a 40');    
 END IF;
 
 if :new.VPLA_Fin is null then
  Fin := TO_Date('31/12/3000', 'DD/MM/YYYY') ;
 end if ;

 if :new.VPLA_Psto = 'BECADOC' THEN
    Raise_Application_Error(-20001,'El Puesto debe ser BECADOCE o BECATECA');
 END IF;

 Select count(*)
 Into Verifica_Categ
 From Phcpuestos
 Where Cpue_Psto =  :new.VPLA_Psto
 and CPue_Categ = :new.VPLA_Categ;

 If verifica_categ = 0 then
     Raise_application_error(-20001,'La Categoría no existe para ese Puesto'); 
 end if;


 if :new.VPLA_Reempla is not null then
     Select nvl(sum(plaz_horas),0) into horas_acum
      From PHPLAZAS
      Where Plaz_Reempla = :new.VPLA_Reempla;

     horas_acum := horas_acum + :new.VPLA_Horas;

     Select vnom_horas into horas_max
      From PVHNOMBRAM
      Where Vnom_nomb = :new.Vpla_Reempla;

     if horas_acum > horas_max  then
       Raise_Application_Error(-20001,'Las horas de Reemplazo: ' || to_char(horas_acum) ||' exceden las horas del Nombramiento: ' || to_char(horas_max));
     end if;

    -- Insertamos en PHPLAZAS
     INSERT INTO PHPLAZAS
     (PLAZ_Plaza, PLAZ_TPlaza, PLAZ_SFdo, PLAZ_URes, PLAZ_Psto,
      PLAZ_Horas, PLAZ_Sldo, PLAZ_Docen, PLAZ_Ini, PLAZ_Fin, PLAZ_Reempla, PLAZ_PROMEP, PLAZ_AREA)
     VALUES
    (:new.VPLA_Plaza, :new.VPLA_TPlaza, :new.VPLA_SFdo, :new.VPLA_URes, :new.VPLA_Psto,
     :new.VPLA_Horas, :new.VPLA_Sldo, :new.VPLA_Docen, :new.VPLA_Ini, Fin,:new.VPLA_Reempla, :new.VPLA_PROMEP, :new.VPLA_AREA) ;
 else
    -- Insertamos en PHPLAZAS
     INSERT INTO PHPLAZAS
     (PLAZ_Plaza, PLAZ_TPlaza, PLAZ_SFdo, PLAZ_URes, PLAZ_Psto,
      PLAZ_Horas, PLAZ_Sldo, PLAZ_Docen, PLAZ_Ini, PLAZ_Fin, PLAZ_PROMEP, PLAZ_AREA)
     VALUES
    (:new.VPLA_Plaza, :new.VPLA_TPlaza, :new.VPLA_SFdo, :new.VPLA_URes, :new.VPLA_Psto,
     :new.VPLA_Horas, :new.VPLA_Sldo, :new.VPLA_Docen, :new.VPLA_Ini, Fin, :new.VPLA_PROMEP, :new.VPLA_AREA) ;
 end if;

-- Insertamos en Nombramiento Titular
 if :new.VPLA_Empl is not null then
  INSERT INTO PVHNOMBRAM
  (VNOM_Nomb, VNOM_Plaza, VNOM_URes, VNOM_Empl, VNOM_Descrip, VNOM_Psto,
   VNOM_Categ, VNOM_SSueldo, VNOM_Susp, VNOM_Ini, VNOM_Fin, VNOM_Ingreso, VNOM_Baja)
  SELECT PsqNombram.nextval, :new.VPLA_Plaza, :new.VPLA_URes, :new.VPLA_Empl,
   NVL(:new.VPLA_NDescrip, PUES_Descrip), :new.VPLA_Psto,
   NVL(:new.VPLA_Categ, PUES_Categ_Defa), 0, 'N',
   NVL(:new.VPLA_INomb,:new.VPLA_Ini), NVL(:new.VPLA_FNomb, Fin),
   NVL(:new.VPLA_INomb,:new.VPLA_Ini), NVL(:new.VPLA_FNomb, Fin)
  FROM PHPUESTOS
  WHERE PUES_Psto= :new.VPLA_Psto ;
 end if ;


end ;

/


create or replace trigger "PERSONAL".TIU_PVHplazas
 instead of update on PVHplazas  for each row


Declare
 horas_acum number;
 horas_max number;
 Verifica_Categ NUMBER;

begin

 horas_acum := 0;
 horas_max := 0;

 IF :new.VPLA_Horas > 40 THEN
       Raise_Application_Error(-20001,'Las Horas no pueden ser mayor a 40');    
 END IF;

 if :new.VPLA_Psto = 'BECADOC' THEN
    Raise_Application_Error(-20001,'El Puesto debe ser BECADOCE o BECATECA');
 END IF;
 
 Select count(*)
 Into Verifica_Categ
 From Phcpuestos
 Where Cpue_Psto =  :new.VPLA_Psto
 and CPue_Categ = :new.VPLA_Categ;

 If verifica_categ = 0 then
     Raise_application_error(-20001,'La Categoría no existe para ese Puesto'); 
 end if;

 if :new.VPLA_Reempla is not null then

       Select nvl(sum(plaz_horas),0) into horas_acum
        From PHPLAZAS
        Where Plaz_Reempla = :new.VPLA_Reempla
        And Plaz_Plaza <> :new.VPla_Plaza ;

       horas_acum := horas_acum + :new.VPLA_Horas;

       Select vnom_horas into horas_max
        From PVHNOMBRAM
        Where Vnom_nomb = :new.Vpla_Reempla;

       if horas_acum > horas_max  then
         Raise_Application_Error(-20001,'Las horas de Reemplazo: ' || to_char(horas_acum) ||' exceden las horas del Nombramiento: ' || to_char(horas_max));
       end if;



      -- Update en Plazas
       UPDATE PHPLAZAS Set
        PLAZ_TPlaza= :new.VPLA_TPlaza,
        PLAZ_SFdo= :new.VPLA_SFdo,
        PLAZ_URes= :new.VPLA_URes,
        PLAZ_Psto= :new.VPLA_Psto,
        PLAZ_Horas= :new.VPLA_Horas,
        PLAZ_Sldo= :new.VPLA_Sldo,
        PLAZ_Docen= :new.VPLA_Docen,
        PLAZ_Ini= :new.VPLA_Ini,
        PLAZ_Fin= :new.VPLA_Fin,
        PLAZ_Reempla= :new.VPLA_Reempla,
 	PLAZ_PROMEP= :new.VPLA_PROMEP,
 	PLAZ_AREA= :new.VPLA_AREA
       Where PLAZ_Plaza= :new.VPLA_Plaza ;

 else

      -- Update en Plazas
       UPDATE PHPLAZAS Set
        PLAZ_TPlaza= :new.VPLA_TPlaza,
        PLAZ_SFdo= :new.VPLA_SFdo,
        PLAZ_URes= :new.VPLA_URes,
        PLAZ_Psto= :new.VPLA_Psto,
        PLAZ_Horas= :new.VPLA_Horas,
        PLAZ_Sldo= :new.VPLA_Sldo,
        PLAZ_Docen= :new.VPLA_Docen,
        PLAZ_Ini= :new.VPLA_Ini,
        PLAZ_Fin= :new.VPLA_Fin,
 	PLAZ_PROMEP= :new.VPLA_PROMEP,
	PLAZ_AREA= :new.VPLA_AREA
       Where PLAZ_Plaza= :new.VPLA_Plaza ;

 end if;

-- Update en Nombramiento Titular
 if :new.VPLA_Empl is not null then
  UPDATE PVHNOMBRAM set
   VNOM_URes= :new.VPLA_URes,
   VNOM_Empl= :new.VPLA_Empl,
   VNOM_Descrip= :new.VPLA_NDescrip,
   VNOM_Psto= :new.VPLA_Psto,
   VNOM_Categ= :new.VPLA_Categ,
   VNOM_Ini= NVL(:new.VPLA_INomb,:new.VPLA_Ini),
   VNOM_Fin= NVL(:new.VPLA_FNomb, :new.VPLA_Fin),
   VNOM_Ingreso= NVL(:new.VPLA_INomb,:new.VPLA_Ini),
   VNOM_Baja= NVL(:new.VPLA_FNomb, :new.VPLA_Fin)
  Where VNOM_Nomb= :new.VPLA_Nomb ;
 end if ;


end ;


/



------------------------
------------------------
--- PLAZAS-PROGRAMAS ---
------------------------
------------------------

CREATE TABLE PERSONAL.PhPLAZPROG
(
 PLAZ_PLAZA	number(10,0),
 PLAZ_SFdo	varchar2(8),
 PLAZ_URES	varchar2(8),
 PLAZ_PROG	varchar2(8),
 PLAZ_PORC	number(6,2)
) ;

CREATE PUBLIC SYNONYM PhPLAZPROG FOR PERSONAL.PhPLAZPROG ;

ALTER TABLE PhPLAZPROG ADD CONSTRAINT FK$PhPLAZPROG$PLAZA
 FOREIGN KEY (PLAZ_PLAZA) REFERENCES PHPLAZAS ON DELETE CASCADE ;

ALTER TABLE PhPLAZPROG ADD CONSTRAINT NN$PhPLAZPROG$PROG
 CHECK (PLAZ_PROG IS NOT NULL) ;

ALTER TABLE PhPLAZPROG ADD CONSTRAINT FK$PhPLAZPROG$PROG
 FOREIGN KEY (PLAZ_PROG) REFERENCES FINANZAS.FPROGRAM ;

ALTER TABLE PhPLAZPROG ADD CONSTRAINT NN$PhPLAZPROG$SFDO
 CHECK (PLAZ_SFDO IS NOT NULL) ;

ALTER TABLE PhPLAZPROG ADD CONSTRAINT FK$PhPLAZPROG$SFDO
 FOREIGN KEY (PLAZ_SFDO) REFERENCES FINANZAS.FSFONDOS ;

ALTER TABLE PhPLAZPROG ADD CONSTRAINT NN$PhPLAZPROG$URES
 CHECK (PLAZ_URES IS NOT NULL) ;

ALTER TABLE PhPLAZPROG ADD CONSTRAINT FK$PhPLAZPROG$URES
 FOREIGN KEY (PLAZ_URES) REFERENCES FINANZAS.FURES ;

ALTER TABLE PhPLAZPROG ADD CONSTRAINT NN$PhPLAZPROG$PORC
 CHECK (PLAZ_PORC IS NOT NULL) ;

ALTER TABLE PhPLAZPROG ADD CONSTRAINT CC$PhPLAZPROG$PORC
 CHECK (PLAZ_PORC BETWEEN 0.01 AND 100) ;

CREATE UNIQUE INDEX IX$PhPLAZPROG$ePLAZPROG ON PERSONAL.PhPLAZPROG (PLAZ_PLAZA, PLAZ_PROG, PLAZ_URES) ;
CREATE INDEX IX$PhPLAZPROG$PLAZA ON PERSONAL.PhPLAZPROG (PLAZ_PLAZA) ;
CREATE INDEX IX$PhPLAZPROG$PROG ON PERSONAL.PhPLAZPROG (PLAZ_PROG) ;
CREATE INDEX IX$PhPLAZPROG$URES ON PERSONAL.PhPLAZPROG (PLAZ_URES) ;

INSERT INTO SERRMES(ERRM_REFER, ERRM_MENSAJE, ERRM_SCRIPT)
VALUES ('PERSONAL.CC$PhPLAZPROG$PORC', 'Porcentaje debe ser entre 1 y 100', 'P03') ;

COMMENT ON TABLE PERSONAL.PhPLAZPROG IS 'Plazas-Programas
Relacion entre Plazas y Programas, Programa nulo= Funcion Docencia' ;

COMMENT ON COLUMN PERSONAL.PhPLAZPROG.PLAZ_PLAZA IS 'Plaza
Numero de Plaza
*' ;

COMMENT ON COLUMN PERSONAL.PhPLAZPROG.PLAZ_SFdo IS 'SubFondo
Clave del SubFondo
*' ;

COMMENT ON COLUMN PERSONAL.PhPLAZPROG.PLAZ_PROG IS 'Programa
Clave del Programa
*' ;

COMMENT ON COLUMN PERSONAL.PhPLAZPROG.PLAZ_URES IS 'U Resp
Clave de la Unidad Responsable
*' ;

COMMENT ON COLUMN PERSONAL.PhPLAZPROG.PLAZ_PORC IS 'Porcentaje
Porcentaje del Programa a aplicar
*' ;

