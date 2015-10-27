unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDETALLE, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls, Buttons,OleServer, Excel97, Comobj;

type
  TFDetalle = class(TPFDetalle)
    PAGE: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    PAGO: TDBEdit;
    NOMBRE: TDBEdit;
    NOMINA: TDBEdit;
    TEXTO: TDBMemo;
    Cancela: TDBCheckBox;
    TPSTO: TDBEdit;
    TabSheet2: TTabSheet;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    Label3: TLabel;
    Label7: TLabel;
    QPer: TQuery;
    DsPer: TDataSource;
    DsDed: TDataSource;
    QDed: TQuery;
    TP: TLabel;
    TD: TLabel;
    NETO: TLabel;
    Label8: TLabel;
    Q: TQuery;
    TabSheet4: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label9: TLabel;
    qpol: TQuery;
    dspol: TDataSource;
    QDetPol: TQuery;
    DSDetPol: TDataSource;
    QError: TQuery;
    dserror: TDataSource;
    DBCog: TDBGrid;
    DsCog: TDataSource;
    QCog: TQuery;
    TabSheet3: TTabSheet;
    DBDEUDORES: TDBGrid;
    DSDeudor: TDataSource;
    qdeudor: TQuery;
    TNOMINA: TDBEdit;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure PAGOChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;

implementation

{$R *.DFM}

procedure TFDetalle.FormCreate(Sender: TObject);
begin
  inherited;
 Height := 504 ;
 Width := 1067 ;
end;

procedure TFDetalle.PAGOChange(Sender: TObject);
var
totp, totd, totneto:real;
tppagos, tpdpagos:string;
begin
  inherited;
  IF  TNOMINA.Text='O' THEN begin  tppagos:='PPAGOS'; TPDPAGOS:='PDPAGOS'  end;
  IF  TNOMINA.Text='H' THEN begin  tppagos:='PHPAGOS'; TPDPAGOS:='PHDPAGOS'  end;
  IF  TNOMINA.Text='N' THEN begin  tppagos:='PNPAGOS'; TPDPAGOS:='PNDPAGOS'  end;
  IF  TNOMINA.Text='I' THEN begin  tppagos:='PIPAGOS'; TPDPAGOS:='PIDPAGOS'  end;

  qper.close;
  qper.sql.text:='SELECT S.DPAG_CONP AS CONCEPTO, S.DPAG_DESCRIP AS DESCRIPCION,'+
  ' S.DPAG_MONTO AS MONTO, DPAG_CNTA AS CUENTA, DPAG_SCTA AS SUBCUENTA FROM '+TPDPAGOS+' S WHERE S.DPAG_PAGO='+#39+PAGO.TEXT+#39+
  ' AND S.DPAG_PERDED='+#39+'P'+#39;
  Qper.open;

  qded.close;
  qded.sql.text:='SELECT S.DPAG_CONP AS CONCEPTO, S.DPAG_DESCRIP AS DESCRIPCION,'+
  ' S.DPAG_MONTO AS MONTO, DPAG_CNTA AS CUENTA, DPAG_SCTA AS SUBCUENTA FROM '+TPDPAGOS+' S WHERE S.DPAG_PAGO='+#39+PAGO.TEXT+#39+
  ' AND S.DPAG_PERDED='+#39+'D'+#39;
  Qded.open;

  QCOG.CLOSE;
  qcog.sql.text:='SELECT DPAG_PERDED, DPAG_CNTA AS , DPAG_SCTA AS SUBCUENTA, '+
  ' SUM(DPAG_MONTO) AS MONTO FROM '+TPDPAGOS+' S WHERE S.DPAG_PAGO='+#39+PAGO.TEXT+#39+
  ' GROUP BY S.DPAG_PERDED, S.DPAG_CNTA, S.DPAG_SCTA '+
  ' ORDER BY DPAG_PERDED DESC ';
  qcog.open;


  Q.CLOSE;
  Q.SQL.TEXT:='SELECT SUM(DPAG_MONTO)  FROM '+TPDPAGOS+' S WHERE S.DPAG_PAGO='+#39+PAGO.TEXT+#39+
  ' AND S.DPAG_PERDED='+#39+'P'+#39;
  Q.open;
  totp:=q.fields[0].asfloat;
  tp.caption:=formatfloat('#,#0.00',totp);

  Q.CLOSE;
  Q.SQL.TEXT:='SELECT SUM(DPAG_MONTO)  FROM '+TPDPAGOS+' S WHERE S.DPAG_PAGO='+#39+PAGO.TEXT+#39+
  ' AND S.DPAG_PERDED='+#39+'D'+#39;
  Q.open;
  totd:=q.fields[0].asfloat;
  td.caption:=formatfloat('#,#0.00',totd);

  totneto:=totp-totd;
  neto.caption:=formatfloat('#,#0.00',totneto);


        qpol.close;
        qpol.sql.text:='SELECT * FROM FPOLIZAS WHERE POLI_DESCRIP LIKE '#39+'%'+PAGO.TEXT+'%'+#39;
        QPOL.open;


         qDeudor.Close;
        qdeudor.sql.text:='SELECT DEUD_PERSONA AS PERSONA, DEUD_MONTO AS MONTO, '+
        'DEUD_PAGADO AS PAGADO, DEUD_CNTA_A AS CUENTA_AB, DEUD_SCTA_A AS SUBCUEN_AB, '+
        'DEUD_CNTA_C AS CUENTA_CARGO, DEUD_SCTA_C AS SUBCUENTA_CARGO FROM PDEUDOR WHERE DEUD_PAGO='+#39+PAGO.TEXT+#39;
        Qdeudor.open;

end;

procedure TFDetalle.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  qdetpol.Close;
  qdetpol.sql.text:='SELECT * FROM FDETMOVI WHERE DETM_POLID='+#39+Qpol.fieldbyname('POLI_POLID').asstring+#39+
    ' ORDER BY DETM_CNTA, DETM_TMOV';
  qdetpol.open;

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
             ExcelWorksheet1.Cells.Item[y+1,x+1].value:=q.fields[x].asstring;
        q.next;
     end;

// ExcelWorksheet1.Disconnect;
// ExcelWorkbook1.Disconnect;
// ExcelApplication1.Disconnect;
end;



procedure TFDetalle.DBGrid3DblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(qper);
end;

procedure TFDetalle.DBGrid4DblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(qded);
end;

procedure TFDetalle.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(qdetPol);
end;

procedure TFDetalle.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(qPol);
end;

end.
