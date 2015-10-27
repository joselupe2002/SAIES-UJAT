library PvMovFueNom;


{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }



uses
  SysUtils,
  Classes,
  Modulo,
  DBTables,
  Forms,
  Dialogs,
  Windows,
  Libreria,
  EKrtf,
  shellapi,
  controls,
  StdCtrls,
  db,
  Detalle in 'Detalle.pas' {FDetalle},
  PDetalle in '..\bin\PDetalle.pas' {PFDetalle},
  recibos in 'Recibos.pas' {FRecibos},
  Orden in 'Orden.pas' {FOrden},
  Cancela in 'Cancela.pas' {FCancela};

//  PDetalle in '..\bin\PDetalle.pas' {PFDetalle};

{$R *.res}


{===============================================================================
 Convierte una cantidad a pesos
 ===============================================================================}
function pesos (val : real) : String ;
const
   unidad:array[1..15] of string=('UN','DOS','TRES','CUATRO','CINCO','SEIS','SIETE','OCHO','NUEVE','DIEZ','ONCE','DOCE','TRECE','CATORCE','QUINCE');
   decena:array[1..9] of string=('DIEZ','VEINTE','TREINTA','CUARENTA','CINCUENTA','SESENTA','SETENTA','OCHENTA','NOVENTA');
   centena:array[1..9] of string=('CIENTO','DOSCIENTOS','TRESCIENTOS','CUATROCIENTOS','QUINIENTOS','SEISCIENTOS','SETECIENTOS','OCHOCIENTOS','NOVECIENTOS');

var
     millon, miles, xresto,canti:Integer ;
     fmiles : Currency ;
     cadena,fracc,aux: String ;
//************************inicio de subfunción****************************///
function resto (cual : Integer) : String ;
var cade : String ;
    cent, dece, unid : Integer ;
begin
 cade := '' ;
{ Centenas }
 cent := StrToInt(FloatToStr(Int(cual/100))) ;
 if cent > 0 then cade := centena[cent]+ ' ' ;

 { Decenas }
 dece := StrToInt( FloatToStr( Int((cual - (cent * 100))/10) ) ) ;
 if dece > 0 then cade := cade+ decena[dece]+ ' ' ;

 { Unidades }
 unid := cual - ( (cent * 100) + (dece * 10)) ;
 if unid > 0 then
 case dece of
  1:
  begin
   cade := copy(cade, 1, length(cade) - 5) ;
   if (unid > 0) and (unid < 6) then
   cade := cade+ unidad[10+unid]
   else cade := cade+ 'DIECI'+ unidad[unid] ;
  end ;

  2:  cade := copy(cade, 1, length(cade)- 7) + 'VEINTI'+ unidad[unid] ;
 else
  begin
   if not ( (length(cade)= 0) or (dece= 0) ) then cade := cade+ 'y ' ;
   cade := cade+ unidad[unid] ;
  end ;
 end ;

 if (cent= 1) and (dece= 0) and (unid= 0) then cade := 'CIEN' ;

 result := Trim(cade) ;
end ;
//************************fin de subfunción****************************///

begin
 canti:=trunc(val);
 aux:=floattostr(val);

 if(pos('.',aux)>0)then
 begin
   fracc:=copy(aux,pos('.',aux)+1,2);
   if(length(fracc)=1) then fracc:=fracc+'0'
 end
 else fracc:='00';

 if canti > 999999999 then
 begin
  result := '***************' ;
  exit;
 end ;

 cadena := '' ;
{ Calcula Millones }
 millon := StrToInt( FloatToStr( INT(canti/1000000) ) ) ;
 if millon = 1 then cadena := resto(millon)+ ' MILLON ' ;
 if millon > 1 then cadena := resto(millon)+ ' MILLONES ' ;

{ Calcula Miles }
 fmiles := (canti - (millon * 1000000) )/1000 ;
 miles := StrToInt(FloatToStr( INT(fmiles))) ;
 if miles = 1 then cadena := resto(miles)+ ' MIL ' ;
 if miles > 1 then cadena := cadena+ resto(miles)+ ' MIL ' ;

{Calcula resto }
 xresto := canti - ( (millon * 1000000) + (miles * 1000) ) ;
 if xresto > 0 then cadena := cadena  + resto(xresto) ;

 if length(cadena) = 0 then cadena := 'CERO' ;

 if (canti mod 1000000)=0 then cadena:=cadena+' DE ';
 result := cadena+' PESOS '+fracc+'/100 M.N.';
end ;


procedure devRTF(q:TQuery;tabla:string;campoF:string;campo:string;valor:string;Extension:String);
var
   Fblob:TBlobField;
   aux:TQuery;
begin
    AUX := TQuery.Create(Application) ;
    aux.DataBaseName := 'Sistema' ;
    aux.close;
    aux.sql.text:='SELECT '+campof+' FROM '+TABLA+' WHERE '+campo+'='+#39+UPPERCASE(valor)+#39+
    ' and '+campof+' is not null';
    aux.open;
    if not(aux.eof) then
      begin
         FBlob:= aux.Fields[0] as TBlobField;
         FBlob.SaveToFile(extractfiledir(paramstr(0))+'\'+valor+'.'+extension);
      end;
   aux.close;
end;



procedure ImprimeRep(xmodulo: TFmodulo; Rep:String;Numero:string);
var
vis:string;
venci:string;
tick2:TekRTF;
Q,s, Qord:Tquery;
Subtotal, total, isr:real;
begin
  q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;
  qord := TQuery.Create(Application) ;
  qORD.DataBaseName := 'Sistema' ;
  s := TQuery.Create(Application) ;
  s.DataBaseName := 'Sistema' ;

  try devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE',COPY(REP,1,POS('.',REP)-1),'rtf'); except end;

  Tick2:=TEKrtf.create(NIL);
  Tick2.ClearVars;

  tick2.CreateVar('FECHA',formatdatetime('dd/mm/yyyy',date));
  tick2.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));
  tick2.CreateVar('NREC',Numero);

  Q.CLOSE;
  Q.sql.text:='select min(poli_polid) from fpolizas s where s.poli_descrip LIKE  '+#39+numero+'_%'+#39;
  q.open;
  tick2.CreateVar('POLIZA',Q.FIELDS[0].ASSTRING);

  q.close;
  q.sql.text:='SELECT SUM(DPAG_MONTO) FROM PVMOVFNPDPAGOSR WHERE DPAG_MOVI='+#39+NUMERO+#39+
  ' AND DPAG_PERDED='+#39+'P'+#39;
  q.OPEN;
  subtotal:=q.fields[0].asfloat;
  tick2.CreateVar('SUBTOTAL',floattostr(subtotal));

  q.close;
  q.sql.text:='SELECT SUM(DPAG_MONTO) FROM PVMOVFNPDPAGOSR  WHERE DPAG_MOVI='+#39+NUMERO+#39+
  ' AND DPAG_PERDED='+#39+'D'+#39;
  q.OPEN;
  ISR:=q.fields[0].asfloat;
  tick2.CreateVar('ISR',floattostr(ISR));

  tick2.CreateVar('TOTAL',floattostr(subtotal-ISR));
  tick2.CreateVar('IVA','0');

  Q.close;
  Q.sql.text:='SELECT * FROM PVMOVFUENOM WHERE VMOV_SEQ='+#39+Numero+#39;
  Q.open;


  s.close;
  s.sql.text:='SELECT * FROM PVMOVFNPDPAGOSR WHERE DPAG_MOVI='+#39+NUMERO+#39+
  ' ORDER BY DPAG_PERDED DESC, DPAG_CONP' ;
  s.OPEN;

  qord.close;
  qord.sql.text:='select sum(docx_total) AS MONTO from FINANZAS.afdocxpag s where s.docx_polid in '+
  '(select poln_polid from ppolnomi a where a.poln_nomina='+#39+nUMERO+#39+')';
  QORD.OPEN;
  tick2.CreateVar('TOTALO',Qord.fields[0].asstring);

  qord.close;
  qord.sql.text:='select s.docx_polid as IDORDEN, s.docx_persona AS PERSONA, '+
  't.pers_nombre||'+#39+' '+#39+'||pers_apepat||'+#39+' '+#39+'||pers_apemat AS NOMBRE, '+
  'docx_total  AS MONTO from FINANZAS.afdocxpag s, FINANZAS.fpersonas t where s.docx_polid in '+
  '(select poln_polid from ppolnomi a where a.poln_nomina='+#39+nUMERO+#39+')'+
  'and s.docx_persona=t.pers_persona ';
  QORD.OPEN;


  Tick2.InFile:=ExtractFiledir(Paramstr(0))+'\'+Rep;
  Tick2.OutFile:=ExtractFiledir(Paramstr(0))+'\R'+COPY(REP,1,POS('.',REP)-1)+'.rtf';

  Tick2.ExecuteOpen([Q,S, qord],SW_SHOW)
//  ShellExecute(xmodulo.handle, 'print', PChar(ExtractFiledir(Paramstr(0))+'\RRepFN.rtf'), nil, nil, SW_HIDE);
end;


//===========================RECIBO DE NOMINA ORDINARIA ===============================
procedure ImprimeRec(xmodulo: TFmodulo; Rep:String;Numero:string);
var
vis:string;
venci:string;
tick2:TekRTF;
QA,Q,s:Tquery;
QP, QD: tQuery;
Totper, totded:real;
categad:string;
begin
  q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;
  s := TQuery.Create(Application) ;
  s.DataBaseName := 'Sistema' ;
  qA := TQuery.Create(Application) ;
  qA.DataBaseName := 'Sistema' ;
  qp := TQuery.Create(Application) ;
  qp.DataBaseName := 'Sistema' ;
  qd := TQuery.Create(Application) ;
  qd.DataBaseName := 'Sistema' ;

  try devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','REPRECIBO','rtf'); except end;
  Tick2:=TEKrtf.create(NIL);
  Tick2.ClearVars;

  tick2.CreateVar('FECHA',formatdatetime('dd/mm/yyyy',date));
  tick2.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));

  Q.close;
  q.sql.text:='SELECT FILE_TEXTO FROM PCFILERTF WHERE FILE_CLAVE='+#39+'REPRECIBO'+#39;
  Q.open;
  if not(q.eof)  then  tick2.CreateVar('texto',q.fields[0].asstring) else  tick2.CreateVar('texto','');


  q.close;
  q.sql.text:='SELECT * FROM PVMOVFUENOM  WHERE VMOV_SEQ='+#39+NUMERO+#39;
  q.OPEN;
  tick2.CreateVar('NREC',Q.FIELDBYNAME('VMOV_SEQ').asstring);
  tick2.CreateVar('PERIODO',Q.FIELDBYNAME('VMOV_FECINI').asstring+' AL '+Q.FIELDBYNAME('VMOV_FECFIN').asstring);


  s.close;
  s.sql.text:='SELECT * FROM PVNOMBRAMALL WHERE VNOM_NOMB='+#39+q.fieldbyname('VMOV_NOMBS').asstring+#39+
  ' AND VNOM_CVE_EMPL='+#39+q.fieldbyname('VMOV_PERS').asstring+#39;
  s.OPEN;
  tick2.CreateVar('EMPLEADO',s.fieldbyname('VNOM_CVE_EMPL').asstring);
  tick2.CreateVar('EMPLEADOD',s.fieldbyname('VNOM_NOMBRE').asstring);
  tick2.CreateVar('PUESTO',s.fieldbyname('VNOM_PSTOD').asstring);
  tick2.CreateVar('CATEGORIA','"'+s.fieldbyname('VNOM_CATEGRD').asstring+'"');
  categad:='';
  IF s.fieldbyname('VNOM_VISTA').asstring='PVEVENTUAL' then
       categad:='INTERINO'
  else
  IF (s.fieldbyname('VNOM_TPSTO').asstring<>'A') then
     begin
       IF ((s.fieldbyname('VNOM_TPSTO').asstring='D')  OR (s.fieldbyname('VNOM_TPSTO').asstring='DN')) AND
          (s.fieldbyname('VNOM_TPLAZA').asstring='I') then
          categad:='INTERINO';
       IF ((s.fieldbyname('VNOM_TPSTO').asstring<>'D')  AND (s.fieldbyname('VNOM_TPSTO').asstring<>'DN')) THEN
          categad:='CONFIANZA';
     end;

  tick2.CreateVar('CATEGADD',categad);
  Qa.close;
  qa.sql.text:='SELECT  A.PERS_RFC, B.ATRE_NUMSS FROM FPERSONAS A,PATREMPL B WHERE A.PERS_PERSONA(+)=B.ATRE_EMPL AND '+
  ' PERS_PERSONA='+#39+s.fieldbyname('VNOM_CVE_EMPL').asstring+#39;
  Qa.open;
  tick2.CreateVar('RFC',QA.fieldbyname('PERS_RFC').asstring);
  tick2.CreateVar('NNS',QA.fieldbyname('ATRE_NUMSS').asstring);

  //Buscamos el Sueldo del empleado de acuerdo al nombramiento
  if (s.FieldByName('VNOM_TPSTO').asstring = 'PC') or (s.FieldByName('VNOM_TPSTO').asstring = 'PD') or
    (s.FieldByName('VNOM_TPSTO').asstring = 'JC') or (s.FieldByName('VNOM_TPSTO').asstring = 'JD') then
     begin
       Qa.close;
       qa.sql.text:='SELECT PLAZ_SLDO AS SUELDO FROM PPLAZAS S WHERE S.PLAZ_NOMB='+#39+s.fieldbyname('VNOM_NOMB').asstring+#39;
       QA.open;
     end
  else
     begin
        Qa.close;
        qa.sql.text:='SELECT VCPU_SUELDO AS SUELDO FROM PVCPUESTOS S WHERE S.VCPU_Psto='+#39+
        S.fieldbyname('VNOM_PSTO').asstring+#39+' AND S.VCPU_Categ='+#39+s.fieldbyname('VNOM_CATEGR').asstring+#39;
        Qa.open;
     end;
  tick2.CreateVar('SUELDO',Qa.fieldbyname('SUELDO').asstring);

  Qa.close;
  qa.sql.text:='SELECT SUM(DPAG_DIAS) FROM PVMOVFNPDPAGOSR  WHERE DPAG_MOVI='+#39+NUMERO+#39;
  Qa.open;
  tick2.CreateVar('DIAS',Qa.Fields[0].asstring);

  Qa.close;
  qa.sql.text:='SELECT * FROM PVMOVFNPDPAGOSR  WHERE DPAG_MOVI='+#39+NUMERO+#39;
  Qa.open;
  tick2.CreateVar('URES',Qa.fieldbyname('PAGO_URES').asstring+' '+QA.fieldbyname('PAGO_URESD').asstring);

  //Sacamos las percepciones
  qp.close;
  qp.sql.text:='SELECT * FROM PVMOVFNPDPAGOSR WHERE DPAG_MOVI='+#39+NUMERO+#39+
  ' AND DPAG_PERDED='+#39+'P'+#39+' order by dpag_conp' ;
  qp.OPEN;
  q.close;
  q.sql.text:='SELECT sum(dpag_monto) as percep FROM PVMOVFNPDPAGOSR WHERE DPAG_MOVI='+#39+NUMERO+#39+
   ' AND DPAG_PERDED='+#39+'P'+#39;
  q.OPEN;
  totPer:=Q.fieldbyname('PERCEP').asfloat;
  tick2.CreateVar('TPER',Formatfloat('#,#0.00',TOTper));


   //Sacamos las DEDUCCIONES
  qD.close;
  qD.sql.text:='SELECT * FROM PVMOVFNPDPAGOSR WHERE DPAG_MOVI='+#39+NUMERO+#39+
  ' AND DPAG_PERDED='+#39+'D'+#39+' order by dpag_conp' ;
  qd.OPEN;
  q.close;
  q.sql.text:='SELECT sum(dpag_monto) as deduc FROM PVMOVFNPDPAGOSR WHERE DPAG_MOVI='+#39+NUMERO+#39+
   ' AND DPAG_PERDED='+#39+'D'+#39;
  q.OPEN;
  totDed:=Q.fieldbyname('DEDUC').asfloat;
  tick2.CreateVar('TDED',Formatfloat('#,#0.00',TOTDED));

  tick2.CreateVar('TNET',Formatfloat('#,#0.00',TOTPER-TOTDED));

  tick2.CreateVar('LETRAS',PESOS(TOTPER-TOTDED));

  Tick2.InFile:=ExtractFiledir(Paramstr(0))+'\'+Rep;
  Tick2.OutFile:=ExtractFiledir(Paramstr(0))+'\RRepRecibo.rtf';

  Tick2.ExecuteOpen([Qp,qd],SW_SHOW)
end;


//===========================REPORTE DE JUBILADOS ===============================
procedure ImprimeRecJub(xmodulo: TFmodulo; Rep:String;Numero:string);
var
vis:string;
venci:string;
tick2:TekRTF;
QA,Q,s:Tquery;
QP, QD: tQuery;
Totper, totded:real;
categad:string;
begin
  q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;
  s := TQuery.Create(Application) ;
  s.DataBaseName := 'Sistema' ;
  qA := TQuery.Create(Application) ;
  qA.DataBaseName := 'Sistema' ;
  qp := TQuery.Create(Application) ;
  qp.DataBaseName := 'Sistema' ;
  qd := TQuery.Create(Application) ;
  qd.DataBaseName := 'Sistema' ;

  try devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','REPRECIBOJUB','rtf'); except end;
  Tick2:=TEKrtf.create(NIL);
  Tick2.ClearVars;

  tick2.CreateVar('FECHA',formatdatetime('dd/mm/yyyy',date));
  tick2.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));

  Q.close;
  q.sql.text:='SELECT FILE_TEXTO FROM PCFILERTF WHERE FILE_CLAVE='+#39+'REPRECIBOJUB'+#39;
  Q.open;
  if not(q.eof) then tick2.CreateVar('texto',q.fields[0].asstring) else  tick2.CreateVar('texto','');


  q.close;
  q.sql.text:='SELECT * FROM PVMOVFUENOM  WHERE VMOV_SEQ='+#39+NUMERO+#39;
  q.OPEN;
  tick2.CreateVar('NREC',Q.FIELDBYNAME('VMOV_SEQ').asstring);
  tick2.CreateVar('PERIODO',Q.FIELDBYNAME('VMOV_FECINI').asstring+' AL '+Q.FIELDBYNAME('VMOV_FECFIN').asstring);


  s.close;
  s.sql.text:='SELECT * FROM PVNOMBRAMALL WHERE VNOM_NOMB='+#39+q.fieldbyname('VMOV_NOMBS').asstring+#39+
  ' AND VNOM_CVE_EMPL='+#39+q.fieldbyname('VMOV_PERS').asstring+#39;
  s.OPEN;
  tick2.CreateVar('EMPLEADO',s.fieldbyname('VNOM_CVE_EMPL').asstring);
  tick2.CreateVar('EMPLEADOD',s.fieldbyname('VNOM_NOMBRE').asstring);
  Qa.close;
  qa.sql.text:='SELECT  TPUE_DESCRIP FROM PTPUESTOS A WHERE A.TPUE_TPSTO='+#39+s.fieldbyname('VNOM_TPSTO').asstring+#39;
  qa.open;

  tick2.CreateVar('PUESTO',Qa.fieldbyname('TPUE_DESCRIP').asstring);
  tick2.CreateVar('CATEGORIA','');
  categad:='';
  tick2.CreateVar('CATEGADD',categad);

  Qa.close;
  qa.sql.text:='SELECT  A.PERS_RFC, B.ATRE_NUMSS FROM FPERSONAS A,PATREMPL B WHERE A.PERS_PERSONA(+)=B.ATRE_EMPL AND '+
  ' PERS_PERSONA='+#39+s.fieldbyname('VNOM_CVE_EMPL').asstring+#39;
  Qa.open;
  tick2.CreateVar('RFC',QA.fieldbyname('PERS_RFC').asstring);
  tick2.CreateVar('NNS',QA.fieldbyname('ATRE_NUMSS').asstring);


  //Buscamos el Sueldo del empleado de acuerdo al nombramiento
  if (s.FieldByName('VNOM_TPSTO').asstring = 'PC') or (s.FieldByName('VNOM_TPSTO').asstring = 'PD') or
    (s.FieldByName('VNOM_TPSTO').asstring = 'JC') or (s.FieldByName('VNOM_TPSTO').asstring = 'JD') then
     begin
       Qa.close;
       qa.sql.text:='SELECT PLAZ_SLDO AS SUELDO FROM PPLAZAS S WHERE S.PLAZ_NOMB='+#39+s.fieldbyname('VNOM_NOMB').asstring+#39;
       QA.open;
     end
  else
     begin
        Qa.close;
        qa.sql.text:='SELECT VCPU_SUELDO AS SUELDO FROM PVCPUESTOS S WHERE S.VCPU_Psto='+#39+
        S.fieldbyname('VNOM_PSTO').asstring+#39+' AND S.VCPU_Categ='+#39+s.fieldbyname('VNOM_CATEGR').asstring+#39;
        Qa.open;
     end;
  tick2.CreateVar('SUELDO',Qa.fieldbyname('SUELDO').asstring);


  Qa.close;
  qa.sql.text:='SELECT SUM(DPAG_DIAS) FROM PVMOVFNPDPAGOSR  WHERE DPAG_MOVI='+#39+NUMERO+#39;
  Qa.open;
  tick2.CreateVar('DIAS',Qa.Fields[0].asstring);

  Qa.close;
  qa.sql.text:='SELECT * FROM PVMOVFNPDPAGOSR  WHERE DPAG_MOVI='+#39+NUMERO+#39;
  Qa.open;
  tick2.CreateVar('URES',Qa.fieldbyname('PAGO_URES').asstring+' '+QA.fieldbyname('PAGO_URESD').asstring);

  //Sacamos las percepciones
  qp.close;
  qp.sql.text:='SELECT * FROM PVMOVFNPDPAGOSR WHERE DPAG_MOVI='+#39+NUMERO+#39+
  ' AND DPAG_PERDED='+#39+'P'+#39+' order by dpag_conp' ;
  qp.OPEN;
  q.close;
  q.sql.text:='SELECT sum(dpag_monto) as percep FROM PVMOVFNPDPAGOSR WHERE DPAG_MOVI='+#39+NUMERO+#39+
   ' AND DPAG_PERDED='+#39+'P'+#39;
  q.OPEN;
  totPer:=Q.fieldbyname('PERCEP').asfloat;
  tick2.CreateVar('TPER',Formatfloat('#,#0.00',TOTper));


   //Sacamos las DEDUCCIONES
  qD.close;
  qD.sql.text:='SELECT * FROM PVMOVFNPDPAGOSR WHERE DPAG_MOVI='+#39+NUMERO+#39+
  ' AND DPAG_PERDED='+#39+'D'+#39+' order by dpag_conp' ;
  qd.OPEN;
  q.close;
  q.sql.text:='SELECT sum(dpag_monto) as deduc FROM PVMOVFNPDPAGOSR WHERE DPAG_MOVI='+#39+NUMERO+#39+
   ' AND DPAG_PERDED='+#39+'D'+#39;
  q.OPEN;
  totDed:=Q.fieldbyname('DEDUC').asfloat;
  tick2.CreateVar('TDED',Formatfloat('#,#0.00',TOTDED));

  tick2.CreateVar('TNET',Formatfloat('#,#0.00',TOTPER-TOTDED));

  tick2.CreateVar('LETRAS',PESOS(TOTPER-TOTDED));

  Tick2.InFile:=ExtractFiledir(Paramstr(0))+'\'+Rep;
  Tick2.OutFile:=ExtractFiledir(Paramstr(0))+'\RRepRecibo.rtf';

  Tick2.ExecuteOpen([Qp,qd],SW_SHOW)
end;


//===========================RECIBOS DE HONORARIOS HAS ===============================
procedure ImprimeRecHas(xmodulo: TFmodulo; Rep:String;Numero:string);
var
vis:string;
venci:string;
tick2:TekRTF;
QA,Q,s:Tquery;
QP, QD: tQuery;
Totper, totded:real;
begin
  q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;
  s := TQuery.Create(Application) ;
  s.DataBaseName := 'Sistema' ;
  qA := TQuery.Create(Application) ;
  qA.DataBaseName := 'Sistema' ;
  qp := TQuery.Create(Application) ;
  qp.DataBaseName := 'Sistema' ;
  qd := TQuery.Create(Application) ;
  qd.DataBaseName := 'Sistema' ;

  try devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','REPRECIBOHAS','rtf'); except end;
  Tick2:=TEKrtf.create(NIL);
  Tick2.ClearVars;

  tick2.CreateVar('DIAS',formatdatetime('dd',date));
  tick2.CreateVar('MES',formatdatetime('mm',date));
  tick2.CreateVar('ANIO',formatdatetime('yyyy',date));
  tick2.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));
  tick2.CreateVar('NREC',NUMERO);

  q.close;
  q.sql.text:='SELECT * FROM PVMOVFUENOM  WHERE VMOV_SEQ='+#39+NUMERO+#39;
  q.OPEN;


  s.close;
  s.sql.text:='SELECT * FROM PVNOMBRAMALL WHERE VNOM_NOMB='+#39+q.fieldbyname('VMOV_NOMBS').asstring+#39+
  ' AND VNOM_CVE_EMPL='+#39+q.fieldbyname('VMOV_PERS').asstring+#39;;
  s.OPEN;
  tick2.CreateVar('EMPLEADO',s.fieldbyname('VNOM_CVE_EMPL').asstring);
  tick2.CreateVar('EMPLEADOD',s.fieldbyname('VNOM_NOMBRE').asstring);


  //Sacamos las percepciones
  qp.close;
  qp.sql.text:='SELECT * FROM PVMOVFNPDPAGOSR WHERE DPAG_MOVI='+#39+NUMERO+#39+
  ' AND DPAG_PERDED='+#39+'P'+#39+' order by dpag_conp' ;
  qp.OPEN;
  q.close;
  q.sql.text:='SELECT sum(dpag_monto) as percep FROM PVMOVFNPDPAGOSR WHERE DPAG_MOVI='+#39+NUMERO+#39+
   ' AND DPAG_PERDED='+#39+'P'+#39;
  q.OPEN;
  totPer:=Q.fieldbyname('PERCEP').asfloat;
  tick2.CreateVar('TPER',Formatfloat('#,#0.00',TOTper));


   //Sacamos las DEDUCCIONES
  qD.close;
  qD.sql.text:='SELECT * FROM PVMOVFNPDPAGOSR WHERE DPAG_MOVI='+#39+NUMERO+#39+
  ' AND DPAG_PERDED='+#39+'D'+#39+' order by dpag_conp' ;;
  qd.OPEN;
  q.close;
  q.sql.text:='SELECT sum(dpag_monto) as deduc FROM PVMOVFNPDPAGOSR WHERE DPAG_MOVI='+#39+NUMERO+#39+
   ' AND DPAG_PERDED='+#39+'D'+#39;
  q.OPEN;
  totDed:=Q.fieldbyname('DEDUC').asfloat;
  tick2.CreateVar('TDED',Formatfloat('#,#0.00',TOTDED));

  tick2.CreateVar('TNET',Formatfloat('#,#0.00',TOTPER-TOTDED));

  tick2.CreateVar('LETRAS',PESOS(TOTPER-TOTDED));

  Tick2.InFile:=ExtractFiledir(Paramstr(0))+'\'+Rep;
  Tick2.OutFile:=ExtractFiledir(Paramstr(0))+'\RRepReciboHas.rtf';

  Tick2.ExecuteOpen([],SW_SHOW)
end;





//===========================RECIBOS DE BECAS DOCENTES===============================
procedure ImprimeRecBec(xmodulo: TFmodulo; Rep:String;Numero:string);
var
vis:string;
venci:string;
tick2:TekRTF;
QA,Q,s:Tquery;
QP, QD: tQuery;
Totper, totded:real;
categad:string;
begin
  q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;
  s := TQuery.Create(Application) ;
  s.DataBaseName := 'Sistema' ;
  qA := TQuery.Create(Application) ;
  qA.DataBaseName := 'Sistema' ;
  qp := TQuery.Create(Application) ;
  qp.DataBaseName := 'Sistema' ;
  qd := TQuery.Create(Application) ;
  qd.DataBaseName := 'Sistema' ;

  try devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','REPRECIBOBEC','rtf'); except end;
  Tick2:=TEKrtf.create(NIL);
  Tick2.ClearVars;

  tick2.CreateVar('DIAS',formatdatetime('dd',date));
  tick2.CreateVar('MES',formatdatetime('MM',date));
  tick2.CreateVar('ANIO',formatdatetime('yyyy',date));
  tick2.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));
  tick2.CreateVar('NREC',NUMERO);

  q.close;
  q.sql.text:='SELECT * FROM PVMOVFUENOM  WHERE VMOV_SEQ='+#39+NUMERO+#39;
  q.OPEN;
  tick2.CreateVar('PERIODO',Q.fieldbyname('VMOV_TEXTO').asstring);
  tick2.CreateVar('MESDE',uppercase(formatdatetIME('MMMM " DEL " YYYY',Q.fieldbyname('VMOV_FECINI').asdatetime)));

  S.close;
  s.sql.text:='SELECT MAX(BECA_NIVEL) AS BECA_NIVEL FROM PBECAEMPL S WHERE S.BECA_EMPL='+#39+q.fieldbyname('VMOV_PERS').asstring+#39+
  ' AND SYSDATE BETWEEN BECA_FECINI AND BECA_FECFIN';
  S.open;
  tick2.CreateVar('NIVEL',s.fieldbyname('BECA_NIVEL').asstring);

  s.close;
  s.sql.text:='SELECT * FROM PVNOMBRAMALL WHERE VNOM_NOMB='+#39+q.fieldbyname('VMOV_NOMBS').asstring+#39+
  ' AND VNOM_CVE_EMPL='+#39+q.fieldbyname('VMOV_PERS').asstring+#39;;
  s.OPEN;
  tick2.CreateVar('EMPLEADO',s.fieldbyname('VNOM_CVE_EMPL').asstring);
  tick2.CreateVar('EMPLEADOD',s.fieldbyname('VNOM_NOMBRE').asstring);
  tick2.CreateVar('PUESTO',s.fieldbyname('VNOM_PSTOD').asstring);
  tick2.CreateVar('CATEGORIA','"'+s.fieldbyname('VNOM_CATEGRD').asstring+'"');
  categad:='';

  Qa.close;
  qa.sql.text:='SELECT * FROM PVMOVFNPDPAGOSR  WHERE DPAG_MOVI='+#39+NUMERO+#39;
  Qa.open;
  tick2.CreateVar('URES',Qa.fieldbyname('PAGO_URES').asstring+' '+QA.fieldbyname('PAGO_URESD').asstring);


  IF s.fieldbyname('VNOM_VISTA').asstring='PVEVENTUAL' then
       categad:='INTERINO';
  IF (s.fieldbyname('VNOM_TPSTO').asstring<>'A') then
     begin
       IF ((s.fieldbyname('VNOM_TPSTO').asstring='D')  OR (s.fieldbyname('VNOM_TPSTO').asstring='DN')) AND
          (s.fieldbyname('VNOM_TPLAZA').asstring='I') then
          categad:='INTERINO';
       IF ((s.fieldbyname('VNOM_TPSTO').asstring<>'D')  AND (s.fieldbyname('VNOM_TPSTO').asstring<>'DN')) THEN
          categad:='CONFIANZA';
     end;

  tick2.CreateVar('CATEGADD',categad);




  q.close;
  q.sql.text:='SELECT sum(dpag_monto) as percep FROM PVMOVFNPDPAGOSR WHERE DPAG_MOVI='+#39+NUMERO+#39+
   ' AND DPAG_PERDED='+#39+'P'+#39;
  q.OPEN;
  totPer:=Q.fieldbyname('PERCEP').asfloat;
  tick2.CreateVar('TPER',Formatfloat('#,#0.00',TOTper));


   //Sacamos las DEDUCCIONES
  qd.close;
  qd.sql.text:='SELECT * FROM PVMOVFNPDPAGOSR WHERE DPAG_MOVI IN '+
  '(SELECT B.VMOV_SEQ FROM PVMOVFUENOM B WHERE B.VMOV_PADRE='+#39+NUMERO+#39+')'+
  ' AND DPAG_CONP='+#39+'061'+#39+' order by dpag_conp' ;
  qd.OPEN;

  q.close;
  q.sql.text:='SELECT sum(dpag_monto) as deduc FROM PVMOVFNPDPAGOSR WHERE DPAG_MOVI='+#39+NUMERO+#39+
   ' AND DPAG_PERDED='+#39+'D'+#39;
  q.OPEN;
  totDed:=Q.fieldbyname('DEDUC').asfloat;
  tick2.CreateVar('TDED',Formatfloat('#,#0.00',TOTDED));

  tick2.CreateVar('TNET',Formatfloat('#,#0.00',TOTPER-TOTDED));

  tick2.CreateVar('LETRAS',PESOS(TOTPER-TOTDED));

  Tick2.InFile:=ExtractFiledir(Paramstr(0))+'\'+Rep;
  Tick2.OutFile:=ExtractFiledir(Paramstr(0))+'\RRepReciboBec.rtf';

  Tick2.ExecuteOpen([QD],SW_SHOW)
end;



//===========================RECIBOS Para los descuentos Judiciales ===============================
procedure ImprimeRecDJ(xmodulo: TFmodulo; Rep:String;Numero:string; INDEX:integer; tercero:string; MoviTer:string);
var
vis:string;
venci:string;
tick2:TekRTF;
QA,Q,s:Tquery;
QP, QD: tQuery;
Totper, totded:real;
begin
  q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;
  s := TQuery.Create(Application) ;
  s.DataBaseName := 'Sistema' ;
  qA := TQuery.Create(Application) ;
  qA.DataBaseName := 'Sistema' ;
  qp := TQuery.Create(Application) ;
  qp.DataBaseName := 'Sistema' ;
  qd := TQuery.Create(Application) ;
  qd.DataBaseName := 'Sistema' ;


  try devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','REPRECIBODJ','rtf'); except end;
  Tick2:=TEKrtf.create(NIL);
  Tick2.ClearVars;

  tick2.CreateVar('DIAS',formatdatetime('dd',date));
  tick2.CreateVar('MES',UPPERCASE(formatdatetime('mmmm',date)));
  tick2.CreateVar('ANIO',formatdatetime('yyyy',date));
  tick2.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));

  q.close;
  q.sql.text:='SELECT * FROM PVMOVFUENOM  WHERE VMOV_SEQ='+#39+NUMERO+#39;
  q.OPEN;
  tick2.CreateVar('PERIODO',uppercase(FORMATDATETIME('DD "de" MMMM "del" YYYY',q.fieldbyname('VMOV_FECINI').asdatetime)+
                             ' AL ' +
                            FORMATDATETIME('DD "de" MMMM "del" YYYY',q.fieldbyname('VMOV_FECFIN').asdatetime)));

  tick2.CreateVar('DESCSUELDO','HONORARIOS PROFESIONALES');
  tick2.CreateVar('NREC',NUMERO);

  s.close;
  s.sql.text:='SELECT * FROM PVNOMBRAMALL WHERE VNOM_NOMB='+#39+q.fieldbyname('VMOV_NOMBS').asstring+#39+
  ' AND VNOM_CVE_EMPL='+#39+q.fieldbyname('VMOV_PERS').asstring+#39;;
  s.OPEN;
  tick2.CreateVar('EMPLEADO',s.fieldbyname('VNOM_CVE_EMPL').asstring);
  tick2.CreateVar('EMPLEADOD',s.fieldbyname('VNOM_NOMBRE').asstring);
  tick2.CreateVar('PUESTOD',s.fieldbyname('VNOM_PSTOD').asstring+' "'+s.fieldbyname('VNOM_CATEGR').asstring+'"');
  tick2.CreateVar('URESD',s.fieldbyname('VNOM_URES').asstring);


  //DATOS DEL TERCERO
  s.close;
  S.sql.text:='SELECT * FROM FPERSONAS S WHERE PERS_PERSONA='+#39+TERCERO+#39;
  S.open;
  tick2.CreateVar('ACREEDOR',tercero);
  tick2.CreateVar('ACREEDORD',s.fieldbyname('PERS_NOMBRE').asstring+ ' '+
                               s.fieldbyname('PERS_APEPAT').asstring+ ' '+
                               s.fieldbyname('PERS_APEMAT').asstring);


  //Sacamos las percepciones
  qp.close;
  qp.sql.text:='select SUM(A.dpag_monto) as monto from PVMOVFNPDPAGOSR A WHERE '+
  'A.dpag_movi='+#39+moviTer+#39+' AND A.PAGO_EMPL='+#39+TERCERO+#39+
  ' AND A.DPAG_CONP='+#39+'061'+#39;
  qp.OPEN;

  tick2.CreateVar('TPER',Formatfloat('#,#0.00',QP.fieldbyname('monto').asfloat));
  tick2.CreateVar('LETRAS',pesos(QP.fieldbyname('monto').asfloat));

  Tick2.InFile:=ExtractFiledir(Paramstr(0))+'\'+Rep;
  Tick2.OutFile:=ExtractFiledir(Paramstr(0))+'\RRepReciboDJ'+INTTOSTR(INDEX)+'.rtf';

  Tick2.ExecuteOpen([],SW_SHOW)
end;


procedure Borra(xmodulo: TFmodulo) ;
var BQuery : TQuery ;
begin

 xmodulo.LMensaje := False ;
 BQuery := TQuery.Create(Application) ;
 BQuery.DataBaseName := 'Sistema' ;
 BQuery.Sql.Add ('Delete From PMOVFUENOM Where MOVF_Seq= '+
 xmodulo.Query1.FieldByName('VMOV_Seq').AsString );

 if xmodulo.Query1.FieldByName('VMOV_AUTORIZADO').AsString ='N' then
    begin
       try
        BQuery.ExecSql ;
        BQUERY.Close;
        BQUERY.SQl.text:='DELETE FROM PMOVFUENOM WHERE MOVF_PADRE='+
        #39+xmodulo.Query1.FieldByName('VMOV_Seq').AsString+#39;
        BQUERY.Execsql;
        xModulo.Refrescar1Click(NIL);
        BQuery.Free ;
       except
        on E: Exception do
        begin
         BQuery.Free ;
         OraErr(E) ;
        end ;
       end ;
    end
 else
    showmessage('No se pueden borrar los Pagos Fuera de Nomina que ya se han autorizado');
end ;



function Detalle(xmodulo: TFmodulo) : TForm;
begin
 result :=  nil ;
 case xmodulo.modo of
  2: begin
         if xmodulo.Query1.FieldByName('VMOV_AUTORIZADO').AsString ='N' THEN
             result:= TFDetalle.Create(xmodulo)
         else
             begin
               xmodulo.LMensaje := False ;
               showmessage('No se puede modificar los pagos Fuera de Nomina Autorizados');
             end;
     end;
  1:  result:= TFDetalle.Create(xmodulo) ;
  3:  result:= TFDetalle.Create(xmodulo) ;
  4 : if Application.MessageBox('Borrar Pago Fuera de Nomina','Confirmar',
         MB_ICONQUESTION+ MB_YESNO)= IDNO
      then Xmodulo.LMensaje := False
      else Borra(XModulo) ;
 end ;
end;






function Autorizar(xmodulo: TFmodulo) : TForm;
var
q:Tquery;
aux:Tquery;
begin
 if xmodulo.Query1.FieldByName('VMOV_AUTORIZADO').AsString ='N' then
    begin
       if (Application.MessageBox('Seguro que desea Autorizar el Pago Fuera de Nomina', 'Confirmar', MB_ICONQUESTION+ MB_YESNO)= IDYES) then
          begin
               q := TQuery.Create(Application) ;
               q.DataBaseName := 'Sistema' ;
               q.close;
               q.sql.text:='SELECT VALPAGFUENOM('+#39+xmodulo.Query1.FieldByName('VMOV_Seq').AsString+#39+') FROM DUAL';
               Q.OPEN;
               if q.Fields[0].asstring<>'TRUE' then
                  begin
                     Showmessage(q.fields[0].asstring);
                     exit
                  end
               else
                  begin
                     q.close;
                     q.sql.text:='UPDATE PMOVFUENOM SET MOVF_AUTORIZADO='+#39+'S'+#39+
                     ' Where MOVF_Seq= '+xmodulo.Query1.FieldByName('VMOV_Seq').AsString;
                     Q.ExecSQL;

                     aux := TQuery.Create(Application) ;
                     aux.DataBaseName := 'Sistema' ;
                     aux.SQL.TEXT:='SELECT * FROM PMOVFUENOM WHERE MOVF_PADRE='+#39+xmodulo.Query1.FieldByName('VMOV_Seq').AsString+#39;
                     AUX.OPEN;

                     while not(aux.eof) do
                        begin

                           q.close;
                           q.sql.text:='UPDATE PMOVFUENOM SET MOVF_AUTORIZADO='+#39+'S'+#39+
                           ' Where MOVF_Seq= '+AUX.FieldByName('MOVF_SEQ').AsString;
                           Q.ExecSQL;

                           aux.next;
                        end;
                    xModulo.Refrescar1Click(NIL);
                  end;
          end;
    end
 else
    if (Application.MessageBox('El pago fuera de Nomina ya esta Autorizado ¿Desea regresar el Movimiento a NO AUTORIZADO?', 'Confirmar', MB_ICONQUESTION+ MB_YESNO)= IDYES) then
        begin
                     q := TQuery.Create(Application) ;
                     q.DataBaseName := 'Sistema' ;
                     aux := TQuery.Create(Application) ;
                     aux.DataBaseName := 'Sistema' ;
                     
                     q.close;
                     q.sql.text:='UPDATE PMOVFUENOM SET MOVF_AUTORIZADO='+#39+'N'+#39+
                     ' Where MOVF_Seq= '+xmodulo.Query1.FieldByName('VMOV_Seq').AsString;
                     Q.ExecSQL;


                     aux := TQuery.Create(Application) ;
                     aux.DataBaseName := 'Sistema' ;
                     aux.SQL.TEXT:='SELECT * FROM PMOVFUENOM WHERE MOVF_PADRE='+#39+xmodulo.Query1.FieldByName('VMOV_Seq').AsString+#39;
                     AUX.OPEN;

                     while not(aux.eof) do
                        begin

                           q.close;
                           q.sql.text:='UPDATE PMOVFUENOM SET MOVF_AUTORIZADO='+#39+'N'+#39+
                           ' Where MOVF_Seq= '+AUX.FieldByName('MOVF_SEQ').AsString;
                           Q.ExecSQL;

                           aux.next;
                        end;
                    xModulo.Refrescar1Click(NIL);
        end;
end;


function Contab(xmodulo: TFmodulo) : TForm;
var
q:Tquery;
AUX:TQUERY;
begin
 if (xmodulo.Query1.FieldByName('VMOV_AUTORIZADO').AsString ='S') AND
    (xmodulo.Query1.FieldByName('VMOV_CONTABILIZADO').AsString ='N') and
    (xmodulo.Query1.FieldByName('VMOV_PADRE').AsString ='0') then
    begin
        if (Application.MessageBox('Seguro que desea Contabilizar el Pago Fuera de Nomina', 'Confirmar', MB_ICONQUESTION+ MB_YESNO)= IDYES) then
           begin
              q := TQuery.Create(Application) ;
              q.DataBaseName := 'Sistema' ;
              q.close;
              q.sql.text:='UPDATE PMOVFUENOM SET MOVF_CONTABILIZADO='+#39+'S'+#39+
                          ' Where MOVF_Seq= '+xmodulo.Query1.FieldByName('VMOV_Seq').AsString;
              Q.ExecSQL;

              aux := TQuery.Create(Application) ;
              aux.DataBaseName := 'Sistema' ;
              aux.SQL.TEXT:='SELECT * FROM PMOVFUENOM WHERE MOVF_PADRE='+#39+xmodulo.Query1.FieldByName('VMOV_Seq').AsString+#39;
              AUX.OPEN;

              while not(aux.eof) do
                  begin
                     q.close;
                     q.sql.text:='UPDATE PMOVFUENOM SET MOVF_CONTABILIZADO='+#39+'S'+#39+
                     ' Where MOVF_Seq= '+AUX.FieldByName('MOVF_SEQ').AsString;
                     Q.ExecSQL;
                     aux.next;
                  end;
              xModulo.Refrescar1Click(NIL);
           end;
    end
 else
        begin
             showmessage('El pago fuera de Nomina No se encuentra autorizado o ya fue contabilizado o este pago depende de otro');
        end;
end;


function impRep(xmodulo: TFmodulo) : TForm;
var
q:Tquery;
begin
  if (xmodulo.Query1.FieldByName('VMOV_AUTORIZADO').AsString ='S')  then
        imprimeReP(xmodulo,xmodulo.Query1.FieldByName('VMOV_TIPOREP').AsString+'.rtf',xmodulo.Query1.FieldByName('VMOV_SEQ').AsString)
  else
        showmessage('Solo se puede imprimir Reporte para Pagos Fuera de Nomina Autorizados');
end;


function impRepDet(xmodulo: TFmodulo) : TForm;
var
q:Tquery;
begin
         result :=  nil ;
         result:= TFRecibos.Create(xmodulo) ;

end;


function verOrden(xmodulo: TFmodulo) : TForm;
var
q:Tquery;
begin
         result :=  nil ;
         result:= TFOrden.Create(xmodulo) ;
         (RESULT.FindComponent('MOV') AS TEdit).text:=xmodulo.Query1.FieldByName('VMOV_Seq').AsString;
         (RESULT.FindComponent('FECHA') AS TEdit).text:=xmodulo.Query1.FieldByName('VMOV_FechaMov').AsString;
end;


function cancelPago(xmodulo: TFmodulo) : TForm;
var
q:Tquery;
begin
if (xmodulo.Query1.FieldByName('VMOV_CONTABILIZADO').AsString ='S') AND
    (xmodulo.Query1.FieldByName('VMOV_DEVENGADO').AsString ='S') and
    (xmodulo.Query1.FieldByName('VMOV_PADRE').AsString ='0') then
    begin
         if (xmodulo.Query1.FieldByName('VMOV_CANCEL').AsString ='N') THEN
            begin
               result :=  nil ;
               result:= TFCancela.Create(xmodulo) ;
               (RESULT.FindComponent('MOV') AS TEdit).text:=xmodulo.Query1.FieldByName('VMOV_Seq').AsString;
               (RESULT.FindComponent('PROYECTO') AS TEdit).text:=xmodulo.Query1.FieldByName('VMOV_PROYFN').AsString;
               (RESULT.FindComponent('FECHA') AS TEdit).text:=DATETOSTR(DATE);
               (RESULT.FindComponent('FECHAPAGO') AS TEdit).text:=xmodulo.Query1.FieldByName('VMOV_FechaMov').AsString;
                (RESULT.FindComponent('TRANS') AS TEdit).text:=xmodulo.Query1.FieldByName('VMOV_TRANSFER').AsString;
            end
         else
           Showmessage('El pago fuera de nomina ya se encuentra cancelado');
    end
else
   showmessage('Solo se puede Cancelar pagos que esten contabilizados totalmente');
end;


function Devengar(xmodulo: TFmodulo) : TForm;
var
q:Tquery;
AUX:TQUERY;
begin

 if (xmodulo.Query1.FieldByName('VMOV_CONTABILIZADO').AsString ='S') AND
    (xmodulo.Query1.FieldByName('VMOV_DEVENGADO').AsString ='N') and
    (xmodulo.Query1.FieldByName('VMOV_PADRE').AsString ='0')
      then
    begin
        if (Application.MessageBox('Seguro que desea Devengar el Pago Fuera de Nomina', 'Confirmar', MB_ICONQUESTION+ MB_YESNO)= IDYES) then
           begin
              Q := TQuery.Create(Application) ;
              q.DataBaseName := 'Sistema' ;
              q.close;
              q.sql.text:='UPDATE PMOVFUENOM SET MOVF_DEVENGADO='+#39+'S'+#39+
                          ' Where MOVF_Seq= '+xmodulo.Query1.FieldByName('VMOV_Seq').AsString;
              Q.ExecSQL;
              aux := TQuery.Create(Application) ;
              aux.DataBaseName := 'Sistema' ;
              aux.SQL.TEXT:='SELECT * FROM PMOVFUENOM WHERE MOVF_PADRE='+#39+xmodulo.Query1.FieldByName('VMOV_Seq').AsString+#39;
              AUX.OPEN;

              while not(aux.eof) do
                  begin
                     q.close;
                     q.sql.text:='UPDATE PMOVFUENOM SET MOVF_DEVENGADO='+#39+'S'+#39+
                     ' Where MOVF_Seq= '+AUX.FieldByName('MOVF_SEQ').AsString;
                     Q.ExecSQL;
                     aux.next;
                  end;
              xModulo.Refrescar1Click(NIL);
           end;
    end
else
        begin
             showmessage('El pago fuera de Nomina No se encuentra Contabilizado o ya fue Devengado o este pago depende de otro');
        end;
end;


function impRec(xmodulo : TFModulo) : TForm ;
VAR
qdj:tquery;
q:tquery;
X:INTEGER;
begin
qdj := TQuery.Create(Application) ;
qdj.DataBaseName := 'Sistema' ;

q := TQuery.Create(Application) ;
q.DataBaseName := 'Sistema' ;

 if (xmodulo.Query1.FieldByName('VMOV_AUTORIZADO').AsString ='S')  then
    begin
         Q.close;
         q.sql.text:='SELECT COUNT(*) FROM PVMOVFNPDPAGOSR S WHERE S.dpag_conp='+
         #39+'035'+#39+' AND DPAG_MOVI='+#39+xmodulo.Query1.FieldByName('VMOV_SEQ').AsString+#39;
         Q.open;

         if q.fields[0].asinteger>0 then   //Para recibo de Becas Docentes
            begin
               imprimeRecBec(xmodulo,'RepReciboBec.rtf',xmodulo.Query1.FieldByName('VMOV_SEQ').AsString)
            end
         else
            begin  //Se imprimen los otros recibos
                 if (xmodulo.Query1.FieldByName('VMOV_TIPONOM').AsString ='E') OR
                    (xmodulo.Query1.FieldByName('VMOV_TIPONOM').AsString ='N')  THEN
                     imprimeRec(xmodulo,'RepRecibo.rtf',xmodulo.Query1.FieldByName('VMOV_SEQ').AsString);

                 IF   (xmodulo.Query1.FieldByName('VMOV_TIPONOM').AsString ='O') THEN
                     begin

                        Q.close;
                        q.sql.text:='SELECT COUNT(*) FROM PMOVRELPSTO WHERE MOVR_TPSTO='+#39+
                        xmodulo.Query1.FieldByName('VMOV_TIPOPSTO').AsString+#39+
                        ' AND MOVR_TIPO='+#39+'JUBILADO'+#39;
                        Q.open;
                        if q.fields[0].asinteger>0 then //Es un jubilado
                          imprimeRecJub(xmodulo,'RepReciboJub.rtf',xmodulo.Query1.FieldByName('VMOV_SEQ').AsString)
                        else
                           imprimeRec(xmodulo,'RepRecibo.rtf',xmodulo.Query1.FieldByName('VMOV_SEQ').AsString);
                     end;


                 if (xmodulo.Query1.FieldByName('VMOV_TIPONOM').AsString ='H') then
                    imprimeRecHas(xmodulo,'RepReciboHas.rtf',xmodulo.Query1.FieldByName('VMOV_SEQ').AsString);
            end;
         qdj.close;
         qdj.sql.text:='SELECT * FROM PVMOVFNPDPAGOSR S WHERE S.DPAG_CONP='+#39+'061'+#39+' AND S.PAGO_PAGO IN '+
         '(SELECT PAGO_PAGO FROM PMOVFNPPAGOSR S WHERE S.PAGO_NOMINA='+
         #39+xmodulo.Query1.FieldByName('VMOV_SEQ').AsString+#39+' AND S.PAGO_EMPL<>'+
         #39+xmodulo.Query1.FieldByName('VMOV_PERS').AsString+#39+')';
         qdj.open;
         x:=1;
         WHILE not(qdj.eof) do
             begin
                imprimeRecDJ(xmodulo,'RepReciboDJ.rtf',xmodulo.Query1.FieldByName('VMOV_SEQ').AsString,x,
                qdj.fieldbyname('PAGO_EMPL').asstring,qdj.fieldbyname('DPAG_MOVI').asstring );
                qdj.next;
                x:=x+1;
             end;
    end
 else
    showmessage('Solo se puede imprimir Recibo de Pagos Fuera de Nomina Autorizados');
end;


exports Detalle, Autorizar,Contab, devengar, impRep, impRec, impRepDet, verOrden, cancelPago ;
begin
//
end.
