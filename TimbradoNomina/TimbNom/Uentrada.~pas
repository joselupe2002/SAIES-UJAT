unit Uentrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, dxCore, dxButton, ExtCtrls,
   jpeg, Buttons, ExtActns, acPNG;

type
  Tentrada = class(TForm)
    Image3: TImage;
    pdet: TPanel;
    Panel4: TPanel;
    dxButton5: TdxButton;
    Memo1: TMemo;
    clatp: TListBox;
    Logtp: TListBox;
    Logtt: TListBox;
    clatt: TListBox;
    pb: TEdit;
    g: TStringGrid;
    Image1: TImage;
    login: TEdit;
    clave: TEdit;
    log: TEdit;
    cla: TEdit;
    filgen: TListBox;
    procedure tituloMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cerrarClick(Sender: TObject);
    procedure loginKeyPress(Sender: TObject; var Key: Char);
    procedure claveKeyPress(Sender: TObject; var Key: Char);
    procedure salirClick(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
   Procedure Ingresar;
    procedure Image3Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1DblClick(Sender: TObject);
    procedure dxButton5Click(Sender: TObject);
                procedure checaUserLog;
   procedure SaveLogUser;
    procedure FormActivate(Sender: TObject);
    procedure descargarURL (const direccionURL, ficheroLocal : string);
  private
    { Private declarations }
      procedure URL_OnDownloadProgress
        (Sender: TDownLoadURL;
         Progress, ProgressMax: Cardinal;
         StatusCode: TURLDownloadStatus;
         StatusText: String; var Cancel: Boolean) ;

  public
    { Public declarations }
  end;

var
  entrada: Tentrada;
  x,TTecleo,TPulsa:int64;
  CoePlantilla,CoeNew:real;
  Clogtt,Clogtp,Cclatt,Cclatp:real;
implementation

uses UPrincipal;

{$R *.DFM}


{===============================================================================
 Funcion para encriptar una cadena
 ===============================================================================}
function Encriptar(s:string):string;
var j,cont,k,pos:integer;
    ban:boolean;
    s1:string[42];
    password:array[1..42] of integer;
begin
  randomize();s1:=s;k:=random(10)+1;
  ban:=k mod 2 = 0;pos:=k mod 2+1;cont:=1;
  while s<>'' do begin
    j:=random(10)+1;
    if ban then begin
      if cont mod 2 = 0 then password[pos]:=ord(s[1])+j
      else password[pos]:=ord(s[1])-j;
      password[pos+1]:=65+j;
    end else begin
      if cont mod 2 = 0 then password[pos]:=ord(s[1])-j
      else password[pos]:=ord(s[1])+j;
      password[pos+1]:=65+j;
    end;
    delete(s,1,1);inc(pos,2);inc(cont);
  end;
  if ban then for j:=pos to 40 do password[J]:=ord(random(25)+65)
  else for j:=pos to 41 do password[J]:=ord(random(25)+65);
  if NOT ban then password[1]:=1;
  password[41]:=length(s1)+65;S1:='';
  for j:=1 to 42 do s1:=S1+chr(password[j]);
  encriptar:=s1;
end;


{===============================================================================
 Funcion para desencriptar una cadena ecncriptada
 ===============================================================================}
function Desencriptar(s:string):string;
var j,cont,k,pos:integer;
    ban:boolean;
    s1:string[42];
    ch:char;
begin
  randomize();S1:='';
  If ord(s[1])=1 then begin
      ban:=false;POS:=2;
  end else begin
    ban:=true;pos:=1;
  end;ch:=s[41];
  k:=ord(ch)-65;cont:=1;
  while length(s1)<k  do begin
    ch:=s[pos+1];j:=ord(ch)-65;ch:=s[pos];
    if ban then begin
      if cont mod 2 = 0 then s1:=s1+chr(ord(ch)-j)
      else s1:=s1+chr(ord(ch)+j);
    end else begin
      if cont mod 2 = 0 then s1:=s1+chr(ord(ch)+j)
      else s1:=s1+chr(ord(ch)-j);
    end;inc(pos,2);inc(cont);
  end;
  desencriptar:=s1;
end;





procedure cargar_archivo_configuracion;
begin
 with entrada do
     begin
        try
        filgen.Items.LoadFromFile(extractfiledir(paramstr(0))+'\Config.dll');
        log.text:=trim(FilGen.items[0]);
        cla.text:=desencriptar(FilGen.items[6]);
        except end;
     end;
end;

procedure Tentrada.tituloMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
     SC_DragMove = $F012;  { a magic number }
   begin
     ReleaseCapture;
     entrada.perform(WM_SysCommand, SC_DragMove, 0);
   end;


procedure Tentrada.cerrarClick(Sender: TObject);
begin
application.terminate;
end;







procedure Tentrada.loginKeyPress(Sender: TObject; var Key: Char);
begin
IF KEY=#13 THEN
   activecontrol:=clave;
end;






Procedure Tentrada.Ingresar;
begin
  if (login.text=log.Text) and (clave.Text=cla.text) then
      begin
          fprincipal.show;
          fprincipal.windowstate:=wsmaximized;
          entrada.close;
          entrada.visible:=false;
          SaveLogUser;
      end
  else
      begin
         Showmessage('El usuario y/o el password no son correctos');
         login.SetFocus;
      end;

end;


procedure Tentrada.SaveLogUser;
var Tuser: TstringList;
begin
Tuser:=TStringList.Create();
Tuser.Clear;
Tuser.Add(Login.text);
Tuser.Add(clave.text);
Tuser.SaveToFile(extractfiledir(paramstr(0))+'\UserLog');
end;

procedure Tentrada.checaUserLog;
var Tuser: TstringList;
begin
try
 Tuser:=TStringList.Create();
 if not(fileexists(extractfiledir(paramstr(0))+'\UserLog')) then
    Tuser.SaveToFile(extractfiledir(paramstr(0))+'\UserLog');
 Tuser.LoadFromFile(extractfiledir(paramstr(0))+'\UserLog');
 try login.Text:=Tuser.strings[0];  except login.SetFocus; exit; end;
 clave.SetFocus;
except end;
end;



procedure TEntrada.URL_OnDownloadProgress;
begin
   application.ProcessMessages;

end;


procedure Tentrada.descargarURL (
    const direccionURL, ficheroLocal : string);
begin
  if direccionURL <> '' then
  begin
    with TDownloadURL.Create(self) do
    try
      URL := direccionURL;
      FileName := ficheroLocal;
      ExecuteTarget(nil);
    finally
      Free;
    end;
  end;
end;


procedure Tentrada.claveKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
     ingresar;

end;

procedure Tentrada.salirClick(Sender: TObject);
begin
application.terminate;
end;

procedure Tentrada.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
     SC_DragMove = $F012;  { a magic number }
   begin
     ReleaseCapture;
     entrada.perform(WM_SysCommand, SC_DragMove, 0);
   end;


procedure Tentrada.Image3Click(Sender: TObject);
begin
application.terminate;
end;

procedure Tentrada.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=27 then
  application.Terminate;
end;

procedure Tentrada.Image1DblClick(Sender: TObject);
begin
pdet.Visible:=true;
pdet.Top:=1;
pdet.Left:=1;
end;

procedure Tentrada.dxButton5Click(Sender: TObject);
begin
pdet.visible:=false;
end;



procedure Tentrada.FormActivate(Sender: TObject);
begin
    checaUserLog;
    cargar_archivo_configuracion;
end;

end.
