unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDETALLE, Db, DBTables, Menus, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, Mask, DBCtrls, Buttons,OleServer, Excel97, Comobj, libreria;

type
  TFDetalle = class(TPFDetalle)
    PAGE: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    EFECHADEV: TLabel;
    Label5: TLabel;
    PERSONA: TDBEdit;
    FECHADEV: TDBEdit;
    NOMINA: TDBEdit;
    QPer: TQuery;
    DsPer: TDataSource;
    DsDed: TDataSource;
    QDed: TQuery;
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
    DsCog: TDataSource;
    QCog: TQuery;
    DSDeudor: TDataSource;
    qdeudor: TQuery;
    SpeedButton2: TSpeedButton;
    Label11: TLabel;
    TabSheet2: TTabSheet;
    Qordenes: TDBGrid;
    OP: TRadioGroup;
    Label2: TLabel;
    TotOrd: TLabel;
    grupo: TDBGrid;
    PPOL: TPanel;
    np: TLabel;
    Label4: TLabel;
    DBGrid3: TDBGrid;
    Label3: TLabel;
    PRIMERO: TCheckBox;
    Tipo: TRadioGroup;
    Monto: TLabel;
    CANCE: TPopupMenu;
    DejarenCeroOrdendePago1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure dgDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure QordenesDblClick(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBDEUDORESDblClick(Sender: TObject);
    function RNombre : String ; override;
    procedure NOMINAChange(Sender: TObject);
    procedure OPClick(Sender: TObject);
    procedure TipoClick(Sender: TObject);
    procedure DejarenCeroOrdendePago1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDetalle: TFDetalle;
  TipoDet:string;
implementation

{$R *.DFM}


function TFDetalle.RNombre : String ;
begin
 VSql.Clear ;
 result := ActiveControl.Name ;

 IF RESULT='NOMINA' THEN
     begin
       Vsql.Add('Select');
       Vsql.Add('NOMI_NOMINA As Nomina,');
       Vsql.Add('NOMI_DESCRIP As Descripcion,');
       Vsql.Add('NOMI_TIPO As Tipo');
       Vsql.Add('FROM PNOMINAS');
       Vsql.Add('WHERE NOMI_FECHA>='+#39+'01/01/2013'+#39);
       Vsql.Add('UNION');
       Vsql.Add('Select');
       Vsql.Add('NOMI_NOMINA As Nomina,');
       Vsql.Add('NOMI_DESCRIP As Descripcion,');
       Vsql.Add('NOMI_TIPO As Tipo');
       Vsql.Add('FROM PNNOMINAS');
       Vsql.Add('WHERE NOMI_FECHA>='+#39+'01/01/2013'+#39);
       savetofileLOG(vsql.text);
     end;
end;

procedure TFDetalle.FormCreate(Sender: TObject);
begin
  inherited;
 Height := 504 ;
 Width := 1067 ;

 IF MODO=1 THEN
    begin
       speedbutton1.Enabled:=false;
       speedbutton2.Enabled:=false;
       PPOL.Visible:=TRUE;
       QPOL.Close;
       qpol.sql.text:='SELECT * FROM FPOLIZAS A WHERE A.POLI_DESCRIP LIKE '+
       #39+'%FALTAS%('+#39+'||'+#39+nomina.text+#39+'||'+#39+')%'+#39;
       qpol.OPEN;
    end;
end;

procedure TFDetalle.SpeedButton1Click(Sender: TObject);
var
pagado:string;
vcadpag:STRING;
begin
  inherited;
if (nomina.Text<>'') and (persona.Text<>'') and (fechadev.Text<>'') then
   begin
       q.close;
       q.sql.text:='DELETE FROM PPOLIZASCAN S WHERE POLI_PAGO='+NOMINA.TEXT;
       savetofileLOG(Q.SQL.text);
       Q.execsql;

       Qper.CLOSE;
       qper.sql.text:='SELECT * FROM AFDODOCXP S WHERE S.DODO_SCTA='+#39+persona.text+#39+' AND '+
       'S.DODO_POLID IN (SELECT POLN_POLID FROM PPOLNOMI Z WHERE Z.POLN_NOMINA='+nomina.text+
       'UNION SELECT POLN_POLID FROM PNPOLNOMI Z WHERE Z.POLN_NOMINA='+nomina.text+')'+
       'AND S.DODO_DESCRIP LIKE '+#39+'%'+#39+'||'+#39+TIPODET+#39+'||'+#39+'%'+#39;
       savetofileLOG(QPER.SQL.text);
       qper.open;

       q.CLOSE;
       q.sql.text:='SELECT sum(dodo_punit) FROM AFDODOCXP S WHERE S.DODO_SCTA='+#39+persona.text+#39+' AND '+
       'S.DODO_POLID IN (SELECT POLN_POLID FROM PPOLNOMI Z WHERE Z.POLN_NOMINA='+nomina.text+
       'UNION SELECT POLN_POLID FROM PNPOLNOMI Z WHERE Z.POLN_NOMINA='+nomina.text+')'+
       'AND S.DODO_DESCRIP LIKE '+#39+'%'+#39+'||'+#39+TIPODET+#39+'||'+#39+'%'+#39;
       savetofileLOG(Q.SQL.text);
       SHOWMESSAGE('PASE');
       q.open;
       SHOWMESSAGE('PASE2');

       totord.Caption:=formatfloat('#,#0.00',q.fields[0].asfloat);
        if primero.Checked then pagado:='S' else pagado:='N';

        if tipo.itemindex=0 then vcadpag:=NOMINA.TEXT else vcadpag:='AUSENCIAS';
         SHOWMESSAGE('PASE');
        q.close;
        q.SQL.text:='CALL regresadev('+#39+NOMINA.TEXT+#39+','+#39+PERSONA.TEXT+#39+
        ','+#39+'N'+#39+','+#39+FECHADEV.TEXT+#39+','+
        #39+PAGADO+#39+','+
        #39+vcadpag+#39+')';
        savetofileLOG(Q.SQL.text);
        Q.execsql;

        qpol.close;
        qpol.sql.text:='SELECT * FROM PPOLIZASCAN WHERE POLI_PAGO='+#39+NOMINA.text+#39;
        savetofileLOG(QPOL.SQL.text);
        QPOL.open;
        qdetpol.Close;

        qdetpol.sql.text:='SELECT DETM_RNGID AS NUMREN, DETM_REFID AS ID, DETM_PROY AS PROY, DETM_SFDO AS SUBFONDO,'+
        ' DETM_URES AS URES, DETM_CNTA AS CUENTA, DETM_SCTA AS SCTA, DETM_PROG,  '+
        ' DETM_TMOV AS TIPO, DETM_MONTO AS MONTO, DETM_DESCRIP AS DESCRIPCION  '+
        ' FROM PDETMOVICAN WHERE DETM_POLID='+#39+Qpol.fieldbyname('POLI_POLID').asstring+#39+
        ' ORDER BY DETM_refid ASC, DETM_TMOV ASC';
        savetofileLOG(QDETPOL.SQL.text);
        qdetpol.open;

        qded.close;
        qded.sql.text:='SELECT DETM_CNTA AS CUENTA, sum(DETM_MONTO) AS MONTO'+
        ' FROM PDETMOVICAN WHERE DETM_POLID='+#39+Qpol.fieldbyname('POLI_POLID').asstring+#39+
        ' group by  DETM_CNTA'+
        ' ORDER BY DETM_cnta';
        savetofileLOG(QDed.SQL.text);
        qded.open;

        qerror.close;
        qerror.sql.text:='SELECT ERRO_DESCRIP AS MENSAJE, ERRO_TIPO AS TIPO FROM PERRORESCAN '+
        'WHERE ERRO_PAGO='+#39+NOMINA.text+#39+' ORDER BY ERRO_DESCRIP';
        Qerror.open;

   end
  else
    showmessage('No se han capturado todos los datos necesarios');
end;

procedure TFDetalle.DBGrid1CellClick(Column: TColumn);
var tabla:string;
begin
  inherited;
  if modo=1 then tabla:='FDETMOVI' else tabla:='PDETMOVICAN';
   qdetpol.sql.text:='SELECT DETM_RNGID AS NUMREN, DETM_REFID AS ID, DETM_PROY AS PROY, DETM_SFDO AS SUBFONDO,'+
        ' DETM_URES AS URES, DETM_CNTA AS CUENTA, DETM_SCTA AS SCTA, DETM_PROG,  '+
        ' DETM_TMOV AS TIPO, DETM_MONTO AS MONTO, DETM_DESCRIP AS DESCRIPCION  '+
        ' FROM '+TABLA+' WHERE DETM_POLID='+#39+Qpol.fieldbyname('POLI_POLID').asstring+#39+
        ' ORDER BY DETM_refid ASC, DETM_TMOV ASC';
        qdetpol.open;

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



procedure TFDetalle.QordenesDblClick(Sender: TObject);
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

procedure TFDetalle.SpeedButton2Click(Sender: TObject);
var pagado:string;
vcadpag: string;
begin
  inherited;
if tipo.itemindex=0 then vcadpag:=NOMINA.TEXT else vcadpag:='AUSENCIAS';
if Application.MessageBox('Seguro que desea Regresar al Comprometido','Confirmar',
         MB_ICONQUESTION+ MB_YESNO)= IDYES then
         begin
             if (primero.Checked) then pagado:='S' else pagado:='N';
             q.Close;
             q.sql.text:='INSERT INTO PDEVFALTAS '+
             '(DEVC_NUMERO,DEVC_NOMINA, DEVC_FECHADEV, DEVC_PERSONA,DEVC_TIPO, DEVC_PAGADO, DEVC_CADPAG) VALUES ('+
             'PSQDEVFALTAS.nextval,'+
             #39+nomina.TEXT+#39+','+
             #39+fechadev.TEXT+#39+','+
             #39+PERSONA.TEXT+#39+','+
             #39+'N'+#39+','+
             #39+pagado+#39+','+
             #39+VCADPAG+#39+')';
             Q.execsql;

             Showmessage('Se ha efectuado la devolución al Comprometido');
             close;
         end;

end;

procedure TFDetalle.DBDEUDORESDblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(Qdeudor);

end;

procedure TFDetalle.NOMINAChange(Sender: TObject);
begin
  inherited;
TRY  FECHADEV.field.asstring:=DATETOSTR(DATE);
     PERSONA.field.asstring:='P9275';
qcog.Close;
Qcog.sql.Text:='SELECT * FROM AFDOCXPAG S WHERE S.DOCX_PERSONA='+#39+'P1938'+
#39+' AND S.DOCX_POLID IN (SELECT POLN_POLID FROM PPOLNOMI Z WHERE '+
'Z.POLN_NOMINA='+#39+NOMINA.TEXT+#39+
'UNION SELECT POLN_POLID FROM PNPOLNOMI Z WHERE '+
'Z.POLN_NOMINA='+#39+NOMINA.TEXT+#39+')';
Qcog.open;
IF QCOG.FieldByName('DOCX_PAGADO').asfloat>0 then
   primero.Checked:=true;
TipoClick(NIL);
EXCEPT END;
end;

procedure TFDetalle.OPClick(Sender: TObject);
begin
  inherited;
  TRY
  IF  OP.ItemIndex=0 then
     PERSONA.field.asstring:='P9275'
  else
     PERSONA.field.asstring:='P13754';
 EXCEPT END;
 TipoClick(nil);
end;

procedure TFDetalle.TipoClick(Sender: TObject);
begin
  inherited;
  if tipo.ItemIndex=0 then
        tipodet:=NOMINA.TEXT
  else
        tipodet:='AUSENCIAS';

       Q.CLOSE;
       q.sql.text:='SELECT sum(s.dodo_punit) FROM AFDODOCXP S WHERE S.DODO_SCTA='+#39+persona.text+#39+' AND '+
       'S.DODO_POLID IN (SELECT POLN_POLID FROM PPOLNOMI Z WHERE Z.POLN_NOMINA='+nomina.text+
       'UNION SELECT POLN_POLID FROM PNPOLNOMI Z WHERE Z.POLN_NOMINA='+nomina.text+')'+
       'AND S.DODO_DESCRIP LIKE '+#39+'%'+#39+'||'+#39+TIPODET+#39+'||'+#39+'%'+#39;
       savetofileLOG(Q.SQL.text);
       q.open;
       monto.Caption:=formatfloat('#,#0.0000',q.FIELDS[0].asfloat);
end;

procedure TFDetalle.DejarenCeroOrdendePago1Click(Sender: TObject);
begin
  inherited;
if Application.MessageBox('Seguro que desea volver Cero las Ordenes de Pago','Confirmar',
         MB_ICONQUESTION+ MB_YESNO)= IDYES then
         begin

          q.close;
          q.sql.text:='UPDATE AFDODOCXP S SET S.DODO_PUNIT=0 WHERE S.DODO_POLID='+
          #39+Qcog.fieldbyname('docx_polid').asstring+#39;
          savetofilelog(q.sql.text);
          Q.EXECSQL;

          q.close;
          q.sql.text:='UPDATE AFDOCXPAG S SET S.DOCX_TOTAL=0 WHERE S.DOCX_POLID='+
          #39+Qcog.fieldbyname('docx_polid').asstring+#39;
          savetofilelog(q.sql.text);
          Q.Execsql;

          QCOG.CLOSE;
          Qcog.open;
   end;

end;

end.
