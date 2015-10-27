create or replace trigger TIU_PVNOMBRAM
 instead of update on pvnombram  for each row
declare
 tt varchar2(30) ;
 ini date ;
 fin date ;
begin

-- Validacion en Vista PARA Fechas de Reemplazo <---
 if :new.VNOM_Tipo= 'R' then
  SELECT NOMB_Ini, NOMB_Fin
  Into Ini, Fin
  FROM PNOMBRAM
  Where NOMB_Nomb= :new.VNOM_Reem ;

  if :new.VNOM_Ini < Ini then
   Raise_Application_Error(-20001, 'Inicio de Reemplazo no puede ser menor a Inicio de Titular' ) ;
  end if ;


  if :new.VNOM_Fin > Fin then
   Raise_Application_Error(-20001, 'Fin de Reemplazo no puede ser mayor a Fin de Titular' ) ;
  end if ;
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
  NOMB_SPIUJAT= :new.VNOM_SPIUJAT,
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
  NOMB_USU= USER,
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
  ATRE_URes_P= :new.VNOM_URes
 WHERE ATRE_Empl= :new.VNOM_Empl
 Returning rowid into tt ;

 if tt is null then
  INSERT INTO PATREMPL  (ATRE_EMPL, ATRE_URES_P)
  VALUES (:new.VNOM_Empl, :new.VNOM_URes) ;
 end if ;


--ESCOLAR
 IF :NEW.VNOM_PSTO IN ('PROFINV','TECACAD') THEN
     ACTUALIZA_ESCOLAR(:NEW.VNOM_EMPL, 1,'','','','');
 END IF;


end ;
/
