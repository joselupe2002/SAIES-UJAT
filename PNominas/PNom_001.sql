
--********----*******************--********----*******************--********----*******************
connect shake/shake@bd;

INSERT INTO SMODULOS (MODU_MODULO, MODU_PRED, MODU_DESCRIP, MODU_APLICACION, MODU_Detalle, MODU_Inserta, MODU_Edita, MODU_Borra, MODU_SCRIPT) 
  VALUES ('PVNOREV', 'PNOMIS', 'Pagos para Revisión', '3', 'N', 'N', 'N', 'N', 'Pnom_001') ;

commit;
--********----*******************--********----*******************--********----*******************

connect personal/personal@bd;



-----****---------------**********************************************-------------------

--triggers---

create or replace trigger "PERSONAL".TBD_PNOMINAS
BEFORE DELETE ON PNOMINAS for EACH ROW

Declare
  ultima number(10);
  INBORRABLE NUMBER;

BEGIN

 Select max(acum_nomina)
 into ultima
 from Pacumnom;

 IF :old.nomi_nomina <> ultima then
    raise_application_error(-20001,'Solo es posible eliminar última nomina: ' || ultima);
 END IF;

 SELECT COUNT(NOMI_NOMINA)
 INTO INBORRABLE
 FROM PNOMIINBO
 WHERE NOMI_NOMINA IN (SELECT max(acum_NOMINA) FROM Pacumnom);
 
 IF INBORRABLE = 1 THEN
    raise_application_error(-20001,'La nómina no puede ser Borrada, Nómina Histórica ' || :old.nomi_nomina);
 END IF;
 
 if :old.NOMI_Tipo= 'C' then
  UPDATE PMOVCOMP Set
   MOVC_Pago= Null
  WHERE MOVC_Pago in
   (Select PAGO_Pago
    From PPAGOS
    Where PAGO_Nomina= :old.NOMI_Nomina) ;
 end if ;

END ;

/

----------------------*********************--------------------------------***********-------

----views-----

Create or Replace View PvNoRev as
select 
       Vpag_Nomina As VNor_Nomina,
       Vpag_Tipo As VNor_Tnomina,       
       Vpag_Pago As VNor_Pago,
       Vpag_Fecha As VNor_Fecha,
       Vpag_Nomb As VNor_Nomb,
       Vpag_Empl As VNor_Empl,
       Vpag_Nombre As VNor_Nombre,
       Vpag_Tpsto As VNor_Tpsto,
       Vpag_Psto As VNor_Psto,       
       Vpag_Ures As VNor_CveUres,
       Ures_Descrip As VNor_Ures,       
       Vpag_Percs As VNor_Percs,
       Vpag_Dedus As VNor_Dedus,
       Vpag_Ambos As VNor_Ambos,
       Vpag_Neto As VNor_Neto
from pvpagos, Fures
where vpag_neto <= 0
And ures_ures = vpag_ures;

create public synonym PvNoRev for Personal.PvnoRev;

COMMENT ON TABLE PvNoRev IS 'Pagos de Nómina para Revisión' ;

COMMENT ON COLUMN PvNoRev.VNor_Nomina is 'Nomina
Nomina
00
*S' ;

COMMENT ON COLUMN PvNoRev.VNor_TNomina is 'TNomina
Tipo de Nomina
01
*S' ;

COMMENT ON COLUMN PvNoRev.VNor_Pago is 'Pago
Pago
02
*S' ;


COMMENT ON COLUMN PvNoRev.VNor_Fecha is 'Fecha
Fecha
03
*S' ;

COMMENT ON COLUMN PvNoRev.VNor_Nomb is 'Nombram
Nombramiento
04
*S' ;

COMMENT ON COLUMN PvNoRev.VNor_Empl is 'Empl
Empleado
05
*S' ;

COMMENT ON COLUMN PvNoRev.VNor_Nombre is 'Nombre
Nombre del Empleado
06
*S' ;

COMMENT ON COLUMN PvNoRev.VNor_Tpsto is 'TPsto
Tipo de Puesto
07
*S' ;

COMMENT ON COLUMN PvNoRev.VNor_Psto is 'Psto
Puesto
08
*S' ;

COMMENT ON COLUMN PvNoRev.VNor_CveUres is 'CveUres
Clave Ures
09
*S' ;

COMMENT ON COLUMN PvNoRev.VNor_Ures is 'Ures
Ures
10
*S' ;

COMMENT ON COLUMN PvNoRev.VNor_Percs is 'Percepciones
Percepciones
11
*S' ;

COMMENT ON COLUMN PvNoRev.VNor_Dedus is 'Deducciones
Deducciones
12
*S' ;

COMMENT ON COLUMN PvNoRev.VNor_Ambos is 'Ambos
Clave Ambos
13
*S' ;

COMMENT ON COLUMN PvNoRev.VNor_Neto is 'Neto
Neto
14
*S' ;



--***********----------------***********************---------------------------*********************-----------

----TABLA DE NOMINAS INBORRABLES

create table PNOMIINBO
(
  NOMI_NOMINA NUMBER(10) not null,
  NOMI_USU VARCHAR2(30) default USER,
  NOMI_FEC DATE default sysdate
);



--*********************----------------------*****************************************************-------------------

CREATE OR REPLACE TRIGGER TBI_PNOMINAS
BEFORE INSERT ON PNOMINAS
FOR EACH ROW



DECLARE
 Cnt Number ;
 AA Varchar2(4) ;
 MM Varchar2(2) ;
 Fecha Date := :new.NOMI_Fecha ;
 Fec1 Date ;
 Fec2 Date ;
 nMes varchar2(3) ;
 quin varchar2(2) ;
BEGIN

-- Acomodamos fechas de Inicio y Fin, para cuando esten vacias


-- Checamos que no existan nominas cruzadas

-- Select Count(*) Into cnt
-- From PNOMINAS
-- Where NOMI_Tipo= :new.NOMI_Tipo
--   And NOMI_Polid Is Null ;

-- if cnt > 0 then
--  Raise_Application_Error(-20001, 'Existen nominas del mismo tipo sin cerrar, cerrar o cancelar primero') ;
-- end if ;

-- Ponemos el banco x DEFAULT
 if :new.NOMI_Banco is null then
  SELECT DATP_Banco_Nomina
  into :new.NOMI_Banco
  FROM PDATPER ;
 end if ;

 if :new.NOMI_FecFin is null then
  :new.NOMI_FecFin := :new.NOMI_Fecha ;
 end if ;


 aa := TO_Char(Fecha, 'YYYY') ;
 mm := TO_Char(Fecha, 'MM') ;

 if mm= '01' then
  nMes := 'ENE' ;
 elsif mm= '02' then
  nMes := 'FEB' ;
 elsif mm= '03' then
  nMes := 'MAR' ;
 elsif mm= '04' then
  nMes := 'ABR' ;
 elsif mm= '05' then
  nMes := 'MAY' ;
 elsif mm= '06' then
  nMes := 'JUN' ;
 elsif mm= '07' then
  nMes := 'JUL' ;
 elsif mm= '08' then
  nMes := 'AGO' ;
 elsif mm= '09' then
  nMes := 'SEP' ;
 elsif mm= '10' then
  nMes := 'OCT' ;
 elsif mm= '11' then
  nMes := 'NOV' ;
 else nMes := 'DIC' ;
 end if ;

-- Checamos que la fecha en nomina ordinaria sea el 15 o el ultimo del mes

 if :new.NOMI_Tipo= 'O' then

  Select Count(*) Into cnt
  From PNOMINAS
  Where NOMI_Tipo= 'O'
    And NOMI_Fecha= :new.NOMI_Fecha ;

  if cnt > 0 then
   Raise_Application_Error(-20001, 'Ya existe esa fecha para nomina ordinaria') ;
  end if ;



  Fec1 := TO_Date('01'||mm||aa, 'DDMMYYYY') ;
  Fec2 := ADD_MONTHS(Fec1,1) - 1 ;
  Fec1 := Fec1+ 14 ;

  if TO_Char(Fecha, 'DD')= '15' then
   quin := '1A' ;
  else
   quin := '2A' ;
  end if ;


  if Fecha not in (Fec1, Fec2) then
   Raise_Application_Error(-20001, 'Fecha de Nomina Ordinaria debe ser el 15 o ultimo del Mes') ;
  end if ;

  Select Max(NOMI_Fecha) Into Fec1
  FROM PNOMINAS
  Where NOMI_Tipo= 'O' ;

  if :new.NOMI_Fecha < Fec1 then
   Raise_Application_Error(-20001, 'Fecha de Nomina Ordinaria debe ser mayor a ultima nomina : '||TO_CHAR(Fec1,'DD/MM/YYYY') ) ;
  end if ;

  if :new.NOMI_FecIni is null then
   if TO_Char(Fecha, 'DD')= '15' then
    :new.NOMI_FecIni := TO_Date('01'||mm||aa, 'DDMMYYYY') ;
   else
    :new.NOMI_FecIni := TO_Date('16'||mm||aa, 'DDMMYYYY') ;
   end if ;

  end if ;

  :new.NOMI_Descrip := 'NOMINA ORDINARIA '||quin||'/'||nmes||'/'||aa ;

 end if ;

 if :new.NOMI_Descrip is null then
     if :new.NOMI_Tipo= 'C' then
   :new.NOMI_Descrip := 'NOMINA COMPLEMEN '||TO_Char(:new.NOMI_Fecha,'DD')||'/'||nmes||'/'||aa ;
  elsif :new.NOMI_Tipo= 'E' then
   :new.NOMI_Descrip := 'NOMINA EXTRAORD '||TO_Char(:new.NOMI_Fecha,'DD')||'/'||nmes||'/'||aa ;
  else
   :new.NOMI_Descrip := 'NOMINA RECALCULO '||TO_Char(:new.NOMI_Fecha,'DD')||'/'||nmes||'/'||aa ;
  end if ;

 end if ;

 
 --para nominas complementarias
 if :new.NOMI_Tipo= 'C' then

  if :new.NOMI_FecIni is null then
   if TO_Char(Fecha, 'DD')= '15' then
    :new.NOMI_FecIni := TO_Date('01'||mm||aa, 'DDMMYYYY') ;
   else
    :new.NOMI_FecIni := TO_Date('16'||mm||aa, 'DDMMYYYY') ;
   end if ;

  end if ;


--  :new.NOMI_FecIni := :new.NOMI_Fecha ;
  :new.NOMI_FecFin := :new.NOMI_Fecha ;

  Select Count(*) Into cnt
  From PNOMINAS
  Where NOMI_Tipo= 'C'
    And NOMI_Fecha= :new.NOMI_Fecha ;

  if cnt > 0 then
   Raise_Application_Error(-20001, 'Ya existe esa fecha para nomina complementaria') ;
  end if ;



 end if ;

END ;

/


--*******************-*-*-*-*--*******************-*-*-*-*--*******************-*-*-*-*--*******************-*-*-*-*
