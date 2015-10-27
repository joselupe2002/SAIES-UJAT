create or replace trigger TIU_PVEMPLDOS
instead of update on PVEMPLDOS  for each row
declare
 tt varchar2(30) ;
 curp varchar2(18) ;
 CUENTA NUMBER;

begin


IF USER = 'YHH00973' THEN

    -- Cambiamos FPersonas
     UPDATE FPERSONAS Set
      PERS_RFC= :new.VEMP_RFC,
      PERS_Nombre= :new.VEMP_Nombre,
      PERS_ApePat= :new.VEMP_ApePat,
      PERS_ApeMat= :new.VEMP_ApeMat,
      PERS_Direccion= :new.VEMP_Direccion,
      PERS_Telefono= :new.VEMP_Telefono,
      PERS_Contactos= :new.VEMP_Contactos,
      PERS_Sexo= :new.VEMP_Sexo
     Where PERS_Persona= :new.VEMP_Empl ;


     if (:new.vemp_curp is null) then
        curp := NOM$CURP(:new.VEMP_Apepat, :new.VEMP_Apemat, :new.VEMP_Nombre,
                :new.VEMP_Fnaci, :new.VEMP_Sexo, :new.VEMP_Esta) ;
     else
         curp := :new.VEMP_Curp ;
     end if ;

    -- Cambiamos PATREMPL
     UPDATE PATREMPL Set
      ATRE_IMPRESA= :NEW.VEMP_IMPRESA,
      ATRE_FNACI = :NEW.VEMP_FNACI,
      ATRE_ESCOL = :NEW.VEMP_ESCOL,
      ATRE_EDOCIV = :NEW.VEMP_EDOCIV,
      ATRE_EXPED = :NEW.VEMP_EXPED,
      ATRE_DESCRIP = :NEW.VEMP_DESCRIP,
      ATRE_ABREVIA = :NEW.VEMP_ABREVIA,
      ATRE_CURP = CURP,
      ATRE_ESTA = :NEW.VEMP_ESTA,
      ATRE_NUMSS = :NEW.VEMP_NUMSS,
      ATRE_HONORARIOA =:new.VEMP_HONORARIOA,
      ATRE_LISRAYA =:new.VEMP_LISRAYA,
      ATRE_RECIBOFOL =:new.VEMP_RECIBOFOL,
      ATRE_CALCISR =:new.VEMP_CALCISR,
      ATRE_AGUINALDO =:new.VEMP_AGUINALDO,
      ATRE_PRIMAVAC =:new.VEMP_PRIMAVAC,
      ATRE_DIAS31 =:new.VEMP_DIAS31,
      ATRE_BONONAV =:new.VEMP_BONONAV,
      ATRE_DIASAGUI =:new.VEMP_DIASAGUI,
      ATRE_SERVMED =:new.VEMP_SERVMED,
      ATRE_CVEMUNI_NA =:new.VEMP_CVEMUNI_NA,
      ATRE_CIUD_NACI =:new.VEMP_CIUD_NACI,
      ATRE_EMAIL =:new.VEMP_EMAIL,
      ATRE_OBSERVA =:new.VEMP_OBSERVA,
      ATRE_CVEMUNI_DO =:new.VEMP_CVEMUNI_DO,
      ATRE_COLON_DOMI =:new.VEMP_COLON_DOMI,
      ATRE_CVEESTA_DOMI =:new.VEMP_CVEESTA_DOMI,
      ATRE_CVEPAIS_NACI =:new.VEMP_CVEPAIS_NACI,
      ATRE_CVESTATUS =:new.VEMP_CVESTA
     Where ATRE_Empl= :new.VEMP_Empl
     Returning rowid into tt ;


    -- Insertamos en PATREMPL si no existe registro
     if tt is null then
      INSERT INTO PATREMPL
       (ATRE_Empl, ATRE_IMPRESA, ATRE_FNACI,
           ATRE_ESCOL, ATRE_EDOCIV, ATRE_EXPED, ATRE_DESCRIP, ATRE_ABREVIA, ATRE_CURP, ATRE_ESTA,
           ATRE_NUMSS,
       --NUEVOS DATOS PARA EXTERNOS
       ATRE_HONORARIOA, ATRE_LISRAYA, ATRE_RECIBOFOL, ATRE_CALCISR, ATRE_AGUINALDO, ATRE_PRIMAVAC,
       ATRE_DIAS31, ATRE_BONONAV, ATRE_DIASAGUI, ATRE_SERVMED,
      --NUEVOS DATOS DE EMPLEADOS
       ATRE_CVEMUNI_NA, ATRE_CIUD_NACI, ATRE_EMAIL, ATRE_OBSERVA, ATRE_CVEMUNI_DO, ATRE_COLON_DOMI,
       ATRE_CVEESTA_DOMI, ATRE_CVEPAIS_NACI, ATRE_CVESTATUS)
      VALUES
       (:new.VEMP_Empl,
        :NEW.VEMP_IMPRESA, :NEW.VEMP_FNACI,
        :NEW.VEMP_ESCOL, :NEW.VEMP_EdoCiv,
        :NEW.VEMP_EXPED, :NEW.VEMP_DESCRIP, :NEW.VEMP_ABREVIA, CURP, :NEW.VEMP_ESTA,
        :NEW.VEMP_NUMSS,
        :new.VEMP_HONORARIOA, :new.VEMP_LISRAYA, :new.VEMP_RECIBOFOL,:new.VEMP_CALCISR,:new.VEMP_AGUINALDO,
        :new.VEMP_PRIMAVAC,:new.VEMP_DIAS31,:new.VEMP_BONONAV,:new.VEMP_DIASAGUI, :NEW.VEMP_SERVMED,
        :new.VEMP_CVEMUNI_NA, :new.VEMP_CIUD_NACI, :new.VEMP_EMAIL, :new.VEMP_OBSERVA, :new.VEMP_CVEMUNI_DO,
        :new.VEMP_COLON_DOMI, :new.VEMP_CVEESTA_DOMI, :new.VEMP_CVEPAIS_NACI, :new.VEMP_CVESTA) ;
     end if ;


ELSE

    -- Cambiamos FPersonas
     UPDATE FPERSONAS Set
      PERS_RFC= :new.VEMP_RFC,
      PERS_Nombre= :new.VEMP_Nombre,
      PERS_ApePat= :new.VEMP_ApePat,
      PERS_ApeMat= :new.VEMP_ApeMat,
      PERS_Usuario= :new.VEMP_Usuario,
      PERS_Direccion= :new.VEMP_Direccion,
      PERS_Telefono= :new.VEMP_Telefono,
      PERS_Contactos= :new.VEMP_Contactos,
      PERS_Sexo= :new.VEMP_Sexo,
      PERS_Activo= :new.VEMP_Activo
     Where PERS_Persona= :new.VEMP_Empl ;


     if (:new.vemp_curp is null) then
        curp := NOM$CURP(:new.VEMP_Apepat, :new.VEMP_Apemat, :new.VEMP_Nombre,
                :new.VEMP_Fnaci, :new.VEMP_Sexo, :new.VEMP_Esta) ;
     else
         curp := :new.VEMP_Curp ;
     end if ;

    -- Cambiamos PATREMPL
     UPDATE PATREMPL Set
      ATRE_Banco_Emp= :new.VEMP_Banco_Emp,
      ATRE_CtaBco= :new.VEMP_CtaBco,
      ATRE_URes_P= :new.VEMP_URes_P,
      ATRE_SPIUJAT= :new.VEMP_SPIUJAT,
      ATRE_IMPRESA= :NEW.VEMP_IMPRESA,
      ATRE_FNACI = :NEW.VEMP_FNACI,
      ATRE_FINGRESO = :NEW.VEMP_FINGRESO,
      ATRE_FHINGRESO = :NEW.VEMP_FHINGRESO,
      ATRE_FJUBILA = :NEW.VEMP_FJUBILA,
      ATRE_ESCOL = :NEW.VEMP_ESCOL,
      ATRE_EDOCIV = :NEW.VEMP_EDOCIV,
      ATRE_PROMEP = :NEW.VEMP_PROMEP,
      ATRE_EXPED = :NEW.VEMP_EXPED,
      ATRE_DESCRIP = :NEW.VEMP_DESCRIP,
      ATRE_ABREVIA = :NEW.VEMP_ABREVIA,
      ATRE_CURP = CURP,
      ATRE_ESTA = :NEW.VEMP_ESTA,
      ATRE_NUMSS = :NEW.VEMP_NUMSS,
      ATRE_BANCOD = :NEW.VEMP_BANCOD,
      ATRE_URES_C = :NEW.VEMP_URES_C,
      ATRE_FINGRESOD = :NEW.VEMP_FINGRESOD,
      ATRE_FHINGRESOD = :NEW.VEMP_FHINGRESOD,
      ATRE_FJUBILAD = :NEW.VEMP_FJUBILAD,
      ATRE_HONORARIOA =:new.VEMP_HONORARIOA,
      ATRE_LISRAYA =:new.VEMP_LISRAYA,
      ATRE_RECIBOFOL =:new.VEMP_RECIBOFOL,
      ATRE_CALCISR =:new.VEMP_CALCISR,
      ATRE_AGUINALDO =:new.VEMP_AGUINALDO,
      ATRE_PRIMAVAC =:new.VEMP_PRIMAVAC,
      ATRE_DIAS31 =:new.VEMP_DIAS31,
      ATRE_BONONAV =:new.VEMP_BONONAV,
      ATRE_DIASAGUI =:new.VEMP_DIASAGUI,
      ATRE_SERVMED =:new.VEMP_SERVMED,
      ATRE_CVEMUNI_NA =:new.VEMP_CVEMUNI_NA,
      ATRE_CIUD_NACI =:new.VEMP_CIUD_NACI,
      ATRE_EMAIL =:new.VEMP_EMAIL,
      ATRE_OBSERVA =:new.VEMP_OBSERVA,
      ATRE_CVEMUNI_DO =:new.VEMP_CVEMUNI_DO,
      ATRE_COLON_DOMI =:new.VEMP_COLON_DOMI,
      ATRE_CVEESTA_DOMI =:new.VEMP_CVEESTA_DOMI,
      ATRE_CVEPAIS_NACI =:new.VEMP_CVEPAIS_NACI,
      ATRE_CVESTATUS =:new.VEMP_CVESTA
     Where ATRE_Empl= :new.VEMP_Empl
     Returning rowid into tt ;


    -- Insertamos en PATREMPL si no existe registro
     if tt is null then
      INSERT INTO PATREMPL
       (ATRE_Empl, ATRE_Banco_Emp, ATRE_CtaBco, ATRE_URes_P, ATRE_SPIUJAT,
           ATRE_IMPRESA, ATRE_FNACI, ATRE_FINGRESO, ATRE_FHINGRESO, ATRE_FJUBILA,
           ATRE_ESCOL, ATRE_EDOCIV, ATRE_PROMEP, ATRE_EXPED, ATRE_DESCRIP, ATRE_ABREVIA, ATRE_CURP, ATRE_ESTA,
           ATRE_NUMSS, ATRE_BANCOD, ATRE_URes_C, ATRE_FINGRESOD, ATRE_FHINGRESOD, ATRE_FJUBILAD,
       --NUEVOS DATOS PARA EXTERNOS
       ATRE_HONORARIOA, ATRE_LISRAYA, ATRE_RECIBOFOL, ATRE_CALCISR, ATRE_AGUINALDO, ATRE_PRIMAVAC,
       ATRE_DIAS31, ATRE_BONONAV, ATRE_DIASAGUI, ATRE_SERVMED,
      --NUEVOS DATOS DE EMPLEADOS
       ATRE_CVEMUNI_NA, ATRE_CIUD_NACI, ATRE_EMAIL, ATRE_OBSERVA, ATRE_CVEMUNI_DO, ATRE_COLON_DOMI,
       ATRE_CVEESTA_DOMI, ATRE_CVEPAIS_NACI, ATRE_CVESTATUS)
      VALUES
       (:new.VEMP_Empl, :new.VEMP_Banco_Emp, :new.VEMP_CtaBco, :new.VEMP_URes_P, :new.VEMP_SPIUJAT,
        :NEW.VEMP_IMPRESA, :NEW.VEMP_FNACI, :NEW.VEMP_FINGRESO, :NEW.VEMP_FHINGRESO, :NEW.VEMP_FJUBILA,
        :NEW.VEMP_ESCOL, :NEW.VEMP_EdoCiv,
        :NEW.VEMP_PROMEP, :NEW.VEMP_EXPED, :NEW.VEMP_DESCRIP, :NEW.VEMP_ABREVIA, CURP, :NEW.VEMP_ESTA,
        :NEW.VEMP_NUMSS, :NEW.VEMP_BANCOD, :new.VEMP_URes_C, :NEW.VEMP_FINGRESOD, :NEW.VEMP_FHINGRESOD, :NEW.VEMP_FJUBILAD,
        :new.VEMP_HONORARIOA, :new.VEMP_LISRAYA, :new.VEMP_RECIBOFOL,:new.VEMP_CALCISR,:new.VEMP_AGUINALDO,
        :new.VEMP_PRIMAVAC,:new.VEMP_DIAS31,:new.VEMP_BONONAV,:new.VEMP_DIASAGUI, :NEW.VEMP_SERVMED,
        :new.VEMP_CVEMUNI_NA, :new.VEMP_CIUD_NACI, :new.VEMP_EMAIL, :new.VEMP_OBSERVA, :new.VEMP_CVEMUNI_DO,
        :new.VEMP_COLON_DOMI, :new.VEMP_CVEESTA_DOMI, :new.VEMP_CVEPAIS_NACI, :new.VEMP_CVESTA) ;
     end if ;

END IF;

   --ACTUALIZA CONTROL ESCOLAR

   SELECT COUNT(*)
   INTO CUENTA
   FROM PNOMBRAM A, PPLAZAS B
   WHERE A.NOMB_PLAZA = B.PLAZ_PLAZA
   AND B.PLAZ_PSTO IN ('PROFINV','TECACAD')
   AND A.NOMB_EMPL = :NEW.VEMP_EMPL;


   IF NVL(CUENTA,0) > 0 THEN
      ACTUALIZA_ESCOLAR(:NEW.VEMP_EMPL, 1, :new.VEMP_Nombre, :new.VEMP_ApePat, :new.VEMP_ApeMat, :NEW.VEMP_ABREVIA,'');
   END IF;



end ;
/
