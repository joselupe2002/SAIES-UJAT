library PVNOMIORDPAG;

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
  Sharemem,
  SysUtils,
  Forms,
  Dialogs,
  Windows,
  Classes,
  DBTables,
  Modulo,
  libreria,
  clipbrd,
  ekrtf,
  db,
  PDetalle in '..\bin\PDetalle.pas' {PFDetalle},
  Detalle in 'Detalle.pas' {FDetalle};

{$R *.RES}


function Detalle(xmodulo : TFModulo) : TForm ;
begin
 result := nil ;
end ;


procedure ImprimeRep(xmodulo: TFmodulo; Rep:String;Numero:string);
var
vis:string;
venci:string;
tick2:TekRTF;
Q,s, Qord:Tquery;
Subtotal, total, isr:real;
npoliza:string;
TPPOLNOMI:string;
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

  if  xmodulo.Query1.FieldByName('VNOM_TIPONOM').AsString='O' then
      TPPOLNOMI:='PPOLNOMI';
  if  xmodulo.Query1.FieldByName('VNOM_TIPONOM').AsString='H' then
      TPPOLNOMI:='PHPOLNOMI';
  if  xmodulo.Query1.FieldByName('VNOM_TIPONOM').AsString='V' then
      TPPOLNOMI:='PIPOLNOMI';
  if  xmodulo.Query1.FieldByName('VNOM_TIPONOM').AsString='N' then
      TPPOLNOMI:='PNPOLNOMI';


  Q.close;
  q.sql.text:='select MIN(A.POLN_POLID) FROM '+TPPOLNOMI+' A WHERE A.POLN_NOMINA='+#39+NUMERO+#39;
  Q.OPEN;
  npoliza:= Q.FIELDS[0].ASSTRING;
  tick2.CreateVar('POLIZA',Q.FIELDS[0].ASSTRING);

  q.close;
  q.sql.text:='SELECT SUM(DETM_MONTO) FROM FDETMOVI A WHERE A.DETM_POLID='+NPOLIZA+
  ' AND  DETM_CNTA NOT LIKE '+#39+'8%'+#39+' AND DETM_CNTA LIKE '+#39+'5%'+#39;
  q.OPEN;
  subtotal:=q.fields[0].asfloat;
  tick2.CreateVar('SUBTOTAL',floattostr(subtotal));

  q.close;
  q.sql.text:='SELECT SUM(DETM_MONTO)  FROM FDETMOVI A WHERE A.DETM_POLID='+NPOLIZA+
  ' AND  DETM_CNTA NOT LIKE '+#39+'8%'+#39+
  ' AND (DETM_CNTA LIKE '+#39+'2117%'+#39 +' OR DETM_CNTA LIKE '+#39+'112%'+#39+')';
  savetofilelog(q.sql.text);
  q.OPEN;
  ISR:=q.fields[0].asfloat;
  tick2.CreateVar('ISR',floattostr(ISR));

  tick2.CreateVar('TOTAL',floattostr(subtotal-ISR));
  tick2.CreateVar('IVA','0');

  Q.close;
  Q.sql.text:='SELECT * FROM pvnomiordpag WHERE vnom_nomina='+#39+numero+#39;
  Q.open;


  s.close;
  s.sql.text:='select * from pvfdetmovinomi s where s.polid='+
  npoliza+' and s.CNTA not like '+#39+'8%'+#39+' and s.CNTA like '+#39+'5%'+#39 ;
  s.OPEN;

  Tick2.InFile:=ExtractFiledir(Paramstr(0))+'\'+Rep;
  Tick2.OutFile:=ExtractFiledir(Paramstr(0))+'\R'+COPY(REP,1,POS('.',REP)-1)+'.rtf';

  Tick2.ExecuteOpen([Q,S],SW_SHOW)
//  ShellExecute(xmodulo.handle, 'print', PChar(ExtractFiledir(Paramstr(0))+'\RRepFN.rtf'), nil, nil, SW_HIDE);
end;


function repOrdPago(xmodulo: TFmodulo) : TForm;
var
q:Tquery;
begin
        imprimeReP(xmodulo,'ORDPAGNOM.rtf',xmodulo.Query1.FieldByName('VNOM_NOMINA').AsString)
end;

exports Detalle, repOrdPago;

begin


end.
