unit URecalculoISR;

interface

uses
  Windows, Messages, StdCtrls, Buttons, Menus, Dialogs, ExtCtrls, Controls,
  FileCtrl, dxCore, dxButton, Graphics, ComCtrls, Grids, Classes, variants,
  Forms, oleServer, ExcelXP,ClipBrd, SysUtils, Comobj, ExtActns, DBXpress,
  DB, SqlExpr, FMTBcd, DBGrids, DBClient, Provider;




type

  mygrid=class(TStringGrid)
  public
    procedure MoveColumn(FromIndex, ToIndex: Longint);
    procedure MoveRow(FromIndex, ToIndex: Longint);
  end;


type
  TForma = class(TForm)
    BDFire: TSQLConnection;
    q: TSQLQuery;
    QCamb: TSQLQuery;
    SubirCQ: TSpeedButton;
    Label15: TLabel;
    MesExp: TComboBox;
    ejercicioExp: TEdit;
    Label13: TLabel;
    DSISR: TDataSource;
    CDISR: TClientDataSet;
    Shape1: TShape;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    QISR: TSQLQuery;
    ISR: TComboBox;
    Label1: TLabel;
    ProvISR: TDataSetProvider;
    DBGrid1: TDBGrid;
    DSCamb: TDataSource;
    cdCamb: TClientDataSet;
    ProvCamb: TDataSetProvider;
    BARRA: TProgressBar;
    procedure CMAfterShow(var Msg: TMessage);
    procedure FormCreate(Sender: TObject);
    Function buscaClave(cadena:string; cat:string):boolean;
    Function buscaClaveBin(cadena:string; cat:string):boolean;
    procedure AbrePrincipal(nombre:string);
    function Xls_To_StringGrid(AGrid: TStringGrid; AXLSFile: string): Boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    Function dameDescrip(cadena:string; cat:string):string;
    procedure SpeedButton11Click(Sender: TObject);
      procedure borra_row(sender:tobject; lin:integer);
    procedure ejercicioKeyPress(Sender: TObject; var Key: Char);
    procedure descargarURL (const direccionURL, ficheroLocal : string);
    procedure ejercicioExpKeyPress(Sender: TObject; var Key: Char);
    procedure ImportCQClick(Sender: TObject);
    function CopiarExcel(AGrid: TStringGrid; AXLSFile: string): Boolean;
    procedure copiarGrid(g:TstringGrid);
    procedure copiarDBGrid(elq:TSQLQuery);
    function PegarExcel: Boolean;
    procedure CargaISR;
    procedure SubirCQClick(Sender: TObject);
    procedure DBGridISRDblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure ISRChange(Sender: TObject);
    procedure MesExpChange(Sender: TObject);
    procedure ejercicioExpChange(Sender: TObject);
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


    // Get the value of the last column
    y := XLApp.ActiveCell.Column;

    // Set Stringgrid's row &col dimensions.

    AGrid.RowCount := x;
    AGrid.ColCount := y;


    // Assign the Variant associated with the WorkSheet to the Delphi Variant
    RangeMatrix := XLApp.Range['A1', XLApp.Cells.Item[X, Y]].Value;

    //  Define the loop for filling in the TStringGrid
    k := 1;
    repeat
      for r := 1 to y do
        AGrid.Cells[(r - 1), (k)] := RangeMatrix[K, R];
      Inc(k, 1);
      AGrid.RowCount := k + 1;

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
                   cadS := cadS + TAB; //esta condici�n es para ir tabulando el las columnas de tal forma que no salgan pegadas.
            end;
        if R < G.RowCount - 1 then
           cadS := cadS + CR;
     end;
Clipboard.AsText := cadS; //Este objeto es el que hace todo el trabajo de copiar el texto ala papelera de reciclaje
pegarExcel;
END;

procedure TForma.copiarDBGrid(elq:TSQLQuery);
const
TAB = #9; //Tabular para dar espacio entre las columnas.
CR = #13; // Simula la tecla enter, es decir separa cada fila.
var
R, C: integer; // R= de row Fila, y C= de columna
cadS: string; // Es el buffer donde se va a guardar el texto a copiar.
begin
{Cuadricula es el nombre del componente StringGrid}
cadS := '';

ELq.open;
ELq.first;

for C := 0 to elq.FieldCount - 1 do
   BEGIN
       cadS := cadS + stringReplace(TRIM(elq.Fields[c].DisplayName),'#13','',[rfReplaceAll]); //Aqui vamos concatenando las celdas del stringGrid.
       cadS := cadS + TAB; //esta condici�n es para ir tabulando el las columnas de tal forma que no salgan pegadas.
   END;
cadS := cadS + CR;

while not(ELq.eof) do
    begin
        for C := 0 to elq.FieldCount - 1 do
            begin
                cadS := cadS + stringReplace(TRIM(elq.fieldbyname(elq.Fields[c].DisplayName).asstring),'#13','',[rfReplaceAll]); //Aqui vamos concatenando las celdas del stringGrid.
                cadS := cadS + TAB; //esta condici�n es para ir tabulando el las columnas de tal forma que no salgan pegadas.
            end;

           cadS := cadS + CR;
        ELq.Next;
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



procedure TForma.CargaISR;
BEGIN
 { cdisr.close;
  QISR.CLOSE;
  QISR.SQL.TEXT:='SELECT EMPL AS EMPL'+
  ',SUM(MONTO) AS ISR,'+
  '(SELECT SUM(MONTO) FROM NOMINAS Z WHERE Z.EJERCICIO=A.EJERCICIO AND Z.MES=A.MES AND Z.EMPL=A.EMPL '+
  ' AND Z.TIPOMONTO='+#39+'G'+#39+ ' AND Z.EMPL=A.EMPL AND Z.PERDED='+#39+'P'+#39+') AS GRAVABLE'+
  ' FROM NOMINAS A WHERE CONP='+#39+STR_(ISR.Text,'-')+#39+
  ' AND EJERCICIO='+#39+EJERCICIOEXP.TEXT+#39+
  ' AND MES='+#39+STR_(MESEXP.TEXT,'-')+#39+
  ' GROUP BY EMPL, EJERCICIO, MES';
  SAVEtoFILE(Qisr.sql.text);
  Qisr.Open;
  CDISR.Open;     }

   cdCamb.close;
      Qcamb.Close;
      qcamb.SQL.Text:='SELECT A.EMPL, B.RFC, B.PATERNO,B.MATERNO, B.NOMBRE, A.TENIA, '+
      'A.NUEVOISR, A.MONTOGRAV AS MONTO, A.NUEVOISR-A.TENIA AS DIFERENCIA  FROM RECALISR A, EMPLEADOS B WHERE A.MES='+#39+STR_(MESEXP.Text,'-')+#39+
      ' AND A.EJERCICIO='+#39+EJERCICIOEXP.TEXT+#39+
      ' AND B.EJERCICIO=A.EJERCICIO AND B.MES=A.MES AND B.EMPL=A.EMPL'+
      ' ORDER BY EMPL';
      QCamb.Open;
      cdCamb.Open;

END;

procedure TForma.FormCreate(Sender: TObject);
var
x:integer;
begin

//Abrimos la base de Firebird
  BDFire.Close;
  BDFire.Params.ValueFromIndex[1]:=extractfileDir(paramstr(0))+'\base\DBIMPORT.FDB';
  BDFire.open;


   ejercicioExp.Text:=formatdatetime('YYYY',Now);
  MESExp.Text:=formatdatetime('MM',Now);

  Q.CLOSE;
  Q.SQL.Text:='SELECT DISTINCT(CONP), CONCEPTO FROM NOMINAS';
  Q.Open;
  q.first;
  isr.Clear;
  while not(q.Eof) do
     begin
        isr.items.Add(q.Fields[0].asstring+'-'+q.Fields[1].asstring);
        q.next;
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



procedure TForma.AbrePrincipal(nombre:string);

begin

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
VAR
VALMES:INTEGER;
begin
try valmes:=strtoint(STR_(mesExp.text,'-')); except valMes:=0; end;
IF ((valmes>=1) and (valMes<=12)) THEN
   Showmessage('hacer algo')
else
 Showmessage('Al parecer no se ha llenado toda la informaci�n requerida, revise los campos solicitados');

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


procedure TForma.SpeedButton11Click(Sender: TObject);
begin
//copiarGrid(Grid);
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

function numero(var key:char):char;
begin
  if key in ['0'..'9',#8,'.',#13] then numero:=key else numero:=#7;
end;

procedure TForma.ejercicioExpKeyPress(Sender: TObject; var Key: Char);
begin
key:=numero(key);
end;

procedure TForma.ImportCQClick(Sender: TObject);
VAR
VALMES:INTEGER;
num:integer;
sql:string;
begin

try valmes:=strtoint(STR_(mesExp.text,'-')); except valMes:=0; end;
IF ((valmes>=1) and (valMes<=12))  THEN

      showmessage('')
else
      Showmessage('Al parecer no se ha llenado toda la informaci�n requerida, revise los campos solicitados');


end;

procedure TForma.SubirCQClick(Sender: TObject);
VAR
VALMES:INTEGER;
begin

try valmes:=strtoint(STR_(mesExp.text,'-')); except valMes:=0; end;
IF ((valmes>=1) and (valMes<=12)) and (ejercicioExp.text<>'') and (isr.Text<>'') tHEN
   begin
      Q.CLOSE;
      Q.SQL.TEXT:='SELECT * FROM recalculaisr('+#39+STR_(MESEXP.Text,'-')+#39+','+
      #39+EJERCICIOEXP.TEXT+#39+','+#39+STR_(ISR.TEXT,'-')+#39+')';
      Q.open;

      //
      cdCamb.close;
      Qcamb.Close;
      qcamb.SQL.Text:='SELECT A.EMPL, B.RFC, B.PATERNO,B.MATERNO, B.NOMBRE, A.TENIA, '+
      'A.NUEVOISR, A.MONTOGRAV AS MONTO, A.NUEVOISR-A.TENIA AS DIFERENCIA  FROM RECALISR A, EMPLEADOS B WHERE A.MES='+#39+STR_(MESEXP.Text,'-')+#39+
      ' AND A.EJERCICIO='+#39+EJERCICIOEXP.TEXT+#39+
      ' AND B.EJERCICIO=A.EJERCICIO AND B.MES=A.MES AND B.EMPL=A.EMPL'+
      ' ORDER BY EMPL';
      QCamb.Open;
      cdCamb.Open;


      CargaISR;


   end
else
   showmessage('Debe llenar los campos: Mes, Ejercicio y Concepto de ISR');

end;

procedure TForma.DBGridISRDblClick(Sender: TObject);
begin
copiarDBGrid(qIsr);
end;



procedure CrearFile(fi:string);
var
  Excel: OleVariant;
  Libro: OleVariant;
  Hoja: OleVariant;

begin
 if not(fileexists(fi)) then
    begin
        Excel := ComObj.CreateOleObject('Excel.Application');
        Libro := Excel.WorkBooks.Add;
        Hoja := Libro.ActiveSheet;
        Hoja.Cells[1, 1] := '';

        Libro.SaveAs(fi);
        Excel.Quit;
    end;
end;


procedure ExportarXLS(Q:TCLIENTdATASET);
var
id:integer;
x,y:integer;
ExcelApplication1:TExcelApplication;
ExcelWorkbook1: TExcelWorkbook;
ExcelWorksheet1: TExcelWorksheet;
begin
try deletefile(extractfiledir(paramstr(0))+'\File.xlsx'); except end;
crearFile(extractfiledir(paramstr(0))+'\File.xlsx');
ExcelApplication1:=TExcelApplication.create(nil);
ExcelWorkbook1:= TExcelWorkbook.create(nil);
ExcelWorksheet1:=TExcelWorksheet.create(nil);
               showmessage('Exportar....');

ExcelApplication1.Workbooks.Open(extractfiledir(paramstr(0))+'\File.xlsx',
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,id);

  ExcelApplication1.Visible[id]:=true;
  ExcelWorkbook1.ConnectTo(ExcelApplication1.ActiveWorkbook);
  ExcelWorksheet1.ConnectTo(ExcelApplication1.ActiveSheet as _Worksheet);
  excelworksheet1.ConnectTo(excelworkbook1.Sheets.Item[1] as _Worksheet);
  excelworksheet1.Activate;

  ExcelWorksheet1.Cells.Item[1,1].Font.Bold:=true;
  for x:=0 to q.FieldCount-1 do
     begin
        ExcelWorksheet1.Cells.Item[1,x+1].Font.Bold:=true;
        ExcelWorksheet1.Cells.Item[1,x+1].value:=q.Fields[x].FullName;
     end;

  y:=0;
  q.first;

  while not(q.eof) do
     begin
       y:=y+1;
        for x:=0 to q.Fields.Count-1  do
            begin
               ExcelWorksheet1.Cells.Item[y+1,x+1].value:=q.fields[x].asstring;

            end;
        q.next;
     end;

// ExcelWorksheet1.Disconnect;
// ExcelWorkbook1.Disconnect;
// ExcelApplication1.Disconnect;
end;


procedure TForma.DBGrid1DblClick(Sender: TObject);
begin
 ExportarXLS(CDCAMB)
end;



procedure TForma.ISRChange(Sender: TObject);
begin
CARGAisr;
end;

procedure TForma.MesExpChange(Sender: TObject);
begin
CARGAisr;
end;

procedure TForma.ejercicioExpChange(Sender: TObject);
begin
CARGAisr;
end;

end.
