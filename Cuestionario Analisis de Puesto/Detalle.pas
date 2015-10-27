unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, Buttons, Libreria, Main, ekrtf,
  ekbasereport, shellapi, OleServer, Excel97, Comobj, ImgList, CheckLst;

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
    ofil: TOpenDialog;
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    page: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    puesto: TEdit;
    Label8: TLabel;
    lugar: TEdit;
    Label9: TLabel;
    puestoreporta: TEdit;
    Label10: TLabel;
    GPstoRep: TStringGrid;
    Label11: TLabel;
    proposito: TMemo;
    gactdia: TStringGrid;
    Label12: TLabel;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label13: TLabel;
    gactper: TStringGrid;
    Label14: TLabel;
    gacteve: TStringGrid;
    Label15: TLabel;
    GRelPsto: TStringGrid;
    frecuencia: TComboBox;
    ie: TComboBox;
    TabSheet5: TTabSheet;
    Label7: TLabel;
    Label18: TLabel;
    Requerimiento: TRadioGroup;
    Label17: TLabel;
    disciplina: TEdit;
    TabSheet6: TTabSheet;
    gHabHum: TStringGrid;
    porcentaje2: TComboBox;
    Label23: TLabel;
    Label24: TLabel;
    gconoc: TStringGrid;
    porcentaje: TComboBox;
    TabSheet7: TTabSheet;
    gHabTec: TStringGrid;
    porcentaje3: TComboBox;
    TabSheet8: TTabSheet;
    Label16: TLabel;
    GEXP: TStringGrid;
    EXPERIENCIA: TComboBox;
    expJer: TRadioGroup;
    Label26: TLabel;
    TabSheet9: TTabSheet;
    Label29: TLabel;
    iniciativa: TRadioGroup;
    Label30: TLabel;
    Label31: TLabel;
    liderazgo: TRadioGroup;
    TabSheet10: TTabSheet;
    Label32: TLabel;
    resp1: TRadioGroup;
    Label34: TLabel;
    Label35: TLabel;
    TabSheet11: TTabSheet;
    Label38: TLabel;
    resp4: TRadioGroup;
    Label42: TLabel;
    monto: TEdit;
    TabSheet12: TTabSheet;
    Label43: TLabel;
    concentracion: TRadioGroup;
    TabSheet13: TTabSheet;
    Label47: TLabel;
    presion: TRadioGroup;
    TabSheet14: TTabSheet;
    Label49: TLabel;
    Label50: TLabel;
    CONDICIONES: TRadioGroup;
    Label51: TLabel;
    Label52: TLabel;
    RIESGO: TRadioGroup;
    Label53: TLabel;
    entrevistado: TEdit;
    Fecha: TDateTimePicker;
    Label54: TLabel;
    Label55: TLabel;
    evaluador: TEdit;
    Label56: TLabel;
    aprobado: TEdit;
    Label6: TLabel;
    numcue: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label64: TLabel;
    puntos: TLabel;
    SpeedButton1: TSpeedButton;
    Label65: TLabel;
    Label20: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label25: TLabel;
    Label28: TLabel;
    Label33: TLabel;
    Label45: TLabel;
    esfuerzo: TRadioGroup;
    TabSheet15: TTabSheet;
    resp2: TRadioGroup;
    Label27: TLabel;
    Label36: TLabel;
    resp3: TRadioGroup;
    TabSheet16: TTabSheet;
    Label40: TLabel;
    resp5: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cancelar1Click(Sender: TObject);
    function RNombre : String ; override;
    Procedure exportarSIT;

    procedure gridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure GPstoRepKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GPstoRepSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure gactdiaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gactdiaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure gactperKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gactperSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure gacteveSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure gacteveKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GRelPstoSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure frecuenciaChange(Sender: TObject);
    procedure ieChange(Sender: TObject);
    procedure gconocSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure gHabHumSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure gHabTecSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure porcentajeChange(Sender: TObject);
    procedure porcentaje3Change(Sender: TObject);
    procedure porcentaje2Change(Sender: TObject);
    procedure GEXPSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure montoKeyPress(Sender: TObject; var Key: Char);
    procedure pageChange(Sender: TObject);
    procedure GuadarTodo;
    procedure GrabarCrespuesta(Grid:TstringGrid; tipo:string);
    procedure GrabarCRelaciones;
procedure GrabarCrespuesta2(Grid:TstringGrid; tipo:string);

 procedure cargarCrespuesta(Grid:TstringGrid; tipo:string);
procedure CargarCrelaciones(Grid:TstringGrid);
procedure cargarCrespuesta2(Grid:TstringGrid; tipo:string);

    procedure EXPERIENCIAChange(Sender: TObject);
    procedure BCancelaClick(Sender: TObject);
    procedure BSeleccionaClick(Sender: TObject);
    procedure numcueDblClick(Sender: TObject);
    procedure cargarCuestionario(n:integer);
    procedure ieExit(Sender: TObject);
    procedure frecuenciaExit(Sender: TObject);
    procedure porcentajeExit(Sender: TObject);
    procedure porcentaje3Exit(Sender: TObject);
    procedure porcentaje2Exit(Sender: TObject);
    procedure EXPERIENCIAExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    function damePuntos(opci:TRadioGroup;numpreg:integer):integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;
  FMain : TFMain ;
  LING,COLG:INTEGER;
  LING2,COLG2:INTEGER;
  LINGp,COLGp:INTEGER;
  TABU:BOOLEAN;
  vures:string;
   VURES_DESC:STRING;
  combo: TComboBox;
fechaGen:string;
error:boolean;

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



procedure acomodaRadio(opci:TRadioGroup);
var
 i: Integer;
 rbs: DWORD;
 rb: TRadioButton;
begin
for i := 0 to opci.ControlCount-1 do
   begin
    rb := opci.controls[i] as TRadioButton;
    rbs := GetWindowLong(rb.Handle, GWL_STYLE);
    rbs := rbs or BS_MULTILINE or BS_TOP;
    SetWindowLong(rb.Handle, GWL_STYLE, rbs);
   end ;
   opci.Invalidate;
end;

procedure TFDetalle.FormCreate(Sender: TObject);
begin
 FMain := TFMain(Owner) ;
 ToolBar1.Images := FMain.Iconos ;
 Menu.Images := FMain.Iconos ;
 Height := 626;
 Width :=  806 ;

 Q.Close;
 q.sql.text:='SELECT CSQCUESTIO.NEXTVAL FROM DUAL';
 Q.open;
 numcue.Caption:=q.fields[0].asstring;

  q.Close;
  q.sql.text:='SELECT DESPREG FROM CCATALOGOS WHERE PREG=3 order by orden';
  Q.open;
  frecuencia.clear;
  while not(q.eof) do
     begin
        frecuencia.Items.Add(q.fields[0].asstring);
        q.next;
     end;

  q.Close;
  q.sql.text:='SELECT DESPREG FROM CCATALOGOS WHERE PREG=4 order by orden';
  Q.open;
  IE.clear;
  while not(q.eof) do
     begin
        IE.Items.Add(q.fields[0].asstring);
        q.next;
     end;

  q.Close;
  q.sql.text:='SELECT DESPREG FROM CCATALOGOS WHERE PREG=5 order by orden';
  Q.open;
  REQUERIMIENTO.Items.Clear;
  while not(q.eof) do
     begin
        REQUERIMIENTO.Items.Add(q.fields[0].asstring);
        q.next;
     end;


  gconoc.Cells[0,0]:='Describa los conocimientos específicos requeridos';
  gconoc.Cells[1,0]:='Nivel';
  GHABTEC.Cells[0,0]:='Habilidades Técnicas que se requieren para el puesto';
  GHABTEC.Cells[1,0]:='Nivel';
  GHABHUM.Cells[0,0]:='Habilidades Humanas que se requieren para el puesto';
  GHABTEC.Cells[1,0]:='Nivel';

  q.Close;
  q.sql.text:='SELECT DESPREG FROM CCATALOGOS WHERE PREG=6 order by orden';
  Q.open;
  porcentaje.clear;
  porcentaje2.clear;
  porcentaje3.clear;
  while not(q.eof) do
     begin
        porcentaje.Items.Add(q.fields[0].asstring);
        porcentaje2.Items.Add(q.fields[0].asstring);
        porcentaje3.Items.Add(q.fields[0].asstring);
        q.next;
     end;

  gexp.Cells[0,0]:='Puesto o Empleo anterior';
  gexp.Cells[1,0]:='Experiencia en años';
  q.Close;
  q.sql.text:='SELECT DESPREG FROM CCATALOGOS WHERE PREG=9 order by orden';
  Q.open;
  EXPERIENCIA.clear;
  while not(q.eof) do
     begin
        EXPERIENCIA.Items.Add(q.fields[0].asstring);
        q.next;
     end;


  q.Close;
  q.sql.text:='SELECT DESPREG FROM CCATALOGOS WHERE PREG=11 order by orden';
  Q.open;
  ExpJer.Items.Clear;
  while not(q.eof) do
     begin
        ExpJer.Items.Add(q.fields[0].asstring);
        q.next;
     end;

  q.Close;
  q.sql.text:='SELECT DESPREG FROM CCATALOGOS WHERE PREG=12 order by orden';
  Q.open;
  iniciativa.Items.Clear;
  while not(q.eof) do
     begin
        iniciativa.Items.Add(q.fields[0].asstring);
        q.next;
     end;

    q.Close;
  q.sql.text:='SELECT DESPREG FROM CCATALOGOS WHERE PREG=13 order by orden';
  Q.open;
  LIDERAZGO.Items.Clear;
  while not(q.eof) do
     begin
        LIDERAZGO.Items.Add(q.fields[0].asstring);
        q.next;
     end;

  q.Close;
  q.sql.text:='SELECT DESPREG FROM CCATALOGOS WHERE PREG=30 order by orden';
  Q.open;
  resp1.Items.Clear;
  while not(q.eof) do
     begin
        resp1.Items.Add(q.fields[0].asstring);
        q.next;
     end;

  q.Close;
  q.sql.text:='SELECT DESPREG FROM CCATALOGOS WHERE PREG=31 order by orden';
  Q.open;
  resp2.Items.Clear;
  while not(q.eof) do
     begin
        resp2.Items.Add(q.fields[0].asstring);
        q.next;
     end;

  q.Close;
  q.sql.text:='SELECT DESPREG FROM CCATALOGOS WHERE PREG=32 order by orden';
  Q.open;
  resp3.Items.Clear;
  while not(q.eof) do
     begin
        resp3.Items.Add(q.fields[0].asstring);
        q.next;
     end;

  q.Close;
  q.sql.text:='SELECT DESPREG FROM CCATALOGOS WHERE PREG=33 order by orden';
  Q.open;
  resp4.Items.Clear;
  while not(q.eof) do
     begin
        resp4.Items.Add(q.fields[0].asstring);
        q.next;
     end;

  q.Close;
  q.sql.text:='SELECT DESPREG FROM CCATALOGOS WHERE PREG=34 order by orden';
  Q.open;
  resp5.Items.Clear;
  while not(q.eof) do
     begin
        resp5.Items.Add(q.fields[0].asstring);
        q.next;
     end;

    q.Close;
  q.sql.text:='SELECT DESPREG FROM CCATALOGOS WHERE PREG=17 order by orden';
  Q.open;
  CONCENTRACION.Items.Clear;
  while not(q.eof) do
     begin
        CONCENTRACION.Items.Add(q.fields[0].asstring);
        q.next;
     end;

    q.Close;
  q.sql.text:='SELECT DESPREG FROM CCATALOGOS WHERE PREG=18 order by orden';
  Q.open;
  ESFUERZO.Items.Clear;
  while not(q.eof) do
     begin
        ESFUERZO.Items.Add(q.fields[0].asstring);
        q.next;
     end;

    q.Close;
  q.sql.text:='SELECT DESPREG FROM CCATALOGOS WHERE PREG=19 order by orden';
  Q.open;
  PRESION.Items.Clear;
  while not(q.eof) do
     begin
        PRESION.Items.Add(q.fields[0].asstring);
        q.next;
     end;

  q.Close;
  q.sql.text:='SELECT DESPREG FROM CCATALOGOS WHERE PREG=20 order by orden';
  Q.open;
  RIESGO.Items.Clear;
  while not(q.eof) do
     begin
        RIESGO.Items.Add(q.fields[0].asstring);
        q.next;
     end;

  q.Close;
  q.sql.text:='SELECT DESPREG FROM CCATALOGOS WHERE PREG=21 order by orden';
  Q.open;
  CONDICIONES.Items.Clear;
  while not(q.eof) do
     begin
        CONDICIONES.Items.Add(q.fields[0].asstring);
        q.next;
     end;

       acomodaRadio(REQUERIMIENTO);
       acomodaRadio(expjer);
       acomodaRadio(iniciativa);
       acomodaRadio(liderazgo);
       acomodaRadio(resp1);
       acomodaRadio(resp2);
       acomodaRadio(resp3);
       acomodaRadio(resp4);
       acomodaRadio(resp5);
       acomodaRadio(concentracion);
       acomodaRadio(esfuerzo);
       acomodaRadio(presion);
       acomodaRadio(RIESGO);
       acomodaRadio(CONDICIONES);

       FECHA.Date:=NOW;
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

begin
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

procedure TFDetalle.GPstoRepKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
IF (KEY=40) and (ling+1= GPstoRep.RowCount) then
    GPstoRep.rowcount:=GPstoRep.rowcount+1;


if (key=46) AND  (linG<>(sender as TstringGrid).rowcount-1)  then
   if Application.MessageBox('¿Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
         if (key=46) and ((sender as TstringGrid).rowcount>2) then
                borra_row((sender as TstringGrid),linG);
         if (key=46) and ((sender as TstringGrid).rowcount=2) then
                limpia_linea((sender as TstringGrid),2);
      end;

end;

procedure TFDetalle.GPstoRepSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  ling:=arow;
  colg:=acol;
end;

procedure TFDetalle.gactdiaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
IF (KEY=40) and (ling+1= gactdia.RowCount) then
    gactdia.rowcount:=gactdia.rowcount+1;


if (key=46) AND  (linG<>(sender as TstringGrid).rowcount-1)  then
   if Application.MessageBox('¿Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
         if (key=46) and ((sender as TstringGrid).rowcount>2) then
                borra_row((sender as TstringGrid),linG);
         if (key=46) and ((sender as TstringGrid).rowcount=2) then
                limpia_linea((sender as TstringGrid),2);
      end;

end;

procedure TFDetalle.gactdiaSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  ling:=arow;
  colg:=acol;
end;

procedure TFDetalle.gactperKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
IF (KEY=40) and (ling+1= gactper.RowCount) then
    gactper.rowcount:=gactper.rowcount+1;


if (key=46) AND  (linG<>(sender as TstringGrid).rowcount-1)  then
   if Application.MessageBox('¿Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
         if (key=46) and ((sender as TstringGrid).rowcount>2) then
                borra_row((sender as TstringGrid),linG);
         if (key=46) and ((sender as TstringGrid).rowcount=2) then
                limpia_linea((sender as TstringGrid),2);
      end;

end;

procedure TFDetalle.gactperSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
  ling:=arow;
  colg:=acol;

end;

procedure TFDetalle.gacteveSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
  ling2:=arow;
  colg2:=acol;

end;

procedure TFDetalle.gacteveKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
IF (KEY=40) and (ling2+1= gacteve.RowCount) then
    gacteve.rowcount:=gacteve.rowcount+1;


if (key=46) AND  (linG<>(sender as TstringGrid).rowcount-1)  then
   if Application.MessageBox('¿Seguro que desea Borrar el Registro?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
         if (key=46) and ((sender as TstringGrid).rowcount>2) then
                borra_row((sender as TstringGrid),linG);
         if (key=46) and ((sender as TstringGrid).rowcount=2) then
                limpia_linea((sender as TstringGrid),2);
      end;

end;

procedure TFDetalle.GRelPstoSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);

begin
  inherited;
  ling:=arow;
  colg:=acol;
  if (colg=2) and (ling>=0) then
     begin
          frecuencia.Visible:=true;
          frecuencia.Top:=89+((ling)*20);
     end;
   if (colg=3) and (ling>=0) then
     begin
          ie.Visible:=true;
          ie.Top:=89+((ling)*20);
     end;

end;

procedure TFDetalle.frecuenciaChange(Sender: TObject);
begin
  inherited;
  frecuencia.visible:=false;
  grelPsto.Cells[2,ling]:=frecuencia.text;
end;

procedure TFDetalle.ieChange(Sender: TObject);
begin
  inherited;
  IE.visible:=false;
  grelPsto.Cells[3,ling]:=IE.text;
end;

procedure TFDetalle.gconocSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
  ling:=arow;
  colg:=acol;
  if (colg=1) and (ling>0) then
     begin
          porcentaje.Visible:=true;
          porcentaje.Top:=158+((ling-1)*20);
     end;


end;

procedure TFDetalle.gHabHumSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  ling2:=arow;
  colg2:=acol;
  if (colg2=1) and (ling2>0) then
     begin
          porcentaje2.Visible:=true;
          porcentaje2.Top:=30+((ling2-1)*20);
     end;

end;

procedure TFDetalle.gHabTecSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  inherited;
  lingp:=arow;
  colgp:=acol;
  if (colgP=1) and (lingP>0) then
     begin
          porcentaje3.Visible:=true;
          porcentaje3.Top:=46+((lingp-1)*20);
     end;

end;

procedure TFDetalle.porcentajeChange(Sender: TObject);
begin
  inherited;
  PORCENTAJE.visible:=false;
  GCONOC.Cells[1,ling]:=PORCENTAJE.text;

end;

procedure TFDetalle.porcentaje3Change(Sender: TObject);
begin
  inherited;
  PORCENTAJE3.visible:=false;
  GHABTEC.Cells[1,lingP]:=PORCENTAJE3.text;
end;

procedure TFDetalle.porcentaje2Change(Sender: TObject);
begin
  inherited;
  PORCENTAJE2.visible:=false;
  GHABHUM.Cells[1,ling2]:=PORCENTAJE2.text;
end;

procedure TFDetalle.GEXPSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  inherited;
  ling2:=arow;
  colg2:=acol;
  if (colg2=1) and (ling2>0) then
     begin
          EXPERIENCIA.Visible:=true;
          EXPERIENCIA.Top:=54+((ling2-1)*20);
     end;

end;

function numero(var key:char):char;
begin
  if key in ['0'..'9',#8,'.','-',#13] then numero:=key else numero:=#7;
end;


procedure TFDetalle.montoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key:=numero(key);
end;

procedure TFDetalle.GrabarCrespuesta(Grid:TstringGrid; tipo:string);
var
x:integer;
begin
   q.close;
   q.sql.text:='DELETE FROM CRESPUESTA WHERE NUMERO='+NUMCUE.CAPTION+
   ' AND TIPO='+#39+TIPO+#39;
   Q.execsql;
   for x:=0 to grid.RowCount-1 do
      begin
         if grid.Cells[0,x]<>'' then
            begin
               q.close;
               q.sql.text:='INSERT INTO CRESPUESTA(NUMERO, RESPUESTA, TIPO) '+
               ' VALUES ('+
               #39+NUMCUE.CAPTION+#39+','+
               #39+grid.Cells[0,x]+#39+','+
               #39+tipo+#39+')';
               savetofilelog(q.sql.text);
               q.EXECSQL;
            end;
      end;
end;


procedure TFDetalle.CargarCrespuesta(Grid:TstringGrid; tipo:string);
var
x:integer;
begin
   q.close;
   q.sql.text:='SELECT respuesta FROM CRESPUESTA WHERE NUMERO='+NUMCUE.CAPTION+
   ' AND TIPO='+#39+TIPO+#39;
   Q.open;
   grid.rowcount:=1;
   x:=0;
   WHILE NOT (Q.EOF) DO
      begin
            grid.cells[0,x]:=q.fields[0].asstring;
            grid.rowcount:=grid.rowcount+1;
            x:=x+1;
            q.next;

      end;
end;

procedure TFDetalle.CargarCrespuesta2(Grid:TstringGrid; tipo:string);
var
x:integer;
begin
   q.close;
   q.sql.text:='SELECT respuesta,opcion2 FROM CRESPUESTA2 WHERE NUMERO='+NUMCUE.CAPTION+
   ' AND TIPO='+#39+TIPO+#39;
   Q.open;
   x:=1;
   WHILE NOT (Q.EOF) DO
      begin
            grid.cells[0,x]:=q.fields[0].asstring;
            grid.cells[1,x]:=q.fields[1].asstring;
            x:=x+1;
            q.next;
      end;
end;


procedure TFDetalle.CargarCrelaciones(Grid:TstringGrid);
var
x:integer;
begin
   q.close;
   q.sql.text:='SELECT conquien,motivo,frecuencia,ie FROM CRELACION WHERE NUMERO='+NUMCUE.CAPTION;
   Q.open;
   x:=0;
   WHILE NOT (Q.EOF) DO
      begin
            grid.cells[0,x]:=q.fields[0].asstring;
            grid.cells[1,x]:=q.fields[1].asstring;
            grid.cells[2,x]:=q.fields[2].asstring;
            grid.cells[3,x]:=q.fields[3].asstring;
            x:=x+1;
            q.next;
      end;
end;


procedure TFDetalle.GrabarCrespuesta2(Grid:TstringGrid; tipo:string);
var
x:integer;
begin
   q.close;
   q.sql.text:='DELETE FROM CRESPUESTA2 WHERE NUMERO='+NUMCUE.CAPTION+
   ' AND TIPO='+#39+TIPO+#39;
   Q.execsql;
   for x:=1 to grid.RowCount-1 do
      begin
         if grid.Cells[0,x]<>'' then
            begin
               q.close;
               q.sql.text:='INSERT INTO CRESPUESTA2(NUMERO, RESPUESTA, OPCION2, TIPO) '+
               ' VALUES ('+
               #39+NUMCUE.CAPTION+#39+','+
               #39+grid.Cells[0,x]+#39+','+
               #39+grid.Cells[1,x]+#39+','+
               #39+tipo+#39+')';
               savetofilelog(q.sql.text);
               q.EXECSQL;
            end;
      end;
end;


procedure TFDetalle.GrabarCRelaciones;
var
x:integer;
begin
   q.close;
   q.sql.text:='DELETE FROM CRELACION WHERE NUMERO='+NUMCUE.CAPTION;
   Q.execsql;
   for x:=0 to GRelPsto.RowCount-1 do
      begin
         if GRelPsto.Cells[0,x]<>'' then
            begin
               q.close;
               q.sql.text:='INSERT INTO CRELACION(NUMERO, CONQUIEN, MOTIVO, FRECUENCIA,IE) '+
               ' VALUES ('+
               #39+NUMCUE.CAPTION+#39+','+
               #39+GRelPsto.Cells[0,x]+#39+','+
               #39+GRelPsto.Cells[1,x]+#39+','+
               #39+GRelPsto.Cells[2,x]+#39+','+
               #39+GRelPsto.Cells[3,x]+#39+')';
               savetofilelog(q.sql.text);
               q.EXECSQL;
            end;
      end;
end;


function getOpcion(opci:TRadioGroup):string;
begin
    if opci.itemindex>=0 THEN
       getOpcion:=opci.ITEMS[opci.ITEMINDEX]
    else
       getOpcion:='';
end;


function marcaOpcion(opci:TRadioGroup;cadena:string):string;
var
x:integer;
begin
    for x:=0 to opci.Items.Count-1 do
       if opci.Items[x]=cadena then
          begin
             opci.itemindex:=x;
             break;
          end;
end;

function TFDetalle.damePuntos(opci:TRadioGroup;numpreg:integer):integer;
begin
q.close;
q.sql.text:='SELECT NVL(VALOR,0) FROM CCATALOGOS WHERE PREG='+INTTOSTR(NUMPREG)+' AND ORDEN='+inttostr(OPCI.ITEMINDEX);
Q.open;
if not(q.eof) then
   damePuntos:=q.fields[0].asinteger
else
    damePuntos:=0;

end;

procedure TFDetalle.GuadarTodo;
var
totPuntos:integer;
expjerp,iniciativap,liderazgop,cordsupp,decisionesp,economicasp,relacionesp,
confidencialp,concentracionp,esfuerzop,presionp,riesgop,condicionesp:integer;

begin
if (puesto.text<>'') then
   begin
      q.close;
      q.sql.text:='SELECT COUNT(*) FROM CCUESTIONA WHERE NUMERO='+NUMCUE.Caption;
      Q.open;

      if q.Fields[0].asinteger<=0 then
         begin
             q.close;
             q.sql.text:='insert into ccuestiona (numero, nombre, lugar, puesto, '+
             'proposito, disciplina, monto, entrevistado, evaluador, aprobado, fecha,'+
             'ESCOLARIDAD,EXPJER,INICIATIVA,LIDERAZGO,CORDSUP,DECISIONES,ECONOMICAS,'+
             'RELACIONES,CONFIDENCIAL,CONCENTRACION,ESFUERZO,PRESION,RIESGO,CONDICIONES'+
             ') values ('+
             #39+numcue.caption+#39+','+
             #39+puesto.text+#39+','+
             #39+lugar.Text+#39+','+
             #39+puestoREPORTA.Text+#39+','+
             #39+proposito.Text+#39+','+
             #39+disciplina.Text+#39+','+
             #39+monto.Text+#39+','+
             #39+entrevistado.text+#39+','+
             #39+evaluador.Text+#39+','+
             #39+aprobado.Text+#39+','+
             #39+datetostr(fecha.date)+#39+','+
             #39+getopcion(REQUERIMIENTO)+#39+','+
             #39+getopcion(expjer)+#39+','+
             #39+getopcion(iniciativa)+#39+','+
             #39+getopcion(liderazgo)+#39+','+
             #39+getopcion(resp1)+#39+','+
             #39+getopcion(resp2)+#39+','+
             #39+getopcion(resp3)+#39+','+
             #39+getopcion(resp4)+#39+','+
             #39+getopcion(resp5)+#39+','+
             #39+getopcion(concentracion)+#39+','+
             #39+getopcion(esfuerzo)+#39+','+
             #39+getopcion(presion)+#39+','+
             #39+getopcion(RIESGO)+#39+','+
             #39+getopcion(CONDICIONES)+#39+')';
             savetofilelog(q.sql.text);
             q.EXECSQL;

         end
      else
         begin
            Q.CLOSE;
            Q.SQL.TEXT:='UPDATE  CCUESTIONA  SET '+
             'nombre='+#39+puesto.text+#39+','+
             'lugar='+#39+LUGAR.TEXT+#39+','+
             'puesto='+#39+PUESTOREPORTA.TEXT+#39+','+
             'proposito='+#39+proposito.text+#39+','+
             'disciplina='+#39+disciplina.text+#39+','+
             'monto ='+#39+monto.text+#39+','+
             'entrevistado='+#39+entrevistado.text+#39+','+
             'evaluador='+#39+evaluador.text+#39+','+
             'aprobado ='+#39+aprobado.text+#39+','+
             'fecha ='+#39+datetostr(fecha.date)+#39+','+
             'ESCOLARIDAD ='+#39+getopcion(REQUERIMIENTO)+#39+','+
             'EXPJER ='+#39+getopcion(expjer)+#39+','  +
             'INICIATIVA='+#39+getopcion(iniciativa)+#39+','+
             'LIDERAZGO='+#39+getopcion(liderazgo)+#39+','+
             'CORDSUP ='+#39+getopcion(resp1)+#39+','  +
             'DECISIONES='+#39+getopcion(resp2)+#39+','+
             'ECONOMICAS ='+#39+getopcion(resp3)+#39+',' +
             'RELACIONES ='+#39+getopcion(resp4)+#39+',' +
             'CONFIDENCIAL='+#39+getopcion(resp5)+#39+',' +
             'CONCENTRACION ='+#39+getopcion(concentracion)+#39+',' +
             'ESFUERZO='+#39+getopcion(esfuerzo)+#39+','+
             'PRESION  ='+#39+getopcion(presion)+#39+','+
             'RIESGO ='+#39+getopcion(RIESGO)+#39+','+
             'CONDICIONES='+#39+getopcion(CONDICIONES)+#39+
             ' WHERE NUMERO='+#39+NUMCUE.CAPTION+#39;
             savetofilelog(q.sql.text);
             q.EXECSQL;

         end;
             GrabarCrespuesta(GPSTOREP,'REPORTAN');
             GrabarCrespuesta(GACTDIA,'ACTDIA');
             GrabarCrespuesta(GACTPER,'ACTPER');
             GrabarCrespuesta(GACTEVE,'ACTEVE');
             GrabarCrELACIONES;
             GrabarCrespuesta2(GCONOC,'CONOC');
             GrabarCrespuesta2(GHABTEC,'HABTEC');
             GrabarCrespuesta2(GHABHUM,'HABHUM');
             GrabarCrespuesta2(GEXP,'EXP');

             //Guadar el puntaje
             totPuntos:=0;
             expjerp:=damePuntos(expjer,11);
             iniciativap:=damePuntos(iniciativa,12);
             liderazgop:=damePuntos(liderazgo,13);
             cordsupp:=damePuntos(resp1,30);
             decisionesp:=damePuntos(resp2,31);
             economicasp:=damePuntos(resp3,32);
             relacionesp:=damePuntos(resp4,33);
             confidencialp:=damePuntos(resp5,34);
             concentracionp:=damePuntos(concentracion,17);
             esfuerzop:=damePuntos(esfuerzo,18);
             presionp:=damePuntos(presion,19);
             riesgop:=damePuntos(RIESGO,20);
             condicionesp:=damePuntos(CONDICIONES,21);

             totPuntos:=expjerp+iniciativap+liderazgop+cordsupp+decisionesp+economicasp+relacionesp+
                        confidencialp+concentracionp+esfuerzop+presionp+riesgop+condicionesp;
             q.close;
             q.sql.text:='UPDATE CCUESTIONA SET PUNTOS='+inttostr(totpuntos)+','+
             'expjerp='+inttostr(expjerp)+','+
             'iniciativap='+inttostr(iniciativap)+','+
             'liderazgop='+inttostr(liderazgop)+','+
             'cordsupp='+inttostr(cordsupp)+','+
             'decisionesp='+inttostr(decisionesp)+','+
             'economicasp='+inttostr(economicasp)+','+
             'relacionesp='+inttostr(relacionesp)+','+
             'confidencialp='+inttostr(confidencialp)+','+
             'concentracionp='+inttostr(concentracionp)+','+
             'esfuerzop='+inttostr(esfuerzop)+','+
             'presionp='+inttostr(presionp)+','+
             'riesgop='+inttostr(riesgop)+','+
             'condicionesp='+inttostr(condicionesp)+
             ' WHERE NUMERO='+NUMCUE.Caption;
             Q.execsql;
             error:=false;
   end
else
   begin
      error:=true;
      Showmessage('Para Guardar y/o proseguir debe llenar al menos el puesto');
      page.ActivePageIndex:=0;
   end;
end;

procedure TFDetalle.pageChange(Sender: TObject);
begin
  inherited;
  guadarTodo;
end;

procedure TFDetalle.EXPERIENCIAChange(Sender: TObject);
begin
  inherited;
  experiencia.visible:=false;
  gexp.Cells[1,ling2]:=experiencia.text;
end;

procedure TFDetalle.BCancelaClick(Sender: TObject);
begin
if (Application.MessageBox('Seguro desea salir del Cuestionario', 'Confirmar', MB_ICONQUESTION+ MB_YESNO)= IDYES)
      then  Close  ;  // Selecciona Captura
end;

procedure TFDetalle.BSeleccionaClick(Sender: TObject);
begin
guadarTodo;
if not(error) then
   begin
     Showmessage('Los datos se han grabado');
     CLOSE;
   end;
end;


procedure tfdetalle.cargarCuestionario(n:integer);
begin
q.close;
q.sql.text:='SELECT * FROM CCUESTIONA WHERE NUMERO='+inttostr(n);
Q.open;
puesto.text:=q.fieldbyname('nombre').asstring;
LUGAR.TEXT:=q.fieldbyname('lugar').asstring;
PUESTOREPORTA.TEXT:=q.fieldbyname('puesto').asstring;
proposito.text:=q.fieldbyname('proposito').asstring;
disciplina.text:=q.fieldbyname('disciplina').asstring;
monto.text:=q.fieldbyname('monto').asstring;
entrevistado.text:=q.fieldbyname('entrevistado').asstring;
evaluador.text:=q.fieldbyname('evaluador').asstring;
aprobado.text:=q.fieldbyname('aprobado').asstring;
fecha.date:=q.fieldbyname('fecha').asdatetime;
marcaOpcion(REQUERIMIENTO,q.fieldbyname('ESCOLARIDAD').asstring);
marcaOpcion(expjer,q.fieldbyname('EXPJER').asstring);
marcaOpcion(iniciativa,q.fieldbyname('INICIATIVA').asstring);
marcaOpcion(liderazgo,q.fieldbyname('LIDERAZGO').asstring);
marcaOpcion(resp1,q.fieldbyname('CORDSUP').asstring);
marcaOpcion(resp2,q.fieldbyname('DECISIONES').asstring);
marcaOpcion(resp3,q.fieldbyname('ECONOMICAS').asstring);
marcaOpcion(resp4,q.fieldbyname('RELACIONES').asstring);
marcaOpcion(resp5,q.fieldbyname('CONFIDENCIAL').asstring);
marcaOpcion(concentracion,q.fieldbyname('CONCENTRACION').asstring);
marcaOpcion(esfuerzo,q.fieldbyname('ESFUERZO').asstring);
marcaOpcion(presion,q.fieldbyname('PRESION').asstring);
marcaOpcion(RIESGO,q.fieldbyname('RIESGO').asstring);
marcaOpcion(CONDICIONES,q.fieldbyname('CONDICIONES').asstring);




end;

procedure TFDetalle.numcueDblClick(Sender: TObject);
var
cad:string;
begin
  inherited;
  cad:= inputbox('Número de Cuestionario','Cuestionario','');
        numcue.Caption:=cad;
        cargarCuestionario(strtoint(cad));
         cargarCrespuesta(GPSTOREP,'REPORTAN');
        cargarCrespuesta(GACTDIA,'ACTDIA');
        cargarCrespuesta(GACTPER,'ACTPER');
        cargarCrespuesta(GACTEVE,'ACTEVE');
        cargarCrELACIONES(gRelPsto);
        cargarCrespuesta2(GCONOC,'CONOC');
        cargarCrespuesta2(GHABTEC,'HABTEC');
        cargarCrespuesta2(GHABHUM,'HABHUM');
        cargarCrespuesta2(GEXP,'EXP');

end;

procedure TFDetalle.ieExit(Sender: TObject);
begin
  inherited;
  (sender as TcomboBox).visible:=false;
end;

procedure TFDetalle.frecuenciaExit(Sender: TObject);
begin
  inherited;
  (sender as TcomboBox).visible:=false;
end;

procedure TFDetalle.porcentajeExit(Sender: TObject);
begin
  inherited;
  (sender as TcomboBox).visible:=false;
end;

procedure TFDetalle.porcentaje3Exit(Sender: TObject);
begin
  inherited;
  (sender as TcomboBox).visible:=false;
end;

procedure TFDetalle.porcentaje2Exit(Sender: TObject);
begin
  inherited;
  (sender as TcomboBox).visible:=false;
end;

procedure TFDetalle.EXPERIENCIAExit(Sender: TObject);
begin
  inherited;
  (sender as TcomboBox).visible:=false;
end;

procedure TFDetalle.SpeedButton1Click(Sender: TObject);
begin
devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE','GUIA','pdf');
shellexecute(handle,'open',pchar(extractfiledir(paramstr(0))+'\GUIA.PDF'),nil, nil, SW_show);

end;

End.
