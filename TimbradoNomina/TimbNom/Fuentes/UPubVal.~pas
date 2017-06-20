unit UPubVal;

interface

uses
  Windows, Messages, StdCtrls, Buttons, Menus, Dialogs, ExtCtrls, Controls,
  FileCtrl, dxCore, dxButton, Graphics, ComCtrls, Grids, Classes, variants,
  Forms, oleServer, ExcelXP,ClipBrd, SysUtils, Comobj, ExtActns, DBXpress,
  DB, SqlExpr, FMTBcd, StrUtils, acPNG;




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
    grid: TStringGrid;
    barra: TProgressBar;
    PRem: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dxButton3: TdxButton;
    Panel2: TPanel;
    dxButton4: TdxButton;
    ncol: TEdit;
    old: TEdit;
    new: TEdit;
    dxButton5: TdxButton;
    Server: TEdit;
    ppas: TPanel;
    Label7: TLabel;
    Label9: TLabel;
    CAMBPAS: TSpeedButton;
    Label10: TLabel;
    dxButton1: TdxButton;
    Panel4: TPanel;
    dxButton6: TdxButton;
    pasant: TEdit;
    pasnuevo: TEdit;
    pascon: TEdit;
    npaq: TEdit;
    pestado: TPanel;
    estadoe: TLabel;
    dxButton11: TdxButton;
    Panel7: TPanel;
    estadob: TProgressBar;
    LerrorDef: TListBox;
    openF: TOpenDialog;
    SaveF: TSaveDialog;
    PopupMenu1: TPopupMenu;
    Reemplazar1: TMenuItem;
    Buscar1: TMenuItem;
    LLenartodalacolumnacon1: TMenuItem;
    EliminarFila1: TMenuItem;
    LimpiarHoja1: TMenuItem;
    N1: TMenuItem;
    ConfigurarServidordeEnvio1: TMenuItem;
    CambiarPassword1: TMenuItem;
    Menu: TPanel;
    Panel1: TPanel;
    PVAL: TPanel;
    pen: TLabel;
    FilPrueba: TListBox;
    filgen: TListBox;
    log: TEdit;
    cla: TEdit;
    SpeedButton19: TSpeedButton;
    ofil: TOpenDialog;
    Copiar1: TMenuItem;
    N3: TMenuItem;
    EliminarColumna1: TMenuItem;
    PAbrir: TPanel;
    TAbrir: TLabel;
    impExc: TSpeedButton;
    PfUN: TPanel;
    Tfun: TLabel;
    logo: TImage;
    SpeedButton1: TSpeedButton;
    ConfServer: TSpeedButton;
    ETB: TLabel;
    CerrarB: TSpeedButton;
    ExportardatosaExcel1: TMenuItem;
    InsertarFilaltimo1: TMenuItem;
    exportarB: TSpeedButton;
    ChangePas: TSpeedButton;
    PPeriodo: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    savetoBD: TSpeedButton;
    dxButton2: TdxButton;
    Panel5: TPanel;
    dxButton7: TdxButton;
    ejercicio: TEdit;
    Mes: TComboBox;
    BDSQL: TSQLConnection;
    CQ: TSQLQuery;
    BDFire: TSQLConnection;
    q: TSQLQuery;
    SpeedButton4: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label16: TLabel;
    validado: TLabel;
    Label19: TLabel;
    nerror: TLabel;
    err: TMemo;
    AUX: TSQLQuery;
    OBSp: TMemo;
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
    N: TSQLQuery;
    Label11: TLabel;
    Label12: TLabel;
    TP: TLabel;
    TD: TLabel;
    CalcularPd1: TMenuItem;
    Label13: TLabel;
    TPE: TLabel;
    TDE: TLabel;
    Label20: TLabel;
    ExportarRegistrosconError1: TMenuItem;
    IgualarFechasdeRFCyCRUP1: TMenuItem;
    IgualarRFCCURPPORNoEmpl1: TMenuItem;
    Image1: TImage;
    procedure CMAfterShow(var Msg: TMessage);
    procedure FormCreate(Sender: TObject);
    procedure gridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure gridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    Function buscaClave(cadena:string; cat:string):boolean;
    Function buscaClaveBin(cadena:string; cat:string):boolean;
    procedure dxButton4Click(Sender: TObject);
    procedure dxButton5Click(Sender: TObject);
     procedure AbreFile(nombre:string);
    procedure colocaReg(cad:string;laLin:integer);
    procedure AbrePrincipal(nombre:string);
    function Xls_To_StringGrid(AGrid: TStringGrid; AXLSFile: string): Boolean;
    function CopiarExcel(AGrid: TStringGrid; AXLSFile: string): Boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    Function dameDescrip(cadena:string; cat:string):string;
    procedure Reemplazar1Click(Sender: TObject);
    procedure LLenartodalacolumnacon1Click(Sender: TObject);
    procedure copiarGrid(g:TstringGrid);
    procedure PegarConEnter(Sender: TObject);
    procedure LimpiarHoja1Click(Sender: TObject);
    procedure ConfigurarServidordeEnvio1Click(Sender: TObject);
    procedure CambiarPassword1Click(Sender: TObject);
    procedure dxButton6Click(Sender: TObject);
    procedure CAMBPASClick(Sender: TObject);
    procedure pasconKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure ChangePasClick(Sender: TObject);
    procedure ConfServerClick(Sender: TObject);
    procedure NmeroderegistroxPaquete1Click(Sender: TObject);
    procedure LimpiaComas;
    procedure Buscar1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure seguirBuscando;
    procedure ColocaTitulosGrid;
    procedure EliminarFila1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
      procedure borra_row(sender:tobject; lin:integer);
      procedure cargarConfig;
    procedure SpeedButton19Click(Sender: TObject);
    procedure impExcClick(Sender: TObject);
    procedure Label12DblClick(Sender: TObject);
    procedure MenuExit(Sender: TObject);
    procedure Copiar1Click(Sender: TObject);
    procedure EliminarColumna1Click(Sender: TObject);
    procedure gridColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure AbreFilePub(nombre:string);
    procedure ExportardatosaExcel1Click(Sender: TObject);
    procedure ejercicioKeyPress(Sender: TObject; var Key: Char);
    procedure descargarURL (const direccionURL, ficheroLocal : string);
    procedure cerrarPub;
    procedure InsertarFilaltimo1Click(Sender: TObject);
    procedure exportarBClick(Sender: TObject);
    procedure dxButton7Click(Sender: TObject);
    procedure savetoBDClick(Sender: TObject);
    procedure ejercicioExpKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton4Click(Sender: TObject);
    procedure validar(linea:integer; columna:integer; all:boolean);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure gridSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure OBSpDblClick(Sender: TObject);
    procedure validadoDblClick(Sender: TObject);
    procedure CalcularPd1Click(Sender: TObject);
    procedure ExportarRegistrosconError1Click(Sender: TObject);
    procedure copiarGridconError(g:TstringGrid);
    Procedure ChecarRepetido(mensaje:string;CampoK:string; campo:string;etiqueta:string);
    Procedure UnirRepetido(mensaje:string;CampoK:string; campo:string;etiqueta:string);
    procedure exportarDatos;
    procedure IgualarFechasdeRFCyCRUP1Click(Sender: TObject);
    procedure IgualarRFCCURPPORNoEmpl1Click(Sender: TObject);
    procedure IgualarCampos(ColumnaPadre:integer; ColumnaCompara:integer; MSG:STRING);
    procedure recalculaFondo;
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

pfun.Align:=altop;

cambios:=false;
AbrioFile:=false;

logo.Top:=menu.Height-logo.Height-10;


//Abrimos la base de Firebird
  BDFire.Close;
  BDFire.Params.ValueFromIndex[1]:=extractfileDir(paramstr(0))+'\base\DBIMPORT.FDB';
  BDFire.open;


end;

procedure TForma.gridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
  var
  listaE:TstringList;
x,z:integer;
hayerror:boolean;
begin
lineaG:=Arow;
ColG:=Acol;
et.caption:='Col: '+inttostr(ColG+1)+' Lin: '+inttostr(lineaG);

if (pos('|'+inttostr(acol)+'|',grid.cells[grid.colcount-1,arow])>0) then
    begin
       ListaE:=TstringList.create();
       listaE.Text:=grid.Cells[grid.ColCount-2,lineaG];
       //err.Visible:=true;
       err.Text:='';
       for x:=0 to listaE.count-1 do
          begin
              if strtoint(copy(listae.Strings[x],1,pos(')',listae.Strings[x])-1))=acol+1 then
                 err.Lines.Add(listae.Strings[x]);
          end;
       grid.Hint:=err.text;
       grid.ShowHint:=true;
    end;

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



procedure TForma.dxButton4Click(Sender: TObject);
begin
prem.Visible:=false;
end;

procedure TForma.dxButton5Click(Sender: TObject);
var
x:integer;
begin
    for x:=1 to grid.RowCount-1 do
       begin
          if grid.Cells[strtoint(ncol.Text),x]=old.Text then
                   grid.Cells[strtoint(ncol.Text),x]:=new.Text;
       end;
    pRem.Visible:=false;
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

procedure TForma.Reemplazar1Click(Sender: TObject);
begin
   pRem.Top:=grid.Top+((grid.Height-prem.Height) div 2);
   pRem.left:=grid.Left+((grid.Width-prem.Width) div 2);
   ncol.Text:=inttostr(colg);
   old.Text:=grid.cells[colg,lineag];
   new.Text:='';
   prem.Visible:=true;
   NEW.SetFocus;
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
        for C := 0 to G.ColCount - 3 do
            begin
                cadS := cadS + stringReplace(TRIM(G.Cells[C, R]),'#13','',[rfReplaceAll]); //Aqui vamos concatenando las celdas del stringGrid.
                if C < G.ColCount - 1 then
                   cadS := cadS + TAB; //esta condición es para ir tabulando el las columnas de tal forma que no salgan pegadas.
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

procedure TForma.ConfigurarServidordeEnvio1Click(Sender: TObject);

begin
ConfServerClick(nil);
end;

procedure TForma.CambiarPassword1Click(Sender: TObject);
begin
  ppas.Top:=grid.Top+((grid.Height-ppas.Height) div 2);
  ppas.left:=grid.Left+((grid.Width-ppas.Width) div 2);
  PPAS.Visible:=TRUE;
  pasant.SetFocus;
end;

procedure TForma.dxButton6Click(Sender: TObject);
begin
ppas.Visible:=false;
end;





procedure TForma.CAMBPASClick(Sender: TObject);
begin
   if pasant.text=cla.text then
      begin
         if pasnuevo.text<>'' then
             begin
                if pasnuevo.text=pascon.text then
                   begin
                        filgen.Items[6]:=Encriptar(pasnuevo.text);
                        filgen.Items.SaveToFile(extractfiledir(paramstr(0))+'\Config.dll');
                        log.text:=pasnuevo.text;
                        SHOWMESSAGE('El password se cambio correctamente');
                        pasnuevo.Clear;
                        pasant.Clear;
                        pascon.Clear;
                        ppas.Visible:=false;
                   end
                else
                  begin
                      showmessage('El password nuevo con la confirmación no coincide');
                      pasnuevo.setfocus;
                  end;
             end
         else
            begin
               showmessage('El password nuevo no puede estar vacio');
               pasnuevo.setfocus;
            end;
      end
   else
      begin
         showmessage('El password anterior no es correcto');
         pasant.SetFocus;
      end;
end;

procedure TForma.pasconKeyPress(Sender: TObject; var Key: Char);
begin
   IF KEY=#13 THEN
        CAMBPASClick(NIL);
end;

procedure TForma.cerrarPub;
begin
   limpiagrid(grid);
   grid.RowCount:=2;
   grid.ColCount:=1;
   pval.Enabled:=false;
   exportarB.enabled:=false;
   cerrarB.enabled:=false;
   ETB.Visible:=FALSE;
   ColocaTitulosGrid;
   abrioFile:=false;
   CAMBIOS:=FALSE;

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

procedure TForma.SpeedButton9Click(Sender: TObject);
begin
LLenartodalacolumnacon1Click(nil);
end;

procedure TForma.SpeedButton11Click(Sender: TObject);
begin
//copiarGrid(Grid);
end;

procedure TForma.ChangePasClick(Sender: TObject);
begin
CambiarPassword1Click(NIL);
end;

procedure TForma.ConfServerClick(Sender: TObject);
begin
  pserver.Top:=grid.Top+((grid.Height-ppas.Height) div 2);
  pserver.left:=grid.Left+((grid.Width-ppas.Width) div 2);
  pserver.Visible:=TRUE;
  numRegPaq.SetFocus;
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

procedure TForma.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin


if ( Shift = [ ssctrl ] ) and ( Key =70  ) THEN
    buscar1Click(nil);
if ( Shift = [ ssctrl ] ) and ( Key =82  ) THEN
    Reemplazar1Click(nil);
if ( Key =114  ) THEN
    seguirBuscando;

end;

procedure TForma.ColocaTitulosGrid;
begin


         grid.Cells[0,0]:='No. Empleado';
         grid.Cells[1,0]:='RFC';
         grid.Cells[2,0]:='CURP';
         grid.Cells[3,0]:='CORREO';
         grid.Cells[4,0]:='CVE PUESTO';
         grid.Cells[5,0]:='PUESTO';
         grid.Cells[6,0]:='NUMERO SEGURO SOCIAL';
         grid.Cells[7,0]:='SEXO';
         grid.Cells[8,0]:='FECHA INGRESO';
         grid.Cells[9,0]:='FONDO';
         grid.Cells[10,0]:='AP_PATERNO';
         grid.Cells[11,0]:='AP_MATERNO';
         grid.Cells[12,0]:='NOMBRE';
         grid.Cells[13,0]:='CVE_CONCEPTO';
         grid.Cells[14,0]:='DESC_CONCEPTO';
         grid.Cells[15,0]:='MONTO';
         grid.Cells[16,0]:='GRAVADO/EXENTO';
         grid.Cells[17,0]:='PERCEP/DEDUC';
         grid.Cells[18,0]:='SLDO. DIARIO';
         grid.Cells[19,0]:='FORMA PAGO';

end;

procedure TForma.EliminarFila1Click(Sender: TObject);
begin
 if Application.MessageBox('¿Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
             borra_row(GRID,lineaG);

end;

procedure TForma.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key =27 then
     BEGIN presEsc:=true; end;

end;


procedure TForma.SpeedButton19Click(Sender: TObject);
begin
MENU.Visible:=NOT(MENU.Visible);
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

     estadoe.caption := 'Procesando acción ...';
     estadoe.Update;
     estadoe.caption := 'Copiando registros a memoria...';
     estadoe.Update;

     CopiarExcel(grid, ofil.FileName);


     estadoe.caption := 'Descargando datos en la aplicación...';
     estadoe.Update;

     PegarConEnter(NIL);
     for x:=1 to grid.rowcount-1 do
        grid.cells[0,x]:=trim(grid.cells[0,x]);

     borra_row(forma.GRID,1);




     Screen.Cursor:=crDefault;


     pestado.Visible:=false;
     menu.visible:=false;
     PVAL.Enabled:=true;

     eliminaVacio(grid);
     ColocaTitulosGrid;
     grid.ColCount:=grid.ColCount+2;
     grid.CellS[grid.ColCount-2,0]:='OBSERVACIONES';
     grid.CellS[grid.ColCount-1,0]:='ERRORES';


     tp.caption:=formatfloat('#,#0.00',SumaColGridCond(grid,15,17,'P'));
     td.caption:=formatfloat('#,#0.00',SumaColGridCond(grid,15,17,'D'));
   end;
end;

procedure TForma.Label12DblClick(Sender: TObject);
begin
       pestado.Visible:=false;
       menu.visible:=false;
end;

procedure TForma.MenuExit(Sender: TObject);
begin
MENU.Visible:=FALSE;
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
if Application.MessageBox('¿Seguro que desea Borrar la Columna Completa?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
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
copiarGrid(grid);
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

procedure TForma.exportarBClick(Sender: TObject);
begin
if validado.caption='S' then
  begin
      PPeriodo.Top:=grid.Top+((grid.Height-ppas.Height) div 2);
      PPeriodo.left:=grid.Left+((grid.Width-ppas.Width) div 2);
      PPeriodo.Visible:=TRUE;

      ejercicio.Text:=formatdatetime('YYYY',Now);
      MES.Text:=formatdatetime('MM',Now);
  end
else
   showmessage('El archivo a exportar parece tener errores favor de verificarlos');
 


end;

procedure TForma.dxButton7Click(Sender: TObject);
begin
pperiodo.Visible:=false;
end;


Procedure TForma.ChecarRepetido(mensaje:string;CampoK:string; campo:string;etiqueta:string);

begin
   q.close;
   q.SQL.text:=' SELECT * FROM (SELECT J.'+campok+',  COUNT(*) AS REP FROM ('+
                    ' SELECT S.'+campok+' AS '+campok+', S.'+campo+' AS '+Campo+', COUNT(*) AS NUM '+
                    ' FROM NOMINAS S WHERE  S.'+campo+' IS NOT NULL '+
                    ' AND S.MES='+#39+STR_(MES.TEXT,'-')+#39+' AND S.EJERCICIO='+#39+EJERCICIO.TEXT+#39+
                    ' GROUP BY S.'+campok+', S.'+CAMPO+') J '+
                    ' GROUP BY J.'+campok+') WHERE  REP>1  ';
   Q.open;
   while not (q.Eof) do
       begin
          obsp.lines.add(':ERROR:'+mensaje+q.fields[0].asstring+' Tiene diferentes '+etiqueta);
          q.Next;

       end;

end;


Procedure TForma.UnirRepetido(mensaje:string;CampoK:string; campo:string;etiqueta:string);
var
elValor:string;
elValor2:string;
begin
      estadob.position:=0;
      estadoe.caption:='Verificando Repetidos: '+campo;
      estadoe.Update;

       q.close;
       q.SQL.text:=' SELECT COUNT(*) FROM (SELECT J.'+campok+',  COUNT(*) AS REP FROM ('+
                    ' SELECT S.'+campok+' AS '+campok+', S.'+campo+' AS '+Campo+', COUNT(*) AS NUM '+
                    ' FROM NOMINAS S WHERE  S.'+campo+' IS NOT NULL '+
                    ' AND S.MES='+#39+STR_(MES.TEXT,'-')+#39+' AND S.EJERCICIO='+#39+EJERCICIO.TEXT+#39+
                    ' GROUP BY S.'+campok+', S.'+CAMPO+') J '+
                    ' GROUP BY J.'+campok+') WHERE  REP>1  ';
        Q.open;
        estadob.Max:=Q.FIELDS[0].AsInteger;


   q.close;
   q.SQL.text:=' SELECT * FROM (SELECT J.'+campok+',  COUNT(*) AS REP FROM ('+
                    ' SELECT S.'+campok+' AS '+campok+', S.'+campo+' AS '+Campo+', COUNT(*) AS NUM '+
                    ' FROM NOMINAS S WHERE  S.'+campo+' IS NOT NULL '+
                    ' AND S.MES='+#39+STR_(MES.TEXT,'-')+#39+' AND S.EJERCICIO='+#39+EJERCICIO.TEXT+#39+
                    ' GROUP BY S.'+campok+', S.'+CAMPO+') J '+
                    ' GROUP BY J.'+campok+') WHERE  REP>1  ';
   Q.open;


   while not (q.Eof) do
       begin
          AUX.CLOSE;
          Aux.sql.Text:='SELECT '+CAMPO+' FROM  NOMINAS S WHERE '+CAMPOK+'='+#39+q.fields[0].asstring+#39+
          ' AND '+CAMPO+' IS NOT NULL AND S.MES='+#39+STR_(MES.TEXT,'-')+#39+' AND S.EJERCICIO='+#39+EJERCICIO.TEXT+#39+
          ' ORDER BY CHAR_LENGTH ('+CAMPO+') DESC';
          Aux.open;
          elvalor:=aux.fields[0].asstring;

         if campo='CVEPSTO' then
            begin
                 AUX.CLOSE;
                 Aux.sql.Text:='SELECT puesto FROM  NOMINAS S  WHERE '+CAMPOK+'='+#39+q.fields[0].asstring+#39+
                 ' AND '+CAMPO+' IS NOT NULL AND S.MES='+#39+STR_(MES.TEXT,'-')+#39+' AND S.EJERCICIO='+#39+EJERCICIO.TEXT+#39+
                 ' ORDER BY CHAR_LENGTH ('+CAMPO+') DESC';
                 Aux.open;
                 elvalor2:=aux.fields[0].asstring;
            end;

          aux.close;
          aux.sql.text:='UPDATE NOMINAS SET '+CAMPO+'='+#39+elValor+#39+' WHERE '+CAMPOK+'='+#39+q.fields[0].asstring+#39+
          'AND MES='+#39+STR_(MES.TEXT,'-')+#39+' AND EJERCICIO='+#39+EJERCICIO.TEXT+#39;
          Aux.ExecSQL;

          if campo='CVEPSTO' then
             begin
                aux.close;
                aux.sql.text:='UPDATE NOMINAS SET PUESTO='+#39+elValor2+#39+' WHERE '+CAMPOK+'='+#39+q.fields[0].asstring+#39+
                'AND MES='+#39+STR_(MES.TEXT,'-')+#39+' AND EJERCICIO='+#39+EJERCICIO.TEXT+#39;
                Aux.ExecSQL;
             end;

          obsp.lines.add(mensaje+q.fields[0].asstring+' Tiene diferentes '+etiqueta+' Se junto todo en '+elValor);
          q.Next;
          estadob.position:=estadob.position+1;
       end;


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
   val:=VAL+ord(cad[1])+ord(cad[length(cad)])+ord(cad[length(cad) DIV 2]);
   generacodigoUnico:=inttostr(val);
end;


procedure TFOrma.exportarDatos;
var
cadM:String;
begin
   UnirRepetido('El RFC: ','RFC','EMPL','Número de Empleado');
   UnirRepetido('El Numero de empleado: ','EMPL','RFC','RFC');
   UnirRepetido('El Numero de empleado: ','EMPL','SEGURO','Número de Seguro Social');
   UnirRepetido('El Numero de empleado: ','EMPL','INGRESO','Fecha de Ingreso');
   UnirRepetido('El Numero de empleado: ','EMPL','CVEPSTO','Clave de Puestos');
   UnirRepetido('El Numero de empleado: ','EMPL','SUELDODIARIO','Sueldo diario');
   UnirRepetido('El Numero de empleado: ','EMPL','CORREO','Correo Electrónico');

    estadob.position:=0;
    estadoe.caption:='Creando Catálogo de empleados';
    estadoe.Update;


    N.close;
    N.sql.text:='SELECT COUNT(*) FROM ('+
                          'SELECT DISTINCT(Z.RFC) AS RCF,Z.EMPL,NULL AS EMPLCQ, Z.PATERNO, Z.MATERNO,Z.NOMBRE,'+
                          #39+#39+' AS C1,'+#39+#39+' AS C2,'+#39+#39+' AS C3,'+#39+#39+' AS C4,'+#39+#39+' AS C5,'+
                          'Z.SEGURO, Z.CORREO, Z.CVEPSTO, Z.INGRESO, '+
                          #39+EJERCICIO.TEXT+#39+'AS EJER,'+#39+str_(mes.Text,'-')+#39+' AS MES,'+
                          'Z.CURP AS CURPK  FROM NOMINAS Z where z.ejercicio='+#39+
                          EJERCICIO.TEXT+#39+' and mes='+#39+str_(mes.Text,'-')+#39+')';
    savetofile(N.sql.Text);
    N.Open;
    estadob.Max:=N.FIELDS[0].asinteger;

    N.close;
    N.sql.text:=' SELECT DISTINCT(Z.RFC) AS C1,Z.EMPL AS C2,NULL AS C3, Z.PATERNO AS C4, Z.MATERNO AS C5,Z.NOMBRE AS C6,'+
    #39+#39+' AS C7,'+#39+#39+' AS C8,'+#39+#39+' AS C9,'+#39+#39+' AS C10,'+#39+#39+' AS C11,'+
    'Z.SEGURO  AS C12, Z.CORREO AS C13, Z.CVEPSTO AS C14, Z.INGRESO AS C15,'+#39+EJERCICIO.TEXT+#39+' AS C16,'+
    #39+str_(mes.Text,'-')+#39+' AS C17,'+
    'Z.CURP  AS C18, Z.FORMAPAGO AS C19  FROM NOMINAS Z where z.ejercicio='+#39+EJERCICIO.TEXT+#39+' and mes='+#39+str_(mes.Text,'-')+#39+
    ' AND Z.RFC IS NOT NULL';
    savetofile(N.sql.Text);
    N.Open;


    estadob.Position:=0;

    Q.close;
    q.sql.text:='DELETE FROM EMPLEADOS WHERE MES='+#39+STR_(MES.TEXT,'-')+#39+' AND EJERCICIO='+#39+EJERCICIO.TEXT+#39;
    Q.execsql;
    q.close;


    //catalogo de empleados
    while not(N.Eof) do
        begin
            q.close;
            q.SQL.Text:='SELECT COUNT(*) FROM EMPLEADOS WHERE RFCK='+#39+N.fieldbyname('C1').asstring+#39+
            ' AND MES='+#39+STR_(MES.TEXT,'-')+#39+' AND EJERCICIO='+#39+EJERCICIO.TEXT+#39;
            Q.open;

            if q.Fields[0].asinteger=0 then
               begin
                  q.sql.Text:='INSERT INTO EMPLEADOS (RFCK,EMPL,EMPLCQ,PATERNO,MATERNO,NOMBRE,'+
                              'RFC,HOMOCLAVE,FECNAC,CURPI,CURPF,SEGUROSOC,CORREO,CVEPUESTO,'+
                              'FECINGRESO,EJERCICIO,MES,CURPK,FORMAPAGO) VALUES ( '+
                              #39+N.fieldbyname('C1').asstring+#39+','+
                              #39+N.fieldbyname('C2').asstring+#39+','+
                              #39+'0'+#39+','+
                              #39+N.fieldbyname('C4').asstring+#39+','+
                              #39+N.fieldbyname('C5').asstring+#39+','+
                              #39+N.fieldbyname('C6').asstring+#39+','+
                              #39+''+#39+','+
                              #39+''+#39+','+
                              #39+''+#39+','+
                              #39+''+#39+','+
                              #39+''+#39+','+
                              #39+N.fieldbyname('C12').asstring+#39+','+
                              #39+N.fieldbyname('C13').asstring+#39+','+
                              #39+N.fieldbyname('C14').asstring+#39+','+
                              #39+N.fieldbyname('C15').asstring+#39+','+
                              #39+N.fieldbyname('C16').asstring+#39+','+
                              #39+N.fieldbyname('C17').asstring+#39+','+
                              #39+N.fieldbyname('C18').asstring+#39+','+
                              #39+N.fieldbyname('C19').asstring+#39+')';
                  try Q.execsql; except  on E: Exception  do
                                         begin
                                              ObsP.Lines.Add(q.SQL.Text);
                                              ObsP.Lines.Add('Error empleado '+N.fields[0].asstring+' '+E.Message);
                                         end;
                  end;
              end
            else
               obsP.Lines.Add('El empleado con RFC '+N.fields[0].asstring+' Ya existe en la BD posible duplicado ');
            N.Next;
            estadob.position:=estadob.position+1;
       end;

    estadob.Position:=0;
    estadob.Max:=4;
    estadoe.caption:='Actualizando datos de empleados';
    q.Close;
    q.sql.text:='UPDATE EMPLEADOS SET '+
                'RFC=SUBSTRING(RFCK FROM 1 FOR 4),'+
                'HOMOCLAVE=SUBSTRING(RFCK FROM 11 FOR 3),'+
                'FECNAC=SUBSTRING(RFCK FROM 9 FOR 2)||'+#39+'/'+#39+
                        '||SUBSTRING(RFCK FROM 7 FOR 2)||'+#39+'/19'+#39+
                        '||SUBSTRING(RFCK FROM 5 FOR 2),'+
                'CURPI=SUBSTRING(CURPK FROM 1 FOR 4),'+
                'CURPF=SUBSTRING(CURPK FROM 11 FOR  char_LENGTH(CURPK))';
    savetofile(q.sql.Text);
    Q.ExecSQL;
    estadob.position:=estadob.position+1;



    n.close;
    n.sql.text:='SELECT COUNT(*) FROM (SELECT DISTINCT(CVEPSTO) as C1,NULL AS C2,PUESTO AS C3,'+
                 #39+EJERCICIO.TEXT+#39+' AS C4,'+#39+str_(mes.Text,'-')+#39+' AS C5'+
                 ' FROM NOMINAS S WHERE '+
                 'S.ejercicio='+#39+EJERCICIO.TEXT+#39+
                 ' and S.mes='+#39+str_(mes.Text,'-')+#39+')';
    savetofile(N.sql.Text);
    N.OPEN;

    estadob.Max:=N.FIELDS[0].asinteger;
    estadob.position:=0;


    n.close;
    n.sql.text:='SELECT DISTINCT(CVEPSTO) as C1,NULL AS C2,PUESTO AS C3,'+
                 #39+EJERCICIO.TEXT+#39+' AS C4,'+#39+str_(mes.Text,'-')+#39+' AS C5'+
                 ' FROM NOMINAS S WHERE '+
                 'S.ejercicio='+#39+EJERCICIO.TEXT+#39+
                 ' and S.mes='+#39+str_(mes.Text,'-')+#39;
    savetofile(N.sql.Text);
    n.open;


    estadoe.caption:='Creando Catálogo de puestos';
    estadoe.Update;

    Q.close;
    q.sql.text:='DELETE FROM PUESTOS WHERE MES='+#39+STR_(MES.TEXT,'-')+#39+' AND EJERCICIO='+#39+EJERCICIO.TEXT+#39;
    Q.execsql;
    q.close;

    WHILE NOT(n.eof) do
       BEGIN
            q.close;
            q.SQL.Text:='SELECT COUNT(*) FROM PUESTOS WHERE CLAVE='+#39+N.fieldbyname('C1').asstring+#39+
            ' AND MES='+#39+STR_(MES.TEXT,'-')+#39+' AND EJERCICIO='+#39+EJERCICIO.TEXT+#39;
            Q.open;

            if q.Fields[0].asinteger=0 then
               begin
                  q.close;
                  q.sql.text:=' INSERT INTO PUESTOS (CLAVE,IDCQ,DESCRIP, EJERCICIO, MES) VALUES ( '+
                  #39+N.fieldbyname('C1').asstring+#39+','+
                  #39+'0'+#39+','+
                  #39+COPY(N.fieldbyname('C3').asstring,1,40)+#39+','+
                  #39+N.fieldbyname('C4').asstring+#39+','+
                  #39+N.fieldbyname('C5').asstring+#39+')';
                  try Q.execsql; except  on E: Exception  do
                                           begin
                                                ObsP.Lines.Add('Error Puesto '+N.fields[0].asstring+' '+E.Message+' '+Q.SQL.TEXT);
                                           end;
                  end;
               end
            else
               obsP.Lines.Add('El Puesto con Clave '+N.fields[0].asstring+' Ya existe en la BD posible duplicado ');
          estadob.position:=estadob.position+1;
          n.Next;
       END;



    // Checando concepotos en clave SAT
    estadoe.caption:='Creando Catálogo de Conceptos';
    estadoe.Update;


    n.Close;
    n.SQL.Text:='SELECT COUNT(*) FROM (SELECT DISTINCT(CONP) as C1,NULL AS C2,CONCEPTO AS C3,PERDED AS C4, '+
                 #39+EJERCICIO.TEXT+#39+'AS C5,'+#39+str_(mes.Text,'-')+#39+' AS C6,NULL AS C7'+
                 ' FROM NOMINAS S WHERE '+
                 'S.ejercicio='+#39+EJERCICIO.TEXT+#39+
                 ' and S.mes='+#39+str_(mes.Text,'-')+#39+
                 ' UNION '+
                 'SELECT CLAVE,NULL, DESCRIP, PERDED,'+#39+EJERCICIO.TEXT+#39+','+
                 #39+str_(mes.Text,'-')+#39+',CVESAT FROM CONCEPTOSFIJOS)';
    n.open;
    estadob.Max:=N.FIELDS[0].asinteger;
    estadob.position:=0;


    n.Close;
    n.SQL.Text:='SELECT DISTINCT(CONP) as C1,NULL AS C2,CONCEPTO AS C3,PERDED AS C4, '+
                 #39+EJERCICIO.TEXT+#39+'AS C5,'+#39+str_(mes.Text,'-')+#39+' AS C6,NULL AS C7'+
                 ' FROM NOMINAS S WHERE '+
                 'S.ejercicio='+#39+EJERCICIO.TEXT+#39+
                 ' and S.mes='+#39+str_(mes.Text,'-')+#39+
                 ' UNION '+
                 'SELECT CLAVE,NULL, DESCRIP, PERDED,'+#39+EJERCICIO.TEXT+#39+','+
                 #39+str_(mes.Text,'-')+#39+',CVESAT FROM CONCEPTOSFIJOS';
    n.open;


    Q.close;
    q.sql.text:='DELETE FROM CONCEPTOS WHERE MES='+#39+STR_(MES.TEXT,'-')+#39+' AND EJERCICIO='+#39+EJERCICIO.TEXT+#39;
    Q.execsql;

    while not(N.Eof) do
       begin
          q.close;
          q.SQL.Text:='SELECT COUNT(*) FROM CONCEPTOS WHERE CLAVE='+#39+N.fieldbyname('C1').asstring+#39+
            ' AND MES='+#39+STR_(MES.TEXT,'-')+#39+' AND EJERCICIO='+#39+EJERCICIO.TEXT+#39;
          Q.open;

           if q.Fields[0].asinteger=0 then
               begin
                  q.close;
                  q.sql.text:=' INSERT INTO CONCEPTOS (CLAVE,IDCQ,DESCRIP,PERDED, EJERCICIO,MES, CVESAT) VALUES ('+
                               #39+N.fieldbyname('C1').asstring+#39+','+
                               #39+'0'+#39+','+
                               #39+N.fieldbyname('C3').asstring+#39+','+
                               #39+N.fieldbyname('C4').asstring+#39+','+
                               #39+N.fieldbyname('C5').asstring+#39+','+
                               #39+N.fieldbyname('C6').asstring+#39+','+
                               #39+N.fieldbyname('C7').asstring+#39+')';
                 try Q.execsql; except  on E: Exception  do
                                           begin
                                                ObsP.Lines.Add('Error Concepto (Posible descripción diferente): '+N.fields[0].asstring+' '+E.Message+' '+q.sql.text);
                                           end;
                  end;
              end
           else
               obsP.Lines.Add('El Concepto con Clave '+N.fields[0].asstring+' Ya existe en la BD posible duplicado ');

          estadob.position:=estadob.position+1;
          n.Next;
       end;


    estadob.Max:=2;
    estadob.Position:=0;
    estadoe.caption:='Verificando Catálogo de Conceptos de Nómina';
    estadoe.Update;



    Q.close;
    q.sql.text:='SELECT * FROM CONCEPTOS WHERE MES='+#39+STR_(MES.TEXT,'-')+#39+' AND EJERCICIO='+#39+EJERCICIO.TEXT+#39+
    ' AND CLAVE NOT IN (SELECT C.CLAVE FROM CATCONC C)';
    Q.OPEN;
    while not(q.Eof) do
      begin
        estadoe.caption:='Insertando Concepto de pago '+Q.Fields[0].asstring;
        estadoe.Update;
        AUX.Close;
        aux.sql.text:='INSERT INTO CATCONC (CLAVE,DESCRIP,PERDED,CVESAT) VALUES ('+
        #39+Q.Fields[0].asstring+#39+','+
        #39+Q.Fields[2].asstring+#39+','+
        #39+Q.Fields[3].asstring+#39+','+
        #39+''+#39+')';
        aux.ExecSQL;

        ObsP.lines.Add('Se necesita asignar clave SAT a:'+Q.Fields[0].asstring+' '+
        Q.Fields[1].asstring);
        q.Next;
      end;
      estadob.position:=estadob.position+1;



    estadoe.caption:='Estableciendo Conceptos de Fondos.. Espere por favor esta acción puede tardar varios minutos....';
    estadoe.Update;
    screen.Cursor:=crHourGlass;

    {Q.close;
    q.sql.text:='SELECT * FROM  RECALCULAFONDO('+#39+STR_(MES.TEXT,'-')+#39+','+#39+EJERCICIO.TEXT+#39+')';
    Q.OPEN; }

    recalculaFondo;
    estadob.position:=estadob.position+1;
    pestado.Visible:=false;
    screen.Cursor:=crDefault;


    obsp.Align:=alClient;

    Q.CLOSE;
    Q.SQL.Text:='SELECT COUNT(*) FROM EMPLEADOS  WHERE EJERCICIO='+#39+EJERCICIO.TEXT+#39+
    ' AND MES ='+#39+STR_(MES.TEXT,'-')+#39;
    Q.open;
    cadM:='Se insertaron '+q.fields[0].asstring+'  Empleados'+#13;
    Q.CLOSE;
    Q.SQL.Text:='SELECT COUNT(*) FROM nominas  WHERE EJERCICIO='+#39+EJERCICIO.TEXT+#39+
    ' AND MES ='+#39+STR_(MES.TEXT,'-')+#39;
    Q.open;
    cadM:=CADM+'Se insertaron '+q.fields[0].asstring+'  Movimientos de Nóminas'+#13;
    Q.CLOSE;
    Q.SQL.Text:='SELECT COUNT(*) FROM CONCEPTOS  WHERE EJERCICIO='+#39+EJERCICIO.TEXT+#39+
    ' AND MES ='+#39+STR_(MES.TEXT,'-')+#39;
    Q.open;
    cadM:=CADM+'Se insertaron '+q.fields[0].asstring+'  Conceptos de Nóminas'+#13;
    obsp.Lines.Add(CadM);

    tp.caption:=formatfloat('#,#0.00',SumaColGridCond(grid,15,17,'P'));
    td.caption:=formatfloat('#,#0.00',SumaColGridCond(grid,15,17,'D'));

    q.Close;
    q.SQL.text:='SELECT SUM(MONTO) FROM NOMINAS WHERE MES='+#39+STR_(MES.TEXT,'-')+#39+
    ' AND EJERCICIO='+#39+EJERCICIO.TEXT+#39+' AND PERDED='+#39+'P'+#39;
    Q.open;
    tpe.Caption:=formatfloat('#,#0.00',q.Fields[0].asfloat);
    q.Close;

    q.SQL.text:='SELECT SUM(MONTO) FROM NOMINAS WHERE MES='+#39+STR_(MES.TEXT,'-')+#39+
    ' AND EJERCICIO='+#39+EJERCICIO.TEXT+#39+' AND PERDED='+#39+'D'+#39;
    Q.open;
    tdE.Caption:=formatfloat('#,#0.00',q.Fields[0].asfloat);

end;


procedure TForma.savetoBDClick(Sender: TObject);
var
valMes:integer;
x:integer;
newEmpl:string;
begin
valMes:=0;
try valmes:=strtoint(STR_(mes.text,'-')); except valMes:=0; end;
IF ((valmes>=1) and (valMes<=12)) and (ejercicio.text<>'')  THEN
   begin
      pperiodo.Visible:=false;
      pestado.Top:=grid.Top+((grid.Height-pestado.Height) div 2);
      pestado.left:=grid.Left+((grid.Width-pestado.Width) div 2);
      pestado.Visible:=true;
      estadob.Position:=0;
      estadob.Max:=grid.RowCount-1;

      estadob.position:=0;
      estadoe.caption:='Importando Registro de Nóminas';
      estadoe.Update;

      Q.close;
      q.sql.text:='DELETE FROM NOMINAS WHERE MES='+#39+STR_(MES.TEXT,'-')+#39+
      ' AND EJERCICIO='+#39+EJERCICIO.TEXT+#39;
      Q.execsql;

      for x:=1 to grid.RowCount-1 do
         begin
           q.close;
           q.sql.text:='INSERT INTO NOMINAS (EMPL, RFC,'+
                       'CURP,CORREO,CVEPSTO,PUESTO,SEGURO,SEXO,INGRESO,'+
                       'FONDO,PATERNO,MATERNO,NOMBRE,CONP,CONCEPTO,MONTO,'+
                       'TIPOMONTO,PERDED,MES,EJERCICIO,sueldodiario,FORMAPAGO) VALUES ('+
                       #39+trim(GRID.CELLS[0,x])+#39+','+
                       #39+trim(GRID.CELLS[1,x])+#39+','+
                       #39+trim(GRID.CELLS[2,x])+#39+','+
                       #39+trim(GRID.CELLS[3,x])+#39+','+
                       #39+generacodigoUnico(GRID.CELLS[5,x])+#39+','+
                       #39+trim(GRID.CELLS[5,x])+#39+','+
                       #39+trim(GRID.CELLS[6,x])+#39+','+
                       #39+trim(GRID.CELLS[7,x])+#39+','+
                       #39+trim(GRID.CELLS[8,x])+#39+','+
                       #39+trim(GRID.CELLS[9,x])+#39+','+
                       #39+trim(GRID.CELLS[10,x])+#39+','+
                       #39+trim(GRID.CELLS[11,x])+#39+','+
                       #39+trim(GRID.CELLS[12,x])+#39+','+
                       #39+trim(GRID.CELLS[13,x])+#39+','+
                       #39+trim(GRID.CELLS[14,x])+#39+','+
                       #39+trim(floattostr(Anumero(GRID.CELLS[15,x])))+#39+','+
                       #39+trim(GRID.CELLS[16,x])+#39+','+
                       #39+trim(GRID.CELLS[17,x])+#39+','+
                       #39+trim(str_(mes.text,'-'))+#39+','+
                       #39+trim(ejercicio.text)+#39+','+
                       #39+trim(GRID.CELLS[18,x])+#39+','+
                       #39+trim(GRID.CELLS[19,x])+#39+')';
           q.execsql;
           estadob.Position:= estadob.Position+1;
         end;

         //cHECAMOS QUE TODOS LOS CONCEPTOS DE DEDUCCIÓN TENGAN G EN GRAVADO/EXENTO
           q.close;
           q.SQL.text:='UPDATE nominas set TIPOMONTO='+#39+'G'+#39+
           ' WHERE MES='+#39+STR_(MES.TEXT,'-')+#39+' AND EJERCICIO='+#39+EJERCICIO.TEXT+#39+
           ' AND PERDED='+#39+'D'+#39;
           Q.ExecSQL;

        //=============================COMENZAMOS VERIFICACION DE DATOS ========================================
        obsp.Text:='';
        ChecarRepetido('El RFC: ','RFC','EMPL','Números de empleados diferentes');
        ChecarRepetido('El Numero de empleado: ','EMPL','PATERNO','APELLIDO PATERNO');
        ChecarRepetido('El Numero de empleado: ','EMPL','MATERNO','APELLIDO MATERNO');
        ChecarRepetido('El Numero de empleado: ','EMPL','NOMBRE','NOMBRE');

        IF pos(':ERROR:',obsp.text)>0 then   //EN CASO DE NO HABER ENCONTRADO ERRORES
           begin
             if Application.MessageBox('Se han detectado errores ¿Desea continuar?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
                   exportarDatos
             else   //De lo contratrio de la pregunta a desea continuar
                begin
                   estadob.position:=estadob.position+1;
                   pestado.Visible:=false;
                   screen.Cursor:=crDefault;
                   obsp.Align:=alClient;
                end;
            end //Cierrre de si existe errores
        else
           exportarDatos;

   end
else
  Showmessage('El mes o Ejercicio no son válidos favor de verificar');
end;



function numero(var key:char):char;
begin
  if key in ['0'..'9',#8,'.',#13] then numero:=key else numero:=#7;
end;

procedure TForma.ejercicioExpKeyPress(Sender: TObject; var Key: Char);
begin
key:=numero(key);
end;

procedure TForma.validar(linea:integer; columna:integer; all:boolean);
var
x:integer;
lin1, lin2:integer;
col1, col2:integer;
errores:integer;
valCol:boolean;
nreg:integer;
meses:string;
begin
   if all then begin lin1:=1; lin2:=grid.RowCount-1; nreg:=grid.RowCount-1; end
   else begin lin1:=linea; lin2:=linea; nreg:=1; end;

   valcol:=true;
   errores:=0;
   BARRA.Position:=0;
   BARRA.Max:=nreg;
   if all then ESTADOB.max:=nreg;

   for x:=lin1 to lin2 do
       begin
          grid.Cells[grid.ColCount-2,x]:='';
          grid.Cells[grid.ColCount-1,x]:='';
          if TRIM(grid.Cells[0,x])='' then //Numero del Empleado
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'01) El número de empleado no puede estar vacio'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|0|';
                errores:=errores+1;
             end;


          if length(grid.Cells[1,x])<>13 then //Longitud de la rfc
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'02) El RFC No tiene una longitud adecuada'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|1|';
                errores:=errores+1;
             end;

          if not(esletra(copy(grid.Cells[1,x],1,4))) then //4 caracteres de la rfc
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'02) Los 4 caracteres iniciales de la CURP no son validos'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|1|';
                errores:=errores+1;
             end;
          if not(esfecha(copy(grid.Cells[1,x],5,6))) then //4 caracteres DE FECHA de la   rfc
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'02) Los caracteres de fecha no son validos'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|1|';
                errores:=errores+1;
             end;

          if length(grid.Cells[2,x])<>18 then //Longitud de la CURP
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'03) La CURP No tiene una longitud adecuada'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|2|';
                errores:=errores+1;
             end;

          if not(esletra(copy(grid.Cells[2,x],1,4))) then //4 caracteres de la CURP
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'03) Los 4 caracteres iniciales de la CURP no son validos'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|2|';
                errores:=errores+1;
             end;
          if not(esfecha(copy(grid.Cells[2,x],5,6))) then //4 caracteres DE FECHA de la CURP
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'03) Los caracteres de fecha no son validos'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|2|';
                errores:=errores+1;
             end;

          if Copy(grid.Cells[1,x],5,6)<>Copy(grid.Cells[2,x],5,6) then //Fecha de RFC Y CURP
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'03) La fecha de CURP Y RFC No coincide'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|2|';
                errores:=errores+1;
             end;

         if not(escorreo(grid.Cells[3,x])) then //Correo Electrónico
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'04) El correo electrónico del empleado puede no ser válido'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|3|';
                errores:=errores+1;
             end;

            if TRIM(grid.Cells[4,x])='' then //Codico puesto
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'05) El codigo del puesto no puede ser nulo'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|4|';
                errores:=errores+1;
             end;

             if TRIM(grid.Cells[5,x])='' then //Descripcion puesto
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'06) La descripción del puesto no puede ser nulo'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|5|';
                errores:=errores+1;
             end;

             if length(TRIM(grid.Cells[6,x]))<>11 then //Seguro Social
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'07) La longitud del Numero de Seguro Social no es correcta'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|6|';
                errores:=errores+1;
             end;


             if (TRIM(grid.Cells[7,x])<>'M') and  (TRIM(grid.Cells[7,x])<>'H')  then //Genero
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'08) El campo Genero solo puede ser H ó M'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|7|';
                errores:=errores+1;
             end;

             if not(esFechaFormal(TRIM(grid.Cells[8,x])))  then //Fecha de ingreso
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'09) La fecha de Ingreso no es válida'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|8|';
                errores:=errores+1;
             end;

              if (TRIM(grid.Cells[9,x])<>'F') and  (TRIM(grid.Cells[9,x])<>'P')  then //Fondo con el que se paga
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'10) El campo Fondo solo puede ser F ó P'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|9|';
                errores:=errores+1;
             end;

            if TRIM(grid.Cells[10,x])='' then //Descripcion puesto
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'11) El apellido paterno no puede ser nulo'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|10|';
                errores:=errores+1;
             end;

             if TRIM(grid.Cells[12,x])='' then //Nombre
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'13) El Nombre no puede ser nulo'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|12|';
                errores:=errores+1;
             end;

             if TRIM(grid.Cells[13,x])='' then //Descripcion puesto
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'14) La clave del concepto no puede ser nulo'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|13|';
                errores:=errores+1;
             end;

             if TRIM(grid.Cells[14,x])='' then //Descripcion concepto de pago
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'15) La descripción del concepto no puede ser nulo'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|14|';
                errores:=errores+1;
             end;

             grid.Cells[15,x]:=stringreplace(grid.Cells[15,x],'$','',[rfReplaceAll, rfIgnoreCase]);
             grid.Cells[15,x]:=stringreplace(grid.Cells[15,x],',','',[rfReplaceAll, rfIgnoreCase]);

             if not(esReal(trim(grid.Cells[15,x]))) then //Monto concepto de pago
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'16) El monto del concepto de pago no es real'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|15|';
                errores:=errores+1;
             end;

             if (TRIM(grid.Cells[17,x])<>'P') and  (TRIM(grid.Cells[17,x])<>'D')  then //Fondo con el que se paga
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'18) El campo Tipo de concepto solo puede ser D ó P'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|17|';
                errores:=errores+1;
             end;

             if (TRIM(grid.Cells[16,x])<>'G') and  (TRIM(grid.Cells[16,x])<>'E') and ((TRIM(grid.Cells[17,x])='P'))  then //Fondo con el que se paga
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'18) Para los conceptos de percepción se debe colocar si es Gravado o Exento'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|16|';
                errores:=errores+1;
             end;

             grid.Cells[18,x]:=stringreplace(grid.Cells[18,x],'$','',[rfReplaceAll, rfIgnoreCase]);
             grid.Cells[18,x]:=stringreplace(grid.Cells[18,x],',','',[rfReplaceAll, rfIgnoreCase]);
             if not(esReal(trim(grid.Cells[18,x]))) then //Monto del sueldo diario
             begin
                grid.Cells[grid.ColCount-2,x]:=grid.Cells[grid.ColCount-2,x]+'19) El monto del sueldo diario no es real'+chr(13);
                grid.Cells[grid.ColCount-1,x]:=grid.Cells[grid.ColCount-1,x]+'|18|';
                errores:=errores+1;
             end;



          BARRA.Position:=BARRA.Position+1;
          if all then
             begin
                estadob.position:=estadob.position+1;
                estadoe.Caption:='Validando Linea: '+inttostr(x);
                pestado.Update;
             end;
          Application.ProcessMessages;
          if presEsc then
             begin
                grid.Repaint;
                BARRA.Position:=0;
                pestado.Visible:=false;
                break;
             end;
      end; //FIN DEL FOR DE LINEA
if all then
   begin nerror.Caption:=inttostr(errores);
         pestado.Visible:=false;
         grid.Repaint;
         BARRA.Position:=0;
   end;

//if soloError.checked then validado.Caption:='N' else VALIDADO.caption:='S';
if (valcol) and (all) and (errores=0) then  validado.Caption:='S' else validado.Caption:='N';
end;



procedure TForma.SpeedButton4Click(Sender: TObject);
begin
pestado.Top:=grid.Top+((grid.Height-pestado.Height) div 2);
pestado.left:=grid.Left+((grid.Width-pestado.Width) div 2);
pestado.Visible:=true;
estadob.Position:=0;
presEsc:=false;
estadob.Position:=0;
validar (0,0,true);
PVAL.Visible:=TRUE;
end;

procedure TForma.SpeedButton6Click(Sender: TObject);
var
x,y,z:integer;
empiezaLin,empiezaCol:integer;
hayerror:boolean;
begin
    hayerror:=false;
    for z:=colg+1 to grid.ColCount-2 do
        if (pos('|'+inttostr(z)+'|',grid.cells[grid.colcount-1,lineaG])>0) then
            BEGIN hayerror:=true; BREAK; END;
    if hayerror then empiezaLin:=lineaG else  EmpiezaLin:=lineag+1;
    if hayerror then empiezaCol:=Colg+1 else EmpiezaCol:=0;

for x:=empiezaLin to grid.RowCount-1 do
   begin
       for y:=empiezaCol to grid.ColCount-2 do
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

procedure TForma.gridSetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: String);
begin
IF grid.Colcount>2 then
   begin
      validar (arow,0,false);
      cambios:=true;
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

procedure TForma.validadoDblClick(Sender: TObject);
begin
VAlidado.caption:='S';
end;

procedure TForma.CalcularPd1Click(Sender: TObject);
begin
tp.caption:=formatfloat('#,#0.00',SumaColGridCond(grid,15,17,'P'));
     td.caption:=formatfloat('#,#0.00',SumaColGridCond(grid,15,17,'D'));
end;

procedure TForma.copiarGridconError(g:TstringGrid);
const
TAB = #9; //Tabular para dar espacio entre las columnas.
CR = #13; // Simula la tecla enter, es decir separa cada fila.
var
R, C: integer; // R= de row Fila, y C= de columna
cadS: string; // Es el buffer donde se va a guardar el texto a copiar.
CadNew:string;
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
        if g.Cells[g.ColCount-1,r]<>'' then
           begin
                for C := 0 to G.ColCount - 2 do
                    begin
                        cadNew:= AnsiReplaceStr(G.Cells[C, R],#10,'');
                        cadNew:= AnsiReplaceStr(cadNew,#13,'');
                        cadS := cadS + cadNew; //Aqui vamos concatenando las celdas del stringGrid.
                        if C < G.ColCount - 1 then
                           cadS := cadS + TAB; //esta condición es para ir tabulando el las columnas de tal forma que no salgan pegadas.
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
     end;
Clipboard.AsText := cadS; //Este objeto es el que hace todo el trabajo de copiar el texto ala papelera de reciclaje
Showmessage('Registros copiados --> Abra Excel y presione CTRL + V');
estadob.position:=0;
pestado.Visible:=false;
END;


procedure TForma.ExportarRegistrosconError1Click(Sender: TObject);
begin
copiarGridconError(grid);
end;

procedure TForma.IgualarFechasdeRFCyCRUP1Click(Sender: TObject);
var
fecha:string;
x:integer;
begin
pestado.Top:=grid.Top+((grid.Height-pestado.Height) div 2);
       pestado.left:=grid.Left+((grid.Width-pestado.Width) div 2);
       pestado.Visible:=true;
estadoe.Caption:='Igualando Fechas de RFC a CURP';
estadoe.update;
ESTADOB.position:=0;
ESTADOB.Max:=grid.RowCount-1;
 for x:=1 to grid.rowcount-1 do
    begin
        fecha:=copy(grid.cells[1,x],5,6);
        TRY STRTOINT(fecha) except continue; end;
        grid.Cells[2,x]:= copy(grid.cells[2,x],1,4)+fecha+copy(grid.cells[2,x],11,length(grid.cells[2,x])) ;
        estadob.Position:=estadob.Position+1;
    end;
 pestado.visible:=false;
end;


procedure TForma.recalculaFondo;
var
hay:integer;
laDescrip,elconcepto:string;
elmonto:real;

begin
q.close;
q.sql.text:='DELETE FROM NOMINAS S WHERE S.CONP IN ('+#39+'9000'+#39+','+#39+'9001'+#39+','+#39+'9002'+#39+') AND  '+
            ' S.EJERCICIO='+#39+Ejercicio.text+#39+' AND S.MES='+#39+str_(mes.text,'-')+#39;
q.execsql;

pestado.Top:=grid.Top+((grid.Height-pestado.Height) div 2);
pestado.left:=grid.Left+((grid.Width-pestado.Width) div 2);
pestado.Visible:=true;
ESTADOB.position:=0;
ESTADOB.Max:=grid.RowCount-1;

q.close;
q.sql.text:='SELECT count(DISTINCT(S.EMPL)) FROM NOMINAS S WHERE S.PERDED='+#39+'P'+#39+
            ' AND S.EJERCICIO='+#39+Ejercicio.text+#39+' AND S.MES='+#39+str_(mes.text,'-')+#39;
q.open;
estadob.Max:=q.Fields[0].asinteger;

q.close;
q.sql.text:='SELECT A.EMPL, 1 AS NUM, B.FONDO, B.MONTO FROM EMPLXFONDO A, TODOSFONDOS B '+
            ' WHERE  A.EJERCICIO='+#39+Ejercicio.text+#39+' AND A.MES='+#39+str_(mes.text,'-')+#39+
            ' AND A.EJERCICIO=B.EJERCICIO AND A.MES=B.MES  ' +
            ' AND A.EMPL=B.EMPL AND A.NUM=1  '+
            ' UNION '+
            ' SELECT A.EMPL, 2 AS NUM, B.FONDO, B.MONTO FROM EMPLXFONDO A, TODOSFONDOS B '+
            ' WHERE  A.EJERCICIO='+#39+Ejercicio.text+#39+' AND A.MES='+#39+str_(mes.text,'-')+#39+
            ' AND A.EJERCICIO=B.EJERCICIO AND A.MES=B.MES '+
            ' AND A.EMPL=B.EMPL AND A.NUM=2 AND B.FONDO='+#39+'P'+#39;

q.open;

while not(q.eof) do
   begin
      estadoe.Caption:='Agregando Fondos a Empleado: '+q.Fields[0].AsString;
      estadoe.update;
      HAY:=Q.Fields[1].asinteger;
      elMonto:=q.fields[3].asfloat;
      if hay=1 then
         begin
             if (q.Fields[2].asstring='F') THEN
                begin
                   ELCONCEPTO:='9001';
                   LADESCRIP:='FONDOS FEDERALES';
                end
             ELSE
                begin
                     ELCONCEPTO:='9000';
                     LADESCRIP:='FONDOS PROPIOS';
                end;
              
             n.close;
             n.sql.Text:='INSERT INTO NOMINAS (EMPL,CONP, CONCEPTO, MONTO, TIPOMONTO, PERDED, MES, EJERCICIO) '+
             ' VALUES ('+#39+q.Fields[0].AsString+#39+','+
             #39+elconcepto+#39+','+
             #39+LADESCRIP+#39+','+
             #39+'0'+#39+','+
             #39+'F'+#39+','+
             #39+'P'+#39+','+
             #39+str_(mes.text,'-')+#39+','+
             #39+Ejercicio.text+#39+')';
             N.ExecSQL;
         end;

      if hay=2 then
         begin
             n.close;
             n.sql.Text:='INSERT INTO NOMINAS (EMPL,CONP, CONCEPTO, MONTO, TIPOMONTO, PERDED, MES, EJERCICIO) '+
             ' VALUES ('+#39+q.Fields[0].AsString+#39+','+
             #39+'9002'+#39+','+
             #39+'FONDOS MIXTOS'+#39+','+
             #39+floattostr(elmonto)+#39+','+
             #39+'F'+#39+','+
             #39+'P'+#39+','+
             #39+str_(mes.text,'-')+#39+','+
             #39+Ejercicio.text+#39+')';
             N.ExecSQL;

             n.close;
             n.sql.Text:='INSERT INTO NOMINAS (EMPL,CONP, CONCEPTO, MONTO, TIPOMONTO, PERDED, MES, EJERCICIO) '+
             ' VALUES ('+#39+q.Fields[0].AsString+#39+','+
             #39+'9001'+#39+','+
             #39+'FONDOS FEDERALES'+#39+','+
             #39+floattostr(elmonto*-1)+#39+','+
             #39+'F'+#39+','+
             #39+'P'+#39+','+
             #39+str_(mes.text,'-')+#39+','+
             #39+Ejercicio.text+#39+')';
             N.ExecSQL;
         end;
      estadob.Position:=estadob.Position+1;
      q.next;
   end;

pestado.Visible:=false;
end;








{procedure TForma.recalculaFondo;
var
hay:integer;
laDescrip,elconcepto:string;
elmonto:real;

begin
q.close;
q.sql.text:='DELETE FROM NOMINAS S WHERE S.CONP IN ('+#39+'9000'+#39+','+#39+'9001'+#39+','+#39+'9002'+#39+') AND  '+
            ' S.EJERCICIO='+#39+Ejercicio.text+#39+' AND S.MES='+#39+str_(mes.text,'-')+#39;
q.execsql;

pestado.Top:=grid.Top+((grid.Height-pestado.Height) div 2);
pestado.left:=grid.Left+((grid.Width-pestado.Width) div 2);
pestado.Visible:=true;
ESTADOB.position:=0;
ESTADOB.Max:=grid.RowCount-1;

q.close;
q.sql.text:='SELECT count(DISTINCT(S.EMPL)) FROM NOMINAS S WHERE S.PERDED='+#39+'P'+#39+
            ' AND S.EJERCICIO='+#39+Ejercicio.text+#39+' AND S.MES='+#39+str_(mes.text,'-')+#39;
q.open;
estadob.Max:=q.Fields[0].asinteger;

q.close;
q.sql.text:='SELECT DISTINCT(S.EMPL) FROM NOMINAS S WHERE S.PERDED='+#39+'P'+#39+
            ' AND S.EJERCICIO='+#39+Ejercicio.text+#39+' AND S.MES='+#39+str_(mes.text,'-')+#39;
q.open;

while not(q.eof) do
   begin
      estadoe.Caption:='Agregando Fondos a Empleado: '+q.Fields[0].AsString;
      estadoe.update;
      n.close;
      n.sql.Text:='SELECT S.EMPL, S.FONDO, SUM(S.MONTO), COUNT(*) AS MONTO FROM NOMINAS S  '+
                  'WHERE S.EJERCICIO='+#39+Ejercicio.text+#39+' AND S.MES='+#39+str_(mes.text,'-')+#39+
                  ' AND S.PERDED='+#39+'P'+#39+' AND S.EMPL='+#39+q.Fields[0].AsString+#39+
                  ' GROUP BY S.EMPL, S.FONDO ORDER BY S.FONDO DESC';
      N.OPEN;
      elmonto:=n.fields[2].asfloat;

      hay:=0;
      WHILE NOT(n.Eof) do
         begin
            hay:=hay+1;
            n.Next;
         end;
      n.First;

      if hay=1 then
         begin
             if (n.Fields[1].asstring='F') THEN
                begin
                   ELCONCEPTO:='9001';
                   LADESCRIP:='FONDOS FEDERALES';
                end
             ELSE
                begin
                     ELCONCEPTO:='9000';
                     LADESCRIP:='FONDOS PROPIOS';
                end;
              
             n.close;
             n.sql.Text:='INSERT INTO NOMINAS (EMPL,CONP, CONCEPTO, MONTO, TIPOMONTO, PERDED, MES, EJERCICIO) '+
             ' VALUES ('+#39+q.Fields[0].AsString+#39+','+
             #39+elconcepto+#39+','+
             #39+LADESCRIP+#39+','+
             #39+'0'+#39+','+
             #39+'F'+#39+','+
             #39+'P'+#39+','+
             #39+str_(mes.text,'-')+#39+','+
             #39+Ejercicio.text+#39+')';
             N.ExecSQL;
         end;

      if hay=2 then
         begin
             n.close;
             n.sql.Text:='INSERT INTO NOMINAS (EMPL,CONP, CONCEPTO, MONTO, TIPOMONTO, PERDED, MES, EJERCICIO) '+
             ' VALUES ('+#39+q.Fields[0].AsString+#39+','+
             #39+'9002'+#39+','+
             #39+'FONDOS MIXTOS'+#39+','+
             #39+floattostr(elmonto)+#39+','+
             #39+'F'+#39+','+
             #39+'P'+#39+','+
             #39+str_(mes.text,'-')+#39+','+
             #39+Ejercicio.text+#39+')';
             N.ExecSQL;

             n.close;
             n.sql.Text:='INSERT INTO NOMINAS (EMPL,CONP, CONCEPTO, MONTO, TIPOMONTO, PERDED, MES, EJERCICIO) '+
             ' VALUES ('+#39+q.Fields[0].AsString+#39+','+
             #39+'9001'+#39+','+
             #39+'FONDOS FEDERALES'+#39+','+
             #39+floattostr(elmonto*-1)+#39+','+
             #39+'F'+#39+','+
             #39+'P'+#39+','+
             #39+str_(mes.text,'-')+#39+','+
             #39+Ejercicio.text+#39+')';
             N.ExecSQL;
         end;
      estadob.Position:=estadob.Position+1;
      q.next;
   end;

pestado.Visible:=false;
end;     }


procedure TForma.IgualarCampos(ColumnaPadre:integer; ColumnaCompara:integer; msg:string);
var
fecha:string;
elpadre:string;
elHijo:String;
x:integer;
begin
pestado.Top:=grid.Top+((grid.Height-pestado.Height) div 2);
pestado.left:=grid.Left+((grid.Width-pestado.Width) div 2);
pestado.Visible:=true;
ESTADOB.position:=0;
ESTADOB.Max:=grid.RowCount-1;
estadoe.Caption:=msg;
estadoe.update;

elPadre:=grid.cells[columnaPadre,x];
elHijo:=grid.cells[columnaCompara,x];

for x:=1 to grid.rowcount-1 do
    begin
        if elPadre=grid.cells[columnaPadre,x] then
           begin
               if (grid.cells[columnaCompara,x]<>elHijo) then
                   grid.Cells[columnaCompara,x]:=elHijo;
           end
        else
           begin
              elPadre:=grid.cells[columnaPadre,x];
              elHijo:=grid.cells[columnaCompara,x];
           end;

        estadob.Position:=estadob.Position+1;
    end;
 pestado.visible:=false;
end;


procedure TForma.IgualarRFCCURPPORNoEmpl1Click(Sender: TObject);
begin
IgualarCampos(0,1,'Verificando RFC Diferentes en el mismo Empleado');
IgualarCampos(0,4,'Verificando CVE_PUESTOS Diferentes en el mismo Empleado');
IgualarCampos(0,5,'Verificando PUESTOS Diferentes en el mismo Empleado');
IgualarCampos(0,8,'Verificando FECHAS DE INGRESO Diferentes en el mismo Empleado');
IgualarCampos(0,10,'Verificando APE_PATERNO Diferentes en el mismo Empleado');
IgualarCampos(0,11,'Verificando APE_MATERNO Diferentes en el mismo Empleado');
IgualarCampos(0,12,'Verificando NOMBRE Diferentes en el mismo Empleado');
end;


end.
