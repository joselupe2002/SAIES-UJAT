unit Detalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PDetalle, Menus, Db, DBTables, ComCtrls, ToolWin, ExtCtrls, Grids,
  DBGrids, StdCtrls, DBCtrls, Mask, DBCGrids, Buttons, Libreria, Main, ekrtf,
  ekbasereport, shellapi, OleServer, Excel97, Comobj, ImgList, mATH;

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
    DsPerDed: TDataSource;
    QPerded: TQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton2: TSpeedButton;
    nomfec: TComboBox;
    anio: TEdit;
    laNomina: TComboBox;
    NOMINA: TEdit;
    DESCRIP: TEdit;
    DBGrid1: TDBGrid;
    Dispo: TSpeedButton;
    DBGrid2: TDBGrid;
    DSDisp: TDataSource;
    QDisp: TQuery;
    Label6: TLabel;
    sd: TLabel;
    Shape1: TShape;
    QPerdedTIPO: TStringField;
    QPerdedMONTO: TCurrencyField;
    TabSheet3: TTabSheet;
    contab: TSpeedButton;
    Label7: TLabel;
    dev: TDateTimePicker;
    Label8: TLabel;
    eje: TDateTimePicker;
    TabSheet4: TTabSheet;
    Gpol: TDBGrid;
    Label9: TLabel;
    DsPol: TDataSource;
    DataSource2: TDataSource;
    Qpol: TQuery;
    Label10: TLabel;
    GDetPol: TDBGrid;
    DsDetPol: TDataSource;
    QDetPol: TQuery;
    NRPol: TLabel;
    nrDetPol: TLabel;
    TabSheet5: TTabSheet;
    GCPol: TDBGrid;
    Label11: TLabel;
    NRCP: TLabel;
    DsQCPol: TDataSource;
    QCPol: TQuery;
    Label12: TLabel;
    DBGrid3: TDBGrid;
    DsCuadre: TDataSource;
    QCuadre: TQuery;
    QCuadreDEDUCCIONES: TCurrencyField;
    QCuadrePERCEP: TCurrencyField;
    QCuadreCHEQUE: TCurrencyField;
    QCuadreDJ_TRANSFER: TCurrencyField;
    QCuadreDJ_TOTAL: TCurrencyField;
    QCuadreP_TOTAL: TCurrencyField;
    QCuadreOP_DJ: TCurrencyField;
    QCuadreOP_P: TCurrencyField;
    QCuadreOP_EMPL: TCurrencyField;
    TabSheet6: TTabSheet;
    DSOP: TDataSource;
    QOP: TQuery;
    gOP: TDBGrid;
    DsDetOp: TDataSource;
    QDetOP: TQuery;
    DBGrid4: TDBGrid;
    eop: TLabel;
    SpeedButton1: TSpeedButton;
    DET: TLabel;
    SpeedButton3: TSpeedButton;
    TabSheet7: TTabSheet;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    TickEmpl: TEkRTF;
    TickDJ: TEkRTF;
    TickEmp: TEkRTF;
    TIP: TComboBox;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    TICKFaltas: TEkRTF;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    ini: TDateTimePicker;
    ter: TDateTimePicker;
    Label13: TLabel;
    Label14: TLabel;
    Shape2: TShape;
    TOT: TLabel;
    Contab2: TSpeedButton;
    barra: TProgressBar;
    et: TLabel;
    ver: TCheckBox;
    Label15: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cancelar1Click(Sender: TObject);
    function RNombre : String ; override;
    procedure laNominaChange(Sender: TObject);
    procedure buscaLanomina;
    procedure nomfecChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DispoClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure contabClick(Sender: TObject);
    procedure TabSheet4Enter(Sender: TObject);
    procedure GpolDblClick(Sender: TObject);
    procedure GpolCellClick(Column: TColumn);
    procedure GDetPolDblClick(Sender: TObject);
    procedure TabSheet5Enter(Sender: TObject);
    procedure GCPolDblClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid4DblClick(Sender: TObject);
    procedure gOPDblClick(Sender: TObject);
    procedure TabSheet6Enter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure gOPCellClick(Column: TColumn);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ImprimeRepEmpl(Rep:String;TITULO:String);
    procedure ImprimeRepDJ(Rep:String;TITULO:String);
    procedure ImprimeRepP(Rep:String;TITULO:String);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure TickEmplScanRecord(ScanInfo: TEkScanInfo);
    procedure TickDJScanRecord(ScanInfo: TEkScanInfo);
    procedure TickEmpScanRecord(ScanInfo: TEkScanInfo);
    procedure ImprimeFaltas(Rep:String;Tipo:String);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure NOMINAChange(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure ImprimeRepPFiltro(laP:String;Rep:String;TITULO:String;inicia:string;termina:string);
    procedure SpeedButton10Click(Sender: TObject);
    procedure CalculaMontosNom;
    procedure Contab2Click(Sender: TObject);
    procedure ExportarXLSBi(Q:TQuery;s:Tquery;t:Tquery);
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
  TPNomina:string;
  cont:integer;
  min:integer;
  seg:integer;
  TPPOLNOMI:String;

implementation


//uses Repo;

{$R *.DFM}


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



procedure TFDetalle.ExportarXLSBi(Q:TQuery;s:Tquery;t:Tquery);
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
ExcelWorkbook1:= TExcelWorkbook.create(nil);
ExcelWorksheet1:=TExcelWorksheet.create(nil);

showmessage('Se exportara Detalles Contables, Ordenes de Pagos y resumen de Cog Haga Clic para continuar....');
et.visible:=true;
et.caption:='Generando Reportes';
et.Update;
barra.visible:=true;

ExcelApplication1.Workbooks.Open(extractfiledir(paramstr(0))+'\File.xls',
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,id);


  ExcelWorkbook1.ConnectTo(ExcelApplication1.ActiveWorkbook);
  ExcelWorkbook1.Sheets.Add(NULL,NULL,2,xlWorksheet,0);

  ExcelWorksheet1.ConnectTo(ExcelApplication1.ActiveSheet as _Worksheet);
  excelworksheet1.ConnectTo(excelworkbook1.Sheets.Item[1] as _Worksheet);
  excelworksheet1.Activate;





  barra.Position:=0;

  et.caption:='Exportando poliza contable';
  et.Update;
  ExcelWorksheet1.Cells.Item[1,1].Font.Bold:=true;
  excelworksheet1.Name:='Polizas';
  for x:=0 to q.FieldCount-1 do
     begin
        ExcelWorksheet1.Cells.Item[1,x+1].Font.Bold:=true;
        ExcelWorksheet1.Cells.Item[1,x+1].borders.linestyle:=xlcontinuous;
        ExcelWorksheet1.Cells.Item[1,x+1].value:=q.Fields[x].FullName;
        ExcelWorksheet1.Cells.Item[1,x+1].Interior.ColorIndex :=41;
     end;

  y:=0;
  q.first;
  while not(q.eof) do
     begin
       y:=y+1;
        ExcelWorksheet1.Cells.Item[Y+1,4].Font.Bold:=true;
        ExcelWorksheet1.Cells.Item[Y+1,4].numberformat:='$#,##0.00';
        for x:=0 to q.Fields.Count-1  do
            begin
               ExcelWorksheet1.Cells.Item[y+1,x+1].value:=q.fields[x].asstring;
               ExcelWorksheet1.Cells.Item[y+1,x+1].borders.linestyle:=xlcontinuous;

            end;
        q.next;
        barra.Position:=barra.Position+1;
     end;


  et.caption:='Exportando Ordenes de Pago';
  et.Update;

  excelworksheet1.ConnectTo(excelworkbook1.Sheets.Item[2] as _Worksheet);
  excelworksheet1.Activate;
  ExcelWorksheet1.Cells.Item[1,1].Font.Bold:=true;
  excelworksheet1.Name:='Ordenes de Pago';
  for x:=0 to s.FieldCount-1 do
     begin
        ExcelWorksheet1.Cells.Item[1,x+1].Font.Bold:=true;
        ExcelWorksheet1.Cells.Item[1,x+1].value:=s.Fields[x].FullName;
        ExcelWorksheet1.Cells.Item[1,x+1].Interior.ColorIndex :=41;
        ExcelWorksheet1.Cells.Item[1,x+1].borders.linestyle:=xlcontinuous;
     end;

  y:=0;
  s.first;
  while not(s.eof) do
     begin
       y:=y+1;
        ExcelWorksheet1.Cells.Item[Y+1,3].Font.Bold:=true;
        ExcelWorksheet1.Cells.Item[Y+1,3].numberformat:='$#,##0.00';
        for x:=0 to s.Fields.Count-1  do
            begin
               ExcelWorksheet1.Cells.Item[y+1,x+1].borders.linestyle:=xlcontinuous;
               ExcelWorksheet1.Cells.Item[y+1,x+1].value:=s.fields[x].asstring;
            end;
        s.next;
         barra.Position:=barra.Position+1;
     end;



  et.caption:='Exportando datos de cuadre';
  et.Update;
  excelworksheet1.ConnectTo(excelworkbook1.Sheets.Item[3] as _Worksheet);
  excelworksheet1.Activate;
  ExcelWorksheet1.Cells.Item[1,1].Font.Bold:=true;
  excelworksheet1.Name:='Resumen';

  for x:=0 to t.FieldCount-1 do
     begin
        ExcelWorksheet1.Cells.Item[1,x+1].Font.Bold:=true;
        ExcelWorksheet1.Cells.Item[1,x+1].value:=t.Fields[x].FullName;
        ExcelWorksheet1.Cells.Item[1,x+1].Interior.ColorIndex :=41;
        ExcelWorksheet1.Cells.Item[1,x+1].borders.linestyle:=xlcontinuous;
     end;

  y:=0;
  t.first;
  while not(t.eof) do
     begin
       y:=y+1;
       ExcelWorksheet1.Cells.Item[Y+1,4].Font.Bold:=true;
        ExcelWorksheet1.Cells.Item[Y+1,4].numberformat:='$#,##0.00';
        for x:=0 to t.Fields.Count-1  do
            begin
               ExcelWorksheet1.Cells.Item[y+1,x+1].value:=t.fields[x].asstring;
               ExcelWorksheet1.Cells.Item[y+1,x+1].borders.linestyle:=xlcontinuous;
            end;
         barra.Position:=barra.Position+1;
        t.next;
     end;
ExcelApplication1.Visible[id]:=true;
et.Visible:=false;
barra.Position:=0;
barra.Visible:=false;    

ExcelWorksheet1.Disconnect;
ExcelWorkbook1.Disconnect;
ExcelApplication1.Disconnect;
end;

procedure TFDetalle.FormCreate(Sender: TObject);
begin
 FMain := TFMain(Owner) ;
 ToolBar1.Images := FMain.Iconos ;
 Menu.Images := FMain.Iconos ;
 Height := 555;
 Width :=  748 ;

 
 LimpiafileLog('');
 anio.Text:=formatdatetime('YYYY',now);
 NOMFEC.TEXT:=formatdatetime('01/MM',now);
 dev.DateTime:=now;
 eje.DateTime:=now;
 TPNomina:='PNOMINAS';
 TPPOLNOMI:='PPOLNOMI';

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





procedure TFDetalle.buscaLanomina;
var
cadSQL:String;
begin
  fechagen:=NomFec.text+'/'+anio.text;
  if str_(laNomina.text,'-')='O' then begin TPNomina:='PNOMINAS'; TPPOLNOMI:='PPOLNOMI'; end;
  if str_(laNomina.text,'-')='C' then begin TPNomina:='PNOMINAS'; TPPOLNOMI:='PPOLNOMI';  end;
  if str_(laNomina.text,'-')='H' then begin TPNomina:='PHNOMINAS'; TPPOLNOMI:='PHPOLNOMI'; end;
  if str_(laNomina.text,'-')='N' then begin TPNomina:='PNNOMINAS'; TPPOLNOMI:='PNPOLNOMI'; end;
  if str_(laNomina.text,'-')='V' then begin TPNomina:='PINOMINAS'; TPPOLNOMI:='PIPOLNOMI'; end;

  cadSQL:='SELECT * FROM '+TPNomina+' where NOMI_FECINI='+#39+fechagen+#39+
          ' and NOMI_TIPO='+#39+TIP.TEXT+#39;

  if str_(laNomina.text,'-')='C' then
         cadSQL:='SELECT * FROM '+TPNomina+' where NOMI_FECINI='+#39+fechagen+#39+
                 ' and NOMI_TIPO='+#39+'C'+#39;
  Savetofilelog(cadSQL);


  Q.Close;
  q.sql.text:=CADSQL;
  Q.open;

  NOMINA.Text:=q.fieldbyname('NOMI_NOMINA').asstring;
  descrip.Text:=q.fieldbyname('NOMI_DESCRIP').asstring;
  contab.Caption:='Preview Nomina: '+nomina.text+' '+descrip.text;
  contab2.Caption:='Contabilizar Nomina: '+nomina.text+' '+descrip.text;
  dispo.Caption:='Correr Disponibilidad para Nomina: '+nomina.text+' '+descrip.text;

  ini.date:=strtodate(fechagen);
  ter.Date:= ini.date+50;





end;


procedure TFDetalle.laNominaChange(Sender: TObject);
begin
  inherited;
  BuscaLaNomina;

end;

procedure TFDetalle.nomfecChange(Sender: TObject);
begin
  inherited;
BuscaLaNomina;
end;


procedure TFDetalle.CalculaMontosNom;
var
per,ded:real;
begin
  ded:=qperded.fields[1].asfloat;
  qperded.next;
  per:= qperded.fields[1].asfloat;
  TOT.Caption:='Neto: '+formatfloat('#,0.00',PER-ded);


end;


procedure TFDetalle.SpeedButton2Click(Sender: TObject);

begin
  inherited;
  cont:=0;  min:=0; seg:=0;
  Q.CLOSE;
  Q.SQL.TEXT:='call pcontgrabacursor('+NOMINA.TEXT+','+#39+STR_(LANOMINA.TEXT,'-')+#39+')';
  Q.execsql;
  Showmessage('Se han copiado los detalles de nomina a tabla de contabilizaci�n');

  QpERDED.close;
  QpERDED.sql.text:='select DECODE(T.CONT_TIPO,'+#39+'P'+#39+','+#39+'PERCEPCI�N'+#39+','+#39+'DEDUCCI�N'+#39+') '+
              ' AS TIPO, SUM(T.CONT_MONTO) AS MONTO from PCONTPERCEP t '+
              ' WHERE T.CONT_NOMINA='+NOMINA.TEXT+
              ' GROUP BY T.CONT_TIPO';
  QpERDED.open;
  CalculaMontosNom;


end;

procedure TFDetalle.DispoClick(Sender: TObject);
begin
  inherited;

  if nomina.text<>'' then
     begin
       qdisp.close;
       qdisp.sql.text:='SELECT SFDO, URES, PROG, CNTA, SCTA, TMOVI,PROY, NECESITA, '+
       'CHECAR, TIENE, TIENE-NECESITA AS FALTA FROM ('+
       'SELECT  A.CONT_SFDO AS SFDO,A.CONT_URES AS URES,A.CONT_PROG AS PROG,'+
               'A.CONT_CNTA AS CNTA,A.CONT_SCTA AS SCTA,A.CONT_TMOVI AS TMOVI,'+
               'A.CONT_PROY AS PROY,sum(A.CONT_MONTO) AS NECESITA,'+
               'fchecaproy(A.CONT_PROY,A.CONT_Scta,'+chr(39)+copy(nomfec.text,4,2)+chr(39)+
                            ','+chr(39)+anio.text+chr(39)+','+chr(39)+'824'+chr(39)+',SUM(A.CONT_MONTO)) AS CHECAR,'+
               '(select d.dapr_monto from finanzas.fdapresproy d where d.dapr_anio='+chr(39)+anio.text+chr(39)+
               ' and d.dapr_mes='+chr(39)+copy(nomfec.text,4,2)+chr(39)+
               ' and d.dapr_sfdo=a.cont_sfdo and d.dapr_prog=a.cont_prog and d.dapr_ures=a.cont_ures '+
               ' and d.dapr_proy=a.cont_proy and d.dapr_scta=a.cont_scta and d.dapr_momento='+chr(39)+'824'+chr(39)+') as TIENE '+
               ' FROM PCONTPERCEP A WHERE A.CONT_NOMINA='+nomina.text+
               ' and a.cont_tipo='+chr(39)+'P'+chr(39)+
               ' and a.cont_tiponom='+chr(39)+str_(lanomina.text,'-')+chr(39)+
        'GROUP BY  A.CONT_SFDO, A.CONT_URES, A.CONT_PROG, A.CONT_CNTA, A.CONT_SCTA, A.CONT_TMOVI, A.CONT_PROY)';
        if not(ver.Checked) then
            qdisp.sql.text:= qdisp.sql.text+' WHERE CHECAR=0';

        Savetofilelog(qdisp.sql.text);
        Qdisp.open;
        sd.caption:=inttostr(qdisp.recordcount);
     end
  else
    Showmessage('Elija una n�mina correcta');

end;

procedure TFDetalle.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(QDisp);
end;

procedure TFDetalle.contabClick(Sender: TObject);
var
VPNOMINA:string;
begin
  inherited;
  VPNOMINA:='PNOMINAS';
  IF STR_(lanomina.text,'-')='N' Then VPNOMINA:='PNNOMINAS';
  IF STR_(lanomina.text,'-')='H' Then VPNOMINA:='PHNOMINAS';
  IF STR_(lanomina.text,'-')='V' Then VPNOMINA:='PINOMINAS';

   if Application.MessageBox('�Seguro que desea calcular el Preview de Contabilizaci�n de la n�mina?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
         q.close;
         q.sql.text:='SELECT COUNT(*) FROM PCONTCONFIG WHERE CONT_NOMINA='+NOMINA.TEXT;
         Q.open;
         if q.fields[0].asinteger<=0 then
            begin
               q.close;
               q.sql.text:='INSERT INTO pcontconfig (CONT_NOMINA,CONT_FECHADEV,CONT_FECHAEJE) VALUES ('+
               #39+NOMINA.TEXT+#39+','+
               #39+DATETOSTR(DEV.DATE)+#39+','+
               #39+DATETOSTR(EJE.DATE)+#39+')';
               Q.execsql;
            end
         else
            begin
               q.close;
               q.sql.text:='UPDATE pcontconfig SET CONT_FECHADEV='#39+DATETOSTR(DEV.DATE)+#39+','+
               'CONT_FECHAEJE='#39+DATETOSTR(EJE.DATE)+#39+
               ' WHERE CONT_NOMINA='+#39+NOMINA.TEXT+#39;
               Q.execsql;
            end;



           //Se contabiliza el previes
           q.close;
           q.sql.text:='CALL PcontDevAll('+NOMINA.TEXT+','+#39+STR_(LANOMINA.TEXT,'-')+#39+','+#39+'P'+#39+')';
           Q.execsql;

           q.close;
           q.sql.text:='CALL pcontejeAll('+NOMINA.TEXT+','+#39+STR_(LANOMINA.TEXT,'-')+#39+','+#39+'P'+#39+')';
           Q.execsql;   


           q.close;
           q.sql.text:='select count(*) from (SELECT x.detm_tmov FROM PCONTFDETMOVI X, PCONTFPOLIZAS Y  WHERE X.DETM_POLID  in ( '+
           'select a.poln_polid from PcontPOLNOMI a where a.poln_nomina='+NOMINA.TEXT+')'+
           'AND X.DETM_POLID=Y.POLI_POLID'+
           ' group by  X.DETM_TMOV, X.DETM_CNTA , X.DETM_SCTA order by X.DETM_CNTA)';
           savetofileLog(q.sql.text);
           q.Open;

           s.close;
           s.sql.text:='SELECT count(*) FROM PCONTAFDOCXPAG S WHERE S.DOCX_POLID IN '+
           '(select a.poln_polid from PCONTPOLNOMI a where a.poln_nomina='+NOMINA.TEXT+')'+
           'order by  s.docx_DESCRIP';
           savetofileLog(s.sql.text);
           s.open;

           qop.close;
           qop.SQL.text:='select count(*) from pcontfdetmovi r, pcontfpolizas n where r.detm_polid=n.poli_polid'+
           ' and r.detm_polid in (select a.poln_polid from PcontPOLNOMI a where a.poln_nomina='+NOMINA.TEXT+')'+
           ' and r.detm_cnta like '+#39+'5%'+#39+' GROUP BY POLI_TEXTO, DETM_CNTA,DETM_SCTA order by POLI_TEXTO, '+
           ' DETM_CNTA,DETM_SCTA';
           savetofileLog(qop.sql.text);
           Qop.open;

           et.visible:=true;
           et.caption:='Generando Reportes';
           et.Update;
           barra.visible:=true;
           barra.Max:=q.fields[0].asinteger+s.fields[0].asinteger+qop.fields[0].asinteger;


           q.close;
           q.sql.text:='SELECT  X.DETM_TMOV AS TMOV, X.DETM_CNTA AS CNTA, X.DETM_SCTA '+
           'AS SCTA,  sum(X.DETM_MONTO) AS MONTO FROM PCONTFDETMOVI X, PCONTFPOLIZAS Y  WHERE X.DETM_POLID  in ( '+
           'select a.poln_polid from PcontPOLNOMI a where a.poln_nomina='+NOMINA.TEXT+')'+
           'AND X.DETM_POLID=Y.POLI_POLID'+
           ' group by  X.DETM_TMOV, X.DETM_CNTA , X.DETM_SCTA order by X.DETM_CNTA';
           savetofileLog(q.sql.text);
           q.Open;

           s.close;
           s.sql.text:='SELECT S.DOCX_POLID, S.DOCX_PERSONA, S.DOCX_TOTAL,S.DOCX_PAGADO, DOCX_APROBADO, '+
           's.docx_descrip, s.docx_texto FROM PCONTAFDOCXPAG S WHERE S.DOCX_POLID IN '+
           '(select a.poln_polid from PCONTPOLNOMI a where a.poln_nomina='+NOMINA.TEXT+')'+
           'order by  s.docx_DESCRIP';
           savetofileLog(s.sql.text);
           s.open;

           qop.close;
           qop.SQL.text:='select POLI_TEXTO AS DESCRIP, DETM_CNTA AS CUENTA,DETM_SCTA AS COG, '+
           'SUM(DETM_MONTO) AS MONTO from pcontfdetmovi r, pcontfpolizas n where r.detm_polid=n.poli_polid'+
           ' and r.detm_polid in (select a.poln_polid from PcontPOLNOMI a where a.poln_nomina='+NOMINA.TEXT+')'+
           ' and r.detm_cnta like '+#39+'5%'+#39+' GROUP BY POLI_TEXTO, DETM_CNTA,DETM_SCTA order by POLI_TEXTO, '+
           ' DETM_CNTA,DETM_SCTA';
           savetofileLog(qop.sql.text);
           Qop.open;


           ExportarXLSBi(Q,s,qop);

      end;

end;

procedure TFDetalle.TabSheet4Enter(Sender: TObject);
begin
  inherited;
  Qpol.Close;
  Qpol.SQl.text:='select N.POLI_POLID AS NUMERO, N.POLI_DESCRIP AS DESCRIP, N.POLI_ANIO AS EJERCICIO, N.POLI_MES AS MES, '+
  'SUBSTR(N.POLI_TEXTO,1,100) AS TEXTO from fpolizas n where N.POLI_POLID in ('+
  'select a.poln_polid from '+TPPolNomi+' a where a.poln_nomina='+nomina.text+')'+
  ' order by N.POLI_POLID ';
  savetofilelog(qpol.sql.text);
  Qpol.open;
  nrpol.Caption:=inttostr(qpol.recordcount);
  QdetPol.Close;
end;

procedure TFDetalle.GpolDblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(QPol);
end;

procedure TFDetalle.GpolCellClick(Column: TColumn);
begin
  inherited;
  QDetPol.Close;
  QDetPol.sql.text:='select a.detm_polid as POLIZA, a.detm_rngid as NUMERO, A.DETM_SFDO AS SFDO, A.DETM_PROY AS PROY, A.DETM_PROG AS PROG,'+
                    'A.DETM_URES AS URES, A.DETM_CNTA AS CNTA, A.DETM_SCTA AS SCTA,A.DETM_TMOV AS TMOV, '+
                    'A.DETM_MONTO AS MONTO, A.DETM_DESCRIP AS DESCRIP  '+
                    ' from fdetmovi a WHERE A.DETM_POLID='+Qpol.fields[0].asstring+
                    ' order by A.DETM_CNTA, A.DETM_TMOV ';
  QDetPol.open;
  nrdetpol.Caption:=inttostr(QDetPol.recordcount);

end;

procedure TFDetalle.GDetPolDblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(QDetPol);
end;

procedure TFDetalle.TabSheet5Enter(Sender: TObject);
begin
  inherited;
  qcpol.close;
  qcpol.sql.text:='select R.DETM_DESCRIP as DESCRIP,  r.detm_tmov AS TMOV, SUM(r.detm_monto) AS MONTO'+
  ' from fdetmovi r WHERE r.detm_polid in (select a.poln_polid from '+
  TPPOLNOMI+' a where a.poln_nomina='+nomina.text+')'+
  ' GROUP BY R.DETM_DESCRIP, r.detm_tmov order by R.DETM_DESCRIP ';
  qcpol.Open;
  nrcp.Caption:=inttostr(QcPol.recordcount);


 qCuadre.close;
 qCuadre.Sql.text:=' SELECT  '+
 ' (SELECT SUM(Z.CONT_MONTO) FROM PCONTPERCEP Z WHERE Z.CONT_NOMINA='+NOMINA.TEXT+' AND Z.CONT_TIPO='+#39+'P'+#39+') AS PERCEP,'+
 ' (SELECT SUM(Z.CONT_MONTO) FROM PCONTPERCEP Z WHERE Z.CONT_NOMINA='+NOMINA.TEXT+' AND Z.CONT_TIPO='+#39+'CHE'+#39+') AS CHEQUE,'+
 ' (SELECT SUM(Z.CONT_MONTO) FROM PCONTPERCEP Z WHERE Z.CONT_NOMINA='+NOMINA.TEXT+' AND Z.CONT_TIPO='+#39+'D'+#39+') AS DEDUCCIONES,'+
 ' (SELECT SUM(CONT_MONTO) FROM PCONTPERCEP A, pctabanco b WHERE A.CONT_NOMINA='+NOMINA.TEXT+
 ' and a.cont_tipo='+#39+'D'+#39+' AND A.CONT_SCTA LIKE '+#39+'DJ%'+#39+' and ctab_empl =A.CONT_SCTA) as DJ_TRANSFER,'+
 ' (SELECT SUM(Z.CONT_MONTO) FROM PCONTPERCEP Z WHERE Z.CONT_NOMINA='+NOMINA.TEXT+' AND Z.CONT_TIPO='+#39+'D'+#39+' AND Z.CONT_SCTA LIKE '+#39+'DJ%'+#39+' ) AS DJ_TOTAL, '+
 ' (SELECT SUM(Z.CONT_MONTO) FROM PCONTPERCEP Z WHERE Z.CONT_NOMINA='+NOMINA.TEXT+' AND Z.CONT_TIPO='+#39+'D'+#39+' AND Z.CONT_SCTA LIKE '+#39+'P%'+#39+' ) AS P_TOTAL,'+
 ' (SELECT SUM(s.docx_total) FROM AFDOCXPAG S WHERE S.DOCX_POLID IN '+
 ' (select a.poln_polid from '+TPPOLNOMI+' a where a.poln_nomina='+NOMINA.TEXT+')'+
 ' AND S.DOCX_PERSONA LIKE '+#39+'DJ%'+#39+') AS OP_DJ, '+
 ' (SELECT SUM(s.docx_total) FROM AFDOCXPAG S WHERE S.DOCX_POLID IN '+
 ' (select a.poln_polid from '+TPPOLNOMI+' a where a.poln_nomina='+NOMINA.TEXT+')'+
 ' AND S.DOCX_PERSONA LIKE '+#39+'P%'+#39+') AS OP_P, '+
 ' (SELECT SUM(s.docx_total) FROM AFDOCXPAG S WHERE S.DOCX_POLID IN  '+
 ' (select a.poln_polid from '+TPPOLNOMI+' a where a.poln_nomina='+NOMINA.TEXT+')'+
 ' AND (S.DOCX_PERSONA NOT LIKE '+#39+'DJ%'+#39+' AND S.DOCX_PERSONA NOT LIKE '+#39+'P%'+#39+')) AS OP_EMPL '+
 ' FROM DUAL ';
 SAVETOFILELOG(qcuadre.sql.text);
 qCuadre.OPEN;
end;

procedure TFDetalle.GCPolDblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(QcPol);
end;

procedure TFDetalle.DBGrid3DblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(QCuadre);
end;

procedure TFDetalle.DBGrid4DblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(QDetOp);
end;

procedure TFDetalle.gOPDblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(QOp);
end;

procedure TFDetalle.TabSheet6Enter(Sender: TObject);
var
suma:real;
begin
  inherited;
QOP.Close;
Qop.SQL.text:='SELECT s.docx_polid AS NUMERO, S.DOCX_PERSONA AS PERSONA, '+
' T.PERS_NOMBRE||'+#39+' '+#39+'||T.PERS_APEPAT||'+#39+' '+#39+'||T.PERS_NOMBRE AS NOMBRE,'+
' S.DOCX_FECHA AS FECHA, S.DOCX_TOTAL AS TOTAL, S.DOCX_PAGADO AS PAGADO'+
' FROM AFDOCXPAG S, FPERSONAS T  WHERE S.DOCX_POLID IN '+
' (select a.poln_polid from '+TPPOLNOMI+' a where a.poln_nomina='+Nomina.text+')'+
' AND S.DOCX_PERSONA=T.PERS_PERSONA ';
QOp.Open;
QOP.First;
suma:=0;
while not(qop.Eof) do
  begin
     suma:=suma+qop.fieldbyname('TOTAL').asfloat;
     qop.next;
  end;
eop.caption:='Monto Total: $ '+formatfloat('#,#0.0',suma);
qdetop.Close;

end;

procedure TFDetalle.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  QdetOp.close;
  QdetOp.sql.text:='SELECT W.DODO_POLID AS ORDEN, DODO_RNGID AS NUMERO, DODO_DESCRIP '+
  ' AS DESCRIP, DODO_PROY AS PROYECTO, DODO_SFDO AS SFDO,DODO_URES AS URES, DODO_PROG '+
  ' AS PROG, DODO_CNTA AS CNTA, DODO_SCTA AS SCTA, DODO_PUNIT AS MONTO, DODO_COG AS COG '+
  ' FROM AFDODOCXP W WHERE W.DODO_POLID IN (SELECT S.DOCX_POLID FROM AFDOCXPAG S '+
  ' WHERE S.DOCX_POLID IN (select a.poln_polid from '+TPPOLNOMI+'  a where a.poln_nomina='+nomina.text+'))';
  QDetOp.Open;
  det.Caption:='Listado de todos los Detalles de ORDENES DE PAGO';
  end;

procedure TFDetalle.gOPCellClick(Column: TColumn);
begin
  inherited;
  QDetOp.Close;
  qDetOp.sql.text:='SELECT W.DODO_POLID AS ORDEN, DODO_RNGID AS NUMERO, DODO_DESCRIP '+
  ' AS DESCRIP, DODO_PROY AS PROYECTO, DODO_SFDO AS SFDO,DODO_URES AS URES, DODO_PROG '+
  ' AS PROG, DODO_CNTA AS CNTA, DODO_SCTA AS SCTA, DODO_PUNIT AS MONTO, DODO_COG AS COG '+
  ' FROM AFDODOCXP W WHERE W.DODO_POLID='+qop.Fields[0].asstring;
  QdETOP.OPEN;
  DET.Caption:='Detalle de Orden '+qop.Fields[0].asstring+' '+qop.Fields[2].asstring;

end;

procedure TFDetalle.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  QDetPol.Close;
  QDetPol.sql.text:='select a.detm_polid as POLIZA, a.detm_rngid as NUMERO, A.DETM_SFDO AS SFDO, A.DETM_PROY AS PROY, A.DETM_PROG AS PROG,'+
                    'A.DETM_URES AS URES, A.DETM_CNTA AS CNTA, A.DETM_SCTA AS SCTA,A.DETM_TMOV AS TMOV, '+
                    'A.DETM_MONTO AS MONTO, A.DETM_DESCRIP AS DESCRIP  '+
                    ' from fdetmovi a WHERE A.DETM_POLID in ('+
                    'select b.poln_polid from '+TPPolNomi+' b where b.poln_nomina='+nomina.text+')'+
                    ' order by A.DETM_CNTA, A.DETM_TMOV ';
  QDetPol.open;
  nrdetpol.Caption:=inttostr(QDetPol.recordcount);
end;


procedure TFDetalle.ImprimeRepEmpl(Rep:String;TITULO:String);
var
vis:string;
venci:string;
tick2:TekRTF;
TPNOMBRAM: string;
begin
  if str_(laNomina.text,'-')='O' then begin TPNOMBRAM:='PNOMBRAM'; end;
  if str_(laNomina.text,'-')='C' then begin TPNOMBRAM:='PNOMBRAM'; end;
  if str_(laNomina.text,'-')='H' then begin TPNOMBRAM:='PHNOMBRAM'; end;
  if str_(laNomina.text,'-')='N' then begin TPNOMBRAM:='PNOMBRAM'; end;
  if str_(laNomina.text,'-')='V' then begin TPNOMBRAM:='PINOMBRAM'; end;

  try devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE',COPY(REP,1,POS('.',REP)-1),'rtf'); except end;

  TickEmpl.ClearVars;

  TickEmpl.CreateVar('FECHA',formatdatetime('dd/mm/yyyy',date));
  TickEmpl.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));
  TickEmpl.CreateVar('TITULO',titulo);
  TickEmpl.CreateVar('DESCNOM',DESCRIP.TEXT);



  Q.CLOSE;
  Q.sql.text:='SELECT distinct(C.POLN_SFDO) AS SFDO'+
  ' FROM AFVODOCXP A, FPERSONAS B, '+TPPOLNOMI+' C, FURES D'+
  ' WHERE A.VODO_Polid IN (SELECT POLN_POLID FROM '+TPPOLNOMI+' D WHERE D.POLN_NOMINA='+NOMINA.TEXT+')'+
  ' AND A.VODO_Persona=B.PERS_PERSONA   '+
  ' AND C.POLN_POLID=A.VODO_Polid'+
  ' and b.pers_persona in (select Z.NOMB_EMPL from '+TPNOMBRAM+' z)'+
  ' AND (SELECT MAX(B.DODO_URES) FROM AFDODOCXP B WHERE B.DODO_POLID=A.VODO_Polid)=D.URES_URES'+
  ' ORDER BY C.POLN_SFDO';
  savetofilelog(q.sql.text);
  Q.open;

  {T.CLOSE;
  T.sql.text:='SELECT distinct(C.POLN_RUBRO) AS SFDO'+
  ' FROM AFVODOCXP A, FPERSONAS B, '+TPPOLNOMI+' C, FURES D'+
  ' WHERE A.VODO_Polid IN (SELECT POLN_POLID FROM '+TPPOLNOMI+' D WHERE D.POLN_NOMINA='+NOMINA.TEXT+')'+
  ' AND A.VODO_Persona=B.PERS_PERSONA   '+
  ' AND C.POLN_POLID=A.VODO_Polid'+
  ' AND C.POLN_SFDO=:VSFDO'+
  ' and b.pers_persona in (select Z.NOMB_EMPL from '+TPNOMBRAM+' z)'+
  ' AND (SELECT MAX(B.DODO_URES) FROM AFDODOCXP B WHERE B.DODO_POLID=A.VODO_Polid)=D.URES_URES'+
  ' ORDER BY C.POLN_SFDO';
  savetofilelog(T.sql.text);
  T.parambyname('VSFDO').asstring:=q.fieldbyname('SFDO').asstring;
  T.open;   }

  S.CLOSE;
  S.sql.text:='SELECT A.VODO_Polid AS NUMERO, A.VODO_Fecha AS FECHA, A.VODO_Total AS MONTO, '+
  'A.VODO_Persona AS PERSONA, B.PERS_NOMBRE||'+#39+' '+#39+'||B.PERS_APEPAT||'+#39+' '+#39+'||B.PERS_APEMAT AS NOMBRE, '+
  'A.VODO_Pagado AS PAGADO, C.POLN_SFDO AS SFDO, C.POLN_RUBRO AS RUBRO, '+
  '(SELECT MAX(B.DODO_URES) FROM AFDODOCXP B WHERE B.DODO_POLID=A.VODO_Polid) AS URES, D.URES_DESCRIP AS URESD  '+
  ' FROM AFVODOCXP A, FPERSONAS B, '+TPPOLNOMI+' C, FURES D'+
  ' WHERE A.VODO_Polid IN (SELECT POLN_POLID FROM '+TPPOLNOMI+' D WHERE D.POLN_NOMINA='+NOMINA.TEXT+')'+
  ' AND A.VODO_Persona=B.PERS_PERSONA   '+
  ' AND C.POLN_POLID=A.VODO_Polid'+
  ' AND C.POLN_SFDO=:VSFDO'+
  ' and b.pers_persona in (select Z.NOMB_EMPL from '+TPNOMBRAM+' z)'+
  ' AND (SELECT MAX(B.DODO_URES) FROM AFDODOCXP B WHERE B.DODO_POLID=A.VODO_Polid)=D.URES_URES'+
  ' ORDER BY A.VODO_POLID';
  savetofilelog(S.sql.text);
  S.parambyname('VSFDO').asstring:=q.fieldbyname('SFDO').asstring;
  S.open;

  TickEmpl.InFile:=ExtractFiledir(Paramstr(0))+'\'+Rep;
  TickEmpl.OutFile:=ExtractFiledir(Paramstr(0))+'\R'+COPY(REP,1,POS('.',REP)-1)+'.rtf';

  TickEmpl.ExecuteOpen([Q,s],SW_SHOW)
//  ShellExecute(xmodulo.handle, 'print', PChar(ExtractFiledir(Paramstr(0))+'\RRepFN.rtf'), nil, nil, SW_HIDE);
end;


procedure TFDetalle.ImprimeRepDJ(Rep:String;TITULO:String);
var
vis:string;
venci:string;
begin

  try devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE',COPY(REP,1,POS('.',REP)-1),'rtf'); except end;

  TickDJ.ClearVars;

  TickDJ.CreateVar('FECHA',formatdatetime('dd/mm/yyyy',date));
  TickDJ.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));
  TickDJ.CreateVar('TITULO',titulo);
  TickDJ.CreateVar('DESCNOM',DESCRIP.TEXT);

  q.close;
  q.sql.text:='SELECT distinct(C.POLN_SFDO) AS SFDO'+
  ' FROM AFVODOCXP A, FPERSONAS B, '+TPPOLNOMI+' C'+
  ' WHERE A.VODO_Polid IN (SELECT POLN_POLID FROM '+TPPOLNOMI+' D WHERE D.POLN_NOMINA='+NOMINA.TEXT+')'+
  ' AND A.VODO_Persona=B.PERS_PERSONA   '+
  ' AND C.POLN_POLID=A.VODO_Polid'+
  ' AND A.VODO_PERSONA LIKE '+#39+'DJ%'+#39+
  ' ORDER BY C.POLN_SFDO';
  savetofilelog(q.sql.text);
  q.open;


  s.CLOSE;
  s.sql.text:='SELECT A.VODO_Polid AS NUMERO, A.VODO_Fecha AS FECHA, A.VODO_Total AS MONTO, '+
  'A.VODO_Persona AS PERSONA, B.PERS_NOMBRE||'+#39+' '+#39+'||B.PERS_APEPAT||'+#39+' '+#39+'||B.PERS_APEMAT AS NOMBRE, '+
  'A.VODO_Pagado AS PAGADO, C.POLN_SFDO AS SFDO, C.POLN_RUBRO AS RUBRO '+
  ' FROM AFVODOCXP A, FPERSONAS B, '+TPPOLNOMI+' C'+
  ' WHERE A.VODO_Polid IN (SELECT POLN_POLID FROM '+TPPOLNOMI+' D WHERE D.POLN_NOMINA='+NOMINA.TEXT+')'+
  ' AND A.VODO_Persona=B.PERS_PERSONA   '+
  ' AND C.POLN_POLID=A.VODO_Polid'+
  ' AND C.POLN_SFDO=:VSFDO'+
  ' AND A.VODO_PERSONA LIKE '+#39+'DJ%'+#39+
  ' ORDER BY A.VODO_POLID';
  savetofilelog(S.sql.text);
  S.parambyname('VSFDO').asstring:=q.fieldbyname('SFDO').asstring;
  s.open;

  TickDJ.InFile:=ExtractFiledir(Paramstr(0))+'\'+Rep;
  TickDJ.OutFile:=ExtractFiledir(Paramstr(0))+'\R'+COPY(REP,1,POS('.',REP)-1)+'.rtf';

  TickDJ.ExecuteOpen([Q,s],SW_SHOW)
//  ShellExecute(xmodulo.handle, 'print', PChar(ExtractFiledir(Paramstr(0))+'\RRepFN.rtf'), nil, nil, SW_HIDE);
end;

procedure TFDetalle.ImprimeRepP(Rep:String;TITULO:String);
var
vis:string;
venci:string;
tick2:TekRTF;
TPNOMBRAM:STRING;
begin
  if str_(laNomina.text,'-')='O' then begin TPNOMBRAM:='PNOMBRAM'; end;
  if str_(laNomina.text,'-')='C' then begin TPNOMBRAM:='PNOMBRAM'; end;
  if str_(laNomina.text,'-')='H' then begin TPNOMBRAM:='PHNOMBRAM'; end;
  if str_(laNomina.text,'-')='N' then begin TPNOMBRAM:='PNOMBRAM'; end;
  if str_(laNomina.text,'-')='V' then begin TPNOMBRAM:='PINOMBRAM'; end;

  try devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE',COPY(REP,1,POS('.',REP)-1),'rtf'); except end;

  TickEmp.ClearVars;

  TickEmp.CreateVar('FECHA',formatdatetime('dd/mm/yyyy',date));
  TickEmp.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));
  TickEmp.CreateVar('TITULO',titulo);
  TickEmp.CreateVar('DESCNOM',DESCRIP.TEXT);


  Q.CLOSE;
  Q.sql.text:='SELECT distinct(C.POLN_SFDO) AS SFDO'+
  ' FROM AFVODOCXP A, FPERSONAS B, '+TPPOLNOMI+' C'+
  ' WHERE A.VODO_Polid IN (SELECT POLN_POLID FROM '+TPPOLNOMI+' D WHERE D.POLN_NOMINA='+NOMINA.TEXT+')'+
  ' AND A.VODO_Persona=B.PERS_PERSONA   '+
  ' AND C.POLN_POLID=A.VODO_Polid'+
  ' AND A.VODO_PERSONA LIKE '+#39+'P%'+#39+
  ' and b.pers_persona not in (select Z.NOMB_EMPL from '+TPNOMBRAM+' z)'+
  ' AND b.pers_persona not in (SELECT CONT_PERSONA FROM PCONTPEXENTA)'+
  ' ORDER BY C.POLN_SFDO';
  savetofilelog(q.sql.text);
  Q.open;


  s.CLOSE;
  s.sql.text:='SELECT A.VODO_Polid AS NUMERO, A.VODO_Fecha AS FECHA, A.VODO_Total AS MONTO, '+
  'A.VODO_Persona AS PERSONA, B.PERS_NOMBRE||'+#39+' '+#39+'||B.PERS_APEPAT||'+#39+' '+#39+'||B.PERS_APEMAT AS NOMBRE, '+
  'A.VODO_Pagado AS PAGADO, C.POLN_SFDO AS SFDO, C.POLN_RUBRO AS RUBRO '+
  ' FROM AFVODOCXP A, FPERSONAS B, '+TPPOLNOMI+' C'+
  ' WHERE A.VODO_Polid IN (SELECT POLN_POLID FROM '+TPPOLNOMI+' D WHERE D.POLN_NOMINA='+NOMINA.TEXT+')'+
  ' AND A.VODO_Persona=B.PERS_PERSONA   '+
  ' AND C.POLN_POLID=A.VODO_Polid'+
  ' AND C.POLN_SFDO=:VSFDO'+
  ' AND A.VODO_PERSONA LIKE '+#39+'P%'+#39+
  ' and b.pers_persona not in (select Z.NOMB_EMPL from '+TPNOMBRAM+' z)'+
  ' AND b.pers_persona not in (SELECT CONT_PERSONA FROM PCONTPEXENTA)'+
  ' ORDER BY A.VODO_POLID';
  S.parambyname('VSFDO').asstring:=q.fieldbyname('SFDO').asstring;
  savetofilelog(s.sql.text);
  s.open;

  TickEmp.InFile:=ExtractFiledir(Paramstr(0))+'\'+Rep;
  TickEmp.OutFile:=ExtractFiledir(Paramstr(0))+'\R'+COPY(REP,1,POS('.',REP)-1)+'.rtf';

  TickEmp.ExecuteOpen([Q,s],SW_SHOW)
//  ShellExecute(xmodulo.handle, 'print', PChar(ExtractFiledir(Paramstr(0))+'\RRepFN.rtf'), nil, nil, SW_HIDE);
end;



procedure TFDetalle.ImprimeRepPFiltro(laP:String;Rep:String;TITULO:String;inicia:string;termina:string);
var
vis:string;
venci:string;
tick2:TekRTF;
lasnom:string;
TPNOMBRAM:STRING;
begin
  if str_(laNomina.text,'-')='O' then begin TPNOMBRAM:='PNOMBRAM'; end;
  if str_(laNomina.text,'-')='C' then begin TPNOMBRAM:='PNOMBRAM'; end;
  if str_(laNomina.text,'-')='H' then begin TPNOMBRAM:='PHNOMBRAM'; end;
  if str_(laNomina.text,'-')='N' then begin TPNOMBRAM:='PNOMBRAM'; end;
  if str_(laNomina.text,'-')='V' then begin TPNOMBRAM:='PINOMBRAM'; end;

  try devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE',COPY(REP,1,POS('.',REP)-1),'rtf'); except end;

  TickEmp.ClearVars;

  TickEmp.CreateVar('FECHA',formatdatetime('dd/mm/yyyy',date));
  TickEmp.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));
  TickEmp.CreateVar('TITULO',titulo);
  TickEmp.CreateVar('DESCNOM','PERIODO DEL '+inicia+'-'+termina);

  Q.close;
  q.sql.text:='select S.NOMI_NOMINA from '+TPNomina+' s where s.nomi_fecha>='+#39+INICIA+#39+
  ' and s.nomi_fecha<='+#39+termina+#39;
  q.Open;
  lasnom:='';
  while not(q.eof) do
     begin
         lasnom:=lasnom+q.fields[0].asstring+',';
         q.next;
     end;
  lasnom:=copy(lasnom,1,length(lasnom)-1);


  Q.CLOSE;
  Q.sql.text:='SELECT distinct(C.POLN_SFDO) AS SFDO'+
  ' FROM AFVODOCXP A, FPERSONAS B, '+TPPOLNOMI+' C'+
  ' WHERE A.VODO_Polid IN (SELECT POLN_POLID FROM '+TPPOLNOMI+' D WHERE D.POLN_NOMINA in ('+lasnom+'))'+
  ' AND A.VODO_Persona=B.PERS_PERSONA   '+
  ' AND C.POLN_POLID=A.VODO_Polid'+
  ' AND A.VODO_PERSONA LIKE '+#39+'P%'+#39+
  ' and b.pers_persona not in (select Z.NOMB_EMPL from '+TPNOMBRAM+' z)'+
  ' AND b.pers_persona not in (SELECT CONT_PERSONA FROM PCONTPEXENTA)'+
  ' AND b.pers_persona='+#39+laP+#39+
  ' ORDER BY C.POLN_SFDO';
  savetofilelog(q.sql.text);
  Q.open;


  s.CLOSE;
  s.sql.text:='SELECT A.VODO_Polid AS NUMERO, A.VODO_Fecha AS FECHA, A.VODO_Total AS MONTO, '+
  'A.VODO_Persona AS PERSONA, B.PERS_NOMBRE||'+#39+' '+#39+'||B.PERS_APEPAT||'+#39+' '+#39+'||B.PERS_APEMAT AS NOMBRE, '+
  'A.VODO_Pagado AS PAGADO, C.POLN_SFDO AS SFDO, C.POLN_RUBRO AS RUBRO '+
  ' FROM AFVODOCXP A, FPERSONAS B, '+TPPOLNOMI+' C'+
  ' WHERE A.VODO_Polid IN (SELECT POLN_POLID FROM '+TPPOLNOMI+' D WHERE D.POLN_NOMINA in ('+lasnom+'))'+
  ' AND A.VODO_Persona=B.PERS_PERSONA   '+
  ' AND C.POLN_POLID=A.VODO_Polid'+
  ' AND C.POLN_SFDO=:VSFDO'+
  ' AND A.VODO_PERSONA LIKE '+#39+'P%'+#39+
  ' and b.pers_persona not in (select Z.NOMB_EMPL from '+TPNOMBRAM+' z)'+
  ' AND b.pers_persona not in (SELECT CONT_PERSONA FROM PCONTPEXENTA)'+
  ' AND b.pers_persona='+#39+laP+#39+
  ' ORDER BY A.VODO_POLID';
  S.parambyname('VSFDO').asstring:=q.fieldbyname('SFDO').asstring;
  savetofilelog(s.sql.text);
  s.open;

  TickEmp.InFile:=ExtractFiledir(Paramstr(0))+'\'+Rep;
  TickEmp.OutFile:=ExtractFiledir(Paramstr(0))+'\R'+COPY(REP,1,POS('.',REP)-1)+'.rtf';

  TickEmp.ExecuteOpen([Q,s],SW_SHOW)
//  ShellExecute(xmodulo.handle, 'print', PChar(ExtractFiledir(Paramstr(0))+'\RRepFN.rtf'), nil, nil, SW_HIDE);
end;


procedure TFDetalle.ImprimeFaltas(Rep:String;Tipo:String);
var
vis:string;
venci:string;
TPVDPAGOS:STRING;
montoF:real;
montoujat:real;
montosin:real;
begin
  if str_(laNomina.text,'-')='O' then begin TPVDPAGOS:='PVDPAGOS'; end;
  if str_(laNomina.text,'-')='C' then begin TPVDPAGOS:='PVDPAGOS'; end;
  if str_(laNomina.text,'-')='H' then begin TPVDPAGOS:='PVHDPAGOS'; end;
  if str_(laNomina.text,'-')='N' then begin TPVDPAGOS:='PVNDPAGOS'; end;
  if str_(laNomina.text,'-')='V' then begin TPVDPAGOS:='PVIDPAGOS'; end;

  try devRTF(q,'PCFILERTF','FILE_FILE','FILE_CLAVE',COPY(REP,1,POS('.',REP)-1),'rtf'); except end;

  TICKFaltas.ClearVars;

  TICKFaltas.CreateVar('FECHA',formatdatetime('dd/mm/yyyy',date));
  TICKFaltas.CreateVar('HORA',formatdatetime('HH:nn am/pm',time));
  TICKFaltas.CreateVar('DESCNOM',DESCRIP.TEXT);
  Q.CLOSE;
  IF tipo='STAIUJAT' THEN
     begin
       TICKFaltas.CreateVar('TITULO','FALTAS STAIUJAT');
       q.sql.text:='SELECT S.VDPA_Pago AS NUMERO, S.VDPA_Fecha AS FECHA, S.VDPA_Monto AS MONTO, '+
       'S.VDPA_Empl AS PERSONA, T.PERS_NOMBRE||'+#39+' '+#39+'||T.PERS_APEPAT||'+#39+' '+#39+'||T.PERS_APEMAT AS NOMBRE, '+
       'S.VDPA_Ures AS URES, U.URES_DESCRIP AS URESD '+
       ' FROM '+TPVDPAGOS+' S, FPERSONAS T, FURES U  WHERE S.VDPA_NOMINA='+NOMINA.TEXT+
       ' AND S.VDPA_Conp IN ('+#39+'053'+#39+','+#39+'073'+#39+','+#39+'052'+#39+')'+
       ' AND S.VDPA_Empl=T.PERS_PERSONA '+
       ' AND S.VDPA_Ures=U.URES_URES    '+
       ' AND S.VDPA_TPSTO IN ('+#39+'A'+#39+','+#39+'G'+#39+')';
       s.close;
       s.sql.text:='SELECT sum(S.VDPA_Monto) as monto '+
       ' FROM '+TPVDPAGOS+' S, FPERSONAS T, FURES U  WHERE S.VDPA_NOMINA='+NOMINA.TEXT+
       ' AND S.VDPA_Conp IN ('+#39+'053'+#39+','+#39+'073'+#39+','+#39+'052'+#39+')'+
       ' AND S.VDPA_Empl=T.PERS_PERSONA '+
       ' AND S.VDPA_Ures=U.URES_URES    '+
       ' AND S.VDPA_TPSTO IN ('+#39+'A'+#39+','+#39+'G'+#39+')' ;
       s.open;
       montof:=s.fields[0].asfloat;
       TICKFaltas.CreateVar('UJAT',FLOATTOSTR(TRUNC(((MONTOF/2)*100))/100));
       TICKFaltas.CreateVar('SINDICATO',FORMATFLOAT('#,#0.00',(MONTOF/2)));


     end;
  IF tipo='SPIUJAT' THEN
     begin
       TICKFaltas.CreateVar('TITULO','FALTAS SPIUJAT');
       q.sql.text:='SELECT S.VDPA_Pago AS NUMERO, S.VDPA_Fecha AS FECHA, S.VDPA_Monto AS MONTO, '+
       'S.VDPA_Empl AS PERSONA, T.PERS_NOMBRE||'+#39+' '+#39+'||T.PERS_APEPAT||'+#39+' '+#39+'||T.PERS_APEMAT AS NOMBRE, '+
       'S.VDPA_Ures AS URES, U.URES_DESCRIP AS URESD '+
       ' FROM '+TPVDPAGOS+' S, FPERSONAS T, FURES U, PATREMPL V  WHERE S.VDPA_NOMINA='+NOMINA.TEXT+
       ' AND S.VDPA_Conp IN ('+#39+'053'+#39+','+#39+'073'+#39+','+#39+'052'+#39+')'+
       ' AND S.VDPA_Empl=T.PERS_PERSONA '+
       ' AND S.VDPA_Ures=U.URES_URES    '+
       ' AND S.VDPA_Empl(+)=V.ATRE_EMPL AND V.ATRE_SPIUJAT='+#39+'S'+#39;

       s.close;
       s.sql.text:='SELECT sum(S.VDPA_Monto) '+
       ' FROM '+TPVDPAGOS+' S, FPERSONAS T, FURES U, PATREMPL V  WHERE S.VDPA_NOMINA='+NOMINA.TEXT+
       ' AND S.VDPA_Conp IN ('+#39+'053'+#39+','+#39+'073'+#39+','+#39+'052'+#39+')'+
       ' AND S.VDPA_Empl=T.PERS_PERSONA '+
       ' AND S.VDPA_Ures=U.URES_URES    '+
       ' AND S.VDPA_Empl(+)=V.ATRE_EMPL AND V.ATRE_SPIUJAT='+#39+'S'+#39;
       s.open;
        montof:=s.fields[0].asfloat;
       TICKFaltas.CreateVar('UJAT',FLOATTOSTR(TRUNC(((MONTOF/2)*100))/100));
       TICKFaltas.CreateVar('SINDICATO',FORMATFLOAT('#,#0.00',(MONTOF/2)));
     end;

     savetofilelog(q.sql.text);
     Q.open;

  TICKFaltas.InFile:=ExtractFiledir(Paramstr(0))+'\'+Rep;
  TICKFaltas.OutFile:=ExtractFiledir(Paramstr(0))+'\R'+COPY(REP,1,POS('.',REP)-1)+'.rtf';

  TICKFaltas.ExecuteOpen([Q],SW_SHOW)
//  ShellExecute(xmodulo.handle, 'print', PChar(ExtractFiledir(Paramstr(0))+'\RRepFN.rtf'), nil, nil, SW_HIDE);
end;


procedure TFDetalle.SpeedButton4Click(Sender: TObject);
begin
  inherited;
if nomina.Text<>'' then
   ImprimeRepEmpl('CONTOPNOM.RTF','RELACI�N DE �RDENES DE PAGO DE LOS ACAD�MICOS QUE COBRAN POR CHEQUE')
else
   Showmessage('Seleccione una n�mina en la pesta�a n�mero 1');
end;

procedure TFDetalle.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if nomina.Text<>'' then
     ImprimeRepDJ('CONTOPNOMDJ.RTF','RELACI�N DE LAS �RDENES DE PAGO DE LOS DESCUENTOS JUDICIALES QUE SE LES EMITE CHEQUE')
else
   Showmessage('Seleccione una n�mina en la pesta�a n�mero 1');

end;

procedure TFDetalle.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if nomina.Text<>'' then
  ImprimeRepP('CONTOPNOMP.RTF','RELACION DE LAS ORDENES DE PAGO DE EMPRESAS Y SINDICATOS')
  else
   Showmessage('Seleccione una n�mina en la pesta�a n�mero 1');

end;

procedure TFDetalle.TickEmplScanRecord(ScanInfo: TEkScanInfo);
begin
  inherited;
  if scanInfo.Number=1 then
     begin
        IF NOT(Q.eof) THEN
           begin
              s.close;
              S.parambyname('VSFDO').asstring:=q.fieldbyname('SFDO').asstring;
              s.open;
           end;
     end;
end;

procedure TFDetalle.TickDJScanRecord(ScanInfo: TEkScanInfo);
begin
  inherited;
  if scanInfo.Number=1 then
     begin
        IF NOT(Q.eof) THEN
           begin
              s.close;
              S.parambyname('VSFDO').asstring:=q.fieldbyname('SFDO').asstring;
              s.open;
           end;
     end;

end;

procedure TFDetalle.TickEmpScanRecord(ScanInfo: TEkScanInfo);
begin
  inherited;
  if scanInfo.Number=1 then
     begin
        IF NOT(Q.eof) THEN
           begin
              s.close;
              S.parambyname('VSFDO').asstring:=q.fieldbyname('SFDO').asstring;
              s.open;
           end;
     end;
end;

procedure TFDetalle.SpeedButton7Click(Sender: TObject);
begin
  inherited;
ImprimeFaltas('CONTFALTAS.RTF','STAIUJAT');
end;

procedure TFDetalle.SpeedButton8Click(Sender: TObject);
begin
  inherited;
ImprimeFaltas('CONTFALTAS.RTF','SPIUJAT');
end;

procedure TFDetalle.NOMINAChange(Sender: TObject);
begin
  inherited;
  QpERDED.close;
  QpERDED.sql.text:='select DECODE(T.CONT_TIPO,'+#39+'P'+#39+','+#39+'PERCEPCI�N'+#39+','+#39+'DEDUCCI�N'+#39+') '+
              ' AS TIPO, SUM(T.CONT_MONTO) AS MONTO from PCONTPERCEP t '+
              ' WHERE T.CONT_NOMINA='+NOMINA.TEXT+
              ' GROUP BY T.CONT_TIPO';
  QpERDED.open;

  dispo.Caption:='Correr Disponibilidad para Nomina: '+nomina.text+' '+descrip.text;
  contab.Caption:='Preview Nomina: '+nomina.text+' '+descrip.text;
  contab.Caption:='Contabilizar Nomina: '+nomina.text+' '+descrip.text;
  CalculaMontosNom;

  S.Close;
  S.sql.text:='SELECT * FROM PCONTCONFIG WHERE CONT_NOMINA='+nomina.text;
  S.open;
  if not(S.eof) then
     begin
        dev.date:=S.fieldbyname('CONT_FECHADEV').asdatetime;
        eje.date:=S.fieldbyname('CONT_FECHAEJE').asdatetime;
     end;


end;



procedure TFDetalle.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if nomina.Text<>'' then
     ImprimeRepPFiltro('P1225','CONTOPNOMP.RTF','RELACI�N DE LAS �RDENES DE PAGO INFONAVIT',datetostr(ini.date),datetostr(ter.date))
  else
     Showmessage('Seleccione una n�mina en la pesta�a n�mero 1');

end;

procedure TFDetalle.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if nomina.Text<>'' then
     ImprimeRepPFiltro('P8947','CONTOPNOMP.RTF','RELACI�N DE LAS �RDENES DE PAGO IMSS',datetostr(ini.date),datetostr(ter.date))
  else
     Showmessage('Seleccione una n�mina en la pesta�a n�mero 1');

end;

procedure TFDetalle.Contab2Click(Sender: TObject);
var
VPNOMINA:string;
begin
  inherited;
  VPNOMINA:='PNOMINAS';
  IF STR_(lanomina.text,'-')='N' Then VPNOMINA:='PNNOMINAS';
  IF STR_(lanomina.text,'-')='H' Then VPNOMINA:='PHNOMINAS';
  IF STR_(lanomina.text,'-')='V' Then VPNOMINA:='PINOMINAS';

   if Application.MessageBox('�Seguro que desea contabilizar la n�mina?�Ha verificado bien las fechas de Devengado y Ejercido?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
         q.close;
         q.sql.text:='SELECT COUNT(*) FROM PCONTCONFIG WHERE CONT_NOMINA='+NOMINA.TEXT;
         Q.open;
         if q.fields[0].asinteger>0 then
            begin
               q.close;
               q.sql.text:='UPDATE pcontconfig SET CONT_FECHADEV='#39+DATETOSTR(DEV.DATE)+#39+','+
               'CONT_FECHAEJE='#39+DATETOSTR(EJE.DATE)+#39+
               ' WHERE CONT_NOMINA='+#39+NOMINA.TEXT+#39;
               Q.execsql;

              //Se contabiliza.

            q.close;
           q.sql.text:='CALL PcontDevAll('+NOMINA.TEXT+','+#39+STR_(LANOMINA.TEXT,'-')+#39+','+#39+'R'+#39+')';
           Q.execsql;

          { q.close;
           q.sql.text:='CALL pcontejeAll('+NOMINA.TEXT+','+#39+STR_(LANOMINA.TEXT,'-')+#39+','+#39+'R'+#39+')';
           Q.execsql;  }


              { q.close;
               q.sql.text:='CALL PcontDevengadoTodas('+NOMINA.TEXT+','+#39+STR_(LANOMINA.TEXT,'-')+#39+')';
               Q.execsql; }

               {//Se marca la nomina como contabilizada
               Q.close;
               Q.SQL.TEXT:='UPDATE '+VPNOMINA+' SET NOMI_CONTAB='+#39+'S'+#39+
                           ' WHERE NOMI_NOMINA='+NOMINA.TEXT;
               Q.execsql; }

              { q.close;
               q.sql.text:='CALL pcontejepagtodas('+NOMINA.TEXT+','+#39+STR_(LANOMINA.TEXT,'-')+#39+')';
               Q.execsql;    }
               Showmessage('Se ha contabilizado la n�mina y creado las ordenes de Pago');

               {//Se marca la nomina como Ejercida pagada
               Q.close;
               Q.SQL.TEXT:='UPDATE '+VPNOMINA+' SET NOMI_EJEPAG='+#39+'S'+#39+
                           ' WHERE NOMI_NOMINA='+NOMINA.TEXT;
               Q.execsql;
               }
            end
         else
            Showmessage('La nomina '+nomina.text+' no se ha corrido el preview');

      end;

end;

end.
