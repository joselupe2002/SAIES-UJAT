unit Orden;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls,Libreria;

type
  TFOrden = class(TPFDetalle)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Qpol: TQuery;
    DsPol: TDataSource;
    DBGrid1: TDBGrid;
    mov: TEdit;
    Label1: TLabel;
    DBGrid2: TDBGrid;
    DSDetPol: TDataSource;
    QdetPol: TQuery;
    DETALLE: TLabel;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    QDed: TQuery;
    DsDed: TDataSource;
    QPer: TQuery;
    DsPer: TDataSource;
    TD: TLabel;
    TP: TLabel;
    NETO: TLabel;
    Q: TQuery;
    Label2: TLabel;
    DBGrid5: TDBGrid;
    DBGrid6: TDBGrid;
    Label3: TLabel;
    DSOP: TDataSource;
    QOP: TQuery;
    DsDetOP: TDataSource;
    QDetOP: TQuery;
    PopupMenu1: TPopupMenu;
    Sumar1: TMenuItem;
    Button1: TButton;
    fecha: TEdit;
    Label22: TLabel;
    procedure movChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid5CellClick(Column: TColumn);
    procedure Sumar1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOrden: TFOrden;

implementation

{$R *.DFM}

procedure TFOrden.movChange(Sender: TObject);
var
totp, totd, totneto:real;
numpag: string;
begin
  inherited;
  q.close;
  q.sql.text:='SELECT MIN(PAGO_PAGO) FROM PMOVFNPPAGOSRI A WHERE A.PAGO_NOMINA='+#39+mov.text+#39;
  q.open;
  numpag:=q.fields[0].asstring;

  qpol.close;
  qpol.sql.text:='select S.POLI_POLID AS POLIZA, S.POLI_TIPDOC AS TIP_DOC, '+
  'S.POLI_ANIO AS EJERCICIO, S.POLI_MES AS MES, S.POLI_NUM AS NUM, S.POLI_FECHA '+
  'AS FECHA, S.POLI_DESCRIP AS DESCRIPCION, S.POLI_USU AS USUARIO, S.POLI_FEC AS '+
  'FECHA FROM FPOLIZAS S where ((s.poli_descrip LIKE  '+#39+MOV.TEXT+'\_%'+#39+ ' ESCAPE '+#39+'\'+#39+')'+
   ' or s.poli_descrip LIKE '+#39+'%('+MOV.TEXT+')%'+#39+
   ' or s.poli_descrip LIKE '+#39+'%('+NUMPAG+')%'+#39+')'+
   ' AND POLI_TIPDOC='+#39+'CP'+#39;
   SAVETOFILELOG(QPOL.SQL.TEXT);
  Qpol.open;


  qdetPol.close;
    qdetPol.sql.text:='SELECT DETM_SFDO AS SFDO, DETM_URES AS URES, DETM_CNTA AS CUENTA, '+
  'DETM_SCTA AS COG, DETM_PROG AS PROG, DETM_TMOV AS TIPO_MOV, DETM_MONTO AS MONTO, '+
  'DETM_DESCRIP AS DESCRIPCION, DETM_TAG AS TAG, DETM_REFID AS REFID,'+
  'DETM_META AS META, DETM_PROY AS PROY FROM FDETMOVI WHERE DETM_POLID='+#39+QPOL.Fields[0].asstring+#39+
  'ORDER BY DETM_CNTA, DETM_TMOV';
  QdetPol.open;

  qper.close;
  qper.sql.text:='SELECT S.DPAG_CONP AS CONCEPTO, S.DPAG_DESCRIP AS DESCRIPCION,'+
  ' S.DPAG_MONTO AS MONTO FROM PMOVFNPDPAGOSRI S WHERE S.DPAG_MOVI='+#39+MOV.TEXT+#39+
  ' AND S.DPAG_PERDED='+#39+'P'+#39;
  Qper.open;

  qded.close;
  qded.sql.text:='SELECT S.DPAG_CONP AS CONCEPTO, S.DPAG_DESCRIP AS DESCRIPCION,'+
  ' S.DPAG_MONTO AS MONTO FROM PMOVFNPDPAGOSRI S WHERE S.DPAG_MOVI='+#39+MOV.TEXT+#39+
  ' AND S.DPAG_PERDED='+#39+'D'+#39;
  Qded.open;

  Q.CLOSE;
  Q.SQL.TEXT:='SELECT SUM(DPAG_MONTO)  FROM PMOVFNPDPAGOSRI S WHERE S.DPAG_MOVI='+#39+MOV.TEXT+#39+
  ' AND S.DPAG_PERDED='+#39+'P'+#39;
  Q.open;
  totp:=q.fields[0].asfloat;
  tp.caption:=formatfloat('#,#0.00',totp);

  Q.CLOSE;
  Q.SQL.TEXT:='SELECT SUM(DPAG_MONTO)  FROM PMOVFNPDPAGOSRI S WHERE S.DPAG_MOVI='+#39+MOV.TEXT+#39+
  ' AND S.DPAG_PERDED='+#39+'D'+#39;
  Q.open;
  totd:=q.fields[0].asfloat;
  td.caption:=formatfloat('#,#0.00',totd);

  totneto:=totp-totd;
  neto.caption:=formatfloat('#,#0.00',totneto);

  QOP.Close;
  qop.sql.text:='SELECT X.DOCX_POLID AS POLIZA, X.DOCX_PERSONA AS PERSONA, '+
  'X.DOCX_DESCRIP AS DESCRIPCION,X.DOCX_TOTAL AS MONTO, X.DOCX_PAGADO AS PAGADO,'+
  'X.DOCX_APROBADO AS APROBADO, X.DOCX_FCANCREAL AS FEC_CAN_REAL,'+
  'X.DOCX_FECHA AS FECHA, X.DOCX_FECCANCEL AS FECCANCEL'+
  ' FROM FINANZAS.AFDOCXPAG X WHERE X.DOCX_POLID IN'+
  '(SELECT A.POLN_POLID FROM PIPOLNOMI A WHERE A.POLN_NOMINA='+#39+MOV.TEXT+#39+')';
  qOP.Open;

  Qdetop.close;
  qdetop.sql.text:='SELECT B.DODO_POLID AS POLIZA, B.DODO_DESCRIP AS DESCRIPCION,'+
  'B.DODO_SFDO AS SFDO,B.DODO_URES AS URES, B.DODO_PROG AS PROG,'+
  'B.DODO_PROY AS PROY, B.DODO_CNTA AS CUENTA, B.DODO_SCTA AS SCTA,'+
  'B.DODO_CANT AS CANT, B.DODO_PUNIT AS MONTO, B.DODO_COG AS COG '+
  ' FROM FINANZAS.AFDODOCXP B WHERE B.DODO_POLID ='+#39+qop.fields[0].asstring+#39;
  qdetop.open;
end;

procedure TFOrden.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  DETALLE.Caption:='Detalle de la Poliza No. '+ QPOL.Fields[0].asstring;
  qdetPol.close;
  qdetPol.sql.text:='SELECT DETM_SFDO AS SFDO, DETM_URES AS URES, DETM_CNTA AS CUENTA, '+
  'DETM_SCTA AS COG, DETM_PROG AS PROG, DETM_TMOV AS TIPO_MOV, DETM_MONTO AS MONTO, '+
  'DETM_DESCRIP AS DESCRIPCION, DETM_TAG AS TAG, DETM_REFID AS REFID,'+
  'DETM_META AS META, DETM_PROY AS PROY FROM FDETMOVI WHERE DETM_POLID='+#39+QPOL.Fields[0].asstring+#39+
  'ORDER BY DETM_CNTA, DETM_TMOV';
  QdetPol.open;
end;

procedure TFOrden.DBGrid5CellClick(Column: TColumn);
begin
  inherited;
 Qdetop.close;
  qdetop.sql.text:='SELECT B.DODO_POLID AS POLIZA, B.DODO_DESCRIP AS DESCRIPCION,'+
  'B.DODO_SFDO AS SFDO,B.DODO_URES AS URES, B.DODO_PROG AS PROG,'+
  'B.DODO_PROY AS PROY, B.DODO_CNTA AS CUENTA, B.DODO_SCTA AS SCTA,'+
  'B.DODO_CANT AS CANT, B.DODO_PUNIT AS MONTO, B.DODO_COG AS COG '+
  ' FROM FINANZAS.AFDODOCXP B WHERE B.DODO_POLID ='+#39+qop.fields[0].asstring+#39;
  qdetop.open;
end;

procedure TFOrden.Sumar1Click(Sender: TObject);
VAR
SUMA:REAL;
begin
  inherited;
  qop.first;
  SUMA:=0;
  while not(qOP.eof) do
    begin
       suma:=suma+qOP.fieldbyname('MONTO').asfloat;
       qOP.next;
    end;
  SHOWMESSAGE('La suma es '+formatfloat('#,#0.00',suma));
end;

procedure TFOrden.Button1Click(Sender: TObject);
begin
  inherited;
  qop.First;
  while not(qop.eof) do
     begin
         Q.Close;
         q.sql.text:='UPDATE  FINANZAS.AFDOCXPAG  SET '+
         ' DOCX_FECHA='+#39+FECHA.TEXT+#39+
         ' WHERE DOCX_POLID='+#39+QOP.FIELDBYNAME('POLIZA').asstring+#39;

         Q.execsql;
         qop.next;
     end;
  Qop.close;
  qop.open;
end;

end.
