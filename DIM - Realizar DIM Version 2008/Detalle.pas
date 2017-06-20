unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, Buttons, Libreria, Main, ekrtf,
  ekbasereport, shellapi, OleServer, Excel97, Comobj, ImgList;

  type
   mygrid=class(TStringGrid)
  public
    procedure MoveColumn(FromIndex, ToIndex: Longint);
    procedure MoveRow(FromIndex, ToIndex: Longint);
  end;
  TFDetalle = class(TPFDetalle)
    Label2: TLabel;
    Q: TQuery;
    s: TQuery;
    grid: TStringGrid;
    Shape1: TShape;
    ruta: TEdit;
    Label1: TLabel;
    btnFile: TSpeedButton;
    ABRIR: TSpeedButton;
    ofil: TOpenDialog;
    NE: TLabel;
    Label4: TLabel;
    hojasE: TComboBox;
    Label3: TLabel;
    Generar: TSpeedButton;
    obs: TMemo;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cancelar1Click(Sender: TObject);
    function RNombre : String ; override;
    Procedure exportarSIT;
    procedure ABRIRClick(Sender: TObject);
    procedure btnFileClick(Sender: TObject);
    procedure rutaChange(Sender: TObject);
    procedure rutaEnter(Sender: TObject);
    function XlstoHoja(AXLSFile: string): Boolean;
    procedure GenerarClick(Sender: TObject);
    procedure gridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure gridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
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
 Height := 626;
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
             nombre:= stringReplace(gridgr.Cells[4,x],'�','N',[rfReplaceAll]);
             nombre:= stringReplace(NOMBRE,'.','',[rfReplaceAll]);
             nombre:=copy(nombre,1,40);

             apepat:= stringReplace(gridgr.Cells[5,x],'�','N',[rfReplaceAll]);
             apepat:= stringReplace(apepat,'.','',[rfReplaceAll]);
             apepat:=copy(apepat,1,30);

             apemat:= stringReplace(gridgr.Cells[6,x],'�','N',[rfReplaceAll]);
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
  Result := False;
  XLApp := CreateOleObject('Excel.Application');
  try
    XLApp.Visible := False;
    XLApp.Workbooks.Open(AXLSFile);
    Sheet := XLApp.Workbooks[ExtractFileName(AXLSFile)].WorkSheets[1];
    HOJASE.Items.Clear;
    for x:=1 to XLApp.Workbooks[ExtractFileName(AXLSFile)].WorkSheets.count do
       begin
           hojase.items.add(inttostr(x)+'-'+XLApp.Workbooks[ExtractFileName(AXLSFile)].WorkSheets[x].name);
       end;

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


procedure TFDetalle.ABRIRClick(Sender: TObject);
var
x:integer;
c:integer;
begin
  inherited;
if Xls_To_StringGrid(grid, RUTA.TEXT, strtoint(str_(hojase.Text,'-'))) then
//Convertimos numero de empleados
c:=0;
For x:=1 to grid.rowcount-1 do
   begin
       if grid.Cells[0,x]<>'' then
          begin
             grid.cells[0,x]:=colocaceros(grid.cells[0,x],5);
             c:=c+1;
          end
       else
          BREAK;
   end ;
NE.CAPTION:=inttostr(c);
GRID.ColCount:=grid.colcount+2;

end;

procedure TFDetalle.btnFileClick(Sender: TObject);
begin
  inherited;
if ofil.Execute then
   ruta.text:=ofil.FileName;

end;

procedure TFDetalle.rutaChange(Sender: TObject);
begin
  inherited;
IF FILEexists(ruta.text)  then
   begin abrir.Enabled:=true;  if XlstoHoja(RUTA.TEXT) then end
else
   begin abrir.Enabled:=false;   end;

end;

procedure TFDetalle.rutaEnter(Sender: TObject);
begin
  inherited;
btnfileClick(nil);

end;

procedure TFDetalle.GenerarClick(Sender: TObject);
var
filTran:TstringList;
nombre:string;
apepat:string;
apemat:string;
x:integer;
cont:integer;
ContFil:integer;
bancost:string;
nombFile:String;
sindica:String;
calAnual:string;
begin

  filtran:=TstringList.create;
  filtran.Clear;
  contFil:=1;
  nombFile:=hojase.Text+formatdatetime('DDMMYYYY',NOW);
  //Checar si es sindicalizado
  cont:=1;
  For x:=1 to grid.rowcount-1 do
      begin
          if (grid.Cells[0,x]<>'') then
             begin
                 if grid.cells[7,x]='X' then sindica:='1' else sindica:='2';

                 if strtofloat(grid.cells[10,x])>400000 then calAnual:='2' else calAnual:='1';

                 q.close;
                 q.sql.text:='SELECT COUNT(*) FROM PDIMCALC WHERE NOMBRE='+#39+trim(grid.cells[6,x])+#39+
                 ' AND APEPAT='+#39+trim(grid.cells[4,x])+#39+
                 ' AND APEMAT='+#39+trim(grid.cells[5,x])+#39;
                 Q.open;
                 if q.fields[0].AsInteger>0 then  begin CalAnual:='2'; obs.lines.add('Tabla Calculo Anual'); end;

                 grid.Cells[4,x]:=trim(stringReplace(grid.Cells[4,x],'.','',[rfReplaceAll]));
                 grid.Cells[5,x]:=trim(stringReplace(grid.Cells[5,x],'.','',[rfReplaceAll]));
                 grid.Cells[6,x]:=trim(stringReplace(grid.Cells[6,x],'.','',[rfReplaceAll]));
                 grid.Cells[4,x]:=trim(stringReplace(grid.Cells[4,x],'�','N',[rfReplaceAll]));
                 grid.Cells[5,x]:=trim(stringReplace(grid.Cells[5,x],'�','N',[rfReplaceAll]));
                 grid.Cells[6,x]:=trim(stringReplace(grid.Cells[6,x],'�','N',[rfReplaceAll]));
                 grid.Cells[4,x]:=trim(stringReplace(grid.Cells[4,x],'0','N',[rfReplaceAll]));
                 grid.Cells[5,x]:=trim(stringReplace(grid.Cells[5,x],'0','N',[rfReplaceAll]));
                 grid.Cells[6,x]:=trim(stringReplace(grid.Cells[6,x],'0','N',[rfReplaceAll]));
                 grid.Cells[2,x]:=trim(stringReplace(grid.Cells[2,x],' ','',[rfReplaceAll]));
                 grid.Cells[2,x]:=trim(stringReplace(grid.Cells[2,x],'-','',[rfReplaceAll]));

                 if (length(trim(grid.Cells[4,x]))<=0) or (length(trim(grid.Cells[5,x]))<=0)
                    or (length(trim(grid.Cells[6,x]))<=0)  then
                    begin
                       obs.lines.add(INTTOSTR(X+1)+'Error: Nombre y/o Apellidos no validos '+grid.Cells[0,x]);
                       grid.Cells[grid.colcount-1,x]:='X';
                       continue;
                    end;

                 if length(grid.Cells[2,x])<13 then
                    begin
                        obs.lines.add(INTTOSTR(X+1)+':Error: RFC No valido'+grid.Cells[0,x]);
                        grid.Cells[grid.colcount-1,x]:='X';
                        continue;
                    end;

                 if length(grid.Cells[3,x])<>18 then
                    begin
                        obs.lines.add(INTTOSTR(X+1)+'Advertencia: CURP invalida'+grid.Cells[0,x]);
                        grid.Cells[3,x]:='';
                    end;

                 filtran.Add('01|'+      //1.mes inicial
                 '12|'+                  //2.mes final
                 TRIM(grid.Cells[2,x])+'|'+    //3.RFC
                 grid.Cells[3,x]+'|'+    //4.CURP
                 grid.Cells[4,x]+'|'+    //5.Apellido paterno
                 grid.Cells[5,x]+'|'+    //6.Apellido materno
                 grid.Cells[6,x]+'|'+    //7.Nombre
                 '02|'+                  //8.Area Geogr�fica Area B
                 calAnual+'|'+           //9.Indique si el patron realizo calculo anual NO
                 '1|'+                   //10.Tarifa utilizada: del ejercicio que declara SI
                 '0|'+                   //11. Tarifa utilizada: 1991 Actualizada Sin selecci�n
                 '1.0000|'+              //12 Proporci�n del subsidio aplicada
                 sindica+'|'+            //13 Indique si el trabajador es sindicalizado
                 '0|'+                   //14 Si es asimilado al salario 0 Sin selecci�n
                 '27|'+                  //15 Clave de la entidad federativa
                 '||||||||||'+           //16-25 Patron 1 al patron
                 '|'+                    //26 Monto de las aportaciones voluntarias efectuadas
                 '0|'+                   //27 Indique si el patr�n efectu� el monto de las aportaciones voluntarias
                 '|'+                    //28. Monto de las aportaciones vol. deducibles
                 '|'+                    //29. Monto de las aportaciones vol. deducibles aplicadas por patron
                 '0|'+                    //30. pagos por separacion 0 sin selecci�n
                 '0|'+                   //31. Asimilados a salarios 0 Sin selecci�n
                 '1|'+                   //32. Pagos del patr�n efectuados a Trab 1. SI
                 {'0|'+                   //33. Ingresos totales por pagos parcialidades
                 '0|'+                   //34. Monto diario percibido por jubilaciones
                 '0|'+                   //35. Cantidad que se hubiera percibido en el periodo
                 '0|'+                   //36. Monto total pagado en una sola exi
                 '0|'+                   // 37. N�mero de d�as
                 '0|'+                   // 38. Ingresos Excentos.
                 '0|'+                   // 39. Ingresos gravables.
                 '0|'+                   // 40. Ingresos acumulables.
                 '0|'+                   // 41. Ingresos no acumulables.
                 '0|'+                   // 42. Ingresos retenido
                 '0|'+                   // 43. Monto total pagado de otros pagos de separaci�n
                 '0|'+                   // 44. N�mero de a�os de servicio ddel trabajador
                 '0|'+                   // 45. Ingresos exentos
                 '0|'+                   // 46. Ingresos gravados
                 '0|'+                   // 47. Ingresos acumulables.
                 '0|'+                   // 48 Impuesto correspondiente al ultimo sueldo
                 '0|'+                   // 49. Ingresos no acumulables
                 '0|'+ }                  // 50. Impuesto retenido
                 {'0|'+                   // 51. ingresos asimilados a salarios
                 '0|'+                   //52. Impuesto retenido durante el ejercicio
                 '0|'+                   //53. Opci�n para adquirir acciones 0 Sin selecci�n
                 '|'+                   //54 Valor de mercado de las acciones
                 '|'+                     //55. Precio establecido d eingresos de acciones
                 '|'+                     //56. ingreso acumulables
                 '|'+ }                   //57. Impuesto retenido durante el ejercicoi
                 grid.cells[11,x]+'|'+   //58. Sueldos Salarios rayas y jornales.
                 '|'+                    //59. Sueldos, salarios y jornales exentos
                 grid.cells[12,x]+'|'+   //60. Gratificaci�n anual gravado
                 '|'+                    //61. Gratificaci�n anual Exento
                 '|'+                     //62 viaticos y viajes gravados
                 '|'+                     //63 Viaticos y viajes exento
                 grid.cells[14,x]+'|'+    //64. Tiempo Extraordinario gravado
                 '|'+                      //65. Tiempo Extraordinario exento
                 grid.cells[16,x]+'|'+    //66. Prima vacacional gravado
                 grid.cells[17,x]+'|'+    //67. Prima vacacional exento
                 grid.cells[18,x]+'|'+    //68. Prima dominical gravado
                 grid.cells[19,x]+'|'+    //69. Prima dominical GRAVADO
                 '|'+                     //70. PTU Gravado
                 '|'+                     //71. PTU Exento
                 '|'+                     //72. Gastos m�dico Gravado
                 '|'+                     //73. Gastos m�dico  Exento
                 '|'+                     //74. Fondo de Ahorro Gravado
                 '|'+                     //75. Fondo de Ahorro  Exento
                 '|'+                     //76. Caja de Ahorro Gravado
                 '|'+                     //77. Caja de Ahorro  Exento
                 grid.cells[20,x]+'|'+    //78. Vales despensa Gravado
                 grid.cells[21,x]+'|'+    //79. Vales despensa exento
                 grid.cells[22,x]+'|'+    //80. Gastos Funearios Gravado
                 grid.cells[23,x]+'|'+    //81. Gastos Funearios exento
                 grid.cells[24,x]+'|'+    //82. contribuciones del patron Gravado
                 '|'+                     //83. contribuciones del patron exento
                 '|'+                     //84. premios por punmtualidad Gravado
                 '|'+                     //85. premios por punmtualidad  Exento
                 '|'+                     //86. Prima de seguro de vida Gravado
                 '|'+                     //87.  Prima de seguro de vida Exento
                 '|'+                     //88.  seguro gasto mayores Gravado
                 '|'+                     //89.  seguro gasto mayores Exento
                 '|'+                     //90.  vales restaurantes Gravado
                 '|'+                     //91.  vales restaurantes Exento
                 '|'+                     //92.  vales gasolina Gravado
                 '|'+                     //93.  vales gasolina Exento
                 '|'+                     //94.  vales ropa Gravado
                 '|'+                     //95.  vales ropa Exento
                 grid.cells[24,x]+'|'+    //96.  ayuda renta Gravado
                 '|'+                     //97.  ayuda renta  Exento
                 '|'+                      //98.  articulos escolares Gravado
                 '|'+                     //99.  articulos escolares  Exento
                 '|'+                      //100.  anteojos Gravado
                 '|'+                     //101.  anteojos  Exento
                 grid.cells[25,x]+'|'+    //102.  ayuda transporte Gravado
                 '|'+                     //103.  ayuda transporte  Exento
                 '|'+                      //104.  cuotas sindicales Gravado
                 '|'+                     //105.  cuotas sindicales  Exento
                 '|'+                      //106.  Subsidio por incapacidad Gravado
                 '|'+                     //107.  Subsidio por incapacidad  Exento
                 '|'+                      //108.  Becas Gravado
                 grid.cells[26,x]+'|'+     //109.  Becas Exento
                 '|'+                      //110.  Pagos de otros Gravado
                 '|'+                     //111.  Pagos de otros Exento
                 grid.cells[27,x]+'|'+    //112. Otros ingresos gravados
                 grid.cells[28,x]+'|'+    //113. Otros ingresos exento
                 grid.cells[30,x]+'|'+    //114. Suma del ingreso gravado por sueldo
                 grid.cells[31,x]+'|'+    //115. Suma del ingreso exento por sueldo
                 grid.cells[34,x]+'|'+    //116. Impuesto retenido durante el ejercicio
                 '|'+                     //117.  Impuesto retenido por otro patr�n
                 '|'+                     //118.  Saldo a favor
                 '|'+                     //119.  Saldo a favor del ejercicio anterior
                 '|'+                     //120.  Suma de las cantidades credito al salario
                 '|'+                     //121.  Credito al salario entregado en efectivo
                 '|'+                     //122.  Monto previsi�n social
                 '|'+                     //123.  Monto previsi�n social  exento
                 grid.cells[10,x]+'|'+    //124. Suma de ingresos por sueldo y salarios
                 '|'+                     //125.  Monto del impuesto local a los sueldos y salarios
                 grid.cells[35,x]+'|'+    //126.  Monto del subsidio para el empleo en efectivo
                 '|'+                     //127.  Total de aportaciones voluntarias deducibles
                 grid.cells[36,x]+'|'+    //128.  ISR Conforme a la tarifa anual
                 '|'+                     //129. Subsidio acreditable
                 '|'+                     //130. Subsidio no acreditable
                 grid.cells[36,x]+'|'+   //131. Impuesto sobre ingresos acumulables
                 '|'+                     //132. Impuesto sobre ingresos no acumulables
                 '|'+                     //133. Impuesto local por sueldos prestacion de servicio personal subordinado
                 grid.cells[36,x]+'|'   //134. Monto del subsidio para el empleo que le correspondio al trabajador
                 );
                 grid.Cells[grid.colcount-2,x]:=inttostr(cont);
                 cont:=cont+1;
             end;
      end;
                   CreateDir('c:\DIM\');
                 CreateDir('c:\DIM\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\');
                 filtran.SaveToFile('C:\DIM\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\'+nombFile+'.TXT');
                 ShellExecute(handle, 'open', PChar('C:\DIM\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\'+NOMBFILE+'.TXT'), nil, nil, SW_show);

end;

procedure TFDetalle.gridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
texto:string;
x:integer;
begin

  if (ARow < Grid.FixedRows) or (ACol < Grid.FixedCols) then
    Grid.Canvas.Brush.Color := clBtnFace
  else
    Grid.Canvas.Brush.Color := clWhite;


  Grid.Canvas.FillRect(Rect);
  Texto := Grid.Cells[acol,ARow];
  DrawText( Grid.Canvas.Handle, PChar(Texto), StrLen(PChar(Texto)),Rect, DT_LEFT);


end;


procedure TFDetalle.gridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
if (key=46) AND  (linG<>(sender as TstringGrid).rowcount-1)  then
   if Application.MessageBox('�Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
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

procedure TFDetalle.SpeedButton1Click(Sender: TObject);
var
filTran:TstringList;
nombre:string;
apepat:string;
apemat:string;
x:integer;
cont:integer;
ContFil:integer;
bancost:string;
nombFile:String;
sindica:String;
calAnual:string;
cadHAS:string;
hayHAS:string;
cadena:string;
cadSepara:String;
cveHAS:string;
begin

  filtran:=TstringList.create;
  filtran.Clear;
  contFil:=1;
  nombFile:=hojase.Text+formatdatetime('DDMMYYYY',NOW);
  //Checar si es sindicalizado
  cont:=1;
  q.close;
  q.SQL.text:='SELECT * FROM PDIMFINAL_2013 where ENVIAR='+#39+'S'+#39+' ORDER BY EMPL';
  Q.open;

  while not(q.eof) do
      begin
                 hayHas:='0';
                 cveHAS:='0';
                 IF Q.fieldbyname('MOVIMIENTO').asstring='HAS' THEN BEGIN hayHAS:='1'; cveHAS:='E'; END;

                 cadena:=Q.fieldbyname('MESINI').asstring+'|'+      //1.mes inicial
                 Q.fieldbyname('MESFIN').asstring+'|'+                  //2.mes final
                 TRIM(Q.fieldbyname('RFC').asstring)+'|'+               //3.RFC
                 Q.fieldbyname('CURP').asstring+'|'+                    //4.CURP
                 Q.fieldbyname('APEPAT').asstring+'|'+                 //5.Apellido paterno
                 Q.fieldbyname('APEMAT').asstring+'|'+                //6.Apellido materno
                 Q.fieldbyname('NOMBRE').asstring+'|'+                 //7.Nombre
                 '02|'+                                                //8.Area Geogr�fica Area B
                 Q.fieldbyname('PRESENTA_DECLARA').asstring+'|'+       //9.Indique si el patron realizo calculo anual NO
                 '1|'+                                                 //10.Tarifa utilizada: del ejercicio que declara SI
                 '0|'+                   //11. Tarifa utilizada: 1991 Actualizada Sin selecci�n
                 '1.0000|'+              //12 Proporci�n del subsidio aplicada
                 Q.fieldbyname('STAIUJAT').asstring+'|'+            //13 Indique si el trabajador es sindicalizado
                 cvehas+'|'+                   //14 Si es asimilado al salario 0 Sin selecci�n
                 '27|'+                  //15 Clave de la entidad federativa
                 '||||||||||'+           //16-25 Patron 1 al patron 10 Si tienen otros patrones
                 '|'+                    //26 Monto de las aportaciones voluntarias efectuadas
                 '0|'+                   //27 Indique si el patr�n efectu� el monto de las aportaciones voluntarias
                 '|'+                    //28. Monto de las aportaciones vol. deducibles
                 '|'+                    //29. Monto de las aportaciones vol. deducibles aplicadas por patron
                 Q.fieldbyname('SEPARACION').asstring+'|'+                    //30. pagos por separacion
                 hayHas+'|'+                   //31. Asimilados a salarios 0 Sin selecci�n
                 '1|';                   //32. Pagos del patr�n efectuados a Trab 1. SI
                 CADSEPARA:='';
                 if  Q.fieldbyname('SEPARACION').asstring='1' then
                     CADsepara:=FLOATTOSTR(q.fieldbyname('ING_SEPARACION_G').asfloat+q.fieldbyname('ING_SEPARACION_E').asfloat+
                             q.fieldbyname('PENSION_G').asfloat+q.fieldbyname('PENSION_E').asfloat)+'|'+                   //33. Ingresos totales por pagos parcialidades
                             '|'+                   //34. Monto diario percibido por jubilaciones
                             '|'+                   //35. Cantidad que se hubiera percibido en el periodo
                             //FLOATTOSTR(q.fieldbyname('ING_SEPARACION_G').asfloat+q.fieldbyname('ING_SEPARACION_E').asfloat+
                             //q.fieldbyname('PENSION_G').asfloat+q.fieldbyname('PENSION_E').asfloat)+
                             '|'+                    //36. Monto total pagado en una sola exi
                             '0|'+                   // 37. N�mero de d�as
                             FLOATTOSTR(q.fieldbyname('ING_SEPARACION_E').asfloat+q.fieldbyname('PENSION_E').asfloat)+
                             '|'+                   // 38. Ingresos Excentos.
                             FLOATTOSTR(q.fieldbyname('ING_SEPARACION_G').asfloat+q.fieldbyname('PENSION_G').asfloat)+
                             '|'+                   // 39. Ingresos gravables.
                             '0|'+                   // 40. Ingresos acumulables.
                             '0|'+                   // 41. Ingresos no acumulables.
                             '0|'+                   // 42. Ingresos retenido
                             '0|'+                   // 43. Monto total pagado de otros pagos de separaci�n
                             '0|'+                   // 44. N�mero de a�os de servicio ddel trabajador
                             '0|'+                   // 45. Ingresos exentos
                             '0|'+                   // 46. Ingresos gravados
                             '0|'+                   // 47. Ingresos acumulables.
                             '0|'+                   // 48 Impuesto correspondiente al ultimo sueldo
                             '0|'+                   // 49. Ingresos no acumulables
                             Q.fieldbyname('ISR58').asstring+'|'; // 50. Impuesto retenido
                cadHAS:='';
                IF Q.fieldbyname('MOVIMIENTO').asstring='HAS' THEN
                      cadHas:=
                             Q.fieldbyname('SUELDOS_SALARIOS_G').asstring+'|'+// 51. ingresos asimilados a salarios
                             Q.fieldbyname('ISR_RETENIDO').asstring+'|'+ //52. Impuesto retenido durante el ejercicio
                             '0|'+                   //53. Opci�n para adquirir acciones 0 Sin selecci�n
                             '|'+                   //54 Valor de mercado de las acciones
                             '|'+                     //55. Precio establecido d eingresos de acciones
                             '|'+                     //56. ingreso acumulables
                             '|';                   //57. Impuesto retenido durante el ejercicoi

                 IF Q.fieldbyname('MOVIMIENTO').asstring<>'HAS' THEN
                    begin
                       CADENA:=CADENA+CADSEPARA+CadHAS+
                       Q.fieldbyname('SUELDOS_SALARIOS_G').asstring+'|'+   //58. Sueldos Salarios rayas y jornales.
                       '|'+                    //59. Sueldos, salarios y jornales exentos
                       Q.fieldbyname('GRATIFICACION_ANUAL_G').asstring+'|'+   //60. Gratificaci�n anual gravado
                       Q.fieldbyname('GRATIFICACION_ANUAL_E').asstring+'|'+   //61. Gratificaci�n anual Exento
                       '|'+                     //62 viaticos y viajes gravados
                       '|'+                     //63 Viaticos y viajes exento
                       Q.fieldbyname('TIEMPO_EXTRA_G').asstring+'|'+    //64. Tiempo Extraordinario gravado
                       Q.fieldbyname('TIEMPO_EXTRA_E').asstring+'|'+                      //65. Tiempo Extraordinario exento
                       Q.fieldbyname('PRIMA_VACACIONAL_G').asstring+'|'+    //66. Prima vacacional gravado
                       Q.fieldbyname('PRIMA_VACACIONAL_E').asstring+'|'+    //67. Prima vacacional exento
                       Q.fieldbyname('PRIMA_DOMINICA_G').asstring+'|'+    //68. Prima dominical gravado
                       Q.fieldbyname('PRIMA_DOMINICA_E').asstring+'|'+    //69. Prima dominical GRAVADO
                       '|'+                     //70. PTU Gravado
                       '|'+                     //71. PTU Exento
                       '|'+                     //72. Gastos m�dico Gravado
                       '|'+                     //73. Gastos m�dico  Exento
                       '|'+                     //74. Fondo de Ahorro Gravado
                       '|'+                     //75. Fondo de Ahorro  Exento
                       '|'+                     //76. Caja de Ahorro Gravado
                       '|'+                     //77. Caja de Ahorro  Exento
                       Q.fieldbyname('VALES_DESPENSA_G').asstring+'|'+    //78. Vales despensa Gravado
                       Q.fieldbyname('VALES_DESPENSA_E').asstring+'|'+    //79. Vales despensa exento
                       Q.fieldbyname('GASTOS_FUNERALES_G').asstring+'|'+    //80. Gastos Funearios Gravado
                       Q.fieldbyname('GASTOS_FUNERALES_E').asstring+'|'+    //81. Gastos Funearios exento
                       Q.fieldbyname('ISR_SUBSIDIADO_G').asstring+'|'+    //82. contribuciones del patron Gravado
                       '|'+                     //83. contribuciones del patron exento
                       '|'+                     //84. premios por punmtualidad Gravado
                       '|'+                     //85. premios por punmtualidad  Exento
                       '|'+                     //86. Prima de seguro de vida Gravado
                       '|'+                     //87.  Prima de seguro de vida Exento
                       '|'+                     //88.  seguro gasto mayores Gravado
                       '|'+                     //89.  seguro gasto mayores Exento
                       '|'+                     //90.  vales restaurantes Gravado
                       '|'+                     //91.  vales restaurantes Exento
                       '|'+                     //92.  vales gasolina Gravado
                       '|'+                     //93.  vales gasolina Exento
                       '|'+                     //94.  vales ropa Gravado
                       '|'+                     //95.  vales ropa Exento
                       Q.fieldbyname('RENTA_G').asstring+'|'+    //96.  ayuda renta Gravado
                       '|'+                     //97.  ayuda renta  Exento
                       '|'+                      //98.  articulos escolares Gravado
                       '|'+                     //99.  articulos escolares  Exento
                       '|'+                      //100.  anteojos Gravado
                       '|'+                     //101.  anteojos  Exento
                       Q.fieldbyname('TRANSPORTE_G').asstring+'|'+    //102.  ayuda transporte Gravado
                       '|'+                     //103.  ayuda transporte  Exento
                       '|'+                      //104.  cuotas sindicales Gravado
                       '|'+                     //105.  cuotas sindicales  Exento
                       '|'+                      //106.  Subsidio por incapacidad Gravado
                       '|'+                     //107.  Subsidio por incapacidad  Exento
                       '|'+                      //108.  Becas Gravado
                       Q.fieldbyname('BECA_EDUCACIONAL_E').asstring+'|'+     //109.  Becas Exento
                       '|'+                      //110.  Pagos de otros Gravado
                       '|'+                     //111.  Pagos de otros Exento
                       Q.fieldbyname('OTROS_SALARIOS_G').asstring+'|'+    //112. Otros ingresos gravados
                       Q.fieldbyname('OTROS_SALARIOS_E').asstring+'|'+    //113. Otros ingresos exento
                       Q.fieldbyname('TOTAL_INGRESOS_G').asstring+'|'+    //114. Suma del ingreso gravado por sueldo
                       Q.fieldbyname('TOTAL_INGRESOS_E').asstring+'|'+    //115. Suma del ingreso exento por sueldo
                       Q.fieldbyname('COL_U1').asstring+'|'+    //116. Impuesto retenido durante el ejercicio
                       '|'+                     //117.  Impuesto retenido por otro patr�n
                       '|'+                     //118.  Saldo a favor
                       '|'+                     //119.  Saldo a favor del ejercicio anterior
                       '|'+                     //120.  Suma de las cantidades credito al salario
                       '|'+                     //121.  Credito al salario entregado en efectivo
                       Q.fieldbyname('PREV_SOLICIA_E').asstring+'|'+                     //122.  Monto previsi�n social
                       Q.fieldbyname('PREV_SOLICIA_E').asstring+'|'+                     //123.  Monto previsi�n social  exento
                       Q.fieldbyname('TOTAL_INGRESOS').asstring+'|'+    //124. Suma de ingresos por sueldo y salarios
                       '|'+                     //125.  Monto del impuesto local a los sueldos y salarios
                       Q.fieldbyname('COL_C1').asstring+'|'+    //126.  Monto del subsidio para el empleo en efectivo
                       '|'+                     //127.  Total de aportaciones voluntarias deducibles
                       Q.fieldbyname('COL_G').asstring+'|'+    //128.  ISR Conforme a la tarifa anual
                       '|'+                     //129. Subsidio acreditable
                       '|'+                     //130. Subsidio no acreditable
                       Q.fieldbyname('COL_M').asstring+'|'+   //131. Impuesto sobre ingresos acumulables
                       '|'+                     //132. Impuesto sobre ingresos no acumulables
                       '|'+                     //133. Impuesto local por sueldos prestacion de servicio personal subordinado
                       Q.fieldbyname('COL_J').asstring+'|';   //134. Monto del subsidio para el empleo que le correspondio al trabajador
                   end
                 else
                   begin
                       CADENA:=CADENA+CADSEPARA+CadHAS+
                       '|'+   //58. Sueldos Salarios rayas y jornales.
                       '|'+                    //59. Sueldos, salarios y jornales exentos
                       '|'+   //60. Gratificaci�n anual gravado
                       '|'+   //61. Gratificaci�n anual Exento
                       '|'+                     //62 viaticos y viajes gravados
                       '|'+                     //63 Viaticos y viajes exento
                       '|'+    //64. Tiempo Extraordinario gravado
                       '|'+                      //65. Tiempo Extraordinario exento
                       '|'+    //66. Prima vacacional gravado
                       '|'+    //67. Prima vacacional exento
                       '|'+    //68. Prima dominical gravado
                       '|'+    //69. Prima dominical GRAVADO
                       '|'+                     //70. PTU Gravado
                       '|'+                     //71. PTU Exento
                       '|'+                     //72. Gastos m�dico Gravado
                       '|'+                     //73. Gastos m�dico  Exento
                       '|'+                     //74. Fondo de Ahorro Gravado
                       '|'+                     //75. Fondo de Ahorro  Exento
                       '|'+                     //76. Caja de Ahorro Gravado
                       '|'+                     //77. Caja de Ahorro  Exento
                       '|'+    //78. Vales despensa Gravado
                       '|'+    //79. Vales despensa exento
                       '|'+    //80. Gastos Funearios Gravado
                       '|'+    //81. Gastos Funearios exento
                       '|'+    //82. contribuciones del patron Gravado
                       '|'+                     //83. contribuciones del patron exento
                       '|'+                     //84. premios por punmtualidad Gravado
                       '|'+                     //85. premios por punmtualidad  Exento
                       '|'+                     //86. Prima de seguro de vida Gravado
                       '|'+                     //87.  Prima de seguro de vida Exento
                       '|'+                     //88.  seguro gasto mayores Gravado
                       '|'+                     //89.  seguro gasto mayores Exento
                       '|'+                     //90.  vales restaurantes Gravado
                       '|'+                     //91.  vales restaurantes Exento
                       '|'+                     //92.  vales gasolina Gravado
                       '|'+                     //93.  vales gasolina Exento
                       '|'+                     //94.  vales ropa Gravado
                       '|'+                     //95.  vales ropa Exento
                       '|'+    //96.  ayuda renta Gravado
                       '|'+                     //97.  ayuda renta  Exento
                       '|'+                      //98.  articulos escolares Gravado
                       '|'+                     //99.  articulos escolares  Exento
                       '|'+                      //100.  anteojos Gravado
                       '|'+                     //101.  anteojos  Exento
                       '|'+    //102.  ayuda transporte Gravado
                       '|'+                     //103.  ayuda transporte  Exento
                       '|'+                      //104.  cuotas sindicales Gravado
                       '|'+                     //105.  cuotas sindicales  Exento
                       '|'+                      //106.  Subsidio por incapacidad Gravado
                       '|'+                     //107.  Subsidio por incapacidad  Exento
                       '|'+                      //108.  Becas Gravado
                       '|'+     //109.  Becas Exento
                       '|'+                      //110.  Pagos de otros Gravado
                       '|'+                     //111.  Pagos de otros Exento
                       '|'+    //112. Otros ingresos gravados
                       '|'+    //113. Otros ingresos exento
                       '|'+    //114. Suma del ingreso gravado por sueldo
                       '|'+    //115. Suma del ingreso exento por sueldo
                       '0|'+    //116. Impuesto retenido durante el ejercicio
                       '|'+                     //117.  Impuesto retenido por otro patr�n
                       '|'+                     //118.  Saldo a favor
                       '|'+                     //119.  Saldo a favor del ejercicio anterior
                       '|'+                     //120.  Suma de las cantidades credito al salario
                       '|'+                     //121.  Credito al salario entregado en efectivo
                       '|'+                     //122.  Monto previsi�n social
                       '|'+                     //123.  Monto previsi�n social  exento
                       '|'+    //124. Suma de ingresos por sueldo y salarios
                       '|'+                     //125.  Monto del impuesto local a los sueldos y salarios
                       Q.fieldbyname('COL_C1').asstring+'|'+    //126.  Monto del subsidio para el empleo en efectivo
                       '|'+                     //127.  Total de aportaciones voluntarias deducibles
                       Q.fieldbyname('COL_G').asstring+'|'+    //128.  ISR Conforme a la tarifa anual
                       '|'+                     //129. Subsidio acreditable
                       '|'+                     //130. Subsidio no acreditable
                       Q.fieldbyname('COL_M').asstring+'|'+   //131. Impuesto sobre ingresos acumulables
                       '|'+                     //132. Impuesto sobre ingresos no acumulables
                       '|'+                     //133. Impuesto local por sueldos prestacion de servicio personal subordinado
                       Q.fieldbyname('COL_J').asstring+'|';   //134. Monto del subsidio para el empleo que le correspondio al trabajador
                  end;
                 filtran.Add(cadena);

                 Q.Next;
             end;
                 CreateDir('c:\DIM\');
                 CreateDir('c:\DIM\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\');
                 filtran.SaveToFile('C:\DIM\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\'+nombFile+'.TXT');
                 ShellExecute(handle, 'open', PChar('C:\DIM\'+stringReplace(FechaGen,'/','',[rfReplaceAll])+'\'+NOMBFILE+'.TXT'), nil, nil, SW_show);

end;


End.
