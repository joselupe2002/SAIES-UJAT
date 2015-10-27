comment on column PTRANREPORT.tran_nombre
  is 'Nombre_Reporte
Nombre del reporte que se esta configurando
10
*S
*T
30';
comment on column PTRANREPORT.tran_banco
  is 'Banco
Clave del banco al que pertenece el reporte
20
*S
*T
10';
comment on column PTRANREPORT.tran_uresp
  is 'Ures_P
Clave de la(s) URES de pagos que se tomarán en cuenta para el reporte
30
*S
*T
60';

comment on column PTRANREPORT.TRAN_SFDO
  is 'SFDO
Subfondo para el cual se aplicará el reporte
40
*S
*T
10';

comment on column PTRANREPORT.TRAN_TEMPL
  is 'TEMPL
Tipo de empleado del que se tomara D = ESDEPED S = Sinodales, etc.
50
*S
*T
10';

comment on column PTRANREPORT.tran_tpsto
  is 'Tipo_Psto
Clave(s) de los tipos de puestos que se tomarán en cuenta para el reporte
51
*S
*T
30';
comment on column PTRANREPORT.tran_empl
  is 'Empl
Clave(s) de empleados que se tomán en cuenta para el reporte.
52
*S
*T
15';
comment on column PTRANREPORT.tran_grupo
  is 'Grupo
Nombre del grupo al que pertenece el reporte para realizar los archivos de transferencias
55
*S
*T
30';
comment on column PTRANREPORT.tran_user
  is 'Usuario
Clave de usuario que generó el registro
57
*S
*T
10';
comment on column PTRANREPORT.tran_fecha
  is 'Fecha
Fecha en la que se generó el registro
59
*S
*T
10';
comment on column PTRANREPORT.tran_tiponom
  is 'TipoNom
O=Ordinaria C=Eventuales H=Honorarios N=Nueva Genración 
53
*S
*T
10';
comment on column PTRANREPORT.tran_esdeped
  is 'ESDEPED
S=Reporte de ESDEPD N=Reporte de transferencia
60
*S
*T
10';
comment on column PTRANREPORT.tran_cheque
  is 'CHEQUE
S=Reporte que saca los que no tienen cuenta N=Reporte de Transferencia
70
*S
*T
10';

