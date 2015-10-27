--******************-----******************-----******************-----******************-----******************---
------------
---TABLAS---
------------
------------

-- Create table 
create table PMONOMBGRA
(
  MONO_MOVI NUMBER(10) not null,
  MONO_GRAVABLE VARCHAR2(1),
  MONO_CANTGRAV NUMBER(16)  
);


-- Add comments to the table 
comment on table PMONOMBGRA is 'Movimientos a Nombramientos Gravables';

-- Add comments to the columns 
comment on column PMONOMBGRA.MONO_MOVI is 'Movim
Numero de Movimiento
*';

comment on column PMONOMBGRA.MONO_GRAVABLE is 'Gravable
Indica si el movimiento es Gravable
*';

comment on column PMONOMBGRA.MONO_CANTGRAV is 'Cantidad
Cantidad Gravable
*';

-- Create/Recreate primary, unique and foreign key constraints 
alter table PMONOMBGRA add constraint FK$PMONOMBGRA$MOVI foreign key (MONO_MOVI)
  references PMOVNOMB (MOVN_MOVI) on delete cascade;

-- Create/Recreate check constraints 
alter table PMONOMBGRA add constraint CC$PMONOMBGRA$GRAVABLE
  check (MONO_GRAVABLE IN ('S','N'));




--******************-----******************-----******************-----******************-----******************---
-----------
---VISTAS--
-----------

create or replace view pvmovnomb as
Select
 MOVN_Movi		As VMOV_Movi,
 MOVN_Nomb		As VMOV_Nomb,
 NOMB_Empl		As VMOV_Empl,
 SUBSTR(PERS_NOMBRE||' '||PERS_APEPAT||' '||PERS_APEMAT,1,45) As VMOV_Nombre,
 MOVI_PerDed	As VMOV_PerDed,
 MOVI_Conp		As VMOV_Conp,
 MOVI_Quin		As VMOV_Quin,
 MOVI_Descrip	As VMOV_Descrip,
 MOVI_Texto		As VMOV_Texto,
 SUBSTR(MOVI_Expr,1,30)	As VMOV_Expr,
 MOVI_Total		As VMOV_Total,
 MOVI_Acum		As VMOV_Acum,
 MOVI_FecIni		As VMOV_FecIni,
 MOVI_FecFin		As VMOV_FecFin,
 MOVI_Cnta		As VMOV_Cnta,
 MOVI_Scta		As VMOV_SCta,
 MOVI_Susp		As VMOV_Susp,
 MONO_Gravable		As VMOV_Gravable,
 MONO_CantGrav		As VMOV_CantGrav,
 MOVI_Usu		As VMOV_Usuario,
 To_date(MOVI_fec)	As VMOV_Capturado
From FPERSONAS, PNOMBRAM, PMOVIMS, PMOVNOMB, PMONOMBGRA
Where NOMB_Nomb= MOVN_Nomb
  And PERS_Persona= NOMB_Empl
  And MOVI_Movi= MOVN_Movi
  And Mono_Movi =  Movi_movi
;
/


CREATE PUBLIC SYNONYM PVMOVNOMB FOR PERSONAL.PVMOVNOMB ;

COMMENT ON TABLE PVMOVNOMB IS 'Vista de Movimientos a Nombramientos' ;

COMMENT ON COLUMN PVMOVNOMB.VMOV_Movi IS 'Movim
Numero de Movimiento
00
*S' ;

COMMENT ON COLUMN PVMOVNOMB.VMOV_Nomb IS 'Nombramiento
Numero de Nombramiento
01
*S' ;

COMMENT ON COLUMN PVMOVNOMB.VMOV_Empl IS 'Empleado
Empleado del nombramiento al que afecta
02
*S' ;

COMMENT ON COLUMN PVMOVNOMB.VMOV_Nombre IS 'Nombre
Nombre del Empleado
03
*S' ;


COMMENT ON COLUMN PVMOVNOMB.VMOV_PerDed IS 'PerDed
Indica si es Percepcion o Deduccion
07
*S' ;

COMMENT ON COLUMN PVMOVNOMB.VMOV_Conp IS 'Concepto
Clave del Concepto
08
*S' ;


COMMENT ON COLUMN PVMOVNOMB.VMOV_Quin IS 'Quincena
Indica si se aplica en 1as, 2das (nulo para todas)
09
*S' ;


COMMENT ON COLUMN PVMOVNOMB.VMOV_Descrip IS 'Descripcion
Descripcion del movimiento
10
*S' ;

COMMENT ON COLUMN PVMOVNOMB.VMOV_Texto IS 'Texto
Texto Descriptivo del Movimiento
*' ;


COMMENT ON COLUMN PVMOVNOMB.VMOV_Expr IS 'Expresion
Descuento x Nomina
11
*S
*T
30' ;

COMMENT ON COLUMN PVMOVNOMB.VMOV_Total IS 'Total
Total a descontar
12
*S
*C' ;

COMMENT ON COLUMN PVMOVNOMB.VMOV_Acum IS 'Descontado
Total descontado
13
*S
*C' ;

COMMENT ON COLUMN PVMOVNOMB.VMOV_FecIni IS 'Fecha Inicial
Fecha de Inicio del descuento
14
*S' ;

COMMENT ON COLUMN PVMOVNOMB.VMOV_FecFin IS 'Fecha Final
Fecha de fin del descuento
15
*S' ;

COMMENT ON COLUMN PVMOVNOMB.VMOV_Cnta IS 'Cuenta
Cuenta Contable, para deducciones genericas
*' ;

COMMENT ON COLUMN PVMOVNOMB.VMOV_Scta IS 'SubCuenta
SubCuenta Contable, para deducciones genericas
*' ;

COMMENT ON COLUMN PVMOVNOMB.VMOV_Susp IS 'Suspendido
Indica si el movimiento esta o no suspendido
*' ;

COMMENT ON COLUMN PVMOVNOMB.VMOV_Gravable IS 'Gravable
Indica si el movimiento es Gravable o no
16
*S' ;

COMMENT ON COLUMN PVMOVNOMB.VMOV_CantGrav IS 'Cantidad
Cantidad Gravable
*' ;

COMMENT ON COLUMN PVMOVNOMB.VMOV_Usuario IS 'Usuario
Usuario que capturó
17
*S' ;

COMMENT ON COLUMN PVMOVNOMB.VMOV_Capturado IS 'Capturado
Fecha de Captura
18
*S' ;


--******************-----******************-----******************-----******************-----******************---
-------------
---TRIGGERS--
-------------



create or replace trigger "PERSONAL".TII_PVMOVNOMB
 instead of insert on pvmovnomb  for each row

begin

-- Insertamos en Movims
 INSERT INTO PMOVIMS
  (MOVI_Movi, MOVI_TMovi, MOVI_ConP, MOVI_Descrip, MOVI_Texto,  MOVI_PerDed,
   MOVI_Quin, MOVI_Expr, MOVI_Total, MOVI_FecIni, MOVI_FecFin, MOVI_Cnta, MOVI_SCta, MOVI_Susp)
 VALUES
  (:new.VMOV_Movi, 'N', :new.VMOV_ConP, :new.VMOV_Descrip, :new.VMOV_Texto, :new.VMOV_PerDed,
   :new.VMOV_Quin, :new.VMOV_Expr, :new.VMOV_Total, :new.VMOV_FecIni, :new.VMOV_FecFin,
   :new.VMOV_Cnta, :new.VMOV_SCta, :new.VMOV_Susp ) ;


-- Insertamos en PMovNomb
 INSERT INTO PMOVNOMB (MOVN_Movi, MOVN_Nomb)
  VALUES (:new.VMOV_Movi, :new.VMOV_Nomb) ;

-- Insertamos en PMonombgra
 INSERT INTO PMONOMBGRA (MONO_Movi, MONO_GRAVABLE, MONO_CANTGRAV)
  VALUES (:new.VMOV_Movi, :new.VMOV_Gravable, :new.VMOV_CantGrav) ;

end ;

/




create or replace trigger "PERSONAL".TIU_PVMOVNOMB
 instead of update on pvmovnomb  for each row

begin

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
   MOVI_Scta= :new.VMOV_Scta,
   MOVI_Susp= :new.VMOV_Susp
 Where MOVI_Movi= :new.VMOV_Movi ;

 -- Actualizamos en PMovNomb
  UPDATE PMOVNOMB Set
   MOVN_Nomb= :new.VMOV_Nomb
  Where MOVN_Movi= :new.VMOV_Movi ;


 -- Actualizamos en PMoNombgra
  UPDATE PMONOMBGRA Set
   MONO_GRAVABLE= :new.VMOV_GRAVABLE,
   MONO_CANTGRAV= :new.VMOV_CANTGRAV
  Where MONO_Movi= :new.VMOV_Movi ;


end ;
/

