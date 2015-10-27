----------------------------------------
----------------------------------------
--- CAMPO DE SPIUJAT EN NOMBRAMIENTO ---
----------------------------------------
----------------------------------------

CONNECT SHAKE/SHAKE@BD;

UPDATE SMODULOS
SET MODU_REPORTE = 'S'
WHERE MODU_MODULO = 'PVNOMBRAM';


INSERT INTO SREFDESC(REFD_CAMPO, REFD_SCRIPT, REFD_SQL)
 VALUES('BANCOD', 'Pvn_001', 
 'Select 
 BCOD_ID as Id,
 BCOD_Descrip As Descrip
 From PBcoDep');


COMMIT;

----------------------------------------
----------------------------------------
--- CAMPO DE SPIUJAT EN NOMBRAMIENTO ---
----------------------------------------
----------------------------------------

CONNECT PERSONAL/PERSONAL@BD;

ALTER TABLE PNOMBRAM DROP CONSTRAINT CC$PNOMBRAM$FIN ;

ALTER TABLE PNOMBRAM ADD CONSTRAINT CC$PNOMBRAM$FIN
  check (NOMB_FIN >= NOMB_INI);


ALTER TABLE PNOMBRAM ADD NOMB_DIRIGIDO VARCHAR2(10);

ALTER TABLE PNOMBRAM ADD NOMB_COPIAU VARCHAR2(10);

ALTER TABLE PNOMBRAM ADD NOMB_COPIAD VARCHAR2(10);

ALTER TABLE PNOMBRAM ADD NOMB_COPIAT VARCHAR2(12);

ALTER TABLE PNOMBRAM ADD NOMB_CONT VARCHAR2(12);

ALTER TABLE PNOMBRAM ADD NOMB_FECHA DATE;

ALTER TABLE PNOMBRAM ADD NOMB_CATEG VARCHAR2(10);

ALTER TABLE PNOMBRAM ADD NOMB_BANCO_NOM VARCHAR2(12);

ALTER TABLE PNOMBRAM ADD NOMB_BANCOD VARCHAR2(2);

ALTER TABLE PNOMBRAM ADD NOMB_CBANC VARCHAR2(15);


create index IX$PNOMBRAM$CATEG on PNOMBRAM (NOMB_CATEG);


ALTER TABLE PNOMBRAM ADD NOMB_USU VARCHAR2(30) DEFAULT USER;

ALTER TABLE PNOMBRAM ADD NOMB_FEC DATE DEFAULT SYSDATE;


ALTER TABLE PNOMBRAM ADD NOMB_USUM VARCHAR2(30) DEFAULT USER;

ALTER TABLE PNOMBRAM ADD NOMB_FMODI DATE DEFAULT SYSDATE;


ALTER TABLE PNOMBRAM ADD NOMB_INGRESO DATE;

ALTER TABLE PNOMBRAM ADD NOMB_BAJA DATE;


COMMENT ON COLUMN PNOMBRAM.NOMB_DIRIGIDO is 'Dirigido a
Persona a la que va dirigido el oficio
*' ;

COMMENT ON COLUMN PNOMBRAM.NOMB_COPIAU is 'Copia1
Primera Copia
*' ;

COMMENT ON COLUMN PNOMBRAM.NOMB_COPIAD is 'Copia2
Segunda Copia
*' ;

COMMENT ON COLUMN PNOMBRAM.NOMB_COPIAT is 'Copia3
Tercera Copia
*' ;

COMMENT ON COLUMN PNOMBRAM.NOMB_CONT is 'Contrato
Contrato u Oficio
*' ;

COMMENT ON COLUMN PNOMBRAM.NOMB_FECHA is 'Fecha
Fecha de Elaboración del Contrato u Oficio
*' ;

COMMENT ON COLUMN PNOMBRAM.NOMB_CATEG is 'Categoría
Categoría del NOmbramiento
*' ;

COMMENT ON COLUMN PNOMBRAM.NOMB_BANCO_NOM is 'Banco
Banco con el que se paga el Nombramiento
*' ;

COMMENT ON COLUMN PNOMBRAM.NOMB_BANCOD is 'Banco_Dep
Banco donde se Deposita el pago del nombramiento
*' ;

COMMENT ON COLUMN PNOMBRAM.NOMB_CBANC is 'Cuenta
Cuenta Bancaria en donde se Deposita el pago del Nombramiento
*' ;


COMMENT ON COLUMN PNOMBRAM.NOMB_USU is 'Usuario
Usuario que Agregó el Registro
*';

COMMENT ON COLUMN PNOMBRAM.NOMB_FEC is 'Fecha
Fecha de Creación del Registro
*';

COMMENT ON COLUMN PNOMBRAM.NOMB_USUM is 'Usuario_Mod
Usuario que Modificó el Registro
*';

COMMENT ON COLUMN PNOMBRAM.NOMB_INGRESO is 'Ingreso
Fecha de Ingreso con el nombramiento
*';

COMMENT ON COLUMN PNOMBRAM.NOMB_BAJA is 'Baja
Fecha de Baja del Nombramiento
*';


------------------------------------------------------------------------------------
--------------------------------
---- Vista de Nombramientos ----
--------------------------------
CREATE OR REPLACE VIEW PVNOMBRAM AS
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
 NVL(DECODE(PUES_TPSTO , 'D', ATRE_SPIUJAT, 'BE',ATRE_SPIUJAT, 'BD',ATRE_SPIUJAT, 'DN', ATRE_SPIUJAT, 'BN',ATRE_SPIUJAT,
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
FROM FPERSONAS, PNOMBRAM, PPLAZAS, PPUESTOS, PCPUESTOS, PSPUESTOS, PATREMPL, FURES
Where PERS_PERSONA= NOMB_Empl
  And PLAZ_PLAZA= NOMB_Plaza
  And URES_URes = PLAZ_Ures
  And PUES_Psto= PLAZ_Psto
  And CPUE_Psto= PUES_Psto
  And CPUE_Categ= NOMB_Categ
 And SPUE_SPue= CPUE_SPue
 And ATRE_Empl(+)= NOMB_Empl ;




COMMENT ON TABLE PERSONAL.PVNOMBRAM IS 'Vista de Nombramientos' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_Nomb IS 'Nomb
Numero del nombramiento
00
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_Tipo IS 'Tipo Nomb
Tipo de Nombram donde T=Titular, R=Reemplazo
01
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_Plaza IS 'Plaza
Plaza del Nombramiento
02
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_Reem IS 'Reemplazo
Nombramiento al que Reemplaza
03
*S' ;

COMMENT ON COLUMN Pvnombram.VNom_Cont is 'Contrato
Contrato u oficio
*' ;

COMMENT ON COLUMN Pvnombram.VNom_Fecha is 'Fecha
Fecha de elaboración del contrato u oficio
*' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_Empl IS 'Empl
Empleado que tiene el nombramiento
04
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_Nombre IS 'Nombre
Nombre del Empleado que tiene el nombramiento
05
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_Descrip IS 'Descripcion
Descripcion del Nombramiento
06
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_URes IS 'Cve URes
Clave de Unidad Responsable
07
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_UResDesc IS 'URes
Unidad Responsable
08
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_SFdo IS 'SFdo
SubFondo que paga la plaza
09
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_Tplaza IS 'TPlaza
Tipo de Plaza
10
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_TPsto IS 'TPsto
Tipo de Puesto
11
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_Psto IS 'Puesto
Puesto
12
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_CategR IS 'Categoria
Categoria de la Persona en el Puesto
13
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_CategRDesc IS 'Descripción Categoria
Descripción de la Categoria
14
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_Categ IS 'Categoria Base
Categoria Base del Puesto
*' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_Horas IS 'Horas
Carga Horaria
15
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_SldoR IS 'Sueldo
Sueldo Real basado en la Categoría
' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_Sldo IS 'Sueldo Base
Sueldo de la Categoría Base
' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_SSueldo IS 'SobreSueldo
Sobre Sueldo
*C' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_PIni IS 'Ini Plaza
Inicio de la Plaza
*' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_PFin IS 'Fin Plaza
Fin de la Plaza
*' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_Texto IS 'Texto
Texto Descriptivo del Nombramiento
*' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_Ini IS 'Inicio
Inicio del Nombramiento
*' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_Fin IS 'Fin
Fin del Nombramiento
*' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_Ingreso IS 'Ingreso
Ingreso al Nombramiento
16
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_Baja IS 'Baja
Baja del Nombramiento
17
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_Susp IS 'Suspendido
Indica si el nombramiento esta o no suspendido
18
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_SPIUJAT IS 'SPIUJAT
Indica si el nombramiento pertenece o no al SPIUJAT
19
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_PROMEP IS 'PROMEP
Indica si la plaza es de tipo PROMEP
20
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_AREA IS 'Area
Indica si es Area Contable o de Jardinería
21
*S' ;

COMMENT ON COLUMN Pvnombram.VNom_Banco_Nom is 'Banco
Banco con el que se paga el nombramiento
* ' ;

COMMENT ON COLUMN Pvnombram.VNom_BancoD is 'Banco_dep
Banco donde se deposita el pago del nombramiento
* ' ;

COMMENT ON COLUMN Pvnombram.VNom_Cbanc is 'Cuenta
Cuenta bancaria en donde se deposita el pago del nombramiento
*' ;

COMMENT ON COLUMN Pvnombram.VNom_Dirigido is 'Dirigido a
Persona a la que va dirigido el oficio
*' ;

COMMENT ON COLUMN Pvnombram.VNom_Copiau is 'Copia1
Primera copia
* ' ;

COMMENT ON COLUMN Pvnombram.VNom_Copiad is 'Copia2
Segunda copia
* ' ;

COMMENT ON COLUMN Pvnombram.VNom_Copiat is 'Copia3
Tercera copia
* ' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_USU IS 'Usuario_Capturo
Usuario que creó el Nombramiento
22
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_FEC IS 'Capturado
Fecha de Captura o de Modificación del Nombramiento
23
*S' ;

COMMENT ON COLUMN PERSONAL.PVNOMBRAM.VNOM_USUM IS 'Usuario_Modifico
Usuario que Modificó por última vez el Nombramiento
24
*S' ;

----------------------------------------------------------------------------------------------------------------

create or replace trigger TII_PVNOMBRAM
 instead of insert on pvnombram  for each row


declare
 plaz number ;
 tt varchar2(30) ;
 Verifica_Categ NUMBER := 0;
 
begin

IF :NEW.VNOM_TPSTO = 'BD' THEN
   RAISE_APPLICATION_ERROR(-20001,'Tipo de Puesto ha sido modificado a BE');
END IF;

Select count(*)
Into Verifica_Categ
From Pcpuestos
Where Cpue_Psto =  :new.VNOM_Psto
and CPue_Categ = :new.VNOM_Categ;

If verifica_categ = 0 then
    Raise_application_error(-20001,'La Categoría no existe para ese Puesto'); 
end if;

 
 if user IN ('CSZ02027','ARC03742') THEN
      -- Insertamos en Nombramiento
       INSERT INTO PNOMBRAM
       (NOMB_Nomb, NOMB_Nomb_Reem, NOMB_Plaza, NOMB_Empl, NOMB_Descrip,
        NOMB_SSueldo, NOMB_Texto, NOMB_Susp, NOMB_Ini, NOMB_Fin, NOMB_BANCO_NOM,
        NOMB_BANCOD, NOMB_CBANC, NOMB_DIRIGIDO, NOMB_COPIAU, NOMB_COPIAD, NOMB_COPIAT,
        NOMB_CONT, NOMB_FECHA, NOMB_CATEG, NOMB_USU, NOMB_FEC, NOMB_Ingreso, NOMB_Baja)
       VALUES
       (:new.VNOM_Nomb, :new.VNOM_Reem, :new.VNOM_Plaza, :new.VNOM_Empl, :new.VNOM_Descrip,
        :new.VNOM_SSueldo, :new.VNOM_Texto, 'S', :new.VNOM_Ini, :new.VNOM_Fin,
        :new.VNOM_BANCO_NOM, :NEW.VNOM_BANCOD, :NEW.VNOM_CBANC, :NEW.VNOM_DIRIGIDO, :NEW.VNOM_COPIAU,
        :NEW.VNOM_COPIAD, :NEW.VNOM_COPIAT, :NEW.VNOM_CONT, :NEW.VNOM_FECHA, :NEW.VNOM_CATEG,
        USER, SYSDATE, :new.VNOM_Ingreso, :new.VNOM_Baja);

 ELSE 
      -- Insertamos en Nombramiento
       INSERT INTO PNOMBRAM
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

 END IF;
 
 
-- Grabamos la Categoria
 UPDATE PCATEMPL SET
  CATE_Categ= :new.VNOM_Categ
 WHERE CATE_Empl= :new.VNOM_Empl And CATE_Psto=:new.VNOM_Psto
 Returning rowid into tt ;

 if tt is null then
  INSERT INTO PCATEMPL (CATE_Empl, CATE_Psto, CATE_Categ)
  VALUES (:new.VNOM_Empl, :new.VNOM_Psto, :new.VNOM_Categ) ;
 end if ;

-- Update a URes Base
 tt := null ;

 UPDATE PATREMPL Set
  ATRE_URes_P= :new.VNOM_URes--,
--  ATRE_SPIUJAT= NVL(:new.VNOM_SPIUJAT,'N')
 WHERE ATRE_Empl= :new.VNOM_Empl
 Returning rowid into tt ;

 if tt is null then
  INSERT INTO PATREMPL  (ATRE_EMPL, ATRE_URES_P)--, ATRE_SPIUJAT)
  VALUES (:new.VNOM_Empl, :new.VNOM_URes);--, NVL(:new.VNOM_SPIUJAT,'N')) ;
 end if ;


--ESCOLAR
-- IF :NEW.VNOM_PSTO IN ('PROFINV','TECACAD','BECADOCE','BECATECA') THEN
--     ACTUALIZA_ESCOLAR(:NEW.VNOM_EMPL, 1,'','','','',:new.VNOM_URES);
--creo ya no es necesario : her
-- END IF;

end ;
/


----------------------------------------------------------------------------------------------------------------

create or replace trigger TIU_PVNOMBRAM
 instead of update on pvnombram  for each row

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
From Pcpuestos
Where Cpue_Psto =  :new.VNOM_Psto
and CPue_Categ = :new.VNOM_Categ;

If verifica_categ = 0 then
    Raise_application_error(-20001,'La Categoría no existe para ese Puesto'); 
end if;


-- Validacion en Vista PARA Fechas de Reemplazo <---
 if :new.VNOM_Tipo= 'R' then
  SELECT NOMB_Ini, NOMB_Fin
  Into Ini, Fin
  FROM PNOMBRAM
  Where NOMB_Nomb= :new.VNOM_Reem ;

  if :new.VNOM_Ini < Ini then
   RAISE_APPLICATION_ERROR(-20001, 'Inicio de Reemplazo no puede ser menor a Inicio de Titular' ) ;
  end if ;

/*
  if :new.VNOM_Fin > Fin then
   Raise_Application_Error(-20001, 'Fin de Reemplazo no puede ser mayor a Fin de Titular' ) ;
  end if ;*/
 end if ;


-- Actualizamos Nombramiento
 UPDATE PNOMBRAM Set
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


-- Update en Categoria
 UPDATE PCATEMPL SET
  CATE_Categ= :new.VNOM_Categ
 WHERE CATE_Empl= :new.VNOM_Empl And CATE_Psto=:new.VNOM_Psto
 Returning rowid into tt ;

 if tt is null then
  INSERT INTO PCATEMPL (CATE_Empl, CATE_Psto, CATE_Categ)
  VALUES (:new.VNOM_Empl, :new.VNOM_Psto, :new.VNOM_Categ) ;
 end if ;


-- Update a UResponsable Base
 tt := null ;

 UPDATE PATREMPL Set
  ATRE_URes_P= :new.VNOM_URes--,
 -- ATRE_SPIUJAT= NVL(:new.VNOM_SPIUJAT,'N')
 WHERE ATRE_Empl= :new.VNOM_Empl
 Returning rowid into tt ;

 if tt is null then
  INSERT INTO PATREMPL  (ATRE_EMPL, ATRE_URES_P)--, ATRE_SPIUJAT)
  VALUES (:new.VNOM_Empl, :new.VNOM_URes);--, NVL(:new.VNOM_SPIUJAT,'N')) ;
 end if ;

   if updating(:new.vnom_fin) then
--ESCOLAR
 IF :NEW.VNOM_PSTO IN ('PROFINV','TECACAD','BECADOCE','BECATECA') THEN
     ACTUALIZA_ESCOLAR(:NEW.VNOM_EMPL, 1,'','','','',:new.VNOM_URES);
-- ya no es necesario
 END IF;
 end if;


end ;

/




---------------------------------------
---------------------------------------
--- VISTAS PARA SELECCION EN NOMINA ---
---------------------------------------
---------------------------------------


-----------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW PVSELEVEN AS
SELECT
 EVEN_Empl As VNOM_Empl,
 NOMB_Nomb As VNOM_Nomb,
 'E' As VNOM_Tipo,
 NOMB_Descrip As VNOM_Descrip,
 PLAZ_Docen As VNOM_Docen,
 PLAZ_Plaza As VNOM_Plaza,
 PLAZ_TPlaza As VNOM_TPlaza,
 PLAZ_URes   As VNOM_URes,
 PLAZ_SFdo As VNOM_SFdo,
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
 'N'   	As VNOM_Susp,
 ATRE_Banco_Emp   As VNOM_EBanco,
 ATRE_Banco_Emp  as VNOM_NBanco,
 VURB_Banco		As VNOM_UBanco,
 NVL(DECODE(PUES_TPSTO , 'D', ATRE_SPIUJAT, 'BE',ATRE_SPIUJAT, 'BD',ATRE_SPIUJAT,
                         'JD', ATRE_SPIUJAT, 'PD', ATRE_SPIUJAT, 'N'),'N') As VNOM_SPIUJAT,
  0	As VNOM_NDias,
  0	As VNOM_LDias,
  0	As VNOM_FDias,
 EVEN_Even  As VNOM_Refer
From PNOMBRAM, PPLAZAS, PPUESTOS, PCPUESTOS, PSPUESTOS, PEVENTUAL, PATREMPL, PVURBATP, PNOMINAS--, PBCOURES
Where EVEN_Nomina is null
  And NOMB_Nomb= EVEN_Nomb
  And PLAZ_PLAZA= NOMB_Plaza
  And PUES_Psto= PLAZ_Psto
  And CPUE_Psto= PUES_Psto
  And CPUE_Categ= NOMB_CATEG
/*(
SELECT DECODE(Count(*), 0, PUES_Categ_Defa, MAX(CATE_Categ))
From PCATEMPL
Where CATE_Empl= EVEN_Empl
 And CATE_Psto= PLAZ_Psto
)*/
 And SPUE_SPue= CPUE_SPue
 And ATRE_Empl(+)= NOMB_Empl
 --And BCOU_URes(+)= PLAZ_URes
 And VURB_Ures = PLAZ_URes
 And VURB_TPsto = PUES_TPsto
 And Nomi_Nomina = (Select Max(Nomi_Nomina) from Pnominas);

-----------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW PVSELGUAR AS
SELECT
 NOMB_Empl As VNOM_Empl,
 NOMB_Nomb As VNOM_Nomb,
 'G' As VNOM_Tipo,
 'GUARDIA' As VNOM_Descrip,
 PLAZ_Docen As VNOM_Docen,
 PLAZ_Plaza As VNOM_Plaza,
 PLAZ_TPlaza As VNOM_TPlaza,
 PLAZ_URes   As VNOM_URes,
 PLAZ_SFdo As VNOM_SFdo,
 PUES_TPsto As VNOM_TPsto,
 PLAZ_Psto As VNOM_Psto,
 TURG_Turno As VNOM_Categ,
 NVL(CALCULA_ANTIG(NOMI_FECHA, ATRE_FINGRESO, 1),0) As VNOM_Antig,
 NVL(CALCULA_ANTIG(NOMI_FECHA, ATRE_FINGRESOD, 1),0) As VNOM_AntigD,
 PLAZ_Horas As VNOM_Horas,
 NOMB_SSueldo As VNOM_SSueldo,
 TURG_Monto As VNOM_Sldo,
 GUAR_FecIni	As VNOM_Ini,
 GUAR_FecFin	As VNOM_Fin,
 'N'   	As VNOM_Susp,
 ATRE_Banco_Emp   As VNOM_EBanco,
 ATRE_Banco_Emp   As VNOM_NBanco,
 VURB_Banco		As VNOM_UBanco,
 NVL(DECODE(PUES_TPSTO , 'D', ATRE_SPIUJAT, 'BE',ATRE_SPIUJAT, 'BD',ATRE_SPIUJAT,
                         'JD', ATRE_SPIUJAT, 'PD', ATRE_SPIUJAT, 'N'),'N') As VNOM_SPIUJAT,
  0		As VNOM_NDias,
  0		As VNOM_LDias,
  0		As VNOM_FDias,
 GUAR_Guardia	As VNOM_Refer
From PNOMBRAM, PPLAZAS, PPUESTOS, PGUARDIAS, PTURGUARD, PATREMPL, PVURBATP, PNOMINAS--, PBCOURES
Where NOMB_Nomb= GUAR_Nomb
  And PLAZ_PLAZA= NOMB_Plaza
  And PUES_Psto= PLAZ_Psto
  And TURG_Turno= GUAR_Turno
  And ATRE_Empl(+)= NOMB_Empl
 --And BCOU_URes(+)= PLAZ_URes
 And VURB_Ures = PLAZ_URes
 And VURB_TPsto = PUES_TPsto
 And Nomi_Nomina = (Select Max(Nomi_Nomina) from Pnominas);

-----------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE VIEW PVSELNOMB AS
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
 NVL(DECODE(PUES_TPSTO , 'D', ATRE_SPIUJAT, 'BE',ATRE_SPIUJAT, 'BD',ATRE_SPIUJAT, 'DN', ATRE_SPIUJAT, 'BN',ATRE_SPIUJAT,
                         'JD', ATRE_SPIUJAT, 'PD', ATRE_SPIUJAT, 'N'),'N') As VNOM_SPIUJAT,
 15			As VNOM_NDias,
  0			As VNOM_LDias,
  0			As VNOM_FDias,
  0			As VNOM_Refer
From PNOMBRAM, PPLAZAS, PPUESTOS, PCPUESTOS, PSPUESTOS, PATREMPL, PVURBATP, PNOMINAS--, PBCOURES
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
 And Nomi_Nomina = (Select Max(Nomi_Nomina) from Pnominas);
