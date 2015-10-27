unit Cancela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, Buttons,OleServer, Excel97, Comobj, LIBRERIA;

type
  TFCancela = class(TPFDetalle)
    PAGE: TPageControl;
    TabSheet1: TTabSheet;
    Shape1: TShape;
    Label1: TLabel;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    Label10: TLabel;
    fpago: TRadioGroup;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Label7: TLabel;
    TP: TLabel;
    TD: TLabel;
    NETO: TLabel;
    Label8: TLabel;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DBCog: TDBGrid;
    TabSheet4: TTabSheet;
    Label9: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    TabSheet5: TTabSheet;
    dg: TDBGrid;
    TabSheet3: TTabSheet;
    DBDEUDORES: TDBGrid;
    mov: TEdit;
    Pago: TEdit;
    FECHAPAGO: TEdit;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    Fecha: TEdit;
    QPer: TQuery;
    DsPer: TDataSource;
    qpol: TQuery;
    QDed: TQuery;
    DsDed: TDataSource;
    dspol: TDataSource;
    QDetPol: TQuery;
    DSDetPol: TDataSource;
    DsCog: TDataSource;
    QCog: TQuery;
    DSDeudor: TDataSource;
    qdeudor: TQuery;
    QError: TQuery;
    dserror: TDataSource;
    Q: TQuery;
    PROYECTO: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    Trans: TEdit;
    Label22: TLabel;
    procedure PagoChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure dgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure movChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCancela: TFCancela;

implementation

{$R *.DFM}



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



procedure TFCancela.PagoChange(Sender: TObject);
var
totp, totd, totneto:real;
begin
  qper.close;
  qper.sql.text:='SELECT S.DPAG_CONP AS CONCEPTO, S.DPAG_DESCRIP AS DESCRIPCION,'+
  ' S.DPAG_MONTO AS MONTO, DPAG_CNTA AS CUENTA, DPAG_SCTA AS SUBCUENTA FROM PMOVFNPDPAGOSRi S WHERE S.DPAG_PAGO='+#39+PAGO.TEXT+#39+
  ' AND S.DPAG_PERDED='+#39+'P'+#39;
  Qper.open;

  qded.close;
  qded.sql.text:='SELECT S.DPAG_CONP AS CONCEPTO, S.DPAG_DESCRIP AS DESCRIPCION,'+
  ' S.DPAG_MONTO AS MONTO, DPAG_CNTA AS CUENTA, DPAG_SCTA AS SUBCUENTA FROM PMOVFNPDPAGOSRi S WHERE S.DPAG_PAGO='+#39+PAGO.TEXT+#39+
  ' AND S.DPAG_PERDED='+#39+'D'+#39;
  Qded.open;

  QCOG.CLOSE;
  qcog.sql.text:='SELECT DPAG_PERDED, DPAG_CNTA AS , DPAG_SCTA AS SUBCUENTA, '+
  ' SUM(DPAG_MONTO) AS MONTO FROM PMOVFNPDPAGOSRi S WHERE S.DPAG_PAGO='+#39+PAGO.TEXT+#39+
  ' GROUP BY S.DPAG_PERDED, S.DPAG_CNTA, S.DPAG_SCTA '+
  ' ORDER BY DPAG_PERDED DESC ';
  qcog.open;


  Q.CLOSE;
  Q.SQL.TEXT:='SELECT SUM(DPAG_MONTO)  FROM PMOVFNPDPAGOSRi S WHERE S.DPAG_PAGO='+#39+PAGO.TEXT+#39+
  ' AND S.DPAG_PERDED='+#39+'P'+#39;
  Q.open;
  totp:=q.fields[0].asfloat;
  tp.caption:=formatfloat('#,#0.00',totp);

  Q.CLOSE;
  Q.SQL.TEXT:='SELECT SUM(DPAG_MONTO)  FROM PMOVFNPDPAGOSRi S WHERE S.DPAG_PAGO='+#39+PAGO.TEXT+#39+
  ' AND S.DPAG_PERDED='+#39+'D'+#39;
  Q.open;
  totd:=q.fields[0].asfloat;
  td.caption:=formatfloat('#,#0.00',totd);

  totneto:=totp-totd;
  neto.caption:=formatfloat('#,#0.00',totneto);


end;

procedure TFCancela.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
 qdetpol.Close;
  qdetpol.sql.text:='SELECT * FROM PDETMOVICAN WHERE DETM_POLID='+#39+Qpol.fieldbyname('POLI_POLID').asstring+#39+
    ' ORDER BY DETM_CNTA, DETM_TMOV';
  qdetpol.open;
end;

procedure TFCancela.dgDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
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




procedure TFCancela.movChange(Sender: TObject);
begin
  inherited;
  Q.CLOSE;
  q.sql.text:='SELECT MIN(PAGO_PAGO) FROM PMOVFNPPAGOSRi A WHERE A.PAGO_NOMINA='+#39+mov.text+#39;
  Q.open;
  pago.text:=q.fields[0].asstring;


end;

procedure TFCancela.SpeedButton1Click(Sender: TObject);
begin
  IF FPAGO.ItemIndex>=0 THEN
     begin
        q.close;
        q.SQL.text:='CALL CANCELAPAGOFNV('+#39+PAGO.TEXT+#39+','+
        #39+Proyecto.TEXT+#39+','+inttostr(fpago.itemindex)+
        ','+#39+FECHA.TEXT+#39+')';
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
        'DEUD_PAGADO AS PAGADO FROM PDEUDOR WHERE DEUD_PAGO='+#39+PAGO.TEXT+#39;
        Qdeudor.open;
    end
  else
    showmessage('Elija una opción de cancelación');


end;

procedure TFCancela.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
 EXPORTARXLS(QdetPol);
end;

procedure TFCancela.SpeedButton2Click(Sender: TObject);
begin
if Application.MessageBox('Seguro que desea Cancelar el Pago Fuera de Nomina','Confirmar',
         MB_ICONQUESTION+ MB_YESNO)= IDYES then
         begin
             q.Close;
             q.sql.text:='UPDATE PMOVFUENOMi SET '+
             'MOVF_CANCEL='+#39+'S'+#39+','+
             'MOVF_FECCANCEL='+#39+FECHA.TEXT+#39+','+
             'MOVF_CANCELTIPO='+#39+INTTOSTR(FPAGO.ITEMINDEX)+#39+','+
             'MOVF_PROYCANC='+#39+PROYECTO.TEXT+#39+','+
             'MOVF_PAGOCANC='+#39+PAGO.TEXT+#39+','+
             'MOVF_FECCANCELR=SYSDATE '+','+
             'MOVF_USERCANC=USER '+
             ' WHERE MOVF_SEQ='+#39+MOV.TEXT+#39;
             Q.execsql;
             Showmessage('El pago se ha cancelado');
         end;

end;

end.
