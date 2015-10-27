----***********************************--------------*************---------

---crea la tabla de cancelación de pagos


----***********************************--------------*************---------
--***--------**-------------------****************--------------


CONNECT SHAKE/SHAKE@BD;

INSERT INTO SMODULOS(MODU_MODULO, MODU_PRED, MODU_DESCRIP, MODU_APLICACION,MODU_DETALLE,
 MODU_MANTEN, MODU_REPORTE, MODU_VERSION, MODU_SCRIPT, MODU_INSERTA, MODU_EDITA, MODU_BORRA)
 VALUES('PVCANCPA','PNOMIS','Cancelar Pago',0,'S','S','S','3.0.0.0','Pvcpag_001','N','S','N');


COMMIT;



--*****************************************************************************************
CONNECT PERSONAL/PERSONAL@BD;

--*****************************************************************************************


-- Create table 
create table PCANCPAGO
(
  CANC_PAGO NUMBER(15) not null,
  CANC_CANCELA VARCHAR2(1) default 'N',
  CANC_TEXTO VARCHAR2(50),
  CANC_USU VARCHAR2(30) default USER,
  CANC_FEC DATE default SYSDATE
);


alter table PCANCPAGO
  add constraint UK$PCANCPAGO$PAGO unique (CANC_PAGO);


CREATE PUBLIC SYNONYM PCANCPAGO FOR PERSONAL.PCANCPAGO;


-- Add comments to the table 
comment on table PCANCPAGO is 'Tabla de Pagos Cancelados';

-- Add comments to the columns 
comment on column PCANCPAGO.CANC_PAGO is 'Pago
Numero de pago
*';

comment on column PCANCPAGO.CANC_CANCELA is 'Cancelado
Pago Cancelado
*';

comment on column PCANCPAGO.CANC_TEXTO is 'Texto
Texto
*';

comment on column PCANCPAGO.CANC_USU is 'Usuario
Usuario
*';

comment on column PCANCPAGO.CANC_FEC is 'Fecha
Fecha
*';

--**************************-----------------------------************

CREATE OR REPLACE VIEW PVCANCPA As
Select
	PAGO_Nomina AS VCAN_Nomina,
	CANC_Pago AS VCAN_Pago,
	PERS_Persona AS VCAN_Empl,
	substr(PERS_Apepat || ' ' || PERS_Apemat || ' ' || PERS_Nombre,1,50) AS VCAN_Nombre,
	Tpue_Descrip AS VCAN_Tpsto,
	CANC_Cancela AS VCAN_Cancela,
	CANC_Texto AS VCAN_Texto,
	CANC_Usu AS VCAN_Usu,
	CANC_Fec AS VCAN_Fec
From PCANCPAGO, PPAGOS, FPERSONAS, PTPUESTOS
Where Pago_Pago = Canc_Pago
And Pago_Empl = Pers_Persona
And Pago_Tpsto = Tpue_Tpsto(+);
/


CREATE PUBLIC SYNONYM PVCANCPA FOR PERSONAL.PVCANCPA;


-- Add comments to the view
comment on table PVCANCPA is 'Vista de Pagos Cancelados';

-- Add comments to the columns 
comment on column PVCANCPA.VCAN_NOMINA is 'Nómina
Numero de Nómina
01
*S' ;

comment on column PVCANCPA.VCAN_PAGO is 'Pago
Numero de Pago
02
*S' ;

comment on column PVCANCPA.VCAN_EMPL is 'Empl
Clave de Empleado
03
*S' ;

comment on column PVCANCPA.VCAN_NOMBRE is 'Nombre
Nombre del Empleado
04
*S' ;


comment on column PVCANCPA.VCAN_TPSTO is 'Tpsto
Tipo de Puesto
05
*S' ;

comment on column PVCANCPA.VCAN_CANCELA is 'Cancelado
Pago Cancelado  (S = Si, N = No)
06
*S' ;

comment on column PVCANCPA.VCAN_TEXTO is 'Texto
Texto
07
*S' ;

comment on column PVCANCPA.VCAN_Usu is 'Usuario
Usuario que canceló el pago
08
*S' ;

comment on column PVCANCPA.VCAN_Fec is 'Fecha
Fecha de Cancelación
09
*S' ;

--**************************-----------------------------************

--**************************-----------------------------************

--**************************-----------------------------************

--**************************-----------------------------************
