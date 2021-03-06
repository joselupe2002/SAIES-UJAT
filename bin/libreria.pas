unit libreria;

interface

uses Sysutils, Classes, Dialogs, Controls, StdCtrls, DBTables, DB, error, EKRTF,
Forms, ExtCtrls, Grids, DBCGrids, OleServer, Excel97, Comobj,ClipBrd,
ComCtrls,DBCtrls,Messages, graphics, windows;

type

TDBEdit = class(DBCtrls.TDBEdit)
  Private
    procedure Entrada(var M: TMessage); message CM_ENTER;
    procedure Salida(var M: TMessage); message CM_EXIT;
  end;



function replicate(car : Char ; num :Integer):String ;
function pad(cadena : String ; tip,car : Char ; esp : Integer): String;
function cmes( fecha : TDateTime ; lengua : Char ) : String ;
function pesos (canti : Integer) : String ;
function orclfecha(fecha : String) : String ;
function vfecha(cfecha : TEdit ) : Boolean ;
function DiasDelMes( fecha : TDateTime) : Integer;
function iif(expresion : Boolean ; value1, value2 : variant) : variant ;
procedure vcurr(ccurr : TEdit) ;
procedure OraErr(E : Exception)  ;
function str_(cad:string;separador:string):string;
function secondCad(cad:string;separador:string):string;
function Knumero(var key:char):char;
procedure LimpiafileLog(s:string);
procedure savetofileLog(s:string);
procedure devRTF(q:TQuery;tabla:string;campoF:string;campo:string;valor:string;Extension:String);
function Khora(var key:char):char;
function Kfecha(var key:char):char;
function buscaenGrid(grid:TStringGrid;col:integer;cadBuscar:string):integer;
procedure ExportarXLS(Q:TQuery);
procedure CrearFile(fi:string);
Function SumaColGrid(g:TstringGrid;Col:Integer):real;
function strtofloatTes(c:string):real;
Procedure LimpiaGrid(g:TStringGrid);
function colocaCeros(n:string;nc:integer):string;
function colocaEspacios(n:string;nesp:integer):string;
procedure Sortgrid(Grid : TStringGrid; SortCol:integer; by: byte);
procedure exportarGrXLS(gr:TstringGrid);
function colocaEspaciosAntes(n:string;nesp:integer):string;
function soloEspacios(nesp:integer):string;
Function SumaColGridInicia(g:TstringGrid;Col:Integer;colCond:integer;Inicia:string):real;
procedure AbrirExcel(c:String);
function CopiarExcel(AGrid: TStringGrid; AXLSFile: string): Boolean;
function Xls_To_StringGrid(AGrid: TStringGrid; AXLSFile: string): Boolean;
Function SumaColGridOfCero(g:TstringGrid;Col:Integer):real;
procedure copiarDBGridP(q:Tquery; max:integer; barra:TprogressBar);
procedure copiarGridP(g:TstringGrid;barra:TProgressBar);
Function SumaColGridCond(g:TstringGrid;Col:Integer; condicion:string; colCond:integer):real;
Function SumaColGridDesdeLinea(g:TstringGrid;Col:Integer;inicia:integer):real;

implementation

Const
ColorEnt=clwhite;
ColorSal=$00DAFEE2;
FontEnt =[fsbold];
FontSal =[fsbold];
FColEnt = clNavy;
FColSal = clBlack;


{===============================================================================
 Cambia de color a los TEdit al momento de colocar el focus en el componente
 ===============================================================================}
procedure TDBEdit.Entrada(var M: TMessage);
begin
  inherited;
  if (color<>$00DFDFDF) and not(readonly) then
     begin
       Color := ColorEnt;
       font.Style:=fontEnt;
       font.Color:=FColEnt;
     end;
end;

{===============================================================================
 Cambia de color a los TEdit al momento de dejar el focus en el componente
 ===============================================================================}
procedure TDBEdit.Salida(var M: TMessage);
begin
  inherited;
  if (color<>$00DFDFDF) and not(readonly) then
     begin
       Color:=ColorSal;
       font.Style:=fontSal;
       font.Color:=FColSal;
     end;
end;


procedure copiarDBGridP(q:Tquery; max:integer; barra:TprogressBar);
const
TAB = #9; //Tabular para dar espacio entre las columnas.
CR = #13; // Simula la tecla enter, es decir separa cada fila.
var
R, C: integer; // R= de row Fila, y C= de columna
S: string; // Es el buffer donde se va a guardar el texto a copiar.
begin
{Cuadricula es el nombre del componente StringGrid}
S := '';
barra.position:=0;
barra.max:=max;
r:=0;

for C := 0 to q.FieldCount - 1 do
    begin
        S := S + stringReplace(TRIM(q.Fields[c].DisplayName),'#13','',[rfReplaceAll]); //Aqui vamos concatenando las celdas del stringGrid.
        if C < q.FieldCount - 1 then
        S := S + TAB; //esta condici�n es para ir tabulando el las columnas de tal forma que no salgan pegadas.
    end;
S := S + CR;
q.first;
while not(q.eof) do
    begin
        for C := 0 to q.FieldCount - 1 do
            begin
                S := S + stringReplace(TRIM(q.Fields[c].asstring),'#13','',[rfReplaceAll]); //Aqui vamos concatenando las celdas del stringGrid.
                if C < q.FieldCount - 1 then
                   S := S + TAB; //esta condici�n es para ir tabulando el las columnas de tal forma que no salgan pegadas.
            end;
           S := S + CR;
        barra.position:=barra.position+1;
        r:=r+1;
        q.next;
     end;
Clipboard.AsText := S; //Este objeto es el que hace todo el trabajo de copiar el texto ala papelera de reciclaje
barra.position:=0;
END;


procedure copiarGridP(g:TstringGrid; barra:TProgressBar);
const
TAB = #9; //Tabular para dar espacio entre las columnas.
CR = #13; // Simula la tecla enter, es decir separa cada fila.
var
R, C: integer; // R= de row Fila, y C= de columna
S: string; // Es el buffer donde se va a guardar el texto a copiar.
begin
{Cuadricula es el nombre del componente StringGrid}
S := '';
barra.position:=0;
barra.max:=g.rowcount-1;
for R := 0 to G.RowCount - 1 do
    begin
        for C := 0 to G.ColCount - 1 do
            begin
                S := S + stringReplace(TRIM(G.Cells[C, R]),'#13','',[rfReplaceAll]); //Aqui vamos concatenando las celdas del stringGrid.
                if C < G.ColCount - 1 then
                   S := S + TAB; //esta condici�n es para ir tabulando el las columnas de tal forma que no salgan pegadas.
            end;
        if R < G.RowCount - 1 then
           S := S + CR;
        barra.position:=barra.position+1;
     end;
Clipboard.AsText := S; //Este objeto es el que hace todo el trabajo de copiar el texto ala papelera de reciclaje
barra.position:=0;
END;


procedure Sortgrid(Grid : TStringGrid; SortCol:integer; by: byte);
var
i,j : Integer;
temp : TStringList;
begin
Temp:= TStringList.Create;
with Grid do
   begin
       for i := FixedRows to RowCount - 2 do
           begin
               for j:= i+1 to rowcount-1 do
                  begin
                     if (by=0) then // ascendente
                         begin
                            if AnsiCompareText(Cells[SortCol,i], Cells[SortCol,j]) < 0 then
                                begin
                                  temp.assign(rows[j]);
                                  rows[j].assign(rows[i]);
                                  rows[i].assign(temp);
                                end;
                          end
                     else // descendente
                          begin
                              if AnsiCompareText(Cells[SortCol,i], Cells[SortCol,j]) > 0 then
                                  begin
                                      temp.assign(rows[j]);
                                      rows[j].assign(rows[i]);
                                      rows[i].assign(temp);
                                   end;
                          end;
                  end;
           end;
     end;
temp.free;
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


{===============================================================================
 Se envia una cadena JOSE y el n�mero de espacios se dejen a lo ultimo
 ===============================================================================}
function colocaEspacios(n:string;nesp:integer):string;
var
x:integer;
begin
   for x:=1 to nesp-length(n) do n:=n+' ';
colocaespacios:=n;
end;


function colocaEspaciosAntes(n:string;nesp:integer):string;
var
x:integer;
begin
   for x:=1 to nesp-length(n) do n:=' '+n;
colocaespaciosAntes:=n;
end;

function soloEspacios(nesp:integer):string;
var
x:integer;
n:string;
begin
   n:='';
   for x:=1 to nesp do n:=n+' ';
soloEspacios:=n;
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



{===============================================================================
Convierte una cadena a flotante, pero antes remplaza las 2,345.56 = 2345.56
 ===============================================================================}
function strtofloatTes(c:string):real;
begin
  c:=StringReplace(c,',','',[rfReplaceAll]);
  strtofloatTes:=strtofloat(c);
end;


{===============================================================================
Suma la columna dada de un TstringGrid
 ===============================================================================}
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




{===============================================================================
Suma la columna de un StringGrid desde una linea dada
 ===============================================================================}
Function SumaColGridDesdeLinea(g:TstringGrid;Col:Integer;inicia:integer):real;
var x:integer;
sum:real;
val:real;
begin
   sum:=0;
   for x:=inicia to g.rowcount-1 do
      begin
         try val:=strtofloatTes(g.cells[col,x]) except val:=0; end;
         sum:=sum+val;
      end;
SumaColGridDesdeLinea:=sum;
end;


Function SumaColGridCond(g:TstringGrid;Col:Integer; condicion:string; colCond:integer):real;
var x:integer;
sum:real;
val:real;
begin
   sum:=0;
   for x:=1 to g.rowcount-1 do
      begin
         if  g.cells[colCond,x]=condicion then
             begin
                 try val:=strtofloatTes(g.cells[col,x]) except val:=0; end;
                 sum:=sum+val;
             end;
      end;
SumaColGridCond:=sum;
end;


Function SumaColGridOfCero(g:TstringGrid;Col:Integer):real;
var x:integer;
sum:real;
val:real;
begin
   sum:=0;
   for x:=0 to g.rowcount-1 do
      begin
         try val:=strtofloatTes(g.cells[col,x]) except val:=0; end;
         sum:=sum+val;
      end;
SumaColGridofCero:=sum;
end;

{===============================================================================
Suma la columna dada de un TstringGrid
 ===============================================================================}
Function SumaColGridInicia(g:TstringGrid;Col:Integer;colCond:integer;Inicia:string):real;
var x:integer;
sum:real;
val:real;
begin
   sum:=0;
   for x:=1 to g.rowcount-1 do
      begin
         try val:=strtofloatTes(g.cells[col,x]) except val:=0; end;
         if copy(g.cells[colCond,x],1,length(Inicia))=Inicia then
            sum:=sum+val;
      end;
SumaColGridInicia:=sum;
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





procedure ExportarXLS(Q:TQuery);
var
id:integer;
x,y:integer;
ExcelApplication1:TExcelApplication;
ExcelWorkbook1: TExcelWorkbook;
ExcelWorksheet1: TExcelWorksheet;
begin
try deletefile(pchar(extractfiledir(paramstr(0))+'\File.xlsx')); except end;
crearFile(extractfiledir(paramstr(0))+'\File.xlsx');

ExcelApplication1:=TExcelApplication.create(nil);
ExcelWorkbook1:= TExcelWorkbook.create(nil);;
ExcelWorksheet1:=TExcelWorksheet.create(nil);;
               showmessage('Exportar....');

ExcelApplication1.Workbooks.Open(extractfiledir(paramstr(0))+'\File.xlsx',
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,id);
  
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


procedure AbrirExcel(c:String);
var
id:integer;
x,y:integer;
ExcelApplication1:TExcelApplication;
ExcelWorkbook1: TExcelWorkbook;
ExcelWorksheet1: TExcelWorksheet;
begin
try deletefile(pchar(extractfiledir(paramstr(0))+'\File.xlsx')); except end;
crearFile(extractfiledir(paramstr(0))+'\File.xlsx');
ExcelApplication1:=TExcelApplication.create(nil);
ExcelWorkbook1:= TExcelWorkbook.create(nil);;
ExcelWorksheet1:=TExcelWorksheet.create(nil);;

ExcelApplication1.Workbooks.Open(extractfiledir(paramstr(0))+'\File.xlsx',
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,id);
  
  ExcelApplication1.Visible[id]:=true;
  ExcelWorkbook1.ConnectTo(ExcelApplication1.ActiveWorkbook);
  ExcelWorksheet1.ConnectTo(ExcelApplication1.ActiveSheet as _Worksheet);
  excelworksheet1.ConnectTo(excelworkbook1.Sheets.Item[1] as _Worksheet);
  excelworksheet1.Activate;
   ExcelWorksheet1.Paste;
end;



function CopiarExcel(AGrid: TStringGrid; AXLSFile: string): Boolean;
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
      XLAPP.Workbooks.Close;
end;


function Xls_To_StringGrid(AGrid: TStringGrid; AXLSFile: string): Boolean;
const
  xlCellTypeLastCell = $0000000B;
var
  XLApp, Sheet: OLEVariant;
  RangeMatrix: Variant;
  x, y, k, r: Integer;
begin
  limpiaGrid(agrid);
  for x:=0 to agrid.colcount-1 do agrid.cells[x,0]:='';

  Result := False;
  // Create Excel-OLE Object
  XLApp := CreateOleObject('Excel.Application');
  try
    // Hide Excel
    XLApp.Visible := False;

    // Open the Workbook
    XLApp.Workbooks.Open(AXLSFile);

    // Sheet := XLApp.Workbooks[1].WorkSheets[1];
    Sheet := XLApp.Workbooks[ExtractFileName(AXLSFile)].WorkSheets[1];

    // In order to know the dimension of the WorkSheet, i.e the number of rows
    // and the number of columns, we activate the last non-empty cell of it

    Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
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
        AGrid.Cells[(r - 1), (k - 1)] := RangeMatrix[K, R];
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




procedure ExportarGrXLS(gr:TstringGrid);
var
id:integer;
x,y:integer;
ExcelApplication1:TExcelApplication;
ExcelWorkbook1: TExcelWorkbook;
ExcelWorksheet1: TExcelWorksheet;
begin
try deletefile(pchar(extractfiledir(paramstr(0))+'\File.xls')); except end;
crearFile(extractfiledir(paramstr(0))+'\File.xls');
ExcelApplication1:=TExcelApplication.create(nil);
ExcelWorkbook1:= TExcelWorkbook.create(nil);;
ExcelWorksheet1:=TExcelWorksheet.create(nil);;
               showmessage('Exportar....');

ExcelApplication1.Workbooks.Open(extractfiledir(paramstr(0))+'\File.xls',
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,id);

  ExcelApplication1.Visible[id]:=true;
  ExcelWorkbook1.ConnectTo(ExcelApplication1.ActiveWorkbook);
  ExcelWorksheet1.ConnectTo(ExcelApplication1.ActiveSheet as _Worksheet);
  excelworksheet1.ConnectTo(excelworkbook1.Sheets.Item[1] as _Worksheet);
  excelworksheet1.Activate;

  ExcelWorksheet1.Cells.Item[1,1].Font.Bold:=true;

  for x:=0 to gr.colcount-1 do
     begin
        ExcelWorksheet1.Cells.Item[1,x+1].Font.Bold:=true;
        ExcelWorksheet1.Cells.Item[1,x+1].Interior.Color:=$00FEFBE7;
        ExcelWorksheet1.Cells.Item[1,x+1].Borders.Color := $FFFFFFFF;
        ExcelWorksheet1.Cells.Item[1,x+1].value:=gr.cells[x,0];
     end;

  for x:=1 to gr.rowcount-1 do
        for y:=0 to gr.colcount-1 do
            begin
              ExcelWorksheet1.Cells.Item[x+1,y+1].value:=gr.cells[y,x];
              ExcelWorksheet1.Cells.Item[x+1,y+1].Borders.Color := $FFFFFFFF;
            end;
//ShellExecute(handle, 'open', PChar('C:\Transferencias\'+stringReplace(inicia.text,'/','',[rfReplaceAll])+'\'+GRUPO.TEXT+'_'+stringReplace(RNOMINA.TEXT,'/','',[rfReplaceAll])+'.slk'), nil, nil, SW_show);

// ExcelWorksheet1.Disconnect;
// ExcelWorkbook1.Disconnect;
// ExcelApplication1.Disconnect;
end;


function buscaenGrid(grid:TStringGrid;col:integer;cadBuscar:string):integer;
var
x:integer;
pos:integer;
begin
  pos:=-1;
  for x:=0 to grid.rowcount do
     begin
       if grid.cells[col,x]=cadBuscar then
          begin
             pos:=x;
             break;
          end;
     end;
  buscaenGrid:=pos;
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


procedure LimpiafileLog(s:string);
var
l:TstringList;
begin
l:=TStringList.create();
l.SaveToFile(extractfiledir(paramstr(0))+'\log.txt');
l.free;
end;


 {===============================================================================
 Graba una cadena al archivo LOG que se encuentra en la carpeta File
 ===============================================================================}
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


 {===============================================================================
 Escribir solamente  numero y punto 456.78
 ===============================================================================}
function Knumero(var key:char):char;
begin
  if key in ['0'..'9',#8,'.','-',#13] then Knumero:=key else Knumero:=#7;
end;


 {===============================================================================
 Escribir solamente  numero y punto 456.78
 ===============================================================================}
function Khora(var key:char):char;
begin
  if key in ['0'..'9',#8,':',#13] then Khora:=key else Khora:=#7;
end;

 {===============================================================================
 Escribir solamente  numero y punto 456.78
 ===============================================================================}
function Kfecha(var key:char):char;
begin
  if key in ['0'..'9',#8,'/',#13] then Kfecha:=key else Kfecha:=#7;
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
 Devuelve la parte derecha separada por "separador" 01-huimanguillo Res=Huimanguillo
 ===============================================================================}
function secondCad(cad:string;separador:string):string;
begin
   if pos(separador,cad)>0 then
      secondCad:=copy(cad,pos(separador,cad)+1,length(cad))
   else
      secondCad:=cad;
end;



function replicate(car : Char ; num :Integer):String ;
begin
 result := '' ;
 while length(result) < num do result := result+ car ;
end ;

function pad(cadena : String ; tip,car : Char ; esp : Integer): String;
var num : Integer ;
begin
 num := esp - length(cadena) ;
 if num < 0 then result := replicate(car,esp)
 else if tip= 'R' then result := replicate(car,num)+ cadena
 else if tip= 'L' then result := cadena+ replicate(car,num)
 else if tip= 'C' then
  begin
   num := num div 2 ;
   result := replicate(car,num)+ cadena+ replicate(car,num);
   if length(result) < esp then result := result+ car;
  end ;
end;

function cmes( fecha : TDateTime ; lengua : Char ) : String ;
var mes : integer ;
begin
 mes := StrToInt(copy(DateToStr(fecha),4,2)) ;
 case mes of
   1: if lengua= 'I' then result := 'JANUARY' else result := 'ENERO' ;
   2: if lengua= 'I' then result := 'FEBRUARY' else result := 'FEBRER0' ;
   3: if lengua= 'I' then result := 'MARCH' else result := 'MARZO' ;
   4: if lengua= 'I' then result := 'APRIL' else result := 'ABRIL' ;
   5: if lengua= 'I' then result := 'MAY' else result := 'MAYO' ;
   6: if lengua= 'I' then result := 'JUNE' else result := 'JUNIO' ;
   7: if lengua= 'I' then result := 'JULY' else result := 'JULIO' ;
   8: if lengua= 'I' then result := 'AUGUST' else result := 'AGOSTO' ;
   9: if lengua= 'I' then result := 'SEPTEMBER' else result := 'SEPTIEMBRE' ;
  10: if lengua= 'I' then result := 'OCTOBER' else result := 'OCTUBRE' ;
  11: if lengua= 'I' then result := 'NOVEMBER' else result := 'NOVIEMBRE' ;
  12: if lengua= 'I' then result := 'DECEMBER' else result := 'DICIEMBRE' ;
 else
  result := '' ;
 end ;
end ;

function pesos (canti : Integer) : String ;
 var unidad,decena, centena : TStringList ;
     millon, miles, xresto : Integer ;
     fmiles : Currency ;
     cadena : String ;
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

begin
 if canti > 999999999 then
 begin
  result := '***************' ;
  abort ;
 end ;

 cadena := '' ;
 unidad  := TStringList.Create ;
 decena  := TStringList.Create ;
 centena := TStringList.Create ;

 unidad.Add('Salen todos') ;
 unidad.Add('UN') ;
 unidad.Add('DOS') ;
 unidad.Add('TRES') ;
 unidad.Add('CUATRO') ;
 unidad.Add('CINCO') ;
 unidad.Add('SEIS') ;
 unidad.Add('SIETE') ;
 unidad.Add('OCHO') ;
 unidad.Add('NUEVE') ;
 unidad.Add('DIEZ') ;
 unidad.Add('ONCE') ;
 unidad.Add('DOCE') ;
 unidad.Add('TRECE') ;
 unidad.Add('CATORCE') ;
 unidad.Add('QUINCE') ;

 decena.Add('Salen Todos') ;
 decena.Add('DIEZ') ;
 decena.Add('VEINTE') ;
 decena.Add('TREINTA') ;
 decena.Add('CUARENTA') ;
 decena.Add('CINCUENTA') ;
 decena.Add('SESENTA') ;
 decena.Add('SETENTA') ;
 decena.Add('OCHENTA') ;
 decena.Add('NOVENTA') ;

 centena.Add('Salen Todos') ;
 centena.Add('CIENTO') ;
 centena.Add('DOSCIENTOS') ;
 centena.Add('TRESCIENTOS') ;
 centena.Add('CUATROCIENTOS') ;
 centena.Add('QUINIENTOS') ;
 centena.Add('SEISCIENTOS') ;
 centena.Add('SETECIENTOS') ;
 centena.Add('OCHOCIENTOS') ;
 centena.Add('NOVECIENTOS') ;

{ Calcula Millones }
 millon := StrToInt( FloatToStr( INT(canti/1000000) ) ) ;
 if millon = 1 then cadena := resto(millon)+ ' MILLON ' ;
 if millon > 1 then cadena := resto(millon)+ ' MILLONES ' ;

{ Calcula Miles }
 fmiles := (canti - (millon * 1000000) )/1000 ;
 miles := StrToInt(FloatToStr( INT(fmiles))) ;
 if miles = 1 then cadena := cadena+ 'MIL ' ;
 if miles > 1 then cadena := cadena+ resto(miles)+ ' MIL ' ;

{Calcula resto }
 xresto := canti - ( (millon * 1000000) + (miles * 1000) ) ;
 if xresto > 0 then cadena := cadena  + resto(xresto) ;

 if length(cadena) = 0 then cadena := 'CERO' ;
 result := cadena ;
end ;

function vfecha(cfecha : TEdit ) : Boolean ;
var fecha : TDate ;
begin
 try
  fecha := StrToDate(cfecha.text) ;
  cfecha.Text := DateToStr(fecha) ;
  result := True ;
 except
  cfecha.SetFocus ;
  showmessage('Fecha no valida') ;
  result := False ;
 end ;
end;

procedure vcurr(ccurr : TEdit) ;
begin
 try
  if (StrToCurr(ccurr.Text)= StrToCurr(ccurr.Text)) then  ;
 except
  showmessage('cantidad no valida') ;
  ccurr.setfocus ;
 end ;
end ;

function orclfecha(fecha : String) : String ;
begin
  result := copy(fecha,1,2)+ '-'+ copy(cmes(StrToDate(fecha),'I'),1,3)+
           '-'+ copy(fecha,7,2) ;
end ;

function Bisiesto(ano : Integer) : Boolean;
begin
  Result := (ano mod 4 = 0) 	{ years divisible by 4 are... }
    and ((ano mod 100 <> 0)	{ ...except century years... }
    or (ano mod 400 = 0));	{ ...unless it's divisible by 400 }
end;


function DiasDelMes(fecha : TDateTime) : Integer;
var ano, mes, dia : Word ;
const
{ dias por mes normales }
  DiasPorMes: array[1..12] of Integer =
    (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31) ;

begin
 DecodeDate(fecha, ano, mes, dia) ;
 Result := DiasPorMes[mes];
 if (mes= 2) and Bisiesto(ano) then Inc(Result);
end;

function iif(expresion : Boolean ; value1, value2 : variant) : variant ;
begin
 if expresion then result := value1 else result := value2 ;
end ;


procedure OraErr(E : Exception)  ;
var rollo : PChar ;
 campo, tabla, ncons, LMensaje : String ;
 cual : Word ;
 mQuery : TQuery ;
 SList : TStringList ;
 FError : TFError ;
procedure datos( tt : PChar) ;
begin
 rollo := StrPos( PChar(LMensaje),tt) ;
 if rollo= nil then exit ;
 LMensaje := copy(rollo,4, length(rollo)) ;
 rollo := StrPos(PChar(LMensaje),'$') ;
 tabla := Copy(LMensaje,1, length(LMensaje)- length(rollo) ) ;
 rollo := StrPos(PChar(LMensaje),')') ;
 campo := copy(tabla,2,4)+ '_'+ copy(LMensaje, Length(tabla)+2,
          length(LMensaje)- length(rollo) - Length(tabla) - 1) ;
end ;
begin
 LMensaje := E.Message ;
 rollo := StrPos( PChar(E.Message),'ORA-') ;

 if rollo = nil
 then  cual := 0
 else begin
  ncons := StrPos( PChar(rollo),'(') ;
  ncons := copy(ncons, 2, length(ncons)- 1 - Length(StrPos( PChar(ncons), ')' )))  ;
  cual := StrToInt( Copy(rollo,5,5) ) ;
 end ;


 mquery := TQuery.Create(nil) ;
 mquery.DataBaseName := 'Sistema' ;

 case cual of
      1 :             // Primary Key
      begin
       datos('PK$') ;
       if tabla <> '' then
       begin
        mquery.Sql.Add(
        'Select SUBSTR( SUBSTR(COMMENTS, 1, INSTR(COMMENTS, CHR(10), 1,1)-1 ),1,20) As Etiq') ;
        mquery.Sql.Add('FROM ALL_COL_COMMENTS WHERE TABLE_NAME= '''+ tabla+ '''') ;
        mquery.Sql.Add('AND COLUMN_NAME= '''+ campo+ '''') ;
        mquery.Open ;
        if not mquery.eof
        then LMensaje := mquery['Etiq'] + ' no puede ser repetido' ;
       end ;
      end ;

   2290 :   // Check Constraint
    begin
     datos('NN$') ;           // Constraint de Not Null
     if tabla <> '' then
      begin
       mquery.Sql.Add(
       'Select SUBSTR( SUBSTR(COMMENTS, 1, INSTR(COMMENTS, CHR(10), 1,1)-1 ),1,20) As Etiq') ;
       mquery.Sql.Add('FROM ALL_COL_COMMENTS WHERE TABLE_NAME= '''+ tabla+ '''') ;
       mquery.Sql.Add('AND COLUMN_NAME= '''+ campo+ '''') ;
       mquery.Open ;
       if not mquery.eof
       then LMensaje := mquery.FieldByName('Etiq').AsString + ' no puede ser nulo' ;
      end ;
    end ;
   2291 :  // Foreign Key
    begin
     datos('FK$') ;
     if tabla <> '' then
      begin
       mquery.Sql.Add(
       'Select SUBSTR( SUBSTR(COMMENTS, 1, INSTR(COMMENTS, CHR(10), 1,1)-1 ),1,20) As Etiq') ;
       mquery.Sql.Add('FROM ALL_COL_COMMENTS WHERE TABLE_NAME= '''+ tabla+ '''') ;
       mquery.Sql.Add('AND COLUMN_NAME= '''+ campo+ '''') ;
       mquery.Open ;
       if not mquery.eof
       then LMensaje := 'No existe '+ mquery['Etiq'] ;
      end ;
    end ;
  20001 :   // Trigger
   begin
    slist := TStringList.Create ;
    campo := copy(rollo,11, length(rollo)) ;
    slist.Text := campo ;
    campo := slist[0] ;
    if length(campo) <> 0
    then LMensaje := campo ;
    slist.Free ;
   end ;
 end ;

 if LMensaje = E.Message then
 begin
  mquery.Close ;
  mquery.Sql.Clear ;
  mquery.Sql.Add('Select Errm_Mensaje As Mensaje From SErrMes ') ;
  mquery.Sql.Add('Where Errm_Refer= '''+ ncons+ '''') ;
  mquery.Open ;
  if not mquery.eof
  then LMensaje := mquery['Mensaje'] ;
 end ;

 mquery.Close ;
 mquery.Free ;

 FError := TFError.Create(nil) ;
 FError.mMensaje := LMensaje ;
 FError.mError := E.Message ;
 FError.MemoError.Text := LMensaje ;
 FError.ShowModal ;
 FError.Free ;
end ;

end.
