library SVSolicitRH;

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
  DetalleProp in 'DetalleProp.pas' {FDetalleProp};

{$R *.RES}

procedure Borra(xmodulo : TFModulo) ;
begin
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




//==================*=========Reporte de Propuesta ===============================
procedure showRepProp(xmodulo: TFmodulo; Rep:String;Numero:string);
var
vis:string;
venci:string;
tick2:TekRTF;
Q,s:Tquery;
Totper, totded:real;
begin
  q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;
  s := TQuery.Create(Application) ;
  s.DataBaseName := 'Sistema' ;

  try devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','SPROPUESTA','rtf'); except end;
  Tick2:=TEKrtf.create(NIL);
  Tick2.ClearVars;

  tick2.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));

  q.close;
  q.sql.text:='SELECT * FROM PVSOLEVEN  WHERE VSOL_NUMERO='+#39+NUMERO+#39;
  q.OPEN;

  S.close;
  s.sql.text:='SELECT * FROM SVPROPUESTAS WHERE PROP_NUMSOL='+#39+NUMERO+#39+
  ' AND PROP_NUMDET='+#39+xmodulo.Query1.FieldByName('VSOL_SOLIDET').AsString+#39+
  ' AND PROP_NUMREG='+#39+xmodulo.Query1.FieldByName('VSOL_NUMERO').AsString+#39+
  ' ORDER BY PROP_ORDEN';
  savetofilelog(s.sql.text);
  s.open;

  tick2.CreateVar('folio',xmodulo.Query1.FieldByName('VSOL_NUMERO').AsString);

  tick2.CreateVar('fecha',formatdatetime('dd " de " mmmm " del " yyyy',q.fieldbyname('VSOL_FECHASOL').asdatetime));
  tick2.CreateVar('dia',formatdatetime('dd',S.fieldbyname('PROP_FECHA').asdatetime));
  tick2.CreateVar('mes',formatdatetime('MM',S.fieldbyname('PROP_FECHA').asdatetime));
  tick2.CreateVar('anio',formatdatetime('YYYY',S.fieldbyname('PROP_FECHA').asdatetime));


  Tick2.InFile:=ExtractFiledir(Paramstr(0))+'\'+Rep;
  Tick2.OutFile:=ExtractFiledir(Paramstr(0))+'\RSPROPUESTA.rtf';

  Tick2.ExecuteOpen([q,s],SW_SHOW)
end;


function impProp(xmodulo: TFmodulo) : TForm;
var
q:Tquery;
begin
        ShowRepProp(xmodulo,'SPropuesta.rtf',xmodulo.Query1.FieldByName('VSOL_SOLICITUD').AsString)

end;


procedure showRep(xmodulo: TFmodulo; Rep:String;Numero:string);
var
vis:string;
venci:string;
tick2:TekRTF;
Q,s:Tquery;
Totper, totded:real;
begin
  q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;
  s := TQuery.Create(Application) ;
  s.DataBaseName := 'Sistema' ;

  try devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','SOLEVENTUAL','rtf'); except end;
  Tick2:=TEKrtf.create(NIL);
  Tick2.ClearVars;

  tick2.CreateVar('DIAS',formatdatetime('dd',date));
  tick2.CreateVar('MES',UPPERCASE(formatdatetime('mmmm',date)));
  tick2.CreateVar('ANIO',formatdatetime('yyyy',date));
  tick2.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));

  q.close;
  q.sql.text:='SELECT * FROM PVSOLEVEN  WHERE VSOL_NUMERO='+#39+NUMERO+#39;
  q.OPEN;

  S.close;
  s.sql.text:='SELECT * FROM PVSOLEVENDET WHERE SOLE_SOLICITUD='+#39+numero+#39;
  s.open;

  tick2.CreateVar('fecha',formatdatetime('dd " de " mmmm " del " yyyy',q.fieldbyname('VSOL_FECHASOL').asdatetime));


  Tick2.InFile:=ExtractFiledir(Paramstr(0))+'\'+Rep;
  Tick2.OutFile:=ExtractFiledir(Paramstr(0))+'\RVSolEven'+numero+'.rtf';

  Tick2.ExecuteOpen([q,s],SW_SHOW)
end;


function impSol(xmodulo: TFmodulo) : TForm;
var
q:Tquery;
begin
        ShowRep(xmodulo,'SolEventual.rtf',xmodulo.Query1.FieldByName('VSOL_SOLICITUD').AsString)
end;



function Detalle(xmodulo : TFModulo) : TForm ;
begin
 result := nil ;
 case xmodulo.modo of
  1 : result := TFDetalleProp.Create(Xmodulo) ;

  2:  begin
             result := TFDetalleProp.Create(Xmodulo)
      end;
  3:  xmodulo.lmensaje:=false;
 end ;
end ;



exports Detalle, impSol, impProp;

begin


end.
