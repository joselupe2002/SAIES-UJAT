CREATE OR REPLACE VIEW PVMOVEMPL AS
SELECT
 MOVI_Movi	As VMOV_Movi,
 MOVE_Empl	As VMOV_Empl,
 SUBSTR(PERS_NOMBRE||' '||PERS_APEPAT||' '||PERS_APEMAT,1,45) As VMOV_Nombre,
 MOVI_Conp	As VMOV_Conp,
 MOVI_Descrip	As VMOV_Descrip,
 MOVI_Texto 	As VMOV_Texto,
 MOVI_PerDed 	As VMOV_PerDed,
 MOVI_Quin		As VMOV_Quin,
 MOVE_AntTerc 	As VMOV_AntTerc,
 MOVE_Difer		As VMOV_Difer,
 SUBSTR(MOVI_Expr,1,30)	As VMOV_Expr,
 MOVI_Total		As VMOV_Total,
 MOVI_Acum		As VMOV_Acum,
 MOVI_FecIni	As VMOV_FecIni,
 MOVI_FecFin	As VMOV_FecFin,
 MOVI_Cnta		As VMOV_Cnta,
 MOVI_SCta		As VMOV_SCta,
 MOVE_SFdo		As VMOV_SFdo,
 MOVE_Prog		As VMOV_Prog,
 MOVE_URes		AS VMOV_URes,
 MOVE_Banco		As VMOV_Banco,
 MOVI_Susp		As VMOV_Susp,
 MOVI_usu		As VMOV_Usuario,
 TO_DATE(MOVI_Fec)	As VMOV_Capturado
FROM FPERSONAS, PMOVIMS, PMOVEMPL
Where MOVI_Movi= MOVE_Movi
  And PERS_Persona= MOVE_Empl;



CREATE PUBLIC SYNONYM PVMOVEMPL FOR PERSONAL.PVMOVEMPL ;

COMMENT ON TABLE PVMOVEMPL IS 'Vista de Movimientos a Empleados' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_MOVI IS 'Movimiento
Numero de Movimiento
00
*S' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_Empl IS 'Empleado
Empleado al que afecta
01
*S' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_Nombre IS 'Nombre
Nombre del Empleado
02
*S' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_Conp IS 'Concepto
Clave del Concepto
03
*S' ;


COMMENT ON COLUMN PVMOVEMPL.VMOV_Descrip IS 'Descripcion
Descripcion del Movimiento
04
*S' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_Texto IS 'Texto
Texto Descriptivo del movimiento
*' ;


COMMENT ON COLUMN PVMOVEMPL.VMOV_PerDed is 'PerDed
Indica si el Movimiento es Percepcion o Deduccion
05
*S' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_Quin is 'Quincena
Indica si el Movimiento se Aplica en 1ra, 2da o Ambas Quincenas
*' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_AntTerc is 'Antes de Terceros
Indica si es deduccion, si se aplica antes o despues de Terceros
*' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_Difer IS 'Pago Difer
Indica, si es percepcion, si el Pago es diferenciado o no
*' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_Expr IS 'Expresion
Expresion que se descuenta
06
*S
*T
30' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_Total IS 'Total
Total a descontar
07
*S
*C' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_Acum IS 'Descontado
Total descontado
08
*S
*C' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_FecIni IS 'Fecha Inicio
Fecha de Inicio del descuento
09
*S' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_FecFin IS 'Fecha Final
Fecha de baja
10
*S' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_Cnta IS 'Cuenta
Cuenta Contable, para deducciones genericas
*' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_Scta IS 'SubCuenta
SubCuenta Contable, para deducciones genericas
*' ;


COMMENT ON COLUMN PVMOVEMPL.VMOV_SFdo IS 'SubFondo
SubFondo, para cuando sea Percepcion
*' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_Prog IS 'Programa
Programa, para cuando sea Percepcion
*' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_URes IS 'U Resp
Unidad Responsable, para cuando sea Percepcion
*' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_Banco IS 'Banco
Banco conque se paga cuando es un pago diferenciado
*' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_Susp IS 'Suspendida
Indica si el movimiento esta o no suspendido
*' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_Usuario IS 'Usuario
Nombre del Usuario
11
*S' ;

COMMENT ON COLUMN PVMOVEMPL.VMOV_Capturado IS 'Capturado
Fecha de Captura
12
*S' ;


--*---*---*-*-*-*-*-**--*-*


create or replace trigger "PERSONAL".TII_PVMOVEMPL
 instead of insert on pvmovempl  for each row

begin

IF :NEW.VMOV_DIFER = 'S' THEN
  -- Validacion presupuestal
   if :new.VMOV_PerDed <> 'D' and :new.VMOV_SFdo is null then
    Raise_Application_Error(-20001, 'SubFondo no puede ser nulo para Percepciones') ;
   end if ;
  
   if :new.VMOV_PerDed <> 'D' and :new.VMOV_Prog is null then
    Raise_Application_Error(-20001, 'Programa no puede ser nulo para Percepciones') ;
   end if ;
END IF;

-- Insertamos en Movims
 INSERT INTO PMOVIMS
  (MOVI_Movi, MOVI_TMovi, MOVI_ConP, MOVI_Descrip, MOVI_Texto,  MOVI_PerDed, MOVI_Quin,
   MOVI_Expr, MOVI_Total, MOVI_FecIni, MOVI_FecFin, MOVI_Cnta, MOVI_Scta, MOVI_Susp)
 VALUES
  (:new.VMOV_Movi, 'P', :new.VMOV_ConP, :new.VMOV_Descrip, :new.VMOV_Texto, :new.VMOV_PerDed, :new.VMOV_Quin,
   :new.VMOV_Expr, :new.VMOV_Total, :new.VMOV_FecIni, :new.VMOV_FecFin, :new.VMOV_Cnta, :new.VMOV_SCta, :new.VMOV_Susp) ;


-- Insertamos en PMovEmpl
 INSERT INTO PMOVEMPL
  (MOVE_Movi, MOVE_Empl, MOVE_AntTerc, MOVE_Difer, MOVE_SFdo, MOVE_Prog, MOVE_URes, MOVE_Banco)
 VALUES
  (:new.VMOV_Movi, :new.VMOV_Empl, :new.VMOV_AntTerc, :new.VMOV_Difer, :new.VMOV_SFdo, :new.VMOV_Prog, :new.VMOV_URes, :new.VMOV_Banco) ;
end ;

/


--**--**--**--**--***--*-*--**-*-*-*-*-


create or replace trigger "PERSONAL".TIU_PVMOVEMPL
 instead of update on pvmovempl  for each row

begin

-- Validacion presupuestal
 if :new.VMOV_PerDed <> 'D' and :new.VMOV_SFdo is null then
  Raise_Application_Error(-20001, 'SubFondo no puede ser nulo para Percepciones') ;
 end if ;

 if :new.VMOV_PerDed <> 'D' and :new.VMOV_Prog is null then
  Raise_Application_Error(-20001, 'Programa no puede ser nulo para Percepciones') ;
 end if ;


-- Actualizamos en Movims
 UPDATE PMOVIMS Set
   MOVI_ConP= :new.VMOV_ConP,
   MOVI_Descrip= :new.VMOV_Descrip,
   MOVI_Texto= :new.VMOV_Texto,
   MOVI_PerDed= :new.VMOV_PerDed,
   MOVI_Quin= :new.VMOV_Quin,
   MOVI_Expr= :new.VMOV_Expr,
   MOVI_Total= :new.VMOV_Total,
   MOVI_FecIni= :new.VMOV_FecIni,
   MOVI_FecFin= :new.VMOV_FecFin,
   MOVI_Cnta= :new.VMOV_Cnta,
   MOVI_SCta= :new.VMOV_Scta,
   MOVI_Susp= :new.VMOV_Susp,
   MOVI_Usu= user,
   MOVI_Fec= sysdate
 Where MOVI_Movi= :new.VMOV_Movi ;

 -- Actualizamos en PMovNomb
  UPDATE PMOVEMPL Set
   MOVE_Empl= :new.VMOV_Empl,
   MOVE_AntTerc= :new.VMOV_AntTerc,
   MOVE_Difer= :new.VMOV_Difer,
   MOVE_SFdo= :new.VMOV_SFdo,
   MOVE_Prog= :new.VMOV_Prog,
   MOVE_URes= :new.VMOV_URes,
   MOVE_Banco= :new.VMOV_Banco
  Where MOVE_Movi= :new.VMOV_Movi ;
end ;

/


--**--**--**-*-*-*-*-*--*-*-*-*-*--*-*

