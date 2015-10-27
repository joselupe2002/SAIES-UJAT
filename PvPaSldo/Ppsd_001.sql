--Inserta las referencias de otros usuarios y otras bases de datos


CONNECT SHAKE/SHAKE@SAIES_LAP;

INSERT INTO SMODULOS(MODU_MODULO, MODU_PRED, MODU_DESCRIP, MODU_APLICACION,MODU_DETALLE,
 MODU_MANTEN, MODU_REPORTE, MODU_VERSION, MODU_SCRIPT, MODU_INSERTA, MODU_EDITA, MODU_BORRA)
 VALUES('PVPASLDO','PNOMORD','Pagos Sueldos',0,'S','S','S','3.0.0.0','Ppsd_001','S','S','S');


COMMIT;


--CREA todos los objetos

--*****************************************************************************************
CONNECT PERSONAL/PERSONAL@SAIES_LAP;

--*****************************************************************************************

-- Create table 
create table PPASLDO
(
  PASL_SEQ NUMBER(10),
  PASL_NOMB NUMBER(10),
  PASL_PSTO VARCHAR2(10),
  PASL_CATEGP VARCHAR2(10),
  PASL_HORAS NUMBER(2) DEFAULT 0,
  PASL_FINI DATE,
  PASL_FFIN DATE,
  PASL_TEXTO VARCHAR2(200),
  PASL_NOMINA NUMBER(10),
  PASL_USU VARCHAR2(30) DEFAULT USER,
  PASL_FEC DATE DEFAULT SYSDATE
);


-- Create/Recreate primary, unique and foreign key constraints 
alter table PPASLDO
  add constraint PK$PPASLDO$SEQ primary key (PASL_SEQ);

alter table PPASLDO
  add constraint FK$PPASLDO$NOMB foreign key (PASL_NOMB)
  references PNOMBRAM (NOMB_NOMB);

alter table PPASLDO
  add constraint FK$PPASLDO$PSTO_CATEGP foreign key (PASL_PSTO,PASL_CATEGP)
  references PCPUESTOS (CPUE_PSTO,CPUE_CATEG);

-- Create/Recreate check constraints 
alter table PPASLDO
  add constraint NN$PPASLDO$CATEGP
  check (PASL_CATEGP IS NOT NULL);
alter table PPASLDO
  add constraint NN$PPASLDO$PSTO
  check (PASL_PSTO IS NOT NULL);
alter table PPASLDO
  add constraint NN$PPASLDO$FFIN
  check (PASL_FFIN IS NOT NULL);
alter table PPASLDO
  add constraint NN$PPASLDO$FINI
  check (PASL_FINI IS NOT NULL);

CREATE PUBLIC SYNONYM PPASLDO FOR PERSONAL.PPASLDO;

-- Create sequence 
create sequence PSQPASLDO
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1
cache 10
order;

CREATE PUBLIC SYNONYM PSQPASLDO FOR PERSONAL.PSQPASLDO;


COMMENT ON TABLE PERSONAL.PPASLDO IS 'Tabla de Pagos de Sueldo
Pagos de Sueldo' ;


COMMENT ON COLUMN PERSONAL.PPASLDO.PASL_SEQ IS 'Consecutivo
Consecutivo
' ;

COMMENT ON COLUMN PERSONAL.PPASLDO.PASL_NOMB IS 'Nombramiento
Nombramiento
' ;

COMMENT ON COLUMN PERSONAL.PPASLDO.PASL_CATEGP IS 'Categoría
Categoría
' ;

COMMENT ON COLUMN PERSONAL.PPASLDO.PASL_HORAS IS 'Horas
Horas
' ;

COMMENT ON COLUMN PERSONAL.PPASLDO.PASL_FINI IS 'Inicio
Fecha de Inicio del Contrato
' ;

COMMENT ON COLUMN PERSONAL.PPASLDO.PASL_FFIN IS 'Fin
Fecha de Término del Contrato
' ;

COMMENT ON COLUMN PERSONAL.PPASLDO.PASL_TEXTO IS 'Texto
Texto
' ;

COMMENT ON COLUMN PERSONAL.PPASLDO.PASL_NOMINA IS 'Nomina
Nomina
' ;


COMMENT ON COLUMN PERSONAL.PPASLDO.PASL_USU IS 'Usuario
Usuario
' ;

COMMENT ON COLUMN PERSONAL.PPASLDO.PASL_FEC IS 'Fecha
Fecha
' ;

---*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*-
---*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*----*-*-*-*-*-


CREATE OR REPLACE VIEW PVPASLDO AS
SELECT
	PASL_SEQ AS VPAS_SEQ,
	PERS_PERSONA AS VPAS_EMPL,
	SUBSTR(PERS_NOMBRE||' '||PERS_APEPAT||' '||PERS_APEMAT,1,50) As VPAS_NOMBRE,
	NOMB_NOMB AS VPAS_NOMBS,
	PASL_PSTO AS VPAS_PSTO,
	PASL_CATEGP AS VPAS_CATEG,
	PASL_HORAS AS VPAS_HORAS,
	PASL_FINI AS VPAS_FINI,
	PASL_FFIN AS VPAS_FFIN,
	PASL_TEXTO AS VPAS_TEXTO,
	PASL_NOMINA AS VPAS_NOMINA,
	PASL_USU AS VPAS_USU,
	PASL_FEC AS VPAS_FEC
FROM FPERSONAS, PPASLDO, PNOMBRAM, PPUESTOS, PCPUESTOS, PNOMINAS
WHERE PNOMBRAM.NOMB_EMPL = FPERSONAS.PERS_PERSONA
AND PPASLDO.PASL_NOMB = PNOMBRAM.NOMB_NOMB
AND PPUESTOS.PUES_PSTO = PPASLDO.PASL_PSTO
AND PCPUESTOS.CPUE_PSTO = PPASLDO.PASL_PSTO
AND PCPUESTOS.CPUE_CATEG = PPASLDO.PASL_CATEGP
AND PNOMINAS.NOMI_NOMINA(+) = PPASLDO.PASL_NOMINA;



CREATE PUBLIC SYNONYM PVPASLDO FOR PERSONAL.PVPASLDO;

COMMENT ON TABLE PERSONAL.PVPASLDO IS 'Vista de Pago de Sueldos
Pago de Sueldos' ;

COMMENT ON COLUMN PERSONAL.PVPASLDO.VPAS_SEQ IS 'Consecutivo
Consecutivo
00
*S' ;

COMMENT ON COLUMN PERSONAL.PVPASLDO.VPAS_Empl IS 'Empl
Nombre del Empleado
01
*S' ;

COMMENT ON COLUMN PERSONAL.PVPASLDO.VPAS_NOMBRE IS 'Nombre
Nombre del Empleado
02
*S' ;

COMMENT ON COLUMN PERSONAL.PVPASLDO.VPAS_NOMBS IS 'Nombramiento
Nombramiento
03
*S' ;

COMMENT ON COLUMN PERSONAL.PVPASLDO.VPAS_PSTO IS 'Psto
Puesto
04
*S' ;

COMMENT ON COLUMN PERSONAL.PVPASLDO.VPAS_CATEG IS 'Categoría
Categoría
05
*S' ;

COMMENT ON COLUMN PERSONAL.PVPASLDO.VPAS_HORAS IS 'Horas
Horas
06
*S' ;

COMMENT ON COLUMN PERSONAL.PVPASLDO.VPAS_FINI IS 'Inicio
Fecha de Inicio
07
*S' ;

COMMENT ON COLUMN PERSONAL.PVPASLDO.VPAS_FFIN IS 'Fin
Fecha de Término
08
*S' ;

COMMENT ON COLUMN PERSONAL.PVPASLDO.VPAS_TEXTO IS 'Texto
Texto
' ;

COMMENT ON COLUMN PERSONAL.PVPASLDO.VPAS_NOMINA IS 'Nomina
Nomina de aplicación
09
*S' ;

COMMENT ON COLUMN PERSONAL.PVPASLDO.VPAS_USU IS 'Usuario
Usuario que capturó el movimiento
10
*S' ;

COMMENT ON COLUMN PERSONAL.PVPASLDO.VPAS_FEC IS 'Fecha
Fecha de Captura
11
*S' ;


--***********--------------*--***********--------------*--***********--------------*--***********--------------*
--***********--------------*--***********--------------*--***********--------------*--***********--------------*

create or replace trigger TII_PVPASLDO
 instead of insert on PVPASLDO for each row

declare
 
 Horas Number(2);

begin


if (:new.Vpas_fini is null) or (:new.vpas_ffin is null) then
      Raise_Application_Error(-20001,'Falta Periodo de Pago');
end if;

if (:new.vpas_fini > :new.vpas_ffin) then
      Raise_Application_Error(-20001,'Periodo de Pago Incorrecto');
end if;


 IF SUBSTR(:NEW.VPAS_CATEG,LENGTH(:NEW.VPAS_CATEG)-1,2) = 'TC' THEN
    HORAS := 40;
 ELSIF SUBSTR(:NEW.VPAS_CATEG,LENGTH(:NEW.VPAS_CATEG)-1,2) = 'MT' THEN
    HORAS := 20;
 ELSE
    HORAS := :NEW.VPAS_HORAS;
 END IF;


-- Insertamos en PPASLDO
Insert Into PPaSldo
(PASL_Seq, PASL_NOMB, PASL_PSTO, PASL_CATEGP, PASL_HORAS, PASL_FINI,
 PASL_FFIN, PASL_TEXTO)
VALUES
(:NEW.VPAS_Seq, :NEW.VPAS_NOMBS, :NEW.VPAS_PSTO, :NEW.VPAS_CATEG, HORAS,
 :NEW.VPAS_FINI,:NEW.VPAS_FFIN, :NEW.VPAS_TEXTO) ;


--inserta los pagos
NOM$PAGA_SLDO(:new.Vpas_fini, :new.vpas_ffin, :NEW.VPAS_NOMBS, :NEW.VPAS_PSTO, :NEW.VPAS_CATEG, :NEW.VPAS_HORAS);
 
end ;

/
--*****************************************************************************************


create or replace trigger TIU_PVPASLDO
 instead of update on PVPASLDO for each row

declare

 Horas Number(2);

begin

NOM$PAGA_SLDO(:new.Vpas_fini, :new.vpas_ffin, :NEW.VPAS_NOMBS, :NEW.VPAS_PSTO, :NEW.VPAS_CATEG, :NEW.VPAS_HORAS);

if (:new.Vpas_fini is null) or (:new.vpas_ffin is null) then
      Raise_Application_Error(-20001,'Falta Periodo de Pago');
end if;

if (:new.vpas_fini > :new.vpas_ffin) then
      Raise_Application_Error(-20001,'Periodo de Pago Incorrecto');
end if;


 IF SUBSTR(:NEW.VPAS_CATEG,LENGTH(:NEW.VPAS_CATEG)-1,2) = 'TC' THEN
    HORAS := 40;
 ELSIF SUBSTR(:NEW.VPAS_CATEG,LENGTH(:NEW.VPAS_CATEG)-1,2) = 'MT' THEN
    HORAS := 20;
 ELSE
    HORAS := :NEW.VPAS_HORAS;
 END IF;


-- Actualizamos en PPASLDO
Update PPaSldo Set
 PASL_NOMB = :NEW.VPAS_NOMBS,
 PASL_PSTO = :NEW.VPAS_PSTO,
 PASL_CATEGP = :NEW.VPAS_CATEG,
 PASL_HORAS = HORAS,
 PASL_FINI = :NEW.VPAS_FINI,
 PASL_FFIN = :NEW.VPAS_FFIN,
 PASL_TEXTO = :NEW.VPAS_TEXTO,
 PASL_USU = User,
 PASL_FEC = Sysdate
Where PASL_Seq = :NEW.VPAS_Seq;


end ;

/




--***-*-*-*--*--*-*-*-*----------------------------------------------------------------------------------------------

CREATE OR REPLACE Procedure NOM$PAGA_SLDO(FINICIO IN DATE, FFIN IN DATE, NOMB IN NUMBER, PSTO IN VARCHAR2,
                                          CATEG IN VARCHAR2, LASHORAS IN NUMBER)

IS

--variables nuevo procedimiento

 Tpsto varchar2(2);
 Empl varchar2(12);
 Sldo_Mens Number;
 Sldo_Quin Number; 
 BASE_GRAVABLE_PQ Number := 0; 
 BASE_GRAVABLE_SQ Number := 0; 
 Sldo_Total Number; 
 SueldoXHR Number;
 Quincena Date;
 Elinicio Date;
 Elfin Date;
 CuentaDiasPQ Number := 0;
 CuentaDiasSQ Number := 0;
 ini_mes_sig Date;
 medio_mes_sig Date;
 medio_mes Date;
 fin_mes Date;
 Prim_Quincenas Number := 0;
 Segu_Quincenas Number := 0;

 ELISPT_PQ Number := 0;
 ELISPT_SQ Number := 0;
 ELISPT_DPQ Number := 0;
 ELISPT_DSQ Number := 0;
 ELISPT Number := 0;
 
 
 DESCCATEG varchar2(35);

 MONTO_PRESTACION_Q NUMBER;
 MONTO_PRESTACION_D NUMBER; 

 Montocapaci Number := 0;
 MontoQuinquenio Number := 0;
 
--variables de afectacion nomina
ElPuesto varchar2(10);
LaCatego varchar2(10);
Nombramiento number;
Plaza number;
Horas number;
Ures varchar2(8);
Sueldo number(15,2);




--primera quincena
cursor PDPQ is
 Select PRES_ConP as Conp,
       CONC_Descrip as Descrip, 
       (PRES_Monto / 40) As Monto
 From PPRESDOCEN, PConcepto
 Where CONC_Conp= PRES_Conp
 And PRES_Quin = 'P' ;
 
rPDPQ PDPQ%RowType;


--segunda quincena
cursor PDSQ is
 Select PRES_ConP as Conp,
       CONC_Descrip as Descrip, 
       (PRES_Monto / 40) as Monto
 From PPRESDOCEN, PConcepto
 Where CONC_Conp= PRES_Conp
 And PRES_Quin = 'S' ;
 
rPDSQ PDSQ%RowType;
        




Begin


     

     --Delete Tmp_dpago;
  
  
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
     Prim_Quincenas := 0;
     Segu_Quincenas := 0;

     Loop           
     Exit when Elinicio > Elfin;
    
       If Substr(Elinicio,1,2) <= 15 then  --inicio en 1ra quincena
          Elinicio:= Elinicio + 1;               
          CuentaDiasPQ:= CuentaDiasPQ + 1;

       elsif Substr(Elinicio,1,2) > 15 then  --inicio en 2da quincena
         if Substr(Elinicio,1,2) <> 31 then --valida dias31
          CuentaDiasSQ:= CuentaDiasSQ + 1;

           --valida febrero   
           if substr(Elinicio,4,2) = '02' then
              fin_mes := '01/03/' || substr(Elinicio,7,4);
              fin_mes := fin_mes - 1;
              
              if substr(Elinicio,1,2) = substr(fin_mes,1,2) then
               if substr(Elinicio,1,2) = '28' then
                  CuentaDiasSQ:= CuentaDiasSQ + 2;
               elsif substr(Elinicio,1,2) = '29' then
                  CuentaDiasSQ:= CuentaDiasSQ + 1;
               end if;
              end if;
              
           end if;

         end if;
         Elinicio:= Elinicio + 1;               
       
       end if;

     End Loop;         
     
     
     If CuentaDiasPQ >= 15 then
          Prim_Quincenas := trunc(CuentaDiasPQ / 15,0);
          CuentaDiasPQ := CuentaDiasPQ - (Prim_Quincenas * 15);
     End if;
     
     If CuentaDiasSQ >= 15 then
          Segu_Quincenas := trunc(CuentaDiasSQ / 15,0);
          CuentaDiasSQ := CuentaDiasSQ - (Segu_Quincenas * 15);
     End if;      


     SELECT B.SPUE_SUELDO, A.CPUE_DESCRIP
     INTO SUELDOXHR, DESCCATEG
     FROM PCPUESTOS A, PSPUESTOS B    
     WHERE A.CPUE_PSTO = PSTO
     AND A.CPUE_CATEG = CATEG
     AND B.SPUE_SPUE = A.CPUE_SPUE;
     
     IF SUBSTR(DESCCATEG,LENGTH(DESCCATEG)-3,4) = 'T.C.' THEN
        HORAS := 40;
     ELSIF SUBSTR(DESCCATEG,LENGTH(DESCCATEG)-3,4) = 'M.T.' THEN
        HORAS := 20;
     ELSE
        HORAS := LasHoras;
     END IF;
     
     --sueldo
     SLDO_MENS := SUELDOXHR * HORAS;
     SLDO_QUIN := SLDO_MENS / 2;
     
     BASE_GRAVABLE_PQ := SLDO_QUIN;          
     BASE_GRAVABLE_SQ := SLDO_QUIN;
     
     
    -- raise_application_error(-20001,prim_quincenas||'x'||segu_quincenas);
               
     SLDO_TOTAL := (SLDO_QUIN * Prim_Quincenas) + (SLDO_QUIN * Segu_Quincenas) +
                  (SLDO_QUIN / 15 * CuentaDiasPQ) + (SLDO_QUIN / 15 * CuentaDiasSQ);
     
/*     INSERT INTO TMP_DPAGO(CVE, DESCRIP, PERDED, MONTO)
     VALUES('001','SUELDO NORMAL','P', SLDO_QUIN);*/
     
     --OK PAGO CORRECTO
     INSERT INTO PVMOVNOMB(VMOV_Movi, VMOV_Nomb, VMOV_PerDed, VMOV_Conp, VMOV_Quin,VMOV_Descrip,
                           VMOV_Texto, VMOV_Expr, VMOV_Total, VMOV_FecIni, VMOV_FecFin, VMOV_Susp,
                           VMOV_Gravable)
     SELECT PSQMOVIMS.NEXTVAL, NOMB, 'P', '001', 'A', 'SUELDO TABULAR', 
            'PAGO DE ' || LASHORAS || ' HORAS, CORRESPONDIENTES AL PERIODO DEL ' || FINICIO || ' AL ' || FFIN,
            TRANSLATE(ROUND(SLDO_TOTAL,2),',','.'), SLDO_TOTAL, (SELECT MAX(NOMI_FECFIN) FROM PNOMINAS) + 1, '31/12/3000', 'N','N'
     FROM DUAL;     
            
     
     
     
     --prestaciones

  if Prim_Quincenas > 0 or CuentaDiasPQ > 0 then
       
      open PDPQ;
      loop  
        Fetch PDPQ into rPDPQ;
        EXIT WHEN PDPQ%NOTFOUND;
        
             MONTO_PRESTACION_Q := rPDPQ.MONTO * Horas;
             
             BASE_GRAVABLE_PQ := BASE_GRAVABLE_PQ + MONTO_PRESTACION_Q;
             
             MONTO_PRESTACION_Q := rPDPQ.MONTO * Horas * Prim_Quincenas;
             MONTO_PRESTACION_D := (rPDPQ.MONTO * Horas / 15 ) * CuentaDiasPQ;
             --AQUI VA EL CALCULO DEL ISPT PROPORCIONAL
             
/*             INSERT INTO TMP_DPAGO(CVE, DESCRIP, PERDED, MONTO)
             VALUES(rPDPQ.Conp, rPDPQ.Descrip, 'P', MONTO_PRESTACION_Q + MONTO_PRESTACION_D);*/

             --OK PAGO CORRECTO
             INSERT INTO PVMOVNOMB(VMOV_Movi, VMOV_Nomb, VMOV_PerDed, VMOV_Conp, VMOV_Quin,VMOV_Descrip,
                                   VMOV_Texto, VMOV_Expr, VMOV_Total, VMOV_FecIni, VMOV_FecFin, VMOV_Susp,
                                   VMOV_Gravable)
             SELECT PSQMOVIMS.NEXTVAL, NOMB, 'P', rPDPQ.Conp, 'A', rPDPQ.Descrip, 
                    'PAGO DE ' || LASHORAS || ' HORAS, CORRESPONDIENTES AL PERIODO DEL ' || FINICIO || ' AL ' || FFIN,
                    TRANSLATE(ROUND(MONTO_PRESTACION_Q + MONTO_PRESTACION_D,2),',','.'),
                    MONTO_PRESTACION_Q + MONTO_PRESTACION_D,
                    (SELECT MAX(NOMI_FECFIN) FROM PNOMINAS) + 1, '31/12/3000', 'N','N'
             FROM DUAL;     


             
      End loop;

  ---- capacitación     
  
        Montocapaci := NOM$CAPACI(Empl, Horas, '999999') ;

        Montocapaci := (Montocapaci * Prim_Quincenas) + (Montocapaci / 15 * CuentaDiasPQ);
        
/*        INSERT INTO TMP_DPAGO(CVE, DESCRIP, PERDED, MONTO)
        VALUES('004', 'AYUDA PARA CAPACITACION DOCENTE', 'P', Montocapaci);*/

        --OK PAGO CORRECTO
         INSERT INTO PVMOVNOMB(VMOV_Movi, VMOV_Nomb, VMOV_PerDed, VMOV_Conp, VMOV_Quin,VMOV_Descrip,
                               VMOV_Texto, VMOV_Expr, VMOV_Total, VMOV_FecIni, VMOV_FecFin, VMOV_Susp,
                               VMOV_Gravable)
         SELECT PSQMOVIMS.NEXTVAL, NOMB, 'P', '004', 'A', 'AYUDA PARA CAPACITACION DOCENTE', 
                'PAGO DE ' || LASHORAS || ' HORAS, CORRESPONDIENTES AL PERIODO DEL ' || FINICIO || ' AL ' || FFIN,
                TRANSLATE(ROUND(Montocapaci,2),',','.'),
                Montocapaci,
                (SELECT MAX(NOMI_FECFIN) FROM PNOMINAS) + 1, '31/12/3000', 'N','N'
         FROM DUAL;     
        
   ---- capacitación     
        
  End if;
  
  if Segu_Quincenas > 0 or CuentaDiasSQ > 0 then         

      open PDSQ;
      loop  
        Fetch PDSQ into rPDSQ;
        EXIT WHEN PDSQ%NOTFOUND;
        
             MONTO_PRESTACION_Q := rPDSQ.MONTO * Horas;

             BASE_GRAVABLE_SQ := BASE_GRAVABLE_SQ + MONTO_PRESTACION_Q;
             
             MONTO_PRESTACION_Q := rPDSQ.MONTO * Horas * Segu_Quincenas;
             MONTO_PRESTACION_D := (rPDSQ.MONTO * Horas / 15 ) * CuentaDiasSQ;
             --AQUI VA EL CALCULO DEL ISPT PROPORCIONAL

/*             INSERT INTO TMP_DPAGO(CVE, DESCRIP, PERDED, MONTO)
             VALUES(rPDSQ.Conp, rPDSQ.Descrip, 'P', MONTO_PRESTACION_Q + MONTO_PRESTACION_D);*/

             --OK PAGO CORRECTO
             INSERT INTO PVMOVNOMB(VMOV_Movi, VMOV_Nomb, VMOV_PerDed, VMOV_Conp, VMOV_Quin,VMOV_Descrip,
                                   VMOV_Texto, VMOV_Expr, VMOV_Total, VMOV_FecIni, VMOV_FecFin, VMOV_Susp,
                                   VMOV_Gravable)
             SELECT PSQMOVIMS.NEXTVAL, NOMB, 'P', rPDSQ.Conp, 'A', rPDSQ.Descrip, 
                    'PAGO DE ' || LASHORAS || ' HORAS, CORRESPONDIENTES AL PERIODO DEL ' || FINICIO || ' AL ' || FFIN,
                    TRANSLATE(ROUND(MONTO_PRESTACION_Q + MONTO_PRESTACION_D,2),',','.'),
                    MONTO_PRESTACION_Q + MONTO_PRESTACION_D,
                    (SELECT MAX(NOMI_FECFIN) FROM PNOMINAS) + 1, '31/12/3000', 'N','N'
             FROM DUAL;     

      End loop;
   end if;


--AQUI VA EL CALCULO DEL ISPT

ELISPT_PQ := ISPT3(BASE_GRAVABLE_PQ);          
ELISPT_SQ := ISPT3(BASE_GRAVABLE_SQ);

ELISPT_DPQ := (ELISPT_PQ / 15) * CuentaDiasPQ;
ELISPT_DSQ := (ELISPT_PQ / 15) * CuentaDiasSQ;
        
ELISPT := (ELISPT_PQ * Prim_Quincenas) + (ELISPT_SQ * Segu_Quincenas) + ELISPT_DPQ + ELISPT_DSQ;


if tpsto <> 'BE' then --no aplica impuesto para Becarios

  if ELISPT > 0 then
               INSERT INTO PVMOVNOMB(VMOV_Movi, VMOV_Nomb, VMOV_PerDed, VMOV_Conp, VMOV_Quin,VMOV_Descrip,
                                     VMOV_Texto, VMOV_Expr, VMOV_Total, VMOV_FecIni, VMOV_FecFin, VMOV_Susp,
                                     VMOV_Gravable)
               SELECT PSQMOVIMS.NEXTVAL, NOMB, 'D', '058', 'A', 'I.S.R.', 
                      'PAGO DE ' || LASHORAS || ' HORAS, CORRESPONDIENTES AL PERIODO DEL ' || FINICIO || ' AL ' || FFIN,
                      TRANSLATE(ROUND(ELISPT,2),',','.'),
                      ELISPT,
                      (SELECT MAX(NOMI_FECFIN) FROM PNOMINAS) + 1, '31/12/3000', 'N','N'
               FROM DUAL;     
  elsif ELISPT < 0 then
               INSERT INTO PVMOVNOMB(VMOV_Movi, VMOV_Nomb, VMOV_PerDed, VMOV_Conp, VMOV_Quin,VMOV_Descrip,
                                     VMOV_Texto, VMOV_Expr, VMOV_Total, VMOV_FecIni, VMOV_FecFin, VMOV_Susp,
                                     VMOV_Gravable)
               SELECT PSQMOVIMS.NEXTVAL, NOMB, 'P', '010', 'A', 'CREDITO AL SALARIO', 
                      'PAGO DE ' || LASHORAS || ' HORAS, CORRESPONDIENTES AL PERIODO DEL ' || FINICIO || ' AL ' || FFIN,
                      TRANSLATE(ROUND((ELISPT * -1),2),',','.'),
                      (ELISPT * -1),
                      (SELECT MAX(NOMI_FECFIN) FROM PNOMINAS) + 1, '31/12/3000', 'N','N'
               FROM DUAL;     
  End if;

end if;


---- Quinquenio
     
        MontoQuinquenio := NVL(NOM$ANTIG(Empl, Tpsto, SLDO_MENS, 0, Psto, Categ, 15, Horas) / 2 , 0) ;

        MontoQuinquenio := (MontoQuinquenio * Prim_Quincenas) + (MontoQuinquenio / 15 * CuentaDiasPQ) + 
                           (MontoQuinquenio * Segu_Quincenas) + (MontoQuinquenio / 15 * CuentaDiasSQ) ;
        

        --OK PAGO CORRECTO
         INSERT INTO PVMOVNOMB(VMOV_Movi, VMOV_Nomb, VMOV_PerDed, VMOV_Conp, VMOV_Quin,VMOV_Descrip,
                               VMOV_Texto, VMOV_Expr, VMOV_Total, VMOV_FecIni, VMOV_FecFin, VMOV_Susp,
                               VMOV_Gravable)
         SELECT PSQMOVIMS.NEXTVAL, NOMB, 'P', '041', 'A', 'QUINQUENIO', 
                'PAGO DE ' || LASHORAS || ' HORAS, CORRESPONDIENTES AL PERIODO DEL ' || FINICIO || ' AL ' || FFIN,
                TRANSLATE(ROUND(MontoQuinquenio,2),',','.'),
                MontoQuinquenio,
                (SELECT MAX(NOMI_FECFIN) FROM PNOMINAS) + 1, '31/12/3000', 'N','N'
         FROM DUAL;     
         
 ----  Quinquenio



  
--Raise_application_error(-20001,'DPQ:'|| CuentaDiasPQ ||' DSQ:'|| CuentaDiasSQ || ' PQ:'|| Prim_Quincenas || ' SQ:'||Segu_Quincenas);       
     
     
End;


--******---------************--------*****--******---------************--------*****--******---------************--------*****






-- Create table 
create table TMP_DPAGO
(
 CVE VARCHAR2(5),
 DESCRIP VARCHAR2(35),
 PERDED VARCHAR2(1),
 MONTO NUMBER(16,2) 
);