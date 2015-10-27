unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, Buttons, Libreria, Main, ekrtf,
  ekbasereport, shellapi, OleServer, Excel97, Comobj, ImgList,ClipBrd ;

  type
   mygrid=class(TStringGrid)
  public
    procedure MoveColumn(FromIndex, ToIndex: Longint);
    procedure MoveRow(FromIndex, ToIndex: Longint);
  end;
  TFDetalle = class(TPFDetalle)
    Label2: TLabel;
    q: TQuery;
    s: TQuery;
    grid: TStringGrid;
    ofil: TOpenDialog;
    Generar: TSpeedButton;
    Tick: TEkRTF;
    QReporta: TQuery;
    qactdia: TQuery;
    QACTPER: TQuery;
    Qrel: TQuery;
    conoc: TQuery;
    habtec: TQuery;
    habhum: TQuery;
    QactEve: TQuery;
    exp: TQuery;
    qp3: TQuery;
    qp1: TQuery;
    qp2: TQuery;
    qp4: TQuery;
    qp6: TQuery;
    qp5: TQuery;
    qp7: TQuery;
    qp8: TQuery;
    qp9: TQuery;
    qp10: TQuery;
    SpeedButton1: TSpeedButton;
    ayuda: TPopupMenu;
    Copiar1: TMenuItem;
    ImprimirReporteSeleccionado1: TMenuItem;
    ImprimirtodoslosReportes1: TMenuItem;
    BARRA: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cancelar1Click(Sender: TObject);
    function RNombre : String ; override;
    Procedure exportarSIT;
    function XlstoHoja(AXLSFile: string): Boolean;
    procedure gridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GenerarClick(Sender: TObject);
    procedure gridDblClick(Sender: TObject);
    procedure ImprimeRep(n:string; OP:string);
    procedure SpeedButton1Click(Sender: TObject);
    procedure copiarGrid;
    procedure Copiar1Click(Sender: TObject);
    procedure ImprimirReporteSeleccionado1Click(Sender: TObject);
    procedure ImprimirtodoslosReportes1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;
  FMain : TFMain ;
  LING,COLG:INTEGER;
  LINGp,COLGp:INTEGER;
  TABU:BOOLEAN;
  vures:string;
   VURES_DESC:STRING;
fechaGen:string;

implementation


//uses Repo;

{$R *.DFM}


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


{===============================================================================
 Se envia una cadena JOSE y el número de espacios se dejen a lo ultimo
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
try deletefile(extractfiledir(paramstr(0))+'\File.xlsx'); except end;
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


procedure ExportarGrXLS(gr:TstringGrid);
var
id:integer;
x,y:integer;
ExcelApplication1:TExcelApplication;
ExcelWorkbook1: TExcelWorkbook;
ExcelWorksheet1: TExcelWorksheet;
begin
try deletefile(extractfiledir(paramstr(0))+'\File.xls'); except end;
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
procedure borra_row(sender:tobject; lin:integer);
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



procedure TFDetalle.FormCreate(Sender: TObject);
begin
 FMain := TFMain(Owner) ;
 ToolBar1.Images := FMain.Iconos ;
 Menu.Images := FMain.Iconos ;
 Height := 464;
 Width :=  806 ;

end;

procedure TFDetalle.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TFDetalle.Cancelar1Click(Sender: TObject);
begin
 close ;
end;

function TFDetalle.RNombre : String ;

begin
 VSql.Clear ;
 result := ActiveControl.Name ;

end;


Procedure TFDetalle.exportarSIT;
var
filTran:TstringList;
nombre:string;
apepat:string;
apemat:string;
x:integer;
ContFil:integer;
bancost:string;
nombFile:String;
begin
  filtran:=TstringList.create;
  filtran.Clear;
  contFil:=1;
 { nombFile:=copy(GRUPO.TEXT,1,21)+'X'+stringReplace(nomfec.TEXT,'/','',[rfReplaceAll])+anio.text;
  NOMBFILE:=stringReplace(nombfile,' ','X',[rfReplaceAll]);
  filtran.Add('H'+
               colocaceros(ConvenioSIT.text,9)+
               formatdatetime('yyyy-mm-dd',fecha1sit.date)+
               colocaespacios(nombfile,30)+
               '00'+
               soloespacios(3)+
               soloespacios(35)+
               soloespacios(22)+
               soloespacios(3)+
               soloespacios(141));
         contfil:=0;
         for x:=1 to gridgr.rowcount-1 do
           begin
             nombre:= stringReplace(gridgr.Cells[4,x],'Ñ','N',[rfReplaceAll]);
             nombre:= stringReplace(NOMBRE,'.','',[rfReplaceAll]);
             nombre:=copy(nombre,1,40);

             apepat:= stringReplace(gridgr.Cells[5,x],'Ñ','N',[rfReplaceAll]);
             apepat:= stringReplace(apepat,'.','',[rfReplaceAll]);
             apepat:=copy(apepat,1,30);

             apemat:= stringReplace(gridgr.Cells[6,x],'Ñ','N',[rfReplaceAll]);
             apemat:= stringReplace(apemat,'.','',[rfReplaceAll]);
             apemat:=copy(apemat,1,20);


             filtran.Add( 'D'+
                          'A'+
                          colocaespacios('PAGO'+gridgr.cells[1,x],20)+
                          colocaespacios(gridgr.cells[1,x],30)+
                          'PDV'+
                          '1'+
                          Soloespacios(7)+
                          //colocaespacios('PAGO QUINCENA '+stringReplace(NomFec.text,'/','',[rfReplaceAll])+anio.text,40)+
                          soloespacios(40)+
                          COLOCAESPACIOS(copy(nombre+' '+apepat+' '+apemat,1,35),35)+Soloespacios(5)+
                          'M'+
                          'MXP'+
                          colocaceros(stringReplace(gridgr.cells[3,x],'.','',[rfReplaceAll]),15)+
                          '00'+
                          Soloespacios(40)+
                          formatdatetime('yyyy-mm-dd',fecha2sit.date)+
                          formatdatetime('yyyy-mm-dd',fecha3sit.date)+
                          soloespacios(2)+
                          soloespacios(30));
              contFil:=ContFil+1;
           end;

       filtran.Add('T'+
                   colocaceros(inttostr(contFil),5)+
                   colocaceros(stringReplace(totalgr.caption,'.','',[rfReplaceAll]),15)+
                   colocaceros('',5)+
                   colocaceros('',15)+
                   colocaceros('',5)+
                   colocaceros('',15)+
                   colocaceros('',5)+
                   colocaceros('',15)+
                   colocaceros('',5)+
                   colocaceros('',15)+
                   colocaceros('',5)+
                   colocaceros('',15)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                   colocaceros('',4)+
                   colocaceros('',9)+
                  soloespacios(5));

       CreateDir('c:\Transferencias\');
       CreateDir('c:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\');
       filtran.SaveToFile('C:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\'+nombFile+'.TXT');
       ShellExecute(handle, 'open', PChar('C:\Transferencias\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\'+NOMBFILE+'.TXT'), nil, nil, SW_show);
       PSAN.visible:=false;    }
end;



{===============================================================================
 Exporta un archivo excel a un grid
 ===============================================================================}

function Xls_To_StringGrid(AGrid: TStringGrid; AXLSFile: string; numH:integer): Boolean;
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

     Sheet := XLApp.Workbooks[1].WorkSheets[numh];
    //Sheet := XLApp.Workbooks[ExtractFileName(AXLSFile)].WorkSheets[numh];

    // In order to know the dimension of the WorkSheet, i.e the number of rows
    // and the number of columns, we activate the last non-empty cell of it
    Sheet.Activate;
    Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;

    // Get the value of the last row
    x := XLApp.ActiveCell.Row;
    // Get the value of the last column
    y := XLApp.ActiveCell.Column;

    // Set Stringgrid's row &col dimensions.

    AGrid.RowCount := x;
    AGrid.ColCount := y;

    // Assign the Variant associated with the WorkSheet to the Delphi Variant
    //XLApp.Range['A1', XLApp.Cells.Item[X, Y]].NumberFormat := '';
    RangeMatrix := XLApp.Range['A1', XLApp.Cells.Item[X, Y]].Value;

    //  Define the loop for filling in the TStringGrid
    k := 1;
    repeat
      for r := 1 to y do
        TRY AGrid.Cells[(r - 1), (k - 1)] := RangeMatrix[K, R];  EXCEPT END;
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


function TFDetalle.XlstoHoja( AXLSFile: string): Boolean;
const
  xlCellTypeLastCell = $0000000B;
var
  XLApp, Sheet: OLEVariant;
  RangeMatrix: Variant;
  x, y, k, r: Integer;
begin
 
end;


procedure TFDetalle.gridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
if (key=46) AND  (linG<>(sender as TstringGrid).rowcount-1)  then
   if Application.MessageBox('¿Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
         if (key=46) and ((sender as TstringGrid).rowcount>2) then
                borra_row((sender as TstringGrid),linG);
         if (key=46) and ((sender as TstringGrid).rowcount=2) then
                limpia_linea((sender as TstringGrid),2);
      end;

end;

procedure TFDetalle.gridSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
ling:=arow;
colg:=acol;
end;


procedure TFDetalle.ImprimeRep(n:string; OP:string);
var
vis:string;
venci:string;
Subtotal, total, isr:real;
TipoNom:string;
begin

 CreateDir('c:\RepCuestionario\');

if not(fileexists(ExtractFiledir(Paramstr(0))+'\Cuestionario.rtf')) then
  devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','CUESTIONARIO','rtf');


  Tick.ClearVars;
  Tick.CreateVar('FECHA',formatdatetime('dd/mm/yyyy',date));
  Tick.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));

  Q.close;
  q.sql.text:='SELECT * FROM CCUESTIONA where numero='+n;
  q.OPEN;
  Tick.CreateVar('DIA',formatdatetime('dd',q.fieldbyname('FECHA').asdatetime));
  Tick.CreateVar('MES',formatdatetime('mm',q.fieldbyname('FECHA').asdatetime));
  Tick.CreateVar('ANIO',formatdatetime('yyyy',q.fieldbyname('FECHA').asdatetime));


  Qreporta.close;
  Qreporta.sql.text:='SELECT * FROM CRESPUESTA where numero='+n+' AND TIPO='+#39+'REPORTAN'+#39;
  Qreporta.OPEN;

  Qactdia.close;
  Qactdia.sql.text:='SELECT * FROM CRESPUESTA where numero='+n+' AND TIPO='+#39+'ACTDIA'+#39;
  Qactdia.OPEN;
  QactPer.close;
  QactPer.sql.text:='SELECT * FROM CRESPUESTA where numero='+n+' AND TIPO='+#39+'ACTPER'+#39;
  QactPer.OPEN;

  QactEve.close;
  QactEve.sql.text:='SELECT * FROM CRESPUESTA where numero='+n+' AND TIPO='+#39+'ACTEVE'+#39;
  QactEve.OPEN;

  Qrel.close;
  Qrel.sql.text:='SELECT * FROM CRELACION where numero='+n;
  Qrel.OPEN;

  conoc.close;
  conoc.sql.text:='SELECT * FROM CRESPUESTA2 where numero='+n+' AND TIPO='+#39+'CONOC'+#39;
  conoc.OPEN;

  HABTEC.close;
  HABTEC.sql.text:='SELECT * FROM CRESPUESTA2 where numero='+n+' AND TIPO='+#39+'HABTEC'+#39;
  HABTEC.OPEN;

    HABHUM.close;
  HABHUM.sql.text:='SELECT * FROM CRESPUESTA2 where numero='+n+' AND TIPO='+#39+'HABHUM'+#39;
  HABHUM.OPEN;


  EXP.close;
  EXP.sql.text:='SELECT * FROM CRESPUESTA2 where numero='+n+' AND TIPO='+#39+'EXP'+#39;
  EXP.OPEN;

 //Experiencia Jerarquica
 qp1.Close;
 qp1.sql.text:='SELECT * FROM CCATALOGOS WHERE PREG=11 order by despreg';
 Qp1.open;




  Tick.InFile:=ExtractFiledir(Paramstr(0))+'\Cuestionario.rtf';
  Tick.OutFile:='c:\RepCuestionario\RCuest'+n+'.rtf';

  if op='ABRIR' THEN
      Tick.ExecuteOpen([Q, Qreporta,Qactdia,Qactper, Qacteve, Qrel,CONOC,HABTEC,HABHUM,EXP,qp1,qp2,qp3,qp4,qp5,qp6,qp7,qp8,qp9,qp10],SW_SHOW)
  else
     Tick.Execute([Q, Qreporta,Qactdia,Qactper, Qacteve, Qrel,CONOC,HABTEC,HABHUM,EXP,qp1,qp2,qp3,qp4,qp5,qp6,qp7,qp8,qp9,qp10]);
//  ShellExecute(xmodulo.handle, 'print', PChar(ExtractFiledir(Paramstr(0))+'\RRepFN.rtf'), nil, nil, SW_HIDE);
end;



procedure TFDetalle.GenerarClick(Sender: TObject);

var
x:integer;
lin:integer;
begin
  inherited;

  


  grid.rowcount:=2;

  grid.cells[0,0]:='Núm.';
  grid.cells[1,0]:='Puesto';
  grid.cells[2,0]:='Entrevistado';
  grid.cells[3,0]:='Fecha';

  Q.CLOSE;
  Q.SQL.TEXT:='SELECT count(*) FROM CCUESTIONA';
  Q.open;
    barra.Max:=q.fields[0].asinteger;

  Q.CLOSE;
  Q.SQL.TEXT:='SELECT * FROM CCUESTIONA ORDER BY NUMERO';
  Q.open;

  barra.Position:=0;
  while not(q.eof) do
     begin
        grid.cells[0,grid.rowcount-1]:=q.fieldbyname('numero').asstring;
        grid.cells[1,grid.rowcount-1]:=q.fieldbyname('nombre').asstring;
        grid.cells[2,grid.rowcount-1]:=q.fieldbyname('entrevistado').asstring;
         grid.cells[3,grid.rowcount-1]:=q.fieldbyname('Fecha').asstring;
        q.next;
        grid.rowcount:=grid.rowcount+1;
        barra.Position:=barra.Position+1;
     end;
   Ling:=1;
   colg:=0;
   barra.Position:=0;

end;

procedure TFDetalle.gridDblClick(Sender: TObject);
begin
  inherited;
   exportarGrXLS(grid);
end;

procedure TFDetalle.SpeedButton1Click(Sender: TObject);
var
lin,x:integer;
camp,reg:integer;

begin
  inherited;
  q.Close;
  q.sql.text:='CALL CreaFileCuestion()';
  Q.execsql;

  Q.CLOSE;
  Q.SQL.TEXT:='SELECT COUNT(*) FROM CCAMPOS ';
  Q.open;
  camp:=q.fields[0].asinteger;
   Q.CLOSE;
  Q.SQL.TEXT:='SELECT COUNT(*) FROM CCUESTGEN';
  Q.open;
  reg:=q.fields[0].asinteger;

  barra.max:=reg*camp;
  barra.position:=0;

  grid.ColCount:=1;
  grid.RowCount:=2;
  x:=0;
  Q.CLOSE;
  Q.SQL.TEXT:='SELECT * FROM CCAMPOS ORDER BY NUMERO';
  Q.open;
  Q.first;
  while not(q.eof) do
     begin
         grid.Cells[x,0]:=q.Fields[0].asstring;
         grid.ColCount:=grid.ColCount+1;
         x:=x+1;


         s.Close;
         s.sql.text:='SELECT '+q.Fields[0].asstring+' FROM CCUESTGEN';
         S.OPEN;

         lin:=1;
         while not (s.eof) do
            begin
               grid.Cells[x,lin]:= s.Fields[0].asstring;
               IF X=1 THEN
                 GRID.ROWCOUNT:=GRID.ROWCOUNT+1;
               s.next;
               lin:=lin+1;
               barra.position:=barra.position+1;
            end;
        q.next;
     end;
     barra.position:=0;
end;

procedure TFDetalle.copiarGrid;
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
barra.max:=grid.rowcount-1;
for R := 0 to GRID.RowCount - 1 do
    begin
        for C := 0 to GRID.ColCount - 1 do
            begin
                S := S + stringReplace(TRIM(GRID.Cells[C, R]),'#13','',[rfReplaceAll]); //Aqui vamos concatenando las celdas del stringGrid.
                if C < GRID.ColCount - 1 then
                   S := S + TAB; //esta condición es para ir tabulando el las columnas de tal forma que no salgan pegadas.
            end;
        if R < GRID.RowCount - 1 then
           S := S + CR;
        barra.position:=barra.position+1;
     end;
Clipboard.AsText := S; //Este objeto es el que hace todo el trabajo de copiar el texto ala papelera de reciclaje
Showmessage('Registros copiados --> Abra Excel y presione CTRL + V');
barra.position:=0;
END;

procedure TFDetalle.Copiar1Click(Sender: TObject);
begin
  inherited;
copiarGrid;
end;

procedure TFDetalle.ImprimirReporteSeleccionado1Click(Sender: TObject);
begin
  inherited;
ImprimeRep(GRID.CELLS[0,LING],'ABRIR');
end;

procedure TFDetalle.ImprimirtodoslosReportes1Click(Sender: TObject);
var
x:integer;
begin
  inherited;
BARRA.Max:=grid.rowcount-2;
BARRA.PoSITION:=1;
for x:=1 to grid.rowcount-2 do
    begin
      ImprimeRep(GRID.CELLS[0,x],'NO ABRIR');
      BARRA.PoSITION:=BARRA.PoSITION+1;
    end;
Showmessage('Los reportes se crearon en C:\RepCuestionario');
barra.position:=0;

end;

End.
