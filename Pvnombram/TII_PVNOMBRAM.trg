create or replace trigger TII_PVNOMBRAM
 instead of insert on pvnombram  for each row

declare
 plaz number ;
 tt varchar2(30) ;

begin

-- Insertamos en Nombramiento
 INSERT INTO PNOMBRAM
 (NOMB_Nomb, NOMB_Nomb_Reem, NOMB_Plaza, NOMB_Empl, NOMB_Descrip,
  NOMB_SSueldo, NOMB_Texto, NOMB_Susp, NOMB_Ini, NOMB_Fin, NOMB_SPIUJAT, NOMB_BANCO_NOM,
  NOMB_BANCOD, NOMB_CBANC, NOMB_DIRIGIDO, NOMB_COPIAU, NOMB_COPIAD, NOMB_COPIAT,
  NOMB_CONT, NOMB_FECHA, NOMB_CATEG, NOMB_USU, NOMB_FEC)
 VALUES
 (:new.VNOM_Nomb, :new.VNOM_Reem, :new.VNOM_Plaza, :new.VNOM_Empl, :new.VNOM_Descrip,
  :new.VNOM_SSueldo, :new.VNOM_Texto, :new.VNOM_Susp, :new.VNOM_Ini, :new.VNOM_Fin, :new.VNOM_SPIUJAT,
  :new.VNOM_BANCO_NOM, :NEW.VNOM_BANCOD, :NEW.VNOM_CBANC, :NEW.VNOM_DIRIGIDO, :NEW.VNOM_COPIAU,
  :NEW.VNOM_COPIAD, :NEW.VNOM_COPIAT, :NEW.VNOM_CONT, :NEW.VNOM_FECHA, :NEW.VNOM_CATEG,
  USER, SYSDATE);


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
