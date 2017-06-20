unit UExpCQ;

interface

uses
  Windows, Messages, StdCtrls, Buttons, Menus, Dialogs, ExtCtrls, Controls,
  FileCtrl, dxCore, dxButton, Graphics, ComCtrls, Grids, Classes, variants,
  Forms, oleServer, ExcelXP,ClipBrd, SysUtils, Comobj, ExtActns, DBXpress,
  DB, SqlExpr, FMTBcd, acPNG;




type

  mygrid=class(TStringGrid)
  public
    procedure MoveColumn(FromIndex, ToIndex: Longint);
    procedure MoveRow(FromIndex, ToIndex: Longint);
  end;


type
  TForma = class(TForm)
    Server: TEdit;
    npaq: TEdit;
    pestado: TPanel;
    estadoe: TLabel;
    dxButton11: TdxButton;
    Panel7: TPanel;
    estadob: TProgressBar;
    LerrorDef: TListBox;
    BDSQL: TSQLConnection;
    CQ: TSQLQuery;
    BDFire: TSQLConnection;
    q: TSQLQuery;
    AUX: TSQLQuery;
    PServer: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    SpeedButton8: TSpeedButton;
    Label6: TLabel;
    Label8: TLabel;
    dxButton12: TdxButton;
    Panel8: TPanel;
    dxButton13: TdxButton;
    numRegPaq: TEdit;
    dirEnvio: TEdit;
    user: TEdit;
    pass: TEdit;
    SubirCQ: TSpeedButton;
    ConfServer: TSpeedButton;
    FilPrueba: TListBox;
    filgen: TListBox;
    log: TEdit;
    cla: TEdit;
    err: TMemo;
    et: TLabel;
    obsP: TMemo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ebd: TLabel;
    PPERCQ: TPanel;
    Label13: TLabel;
    Label15: TLabel;
    ImportCQ: TSpeedButton;
    Label20: TLabel;
    Label21: TLabel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    ejercicioExp: TEdit;
    MesExp: TComboBox;
    tipoper: TComboBox;
    periodocq: TComboBox;
    pcq: TEdit;
    regpat: TComboBox;
    g: TStringGrid;
    SpeedButton2: TSpeedButton;
    Gridt: TStringGrid;
    Label3: TLabel;
    gridst: TStringGrid;
    barra: TProgressBar;
    TabSheet3: TTabSheet;
    SpeedButton3: TSpeedButton;
    gf: TStringGrid;
    gq: TStringGrid;
    TIPOC: TComboBox;
    TabSheet4: TTabSheet;
    SpeedButton4: TSpeedButton;
    grfc: TStringGrid;
    TabSheet5: TTabSheet;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    ObsM: TMemo;
    TABLANOM: TComboBox;
    Image1: TImage;
    procedure CMAfterShow(var Msg: TMessage);
    procedure FormCreate(Sender: TObject);
    Function buscaClave(cadena:string; cat:string):boolean;
    Function buscaClaveBin(cadena:string; cat:string):boolean;
    procedure AbrePrincipal(nombre:string);
    function Xls_To_StringGrid(AGrid: TStringGrid; AXLSFile: string): Boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    Function dameDescrip(cadena:string; cat:string):string;
    procedure ConfigurarServidordeEnvio1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure ConfServerClick(Sender: TObject);
    procedure NmeroderegistroxPaquete1Click(Sender: TObject);
      procedure borra_row(sender:tobject; lin:integer);
      procedure cargarConfig;
    procedure ejercicioKeyPress(Sender: TObject; var Key: Char);
    procedure descargarURL (const direccionURL, ficheroLocal : string);
    procedure tipoperChange(Sender: TObject);
    procedure periodocqChange(Sender: TObject);
    procedure ejercicioExpKeyPress(Sender: TObject; var Key: Char);
    procedure SubirCQClick(Sender: TObject);
    procedure OBSpDblClick(Sender: TObject);
    procedure dxButton9Click(Sender: TObject);
    procedure ImportCQClick(Sender: TObject);
    procedure SumarNominas;
    procedure gDblClick(Sender: TObject);
    procedure dxButton13Click(Sender: TObject);
    function CopiarExcel(AGrid: TStringGrid; AXLSFile: string): Boolean;
    procedure copiarGrid(g:TstringGrid);
    function PegarExcel: Boolean;
    procedure SpeedButton2Click(Sender: TObject);
    procedure gridstDblClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure gfDblClick(Sender: TObject);
    procedure gqDblClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure grfcDblClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
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
  Forma: TForma;
    lineaG, ColG, Lineab, colB:integer;
  LinError, ColError:integer;
  ponerDesc:boolean;
  posError,Descrip: String;
  cadBuscar:string;
  presEsc:boolean;
  HabCeldas:boolean;
  numLinCop:integer;
  validarPrimero:integer;
  numTotCol:integer;
  cambios:boolean;
  AbrioFile:boolean;
  XFILE:INTEGER;
  portapapeles:boolean;

const
  CM_AFTERSHOW = WM_USER + 1;

implementation



{$R *.dfm}






procedure savetofile(s:string);
var
l:TstringList;
begin
l:=TStringList.create();
l.Add(s);
l.SaveToFile(extractfiledir(paramstr(0))+'\log.txt');
l.free;
end;

procedure eliminaVacio(grid:TstringGrid);
var
x:integer;
y:integer;
encontre:boolean;
begin
   for x:=grid.rowcount-1 downto  1 do
      begin
          encontre:=false;
          for y:=0 to grid.ColCount-1 do
              begin
                  if trim(grid.cells[y,x])<>'' then
                     begin
                         encontre:=true;
                         break;
                     end;
              end;
          if not(encontre) then
              grid.RowCount:=grid.RowCount-1
          else
              break;
     end;
end;


procedure TForma.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:=cafree;
end;



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




{===============================================================================
 Procedimiento de Movimiento de Columna de un StringGrid
 ===============================================================================}
procedure mygrid.MoveColumn(FromIndex, ToIndex: Integer);
begin
  inherited;
end;

{===============================================================================
 Procedimiento de Movimiento de Linea de un StringGrid
 ===============================================================================}
procedure mygrid.MoveRow(FromIndex, ToIndex: Integer);
begin
  inherited;
end;

{===============================================================================
 Procedimiento para Borrar una Linea de un StringGrid
 ===============================================================================}
procedure Tforma.borra_row(sender:tobject; lin:integer);
begin
   with mygrid(sender) do
   begin
      rowmoved(lin,rowcount-1);
      rows[rowcount-1].clear;
      rowcount:=rowcount-1;
   end;
end;

{===============================================================================
 Procedimiento Limpia una Linea de un StringGrid
 ===============================================================================}
procedure limpia_linea(sender:tobject;linea:integer);
var
x:integer;
begin
   with mygrid(sender) do
     begin
        for x:=0 to colcount-1 do
            cells[x,linea]:='';
     end;
end;


{===============================================================================
 Procedimiento Limpia una Linea de un StringGrid
 ===============================================================================}
function anumero(cad:string):real;
var
cadNew:real;
begin
  cad:=stringreplace(cad,'$','',[rfReplaceAll, rfIgnoreCase]);
  cad:=stringreplace(cad,',','',[rfReplaceAll, rfIgnoreCase]);
  try  cadNew:=strtofloat(cad); except begin Showmessage('La cadena '+cad+' No es monto valido se convertira a cero'); cadNew:=0; end;
  end;
anumero:=cadNew;
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

{===============================================================================
Busca la descripcion de una clave en un Grid y se la coloca despues de "-"
 ===============================================================================}
Procedure LimpiaGrid(g:TStringGrid);
var
x,y:integer;
begin
 for x:=1 to g.RowCount-1 do
   for y:=0 to g.ColCount-1 do
       g.cells[y,x]:='';

end;




function TForma.Xls_To_StringGrid(AGrid: TStringGrid; AXLSFile: string): Boolean;
const
  xlCellTypeLastCell = $0000000B;
var
  XLApp, Sheet: OLEVariant;
  RangeMatrix: Variant;
  x, y, k, r: Integer;
begin
  Result := False;
  // Create Excel-OLE Object
  XLApp := CreateOleObject('Excel.Application');
  try
    // Hide Excel
    XLApp.Visible := False;

    // Open the Workbook
    XLApp.Workbooks.Open(AXLSFile);

    //Sheet := XLApp.Workbooks[ExtractFileName(AXLSFile)].WorkSheets[1];
    //Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
    XLApp.Workbooks[1].Worksheets[1].Activate;
    XLAPP.ActiveSheet.Cells.SpecialCells(xlCellTypeLastCell).Activate;

    // Get the value of the last row
    x := XLApp.ActiveCell.Row;
    barra.Position:=0;
    barra.MAX:=X;

    // Get the value of the last column
    y := XLApp.ActiveCell.Column;

    // Set Stringgrid's row &col dimensions.
    barra.Max:=x;
    AGrid.RowCount := x;
    AGrid.ColCount := y;

    et.caption:='Cargando archivo..';
    // Assign the Variant associated with the WorkSheet to the Delphi Variant
    RangeMatrix := XLApp.Range['A1', XLApp.Cells.Item[X, Y]].Value;

    //  Define the loop for filling in the TStringGrid
    k := 1;
    repeat
      for r := 1 to y do
        AGrid.Cells[(r - 1), (k)] := RangeMatrix[K, R];
      Inc(k, 1);
      AGrid.RowCount := k + 1;
      barra.Position:=forma.barra.Position+1;
    until k > x;

    // Unassign the Delphi Variant Matrix
       RangeMatrix := Unassigned;

  finally
    // Quit Excel
    if not VarIsEmpty(XLApp) then
    begin
      // XLApp.DisplayAlerts := False;
      XLApp.Quit;
      XLAPP := Unassigned;
      Sheet := Unassigned;
      Result := True;
    end;
  end;
barra.Position:=0;
end;


procedure TForma.copiarGrid(g:TstringGrid);
const
TAB = #9; //Tabular para dar espacio entre las columnas.
CR = #13; // Simula la tecla enter, es decir separa cada fila.
var
R, C: integer; // R= de row Fila, y C= de columna
cadS: string; // Es el buffer donde se va a guardar el texto a copiar.
begin
{Cuadricula es el nombre del componente StringGrid}
cadS := '';

for R := 0 to G.RowCount - 1 do
    begin
        for C := 0 to G.ColCount - 1 do
            begin
                cadS := cadS + stringReplace(TRIM(G.Cells[C, R]),'#13','',[rfReplaceAll]); //Aqui vamos concatenando las celdas del stringGrid.
                if C < G.ColCount - 1 then
                   cadS := cadS + TAB; //esta condición es para ir tabulando el las columnas de tal forma que no salgan pegadas.
            end;
        if R < G.RowCount - 1 then
           cadS := cadS + CR;
     end;
Clipboard.AsText := cadS; //Este objeto es el que hace todo el trabajo de copiar el texto ala papelera de reciclaje
pegarExcel;
END;



function TForma.PegarExcel: Boolean;
const
xlCellTypeLastCell = $0000000B;
TAB = #9; //Tabular para dar espacio entre las columnas.
CR = #13; // Simula la tecla enter, es decir separa cada fila.

var
  XLApp, Sheet: OLEVariant;
  RangeMatrix: Variant;
  x, y, k: Integer;

  R, C: integer; // R= de row Fila, y C= de columna
  S: string; // Es el buffer donde se va a guardar el texto a copiar.
begin
      Result := False;
      XLApp := CreateOleObject('Excel.Application');
      XLApp.Visible := true;
      XLApp.Workbooks.Open(extractfiledir(paramstr(0))+'\file.xlsx');
      XLAPP.Sheets.Item[1].Activate;
      XLAPP.Sheets.Item[1].UsedRange.Select;
      XLAPP.Sheets.Item[1].paste;
end;




function TForma.CopiarExcel(AGrid: TStringGrid; AXLSFile: string): Boolean;
const
  xlCellTypeLastCell = $0000000B;
TAB = #9; //Tabular para dar espacio entre las columnas.
CR = #13; // Simula la tecla enter, es decir separa cada fila.

var
  XLApp, Sheet: OLEVariant;
  RangeMatrix: Variant;
  x, y, k: Integer;

  R, C: integer; // R= de row Fila, y C= de columna
  S: string; // Es el buffer donde se va a guardar el texto a copiar.
begin
  Result := False;
      CLIPBOARD.CLEAR;
      XLApp := CreateOleObject('Excel.Application');
      XLApp.Visible := false;
      XLApp.Workbooks.Open(AXLSFile);
      XLAPP.Sheets.Item[1].Activate;
      XLAPP.Sheets.Item[1].UsedRange.Select;
      XLAPP.Sheets.Item[1].UsedRange.Copy;
      numLinCop:=XLAPP.Sheets.Item[1].UsedRange.Rows.Count;
      XLAPP.Workbooks.Close;
end;



procedure TForma.CMAfterShow(var Msg: TMessage);
begin

  Self.Close;
end;



procedure TForma.cargarConfig;
begin
  try
        filgen.Items.LoadFromFile(extractfiledir(paramstr(0))+'\Config.dll');
        log.text:=FilGen.items[0];
        cla.text:=desencriptar(FilGen.items[6]);
        server.text:=FilGen.items[1];
        npaq.text:=FilGen.items[2];
        numregPaq.Text:= FilGen.items[2];
        dirEnvio.text:=FilGen.items[1];
        user.text:=FilGen.items[3];
        pass.text:=FilGen.items[4];
  except end;
end;


procedure TForma.FormCreate(Sender: TObject);
var
x:integer;
begin
XFILE:=0;
POSERROR:='';
linError:=1;
colError:=0;
portapapeles:=false;

cargarConfig;


cambios:=false;
AbrioFile:=false;




//Abrimos la base de Firebird
  BDFire.Close;
  BDFire.Params.ValueFromIndex[1]:=extractfileDir(paramstr(0))+'\base\DBIMPORT.FDB';
  BDFire.open;


end;

Function esletra(cadena:string):boolean;
var
x:integer;
resul:boolean;
Begin
   resul:=true;
   for x:=1 to length(cadena) do
       if not(cadena[x] in ['a'..'z','A'..'Z']) then
          resul:=false;
   esletra:=resul;
end;



Function formatoFecha(cadena:string):boolean;
var
dia:string;
mes:string;
anio:string;
fecha:string;
resul:boolean;
Begin
   resul:=true;
   anio:=copy(cadena,1,4);
   mes:=copy(cadena,5,2);
   dia:=copy(cadena,7,2);
   fecha:=dia+'/'+mes+'/'+anio;
   try strtodate(fecha) except resul:=false; end;

   formatoFecha:=resul;
end;


Function esFecha(cadena:string):boolean;
var
fecha:string;
resul:boolean;
Begin
   resul:=true;
   fecha:=copy(cadena,5,2)+'/'+copy(cadena,3,2)+'/'+copy(cadena,1,2);
   try strtodate(fecha) except resul:=false; end;

   esFecha:=resul;
end;


Function esFechaFormal(cadena:string):boolean;
var
fecha:string;
resul:boolean;
Begin
   resul:=true;
   try strtodate(cadena) except resul:=false; end;
   esFechaFormal:=resul;
end;


Function esCorreo(cadena:string):boolean;
var
resul:boolean;
Begin
   resul:=true;
   if pos('@',cadena)<=1 then
      resul:=false;

   esCorreo:=resul;
end;


function dameEntero(cadena:string):integer;
var
res:integer;
begin
res:=0;
try res:=strtoint(cadena); except res:=0; end;
dameEntero:=res;
end;



function esEjercicio(cadena:string):boolean;
var
res:boolean;
n:integer;
begin
res:=true;
try n:=strtoint(cadena); except begin res:=false; n:=-1; end; end;
if n<0 then res:=false;
if (n<2013) or (n>2018) then res:=false;

esEjercicio:=res;
end;

function esEntero(cadena:string):boolean;
var
res:boolean;
n:integer;
begin
res:=true;
try n:=strtoint(cadena); except begin res:=false; n:=-1; end; end;
if n<0 then res:=false;
esEntero:=res;
end;

function esCP(cadena:string):boolean;
var
res:boolean;
n:integer;
begin
res:=true;
try n:=strtoint(cadena); except begin res:=false; n:=-1; end; end;
if n<0 then res:=false;
if (n<86000) or (n>=87000) then
    res:=false;
esCp:=res;
end;

function esReal(cadena:string):boolean;
var
res:boolean;
n:real;
begin
res:=true;
try n:=strtofloat(cadena); except BEGIN res:=false; n:=-1; END; end;
if n<0 then res:=false;
esReal:=res;
end;


Function Tforma.buscaClave(cadena:string; cat:string):boolean;
var
cv:string;
resul:boolean;
x:integer;
Begin
   resul:=false;
   for x:=0 to (forma.FindComponent(cat) as TListBox).count-1 do
       begin
          if uppercase(STR_((forma.FindComponent(cat) as TListBox).Items[x],'-'))=uppercase(cadena) then
             begin
                Descrip:=copy((forma.FindComponent(cat) as TListBox).Items[x],pos('-',(forma.FindComponent(cat) as TListBox).Items[x])+1,length((forma.FindComponent(cat) as TListBox).Items[x]));
                resul:=true;
                break;
             end;
       end;
   buscaClave:=resul;
end;


Function Tforma.buscaClaveBin(cadena:string; cat:string):boolean;
var
valor:integer;
encontrado:boolean;
x:integer;
primero, ultimo, centro, valBus:integer;
Begin
   encontrado:=false;
   try valor:=strtoint(cadena); except valor:=0; end;
   if valor>0 then
      begin
         centro:=0; primero:=0; ultimo:=(forma.FindComponent(cat) as TListBox).Count;

         while ((primero<=ultimo) and not(encontrado)) do
            begin
                centro:=(primero+ultimo) div 2;
                if centro>(forma.FindComponent(cat) as TListBox).Count then break;

                if centro>(forma.FindComponent(cat) as TListBox).Count-1  then  break;

                if (str_((forma.FindComponent(cat) as TListBox).Items[centro],'-')=cadena) then
                   begin
                      encontrado:=true;
                      Descrip:=copy((forma.FindComponent(cat) as TListBox).Items[centro],pos('-',(forma.FindComponent(cat) as TListBox).Items[centro])+1,length((forma.FindComponent(cat) as TListBox).Items[centro]));
                      break;
                   end
                else
                   begin

                       if (strtoint(str_((forma.FindComponent(cat) as TListBox).Items[centro],'-'))>strtoint(cadena)) then
                           ultimo:=centro-1
                       else
                          primero:=centro+1;
                   end;
            end;
       end
   else
      encontrado:=false;
 buscaClaveBin:=encontrado;
end;



Function Tforma.dameDescrip(cadena:string; cat:string):string;
var
cv:string;
x:integer;
Begin
   cv:='';
   for x:=0 to (forma.FindComponent(cat) as TListBox).count-1 do
       begin
          if uppercase(STR_((forma.FindComponent(cat) as TListBox).Items[x],'-'))=uppercase(cadena) then
             begin
                cv:=copy((forma.FindComponent(cat) as TListBox).Items[x],1,pos('-',(forma.FindComponent(cat) as TListBox).Items[x])-1);
                break;
             end;
       end;
   dameDescrip:=cv;
end;



procedure TForma.AbrePrincipal(nombre:string);

begin

end;


{===============================================================================
 Se envia una cadena como 123 y el número de ceros que colocara antes (4) 0000123
 ===============================================================================}
function colocaCeros(n:string;nc:integer):string;
var
x:integer;
begin
   for x:=1 to nc-length(n) do n:='0'+n;
colocaCeros:=n;
end;


procedure TForma.SpeedButton1Click(Sender: TObject);
VAR
VALMES:INTEGER;
begin
try valmes:=strtoint(STR_(mesExp.text,'-')); except valMes:=0; end;
IF ((valmes>=1) and (valMes<=12)) and (ejercicioExp.text<>'') and (tipoper.Text<>'') and (pcq.text<>'')  THEN
   sumarNominas
else
 Showmessage('Al parecer no se ha llenado toda la información requerida, revise los campos solicitados');
 
end;

function sinerror(gr:TStringGrid):boolean;
var
vacio:boolean;
x:integer;
begin
   vacio:=true;
   for x:=1 to gr.rowcount-1 do
       if gr.cells[gr.colcount-2,x]<>'' then
          begin
             vacio:=false;
             break;
          end;
sinerror:=vacio;

end;


function UploadFile(FileName: String;tipo:string;user:string): String;

begin


end;



procedure TForma.URL_OnDownloadProgress;
begin


end;


procedure TForma.descargarURL (
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


procedure TForma.ConfigurarServidordeEnvio1Click(Sender: TObject);

begin
ConfServerClick(nil);
end;




procedure TForma.SpeedButton8Click(Sender: TObject);

begin
filgen.Items[1]:=dirEnvio.text;
filgen.Items[2]:=numRegPaq.text;
filgen.Items[3]:=user.text;
filgen.Items[4]:=pass.text;
filgen.Items.SaveToFile(extractfiledir(paramstr(0))+'\Config.dll');
PSERVER.VISIBLE:=FALSE;
end;

procedure TForma.SpeedButton11Click(Sender: TObject);
begin
//copiarGrid(Grid);
end;

procedure TForma.ConfServerClick(Sender: TObject);
begin
  pserver.Top:=((forma.Height-pserver.Height) div 2);
  pserver.left:=((forma.Width-pserver.Width) div 2);
  pserver.Visible:=TRUE;
  numRegPaq.SetFocus;
  PSERVER.BringToFront;
end;

procedure TForma.NmeroderegistroxPaquete1Click(Sender: TObject);
var
cad:string;
begin
 cad:=npaq.text;
 if inputQuery('Cambiar No. de Reguistro x Paquete','Número:',cad) then
   begin
      filgen.Items[3]:=cad;
      filgen.Items.SaveToFile(extractfiledir(paramstr(0))+'\Config.dll');
      npaq.text:=cad;
   end;
end;

procedure EliminarColumna(Grid: TStringGrid; Columna: Integer);

begin

end;

function RefToCell(ARow, ACol: Integer): string;
begin
  Result := Chr(Ord('A') + ACol - 1) + IntToStr(ARow);
end;

function SaveAsExcelFile(AGrid: TStringGrid; ASheetName, AFileName: string): Boolean;
const
  xlWBATWorksheet = -4167;
var
  Row, Col: Integer;
  GridPrevFile: string;
  XLApp, Sheet, Data: OLEVariant;
  i, j: Integer;
begin
  // Prepare Data

  Data := VarArrayCreate([1, AGrid.RowCount, 1, AGrid.ColCount], varVariant);
  for i := 0 to AGrid.ColCount - 1 do
    for j := 0 to AGrid.RowCount - 1 do
      Data[j + 1, i + 1] := AGrid.Cells[i, j];
  // Create Excel-OLE Object
  Result := False;
  XLApp := CreateOleObject('Excel.Application');
  try
    // Hide Excel
    XLApp.Visible := False;
    // Add new Workbook
    XLApp.Workbooks.Add(xlWBatWorkSheet);
    Sheet := XLApp.Workbooks[1].WorkSheets[1];
    Sheet.Name := ASheetName;
    // Fill up the sheet
    Sheet.Range[RefToCell(1, 1), RefToCell(AGrid.RowCount,
      AGrid.ColCount)].Value := Data;
    // Save Excel Worksheet
    try
      XLApp.Workbooks[1].SaveAs(AFileName);
      Result := True;
    except
      // Error ?
    end;
  finally
    // Quit Excel
    if not VarIsEmpty(XLApp) then
    begin
      XLApp.DisplayAlerts := False;
      XLApp.Quit;
      XLAPP := Unassigned;
      Sheet := Unassigned;
    end;
  end;
end;

procedure TForma.ejercicioKeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure TForma.tipoperChange(Sender: TObject);
begin
  CQ.close;
cq.sql.text:='SELECT * FROM NOM10002 where idtipoperiodo='+str_(tipoper.text,'-')+
             ' and EJERCICIO='+ejercicioExp.TEXT;
savetofile(cq.SQL.Text);
CQ.open;
PERIODOCQ.Clear;
While not(Cq.eof) do
  begin
    PERIODOCQ.items.add(cq.fieldbyname('IDPERIODO').asstring+'-'+Cq.fieldbyname('FECHAINICIO').asstring+' A' +
    Cq.fieldbyname('fechafin').asstring);
    cq.next;

  end;

end;

procedure TForma.periodocqChange(Sender: TObject);
begin
PCQ.Text:=STR_(PERIODOCQ.TEXT,'-');
cq.close;
cq.sql.text:='SELECT * FROM NOM10035';
CQ.Open;
regpat.clear;
while not(cq.eof) do
  begin
    regpat.items.add(cq.FieldByName('cidregistropatronal').asstring+'-'+
    cq.FieldByName('cregistroimss').asstring);
    cq.Next;
  end;

end;

function numero(var key:char):char;
begin
  if key in ['0'..'9',#8,'.',#13] then numero:=key else numero:=#7;
end;

procedure TForma.ejercicioExpKeyPress(Sender: TObject; var Key: Char);
begin
key:=numero(key);
end;

procedure TForma.SubirCQClick(Sender: TObject);
begin

  ebd.Visible:=true;
  EBD.BringToFront;
  ebd.caption:='Conectando a Base de Datos '+numRegPaq.text+'...';
  Screen.Cursor:=crHourGlass;
  EBD.UPDATE;
  BDSQL.Close;
  bdsql.Params.ValueFromIndex[1]:=direnvio.text;
  bdsql.Params.ValueFromIndex[2]:=numRegPaq.text;
  bdsql.Params.ValueFromIndex[3]:=user.text;
  bdsql.Params.ValueFromIndex[4]:=pass.text;
  bdsql.open;
  ebd.caption:='Base de datos Conectada';
   EBD.UPDATE;
   Screen.Cursor:=crDefault;

  ejercicioExp.Text:=formatdatetime('YYYY',Now);
  MESExp.Text:=formatdatetime('MM',Now);

  CQ.close;
  cq.sql.text:='SELECT * FROM NOM10023';
  CQ.open;
  tipoper.Clear;
  While not(cq.eof) do
   begin
    tipoper.items.add(cq.fieldbyname('idtipoperiodo').asstring+'-'+cq.fieldbyname('nombretipoperiodo').asstring);
    cq.next;
  end;
   PPERCQ.Visible:=TRUE;


end;




procedure TForma.OBSpDblClick(Sender: TObject);
begin

IF OBSP.Align=aLcLIENT THEN
   begin
      OBSP.Align:=ALBottom;
      obsp.Height:=20;
   end
else
   BEGIN
    OBSP.Align:=alClient;
    OBSP.BringToFront;
   END;
end;

procedure TForma.dxButton9Click(Sender: TObject);
begin
ppercq.Visible:=false;
end;



procedure TForma.SumarNominas;
begin
  G.Visible:=true;
  g.cells[1,0]:='PERCEPCIONES';
  g.cells[2,0]:='DEDUCCIONES';

  g.cells[0,1]:='EXCEL';
  g.cells[0,2]:='POR AUTORIZAR';
  g.cells[0,3]:='AUTORIZADO';

  q.close;
  Q.sql.text:='SELECT SUM(A.MONTO) FROM nominas A WHERE A.perded='+#39+'P'+#39+
  ' AND A.ejercicio='+#39+ejercicioExp.text+#39 +
  ' AND a.mes='+#39+STR_(mesExp.text,'-')+#39;
  SAVETOFILE(q.sql.text);
  q.open;
  g.cells[1,1]:=Formatfloat('#,#0.00',q.fields[0].asfloat);

  q.close;
  Q.sql.text:='SELECT SUM(A.MONTO) FROM nominas A WHERE A.perded='+#39+'D'+#39+
  ' AND A.ejercicio='+#39+ejercicioExp.text+#39 +
  ' AND a.mes='+#39+STR_(mesExp.text,'-')+#39;
  q.open;

  g.cells[2,1]:=Formatfloat('#,#0.00',q.fields[0].asfloat);

  cq.Close;
  cq.sql.text:='SELECT sum(nom10008.importetotal) FROM nom10008, nom10004 WHERE  '+
  'nom10008.idconcepto=nom10004.idconcepto AND nom10004.tipoconcepto='+#39+'P'+#39;
  cq.open;
  g.cells[1,2]:=Formatfloat('#,#0.00',cq.fields[0].asfloat);

  cq.Close;
  cq.sql.text:='SELECT sum(nom10008.importetotal) FROM nom10008, nom10004 WHERE  '+
  'nom10008.idconcepto=nom10004.idconcepto AND nom10004.tipoconcepto='+#39+'D'+#39;
  cq.open;
  g.cells[2,2]:=Formatfloat('#,#0.00',cq.fields[0].asfloat);

  cq.Close;
  cq.sql.text:='SELECT sum(nom10007.importetotal) FROM nom10007, nom10004 WHERE  '+
  'nom10007.idconcepto=nom10004.idconcepto AND nom10004.tipoconcepto='+#39+'P'+#39+
  ' and nom10007.idperiodo='+pcq.text;
  cq.open;
  g.cells[1,3]:=Formatfloat('#,#0.00',cq.fields[0].asfloat);

  cq.Close;
  cq.sql.text:='SELECT sum(nom10007.importetotal) FROM nom10007, nom10004 WHERE  '+
  'nom10007.idconcepto=nom10004.idconcepto AND nom10004.tipoconcepto='+#39+'D'+#39+
  ' and nom10007.idperiodo='+pcq.text;
  cq.open;
  g.cells[2,3]:=Formatfloat('#,#0.00',cq.fields[0].asfloat);
end;


                       

function generacodigoUnico(cad:string):string;
var
x:integer;
val:integer;
begin
   val:=0;
   FOR x:=1 to length(cad) do
       BEGIN
           val:=val+ord(cad[x]);
       END;
   val:=VAL+ord(cad[1])+ord(cad[length(cad)]);
   generacodigoUnico:=inttostr(val);
end;


procedure TForma.ImportCQClick(Sender: TObject);
VAR
VALMES:INTEGER;
num:integer;
sql:string;
fecNac:TdateTime;
codfb,CodCQ:string;
begin

obsP.text:='';
try valmes:=strtoint(STR_(mesExp.text,'-')); except valMes:=0; end;
IF ((valmes>=1) and (valMes<=12)) and (ejercicioExp.text<>'') and (tipoper.Text<>'') and (pcq.text<>'')  THEN
   begin
      
      //Importar los conceptos de pago
       q.Close;
       q.sql.text:='update conceptos S set S.CVESAT=(SELECT A.CVESAT FROM  CATCONC A WHERE A.CLAVE=S.CLAVE) '+
       ' WHERE CLAVE NOT IN ('+#39+'9000'+#39+','+#39+'9001'+#39+','+#39+'9002'+#39+')';
       q.EXECSQL;

       q.sql.text:='select CLAVE, PERDED, DESCRIP, CVESAT FROM CONCEPTOS WHERE EJERCICIO='#39+EJERCICIOEXP.TEXt+#39+
       ' AND MES='+#39+str_(mesEXP.text,'-')+#39;
       savetofile(q.sql.text);
       q.Open;

      pestado.Top:=((forma.Height-pestado.Height) div 2);
      pestado.left:=((forma.Width-pestado.Width) div 2);
      pestado.Visible:=true;
      estadob.Position:=0;
      estadob.Max:=q.RecordCount;
      estadoe.caption:='Exportando conceptos de pago';
      estadoe.update;
      while not(q.eof) do
         begin

             //Verificamos que no exista el registro
             CQ.close;
             cq.sql.text:='SELECT COUNT(*) FROM NOM10004 WHERE NUMEROCONCEPTO='+#39+Q.Fields[0].asstring+#39;
             savetofile(Cq.sql.text);
             cq.Open;

             if cq.fields[0].asinteger<=0 then //No existe el registro se inserta
                begin
                    cq.close;
                    cq.sql.text:='INSERT INTO NOM10004 (numeroconcepto, tipoconcepto, descripcion, '+
                    'especie, automaticoglobal, automaticoliquidacion, imprimir, articulo86, leyendaimporte1, '+
                    'leyendaimporte2, leyendaimporte3, leyendaimporte4,'+
                    'cuentacw,tipomovtocw, contracuentacw,contabcuentacw,Contabcontracuentacw,'+
                    'leyendavalor,claveagrupadorasat) VALUES ('+
                    #39+Q.fields[0].asstring+#39+','+#39+Q.fields[1].asstring+#39+','+#39+copy(Q.fields[2].asstring,1,40)+#39+','+
                    '0,0,0,1,0,'+#39+''+#39+','+
                    #39+''+#39+','+#39+''+#39+','+#39+''+#39+','+
                    #39+''+#39+','+#39+'F'+#39+','+#39+''+#39+','+#39+'G'+#39+','+#39+'G'+#39+','+
                    #39+''+#39+','+#39+Q.fields[3].asstring+#39+')';
                    SAVETOFILE(CQ.SQL.TEXT);
                    Cq.execsql;
                end
            else
                begin
                    cq.close;
                    cq.sql.text:='UPDATE NOM10004 SET '+
                    'tipoconcepto='+#39+Q.fields[1].asstring+#39+','+
                    'descripcion='+#39+copy(Q.fields[2].asstring,1,40)+#39+','+
                    'claveagrupadorasat='+#39+Q.fields[3].asstring+#39+
                    ' Where numeroconcepto='+Q.fields[0].asstring;
                    Cq.execsql;
                end;
         estadob.Position:=estadob.Position+1;
         q.next;
      end;


     //Estableciendo relación entre Compaq y FIREBIRD
     Q.close;
     Q.sql.text:='DELETE FROM CQRELTAB WHERE TABLA='#39+'PCONCEPTO'+#39;
     Q.ExecSQL;
     q.close;
     q.sql.text:='select CLAVE, PERDED, DESCRIP, CVESAT FROM CONCEPTOS WHERE EJERCICIO='#39+EJERCICIOEXP.TEXt+#39+
       ' AND MES='+#39+str_(mesExp.text,'-')+#39;
     q.Open;

     estadob.Position:=0;
     estadob.Max:=q.RecordCount;
     while not(q.eof) do
        begin
           CQ.close;
           cq.sql.text:='SELECT idconcepto FROM NOM10004 WHERE NUMEROCONCEPTO='+Q.Fields[0].asString;
           cq.Open;
           aux.close;
           aux.sql.text:='INSERT INTO CQRELTAB (SAIES,COMPAQ,TABLA) VALUES ('+
           #39+Q.Fields[0].asString+#39+','+
           #39+CQ.Fields[0].asString+#39+','+
           #39+'PCONCEPTO'+#39+')';
           Aux.ExecSQL;
           estadob.Position:=estadob.Position+1;
           Q.next;
        end;



     //=========================Importando los Puestos ====================================
      q.sql.text:='select CLAVE, DESCRIP FROM PUESTOS WHERE EJERCICIO='#39+EJERCICIOEXP.TEXt+#39+
       ' AND MES='+#39+str_(mesEXP.text,'-')+#39;
       savetofile(q.sql.text);
      q.Open;

      estadob.Max:=q.RecordCount;
      estadoe.caption:='Exportando Puestos';
      estadoe.update;
      while not(q.eof) do
         begin
             //Verificamos que no exista el puesto
             CODfb:=generacodigoUnico(Q.Fields[0].asstring);
             CQ.close;
             cq.sql.text:='SELECT COUNT(*) FROM NOM10006 WHERE NUMEROPUESTO='+#39+codFB+#39;
             savetofile(Cq.sql.text);
             cq.Open;

             if cq.fields[0].asinteger<=0 then //No existe el registro se inserta
                begin
                    cq.close;
                    cq.sql.text:='INSERT INTO NOM10006 (NUMEROPUESTO, DESCRIPCION) VALUES ('+
                    #39+codFB+#39+','+#39+COPY(Q.fields[1].asstring,1,40)+#39+')';
                    SAVETOFILE(CQ.SQL.TEXT);
                    Cq.execsql;
                end
            else
                begin
                    cq.close;
                    cq.sql.text:='UPDATE NOM10006 SET '+
                    'descripcion='+#39+Q.fields[1].asstring+#39+
                    ' Where Numeropuesto='+codFB;
                    Cq.execsql;
                end;

         //bUSCAMOS EL CODIGO EN CONTPAQ
         CQ.Close;
         cq.SQL.text:='SELECT IDPUESTO FROM NOM10006 WHERE NUMEROPUESTO='+#39+codFB+#39;
         cq.Open;
         codCQ:=cq.Fields[0].asstring;

         AUX.close;
         AUX.sql.text:='UPDATE PUESTOS SET IDCQ='+#39+Codcq+#39+' WHERE EJERCICIO='#39+EJERCICIOEXP.TEXt+#39+
         ' AND MES='+#39+str_(mesEXP.text,'-')+#39+
         ' AND CLAVE='+#39+Q.Fields[0].asstring+#39;
         AUX.ExecSQL;

         estadob.Position:=estadob.Position+1;
         q.next;
      end;

     //Importando los empleados
      estadoe.caption:='Exportando conceptos de pago';
      estadoe.update;
      estadob.position:=0;

      q.close;
      q.sql.text:='SELECT COUNT(*) FROM EMPLEADOS WHERE EJERCICIO='+#39+ejercicioExp.text+#39+
      ' AND MES ='+#39+str_(mesExp.text,'-')+#39;
      savetofile(q.sql.text);
      Q.Open;
      estadob.Max:=q.fields[0].asinteger;
       estadoe.caption:='Exportando Empleados';
      estadoe.update;

      SQL:='SELECT EMPL AS IDEMPLEADO, 1 AS IDDEPARTAMENTO, T.IDCQ AS IDPUESTO,'+
           STR_(TIPOPER.TEXT,'-')+' AS IDTIPOPERIODO, 4 AS IDTURNO, EMPL AS CODIGOEMPLEADO, '+
           'SUBSTRING(NOMBRE FROM 1 FOR 40) AS NOMBRE,'+
           'SUBSTRING(PATERNO FROM 1 FOR 40) AS APELLIDOPATERNO,'+
           'SUBSTRING(MATERNO FROM 1 FOR 40)  AS APELLIDOMATERNO,'+
           'SUBSTRING(PATERNO||'+#39+' '+#39+'||MATERNO||'+#39+' '+#39+'||NOMBRE FROM 1 FOR 120) AS NOMBRELARGO,'+
           'FECNAC AS FECHANACIMIENTO,'+
           #39+'C'+#39+' AS ESTADOCIVIL,'+
           'SEXO AS SEXO, CURPI AS CURPI, CURPF AS CURPF,'+
           'SEGUROSOC AS NUMEROSEGUROSOCIAL,'+#39+'0'+#39+' AS UMF, RFC AS RFC,'+
           'HOMOCLAVE AS HOMOCLAVE,'+#39+'0'+#39+' AS CUENTAPAGOELECTRONICO, '+
            #39+'0'+#39+' AS SUCURSALPAGOELECTRONICO,'+#39+'A'+#39+' AS ESTADOEMPLEADO, SUELDODIARIO AS SUELDODIARIO,'+
           ' FECINGRESO AS FECHASUELDODIARIO, 0 AS SUELDOVARIABLE,FECINGRESO AS FECHASUELDOVARIABLE,'+
           '0 AS SUELDOPROMEDIO,FECINGRESO AS FECHASUELDOPROMEDIO, 0 AS SUELDOINTEGRADO,FECINGRESO AS '+
           ' FECHASUELDOINTEGRADO,1 AS CALCULADO,0 AS AFECTADO,1 AS CALCULADOEXTRAORDINARIO,'+
           '0 AS AFECTADOEXTRAORDINARIO,0 AS interfazcheqpaqw,0 AS MODIFICACIONNETO,'+
           'FECINGRESO AS FECHAALTA,'+
           #39+'0'+#39+' AS CUENTACW, '+#39+'P'+#39+' AS TIPOCONTRATO,'+#39+'F'+#39+' AS BASECOTIZACIONIMSS,'+
           #39+'S'+#39+' AS TIPOEMPLEADO,FORMAPAGO AS FORMAPAGO,'+#39+'E'+#39+' AS BASEPAGO,'+
           #39+'B'+#39+' AS ZONASALARIO,1 AS CALCULOPTU,1 AS CALCULOAGUINALDO, 0 AS MODIFICACIONSALARIOIMSS, '+

           '1 AS ALTAIMSS,0 AS BAJAIMSS,0 AS CAMBIOCOTIZACIONIMSS,'+#39+'0'+#39+' AS EXPEDIENTE,NULL AS TELEFONO,'+
           '0 AS CODIGOPOSTAL, NULL AS DIRECCION,'+#39+'0'+#39+' AS POBLACION,'+
           #39+'0'+#39+' AS ESTADO,'+#39+' '+#39+' AS NOMBREPADRE,'+#39+' '+#39+' AS NOMBREMADRE,'+#39+'0'+#39+' AS NUMEROAFORE,'+
           #39+'30/12/1899'+#39+' AS FECHABAJA,0 AS SUELDOBASELIQUIDACION,'+
           '0 AS AJUSTEALNETO,'+
           str_(regpat.text,'-')+' AS CIDREGISTROPATRONAL,'+#39+'A_'+#39+' AS CESTADOEMPLEADOPERIODO,FECINGRESO AS CFECHASUELDOMIXTO,'+
           '0 AS CSUELDOMIXTO,'+#39+'0'+#39+' AS NUMEROFONACOT,'+
          'CORREO AS CORREOELECTRONICO, 2 AS TIPOREGIMEN, '+#39+'000000000000000000'+#39+' AS CLABEINTERBANCARIA'+
          ' FROM EMPLEADOS S, PUESTOS T  WHERE S.EJERCICIO=T.EJERCICIO AND S.MES=T.MES AND S.CVEPUESTO=T.CLAVE AND T.EJERCICIO=S.EJERCICIO AND T.MES=S.MES AND S.EJERCICIO='+#39+EjercicioExp.text+#39+' and S.mes='+#39+str_(mesExp.Text,'-')+#39;
          SAVETOFILE(SQL);
      Q.CLOSE;
      q.SQL.Text:=SQL;
      q.Open;

      num:=1;
      cq.close;
      cq.sql.Text:='DELETE FROM nom10034 WHERE cidperiodo='+PCQ.TEXT;
      cq.EXECSQL;
      while not(q.eof) do
         begin
             //Verificamos que no exista el registro
             CQ.close;
             cq.sql.text:='SELECT COUNT(*) FROM NOM10001 WHERE CODIGOEMPLEADO='+#39+Q.Fields[0].asstring+#39;
             savetofile(Cq.sql.text);
             cq.Open;
             try fecNac:=strtodate(Q.fieldbyname('fechanacimiento').asstring); except FecNac:=strtodate('01/01/2001'); end;
             if cq.fields[0].asinteger<=0 then //No existe el registro se inserta
                begin
                    cq.close;
                    cq.sql.text:='SET DATEFORMAT dmy; INSERT INTO nom10001 (iddepartamento, idpuesto, idtipoperiodo,'+
                                 'idturno, codigoempleado, nombre, apellidopaterno,'+
                                 'apellidomaterno, nombrelargo, fechanacimiento, lugarnacimiento,'+
                                 'estadocivil, sexo, curpi, curpf, numerosegurosocial, umf, rfc,'+
                                 'homoclave, cuentapagoelectronico, sucursalpagoelectronico,'+
                                 'bancopagoelectronico, estadoempleado, sueldodiario, fechasueldodiario,'+
                                 'sueldovariable, fechasueldovariable, sueldopromedio, fechasueldopromedio,'+
                                 'sueldointegrado, fechasueldointegrado, calculado, afectado,'+
                                 'calculadoextraordinario, afectadoextraordinario,'+
                                 'interfazcheqpaqw, modificacionneto, fechaalta, cuentacw,'+
                                 'tipocontrato, basecotizacionimss, tipoempleado, basepago,'+
                                 'formapago, zonasalario, calculoptu, calculoaguinaldo,'+
                                 'modificacionsalarioimss, altaimss, bajaimss, cambiocotizacionimss,'+
                                 'expediente, telefono, codigopostal, direccion, poblacion, estado,'+
                                 'nombrepadre, nombremadre, numeroafore, fechabaja, causabaja, '+
                                 'sueldobaseliquidacion,campoextra1, campoextra2, campoextra3, '+
                                 'fechareingreso, ajustealneto,cidregistropatronal, '+
                                 'ccampoextranumerico1, ccampoextranumerico2, ccampoextranumerico3,'+
                                 'ccampoextranumerico4, ccampoextranumerico5, cestadoempleadoperiodo, '+
                                 'cfechasueldomixto,csueldomixto, NumeroFonacot, CorreoElectronico, '+
                                 'TipoRegimen, ClabeInterbancaria) VALUES ( '+
                                  #39+'1'{Q.fieldbyname('IDDEPARTAMENTO').asstring}+#39+','+
                                  #39+Q.fieldbyname('IDPUESTO').asstring+#39+','+
                                  #39+Q.fieldbyname('IDTIPOPERIODO').asstring+#39+','+
                                  #39+'1'{Q.fieldbyname('idturno').asstring}+#39+','+
                                  #39+Q.fieldbyname('codigoempleado').asstring+#39+','+
                                  #39+copy(Q.fieldbyname('nombre').asstring,1,40)+#39+','+
                                  #39+copy(Q.fieldbyname('apellidopaterno').asstring,1,40)+#39+','+
                                  #39+copy(Q.fieldbyname('apellidomaterno').asstring,1,40)+#39+','+
                                  #39+copy(Q.fieldbyname('nombrelargo').asstring,1,120)+#39+','+
                                  #39+datetostr(fecnac)+#39+','+
                                  #39+''+#39+','+
                                  #39+COPY(Q.fieldbyname('estadocivil').asstring,1,1)+#39+','+
                                  #39+COPY(Q.fieldbyname('SEXO').asstring,1,1)+#39+','+
                                  #39+COPY(Q.fieldbyname('CURPI').asstring,1,6)+#39+','+
                                  #39+COPY(Q.fieldbyname('CURPF').asstring,1,8)+#39+','+
                                  #39+'00000000000'+#39+','+
                                  #39+Q.fieldbyname('umf').asstring+#39+','+
                                  #39+COPY(Q.fieldbyname('RFC').asstring,1,4)+#39+','+
                                  #39+COPY(Q.fieldbyname('homoclave').asstring,1,4)+#39+','+
                                  #39+COPY(Q.fieldbyname('cuentapagoelectronico').asstring,1,20)+#39+','+
                                  #39+COPY(Q.fieldbyname('sucursalpagoelectronico').asstring,1,50)+#39+','+
                                  #39+''+#39+','+
                                  #39+COPY(Q.fieldbyname('estadoempleado').asstring,1,1)+#39+','+
                                  #39+Q.fieldbyname('sueldodiario').asstring+#39+','+
                                  #39+Q.fieldbyname('fechaalta').asstring+#39+','+
                                  #39+Q.fieldbyname('sueldovariable').asstring+#39+','+
                                  #39+Q.fieldbyname('fechaalta').asstring+#39+','+
                                  #39+Q.fieldbyname('sueldopromedio').asstring+#39+','+
                                  #39+Q.fieldbyname('fechaalta').asstring+#39+','+
                                  #39+Q.fieldbyname('sueldointegrado').asstring+#39+','+
                                  #39+Q.fieldbyname('fechaalta').asstring+#39+','+
                                  #39+Q.fieldbyname('calculado').asstring+#39+','+
                                  #39+Q.fieldbyname('afectado').asstring+#39+','+
                                  #39+Q.fieldbyname('calculadoextraordinario').asstring+#39+','+
                                  #39+Q.fieldbyname('afectadoextraordinario').asstring+#39+','+
                                  #39+Q.fieldbyname('interfazcheqpaqw').asstring+#39+','+
                                  #39+Q.fieldbyname('modificacionneto').asstring+#39+','+
                                  #39+Q.fieldbyname('fechaalta').asstring+#39+','+
                                  #39+Q.fieldbyname('cuentacw').asstring+#39+','+
                                  #39+Q.fieldbyname('tipocontrato').asstring+#39+','+
                                  #39+Q.fieldbyname('basecotizacionimss').asstring+#39+','+
                                  #39+Q.fieldbyname('tipoempleado').asstring+#39+','+
                                  #39+Q.fieldbyname('basepago').asstring+#39+','+
                                  #39+Q.fieldbyname('formapago').asstring+#39+','+
                                  #39+Q.fieldbyname('zonasalario').asstring+#39+','+
                                  #39+Q.fieldbyname('calculoptu').asstring+#39+','+
                                  #39+Q.fieldbyname('calculoaguinaldo').asstring+#39+','+
                                  #39+Q.fieldbyname('modificacionsalarioimss').asstring+#39+','+
                                  #39+Q.fieldbyname('altaimss').asstring+#39+','+
                                  #39+Q.fieldbyname('bajaimss').asstring+#39+','+
                                  #39+Q.fieldbyname('cambiocotizacionimss').asstring+#39+','+
                                  #39+Q.fieldbyname('expediente').asstring+#39+','+
                                  #39+COPY(Q.fieldbyname('telefono').asstring,1,20)+#39+','+
                                  #39+Q.fieldbyname('codigopostal').asstring+#39+','+
                                  #39+COPY(Q.fieldbyname('direccion').asstring,1,50)+#39+','+
                                  #39+COPY(Q.fieldbyname('poblacion').asstring,1,50)+#39+','+
                                  #39+COPY(Q.fieldbyname('estado').asstring,1,20)+#39+','+
                                  #39+Q.fieldbyname('nombrepadre').asstring+#39+','+
                                  #39+Q.fieldbyname('nombremadre').asstring+#39+','+
                                  #39+Q.fieldbyname('numeroafore').asstring+#39+','+
                                  #39+''{Q.fieldbyname('fechabaja').asstring}+#39+','+
                                  #39+''+#39+','+
                                  #39+Q.fieldbyname('sueldobaseliquidacion').asstring+#39+','+
                                  #39+''+#39+','+
                                  #39+''+#39+','+
                                  #39+''+#39+','+
                                  #39+''{Q.fieldbyname('fechaalta').asstring}+#39+','+
                                  #39+Q.fieldbyname('ajustealneto').asstring+#39+','+
                                  #39+Q.fieldbyname('cidregistropatronal').asstring+#39+','+
                                  #39+'0'+#39+','+
                                  #39+'0'+#39+','+
                                  #39+'0'+#39+','+
                                  #39+'0'+#39+','+
                                  #39+'0'+#39+','+
                                  #39+Q.fieldbyname('cestadoempleadoperiodo').asstring+#39+','+
                                  #39+Q.fieldbyname('fechaalta').asstring+#39+','+
                                  #39+Q.fieldbyname('csueldomixto').asstring+#39+','+
                                  #39+Q.fieldbyname('NumeroFonacot').asstring+#39+','+
                                  #39+COPY(Q.fieldbyname('CorreoElectronico').asstring,1,60)+#39+','+
                                  #39+Q.fieldbyname('TipoRegimen').asstring+#39+','+
                                  #39+Q.fieldbyname('ClabeInterbancaria').asstring+#39+')';

                    TRY Cq.execsql;
                    except  on E: Exception  do begin obsp.Lines.Add(cq.sql.text);
                                                      obsP.Lines.Add('Error empleado '+q.fields[0].asstring+' '+E.Message);
                                                      end; end;

                    num:=num+1;
                end
             else
                 begin
                     cq.close;
                     cq.sql.text:='SET DATEFORMAT dmy; UPDATE nom10001 SET '+
                     'APELLIDOPATERNO='+#39+copy(Q.fieldbyname('apellidopaterno').asstring,1,40)+#39+','+
                     'APELLIDOMATERNO='+#39+copy(Q.fieldbyname('apellidomaterno').asstring,1,40)+#39+','+
                     'NOMBRE='+#39+copy(Q.fieldbyname('nombre').asstring,1,40)+#39+','+
                      'NOMBRELARGO='+#39+copy(Q.fieldbyname('nombrelargo').asstring,1,120)+#39+','+
                     'CURPI='+#39+COPY(Q.fieldbyname('CURPI').asstring,1,6)+#39+','+
                     'CURPF='+#39+COPY(Q.fieldbyname('CURPf').asstring,1,8)+#39+','+
                     'RFC='+#39+COPY(Q.fieldbyname('RFC').asstring,1,4)+#39+','+
                     'HOMOCLAVE='+#39+COPY(Q.fieldbyname('HOMOCLAVE').asstring,1,4)+#39+','+
                     'TIPOREGIMEN='+#39+Q.fieldbyname('TipoRegimen').asstring+#39+','+
                     'TIPOCONTRATO='+#39+Q.fieldbyname('TipoContrato').asstring+#39+','+
                     'FORMAPAGO='+#39+Q.fieldbyname('FORMAPAGO').asstring+#39+','+
                     'IDTIPOPERIODO='+#39+STR_(TIPOPER.TEXT,'-')+#39+','+
                     'FECHAALTA='+#39+Q.fieldbyname('FechaAlta').asstring+#39+','+
                     'IDPUESTO='+#39+Q.fieldbyname('IDPUESTO').asstring+#39+','+
                     'FECHANACIMIENTO='+#39+datetostr(fecnac)+#39+','+
                     'CORREOELECTRONICO='+#39+COPY(Q.fieldbyname('CorreoElectronico').asstring,1,60)+#39+','+
                     'CALCULADO=1,'+
                     'numerosegurosocial='+#39+'00000000000'+#39+
                     ' WHERE codigoempleado='+#39+Q.fieldbyname('codigoempleado').asstring+#39;
                     cq.EXECSQL;
                 end;


              cq.sql.text:='SET DATEFORMAT dmy; INSERT INTO dbo.nom10034 (idempleado, idtipoperiodo, cidperiodo, iddepartamento, '+
                    'idpuesto, idturno, estadocivil, umf, cuentapagoelectronico, sucursalpagoelectronico, '+
                    'bancopagoelectronico, estadoempleado, sueldodiario, fechasueldodiario, sueldovariable, '+
                    'fechasueldovariable, sueldopromedio, fechasueldopromedio, sueldointegrado, fechasueldointegrado,'+
                    'calculado, afectado, calculadoextraordinario, afectadoextraordinario, interfazcheqpaqw, '+
                    'modificacionneto, fechaalta, cuentacw, tipocontrato, basecotizacionimss, tipoempleado, basepago,'+
                    ' formapago, zonasalario, modificacionsalarioimss,altaimss, bajaimss, cambiocotizacionimss, '+
                    'telefono, codigopostal, direccion, poblacion, estado, numeroafore, fechabaja, causabaja, '+
                    'sueldobaseliquidacion, campoextra1, campoextra2, campoextra3, fechareingreso,'+
                    'ajustealneto, timestamp, cidregistropatronal, cestadoempleadoperiodo, ccampoextranumerico1, '+
                    'ccampoextranumerico2, ccampoextranumerico3, ccampoextranumerico4, ccampoextranumerico5, '+
                    'cdiastrabajados, cdiaspagados, cdiascotizados, cdiasausencia, cdiasincapacidades, '+
                    'cdiasvacaciones, cdiaspropseptimos, chorasextras1,  chorasextras2, chorasextras3, '+
                    'cfechasueldomixto, csueldomixto, cfechacorte, CorreoElectronico, ClabeInterbancaria)'+
                    'SELECT B.idempleado, B.idtipoperiodo, '+PCQ.text+', B.iddepartamento, B.idpuesto, B.idturno, '+
                    'B.estadocivil, B.umf, B.cuentapagoelectronico, B.sucursalpagoelectronico, B.bancopagoelectronico, B.estadoempleado,'+
                    'B.sueldodiario, B.fechasueldodiario, B.sueldovariable, B.fechasueldovariable, B.sueldopromedio, B.fechasueldopromedio,'+
                    'B.sueldointegrado, B.fechasueldointegrado, B.calculado, B.afectado, B.calculadoextraordinario,'+
                    'B.afectadoextraordinario, B.interfazcheqpaqw, B.modificacionneto, B.fechaalta, B.cuentacw, B.tipocontrato,'+
                    'B.basecotizacionimss, B.tipoempleado, B.basepago, B.formapago, B.zonasalario, B.modificacionsalarioimss,'+
                    'B.altaimss, B.bajaimss, B.cambiocotizacionimss, B.telefono, B.codigopostal, B.direccion, B.poblacion,'+
                    'B.estado, B.numeroafore, B.fechabaja, B.causabaja, B.sueldobaseliquidacion,'+
                    'B.campoextra1, B.campoextra2, B.campoextra3, B.fechareingreso, B.ajustealneto, '+
                    'B.timestamp, B.cidregistropatronal, B.cestadoempleadoperiodo, B.ccampoextranumerico1, B.ccampoextranumerico2,'+
                    'B.ccampoextranumerico3, B.ccampoextranumerico4, B.ccampoextranumerico5, 30, 30,'+
                    '0, 0, 0, 0, 0, 0,'+
                    '0, 0, B.cfechasueldomixto, B.csueldomixto, B.fechaalta, B.CorreoElectronico,'+
                    'B.ClabeInterbancaria FROM  nom10001 B where  b.codigoempleado='+#39+Q.fieldbyname('codigoempleado').asstring+#39;


                    TRY Cq.execsql;
                    except  on E: Exception  do begin obsp.Lines.Add(cq.sql.text);
                                                       obsp.Lines.Add('Error empleado '+q.fields[0].asstring+' '+E.Message);
                                                        end; end;
                                                           
              cq.close;
              cq.sql.text:='UPDATE nom10034 SET  tipocontrato='+#39+Q.fieldbyname('TipoContrato').asstring+#39;
              cQ.EXECSQL;

              estadob.position:=estadob.position+1;
              q.next;
         end;
         //Estableciendo relacion de empleados
         estadoe.caption:='Relacionando Empleados con Base de datos';
         estadoe.update;
         aux.close;
         aux.sql.text:='DELETE FROM CQRELTAB WHERE TABLA='#39+'FPERSONAS'+#39;
         Aux.ExecSQL;
         q.close;
         q.sql.text:='SELECT DISTINCT(EMPL) FROM EMPLEADOS WHERE EJERCICIO='+#39+ejercicioExp.text+#39+
         ' AND MES ='+#39+str_(mesExp.text,'-')+#39;;
         q.Open;
         ESTADOB.POSITION:=0;
         while not(q.eof) do
            begin
               //Verificamos que no exista el registro
               CQ.close;
               cq.sql.text:='SELECT IDEMPLEADO FROM nom10001 WHERE CODIGOEMPLEADO='+#39+Q.Fields[0].asString+#39;
               cq.Open;
               aux.close;
               aux.sql.text:='INSERT INTO CQRELTAB (SAIES,COMPAQ,TABLA) VALUES ('+
               #39+Q.Fields[0].asString+#39+','+
               #39+CQ.Fields[0].asString+#39+','+
               #39+'FPERSONAS'+#39+')';
               TRY Aux.ExecSQL;
               except  on E: Exception  do begin obsp.Lines.Add(aux.sql.text); obsp.Lines.Add('Error Insertando'+q.fields[1].asstring+' '+E.Message);end; end;
               
               ESTADOB.POSITION:=ESTADOB.POSITION+1;
               Q.next;
            end;


         //iMPORTANDO MOVIMIENTOS DE LA Nómina
         estadoe.caption:='Exportandop información de los moivimientos de pago';
         estadoe.update;
         estadob.position:=0;

         q.close;
         q.sql.text:='SELECT COUNT(*) FROM nominas WHERE EJERCICIO='+#39+ejercicioExp.text+#39+
         ' AND MES ='+#39+str_(mesExp.text,'-')+#39;
         savetofile(q.sql.text);
         Q.Open;
         estadob.Max:=q.Fields[0].asinteger;


         q.Close;
         q.sql.text:='select '+PCQ.TEXT+' as idperiodo, C.COMPAQ AS idempleado, b.COMPAQ AS idconcepto, '+
        '0 as idmovtopermanente,sum(Monto) importeTotal, decode(b.compaq,3,15,0) as valor,'+
        'DECODE(PERDED,'+#39+'P'+#39+',DECODE(TIPOMONTO,'+#39+'G'+#39+',SUM(monto),0),0) as importe1,'+
        'DECODE(PERDED,'+#39+'P'+#39+',DECODE(TIPOMONTO,'+#39+'E'+#39+',SUM(monto),0),0) as importe2, '+
        'DECODE(PERDED,'+#39+'P'+#39+',DECODE(TIPOMONTO,'+#39+'G'+#39+',SUM(monto),0),0) as importe3, '+
        '0 as importe4, 1 as importetotalreportado,'+
        '0 as importe1reportado, 0 as importe2reportado, 0 as importe3reportado, 0 as importe4reportado,'+
        #39+'01/'+STR_(MESEXP.text,'-')+'/'+EJERCICIOEXP.text+#39+'  as fecha '+
        'from nominas a, CQRELTAB B, CQRELTAB C where ejercicio='+#39+ejercicioEXP.text+#39+
        ' and mes='+#39+str_(mesEXP.Text,'-')+#39+' AND (Conp=B.SAIES AND B.TABLA='+#39+'PCONCEPTO'+#39+')'+
        ' AND (Empl=C.SAIES AND C.TABLA='+#39+'FPERSONAS'+#39+')'+
        'group by C.COMPAQ , B.COMPAQ, a.perded, tipomonto'+
        ' UNION '+
        ' select '+PCQ.TEXT+' as idperiodo, f.COMPAQ AS idempleado, '+#39+'1'+#39+' as idconcepto,'+
        '0 as idmovtopermanente, sum(DECODE(tipomonto,'+#39+'G'+#39+',MONTO,0))- '+
        'sum(DECODE(PERDED,'+#39+'D'+#39+',MONTO,0)) AS importe1, 0 as valor, '+
        '0 as importe1,0 as importe2, '+
        '0 as importe3,0 as importe4, 0 as importetotalreportado, 0 as importe1reportado, 0 as importe2reportado,'+
        '0 as importe3reportado, 0 as importe4reportado, '+#39+'01/'+STR_(MESEXP.text,'-')+'/'+EJERCICIOEXP.text+#39+'  as fecha '+
        'from nominas d,  CQRELTAB f where ejercicio='+#39+ejercicioEXP.text+#39+
        ' and mes='+#39+str_(mesEXP.Text,'-')+#39+
        'AND (d.Empl=f.SAIES AND f.TABLA='+#39+'FPERSONAS'+#39+') '+
        ' group by f.COMPAQ '+
        ' UNION '+
        ' select '+PCQ.TEXT+' as idperiodo, f.COMPAQ AS idempleado, '+#39+'2'+#39+' as idconcepto,'+
        '0 as idmovtopermanente, 0 AS importe1, 0 as valor, 0 as importe1,0 as importe2, '+
        '0 as importe3,0 as importe4, 0 as importetotalreportado, 0 as importe1reportado, 0 as importe2reportado,'+
        '0 as importe3reportado, 0 as importe4reportado, '+#39+'01/'+STR_(MESEXP.text,'-')+'/'+EJERCICIOEXP.text+#39+'  as fecha '+
        'from NOMINAS d,  CQRELTAB f where ejercicio='+#39+ejercicioEXP.text+#39+
        ' and mes='+#39+str_(mesEXP.Text,'-')+#39+
        'AND (d.Empl=f.SAIES AND f.TABLA='+#39+'FPERSONAS'+#39+') '+
        ' group by f.COMPAQ ';
        SAVETOFILE(q.sql.text);
        q.open;
        ESTADOB.POSITION:=0;

        cq.close;
        cq.sql.Text:='DELETE FROM nom10008';
        cq.execsql;

        while not(q.eof) do
           begin
               cq.close;
               cq.sql.text:='SET DATEFORMAT dmy; INSERT INTO dbo.nom10008 (idperiodo, idempleado, idconcepto, idmovtopermanente, '+
               'importetotal, valor, importe1, importe2, importe3, importe4, importetotalreportado, '+
               'importe1reportado, importe2reportado, importe3reportado, importe4reportado, timestamp) VALUES ('+
               Q.FIELDS[0].ASSTRING+','+
               Q.FIELDS[1].ASSTRING+','+
               Q.FIELDS[2].ASSTRING+','+
               Q.FIELDS[3].ASSTRING+','+
               Q.FIELDS[4].ASSTRING+','+
               Q.FIELDS[5].ASSTRING+','+
               Q.FIELDS[6].ASSTRING+','+
               Q.FIELDS[7].ASSTRING+','+
               Q.FIELDS[8].ASSTRING+','+
               Q.FIELDS[9].ASSTRING+','+
               Q.FIELDS[10].ASSTRING+','+
               Q.FIELDS[11].ASSTRING+','+
               Q.FIELDS[12].ASSTRING+','+
               Q.FIELDS[13].ASSTRING+','+
               Q.FIELDS[14].ASSTRING+','+
               DATETIMETOSTR(DATE)+')';
               TRY Cq.execsql;
               except  on E: Exception  do begin obsP.Lines.Add(cq.sql.text); obsp.Lines.Add('Error Insertando'+q.fields[1].asstring+' '+E.Message);  savetofile(cq.sql.text); end; end;
               Q.NEXT;
               estadob.position:=estadob.position+1;
          end;
          CQ.close;
          cq.sql.text:='UPDATE nom10001 SET calculado=1';
          CQ.execsql;
          obsP.Lines.Add('Exportación Terminada...');

        pestado.visible:=false;
        sumarNominas;
        OBSpDblClick(nil);
   end
else
   begin
      Showmessage('Al parecer no se ha llenado toda la información requerida, revise los campos solicitados');
   end;

end;

procedure TForma.gDblClick(Sender: TObject);
begin
CopiarGrid(g);
end;

procedure TForma.dxButton13Click(Sender: TObject);
begin
PSERVER.VISIBLE:=FALSE;
end;

procedure TForma.SpeedButton2Click(Sender: TObject);
begin
limpiagrid(gridt);
limpiagrid(gridst);
gridst.RowCount:=2;
gridt.Cells[0,1]:='Número de empleados Enviados';
q.close;
q.sql.text:='select count(*) from empleados s where s.mes='+#39+str_(mesExp.text,'-')+#39+
' and s.EJERCICIO='+#39+ejercicioExp.text+#39;
q.Open;
gridt.Cells[1,1]:=q.fields[0].asstring;


gridt.Cells[0,2]:='Número de empleados en Contpaq';
cq.Close;
cq.SQL.text:='select count(distinct(idempleado)) from nom10008 a where a.idperiodo='+pcq.Text;
cq.open;
gridt.Cells[1,2]:=cq.fields[0].asstring;

gridt.Cells[0,3]:='Número de empleados Timbrados';
cq.Close;
cq.SQL.text:='select count(distinct(idempleado)) from nom10007 a where a.idperiodo='+pcq.Text+' and idempleado '+
             ' in (select b.idempleado from nom10043 b where b.idperiodo='+pcq.Text+' and b.Estado=3)';
cq.open;
gridt.Cells[1,3]:=cq.fields[0].asstring;
gridt.Cells[0,4]:='Número de empleados Sin Timbrar';
cq.Close;
cq.SQL.text:='select count(distinct(idempleado)) from nom10007 a where a.idperiodo='+pcq.Text+' and idempleado '+
             ' in (select b.idempleado from nom10043 b where b.idperiodo='+pcq.Text+' and b.Estado<>3)'+
             ' and a.importetotal>0 ';
cq.open;
gridt.Cells[1,4]:=cq.fields[0].asstring;


cq.Close;
cq.sql.Text:='select distinct(c.idempleado), c.codigoempleado,c.nombrelargo, c.rfc, '+
             'c.fechanacimiento, c.homoclave,c.curpi, c.curpf '+
             ' from nom10007 a, nom10001 c '+
             ' where a.idperiodo='+pcq.Text+' and a.idempleado=c.idempleado and a.idempleado '+
             ' in (select b.idempleado from nom10043 b where b.idperiodo='+pcq.Text+' and b.Estado<>3)'+
             ' and a.importetotal>0 ';
cq.open;
gridst.Cells[0,0]:='ID_COMPAQ';
gridst.Cells[1,0]:='ID_UPCH';
gridst.Cells[2,0]:='NOMBRE';
gridst.Cells[3,0]:='RFC';
gridst.Cells[4,0]:='FECHA_NAC';
gridst.Cells[5,0]:='HOMOCLAVE';

gridst.Cells[6,0]:='CURP_INI';
gridst.Cells[7,0]:='CURP_FIN';


while not(cq.eof) do
begin
   gridst.Cells[0,gridst.RowCount-1]:=cq.Fields[0].asstring;
   gridst.Cells[1,gridst.RowCount-1]:=cq.Fields[1].asstring;
   gridst.Cells[2,gridst.RowCount-1]:=cq.Fields[2].asstring;
   gridst.Cells[3,gridst.RowCount-1]:=cq.Fields[3].asstring;
   gridst.Cells[4,gridst.RowCount-1]:=cq.Fields[4].asstring;
   gridst.Cells[5,gridst.RowCount-1]:=cq.Fields[5].asstring;
   gridst.Cells[6,gridst.RowCount-1]:=cq.Fields[6].asstring;
   gridst.Cells[7,gridst.RowCount-1]:=cq.Fields[7].asstring;
   gridst.RowCount:= gridst.RowCount+1;
   cq.next;
end;

end;

procedure TForma.gridstDblClick(Sender: TObject);
begin
CopiarGrid(gridst);
end;

procedure TForma.SpeedButton3Click(Sender: TObject);
begin
q.close;
q.sql.text:='SELECT S.EMPL, SUM(S.MONTO) FROM NOMINAS S WHERE s.ejercicio='+#39+EJERCICIOEXP.text+#39+
' and S.MES='+#39+str_(mesExp.text,'-')+#39+' AND S.PERDED='+#39+STR_(tipoc.text,'-')+#39+
' GROUP BY S.EMPL order by s.empl ';
q.OPEN;
limpiagrid(gf);
gf.rowcount:=2;
gf.cells[0,0]:='EMPL';
gf.cells[1,0]:='EXCEL';
while not(q.eof) do
   begin
      GF.CELLS[0,GF.RowCount-1]:=q.Fields[0].asstring;
      GF.CELLS[1,GF.RowCount-1]:=q.Fields[1].asstring;
      q.next;
      gf.rowcount:=gf.rowcount+1;
   end;

cq.close;
cq.sql.text:=' SELECT  C.codigoempleado, SUM(A.IMPORTETOTAL) FROM  '+tablanom.text+' A, NOM10004 B, NOM10001 C  '+
 ' WHERE A.idconcepto=B.idconcepto AND A.idempleado=C.idempleado AND B.tipoconcepto='+#39+STR_(tipoc.text,'-')+#39+
 ' AND IDPERIODO='+STR_(PERIODOCQ.Text,'-')+
 ' GROUP BY C.codigoempleado ORDER BY C.codigoempleado';
Cq.Open;

limpiagrid(gq);
gq.rowcount:=2;
gq.cells[0,0]:='EMPL';
gq.cells[1,0]:='CONTPAQ';
while not(cq.eof) do
   begin
      Gq.CELLS[0,Gq.RowCount-1]:=cq.Fields[0].asstring;
      Gq.CELLS[1,Gq.RowCount-1]:=cq.Fields[1].asstring;
      cq.next;
      gq.rowcount:=gq.rowcount+1;
   end;

end;

procedure TForma.gfDblClick(Sender: TObject);
begin
CopiarGrid(gF);
end;

procedure TForma.gqDblClick(Sender: TObject);
begin
CopiarGrid(gQ);
end;

procedure TForma.SpeedButton4Click(Sender: TObject);
var
x:integer;
begin
q.close;
q.sql.text:='SELECT S.EMPL, S.RFCK FROM EMPLEADOS S WHERE s.ejercicio='+#39+EJERCICIOEXP.text+#39+
' and S.MES='+#39+str_(mesExp.text,'-')+#39;
q.OPEN;
limpiagrid(grfc);
GRFC.rowcount:=2;
GRFC.cells[0,0]:='EMPL';
GRFC.cells[1,0]:='EXCEL';
GRFC.cells[2,0]:='CONTPAQ';
while not(q.eof) do
   begin
      GRFC.CELLS[0,GRFC.RowCount-1]:=q.Fields[0].asstring;
      GRFC.CELLS[1,GRFC.RowCount-1]:=q.Fields[1].asstring;
      q.next;
      GRFC.rowcount:=GRFC.rowcount+1;
   end;

for x:=1 to grfc.RowCount-1 do
  begin
     cq.close;
     cq.sql.text:='  select (c.rfc+right('+#39+'0'+#39+'+LTRIM(STR(YEAR(C.FECHANACIMIENTO))),2)+'+
       'right('+#39+'0'+#39+'+LTRIM(STR(MONTH(C.FECHANACIMIENTO))),2)+'+
       'right('+#39+'0'+#39+'+LTRIM(STR(DAY(C.FECHANACIMIENTO))),2)+'+
       'c.homoclave) as RFC from  NOM10001 C  WHERE C.codigoempleado='+#39+ GRFC.CELLS[0,x]+#39;
      CQ.Open;
      GRFC.CELLS[2,x]:=cq.Fields[0].asstring;
  end;



end;

procedure TForma.grfcDblClick(Sender: TObject);
begin
CopiarGrid(grfc);
end;

procedure TForma.SpeedButton5Click(Sender: TObject);
begin
CQ.CLOSE;
cq.sql.Text:='SELECT * from nom10007 a where a.idmovtopdo in ( '+
                  'select c.idmovtopdo FROM NOM10007 C, NOM10004 D WHERE '+
                  'C.importe1+IMPORTE2<>C.importetotal AND C.idconcepto=D.idconcepto '+
                  ' AND D.tipoconcepto='+#39+'P'+#39+
                  ' and d.numeroconcepto not  IN '+
                  '('+#39+'9000'+#39+','+#39+'9001'+#39+','+#39+'9002'+#39+'))';
Cq.Open;
obsm.clear;
while not(cq.eof) do
  begin
     obsm.Lines.Add(cq.fieldbyname('idempleado').asstring+'|'+
                    cq.fieldbyname('idconcepto').asstring+'|'+
                    cq.fieldbyname('importe1').asstring+'|'+
                    cq.fieldbyname('Importe2').asstring+'|'+
                    cq.fieldbyname('importe3').asstring+'|'+
                    cq.fieldbyname('importetotal').asstring+'|');
     cq.Next;
  end;

end;

procedure TForma.SpeedButton6Click(Sender: TObject);
begin
CQ.CLOSE;
cq.sql.Text:='update  nom10007  set  importe1=importetotal , importe3=importetotal '+
             ' where idmovtopdo in ( '+
                  'select c.idmovtopdo FROM NOM10007 C, NOM10004 D WHERE '+
                  'C.importe1+IMPORTE2<>C.importetotal AND C.idconcepto=D.idconcepto '+
                  ' AND D.tipoconcepto='+#39+'P'+#39+
                  ' and d.numeroconcepto not  IN '+
                  '('+#39+'9000'+#39+','+#39+'9001'+#39+','+#39+'9002'+#39+'))';
Cq.execsql;
end;

end.
