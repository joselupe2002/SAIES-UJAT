-- Create table
create table PHMOVIMS
(
  MOVI_MOVI    NUMBER(10) not null,
  MOVI_TMOVI   VARCHAR2(1),
  MOVI_CONP    VARCHAR2(5),
  MOVI_DESCRIP VARCHAR2(35),
  MOVI_TEXTO   VARCHAR2(300),
  MOVI_PERDED  VARCHAR2(1),
  MOVI_QUIN    VARCHAR2(1) default 'A',
  MOVI_MES     VARCHAR2(2) default '00',
  MOVI_EXPR    VARCHAR2(350),
  MOVI_PARAMS  VARCHAR2(300),
  MOVI_FECINI  DATE,
  MOVI_FECFIN  DATE,
  MOVI_TOTAL   NUMBER,
  MOVI_ACUM    NUMBER default 0,
  MOVI_CNTA    VARCHAR2(8),
  MOVI_SCTA    VARCHAR2(12),
  MOVI_SUSP    VARCHAR2(1) default 'N',
  MOVI_USU     VARCHAR2(30) default USER,
  MOVI_FEC     DATE default SYSDATE
)
;
-- Add comments to the table 
comment on table PHMOVIMS
  is 'Movimientos a aplicar en Nominas';
-- Add comments to the columns 
comment on column PHMOVIMS.MOVI_MOVI  is 'Movim
Numero de Movimiento
*';
comment on column PHMOVIMS.MOVI_TMOVI   is 'TipMovim
Tipo de Movimiento del Detalle, donde :
N= Nombramiento (PMOVNOMB)
G=General Nombramiento (PMOVGNOM)
P=Empleado (PMOVEMPL)
H=General Empleado (PMOVGEMP)
T=Tercero (PMOVTERC)
E=Extraord (PMOVEXT)
C=Complementaria (PMOVCOMP)';

comment on column PHMOVIMS.MOVI_CONP   is 'Concepto
Concepto del Movimiento
*';
comment on column PHMOVIMS.MOVI_DESCRIP   is 'Descripcion
Descripcion del Movimiento
*';
comment on column PHMOVIMS.MOVI_TEXTO   is 'Texto
Texto descriptivo del Movimiento
*';
comment on column PHMOVIMS.MOVI_PERDED   is 'PerDed
Indica si es Percepcion, Deduccion o Ambos
*';
comment on column PHMOVIMS.MOVI_QUIN   is 'Quincena
Indica si se aplica en 1 quincenas, 2 quincenas o en todas
*';
comment on column PHMOVIMS.MOVI_MES   is 'Mes
En que mes se aplica, donde 00 es en todos y 01/12 son naturales
*';
comment on column PHMOVIMS.MOVI_EXPR   is 'Expresion
Expresion que calcula el movimiento
*';
comment on column PHMOVIMS.MOVI_PARAMS   is 'Parametros
Parametros a considerar en la expresion
*';
comment on column PHMOVIMS.MOVI_FECINI   is 'FecIni
Fecha de Inicio de la aplicacion del movimiento
*';
comment on column PHMOVIMS.MOVI_FECFIN   is 'FecFin
Fecha de Fin de la aplicacion del movimiento
*';
comment on column PHMOVIMS.MOVI_TOTAL   is 'Total
Total a aplicar en Monto
*';
comment on column PHMOVIMS.MOVI_ACUM   is 'Acumulado
Monto Acumulado aplicado a la fecha
*';
comment on column PHMOVIMS.MOVI_CNTA   is 'Cuenta
Cuenta Contable opcional para deduccion
*';
comment on column PHMOVIMS.MOVI_SCTA   is 'SubCuenta
SubCuenta Contable opcional para deduccion
*';
comment on column PHMOVIMS.MOVI_SUSP   is 'Suspendida
Indica si el movimiento esta o no suspendido
*';
comment on column PHMOVIMS.MOVI_USU   is 'Usuario
Usuario que registra el movimiento
*';
comment on column PHMOVIMS.MOVI_FEC   is 'Fecha
Fecha del registro
*';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PHMOVIMS
  add constraint PK$PHMOVIMS$MOVI primary key (MOVI_MOVI);

alter table PHMOVIMS
  add constraint FK$PHMOVIMS$CNTA foreign key (MOVI_CNTA)
  references FINANZAS.FCUENTAS (CUEN_CNTA);

alter table PHMOVIMS
  add constraint FK$PHMOVIMS$CONP foreign key (MOVI_CONP)
  references PCONCEPTO (CONC_CONP);

-- Create/Recreate check constraints 
alter table PHMOVIMS
  add constraint CC$PHMOVIMS$MES
  check (MOVI_Mes in ('00', '01','02','03','04','05','06','07','08','09','10','11','12'));

alter table PHMOVIMS
  add constraint CC$PHMOVIMS$MOVI
  check (MOVI_TMovi IN ('N', 'G', 'P', 'H', 'T', 'E', 'C'));

alter table PHMOVIMS
  add constraint CC$PHMOVIMS$PERDED
  check (MOVI_PerDed IN ('P', 'D', 'A'));

alter table PHMOVIMS
  add constraint CC$PHMOVIMS$QUIN
  check (MOVI_Quin IN ('1', '2', 'A'));

alter table PHMOVIMS
  add constraint CC$PHMOVIMS$SUSP
  check (MOVI_Susp IN ('S','N'));

alter table PHMOVIMS
  add constraint CC$PHMOVIMS$TOTAL
  check (MOVI_Total >= MOVI_Acum)
  disable;

alter table PHMOVIMS
  add constraint NN$PHMOVIMS$ACUM
  check (MOVI_ACUM IS NOT NULL);

alter table PHMOVIMS
  add constraint NN$PHMOVIMS$CONP
  check (MOVI_TMovi= 'C' OR MOVI_Conp IS NOT NULL);

alter table PHMOVIMS
  add constraint NN$PHMOVIMS$DESCRIP
  check (MOVI_Descrip is not null);

alter table PHMOVIMS
  add constraint NN$PHMOVIMS$FECFIN
  check (MOVI_FecFin is not null);

alter table PHMOVIMS
  add constraint NN$PHMOVIMS$FECINI
  check (MOVI_FecIni is not null);

alter table PHMOVIMS
  add constraint NN$PHMOVIMS$MES  check (MOVI_Mes is not null);

alter table PHMOVIMS
  add constraint NN$PHMOVIMS$MOVI
  check (MOVI_TMovi is not null);

alter table PHMOVIMS
  add constraint NN$PHMOVIMS$PERDED
  check (MOVI_TMovi='C' OR MOVI_PerDed is not null);

alter table PHMOVIMS
  add constraint NN$PHMOVIMS$QUIN
  check (MOVI_Quin IS NOT NULL);

alter table PHMOVIMS
  add constraint NN$PHMOVIMS$SUSP
  check (MOVI_Susp is not null);

-- Create/Recreate indexes 
create index IX$PHMOVIMS$TMOVI on PHMOVIMS (MOVI_TMOVI)
  ;
-- Grant/Revoke object privileges 
grant select on PHMOVIMS to REPDOC;



CREATE PUBLIC SYNONYM PHMOVIMS FOR PERSONAL.PHMOVIMS ;


--**---*-*-*-*-*--**---*-*-*-*-*--**---*-*-*-*-PENDIENTE*--**---*-*-*-*-*--**---*-*-*-*-*--**---*-*-*-*-*




CREATE OR REPLACE TRIGGER TBIU_PHMOVIMS
BEFORE INSERT OR UPDATE ON PHMOVIMS
FOR EACH ROW


DECLARE
 ultpago date ;
 Cnt Integer ;
BEGIN

 if UPDATING ('MOVI_Acum') then
  if :new.MOVI_TMovi= 'T' then -- Si es Tercero solo acumula la mitad
   :new.MOVI_Acum := (NVL(:old.MOVI_Acum,0)+ NVL(:new.MOVI_Acum,0))/2  ;
  end if ;

  if :new.MOVI_TMovi in ('G','H') then --> Si es General no Acumula
   :new.MOVI_Acum := 0 ;
  end if ;

  return ;
 end if ;


 if :new.MOVI_FecFin is null then
  :new.MOVI_FecFin := TO_Date('31/12/3000','DD/MM/YYYY') ;
 end if ;

 VALEXPNOM(:new.MOVI_Expr, :new.MOVI_TMovi) ;

 if UPDATING  then
  SELECT NVL(MAX(NOMI_Fecha), TO_DATE('31/12/3000', 'DD/MM/YYYY')), count(*)
  Into UltPago, cnt
  FROM PHDPAGOS, PHPAGOS, PHNOMINAS
  WHERE DPAG_Movi= :new.MOVI_Movi
    And PAGO_FecCancel is null
    And PAGO_Pago= DPAG_Pago
    And NOMI_Nomina= PAGO_Nomina ;

  if cnt > 0 And
  ( :old.MOVI_TMovi <> :new.MOVI_TMovi or
    :old.MOVI_Conp <> :new.MOVI_ConP or
    :old.MOVI_Descrip <> :new.MOVI_Descrip or
    :old.MOVI_PerDed <> :new.MOVI_PerDed or
    NVL(:old.MOVI_Quin,'X') <> NVL(:new.MOVI_Quin,'X') or
    NVL(:old.MOVI_Mes,'X') <> NVL(:new.MOVI_Mes,'X') or
    :old.MOVI_Expr <> :new.MOVI_Expr or
    :old.MOVI_FecIni <> :new.MOVI_FecIni
   ) then
   Raise_Application_Error(-20001, 'Solo se pueden modificar Total, Fecha Final y Acumulado despues de aplicar nominas') ;
  end if ;

  if UltPago <> TO_DATE('31/12/3000', 'DD/MM/YYYY') And :new.MOVI_FecFin < UltPago then
   Raise_Application_Error(-20001, 'Fecha Final no puede ser menor a Fecha de Ultima Aplicacion '||TO_Char(UltPago, 'DD/MM/YYYY') ) ;
  end if ;
 end if ;

END ;
/


