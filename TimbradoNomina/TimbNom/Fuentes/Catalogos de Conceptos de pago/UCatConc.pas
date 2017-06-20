unit UCatConc;

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
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    LerrorDef: TListBox;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    CAMBPAS: TSpeedButton;
    filgen: TListBox;
    grid: TStringGrid;
    q: TSQLQuery;
    BDFire: TSQLConnection;
    d: TPopupMenu;
    PegardelPortapapeles1: TMenuItem;
    ColorClaveSATaPercepciones1: TMenuItem;
    ColocarClaveSATaDeducciones1: TMenuItem;
    ExportaraExcel1: TMenuItem;

    Function buscaClave(cadena:string; cat:string):boolean;
    Function buscaClaveBin(cadena:string; cat:string):boolean;
    procedure AbrePrincipal(nombre:string);


    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    Function dameDescrip(cadena:string; cat:string):string;
    procedure SpeedButton11Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
      procedure borra_row(sender:tobject; lin:integer);
    procedure descargarURL (const direccionURL, ficheroLocal : string);
    procedure ejercicioExpKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Pegar(Sender: TObject);
    procedure CAMBPASClick(Sender: TObject);
    procedure PegardelPortapapeles1Click(Sender: TObject);
    procedure copiarGrid(g:TstringGrid);
    function PegarExcel: Boolean;
    procedure ExportaraExcel1Click(Sender: TObject);
    procedure ColorClaveSATaPercepciones1Click(Sender: TObject);
    procedure ColocarClaveSATaDeducciones1Click(Sender: TObject);

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
begin

   CLOSE;
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

procedure TForma.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key =27 then
     BEGIN presEsc:=true; end;

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

function RefToCell(ARow, ACol: Integer): string;
begin

end;

function SaveAsExcelFile(AGrid: TStringGrid; ASheetName, AFileName: string): Boolean;

begin

end;

function numero(var key:char):char;
begin
  if key in ['0'..'9',#8,'.',#13] then numero:=key else numero:=#7;
end;

procedure TForma.ejercicioExpKeyPress(Sender: TObject; var Key: Char);
begin
key:=numero(key);
end;

procedure TForma.FormCreate(Sender: TObject);
var
entre:boolean;
begin
     entre:=false;
         grid.Cells[0,0]:='Clave';
         grid.Cells[1,0]:='Descripción';
         grid.Cells[2,0]:='Per/Ded';
         grid.Cells[3,0]:='SAT';

         //Abrimos la base de Firebird
  BDFire.Close;
  BDFire.Params.ValueFromIndex[1]:=extractfileDir(paramstr(0))+'\base\DBIMPORT.FDB';
  BDFire.open;

  LIMPIAGRID(GRID);
  GRID.RowCount:=2;
  q.close;
  q.sql.text:='SELECT * FROM CATCONC ORDER BY DESCRIP';
  Q.open;
  while not(q.Eof) do
     begin
        grid.cells[0,grid.rowcount-1]:=q.fieldbyname('CLAVE').asstring;
        grid.cells[1,grid.rowcount-1]:=q.fieldbyname('DESCRIP').asstring;
        grid.cells[2,grid.rowcount-1]:=q.fieldbyname('PERDED').asstring;
        grid.cells[3,grid.rowcount-1]:=q.fieldbyname('CVESAT').asstring;
        grid.RowCount:=grid.RowCount+1;
        q.Next;
        entre:=true;
     end;
  if entre then
     grid.RowCount:=grid.RowCount-1;
  
end;

procedure TForma.Pegar(Sender: TObject);
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
          grid.RowCount:=linea;
          Screen.Cursor:=crDefault;
end;


procedure TForma.CAMBPASClick(Sender: TObject);
var
x:integer;
begin
q.close;
Q.SQL.TEXT:='DELETE FROM CATCONC';
Q.EXECSQL;

for x:=1 to grid.RowCount-1 do
   begin
      q.Close;
      q.sql.text:='INSERT INTO CATCONC (CLAVE,DESCRIP,PERDED,CVESAT) VALUES ('+
      #39+grid.cells[0,x]+#39+','+
      #39+grid.cells[1,x]+#39+','+
      #39+grid.cells[2,x]+#39+','+
      #39+grid.cells[3,x]+#39+')';
      Q.execsql;
   end;
Showmessage('Los registros se guardaron correctamente');
close;

end;

procedure TForma.PegardelPortapapeles1Click(Sender: TObject);
begin
pegar(nil);
end;


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


procedure TForma.ExportaraExcel1Click(Sender: TObject);
begin
copiarGrid(GRID);
end;

procedure TForma.ColorClaveSATaPercepciones1Click(Sender: TObject);
var
cad:string;
x:integer;
begin
  if inputquery('Clave Agrupadora','Clave Agrupadora:',cad) then
     begin
        for x:=1 to grid.rowcount-1 do
            if grid.cells[2,x]='P' then
               grid.cells[3,x]:=cad;
     end;

end;

procedure TForma.ColocarClaveSATaDeducciones1Click(Sender: TObject);
var
cad:string;
x:integer;
begin
  if inputquery('Clave Agrupadora','Clave Agrupadora:',cad) then
     begin
        for x:=1 to grid.rowcount-1 do
            if grid.cells[2,x]='D' then
               grid.cells[3,x]:=cad;
     end;
END;

end.
