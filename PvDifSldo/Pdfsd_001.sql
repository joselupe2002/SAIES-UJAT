--Inserta las referencias de otros usuarios y otras bases de datos


CONNECT SHAKE/SHAKE@BD;

INSERT INTO SMODULOS(MODU_MODULO, MODU_PRED, MODU_DESCRIP, MODU_APLICACION,MODU_DETALLE,
 MODU_MANTEN, MODU_REPORTE, MODU_VERSION, MODU_SCRIPT, MODU_INSERTA, MODU_EDITA, MODU_BORRA)
 VALUES('PVDIFSLDO','PNOMORD','Diferencia de Sueldos',0,'S','S','S','3.0.0.0','Pdfsd_001','S','S','S');


COMMIT;


--CREA todos los objetos

--*****************************************************************************************
CONNECT PERSONAL/PERSONAL@BD;

--*****************************************************************************************

-- Create table 
create table PDIFSLDO
(
  DIFS_SEQ NUMBER(10),
  DIFS_NOMB NUMBER(10),
  DIFS_PSTO VARCHAR2(10),
  DIFS_CATEGP VARCHAR2(10),
  DIFS_PSTO2 VARCHAR2(10),
  DIFS_FINI DATE,
  DIFS_FFIN DATE,
  DIFS_TEXTO VARCHAR2(200),
  DIFS_NOMINA NUMBER(10),
  DIFS_USU VARCHAR2(30) DEFAULT USER,
  DIFS_FEC DATE DEFAULT SYSDATE
);


-- Create/Recreate primary, unique and foreign key constraints 
alter table PDIFSLDO
  add constraint PK$PDIFSLDO$SEQ primary key (DIFS_SEQ);

alter table PDIFSLDO
  add constraint FK$PDIFSLDO$NOMB foreign key (DIFS_NOMB)
  references PNOMBRAM (NOMB_NOMB);

alter table PDIFSLDO
  add constraint FK$PDIFSLDO$PSTO_CATEGP foreign key (DIFS_PSTO,DIFS_CATEGP)
  references PCPUESTOS (CPUE_PSTO,CPUE_CATEG);

alter table PDIFSLDO
  add constraint FK$PDIFSLDO$PSTO2_CATEGP foreign key (DIFS_PSTO2,DIFS_CATEGP)
  references PCPUESTOS (CPUE_PSTO,CPUE_CATEG);


-- Create/Recreate check constraints 
alter table PDIFSLDO
  add constraint NN$PDIFSLDO$CATEGP
  check (DIFS_CATEGP IS NOT NULL);
alter table PDIFSLDO
  add constraint NN$PDIFSLDO$PSTO
  check (DIFS_PSTO IS NOT NULL);
alter table PDIFSLDO
  add constraint NN$PDIFSLDO$PSTO2
  check (DIFS_PSTO2 IS NOT NULL);
alter table PDIFSLDO
  add constraint NN$PDIFSLDO$FFIN
  check (DIFS_FFIN IS NOT NULL);
alter table PDIFSLDO
  add constraint NN$PDIFSLDO$FINI
  check (DIFS_FINI IS NOT NULL);

CREATE PUBLIC SYNONYM PDIFSLDO FOR PERSONAL.PDIFSLDO;

-- Create sequence 
create sequence PSQDIFSLDO
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 10
order;

CREATE PUBLIC SYNONYM PSQDIFSLDO FOR PERSONAL.PSQDIFSLDO;


COMMENT ON TABLE PERSONAL.PDIFSLDO IS 'Tabla de Pagos de Sueldo
Pagos de Sueldo' ;


COMMENT ON COLUMN PERSONAL.PDIFSLDO.DIFS_SEQ IS 'Consecutivo
Consecutivo
' ;

COMMENT ON COLUMN PERSONAL.PDIFSLDO.DIFS_NOMB IS 'Nombramiento
Nombramiento
' ;

COMMENT ON COLUMN PERSONAL.PDIFSLDO.DIFS_PSTO IS 'Puesto
Puesto
' ;

COMMENT ON COLUMN PERSONAL.PDIFSLDO.DIFS_CATEGP IS 'Categoría
Categoría
' ;

COMMENT ON COLUMN PERSONAL.PDIFSLDO.DIFS_PSTO2 IS 'Puesto_2
Puesto 2
' ;

COMMENT ON COLUMN PERSONAL.PDIFSLDO.DIFS_FINI IS 'Inicio
Fecha de Inicio del Contrato
' ;

COMMENT ON COLUMN PERSONAL.PDIFSLDO.DIFS_FFIN IS 'Fin
Fecha de Término del Contrato
' ;

COMMENT ON COLUMN PERSONAL.PDIFSLDO.DIFS_TEXTO IS 'Texto
Texto
' ;

COMMENT ON COLUMN PERSONAL.PDIFSLDO.DIFS_NOMINA IS 'Nomina
Nomina
' ;


COMMENT ON COLUMN PERSONAL.PDIFSLDO.DIFS_USU IS 'Usuario
Usuario
' ;

COMMENT ON COLUMN PERSONAL.PDIFSLDO.DIFS_FEC IS 'Fecha
Fecha
' ;

---*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*-
---*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*-


CREATE OR REPLACE VIEW PVDIFSLDO AS
SELECT
	DIFS_SEQ AS VDIF_SEQ,
	PERS_PERSONA AS VDIF_EMPL,
	SUBSTR(PERS_NOMBRE||' '||PERS_APEPAT||' '||PERS_APEMAT,1,50) As VDIF_NOMBRE,
	NOMB_NOMB AS VDIF_NOMBS,
	DIFS_PSTO AS VDIF_PSTO,
	DIFS_CATEGP AS VDIF_CATEG,
	DIFS_PSTO2 AS VDIF_PSTO2,
	DIFS_FINI AS VDIF_FINI,
	DIFS_FFIN AS VDIF_FFIN,
	DIFS_TEXTO AS VDIF_TEXTO,
	DIFS_NOMINA AS VDIF_NOMINA,
	DIFS_USU AS VDIF_USU,
	DIFS_FEC AS VDIF_FEC
FROM FPERSONAS, PDIFSLDO, PNOMBRAM, PPUESTOS, PCPUESTOS
WHERE PNOMBRAM.NOMB_EMPL = FPERSONAS.PERS_PERSONA
AND PDIFSLDO.DIFS_NOMB = PNOMBRAM.NOMB_NOMB
AND PPUESTOS.PUES_PSTO = PDIFSLDO.DIFS_PSTO
AND PCPUESTOS.CPUE_PSTO = PDIFSLDO.DIFS_PSTO
AND PCPUESTOS.CPUE_CATEG = PDIFSLDO.DIFS_CATEGP;



CREATE PUBLIC SYNONYM PVDIFSLDO FOR PERSONAL.PVDIFSLDO;

COMMENT ON TABLE PERSONAL.PVDIFSLDO IS 'Vista de Pago de Sueldos
Pago de Sueldos' ;

COMMENT ON COLUMN PERSONAL.PVDIFSLDO.VDIF_SEQ IS 'Consecutivo
Consecutivo
00
*S' ;

COMMENT ON COLUMN PERSONAL.PVDIFSLDO.VDIF_Empl IS 'Empl
Nombre del Empleado
01
*S' ;

COMMENT ON COLUMN PERSONAL.PVDIFSLDO.VDIF_NOMBRE IS 'Nombre
Nombre del Empleado
02
*S' ;

COMMENT ON COLUMN PERSONAL.PVDIFSLDO.VDIF_NOMBS IS 'Nombramiento
Nombramiento
03
*S' ;

COMMENT ON COLUMN PERSONAL.PVDIFSLDO.VDIF_PSTO IS 'Psto_Base
Puesto Base
04
*S' ;

COMMENT ON COLUMN PERSONAL.PVDIFSLDO.VDIF_CATEG IS 'Categoría
Categoría
05
*S' ;

COMMENT ON COLUMN PERSONAL.PVDIFSLDO.VDIF_PSTO2 IS 'Psto_Ascenso
Puesto de Ascenso
06
*S' ;

COMMENT ON COLUMN PERSONAL.PVDIFSLDO.VDIF_FINI IS 'Inicio
Fecha de Inicio
07
*S' ;

COMMENT ON COLUMN PERSONAL.PVDIFSLDO.VDIF_FFIN IS 'Fin
Fecha de Término
08
*S' ;

COMMENT ON COLUMN PERSONAL.PVDIFSLDO.VDIF_TEXTO IS 'Texto
Texto
' ;

COMMENT ON COLUMN PERSONAL.PVDIFSLDO.VDIF_NOMINA IS 'Nomina
Nomina de aplicación
09
*S' ;

COMMENT ON COLUMN PERSONAL.PVDIFSLDO.VDIF_USU IS 'Usuario
Usuario que capturó el movimiento
10
*S' ;

COMMENT ON COLUMN PERSONAL.PVDIFSLDO.VDIF_FEC IS 'Fecha
Fecha de Captura
11
*S' ;


--***********--------------*--***********--------------*--***********--------------*--***********--------------*
--***********--------------*--***********--------------*--***********--------------*--***********--------------*

create or replace trigger TII_PVDIFSLDO
 instead of insert on PVDIFSLDO for each row


begin


if (:new.VDIF_fini is null) or (:new.VDIF_ffin is null) then
      Raise_Application_Error(-20001,'Falta Periodo de Pago');
end if;

if (:new.VDIF_fini > :new.VDIF_ffin) then
      Raise_Application_Error(-20001,'Periodo de Pago Incorrecto');
end if;


-- Insertamos en PDIFSLDO
Insert Into PDIFSLDO
(DIFS_Seq, DIFS_NOMB, DIFS_PSTO, DIFS_CATEGP, DIFS_PSTO2, DIFS_FINI,
 DIFS_FFIN, DIFS_TEXTO)
VALUES
(:NEW.VDIF_Seq, :NEW.VDIF_NOMBS, :NEW.VDIF_PSTO, :NEW.VDIF_CATEG, :NEW.VDIF_PSTO2,
 :NEW.VDIF_FINI,:NEW.VDIF_FFIN, :NEW.VDIF_TEXTO) ;




--inserta los pagos
NOM$PAGA_DIFSLDO(:NEW.VDIF_SEQ, :new.VDIF_fini, :new.VDIF_ffin, :NEW.VDIF_NOMBS, 
                 :NEW.VDIF_PSTO, :NEW.VDIF_CATEG, :NEW.VDIF_PSTO2);


end ;

/
--*****************************************************************************************


create or replace trigger TIU_PVDIFSLDO
 instead of update on PVDIFSLDO for each row


begin


if (:new.VDIF_fini is null) or (:new.VDIF_ffin is null) then
      Raise_Application_Error(-20001,'Falta Periodo de Pago');
end if;

if (:new.VDIF_fini > :new.VDIF_ffin) then
      Raise_Application_Error(-20001,'Periodo de Pago Incorrecto');
end if;

if :old.vdif_nomina is not null then 
      Raise_Application_Error(-20001,'Nómina Aplicada, es imposible modificar registro');
end if;



-- Actualizamos en PDIFSLDO
Update PDIFSLDO Set
 DIFS_NOMB = :NEW.VDIF_NOMBS,
 DIFS_PSTO = :NEW.VDIF_PSTO,
 DIFS_CATEGP = :NEW.VDIF_CATEG,
 DIFS_PSTO2 = :NEW.VDIF_PSTO2,
 DIFS_FINI = :NEW.VDIF_FINI,
 DIFS_FFIN = :NEW.VDIF_FFIN,
 DIFS_TEXTO = :NEW.VDIF_TEXTO,
 DIFS_USU = User,
 DIFS_FEC = Sysdate
Where DIFS_Seq = :NEW.VDIF_Seq;



--inserta los pagos
NOM$PAGA_DIFSLDO(:NEW.VDIF_SEQ, :new.VDIF_fini, :new.VDIF_ffin, :NEW.VDIF_NOMBS, :NEW.VDIF_PSTO,
                 :NEW.VDIF_CATEG, :NEW.VDIF_PSTO2);


end ;


/


---***********------***********------***********------***********------***********------***********------***********---

CREATE OR REPLACE TRIGGER TBD_PDIFSLDO
BEFORE DELETE ON PERSONAL.PDIFSLDO FOR EACH ROW



DECLARE
--
BEGIN

 IF :old.DIFS_NOMINA IS NOT NULL THEN
  Raise_Application_Error(-20001, 'No es posible borrar el movimiento, Nómina aplicada') ;
 end if ;

 DELETE PMOVIMS
 WHERE MOVI_MOVI IN (SELECT DISL_MOVI FROM PDISLDMOV WHERE DISL_SEQ = :OLD.DIFS_SEQ);

 DELETE PDISLDMOV
 WHERE DISL_SEQ = :OLD.DIFS_SEQ; 
 
END ;


/

---***********------***********------***********------***********------***********------***********------***********------**



--***-*-*-*--*--*-*-*-*----------------------------------------------------------------------------------------------
--***-*-*-*--*--*-*-*-*----------------------------------------------------------------------------------------------
--***-*-*-*--*--*-*-*-*----------------------------------------------------------------------------------------------

--***-*-*-*--*--*-*-*-*----------------------------------------------------------------------------------------------
CREATE OR REPLACE Procedure NOM$PAGA_DIFSLDO(SEQ IN NUMBER, FINICIO IN DATE, FFIN IN DATE,
                                             NOMB IN NUMBER, PSTO IN VARCHAR2,
                                             CATEG IN VARCHAR2, PSTO2 IN VARCHAR2)

IS

--variables nuevo procedimiento
 
 AgrupaSemanas number :=0; 

 Monto_Quinquenio Number := 0;
 Porc_Quinq Number :=0;
 Antig Number := 0;
 Tpsto varchar2(2);
 Empl varchar2(12);
 Sldo_Mens Number;
 Sldo_Quin Number; 
 Sldo_Total Number; 
 Elinicio Date;
 Elfin Date;
 CuentaDias Number := 0;
 fin_mes Date;
 Quincenas Number := 0;
 Dia number := 0;

 SUELDOMENS Number := 0;
 SUELDOMENS_ASC Number := 0;
 SLDO_QUIN_ASC Number := 0;
 SLDO_TOTAL_ASC Number := 0;
 SLDO_FINAL Number:= 0;

 

Begin


     

     Delete Tmp_dpago;
  
  
        Select Nomb_Empl
        Into Empl
        From Pnombram
        Where Nomb_Nomb = Nomb;  
  
     
     If Psto is not null then
        Select Pues_Tpsto
        Into Tpsto
        From Ppuestos
        Where Pues_Psto = Psto;
     end if;
     

     Elinicio := Finicio;
     Elfin := FFin;
     Quincenas := 0;     

     Loop           
     Exit when Elinicio > Elfin;
    
      Dia := TO_Char(Elinicio, 'D');
      
      IF dia in (1,2,3,4,5) then

        if Substr(Elinicio,1,2) <> 31 then
  
             if substr(Elinicio,4,2) = '03' AND cuentaDias > 0 then --VALIDA FEBRERO           
                 if substr(Elinicio-1,1,2) = '28' then
                    CuentaDias:= CuentaDias + 2.8;
                 elsif substr(Elinicio-1,1,2) = '29' then
                    CuentaDias:= CuentaDias + 1.4;
                 end if;
              end if;
              
              CuentaDias := CuentaDias + 1.4; --el normal del dia
                    
        END IF;

       END IF;      

      Elinicio:= Elinicio + 1;               

     End Loop;         
     
--RAISE_APPLICATION_ERROR(-20001, CuentaDias ||'X'||AgrupaSemanas||'Y'||Elinicio||'D'||ElFIN);
     
     
     --*-*-*-*-*-     --*-*-*-*-*-     --*-*-*-*-*-     --*-*-*-*-*-     --*-*-*-*-*-
     --EMPIEZA A CALCULAR SALARIOS     
     
     SELECT B.SPUE_SUELDO
     INTO SUELDOMENS
     FROM PCPUESTOS A, PSPUESTOS B    
     WHERE A.CPUE_PSTO = PSTO
     AND A.CPUE_CATEG = CATEG
     AND B.SPUE_SPUE = A.CPUE_SPUE;
     
     SELECT B.SPUE_SUELDO
     INTO SUELDOMENS_ASC
     FROM PCPUESTOS A, PSPUESTOS B    
     WHERE A.CPUE_PSTO = PSTO2
     AND A.CPUE_CATEG = CATEG
     AND B.SPUE_SPUE = A.CPUE_SPUE;

     
     
     --sueldo
     SLDO_QUIN := SUELDOMENS / 2;
                    
     SLDO_TOTAL := (SLDO_QUIN / 15 * CuentaDias);
     
                  
     --sueldo de ascenso
     SLDO_QUIN_ASC := SUELDOMENS_ASC / 2;
                    
     SLDO_TOTAL_ASC := (SLDO_QUIN_ASC / 15 * CuentaDias);
     
     
     SLDO_FINAL := SLDO_TOTAL_ASC - SLDO_TOTAL;

     /*
     INSERT INTO TMP_DPAGO(CVE, DESCRIP, PERDED, MONTO)
     VALUES('001','SUELDO NORMAL','P', SLDO_FINAL);

     
*/     
     --OK PAGO CORRECTO
     INSERT INTO PVMOVNOMB(VMOV_Movi, VMOV_Nomb, VMOV_PerDed, VMOV_Conp, VMOV_Quin,VMOV_Descrip,
                           VMOV_Texto, VMOV_Expr, VMOV_Total, VMOV_FecIni, VMOV_FecFin, VMOV_Susp,
                           VMOV_Gravable, VMOV_CantGrav)
     SELECT PSQMOVIMS.NEXTVAL, NOMB, 'P', '001', 'A', 'SUELDO TABULAR', 
            'ASCENSO ESCALAFONARIO DEL PERIODO ' || FINICIO || ' AL ' || FFIN ||' CON EL PUESTO DE ' || PSTO2,
            TRANSLATE(ROUND(SLDO_FINAL,2),',','.'), SLDO_FINAL, (SELECT MAX(NOMI_FECFIN) FROM PNOMINAS) + 1, '31/12/3000', 'N','S',SLDO_FINAL
     FROM DUAL;     

     
     insert into PDISLDMOV(DISL_SEQ, DISL_MOVI)
     VALUES(SEQ,PSQMOVIMS.CURRVAL);
    




---- Quinquenio

    SELECT CALCULA_ANTIG(NOMI_FECHA - 15, VEMP_FINGRESO , 1)
    INTO   ANTIG
    FROM   PNOMINAS, PVEMPLDOS
    WHERE  NOMI_NOMINA = (SELECT MAX(NOMI_NOMINA) FROM PNOMINAS)
    AND    VEMP_EMPL = Empl;


    Select VQUI_Antig
    Into Porc_Quinq
    FROM PVQUINDESP
    Where VQUI_Psto= Psto2
      And VQUI_Anios= nvl(Antig,0) ;
      
      
    Monto_Quinquenio := (Porc_Quinq/100) * SLDO_FINAL;
    
                
/*
       INSERT INTO TMP_DPAGO(CVE, DESCRIP, PERDED, MONTO)
       VALUES('041','QUINQUENIO','P', MONTO_QUINQUENIO);
*/

     if monto_quinquenio > 0 then                           
                           
        --OK PAGO CORRECTO
         INSERT INTO PVMOVNOMB(VMOV_Movi, VMOV_Nomb, VMOV_PerDed, VMOV_Conp, VMOV_Quin,VMOV_Descrip,
                               VMOV_Texto, VMOV_Expr, VMOV_Total, VMOV_FecIni, VMOV_FecFin, VMOV_Susp,
                               VMOV_Gravable)
         SELECT PSQMOVIMS.NEXTVAL, NOMB, 'P', '041', 'A', 'QUINQUENIO', 
                'QUINQUENIO POR ASCENSO ESCALAFONARIO CORRESPONDIENTE AL PERIODO DEL ' || FINICIO || ' AL ' || FFIN,
                TRANSLATE(ROUND(Monto_Quinquenio,2),',','.'),
                Monto_Quinquenio,
                (SELECT MAX(NOMI_FECFIN) FROM PNOMINAS) + 1, '31/12/3000', 'N','N'
         FROM DUAL;     

         insert into PDISLDMOV(DISL_SEQ, DISL_MOVI)
         VALUES(SEQ,PSQMOVIMS.CURRVAL);
         
         
     end if;
         
 ----  Quinquenio



  
--Raise_application_error(-20001,'DPQ:'|| CuentaDiasPQ ||' DSQ:'|| CuentaDiasSQ || ' PQ:'|| Prim_Quincenas || ' SQ:'||Segu_Quincenas);       
     

     
End;

/


--***-*-*-*--*--*-*-*-*----------------------------------------------------------------------------------------------
--***-*-*-*--*--*-*-*-*----------------------------------------------------------------------------------------------
--***-*-*-*--*--*-*-*-*----------------------------------------------------------------------------------------------
--***-*-*-*--*--*-*-*-*----------------------------------------------------------------------------------------------


-- Create table 
create table PDISLDMOV
(
 DISL_SEQ NUMBER(10),
 DISL_MOVI    NUMBER(10)
);

CREATE PUBLIC SYNONYM PDISLDMOV FOR PERSONAL.PDISLDMOV;
