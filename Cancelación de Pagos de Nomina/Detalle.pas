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
    SpeedButton1: TSpeedButton;
    qpol: TQuery;
    dspol: TDataSource;
    QDetPol: TQuery;
    DSDetPol: TDataSource;
    TabSheet5: TTabSheet;
    dg: TDBGrid;
    QError: TQuery;
    dserror: TDataSource;
    Shape1: TShape;
    fpago: TRadioGroup;
    Label10: TLabel;
    DBCog: TDBGrid;
    DsCog: TDataSource;
    QCog: TQuery;
    TabSheet3: TTabSheet;
    DBDEUDORES: TDBGrid;
    DSDeudor: TDataSource;
    qdeudor: TQuery;
    TIPOC: TDBEdit;
    TNOMINA: TDBEdit;
    Label12: TLabel;
    SpeedButton2: TSpeedButton;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    elcog: TEdit;
    Label16: TLabel;
    Fecha: TEdit;
    ccp: TEdit;
    Label17: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure PAGOChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure dgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure fpagoClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;
  POLREAL:BOOLEAN;
implementation

{$R *.DFM}

procedure TFDetalle.FormCreate(Sender: TObject);
begin
  inherited;
 Height := 504 ;
 Width := 1067 ;
 POLREAL:=FALSE;
end;

procedure TFDetalle.PAGOChange(Sender: TObject);
var
totp, totd, totneto:real;
tppagos, tpdpagos:string;
begin
  inherited;
  IF  TNOMINA.Text='O' THEN begin  tppagos:='PPAGOS'; TPDPAGOS:='PDPAGOS'  end;
  IF  TNOMINA.Text='C' THEN begin  tppagos:='PPAGOS'; TPDPAGOS:='PDPAGOS'  end;
  IF  TNOMINA.Text='H' THEN begin  tppagos:='PHPAGOS'; TPDPAGOS:='PHDPAGOS'  end;
  IF  TNOMINA.Text='N' THEN begin  tppagos:='PNPAGOS'; TPDPAGOS:='PNDPAGOS'  end;

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

  FECHA.Text:=DatetoStr(DATE); 
end;

procedure TFDetalle.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  IF FPAGO.ItemIndex>=0 THEN
     begin
        q.close;
        q.SQL.text:='CALL CANCELAPAGODIN('+#39+PAGO.TEXT+#39+','+inttostr(fpago.itemindex)+
        ','+#39+FECHA.TEXT+#39+','+#39+tnomina.TEXT+#39+','+#39+'N'+#39+')';
        Q.execsql;
        qpol.close;
        qpol.sql.text:='SELECT * FROM PPOLIZASCAN WHERE POLI_PAGO='+#39+pago.text+#39;
        QPOL.open;
        qdetpol.Close;
        qdetpol.sql.text:='SELECT DETM_REFID AS ID, DETM_PROY AS PROY, DETM_SFDO AS SUBFONDO,'+
        ' DETM_URES AS URES, DETM_CNTA AS CUENTA, DETM_SCTA AS SCTA, DETM_PROG,  '+
        ' DETM_TMOV AS TIPO, DETM_MONTO AS MONTO, DETM_DESCRIP AS DESCRIPCION  '+
        ' FROM PDETMOVICAN WHERE DETM_POLID='+#39+Qpol.fieldbyname('POLI_POLID').asstring+#39+
        ' ORDER BY DETM_refid ASC, DETM_TMOV ASC';
        qdetpol.open;
        qerror.close;
        qerror.sql.text:='SELECT ERRO_DESCRIP AS MENSAJE, ERRO_TIPO AS TIPO FROM PERRORESCAN '+
        'WHERE ERRO_PAGO='+#39+pago.text+#39+' ORDER BY ERRO_DESCRIP';
        Qerror.open;

         qDeudor.Close;
        qdeudor.sql.text:='SELECT DEUD_PERSONA AS PERSONA, DEUD_MONTO AS MONTO, '+
        'DEUD_PAGADO AS PAGADO, DEUD_CNTA_A AS CUENTA_AB, DEUD_SCTA_A AS SUBCUEN_AB, '+
        'DEUD_CNTA_C AS CUENTA_CARGO, DEUD_SCTA_C AS SUBCUENTA_CARGO FROM PDEUDORCAN WHERE DEUD_PAGO='+#39+PAGO.TEXT+#39;
        Qdeudor.open;

        polreal:=false;
    end
  else
    showmessage('Elija una opción de cancelación');
end;

procedure TFDetalle.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  IF NOT(POLREAL) THEN
     BEGIN
        qdetpol.Close;
        qdetpol.sql.text:='SELECT * FROM PDETMOVICAN WHERE DETM_POLID='+#39+Qpol.fieldbyname('POLI_POLID').asstring+#39+
          ' ORDER BY DETM_CNTA, DETM_TMOV';
        qdetpol.open;
     END
  ELSE
     BEGIN
         qdetpol.Close;
        qdetpol.sql.text:='SELECT DETM_REFID AS ID, DETM_PROY AS PROY, DETM_SFDO AS SUBFONDO,'+
        ' DETM_URES AS URES, DETM_CNTA AS CUENTA, DETM_SCTA AS SCTA, DETM_PROG,  '+
        ' DETM_TMOV AS TIPO, DETM_MONTO AS MONTO, DETM_DESCRIP AS DESCRIPCION  '+
        ' FROM FDETMOVI WHERE DETM_POLID='+#39+Qpol.fieldbyname('POLI_POLID').asstring+#39+
        ' ORDER BY DETM_refid ASC, DETM_TMOV ASC';
        qdetpol.open;
     END;

end;

procedure TFDetalle.dgDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  try
     if (Qerror.fieldbyname('TIPO').asstring)='ERROR' THEN
         Dg.canvas.Brush.Color:=$00E6EAFF;
     if (Qerror.fieldbyname('TIPO').asstring)='ACTUALIZA' THEN
         Dg.canvas.Brush.Color:=$00F1F9D5;
      if (QError.fieldbyname('TIPO').asstring)='ADVERTENCIA' THEN
         Dg.canvas.Brush.Color:=CLwhite;

     dg.Canvas.Font.Color:=clblack;
     Dg.Canvas.FillRect(Rect);
     Dg.DefaultDrawColumnCell(Rect,DataCol,Column,State);
except end;
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
Showmessage('Exportar ...');
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

procedure TFDetalle.fpagoClick(Sender: TObject);
begin
  inherited;
  TIPOC.Field.AsString:=INTTOSTR(FPAGO.ITEMINDEX);
end;

procedure TFDetalle.SpeedButton2Click(Sender: TObject);
begin
  inherited;
if Application.MessageBox('Seguro que desea Cancelar el Pago','Confirmar',
         MB_ICONQUESTION+ MB_YESNO)= IDYES then
         begin

             q.close;
             q.sql.text:='SELECT COUNT(*) from pcancelpago t WHERE CANC_PAGO='+#39+pago.text+#39;
             Q.open;
             if (q.fields[0].asinteger>0) and  (fpago.itemindex<>2) then
                begin
                   showmessage('El pago'+pago.text+' Ya se cancelo anteriormente solo se puede cancelar nuevamente si es por efectivo para realizar la segunda parte ');
                end
             else
                begin
                   q.Close;
                   q.sql.text:='INSERT INTO PCANCELPAGO '+
                   '(CANC_NUMERO,CANC_PAGO,CANC_FECCANCEL,CANC_FPAGO, CANC_TNOMINA, '+
                   'CANC_PROCESO, CANC_OBS, CANC_CCP) VALUES ('+
                   'PSQPCANCELPAGO.nextval,'+
                   #39+PAGO.TEXT+#39+','+
                   #39+FECHA.TEXT+#39+','+
                   #39+inttostr(fpago.itemindex)+#39+','+
                   #39+tnomina.text+#39+','+
                   #39+'N'+#39+','+
                   #39+TEXTO.text+#39+','+
                   #39+ccp.text+#39+')';
                   Q.execsql;

                   Q.close;
                   q.sql.text:='UPDATE PCANCPAGO SET '+
                   ' CANC_CANCELA = '+#39+'S'+#39+','+
                   ' CANC_TEXTO = '+#39+TEXTO.text+#39+','+
                   ' CANC_FECCANCEL='+#39+fecha.text+#39+','+
                   ' CANC_TIPOC='+#39+inttostr(fpago.itemindex)+#39 +
                   ' Where CANC_PAGO = '+#39+pago.text+#39;
                   q.execsql;

                   Showmessage('El pago se ha cancelado');
                   close;
             end;
         end;

end;

procedure TFDetalle.Button1Click(Sender: TObject);
begin
  inherited;
        polreal:=true;
        qpol.close;
        qpol.sql.text:='SELECT * FROM FPOLIZAS WHERE POLI_DESCRIP LIKE '+#39+'%('+pago.text+')%'+#39;
        QPOL.open;



        qDeudor.Close;
        qdeudor.sql.text:='SELECT DEUD_PERSONA AS PERSONA, DEUD_MONTO AS MONTO, '+
        'DEUD_PAGADO AS PAGADO, DEUD_CNTA_A AS CUENTA_AB, DEUD_SCTA_A AS SUBCUEN_AB, '+
        'DEUD_CNTA_C AS CUENTA_CARGO, DEUD_SCTA_C AS SUBCUENTA_CARGO FROM PDEUDORCAN WHERE DEUD_PAGO='+#39+PAGO.TEXT+#39;
        Qdeudor.open;
end;

end.
