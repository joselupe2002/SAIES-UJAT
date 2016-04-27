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
    DSDisp: TDataSource;
    QDisp: TQuery;
    TabSheet4: TTabSheet;
    Gpol: TDBGrid;
    Label9: TLabel;
    DataSource2: TDataSource;
    Label10: TLabel;
    GDetPol: TDBGrid;
    DsDetPol: TDataSource;
    QDetPol: TQuery;
    NRPol: TLabel;
    nrDetPol: TLabel;
    SpeedButton3: TSpeedButton;
    TickEmpl: TEkRTF;
    contab: TSpeedButton;
    Contab2: TSpeedButton;
    DsPol: TDataSource;
    QPol: TQuery;
    Label6: TLabel;
    op: TRadioGroup;
    PNOM: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    nomfec: TComboBox;
    anio: TEdit;
    laNomina: TComboBox;
    NOMINA: TEdit;
    DESCRIP: TEdit;
    TIP: TComboBox;
    TOT: TLabel;
    PFN: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    MESFN: TComboBox;
    anioFN: TEdit;
    Label11: TLabel;
    PagosFN: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cancelar1Click(Sender: TObject);
    function RNombre : String ; override;
    procedure laNominaChange(Sender: TObject);
    procedure buscaLanomina;
    procedure nomfecChange(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure contabClick(Sender: TObject);
    procedure TabSheet4Enter(Sender: TObject);
    procedure GpolDblClick(Sender: TObject);
    procedure GpolCellClick(Column: TColumn);
    procedure GDetPolDblClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ImprimeRepEmpl(Rep:String;TITULO:String);
    procedure TickEmplScanRecord(ScanInfo: TEkScanInfo);
    procedure TickDJScanRecord(ScanInfo: TEkScanInfo);
    procedure TickEmpScanRecord(ScanInfo: TEkScanInfo);
    procedure NOMINAChange(Sender: TObject);
    procedure Contab2Click(Sender: TObject);
    procedure ExportarXLSBi(Q:TQuery);
    procedure opClick(Sender: TObject);
    procedure MESFNChange(Sender: TObject);
    procedure buscafN;
    procedure anioFNChange(Sender: TObject);
    procedure PagosFNChange(Sender: TObject);
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
  TPVDPAGOS:string;

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



procedure TFDetalle.ExportarXLSBi(Q:TQuery);
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

ExcelApplication1.Workbooks.Open(extractfiledir(paramstr(0))+'\File.xls',
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,
  emptyParam,emptyParam,emptyParam,emptyParam,id);


  ExcelWorkbook1.ConnectTo(ExcelApplication1.ActiveWorkbook);
  ExcelWorkbook1.Sheets.Add(NULL,NULL,2,xlWorksheet,0);

  ExcelWorksheet1.ConnectTo(ExcelApplication1.ActiveSheet as _Worksheet);
  excelworksheet1.ConnectTo(excelworkbook1.Sheets.Item[1] as _Worksheet);
  excelworksheet1.Activate;


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
     end;

ExcelApplication1.Visible[id]:=true;

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
  aniofn.Text:=formatdatetime('YYYY',now);
 NOMFEC.TEXT:=formatdatetime('01/MM',now);
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
  if str_(laNomina.text,'-')='O' then begin TPNomina:='PNOMINAS'; TPPOLNOMI:='PPOLNOMI'; TPVDPAGOS:='PVDPAGOS'; end;
  if str_(laNomina.text,'-')='C' then begin TPNomina:='PNOMINAS'; TPPOLNOMI:='PPOLNOMI'; TPVDPAGOS:='PVDPAGOS'; end;
  if str_(laNomina.text,'-')='H' then begin TPNomina:='PHNOMINAS'; TPPOLNOMI:='PHPOLNOMI'; TPVDPAGOS:='PVHDPAGOS'; end;
  if str_(laNomina.text,'-')='N' then begin TPNomina:='PNNOMINAS'; TPPOLNOMI:='PNPOLNOMI'; TPVDPAGOS:='PVNDPAGOS'; end;
  if str_(laNomina.text,'-')='V' then begin TPNomina:='PINOMINAS'; TPPOLNOMI:='PIPOLNOMI'; TPVDPAGOS:='PVIDPAGOS'; end;

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


procedure TFDetalle.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
ExportarXLS(QDisp);
end;

procedure TFDetalle.contabClick(Sender: TObject);
var
VPNOMINA:string;
vLaNomina:string;
elNumNom:string;
begin
  inherited;
  VPNOMINA:='PNOMINAS';

  if op.itemindex=0 then begin vLaNomina:=laNomina.text; elNumNom:=NOMINA.TEXT; end
  else begin VlaNomina:='F-FUERA DE NOMINA'; elNumNom:=str_(pagosFN.TEXT,'-'); end;

  IF STR_(VlaNomina,'-')='N' Then VPNOMINA:='PNNOMINAS';
  IF STR_(VlaNomina,'-')='H' Then VPNOMINA:='PHNOMINAS';
  IF STR_(VlaNomina,'-')='V' Then VPNOMINA:='PINOMINAS';

   if Application.MessageBox('¿Seguro que desea calcular el Preview de la Devolución de Subsidio?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin
           q.close;
           q.sql.text:='CALL PcontDevSub('+elNumNom+','+#39+STR_(VlaNomina,'-')+#39+','+#39+'P'+#39+')';
           savetofileLog(q.sql.text);
           Q.execsql;

           q.close;
           q.sql.text:='SELECT Y.POLI_POLID AS POLID, Y.POLI_TEXTO, X.DETM_PROY AS PROY, X.DETM_URES AS URES, '+
                       'X.DETM_PROG AS PROG, X.DETM_SFDO AS SFDO, X.DETM_TMOV AS TMOV, X.DETM_CNTA AS CNTA, '+
                       'X.DETM_SCTA AS SCTA, X.DETM_MONTO AS MONTO '+
                       'FROM PCONTFDETMOVI X, PCONTFPOLIZAS Y  WHERE X.DETM_POLID  in (  '+
                       'select a.poln_polid from PcontPOLNOMI a where a.poln_nomina='+elNumNom+') '+
                       'AND X.DETM_POLID=Y.POLI_POLID ';
           savetofileLog(q.sql.text);
           q.Open;


           ExportarXLSBi(Q);

      end;

end;

procedure TFDetalle.TabSheet4Enter(Sender: TObject);
var
lanomina:string;
begin
  inherited;
  if op.itemindex=0 then laNomina:=nomina.text else laNomina:=str_(pagosfn.text,'-');
  Qpol.Close;
  Qpol.SQl.text:='select N.POLI_POLID AS NUMERO, N.POLI_DESCRIP AS DESCRIP, N.POLI_ANIO AS EJERCICIO, N.POLI_MES AS MES, '+
  'SUBSTR(N.POLI_TEXTO,1,100) AS TEXTO from fpolizas n where N.POLI_POLID in ('+
  'select a.poln_polid from '+TPPolNomi+' a where a.poln_nomina='+laNomina+')'+
  ' AND N.POLI_DESCRIP LIKE '+#39+'%:DEV_SUB:%'+#39+
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

procedure TFDetalle.NOMINAChange(Sender: TObject);
begin
  inherited;
  QpERDED.close;
  QpERDED.sql.text:='select SUM(S.VDPA_Monto) from '+TPVDPAGOS+' s where s.VDPA_Conp='+#39+'010'+#39+
                    ' and s.VDPA_PerDed='+#39+'P'+#39+' AND S.VDPA_Nomina='+NOMINA.TEXT+
                    ' AND S.VDPA_Pago NOT IN (SELECT C.CANC_PAGO FROM PCANCELPAGO C)';
  savetofilelog(qperded.sql.text);
  QpERDED.open;

  contab.Caption:='Preview de la Dev. Sub.: '+nomina.text;
  contab.Caption:='Contabilizar la Dev. Sub.: '+nomina.text;
  tot.caption:='Monto Subsidio: '+formatfloat('#,#0.0',Qperded.fields[0].asfloat);


end;



procedure TFDetalle.Contab2Click(Sender: TObject);
var
VPNOMINA:string;
vLaNomina:STRING;
elNumNom:string;
begin
  inherited;
  VPNOMINA:='PNOMINAS';

  if op.itemindex=0 then begin vLaNomina:=laNomina.text; elNumNom:=NOMINA.TEXT; end
  else begin VlaNomina:='F-FUERA DE NOMINA'; elNumNom:=str_(pagosFN.TEXT,'-'); end;

  IF STR_(vLaNomina,'-')='N' Then VPNOMINA:='PNNOMINAS';
  IF STR_(vLaNomina,'-')='H' Then VPNOMINA:='PHNOMINAS';
  IF STR_(vLaNomina,'-')='V' Then VPNOMINA:='PINOMINAS';

   if Application.MessageBox('¿Seguro que desea contabilizar la devolución de Subsidio?¿Ha verificado bien las fechas de Devengado y Ejercido?','Confirmar',MB_ICONQUESTION+ MB_YESNO)= IDYES THEN
      begin

           q.close;
           q.sql.text:='SELECT COUNT(*) FROM pcontroldevsub WHERE NOMINA='+#39+elNumNom+#39;
           Q.open;

           if q.fields[0].asinteger<=0 then
              begin
                 q.close;
                 q.sql.text:='CALL PcontDevSub('+elNumNom+','+#39+STR_(vLaNomina,'-')+#39+','+#39+'R'+#39+')';
                 Q.execsql;

                 Showmessage('Se ha contabilizado la devolución de Sueldos');
                 TabSheet4Enter(nil);
              end
           else
             showmessage('Al parecer esta nómina ya se corrió el proceso de devolución del subsidio');

      end;

end;

procedure TFDetalle.opClick(Sender: TObject);
begin
  inherited;
  IF op.ItemIndex =0 then
     begin
       pnom.Visible:=true;
       pfn.Visible:=false;
     end
  else
     begin
       pnom.Visible:=false;
       pfn.Visible:=true;
       pfn.Top:=88;
     end;
end;

procedure TFDetalle.buscafN;
BEGIN
  q.close;
  q.sql.text:='SELECT DISTINCT(A.MOVF_SEQ||'+#39+'-'+#39+'||A.MOVF_DESCRIP) FROM '+
  ' PMOVFUENOM A, PVMOVFNPDPAGOSR B WHERE A.MOVF_SEQ=B.dpag_movi '+
  ' AND B.dpag_conp='+#39+'010'+#39+
  ' AND TO_CHAR(A.MOVF_FECHAMOV,'+#39+'MM'+#39+')='+#39+STR_(MESFN.TEXT,'-')+#39+
  ' AND TO_CHAR(A.MOVF_FECHAMOV,'+#39+'YYYY'+#39+')='+#39+ANIOFN.TEXT+#39;
  savetofilelog(q.sql.text);
  Q.open;
  pagosfn.clear;
  while not(q.eof) do
    begin
       pagosfn.Items.Add(q.fields[0].asstring);
       q.next;
    end;
END;

procedure TFDetalle.MESFNChange(Sender: TObject);
begin
  inherited;
  buscaFn;
end;

procedure TFDetalle.anioFNChange(Sender: TObject);
begin
  inherited;
buscafN;
end;

procedure TFDetalle.PagosFNChange(Sender: TObject);
begin
  inherited;
  QpERDED.close;
  QpERDED.sql.text:='select SUM(t.dpag_Monto) from PMOVFUENOM s, PVMOVFNPDPAGOSR T where t.dpag_Conp='+#39+'010'+#39+
                    ' and t.dpag_PerDed='+#39+'P'+#39+' AND t.dpag_MOVi='+str_(pagosfn.text,'-')+
                    ' AND S.MOVF_SEQ=t.dpag_MOVI ';
  savetofilelog(qperded.sql.text);
  QpERDED.open;

  contab.Caption:='Preview de la Dev. Sub.: '+str_(pagosfn.text,'-');
  contab.Caption:='Contabilizar la Dev. Sub.: '+str_(pagosfn.text,'-');
  tot.caption:='Monto Subsidio: '+formatfloat('#,#0.0',Qperded.fields[0].asfloat);
end;

end.
