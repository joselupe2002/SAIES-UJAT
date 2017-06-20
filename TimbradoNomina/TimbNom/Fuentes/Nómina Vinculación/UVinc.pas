unit UVinc;

interface

uses
  Windows, Messages, StdCtrls, Buttons, Menus, Dialogs, ExtCtrls, Controls,
  FileCtrl, dxCore, dxButton, Graphics, ComCtrls, Grids, Classes, variants,
  Forms, oleServer, ExcelXP,ClipBrd, SysUtils, Comobj, ExtActns, DBXpress,
  DB, SqlExpr, FMTBcd;




type

  mygrid=class(TStringGrid)
  public
    procedure MoveColumn(FromIndex, ToIndex: Longint);
    procedure MoveRow(FromIndex, ToIndex: Longint);
  end;


type
  TForma = class(TForm)
    et: TLabel;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    barra: TProgressBar;
    pestado: TPanel;
    estadoe: TLabel;
    dxButton11: TdxButton;
    Panel7: TPanel;
    estadob: TProgressBar;
    LerrorDef: TListBox;
    openF: TOpenDialog;
    SaveF: TSaveDialog;
    PopupMenu1: TPopupMenu;
    EliminarFila1: TMenuItem;
    Panel1: TPanel;
    ofil: TOpenDialog;
    N3: TMenuItem;
    ExportardatosaExcel1: TMenuItem;
    OBSp: TMemo;
    exportarB: TSpeedButton;
    impExc: TSpeedButton;
    SpeedButton1: TSpeedButton;
    EliminarFilasSinEmpl1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    grid: TStringGrid;
    gridP: TStringGrid;
    CalcularMontosPD1: TMenuItem;
    Label11: TLabel;
    Label12: TLabel;
    TD: TLabel;
    TP: TLabel;
    CalcularMontosPDTratado1: TMenuItem;
    Label1: TLabel;
    tpt: TLabel;
    tdt: TLabel;
    Label4: TLabel;
    procedure CMAfterShow(var Msg: TMessage);
    procedure FormCreate(Sender: TObject);
    procedure gridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    Function buscaClave(cadena:string; cat:string):boolean;
    Function buscaClaveBin(cadena:string; cat:string):boolean;
     procedure AbreFile(nombre:string);
    procedure colocaReg(cad:string;laLin:integer);
    procedure AbrePrincipal(nombre:string);
    function Xls_To_StringGrid(AGrid: TStringGrid; AXLSFile: string): Boolean;
    function CopiarExcel(AGrid: TStringGrid; AXLSFile: string): Boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    Function dameDescrip(cadena:string; cat:string):string;
    procedure LLenartodalacolumnacon1Click(Sender: TObject);
    procedure copiarGrid(g:TstringGrid);
    procedure PegarConEnter(Sender: TObject);
    procedure LimpiarHoja1Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure LimpiaComas;
    procedure Buscar1Click(Sender: TObject);
    procedure seguirBuscando;
    procedure ColocaTitulosGrid;
    procedure EliminarFila1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
      procedure borra_row(sender:tobject; lin:integer);
    procedure impExcClick(Sender: TObject);
    procedure Copiar1Click(Sender: TObject);
    procedure EliminarColumna1Click(Sender: TObject);
    procedure gridColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure AbreFilePub(nombre:string);
    procedure ExportardatosaExcel1Click(Sender: TObject);
    procedure ejercicioKeyPress(Sender: TObject; var Key: Char);
    procedure descargarURL (const direccionURL, ficheroLocal : string);
    procedure InsertarFilaltimo1Click(Sender: TObject);
    procedure ejercicioExpKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton7Click(Sender: TObject);
    procedure OBSpDblClick(Sender: TObject);
    procedure EliminarFilasSinEmpl1Click(Sender: TObject);
    procedure exportarBClick(Sender: TObject);
    procedure CalcularMontosPD1Click(Sender: TObject);
    procedure CalcularMontosPDTratado1Click(Sender: TObject);
    procedure gridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
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



procedure TForma.FormCreate(Sender: TObject);
var
x:integer;
begin
XFILE:=0;
POSERROR:='';
linError:=1;
colError:=0;
portapapeles:=false;



cambios:=false;
AbrioFile:=false;




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



procedure TForma.gridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
texto:string;
x:integer;
begin


        if (pos('|'+inttostr(acol)+'|',grid.cells[grid.colcount-1,arow])>0) then
            begin
               Grid.Canvas.Brush.Color := $004BFEF5;
               grid.Canvas.Font.Color := clred;
               GRID.Canvas.Font.Style:=[fsbold];
            end
        else
            begin
               Grid.Canvas.Brush.Color := clWhite;
               grid.Canvas.Font.Color := clBlack;
               GRID.Canvas.Font.Style:=[];
            end;



        If (gdSelected in State) Then
           begin
               Grid.Canvas.Brush.Color := clgreen;
               grid.Canvas.Font.Color := clwhite;
               GRID.Canvas.Font.Style:=[fsbold];
            end;
        if  (gdFixed in State) then
            begin
               Grid.Canvas.Brush.Color := clBtnFace;
               grid.Canvas.Font.Color := clBlack;
               GRID.Canvas.Font.Style:=[fsbold];
            end;

        Grid.Canvas.FillRect(Rect);
        Texto := Grid.Cells[acol,ARow];
        DrawText( Grid.Canvas.Handle, PChar(Texto), StrLen(PChar(Texto)),Rect, DT_LEFT);

end;



procedure TForma.colocaReg(cad:string;laLin:integer);
var
cad2:string;
c:integer;
begin
   cad2:=cad;
   c:=0;
   while pos('|',cad2)>0 do
      begin
         grid.Cells[c,laLin]:=copy(cad2,1,pos('|',cad2)-1);
         cad2:=copy(cad2,pos('|',cad2)+1,length(cad2));
         {if (grid.rowcount-2)=0 then
             grid.ColCount:=grid.ColCount+1;}
         c:=c+1;
      end;
     grid.Cells[C,laLin]:=cad2;
end;


procedure  TForma.AbreFilePub(nombre:string);
var
   f: TextFile;
   sLinea: String;
   numLin:integer;
   laLinea:integer;
begin
limpiagrid(grid);
grid.RowCount:=2;
grid.ColCount:=1;
AssignFile(f, extractfiledir(paramstr(0))+'\Files\'+nombre+'.pbx');
numlin:=strtoint(copy(nombre,pos('_',nombre)+1,length(nombre)));
estadob.Position:=0;
estadob.Max:=numlin;
presEsc:=false;
Reset( F );
Lalinea:=1;
while not Eof( F ) do
  begin
    estadob.Position:=estadob.Position+1;
    estadob.Update;
    ReadLn( F, sLinea );
    colocaReg(sLinea,laLinea);
    laLinea:=LaLinea+1;
    //grid.RowCount:=grid.RowCount+1;

    Application.ProcessMessages;
    if presEsc then
                              begin
                                  estadob.Position:=0;
                                  pestado.Visible:=false;
                                  break;
                              end;

  end;
  grid.RowCount:=LaLinea+1;
  CloseFile( F );
end;


procedure TForma.AbreFile(nombre:string);
var
   f: TextFile;
   sLinea: String;
   numLin:integer;
   laLinea:integer;
begin
limpiagrid(grid);
grid.RowCount:=2;
grid.ColCount:=1;
AssignFile(f, extractfiledir(paramstr(0))+'\Files\'+nombre+'.pbx');
numlin:=strtoint(copy(nombre,pos('_',nombre)+1,length(nombre)));
et.Caption:='Abriendo Archivo';
barra.Position:=0;
barra.Max:=numLin;
ESTADOB.Max:=numlin;
estadob.Position:=0;
Reset( F );
laLinea:=1;
while not Eof( F ) do
  begin
    application.ProcessMessages;
    ReadLn( F, sLinea );
    colocaReg(sLinea,Lalinea);
    grid.RowCount:=grid.RowCount+1;
    estadob.Position:=estadob.Position+1;
    estadob.Update;
    estadoe.Caption:='Cargado Registro: '+ inttostr(grid.RowCount-1);
    pestado.Update;

   if presEsc then
       begin
           pestado.Visible:=false;
           estadob.Position:=0;
           exit;
       end;
  end;
  CloseFile( F );
end;



procedure TForma.AbrePrincipal(nombre:string);
var
   f: TextFile;
   sLinea: String;
   numLin:integer;
begin
limpiagrid(grid);
grid.RowCount:=2;
grid.ColCount:=1;
AssignFile(f, nombre);
numlin:=strtoint(copy(nombre,pos('_',nombre)+1,length(nombre)));
et.Caption:='Abriendo Archivo';
barra.Position:=0;
barra.Max:=numlin;
Reset( F );
  while not Eof( F ) do
  begin
    ReadLn( F, sLinea );
    //colocaReg(sLinea);
    grid.RowCount:=grid.RowCount+1;
    barra.Position:=barra.Position+1;
  end;
  CloseFile( F );
end;


{===============================================================================
 Se envia una cadena como 123 y el n�mero de ceros que colocara antes (4) 0000123
 ===============================================================================}
function colocaCeros(n:string;nc:integer):string;
var
x:integer;
begin
   for x:=1 to nc-length(n) do n:='0'+n;
colocaCeros:=n;
end;


procedure TForma.SpeedButton1Click(Sender: TObject);
begin

   close;
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


procedure tforma.LimpiaComas;
var
x,y:integer;
begin
   estadob.Max:=grid.rowcount-1 ;
   for x:=1 to grid.rowcount-1 do
      begin
           for y:=0 to grid.colcount-2 do
              begin
                  grid.cells[y,x]:=stringreplace(grid.cells[y,x],#39,'',[rfReplaceAll, rfIgnoreCase]);
                  grid.cells[y,x]:=stringreplace(grid.cells[y,x],'|','',[rfReplaceAll, rfIgnoreCase]);
              end;
           //Application.ProcessMessages;
           estadob.position:=estadob.position+1;
           estadoe.Caption:='Reemplazando caracteres especiales Linea: '+inttostr(x);
           pestado.Update;
      end;

end;

procedure TForma.LLenartodalacolumnacon1Click(Sender: TObject);
var
cad:string;
x:integer;
begin


if inputQuery('LLenar toda la columna con','Texto:',cad) then
   begin
      for x:=1 to grid.rowcount-1 do
          begin
              IF (grid.cells[grid.ColCount-2,x]<>'') or (habCeldas) then
                  grid.cells[colg,x]:=cad;
          end;
   end;

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
 pestado.Top:=grid.Top+((grid.Height-pestado.Height) div 2);
       pestado.left:=grid.Left+((grid.Width-pestado.Width) div 2);
       pestado.Visible:=true;
ESTADOB.position:=0;


estadoe.Caption:='Copiando registros al portapapeles';
presEsc:=false;

estadob.max:=g.rowcount-1;
for R := 0 to G.RowCount - 1 do
    begin
        for C := 0 to G.ColCount - 1 do
            begin
                cadS := cadS + stringReplace(TRIM(G.Cells[C, R]),'#13','',[rfReplaceAll]); //Aqui vamos concatenando las celdas del stringGrid.
                if C < G.ColCount - 1 then
                   cadS := cadS + TAB; //esta condici�n es para ir tabulando el las columnas de tal forma que no salgan pegadas.
            end;
        if R < G.RowCount - 1 then
           cadS := cadS + CR;


        Application.ProcessMessages;
                           if presEsc then
                              begin
                                  estadob.Position:=0;
                                  pestado.Visible:=false;
                                  break;
                              end;
        estadob.position:=estadob.position+1;
     end;
Clipboard.AsText := cadS; //Este objeto es el que hace todo el trabajo de copiar el texto ala papelera de reciclaje
Showmessage('Registros copiados --> Abra Excel y presione CTRL + V');
estadob.position:=0;
pestado.Visible:=false;
END;



procedure TForma.PegarConEnter(Sender: TObject);
var
    Value: string;
    Str: string;
    i: Integer;
    Custom: TCustomGrid;
    Celda:string;
    columna:integer;
    linea:integer;
    TotColumna:integer;
begin

        Screen.Cursor:=crHourGlass;
        Clipboard.Open;
        if not Clipboard.HasFormat(CF_Text) then Exit;
        Value := Clipboard.AsText;

        Clipboard.Close;
        Custom := TCustomGrid(GRID);
        celda:=''; columna:=0; linea:=1;
        ESTADOB.Max:=Length(Value);
        ESTADOB.Position:=0;

        for i := 1 to Length(Value) do
           begin
            if (Copy(Value, i, 1) <> #9) and (Copy(Value, i, 1) <> #13) then
               begin celda:=celda+Copy(Value, i, 1); end;

            if Copy(Value, i, 1) = #9 then
               begin
                 GRID.Cells[columna,linea]:=TRIM(celda);
                 celda:='';
                 columna:=columna+1;
               end;

             if Copy(Value, i, 1) = #13 then
               begin

                 grid.Cells[columna,linea]:=TRIM(celda);
                 celda:='';
                 totColumna:=columna;
                 columna:=0;
                 Linea:=Linea+1;

               end;
          end;
          grid.ColCount:=Totcolumna+1;
          grid.RowCount:=linea;
          ColocaTitulosGrid;
          Screen.Cursor:=crDefault;
end;


procedure TForma.LimpiarHoja1Click(Sender: TObject);
begin
limpiagrid(grid);
grid.ColCount:=1;
grid.Rowcount:=2;
limpia_linea(grid,2);
COLOCATITULOSGRID;

end;

procedure TForma.SpeedButton9Click(Sender: TObject);
begin
LLenartodalacolumnacon1Click(nil);
end;

procedure TForma.SpeedButton11Click(Sender: TObject);
begin
//copiarGrid(Grid);
end;

procedure TForma.seguirBuscando;
var
x:integer;
z,y:integer;
empiezaLin,empiezacol:integer;
haymas:boolean;
begin
    haymas:=false;
    for z:=colg+1 to grid.ColCount-2 do
        if (POS(UPPERCASE(cadBuscar),UPPERCASE(grid.cells[z,lineaG]))>0) then
            BEGIN haymas:=true; BREAK; END;
    if haymas then empiezaLin:=lineaG else  EmpiezaLin:=lineag+1;
    if haymas then empiezaCol:=Colg+1 else EmpiezaCol:=0;

 for x:=empiezalin to grid.rowcount-1 do
           for y:=empiezacol+1 to grid.colcount-2 do
               if POS(UPPERCASE(cadBuscar),UPPERCASE(grid.cells[y,x]))>0 then
                  begin
                     grid.Row:=x;
                     grid.Col:=y;
                     exit;
                  end;
end;


procedure TForma.Buscar1Click(Sender: TObject);
var
x,y:integer;
begin
if inputQuery('Buscar una cade de Texto','Texto a buscar:',cadBuscar) then
   begin
       for x:=lineag to grid.rowcount-1 do
           for y:=colg+1 to grid.colcount-2 do
               if POS(UPPERCASE(cadBuscar),UPPERCASE(grid.cells[y,x]))>0 then
                  begin
                     grid.Row:=x;
                     grid.Col:=y;
                     exit;
                  end;
   end;

end;

procedure TForma.ColocaTitulosGrid;
begin


         grid.Cells[0,0]:='No. Empleado';
         grid.Cells[1,0]:='NOMBRE';
         grid.Cells[2,0]:='SAL.DIARIO';
         grid.Cells[3,0]:='SUELDO'; //Cve: 5001
         grid.Cells[4,0]:='SUBSIDIO'; //Cve: 5002
         grid.Cells[5,0]:='OTRAS PERCEP';  //Cve: 5003
         grid.Cells[6,0]:='TOTAL PERCEP';
         grid.Cells[7,0]:='IMSS'; //CVE:2001
         grid.Cells[8,0]:='I.S.R'; //CVE: 2002
         grid.Cells[9,0]:='INFORMAVIT'; //CVE:2003
         grid.Cells[10,0]:='TOT.DED.';
         grid.Cells[11,0]:='EFECTIVO';
         grid.Cells[12,0]:='SEG. SOC.';
         grid.Cells[13,0]:='CUENTA';
         grid.Cells[14,0]:='CURP';
         grid.Cells[15,0]:='RFC';
         grid.Cells[16,0]:='PERIODO';
         grid.Cells[17,0]:='TIPONOMINA';


         gridp.Cells[0,0]:='No. Empleado';
         gridp.Cells[1,0]:='RFC';
         gridp.Cells[2,0]:='CURP';
         gridp.Cells[3,0]:='CORREO';
         gridp.Cells[4,0]:='CVE PUESTO';
         gridp.Cells[5,0]:='PUESTO';
         gridp.Cells[6,0]:='NUMERO SEGURO SOCIAL';
         gridp.Cells[7,0]:='SEXO';
         gridp.Cells[8,0]:='FECHA INGRESO';
         gridp.Cells[9,0]:='FONDO';
         gridp.Cells[10,0]:='AP_PATERNO';
         gridp.Cells[11,0]:='AP_MATERNO';
         gridp.Cells[12,0]:='NOMBRE';
         gridp.Cells[13,0]:='CVE_CONCEPTO';
         gridp.Cells[14,0]:='DESC_CONCEPTO';
         gridp.Cells[15,0]:='MONTO';
         gridp.Cells[16,0]:='GRAVADO/EXENTO';
         gridp.Cells[17,0]:='PERCEP/DEDUC';

end;

procedure TForma.EliminarFila1Click(Sender: TObject);
begin
 if Application.MessageBox('�Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
             borra_row(GRID,lineaG);

end;

procedure TForma.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key =27 then
     BEGIN presEsc:=true; end;

end;


{===============================================================================
Convierte una cadena a flotante, pero antes remplaza las 2,345.56 = 2345.56
 ===============================================================================}
function strtofloatTes(c:string):real;
begin
  c:=StringReplace(c,',','',[rfReplaceAll]);
  c:=StringReplace(c,'$','',[rfReplaceAll]);
  strtofloatTes:=strtofloat(c);
end;



Function SumaColGridCond(g:TstringGrid;Col:Integer;colCond:integer;valor:string):real;
var x:integer;
sum:real;
val:real;
begin
   sum:=0;
   for x:=1 to g.rowcount-1 do
      begin
         try val:=strtofloatTes(g.cells[col,x]) except val:=0; end;
         if g.cells[colCond,x]=valor then
            sum:=sum+val;
      end;
SumaColGridCond:=sum;
end;


Function SumaColGrid(g:TstringGrid;Col:Integer):real;
var x:integer;
sum:real;
val:real;
begin
   sum:=0;
   for x:=1 to g.rowcount-1 do
      begin
         try val:=strtofloatTes(g.cells[col,x]) except val:=0; end;
         sum:=sum+val;
      end;
SumaColGrid:=sum;
end;




procedure TForma.impExcClick(Sender: TObject);
var
x:integer;

begin

if ofil.Execute then
   begin
     pestado.Top:=grid.Top+((grid.Height-pestado.Height) div 2);
     pestado.left:=grid.Left+((grid.Width-pestado.Width) div 2);
     pestado.Visible:=true;
     estadob.Position:=0;



     Screen.Cursor:=crHourGlass;
     Application.ProcessMessages;

     estadoe.caption := 'Procesando acci�n ...';
     estadoe.Update;
     estadoe.caption := 'Copiando registros a memoria...';
     estadoe.Update;

     CopiarExcel(grid, ofil.FileName);


     estadoe.caption := 'Descargando datos en la aplicaci�n...';
     estadoe.Update;

     PegarConEnter(NIL);
     for x:=1 to grid.rowcount-1 do
        grid.cells[0,x]:=trim(grid.cells[0,x]);

     borra_row(forma.GRID,1);




     Screen.Cursor:=crDefault;


     pestado.Visible:=false;



     eliminaVacio(grid);
     ColocaTitulosGrid;

     tp.caption:=formatfloat('#,#0.00',SumaColGrid(grid,6));
     td.caption:=formatfloat('#,#0.00',SumaColGrid(grid,10));

   end;
end;

procedure TForma.Copiar1Click(Sender: TObject);
begin
Clipboard.AsText := grid.Cells[colg,lineag];
end;

procedure EliminarColumna(Grid: TStringGrid; Columna: Integer);
var
  i: integer;
begin
  if (Columna >= 0) and (Columna < Grid.ColCount)  then
  begin
    for i:= Columna to Grid.ColCount - 2 do
      Grid.Cols[i].Assign(Grid.Cols[i+1]);
    Grid.ColCount:= Grid.ColCount - 1;
  end;
end;

procedure TForma.EliminarColumna1Click(Sender: TObject);
begin
if Application.MessageBox('�Seguro que desea Borrar la Columna Completa?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
   begin
      EliminarColumna(grid,colg);
      colocaTitulosGrid;
   end;
end;

procedure TForma.gridColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
colocaTitulosGrid;
end;

procedure TForma.BitBtn1Click(Sender: TObject);
begin
       grid.Hint:='La clave de municipio no es valida';
       grid.ShowHint:=true;
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

procedure TForma.ExportardatosaExcel1Click(Sender: TObject);
begin
copiarGrid(gridp);
end;

procedure TForma.ejercicioKeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure TForma.InsertarFilaltimo1Click(Sender: TObject);
begin
grid.RowCount:=grid.RowCount+1;
grid.Row:=grid.RowCount-1;

end;

function numero(var key:char):char;
begin
  if key in ['0'..'9',#8,'.',#13] then numero:=key else numero:=#7;
end;

procedure TForma.ejercicioExpKeyPress(Sender: TObject; var Key: Char);
begin
key:=numero(key);
end;

procedure TForma.SpeedButton7Click(Sender: TObject);
var
x,y,z:integer;
empiezaLin,empiezaCol:integer;
HAYERROR:BOOLEAN;
begin
    hayerror:=false;
    for z:=colg-1 DOWNto 0 do
        if (pos('|'+inttostr(z)+'|',grid.cells[grid.colcount-1,lineaG])>0) then
            BEGIN hayerror:=true; BREAK; END;
    if hayerror then empiezaLin:=lineaG else  EmpiezaLin:=lineag-1;
    if hayerror then empiezaCol:=Colg-1 else EmpiezaCol:=GRID.ColCount-2;

for x:=empiezaLin DOWNto 1 do
   begin
       for y:=empiezaCol DOWNto 0 do
          begin
              if (pos('|'+inttostr(y)+'|',grid.cells[grid.colcount-1,x])>0) then
                 begin
                      grid.Col:=y;
                      grid.Row:=x;
                      exit;
                 end;
          end;
   end;
end;

procedure TForma.OBSpDblClick(Sender: TObject);
begin
ObsP.Align:=alBottom;
IF OBSP.Height=20 THEN
   obsp.Height:=200
else
    obsp.Height:=20;
end;

procedure TForma.EliminarFilasSinEmpl1Click(Sender: TObject);
var
x:integer;
begin
   pestado.Top:=grid.Top+((grid.Height-pestado.Height) div 2);
   pestado.left:=grid.Left+((grid.Width-pestado.Width) div 2);
   pestado.Visible:=true;
   estadob.Position:=0;
   estadoe.caption := 'Eliminando Filas vacias ...';
   estadoe.Update;


X:=1;
while (x<=grid.RowCount+1) do
   begin
      if grid.cells[0,x]='' then
            begin
               borra_row(GRID,x);
               x:=x+1;
            end;
      estadob.Position:=estadob.Position+1;
      x:=x+1;
   end;

   pestado.Visible:=false;
   tp.caption:=formatfloat('#,#0.00',SumaColGrid(grid,6));
     td.caption:=formatfloat('#,#0.00',SumaColGrid(grid,10));

end;

procedure TForma.exportarBClick(Sender: TObject);
var
x,y:integer;
cad,appat,apmat,nombre:string;
eldato:real;
begin
   GRIDP.ColCount:=18;
   pestado.Top:=grid.Top+((grid.Height-pestado.Height) div 2);
   pestado.left:=grid.Left+((grid.Width-pestado.Width) div 2);
   pestado.Visible:=true;
   estadob.Position:=0;
   estadoe.caption := 'Convirtiendo archivo ...';
   estadoe.Update;
   estadob.Max:=grid.RowCount-1;

   for x:=1 to grid.RowCount-1 do
      begin
           cad:=grid.Cells[1,x];
           appat:=copy(cad,1,pos(' ',cad));
           cad:=copy(cad,pos(' ',cad)+1,length(cad));
           apmat:=copy(cad,1,pos(' ',cad));
           cad:=copy(cad,pos(' ',cad)+1,length(cad));
           nombre:=cad;

           //Registro Sueldo Diario
           gridp.Cells[0,gridp.Rowcount-1]:=grid.Cells[0,x];
           gridp.Cells[1,gridp.Rowcount-1]:=grid.Cells[15,x];
           gridp.Cells[2,gridp.Rowcount-1]:=grid.Cells[14,x];
           //gridp.Cells[3,gridp.Rowcount-1]:= grid.Cells[18,x]; //correo electronico
           gridp.Cells[4,gridp.Rowcount-1]:='V';
           gridp.Cells[5,gridp.Rowcount-1]:='VINCUL';
           gridp.Cells[6,gridp.Rowcount-1]:=grid.Cells[12,x];
           gridp.Cells[7,gridp.Rowcount-1]:='M';
           gridp.Cells[8,gridp.Rowcount-1]:='01/01/2015';
           gridp.Cells[9,gridp.Rowcount-1]:='F';
           gridp.Cells[10,gridp.Rowcount-1]:=appat;
           gridp.Cells[11,gridp.Rowcount-1]:=apmat;
           gridp.Cells[12,gridp.Rowcount-1]:=nombre;
           gridp.Cells[13,gridp.Rowcount-1]:='5001';
           gridp.Cells[14,gridp.Rowcount-1]:='SUELDO';
           gridp.Cells[15,gridp.Rowcount-1]:=grid.Cells[3,x];
           gridp.Cells[16,gridp.Rowcount-1]:='G';
           gridp.Cells[17,gridp.Rowcount-1]:='P';
           gridp.Rowcount:=gridp.rowcount+1;

           //Registro Subsidio al empleo
           grid.Cells[4,x]:=stringreplace(grid.Cells[4,x],',','',[rfReplaceAll, rfIgnoreCase]);
           grid.Cells[4,x]:=stringreplace(grid.Cells[4,x],'$','',[rfReplaceAll, rfIgnoreCase]);
           try eldato:=strtofloat(grid.Cells[4,x]); except eldato:=0; end;
           if eldato>0 then
              begin
                 gridp.Cells[0,gridp.Rowcount-1]:=grid.Cells[0,x];
                 gridp.Cells[1,gridp.Rowcount-1]:=grid.Cells[15,x];
                 gridp.Cells[2,gridp.Rowcount-1]:=grid.Cells[14,x];
                 //gridp.Cells[3,gridp.Rowcount-1]:= grid.Cells[18,x]; //correo electronico
                 gridp.Cells[4,gridp.Rowcount-1]:='V';
                 gridp.Cells[5,gridp.Rowcount-1]:='VINCUL';
                 gridp.Cells[6,gridp.Rowcount-1]:=grid.Cells[12,x];
                 gridp.Cells[7,gridp.Rowcount-1]:='M';
                 gridp.Cells[8,gridp.Rowcount-1]:='01/01/2015';
                 gridp.Cells[9,gridp.Rowcount-1]:='F';
                 gridp.Cells[10,gridp.Rowcount-1]:=appat;
                 gridp.Cells[11,gridp.Rowcount-1]:=apmat;
                 gridp.Cells[12,gridp.Rowcount-1]:=nombre;
                 gridp.Cells[13,gridp.Rowcount-1]:='5002';
                 gridp.Cells[14,gridp.Rowcount-1]:='SUBSIDIO AL EMPLEO';
                 gridp.Cells[15,gridp.Rowcount-1]:=FLOATTOSTR(ELDATO);
                 gridp.Cells[16,gridp.Rowcount-1]:='G';
                 gridp.Cells[17,gridp.Rowcount-1]:='P';
                 gridp.Rowcount:=gridp.rowcount+1;
              end;

           //Registro oTRAS Percepciones
           grid.Cells[5,x]:=stringreplace(grid.Cells[5,x],',','',[rfReplaceAll, rfIgnoreCase]);
           grid.Cells[5,x]:=stringreplace(grid.Cells[5,x],'$','',[rfReplaceAll, rfIgnoreCase]);
           try eldato:=strtofloat(grid.Cells[5,x]); except eldato:=0; end;
           if eldato>0 then
              begin
                 gridp.Cells[0,gridp.Rowcount-1]:=grid.Cells[0,x];
                 gridp.Cells[1,gridp.Rowcount-1]:=grid.Cells[15,x];
                 gridp.Cells[2,gridp.Rowcount-1]:=grid.Cells[14,x];
                 //gridp.Cells[3,gridp.Rowcount-1]:= grid.Cells[18,x]; //correo electronico
                 gridp.Cells[4,gridp.Rowcount-1]:='V';
                 gridp.Cells[5,gridp.Rowcount-1]:='VINCUL';
                 gridp.Cells[6,gridp.Rowcount-1]:=grid.Cells[12,x];
                 gridp.Cells[7,gridp.Rowcount-1]:='M';
                 gridp.Cells[8,gridp.Rowcount-1]:='01/01/2015';
                 gridp.Cells[9,gridp.Rowcount-1]:='F';
                 gridp.Cells[10,gridp.Rowcount-1]:=appat;
                 gridp.Cells[11,gridp.Rowcount-1]:=apmat;
                 gridp.Cells[12,gridp.Rowcount-1]:=nombre;
                 gridp.Cells[13,gridp.Rowcount-1]:='5003';
                 gridp.Cells[14,gridp.Rowcount-1]:='OTRAS PERCEPCIONES';
                 gridp.Cells[15,gridp.Rowcount-1]:=FLOATTOSTR(ELDATO);
                 gridp.Cells[16,gridp.Rowcount-1]:='G';
                 gridp.Cells[17,gridp.Rowcount-1]:='P';
                 gridp.Rowcount:=gridp.rowcount+1;
              end;

           //Registro IMSS
           grid.Cells[7,x]:=stringreplace(grid.Cells[7,x],',','',[rfReplaceAll, rfIgnoreCase]);
           grid.Cells[7,x]:=stringreplace(grid.Cells[7,x],'$','',[rfReplaceAll, rfIgnoreCase]);
           try eldato:=strtofloat(grid.Cells[7,x]); except eldato:=0; end;
           if eldato>0 then
              begin
                 gridp.Cells[0,gridp.Rowcount-1]:=grid.Cells[0,x];
                 gridp.Cells[1,gridp.Rowcount-1]:=grid.Cells[15,x];
                 gridp.Cells[2,gridp.Rowcount-1]:=grid.Cells[14,x];
                 //gridp.Cells[3,gridp.Rowcount-1]:= grid.Cells[18,x]; //correo electronico
                 gridp.Cells[4,gridp.Rowcount-1]:='V';
                 gridp.Cells[5,gridp.Rowcount-1]:='VINCUL';
                 gridp.Cells[6,gridp.Rowcount-1]:=grid.Cells[12,x];
                 gridp.Cells[7,gridp.Rowcount-1]:='M';
                 gridp.Cells[8,gridp.Rowcount-1]:='01/01/2015';
                 gridp.Cells[9,gridp.Rowcount-1]:='F';
                 gridp.Cells[10,gridp.Rowcount-1]:=appat;
                 gridp.Cells[11,gridp.Rowcount-1]:=apmat;
                 gridp.Cells[12,gridp.Rowcount-1]:=nombre;
                 gridp.Cells[13,gridp.Rowcount-1]:='2001';
                 gridp.Cells[14,gridp.Rowcount-1]:='IMSS';
                 gridp.Cells[15,gridp.Rowcount-1]:=FLOATTOSTR(ELDATO);
                 gridp.Cells[16,gridp.Rowcount-1]:='G';
                 gridp.Cells[17,gridp.Rowcount-1]:='D';
                 gridp.Rowcount:=gridp.rowcount+1;
              end;

           //Registro IMSS
           grid.Cells[8,x]:=stringreplace(grid.Cells[8,x],',','',[rfReplaceAll, rfIgnoreCase]);
           grid.Cells[8,x]:=stringreplace(grid.Cells[8,x],'$','',[rfReplaceAll, rfIgnoreCase]);
           try eldato:=strtofloat(grid.Cells[8,x]); except eldato:=0; end;
           if eldato>0 then
              begin
                 gridp.Cells[0,gridp.Rowcount-1]:=grid.Cells[0,x];
                 gridp.Cells[1,gridp.Rowcount-1]:=grid.Cells[15,x];
                 gridp.Cells[2,gridp.Rowcount-1]:=grid.Cells[14,x];
                 //gridp.Cells[3,gridp.Rowcount-1]:= grid.Cells[18,x]; //correo electronico
                 gridp.Cells[4,gridp.Rowcount-1]:='V';
                 gridp.Cells[5,gridp.Rowcount-1]:='VINCUL';
                 gridp.Cells[6,gridp.Rowcount-1]:=grid.Cells[12,x];
                 gridp.Cells[7,gridp.Rowcount-1]:='M';
                 gridp.Cells[8,gridp.Rowcount-1]:='01/01/2015';
                 gridp.Cells[9,gridp.Rowcount-1]:='F';
                 gridp.Cells[10,gridp.Rowcount-1]:=appat;
                 gridp.Cells[11,gridp.Rowcount-1]:=apmat;
                 gridp.Cells[12,gridp.Rowcount-1]:=nombre;
                 gridp.Cells[13,gridp.Rowcount-1]:='2002';
                 gridp.Cells[14,gridp.Rowcount-1]:='I.S.R.';
                 gridp.Cells[15,gridp.Rowcount-1]:=FLOATTOSTR(ELDATO);
                 gridp.Cells[16,gridp.Rowcount-1]:='G';
                 gridp.Cells[17,gridp.Rowcount-1]:='D';
                 gridp.Rowcount:=gridp.rowcount+1;
              end;

              //Registro IMSS
           grid.Cells[9,x]:=stringreplace(grid.Cells[9,x],',','',[rfReplaceAll, rfIgnoreCase]);
           grid.Cells[9,x]:=stringreplace(grid.Cells[9,x],'$','',[rfReplaceAll, rfIgnoreCase]);
           try eldato:=strtofloat(grid.Cells[9,x]); except eldato:=0; end;
           if eldato>0 then
              begin
                 gridp.Cells[0,gridp.Rowcount-1]:=grid.Cells[0,x];
                 gridp.Cells[1,gridp.Rowcount-1]:=grid.Cells[15,x];
                 gridp.Cells[2,gridp.Rowcount-1]:=grid.Cells[14,x];
                 //gridp.Cells[3,gridp.Rowcount-1]:= grid.Cells[18,x]; //correo electronico
                 gridp.Cells[4,gridp.Rowcount-1]:='V';
                 gridp.Cells[5,gridp.Rowcount-1]:='VINCUL';
                 gridp.Cells[6,gridp.Rowcount-1]:=grid.Cells[12,x];
                 gridp.Cells[7,gridp.Rowcount-1]:='M';
                 gridp.Cells[8,gridp.Rowcount-1]:='01/01/2015';
                 gridp.Cells[9,gridp.Rowcount-1]:='F';
                 gridp.Cells[10,gridp.Rowcount-1]:=appat;
                 gridp.Cells[11,gridp.Rowcount-1]:=apmat;
                 gridp.Cells[12,gridp.Rowcount-1]:=nombre;
                 gridp.Cells[13,gridp.Rowcount-1]:='2003';
                 gridp.Cells[14,gridp.Rowcount-1]:='AMORT. INFONAVIT';
                 gridp.Cells[15,gridp.Rowcount-1]:=FLOATTOSTR(ELDATO);
                 gridp.Cells[16,gridp.Rowcount-1]:='G';
                 gridp.Cells[17,gridp.Rowcount-1]:='D';
                 gridp.Rowcount:=gridp.rowcount+1;
              end;

           estadob.Position:= estadob.Position+1;

      end;
    pestado.Visible:=false;
     tpt.caption:=formatfloat('#,#0.00',SumaColGridCond(gridp,15,17,'P'));
     tdt.caption:=formatfloat('#,#0.00',SumaColGridCond(gridp,15,17,'D'));
end;





procedure TForma.CalcularMontosPD1Click(Sender: TObject);
begin
     tp.caption:=formatfloat('#,#0.00',SumaColGrid(grid,6));
     td.caption:=formatfloat('#,#0.00',SumaColGrid(grid,10));
end;

procedure TForma.CalcularMontosPDTratado1Click(Sender: TObject);
begin
     tpt.caption:=formatfloat('#,#0.00',SumaColGridCond(gridp,15,17,'P'));
     tdt.caption:=formatfloat('#,#0.00',SumaColGridCond(gridp,15,17,'D'));
end;

procedure TForma.gridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
lineaG:=Arow;
ColG:=Acol;
et.caption:='Col: '+inttostr(ColG+1)+' Lin: '+inttostr(lineaG);
end;

end.
