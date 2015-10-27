CREATE OR REPLACE VIEW PVNOMBRAM AS
Select
 NOMB_Nomb	As VNOM_Nomb,
 DECODE(NOMB_Nomb_Reem, Null, 'T', 'R') As VNOM_Tipo,
 NOMB_Plaza	As VNOM_Plaza,
 NOMB_Nomb_Reem As VNOM_Reem,
 NOMB_Cont As VNOM_Cont,
 NOMB_Fecha As VNOM_Fecha,
 NOMB_Empl	As VNOM_Empl,
 SUBSTR(PERS_NOMBRE||' '||PERS_APEPAT||' '||PERS_APEMAT,1,45) As VNOM_Nombre,
 NOMB_Descrip	As VNOM_Descrip,
 PLAZ_URes		As VNOM_URes,
 URes_Descrip As VNOM_UResDesc,
 PLAZ_SFdo		As VNOM_SFdo,
 PLAZ_Tplaza  As VNOM_TPlaza,
 PUES_TPsto		As VNOM_TPsto,
 PLAZ_Psto		As VNOM_Psto,
 PLAZ_Docen		As VNOM_Docen,
 DECODE(PUES_TPsto, 'A', QUIN_Categ, CPUE_Categ) As VNOM_CategR,
 DECODE(PUES_TPsto, 'A', QUIN_Categ, CPUE_DESCRIP) As VNOM_CategRDesc,
 DECODE(PUES_TPsto, 'A', QUIN_Categ, CPUE_Categ) As VNOM_Categ,
 PLAZ_Horas		As VNOM_Horas,
 DECODE(PUES_SUEL_ALT, 'S', PLAZ_SLDO,
 decode(pues_fpago, 'H', plaz_horas * SPUE_Sueldo, spue_sueldo)) As VNOM_SldoR,
 NOMB_SSueldo 	As VNOM_SSueldo,
 DECODE(PUES_SUEL_ALT, 'S', PLAZ_SLDO,
  DECODE(PUES_FPAGO, 'H', PLAZ_Horas * SPUE_SUELDO,
   DECODE(PUES_TPsto, 'A', (SELECT
     SPUE_Sueldo
    FROM PCPUESTOS, PSPUESTOS
    Where CPUE_Psto= QUIN_Psto
     And CPUE_Categ= QUIN_Categ
     And SPUE_Spue= CPUE_SPue),
   SPUE_SUELDO)))+NOMB_SSueldo As VNOM_Sldo,
 PLAZ_Ini     	As VNOM_PIni,
 PLAZ_Fin     	As VNOM_PFin,
 NOMB_Texto		As VNOM_Texto,
 NOMB_Ini		As VNOM_Ini,
 NVL(NOMB_FinRet, NOMB_Fin) As VNOM_Fin,
 NOMB_Susp   	As VNOM_Susp,
 NVL(NOMB_SPIUJAT,'N') As VNOM_SPIUJAT,
 NOMB_BANCO_NOM AS VNOM_BANCO_NOM,
 NOMB_BANCOD AS VNOM_BANCOD,
 NOMB_CBANC AS VNOM_CBANC,
 NOMB_DIRIGIDO AS VNOM_DIRIGIDO,
 NOMB_COPIAU AS VNOM_COPIAU,
 NOMB_COPIAD AS VNOM_COPIAD,
 NOMB_COPIAT AS VNOM_COPIAT
FROM FPERSONAS, PNOMBRAM, PPLAZAS, PPUESTOS, PCPUESTOS, PSPUESTOS, PATREMPL, PQUINDESP, FURES
Where PERS_PERSONA= NOMB_Empl
  And PLAZ_PLAZA= NOMB_Plaza
  And URES_URes = PLAZ_Ures
  And PUES_Psto= PLAZ_Psto
  And CPUE_Psto= PUES_Psto
  And CPUE_Categ= NOMB_Categ
/*(
SELECT DECODE(Count(*), 0, PUES_Categ_Defa, MAX(CATE_Categ))
From PCATEMPL
Where CATE_Empl= NOMB_Empl
 And CATE_Psto= PLAZ_Psto
)*/
 And SPUE_SPue= CPUE_SPue
 And ATRE_Empl(+)= NOMB_Empl
 And QUIN_Psto(+)= CPUE_Psto
 And NVL(QUIN_Anios, TRUNC(NVL(ATRE_Antig,0)/360))= TRUNC(NVL(ATRE_Antig,0)/360)
 AND NOMB_FIN > '01/01/2003'

------------************************---------------------------********************************-
CREATE OR REPLACE VIEW PVNOMBRAM AS
Select
 NOMB_Nomb	As VNOM_Nomb,
 DECODE(NOMB_Nomb_Reem, Null, 'T', 'R') As VNOM_Tipo,
 NOMB_Plaza	As VNOM_Plaza,
 NOMB_Nomb_Reem As VNOM_Reem,
 NOMB_Cont As VNOM_Cont,
 NOMB_Fecha As VNOM_Fecha,
 NOMB_Empl	As VNOM_Empl,
 SUBSTR(PERS_NOMBRE||' '||PERS_APEPAT||' '||PERS_APEMAT,1,45) As VNOM_Nombre,
 NOMB_Descrip	As VNOM_Descrip,
 PLAZ_URes		As VNOM_URes,
 URes_Descrip As VNOM_UResDesc,
 PLAZ_SFdo		As VNOM_SFdo,
 PLAZ_Tplaza  As VNOM_TPlaza,
 PUES_TPsto		As VNOM_TPsto,
 PLAZ_Psto		As VNOM_Psto,
 PLAZ_Docen		As VNOM_Docen,
-- DECODE(PUES_TPsto, 'A', QUIN_Categ, CPUE_Categ) As VNOM_CategR,
-- DECODE(PUES_TPsto, 'A', QUIN_Categ, CPUE_DESCRIP) As VNOM_CategRDesc,
-- DECODE(PUES_TPsto, 'A', QUIN_Categ, CPUE_Categ) As VNOM_Categ,
 CPUE_Categ As VNOM_CategR,
 CPUE_DESCRIP As VNOM_CategRDesc,
 CPUE_Categ As VNOM_Categ,
 PLAZ_Horas		As VNOM_Horas,
 DECODE(PUES_SUEL_ALT, 'S', PLAZ_SLDO,
 decode(pues_fpago, 'H', plaz_horas * SPUE_Sueldo, spue_sueldo)) As VNOM_SldoR,
 NOMB_SSueldo 	As VNOM_SSueldo,
 DECODE(PUES_SUEL_ALT, 'S', PLAZ_SLDO,
  DECODE(PUES_FPAGO, 'H', PLAZ_Horas * SPUE_SUELDO,
   DECODE(PUES_TPsto, 'A', (SELECT
     SPUE_Sueldo
    FROM PCPUESTOS, PSPUESTOS
    Where CPUE_Psto= Plaz_Psto
     And CPUE_Categ= Nomb_Categ
     And SPUE_Spue= CPUE_SPue),
   SPUE_SUELDO)))+NOMB_SSueldo As VNOM_Sldo,
 PLAZ_Ini     	As VNOM_PIni,
 PLAZ_Fin     	As VNOM_PFin,
 NOMB_Texto		As VNOM_Texto,
 NOMB_Ini		As VNOM_Ini,
 NVL(NOMB_FinRet, NOMB_Fin) As VNOM_Fin,
 NOMB_INGRESO	AS VNOM_INGRESO,
 NOMB_BAJA	AS VNOM_BAJA,
 NOMB_Susp   	As VNOM_Susp,
 NVL(DECODE(PUES_TPSTO , 'D', ATRE_SPIUJAT, 'BE',ATRE_SPIUJAT, 'BD',ATRE_SPIUJAT,
                         'JD', ATRE_SPIUJAT, 'PD', ATRE_SPIUJAT, 'N'),'N') As VNOM_SPIUJAT,
 NVL(PLAZ_PROMEP,'N') AS VNOM_PROMEP,
 NVL(PLAZ_AREA,'N') AS VNOM_AREA,
 NOMB_BANCO_NOM AS VNOM_BANCO_NOM,
 NOMB_BANCOD AS VNOM_BANCOD,
 NOMB_CBANC AS VNOM_CBANC,
 NOMB_DIRIGIDO AS VNOM_DIRIGIDO,
 NOMB_COPIAU AS VNOM_COPIAU,
 NOMB_COPIAD AS VNOM_COPIAD,
 NOMB_COPIAT AS VNOM_COPIAT
FROM FPERSONAS, PNOMBRAM, PPLAZAS, PPUESTOS, PCPUESTOS, PSPUESTOS, PATREMPL, FURES
Where PERS_PERSONA= NOMB_Empl
  And PLAZ_PLAZA= NOMB_Plaza
  And URES_URes = PLAZ_Ures
  And PUES_Psto= PLAZ_Psto
  And CPUE_Psto= PUES_Psto
  And CPUE_Categ= NOMB_Categ
/*(
SELECT DECODE(Count(*), 0, PUES_Categ_Defa, MAX(CATE_Categ))
From PCATEMPL
Where CATE_Empl= NOMB_Empl
 And CATE_Psto= PLAZ_Psto
)*/
 And SPUE_SPue= CPUE_SPue
 And ATRE_Empl(+)= NOMB_Empl ;
/* And QUIN_Psto(+)= CPUE_Psto
 And NVL(QUIN_Anios, NVL(CALCULA_ANTIG((SELECT MAX(NOMI_FECHA) FROM PNOMINAS), ATRE_FINGRESO,1),0))= NVL(CALCULA_ANTIG((SELECT MAX(NOMI_FECHA) FROM PNOMINAS), ATRE_FINGRESO,1),0)*/
-- And NVL(QUIN_Anios, TRUNC(NVL(ATRE_Antig,0)/360))= TRUNC(NVL(ATRE_Antig,0)/360)
-- AND NOMB_FIN > '01/01/2003'

