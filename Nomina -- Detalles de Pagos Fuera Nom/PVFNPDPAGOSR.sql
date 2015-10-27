CREATE OR REPLACE VIEW PVFNPDPAGOSR AS
SELECT
/*===================================================================================================
Usada en el menu Personal -- Nominas - Detalle Pago Fuera Nomina
===================================================================================================*/
A.PAGO_PAGO,
A.PAGO_EMPL,
g.pers_nombre||' '||g.pers_apepat||' '||g.pers_apemat as PAGO_EMPLD,
A.PAGO_URES,
C.URES_DESCRIP AS PAGO_URESD,
A.PAGO_PROG,
A.PAGO_SFDO,
dpag_dpago,
dpag_pago,
dpag_dias,
dpag_fdias,
dpag_perded,
dpag_conp,
dpag_descrip,
dpag_monto,
dpag_movi,
dpag_grupo,
dpag_cnta,
dpag_scta,
dpag_signo,
dpag_nomcred,
dpag_cdpago,
dpag_proy,
f.movf_proyfn as dpag_proyfn,
DPAG_META, 
f.movf_cancel as dpag_cancel,
F.MOVF_TIPONOM AS TipoNom,
f.movf_tipo as tipo, 
f.movf_fechamov as fechamov,
f.movf_autorizado as autorizado, 
f.movf_contabilizado as devengado, 
f.movf_devengado as ejercido
FROM  PMOVFNPDPAGOSR B, PMOVFNPPAGOSR A, FURES C, pmovfuenom f, fpersonas g
WHERE B.DPAG_PAGO=A.PAGO_PAGO
AND A.PAGO_URES=C.URES_URES
and a.pago_nomina=f.movf_seq
and a.pago_empl=g.pers_persona
order by a.pago_pago;

create public synonym PVFNPDPAGOSR for PVFNPDPAGOSR;
grant all on PVFNPDPAGOSR to goshake;


comment on column PVFNPDPAGOSR.PAGO_PAGO is 'Pago
Número de pago
00
*S
*t
10';

comment on column PVFNPDPAGOSR.PAGO_EMPL is 'Empl
Número de empleado
01
*S
*t
10';


comment on column PVFNPDPAGOSR.PAGO_EMPLD is 'Nombre
Nombre del empleado
02
*S
*t
30';


comment on column PVFNPDPAGOSR.PAGO_URES is 'URES
Unidad Responsable
04
*S
*t
10';


comment on column PVFNPDPAGOSR.PAGO_PROG is 'Prog
Programa 
05
*S
*t
10';


comment on column PVFNPDPAGOSR.PAGO_SFDO is 'Sfdo
Subfondo
06
*S
*t
10';


comment on column PVFNPDPAGOSR.dpag_perded is 'Tipo
P=Percepción D= Deducción
07
*S
*t
10';

comment on column PVFNPDPAGOSR.dpag_conp is 'Conp
Clave del concepto de pago
08
*S
*t
10';

comment on column PVFNPDPAGOSR.dpag_descrip is 'Descripcion
Descripción del concepto de pago
09
*S
*t
30';

comment on column PVFNPDPAGOSR.dpag_monto is 'Monto
Monto del Concepto de pago
10
*S
*T
10';

comment on column PVFNPDPAGOSR.dpag_cnta is 'Cnta
Cuenta contable
11
*S
*t
10';


comment on column PVFNPDPAGOSR.dpag_cnta is 'Scta
COG
12
*S
*t
10';

comment on column PVFNPDPAGOSR.dpag_proyfn is 'Proyecto_FN
Proyecto al que se encuentra cargado
13
*S
*t
10';

comment on column PVFNPDPAGOSR.dpag_proy is 'Proyecto
Proyecto al que se encuentra cargado
14
*S
*t
10';

comment on column PVFNPDPAGOSR.tipoNom is 'TipoNom
Tipo de la Nómina
15
*S
*t
10';

comment on column PVFNPDPAGOSR.tipo is 'Tipo
Tipo de pago
17
*S
*t
10';

comment on column PVFNPDPAGOSR.FechaMov is 'Fecha_Mov
Fecha para la cual aplica el pago fuera de nómina
19
*S
*t
10';


comment on column PVFNPDPAGOSR.Devengado is 'Devengado
S o N
21
*S
*t
10';

comment on column PVFNPDPAGOSR.Ejercido is 'Ejercido
S o N
23
*S
*t
10';

comment on column PVFNPDPAGOSR.dpag_cancel is 'Cancelado
S=Pago esta cancelado N=El pago esta activo
25
*S
*t
10';
