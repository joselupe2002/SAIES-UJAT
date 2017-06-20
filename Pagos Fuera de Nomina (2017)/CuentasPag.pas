unit CuentasPag;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDETALLE, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls,  EKrtf,
  shellapi;

type
  TFRecibos = class(TPFDetalle)
    PagCon: TPageControl;
    TabBorra: TTabSheet;
    Button1: TButton;
    TNOM: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    fecini: TEdit;
    fecfin: TEdit;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ImprimeRep;
  private
    { Private declarations }
  public
    { Public declarations }
  end;






implementation

{$R *.DFM}

procedure TFRecibos.FormCreate(Sender: TObject);

begin
  inherited;
  fecini.text:=datetostr(date);
  fecfin.text:=datetostr(date);
  width:=275;
  height:=313;
end;


procedure savetofileLog(s:string);
var
l:TstringList;
begin
l:=TStringList.create();
if not(fileexists(extractfiledir(paramstr(0))+'\log.txt')) then
    l.SaveToFile(extractfiledir(paramstr(0))+'\log.txt');
l.LoadFromFile(extractfiledir(paramstr(0))+'\log.txt');
l.Add(DATETOSTR(DATE)+' '+TIMETOSTR(NOW)+ '--> '+s);
l.SaveToFile(extractfiledir(paramstr(0))+'\log.txt');
l.free;
end;

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



 {===============================================================================
 Devuelve la parte izquierda separada por "separador" 01-huimanguillo Res=01
 ===============================================================================}
function str_(cad:string;separador:string):string;
begin
   if pos(separador,cad)>0 then
      str_:=copy(cad,1,pos(separador,cad)-1)
   else
      str_:=cad;
end;


procedure TFRecibos.ImprimeRep;
var
vis:string;
venci:string;
tick2:TekRTF;
Q,s:Tquery;
Subtotal, total, isr:real;
begin
  q := TQuery.Create(Application) ;
  q.DataBaseName := 'Sistema' ;
  s := TQuery.Create(Application) ;
  s.DataBaseName := 'Sistema' ;

if not(fileexists(ExtractFiledir(Paramstr(0))+'\REPDETFN.rtf')) then
  devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','REPDETFN','rtf');
  Tick2:=TEKrtf.create(NIL);
  Tick2.ClearVars;

  tick2.CreateVar('FECHA',formatdatetime('dd/mm/yyyy',date));
  tick2.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));



  q.close;
  q.sql.text:='SELECT  T.*, VMOV_TPER-VMOV_TDED AS VMOV_TOTAL  FROM PVMOVFUENOM_REP T WHERE '+
  ' VMOV_TIPONOM LIKE '+
  #39+Str_(TNOM.TEXT,'-')+#39 + ' AND VMOV_FECHAMOV>='+#39+FECINI.TEXT+#39+
  ' AND VMOV_FECHAMOV<='+#39+FECFIN.TEXT+#39+
  ' ORDER BY VMOV_FECHAMOV, VMOV_SEQ';
  savetofilelog(q.sql.text);
  q.open;


  Tick2.InFile:=ExtractFiledir(Paramstr(0))+'\RepDetFN.rtf';
  Tick2.OutFile:=ExtractFiledir(Paramstr(0))+'\RRepDetFN.rtf';

  Tick2.ExecuteOpen([Q],SW_SHOW)
//  ShellExecute(xmodulo.handle, 'print', PChar(ExtractFiledir(Paramstr(0))+'\RRepFN.rtf'), nil, nil, SW_HIDE);
end;


///Recibos normales
procedure TFRecibos.Button1Click(Sender: TObject);

begin
  inherited;
  ImprimeRep;
end;



///////esdeped
procedure TFRecibos.Button2Click(Sender: TObject);

begin
  inherited;


end;





////jubilados y pensionados
end.
