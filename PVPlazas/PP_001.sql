CONNECT PERSONAL/PERSONAL@bd;

--altera tabla de plazas
ALTER TABLE PPLAZAS ADD PLAZ_REEMPLA NUMBER(10);

ALTER TABLE PPLAZAS DROP CONSTRAINT CC$PPLAZAS$FIN;

ALTER TABLE PPLAZAS ADD CONSTRAINT CC$PPLAZAS$FIN
  check (PLAZ_FIN >= PLAZ_INI);

ALTER TABLE PPLAZAS ADD PLAZ_PROMEP VARCHAR2(1);

ALTER TABLE PPLAZAS ADD CONSTRAINT CC$PPLAZAS$PROMEP
   CHECK (PLAZ_PROMEP in ('S','N') ) ;

ALTER TABLE PPLAZAS ADD PLAZ_AREA VARCHAR2(1);

ALTER TABLE PPLAZAS ADD CONSTRAINT CC$PPLAZAS$AREA
   CHECK (PLAZ_AREA in ('S','N') ) ;

create index IX$PPLAZAS$REEMPLA on PPLAZAS (PLAZ_REEMPLA)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 120K
    next 104K
    minextents 1
    maxextents 300
    pctincrease 1
  );


--comments
COMMENT ON TABLE PERSONAL.PPLAZAS IS 'Plazas
Plazas' ;

COMMENT ON COLUMN PERSONAL.PPLAZAS.PLAZ_PLAZA IS 'Plaza
Numero de Plaza
*' ;

COMMENT ON COLUMN PERSONAL.PPLAZAS.PLAZ_TPLAZA IS 'Tipo Plaza
Tipo de Plaza
*' ;

COMMENT ON COLUMN PERSONAL.PPLAZAS.PLAZ_URES IS 'URes
Clave de la Unidad Responsable
*' ;

COMMENT ON COLUMN PERSONAL.PPLAZAS.PLAZ_SFdo IS 'SFdo
Clave del SubFondo por Default
*' ;

COMMENT ON COLUMN PERSONAL.PPLAZAS.PLAZ_PSTO IS 'Puesto
Clave del Puesto
*' ;

COMMENT ON COLUMN PERSONAL.PPLAZAS.PLAZ_HORAS IS 'Horas
Horas por semana del puesto
*' ;

COMMENT ON COLUMN PERSONAL.PPLAZAS.PLAZ_SLDO IS 'Sueldo
Sueldo de la plaza para sueldos alternos
*' ;

COMMENT ON COLUMN PERSONAL.PPLAZAS.PLAZ_Docen IS 'Docencia
Porcentaje de la plaza dedicado a la docencia
*' ;

COMMENT ON COLUMN PERSONAL.PPLAZAS.PLAZ_INI IS 'Inicio
Fecha de inicio de la Plaza
*' ;

COMMENT ON COLUMN PERSONAL.PPLAZAS.PLAZ_Fin IS 'Fin
Fecha de fin de la Plaza
*' ;

COMMENT ON COLUMN PERSONAL.PPLAZAS.PLAZ_Status IS 'Status
Indica el status de la Plaza, donde A=Abierta y C=Cerrada
*' ;


COMMENT ON COLUMN PERSONAL.PPLAZAS.PLAZ_USU IS 'Usuario
Usuario de ultima modificacion
*' ;

COMMENT ON COLUMN PERSONAL.PPLAZAS.PLAZ_FEC IS 'Fec
Fecha de ultima modificacion
*' ;

COMMENT ON COLUMN PERSONAL.PPLAZAS.PLAZ_REEMPLA IS 'Reemplaza
Nombramiento al que reemplaza
*' ;

COMMENT ON COLUMN PERSONAL.PPLAZAS.PLAZ_PROMEP IS 'PROMEP
Identifica si es Plaza PROMEP
*' ;

COMMENT ON COLUMN PERSONAL.PPLAZAS.PLAZ_AREA IS 'AREA
Identifica si es Area Contable o de Jardineria
*' ;



--recrea la vista de pvplazas
CREATE OR REPLACE VIEW PVPLAZAS AS
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
From PPLAZAS, PPUESTOS, PCPUESTOS A, PSPUESTOS, PNOMBRAM, PCPUESTOS B
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

--comments
COMMENT ON TABLE PERSONAL.PVPLAZAS IS 'Vista de Plazas
Vista de Plazas' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_PLAZA IS 'Plaza
Numero de Plaza
00
*S' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_TPLAZA IS 'Tipo Plaza
Tipo de Plaza
01
*S' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_SFdo IS 'SFdo
Clave del subfondo
02
*S' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_URES IS 'URes
Clave de la Unidad Responsable
03
*S' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_TPSTO IS 'T Puesto
Tipo de Puesto
04
*S' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_PSTO IS 'Puesto
Clave del Puesto
05
*S' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_HORAS IS 'Horas
Horas por semana del puesto
06
*S' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_SLDO IS 'Sueldo
Sueldo Mensual de la Plaza
07
*S
*C' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_Docen IS 'Docencia
Porcentaje de la plaza dedicado a la docencia
*' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_INI IS 'Inicio
Fecha de inicio de la Plaza
08
*S' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_FIN IS 'Fin
Fecha de fin de la Plaza
09
*S' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_Nomb IS 'Nombramiento
Nombramiento activo en la plaza
*' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_Empl IS 'Empleado
Empleado activo en la plaza
10
*S' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_Categ IS 'Categoria
Categoria del Nombramiento
*' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_INomb IS 'Inicio del Nombramiento
Inicio del Nombramiento
*' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_FNomb IS 'Fin del Nombramiento
Fin del Nombramiento
*' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_NDescrip IS 'Nombram Descrip
Descripción del Nombramiento
*' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_Reempla IS 'Reemplaza a
Nombramiento al que reemplaza
11
*S' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_PROMEP IS 'PROMEP
Identifica si es Plaza PROMEP
12
*S' ;

COMMENT ON COLUMN PERSONAL.PVPLAZAS.VPLA_AREA IS 'Area
Identifica si es Area Contable o Jardineria
13
*S' ;


--recrea triggers

create or replace trigger "PERSONAL".TII_PVPLAZAS
 instead of insert on pvplazas  for each row

declare
 horas_acum number;
 horas_max number;
 Fin date :=  :new.VPLA_Fin ;
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
 From Pcpuestos
 Where Cpue_Psto =  :new.VPLA_Psto
 and CPue_Categ = :new.VPLA_Categ;

 If verifica_categ = 0 then
     Raise_application_error(-20001,'La Categoría no existe para ese Puesto'); 
 end if;


 if :new.VPLA_Reempla is not null then
     Select nvl(sum(plaz_horas),0) into horas_acum
      From PPLazas
      Where Plaz_Reempla = :new.VPLA_Reempla;

     horas_acum := horas_acum + :new.VPLA_Horas;

     Select vnom_horas into horas_max
      From Pvnombram
      Where Vnom_nomb = :new.Vpla_Reempla;

     if horas_acum > horas_max  then
       Raise_Application_Error(-20001,'Las horas de Reemplazo: ' || to_char(horas_acum) ||' exceden las horas del Nombramiento: ' || to_char(horas_max));
     end if;

    -- Insertamos en Plazas
     INSERT INTO PPlazas
     (PLAZ_Plaza, PLAZ_TPlaza, PLAZ_SFdo, PLAZ_URes, PLAZ_Psto,
      PLAZ_Horas, PLAZ_Sldo, PLAZ_Docen, PLAZ_Ini, PLAZ_Fin, PLAZ_Reempla, PLAZ_PROMEP, PLAZ_AREA)
     VALUES
    (:new.VPLA_Plaza, :new.VPLA_TPlaza, :new.VPLA_SFdo, :new.VPLA_URes, :new.VPLA_Psto,
     :new.VPLA_Horas, :new.VPLA_Sldo, :new.VPLA_Docen, :new.VPLA_Ini, Fin,:new.VPLA_Reempla, :new.VPLA_PROMEP, :new.VPLA_AREA) ;
 else
    -- Insertamos en Plazas
     INSERT INTO PPlazas
     (PLAZ_Plaza, PLAZ_TPlaza, PLAZ_SFdo, PLAZ_URes, PLAZ_Psto,
      PLAZ_Horas, PLAZ_Sldo, PLAZ_Docen, PLAZ_Ini, PLAZ_Fin, PLAZ_PROMEP, PLAZ_AREA)
     VALUES
    (:new.VPLA_Plaza, :new.VPLA_TPlaza, :new.VPLA_SFdo, :new.VPLA_URes, :new.VPLA_Psto,
     :new.VPLA_Horas, :new.VPLA_Sldo, :new.VPLA_Docen, :new.VPLA_Ini, Fin, :new.VPLA_PROMEP, :new.VPLA_AREA) ;
 end if;

-- Insertamos en Nombramiento Titular
 if :new.VPLA_Empl is not null then
  INSERT INTO PVNOMBRAM
  (VNOM_Nomb, VNOM_Plaza, VNOM_URes, VNOM_Empl, VNOM_Descrip, VNOM_Psto,
   VNOM_Categ, VNOM_SSueldo, VNOM_Susp, VNOM_Ini, VNOM_Fin )
  SELECT PsqNombram.nextval, :new.VPLA_Plaza, :new.VPLA_URes, :new.VPLA_Empl,
   NVL(:new.VPLA_NDescrip, PUES_Descrip), :new.VPLA_Psto,
   NVL(:new.VPLA_Categ, PUES_Categ_Defa), 0, 'N',
   NVL(:new.VPLA_INomb,:new.VPLA_Ini), NVL(:new.VPLA_FNomb, Fin)
  FROM PPUESTOS
  WHERE PUES_Psto= :new.VPLA_Psto ;
 end if ;


end ;

/


create or replace trigger "PERSONAL".TIU_PVPLAZAS
 instead of update on pvplazas  for each row


Declare
 horas_acum number;
 horas_max number;

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
 From Pcpuestos
 Where Cpue_Psto =  :new.VPLA_Psto
 and CPue_Categ = :new.VPLA_Categ;

 If verifica_categ = 0 then
     Raise_application_error(-20001,'La Categoría no existe para ese Puesto'); 
 end if;

 if :new.VPLA_Reempla is not null then

       Select nvl(sum(plaz_horas),0) into horas_acum
        From PPLazas
        Where Plaz_Reempla = :new.VPLA_Reempla
        And Plaz_Plaza <> :new.VPla_Plaza ;

       horas_acum := horas_acum + :new.VPLA_Horas;

       Select vnom_horas into horas_max
        From Pvnombram
        Where Vnom_nomb = :new.Vpla_Reempla;

       if horas_acum > horas_max  then
         Raise_Application_Error(-20001,'Las horas de Reemplazo: ' || to_char(horas_acum) ||' exceden las horas del Nombramiento: ' || to_char(horas_max));
       end if;



      -- Update en Plazas
       UPDATE PPlazas Set
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
       UPDATE PPlazas Set
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
  UPDATE PvNombram set
   VNOM_URes= :new.VPLA_URes,
   VNOM_Empl= :new.VPLA_Empl,
   VNOM_Descrip= :new.VPLA_NDescrip,
   VNOM_Psto= :new.VPLA_Psto,
   VNOM_Categ= :new.VPLA_Categ,
   VNOM_Ini= NVL(:new.VPLA_INomb,:new.VPLA_Ini),
   VNOM_Fin= NVL(:new.VPLA_FNomb, :new.VPLA_Fin)
  Where VNOM_Nomb= :new.VPLA_Nomb ;
 end if ;


end ;


/